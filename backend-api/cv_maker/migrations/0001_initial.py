# Generated by Django 5.0.6 on 2024-06-03 14:18

import django.db.models.deletion
from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('internship', '0001_initial'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='EducationLevel',
            fields=[
                ('education_level_id', models.AutoField(primary_key=True, serialize=False)),
                ('education_name', models.CharField(max_length=255)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
            ],
            options={
                'verbose_name': 'EducationLevel',
                'verbose_name_plural': 'EducationLevels',
                'db_table': 'education_level',
            },
        ),
        migrations.CreateModel(
            name='Language',
            fields=[
                ('language_id', models.AutoField(primary_key=True, serialize=False)),
                ('language_name', models.CharField(max_length=255)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
            ],
            options={
                'verbose_name': 'Language',
                'verbose_name_plural': 'Languages',
                'db_table': 'language',
            },
        ),
        migrations.CreateModel(
            name='Major',
            fields=[
                ('major_id', models.AutoField(primary_key=True, serialize=False)),
                ('major_name', models.CharField(max_length=255)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
            ],
            options={
                'verbose_name': 'Major',
                'verbose_name_plural': 'Majors',
                'db_table': 'major',
            },
        ),
        migrations.CreateModel(
            name='School',
            fields=[
                ('school_id', models.AutoField(primary_key=True, serialize=False)),
                ('school_name', models.CharField(max_length=255)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
            ],
            options={
                'verbose_name': 'School',
                'verbose_name_plural': 'Schools',
                'db_table': 'school',
            },
        ),
        migrations.CreateModel(
            name='Skill',
            fields=[
                ('skill_id', models.AutoField(primary_key=True, serialize=False)),
                ('skill_name', models.CharField(max_length=255)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
            ],
            options={
                'verbose_name': 'Skill',
                'verbose_name_plural': 'Skills',
                'db_table': 'skill',
            },
        ),
        migrations.CreateModel(
            name='UserAward',
            fields=[
                ('user_award_id', models.AutoField(primary_key=True, serialize=False)),
                ('award_name', models.CharField(max_length=255)),
                ('certificate_file', models.FileField(blank=True, upload_to='certificates/')),
                ('award_category', models.CharField(blank=True, max_length=255, null=True)),
                ('date', models.DateField(blank=True, null=True)),
                ('description', models.CharField(blank=True, max_length=255, null=True)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'verbose_name': 'User Award',
                'verbose_name_plural': 'User Awards',
                'db_table': 'user_award',
            },
        ),
        migrations.CreateModel(
            name='UserCompany',
            fields=[
                ('user_company_id', models.AutoField(primary_key=True, serialize=False)),
                ('start_date', models.DateField()),
                ('end_date', models.DateField()),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('company', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='internship.companyprofile')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'verbose_name': 'User Company',
                'verbose_name_plural': 'User Companies',
                'db_table': 'user_company',
            },
        ),
        migrations.CreateModel(
            name='UserEducation',
            fields=[
                ('user_education_id', models.AutoField(primary_key=True, serialize=False)),
                ('start_date', models.DateField()),
                ('end_date', models.DateField()),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('education_level', models.ForeignKey(null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='cv_maker.educationlevel')),
                ('school', models.ForeignKey(null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='cv_maker.school')),
                ('user', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'verbose_name': 'User Education',
                'verbose_name_plural': 'User Educations',
                'db_table': 'user_education',
            },
        ),
        migrations.CreateModel(
            name='CV',
            fields=[
                ('cv_id', models.AutoField(primary_key=True, serialize=False)),
                ('description', models.CharField(max_length=255, null=True)),
                ('job_title', models.CharField(max_length=255, null=True)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
                ('user_language', models.ManyToManyField(blank=True, to='cv_maker.language')),
                ('user_major', models.ManyToManyField(blank=True, to='cv_maker.major')),
                ('user_skill', models.ManyToManyField(blank=True, to='cv_maker.skill')),
                ('user_award', models.ManyToManyField(blank=True, to='cv_maker.useraward')),
                ('user_company', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='cv_maker.usercompany')),
                ('user_education', models.ManyToManyField(blank=True, to='cv_maker.usereducation')),
            ],
            options={
                'verbose_name': 'CV',
                'verbose_name_plural': 'CVs',
                'db_table': 'cv',
            },
        ),
    ]