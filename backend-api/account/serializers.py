from rest_framework import serializers
from .models import User, ContactInformation
from django.contrib.auth import authenticate

class OtpLoginSerializer(serializers.Serializer):
    username_or_email = serializers.CharField(required=True)
    code = serializers.CharField(required=True)

class LoginSerializer(serializers.Serializer):
    username_or_email = serializers.CharField(required=True)
    password = serializers.CharField(max_length=128, write_only=True)

    def validate(self, data):
        username_or_email = data.get('username_or_email')
        password = data.get('password')

        if '@' in username_or_email:
            try:
                user = User.objects.get(email=username_or_email)
                username = user.username
            except User.DoesNotExist:
                raise serializers.ValidationError("Invalid email or password")
        else:
            username = username_or_email

        user = authenticate(username=username, password=password)

        if user is None:
            raise serializers.ValidationError("Invalid username/email or password")

        if not user.is_active:
            raise serializers.ValidationError("User is inactive")

        data['user'] = user
        return data
    
class RegistrationSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ("email", "username", "password")
        extra_kwargs = {"password": {"write_only": True}}

    def create(self, validated_data):
        password = validated_data.pop("password", None)
        instance = self.Meta.model(**validated_data)
        if password is not None:
            instance.set_password(password)
        instance.save()
        return instance


class UsersSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ("email", "username")

class UsersContactSerializer(serializers.ModelSerializer):
    class Meta:
        model = ContactInformation
        fields = ("email","phone","website")
