"""
For insert data into educatin level, skills, lanugages, school and major
"""

import logging
from django.db import IntegrityError
from .models import EducationLevel, Skill, Language, School, Major
from account.models import Role
logger = logging.getLogger(__name__)


def load_preset_data(sender, **kwargs):
    logger.info("Loading preset data...")
    roles = ["Super-Admin", "Admin", "User"]
    education_levels = ["High School", "Bachelor's Degree", "Master's Degree", "PhD"]
    skills = ["Python", "Django", "Machine Learning", "Data Analysis"]
    languages = ["English", "Spanish", "French", "German"]
    schools = [
        "Harvard University",
        "Stanford University",
        "MIT",
        "University of Cambridge",
    ]
    majors = [
        "Computer Science",
        "Mechanical Engineering",
        "Business Administration",
        "Physics",
    ]
    for name in roles:
        try:
            obj, created = Role.objects.get_or_create(role=name)
            if created:
                logger.info(f"Inserted role: {name}")
        except IntegrityError as e:
            logger.error(f"Error inserting role {name}: {e}")
            
    for name in education_levels:
        try:
            obj, created = EducationLevel.objects.get_or_create(education_name=name)
            if created:
                logger.info(f"Inserted education level: {name}")
        except IntegrityError as e:
            logger.error(f"Error inserting education level {name}: {e}")

    for name in skills:
        try:
            obj, created = Skill.objects.get_or_create(skill_name=name)
            if created:
                logger.info(f"Inserted skill: {name}")
        except IntegrityError as e:
            logger.error(f"Error inserting skill {name}: {e}")

    for name in languages:
        try:
            obj, created = Language.objects.get_or_create(language_name=name)
            if created:
                logger.info(f"Inserted language: {name}")
        except IntegrityError as e:
            logger.error(f"Error inserting language {name}: {e}")

    for name in schools:
        try:
            obj, created = School.objects.get_or_create(school_name=name)
            if created:
                logger.info(f"Inserted school: {name}")
        except IntegrityError as e:
            logger.error(f"Error inserting school {name}: {e}")

    for name in majors:
        try:
            obj, created = Major.objects.get_or_create(major_name=name)
            if created:
                logger.info(f"Inserted major: {name}")
        except IntegrityError as e:
            logger.error(f"Error inserting major {name}: {e}")

    logger.info("Preset data loading completed.")
