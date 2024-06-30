# Model
"""
    CompanyProfile | Document | InternshipApplication | InternshipPost | JobPoster
"""
from django.db import models
from django.utils.translation import gettext as _
from account.models import User
from PIL import Image


class CompanyProfile(models.Model):
    company_id = models.BigAutoField(primary_key=True)
    company_name = models.CharField(max_length=255, blank=True, null=True)
    user = models.OneToOneField(
        User, on_delete=models.CASCADE, related_name="company_profile"
    )
    description = models.TextField(blank=True, null=True)
    location = models.CharField(max_length=255, blank=True, null=True)
    head_office = models.CharField(max_length=255, blank=True, null=True)
    employee_size = models.IntegerField(blank=True, null=True)
    company_type = models.CharField(max_length=255, blank=True, null=True)
    specialization = models.CharField(max_length=255, blank=True, null=True)
    company_website = models.URLField(max_length=200, blank=True, null=True)
    company_pic = models.ImageField(
        default="images/profile_pics/Default.png", upload_to="images/company_pics"
    )
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        verbose_name = "Company Profile"
        verbose_name_plural = "Company Profiles"
        db_table = "company_profile"

    def save(self, *args, **kwargs):
        super().save()
        img = Image.open(self.company_pic.path)
        if img.height > 500 or img.width > 500:
            new_img = (500, 500)
            img.thumbnail(new_img)
            img.save(self.company_pic.path)

    def __str__(self):
        return f"{self.company_name} {self.user}"


class Document(models.Model):
    document_types = (
        (1, "CV"),
        (2, "Cover Letter"),
        (3, "Others"),
    )
    document_id = models.BigAutoField(primary_key=True)
    internship_application = models.ForeignKey(
        "InternshipApplication", models.DO_NOTHING, blank=True, null=True
    )
    document_type = models.SmallIntegerField(choices=document_types, default=1)
    file = models.CharField(max_length=100, blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        verbose_name = "Document"
        verbose_name_plural = "Documents"
        db_table = "document"


class InternshipApplication(models.Model):
    internship_application_id = models.BigAutoField(primary_key=True)
    internship_post = models.ForeignKey(
        "InternshipPost", models.DO_NOTHING, blank=True, null=True
    )
    user = models.ForeignKey(User, models.DO_NOTHING, blank=True, null=True)
    # cover_letter = models.CharField(max_length=100)
    # cv = models.CharField(max_length=100)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        verbose_name = "Internship Application"
        verbose_name_plural = "Internship Applications"
        db_table = "internship_application"


class InternshipPost(models.Model):
    internship_post_id = models.BigAutoField(primary_key=True)
    job_title = models.CharField(max_length=255, blank=True, null=True)
    job_poster = models.ForeignKey(
        "JobPoster", models.DO_NOTHING, blank=True, null=True
    )
    category = models.CharField(max_length=255, blank=True, null=True)
    company_name = models.CharField(max_length=255, blank=True, null=True)
    company = models.ForeignKey(
        CompanyProfile, models.DO_NOTHING, blank=True, null=True
    )
    location = models.CharField(max_length=255, blank=True, null=True)
    job_description = models.TextField(blank=True)
    job_requirement = models.TextField(blank=True)
    job_type = models.CharField(max_length=100, blank=True)
    job_duration = models.CharField(max_length=100, blank=True)
    qualification = models.CharField(max_length=100, blank=True)
    salary = models.CharField(max_length=100, blank=True)
    status = models.CharField(max_length=50, blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        verbose_name = "Internship Post"
        verbose_name_plural = "Internship Posts"
        db_table = "internship_post"


class JobPoster(models.Model):
    job_poster_id = models.BigAutoField(primary_key=True)
    company = models.ForeignKey(
        CompanyProfile, models.DO_NOTHING, blank=True, null=True
    )
    # username = models.CharField(max_length=255, blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        verbose_name = "Job Poster"
        verbose_name_plural = "Job Posters"
        db_table = "job_poster"
