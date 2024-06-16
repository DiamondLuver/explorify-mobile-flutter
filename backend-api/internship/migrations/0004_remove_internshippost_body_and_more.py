# Generated by Django 5.0.6 on 2024-06-11 02:45

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('internship', '0003_companyprofile_company_pic'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='internshippost',
            name='body',
        ),
        migrations.AddField(
            model_name='internshippost',
            name='job_description',
            field=models.TextField(blank=True),
        ),
        migrations.AddField(
            model_name='internshippost',
            name='job_duration',
            field=models.CharField(blank=True, max_length=100),
        ),
        migrations.AddField(
            model_name='internshippost',
            name='job_requirement',
            field=models.TextField(blank=True),
        ),
        migrations.AddField(
            model_name='internshippost',
            name='job_type',
            field=models.CharField(blank=True, max_length=100),
        ),
        migrations.AddField(
            model_name='internshippost',
            name='qualification',
            field=models.CharField(blank=True, max_length=100),
        ),
    ]
