# Generated by Django 5.0.6 on 2024-06-18 08:07

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('cv_maker', '0002_alter_usercompany_company_and_more'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='usercompany',
            name='company',
        ),
        migrations.AddField(
            model_name='usercompany',
            name='company_name',
            field=models.CharField(blank=True, max_length=128),
        ),
    ]
