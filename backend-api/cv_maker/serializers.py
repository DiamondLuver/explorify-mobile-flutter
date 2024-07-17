from rest_framework import serializers
from .models import (
    EducationLevel,
    Skill,
    Language,
    UserCompany,
    UserEducation,
    School,
    Major,
    UserAward,
    CV,
)
from account.serializers import UsersSerializer, UsersContactSerializer
from account.models import ContactInformation


class EducationLevelSerializer(serializers.ModelSerializer):
    class Meta:
        model = EducationLevel
        fields = ["education_level_id", "education_name"]


class SkillSerializer(serializers.ModelSerializer):
    class Meta:
        model = Skill
        fields = ["skill_id", "skill_name"]


class LanguageSerializer(serializers.ModelSerializer):
    class Meta:
        model = Language
        fields = ["language_id", "language_name"]


class SchoolSerializer(serializers.ModelSerializer):
    class Meta:
        model = School
        fields = ["school_id", "school_name"]


class MajorSerializer(serializers.ModelSerializer):
    class Meta:
        model = Major
        fields = ["major_id", "major_name"]


class UserCompanySerializer(serializers.ModelSerializer):
    class Meta:
        model = UserCompany
        fields = ["user_company_id", "company_name", "start_date", "end_date"]


class UserEducationSerializer(serializers.ModelSerializer):
    # education_level = EducationLevelSerializer()
    # school = SchoolSerializer()
    # major = MajorSerializer()
    class Meta:
        model = UserEducation
        fields = [
            "user_education_id",
            "education_level",
            "school",
            "major",
            "start_date",
            "end_date",
        ]


class UserEducationDetailSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserEducation
        fields = [
            "user_education_id",
            "education_level",
            "school",
            "major",
            "start_date",
            "end_date",
        ]


class UserAwardSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserAward
        fields = ["user_award_id", "award_name", "date", "description"]


class CVDataSerializer(serializers.Serializer):
    cv_id = serializers.IntegerField()
    user = UsersSerializer()
    user_contact_information = serializers.SerializerMethodField()
    description = serializers.CharField(max_length=255)
    job_title = serializers.CharField(max_length=255)
    user_companies = UserCompanySerializer(many=True)
    user_education = UserEducationSerializer(many=True)
    user_skill = SkillSerializer(many=True)
    user_major = MajorSerializer(many=True)
    user_language = LanguageSerializer(many=True)
    user_award = UserAwardSerializer(many=True)
    references = serializers.CharField()
    created_at = serializers.DateTimeField()
    updated_at = serializers.DateTimeField()

    def get_user_contact_information(self, obj):
        try:
            contact = ContactInformation.objects.get(user=obj.user)
            return UsersContactSerializer(contact).data
        except ContactInformation.DoesNotExist:
            return None


class ImageUploadSerializer(serializers.Serializer):
    image_file = serializers.ImageField()

    def validate_image_file(self, value):
        # Validate file extension
        ext = value.name.split(".")[-1].lower()
        if ext not in ["jpg", "jpeg", "png", "gif"]:
            raise serializers.ValidationError("Unsupported file extension.")

        # Validate file size
        limit_mb = 2  # 2MB
        if value.size > limit_mb * 1024 * 1024:
            raise serializers.ValidationError("File size exceeds 2 MB limit.")

        return value
