from django.db import models
from account.models import User
from django.core.exceptions import ValidationError
from internship.models import Document, CompanyProfile


class CV(models.Model):
    cv_id = models.AutoField(primary_key=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    description = models.CharField(max_length=255, null=True)
    job_title = models.CharField(max_length=255, null=True)
    user_company = models.ForeignKey("UserCompany", null=True, on_delete=models.CASCADE)
    user_education = models.ManyToManyField("UserEducation", blank=True)
    user_skill = models.ManyToManyField("Skill", blank=True)
    user_major = models.ManyToManyField("Major", blank=True)
    user_language = models.ManyToManyField("Language", blank=True)
    user_award = models.ManyToManyField("UserAward", blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"CV {self.cv_id} for User {self.user_id}"

    class Meta:
        verbose_name = "CV"
        verbose_name_plural = "CVs"
        db_table = "cv"


class EducationLevel(models.Model):
    education_level_id = models.AutoField(primary_key=True)
    education_name = models.CharField(max_length=255)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.education_name

    class Meta:
        verbose_name = "EducationLevel"
        verbose_name_plural = "EducationLevels"
        db_table = "education_level"


class Skill(models.Model):
    skill_id = models.AutoField(primary_key=True)
    skill_name = models.CharField(max_length=255)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.skill_name

    class Meta:
        verbose_name = "Skill"
        verbose_name_plural = "Skills"
        db_table = "skill"


class Language(models.Model):
    language_id = models.AutoField(primary_key=True)
    language_name = models.CharField(max_length=255)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.language_name

    class Meta:
        verbose_name = "Language"
        verbose_name_plural = "Languages"
        db_table = "language"


class UserCompany(models.Model):
    user_company_id = models.AutoField(primary_key=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    company_name = models.CharField(max_length=128, blank=True)
    start_date = models.DateField()
    end_date = models.DateField()
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def clean(self):
        if self.end_date < self.start_date:
            raise ValidationError("End date cannot be before start date.")

    def __str__(self):
        return f"Company {self.company_id} for User {self.user_id}"

    class Meta:
        verbose_name = "User Company"
        verbose_name_plural = "User Companies"
        db_table = "user_company"


class School(models.Model):
    school_id = models.AutoField(primary_key=True)
    school_name = models.CharField(max_length=255)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.school_name

    class Meta:
        verbose_name = "School"
        verbose_name_plural = "Schools"
        db_table = "school"


class UserEducation(models.Model):
    user_education_id = models.AutoField(primary_key=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE, null=True)
    school = models.ForeignKey("School", on_delete=models.PROTECT, null=True)
    education_level = models.ForeignKey(
        "EducationLevel", on_delete=models.PROTECT, null=True
    )
    major = models.ForeignKey("Major", on_delete=models.PROTECT, null=True)
    start_date = models.DateField()
    end_date = models.DateField()
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def clean(self):
        if self.end_date < self.start_date:
            raise ValidationError("End date cannot be before start date.")

    def __str__(self):
        return f"Education for User {self.user_id}"

    class Meta:
        verbose_name = "User Education"
        verbose_name_plural = "User Educations"
        db_table = "user_education"


class Major(models.Model):
    major_id = models.AutoField(primary_key=True)
    major_name = models.CharField(max_length=255)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.major_name

    class Meta:
        verbose_name = "Major"
        verbose_name_plural = "Majors"
        db_table = "major"


class UserAward(models.Model):
    user_award_id = models.AutoField(primary_key=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    award_name = models.CharField(max_length=255)
    certificate_file = models.FileField(upload_to="certificates/", blank=True)
    award_category = models.CharField(max_length=255, null=True, blank=True)
    date = models.DateField(null=True, blank=True)
    description = models.CharField(max_length=255, blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"Award {self.award_name} for User {self.user_id}"

    class Meta:
        verbose_name = "User Award"
        verbose_name_plural = "User Awards"
        db_table = "user_award"
