from rest_framework import serializers

from .models import (
    CV,
    EducationLevel,
    Skill,
    Language,
    UserCompany,
    UserEducation,
    School,
    Major,
    UserAward,
)


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


class UserCompanySerializer(serializers.ModelSerializer):
    company = serializers.StringRelatedField()

    class Meta:
        model = UserCompany
        fields = ["user_company_id", "company", "start_date", "end_date"]


class UserEducationSerializer(serializers.ModelSerializer):
    school = serializers.StringRelatedField()
    education_level = serializers.StringRelatedField()

    class Meta:
        model = UserEducation
        fields = [
            "user_education_id",
            "education_level",
            "school",
            "start_date",
            "end_date",
        ]


class SchoolSerializer(serializers.ModelSerializer):
    class Meta:
        model = School
        fields = ["school_id", "school_name"]


class MajorSerializer(serializers.ModelSerializer):
    class Meta:
        model = Major
        fields = ["major_id", "major_name"]


class UserAwardSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserAward
        fields = ["user_award_id", "award_name", "date", "description"]


from account.models import User


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ["first_name", "last_name", "username", "email"]


class CVDataSerializer(serializers.ModelSerializer):
    user_company = UserCompanySerializer()
    user_education = UserEducationSerializer(many=True)
    # user_education_level = EducationLevelSerializer()
    user_skill = SkillSerializer(many=True)
    user_major = MajorSerializer(many=True)
    user_language = LanguageSerializer(many=True)
    user_award = UserAwardSerializer(many=True)
    user = UserSerializer()

    class Meta:
        model = CV
        fields = [
            "cv_id",
            "user",
            "description",
            "job_title",
            "user_company",
            "user_education",
            # "user_education_level",
            "user_skill",
            "user_major",
            "user_language",
            "user_award",
            "created_at",
            "updated_at",
        ]


class CVSerializerPrint(serializers.ModelSerializer):
    user_company = UserCompanySerializer()
    user_education = UserEducationSerializer(many=True)
    user_skill = SkillSerializer(many=True)
    user_major = MajorSerializer(many=True)
    user_language = LanguageSerializer(many=True)
    user_award = UserAwardSerializer(many=True)
    user = UserSerializer()

    class Meta:
        model = CV
        fields = [
            "cv_id",
            "user",
            "description",
            "job_title",
            "user_company",
            "user_education",
            "user_skill",
            "user_major",
            "user_language",
            "user_award",
            "created_at",
            "updated_at",
        ]
