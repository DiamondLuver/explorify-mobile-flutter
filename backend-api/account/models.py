# Model
"""
    Otp | Profile | Role | User
"""

from django.db import models
from django.utils.translation import gettext as _
from django.db.models.signals import post_save
from django.contrib.auth.models import AbstractUser, PermissionsMixin
from PIL import Image
from django.utils import timezone
import datetime


class Otp(models.Model):
    otp_id = models.BigAutoField(primary_key=True)
    code = models.CharField(max_length=6, default="")
    is_verify = models.BooleanField(blank=True, null=True)
    expiry_time = models.DateTimeField(blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    user = models.OneToOneField("User", models.CASCADE, blank=True, null=True)

    class Meta:
        verbose_name = "OTP"
        verbose_name_plural = "OTPs"
        db_table = "otp"

    def save(self, *args, **kwargs):
        if not self.code:
            self.code = self.generate_code()
        if not self.expiry_time:
            self.expiry_time = timezone.now() + datetime.timedelta(minutes=10)
        super(Otp, self).save(*args, **kwargs)

    @staticmethod
    def generate_code():
        import random

        return "".join(random.choices("0123456789", k=6))


class Profile(models.Model):
    profile_id = models.BigAutoField(primary_key=True)
    user = models.OneToOneField("User", on_delete=models.CASCADE)
    description = models.TextField(default="This user is lazy.")
    profile_pic = models.ImageField(
        default="images/profile_pics/Default.png", upload_to="images/profile_pics"
    )
    website = models.CharField(max_length=255, blank=True, null=True)
    city = models.CharField(max_length=255, blank=True, null=True)
    country = models.CharField(max_length=255, blank=True, null=True)
    date_of_birth = models.DateField(null=True, blank=True)
    GENDER_CHOICES = [
        ("M", "Male"),
        ("F", "Female"),
        ("O", "Others"),
    ]
    gender = models.CharField(
        max_length=50, choices=GENDER_CHOICES, blank=True, default="M"
    )
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        verbose_name = "Profile"
        verbose_name_plural = "Profiles"
        db_table = "profile"

    def __str__(self):
        return self.user.username

    def save(self, *args, **kwargs):
        super().save()
        img = Image.open(self.profile_pic.path)
        if img.height > 500 or img.width > 500:
            new_img = (500, 500)
            img.thumbnail(new_img)
            img.save(self.profile_pic.path)


def create_profile(sender, instance, created, **kwargs):
    if created:
        ser_profile, _ = Profile.objects.get_or_create(user=instance)
        ser_profile.save()


post_save.connect(create_profile, sender="account.User")


class Role(models.Model):
    role_id = models.BigAutoField(primary_key=True)
    role = models.CharField(max_length=255, blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        verbose_name = "Role"
        verbose_name_plural = "Roles"
        db_table = "role"

    def __str__(self):
        return f"{self.role}"


class User(AbstractUser, PermissionsMixin):
    user_id = models.BigAutoField(primary_key=True)
    username = models.CharField(max_length=128, unique=True, verbose_name=_("Username"))
    first_name = models.CharField(
        max_length=255, blank=True, null=True, verbose_name=_("First Name")
    )
    last_name = models.CharField(
        max_length=255, blank=True, null=True, verbose_name=_("Last Name")
    )
    email = models.EmailField(
        max_length=100, unique=True, verbose_name=_("Email Address")
    )
    phone = models.CharField(
        max_length=20, unique=True, null=True, verbose_name=_("Phone Number")
    )
    headline = models.CharField(
        max_length=255, blank=True, null=True, verbose_name=_("Headline")
    )
    role = models.ForeignKey(
        "Role", on_delete=models.PROTECT, default=3, null=False
    )  # default is user
    created_at = models.DateTimeField(auto_now_add=True, verbose_name=_("Created At"))
    updated_at = models.DateTimeField(auto_now=True, verbose_name=_("Updated At"))

    class Meta:
        swappable = "AUTH_USER_MODEL"
        db_table = "user"
        verbose_name = _("User")
        verbose_name_plural = _("Users")

    def __str__(self):
        return f"{self.first_name} {self.last_name} ({self.username})"


class ContactInformation(models.Model):
    contact_information_id = models.BigAutoField(primary_key=True)
    user = models.OneToOneField(
        "User",
        null=True,
        blank=True,
        on_delete=models.CASCADE,
        related_name="contact_information",
    )
    email = models.EmailField(max_length=50, blank=True, null=True)
    phone = models.CharField(max_length=20, blank=True, null=True)
    website = models.CharField(max_length=255, blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        verbose_name = "Contact Information"
        verbose_name_plural = "Contact Informations"
        db_table = "contact_information"
