"""
For insert data into educatin level, skills, lanugages, school and major
"""

import logging
from django.db import IntegrityError
from .models import EducationLevel, Skill, Language, School, Major
from account.models import Role
from post.models import *
from cv_maker.models import *
from internship.models import *
from django.contrib.contenttypes.models import ContentType

logger = logging.getLogger(__name__)


def insert_posts():
    try:
        Post.objects.create(
            title="Sample Post Title",
            content="Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
        )
        Post.objects.create(
            title="Another Post Title",
            content="Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        )
        logger.info("Posts inserted successfully.")
    except IntegrityError:
        logger.error("Posts already exist or insertion failed.")


def insert_comments():
    try:
        user = User.objects.first()  
        post = Post.objects.first()  
        content_type = ContentType.objects.get_for_model(Post)

        Comment.objects.create(
            user=user,
            content_type=content_type,
            object_id=post.post_id,
            content="This is a comment on the first post.",
        )

        logger.info("Comments inserted successfully.")
    except IntegrityError:
        logger.error("Comments already exist or insertion failed.")


def insert_replies():
    try:
        user = User.objects.first()
        comment = Comment.objects.first()

        Reply.objects.create(
            user=user,
            comment=comment,
            content="This is a reply to the first comment.",
        )

        logger.info("Replies inserted successfully.")
    except IntegrityError:
        logger.error("Replies already exist or insertion failed.")


def insert_favorites():
    try:
        user = User.objects.first()  # Replace with your user retrieval logic
        post = Post.objects.first()  # Replace with your post retrieval logic
        content_type = ContentType.objects.get_for_model(Post)

        Favorite.objects.create(
            user=user,
            content_type=content_type,
            object_id=post.post_id,
        )

        logger.info("Favorites inserted successfully.")
    except IntegrityError:
        logger.error("Favorites already exist or insertion failed.")


# def insert_internship_posts():
#     try:
#         InternshipPost.objects.create(
#             job_title="Software Engineer Intern",
#             company_name="Example Company",
#             location="New York, NY",
#             job_description="This is a description of the internship position.",
#             job_requirement="These are the requirements for the internship.",
#             job_type="Full-time",
#             job_duration="3 months",
#             qualification="Bachelor's degree in Computer Science",
#             salary="Paid internship",
#             status="Open",
#         )

#         logger.info("Internship posts inserted successfully.")
#     except IntegrityError:
#         logger.error("Internship posts already exist or insertion failed.")


def load_preset_data(sender, **kwargs):

    logger.info("Loading preset data...")

    insert_posts()
    insert_comments()
    insert_replies()
    insert_favorites()
    # insert_internship_posts()

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
