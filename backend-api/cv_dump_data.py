import os
import django
from datetime import date

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'server.settings')
django.setup()

from account.models import User
from cv_maker.models import CV, EducationLevel, Skill, Language, UserCompany, School, UserEducation, Major, UserAward, CompanyProfile

# Helper function to get or create objects
def get_or_create_instance(model, field_name, field_value):
    instance, created = model.objects.get_or_create(**{field_name: field_value})
    return instance

# Create a User
user = User.objects.get_or_create(username='test', email='test.doe@example.com')

# Create an Education Level
education_level = get_or_create_instance(EducationLevel, 'education_name', 'Bachelor')

# Create a Skill
skill = get_or_create_instance(Skill, 'skill_name', 'Python')

# Create a Language
language = get_or_create_instance(Language, 'language_name', 'English')

# Create a User Company
user_company = UserCompany.objects.create(user=user, company_name="Company", start_date=date(2020, 1, 1), end_date=date(2021, 1, 1))

# Create a School
school = get_or_create_instance(School, 'school_name', 'Example School')

# Create a Major
major = get_or_create_instance(Major, 'major_name', 'Computer Science')

# Create a User Education
user_education = UserEducation.objects.create(user=user, school=school, education_level=education_level, start_date=date(2016, 9, 1), end_date=date(2020, 6, 1))

# Create a User Award
user_award = UserAward.objects.create(user=user, award_name='Best Employee', date=date(2022, 5, 1))

# Create a CV
cv = CV.objects.create(user=user, description='My CV description', job_title='Software Developer')
cv.user_education.add(user_education)
cv.user_skill.add(skill)
cv.user_language.add(language)
cv.user_major.add(major)
cv.user_award.add(user_award)

# Save all the instances
user.save()
user_company.save()
cv.save()

print("Data population completed successfully.")
