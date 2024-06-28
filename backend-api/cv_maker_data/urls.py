# urls.py
from django.urls import path
from cv_maker_data.views import *

urlpatterns = [
    path(
        "cv/preset-data/", preset_data_list, name="cv-preset-data"
    ),  # list majors, schools, skills, languages, edu-level
    path("cv/edu-levels/", education_list, name="cv-edu-levels"),
    path("cv/languages/", language_list, name="cv-language-list"),
    path("cv/skills/", skill_list, name="cv-skill-list"),
    path("cv/schools/", school_list, name="cv-school-list"),
    path("cv/majors/", major_list, name="cv-major-list"),
    
    path("cv/user-companies/", user_company_list, name="user-company-list"),
    path("cv/user-companies/<int:pk>/", user_company_detail, name="user-company-detail"),
    
    path("cv/user-educations/", user_education_list, name="user-education-list"),
    path("cv/user-educations/<int:pk>/", user_education_detail, name="user-education-detail"),
    
    path("cv/user-awards/", user_award_list, name="user-award-list"),
    path("cv/user-awards/<int:pk>/", user_award_detail, name="user-award-detail"),
]
