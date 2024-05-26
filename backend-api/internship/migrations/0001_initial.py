# Generated by Django 5.0.6 on 2024-05-26 15:59

import django.db.models.deletion
from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='CompanyProfile',
            fields=[
                ('company_id', models.BigAutoField(primary_key=True, serialize=False)),
                ('company_name', models.CharField(blank=True, max_length=255, null=True)),
                ('description', models.TextField(blank=True, null=True)),
                ('location', models.CharField(blank=True, max_length=255, null=True)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
            ],
            options={
                'verbose_name': 'Company Profile',
                'verbose_name_plural': 'Company Profiles',
                'db_table': 'company_profile',
            },
        ),
        migrations.CreateModel(
            name='InternshipApplication',
            fields=[
                ('internship_application_id', models.BigAutoField(primary_key=True, serialize=False)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('user', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.DO_NOTHING, to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'verbose_name': 'Internship Application',
                'verbose_name_plural': 'Internship Applications',
                'db_table': 'internship_application',
            },
        ),
        migrations.CreateModel(
            name='Document',
            fields=[
                ('document_id', models.BigAutoField(primary_key=True, serialize=False)),
                ('document_type', models.SmallIntegerField(choices=[(1, 'CV'), (2, 'Cover Letter'), (3, 'Others')], default=1)),
                ('file', models.CharField(blank=True, max_length=100, null=True)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('internship_application', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='internship.internshipapplication')),
            ],
            options={
                'verbose_name': 'Document',
                'verbose_name_plural': 'Documents',
                'db_table': 'document',
            },
        ),
        migrations.CreateModel(
            name='InternshipPost',
            fields=[
                ('internship_post_id', models.BigAutoField(primary_key=True, serialize=False)),
                ('job_title', models.CharField(blank=True, max_length=255, null=True)),
                ('category', models.CharField(blank=True, max_length=255, null=True)),
                ('company_name', models.CharField(blank=True, max_length=255, null=True)),
                ('location', models.CharField(blank=True, max_length=255, null=True)),
                ('body', models.TextField(blank=True, null=True)),
                ('status', models.CharField(blank=True, max_length=50, null=True)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('company', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='internship.companyprofile')),
            ],
            options={
                'verbose_name': 'Internship Post',
                'verbose_name_plural': 'Internship Posts',
                'db_table': 'internship_post',
            },
        ),
        migrations.AddField(
            model_name='internshipapplication',
            name='internship_post',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='internship.internshippost'),
        ),
        migrations.CreateModel(
            name='JobPoster',
            fields=[
                ('job_poster_id', models.BigAutoField(primary_key=True, serialize=False)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('company', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='internship.companyprofile')),
            ],
            options={
                'verbose_name': 'Job Poster',
                'verbose_name_plural': 'Job Posters',
                'db_table': 'job_poster',
            },
        ),
        migrations.AddField(
            model_name='internshippost',
            name='job_poster',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='internship.jobposter'),
        ),
    ]
