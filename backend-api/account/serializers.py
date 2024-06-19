from rest_framework import serializers
from .models import User, ContactInformation
from internship.models import CompanyProfile
from django.contrib.auth import authenticate

class OtpLoginSerializer(serializers.Serializer):
    username_or_email = serializers.CharField(required=True)
    code = serializers.CharField(required=True)


class LoginSerializer(serializers.Serializer):
    username_or_email = serializers.CharField(required=True)
    password = serializers.CharField(max_length=128, write_only=True)

    def validate(self, data):
        username_or_email = data.get("username_or_email")
        password = data.get("password")

        if "@" in username_or_email:
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

        data["user"] = user
        return data


class RegistrationSerializer(serializers.ModelSerializer):
    # social_registration = serializers.BooleanField(required=True, write_only=True)
    class Meta:
        model = User
        fields = ("email", "username", "password", "social_registration")
        extra_kwargs = {"password": {"write_only": True}}

    def create(self, validated_data):
        # social_registration = validated_data.pop('social_registration', False)
        password = validated_data.pop("password", None)
        instance = self.Meta.model(**validated_data)
        if password is not None:
            instance.set_password(password)
        # if social_registration:
        #     # Handle social registration logic if needed
        #     pass
        # else:
        #     pass
        instance.is_active = True
            
        instance.save()
        
        return instance


class ImageUploadSerializer(serializers.Serializer):
    image_file = serializers.ImageField()

    def validate_image_file(self, value):
        # Validate file extension
        ext = value.name.split('.')[-1].lower()
        if ext not in ['jpg', 'jpeg', 'png', 'gif']:
            raise serializers.ValidationError('Unsupported file extension.')

        # Validate file size
        limit_mb = 2  # 2MB
        if value.size > limit_mb * 1024 * 1024:
            raise serializers.ValidationError('File size exceeds 2 MB limit.')

        return value

class CompanyProfileRegistrationSerializer(serializers.ModelSerializer):
    username = serializers.CharField(max_length=128)
    email = serializers.EmailField()
    password = serializers.CharField(write_only=True)
    company_pic = serializers.ImageField()
    
    class Meta:
        model = CompanyProfile
        fields = [
            "username",
            "email",
            "password",
            "company_name",
            "description",
            "location",
            "head_office",
            "employee_size",
            "company_type",
            "specialization",
            "company_website",
            "company_pic",
        ]
    def create(self, validated_data):
        user_data = {
            "username": validated_data.pop("username"),
            "email": validated_data.pop("email"),
            "password": validated_data.pop("password"),
        }
        # try:
        user = User.objects.create_user(**user_data, is_active=False)

        # Create CompanyProfile
        if validated_data.pop('company_pic'):
            company_profile = CompanyProfile.objects.create(
                user=user,
                company_pic=validated_data.pop('company_pic', None),
                **validated_data
            )
        else:
            company_profile = CompanyProfile.objects.create(
                user=user,
                **validated_data
            )
        # except Exception as e:
        #     pass

        return company_profile


class UsersSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ("email", "username")


class UsersContactSerializer(serializers.ModelSerializer):
    class Meta:
        model = ContactInformation
        fields = ("email", "phone", "website")
        

