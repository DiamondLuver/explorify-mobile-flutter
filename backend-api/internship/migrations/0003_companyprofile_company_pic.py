# Generated by Django 5.0.6 on 2024-06-05 14:14

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('internship', '0002_companyprofile_company_type_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='companyprofile',
            name='company_pic',
            field=models.ImageField(default='images/profile_pics/Default.png', upload_to='images/profile_pics'),
        ),
    ]