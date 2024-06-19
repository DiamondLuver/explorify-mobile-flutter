# myapp/signals.py
from django.db.models.signals import post_save
from django.dispatch import receiver
from .models import User
from internship.models import CompanyProfile


@receiver(post_save, sender=User)
def create_or_update_user_profile(sender, instance, created, **kwargs):
    if created and instance.role.role_id == 2:
        CompanyProfile.objects.create(
            user=instance
        )


@receiver(post_save, sender=User)
def delete_user_profile(sender, instance, **kwargs):
    if instance.role.role_id != 2:
        try:
            instance.company_profile.delete()
        except CompanyProfile.DoesNotExist:
            pass
