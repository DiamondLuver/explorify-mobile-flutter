# Generated by Django 5.0.6 on 2024-06-11 13:57

from django.db import migrations, models



class Migration(migrations.Migration):

    dependencies = [
        ("account", "0002_alter_contactinformation_user_delete_staff"),
    ]

    operations = [
        migrations.AddField(
            model_name="otp",
            name="code",
            field=models.CharField(default="", max_length=6),
        ),
    ]