import os
import django

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'server.settings')  # Replace with your project name

django.setup()
from account.models import User
from cv_maker.models import CV, EducationLevel, Skill, Language, UserCompany, School, UserEducation, Major, UserAward, CompanyProfile
from datetime import date

# Create a User
user = User.objects.create(username='test', email='test.doe@example.com')

# Create an Education Level
education_level = EducationLevel.objects.create(education_name='Bachelor')

# Create a Skill
skill = Skill.objects.create(skill_name='Python')

# Create a Language
language = Language.objects.create(language_name='English')

# Create a User Company
company = CompanyProfile.objects.create(company_name='Example Company')
user_company = UserCompany.objects.create(user=user, company=company, start_date=date(2020, 1, 1), end_date=date(2021, 1, 1))

# Create a School
school = School.objects.create(school_name='Example School')

# Create a User Education
user_education = UserEducation.objects.create(user=user, school=school, education_level=education_level, start_date=date(2016, 9, 1), end_date=date(2020, 6, 1))

# Create a Major
major = Major.objects.create(major_name='Computer Science')

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
education_level.save()
skill.save()
language.save()
company.save()
user_company.save()
school.save()
user_education.save()
major.save()
user_award.save()
cv.save()


# Then run in shell of docker : python cv_dump_data.py