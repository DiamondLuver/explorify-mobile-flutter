# admin.py
from django.contrib import admin
from cv_maker.models import CV, EducationLevel, Skill, Language, UserCompany, UserEducation, School, Major, UserAward

@admin.register(CV)
class CVAdmin(admin.ModelAdmin):
    list_display = ('cv_id', 'user', 'job_title', 'description', 'created_at', 'updated_at')
    search_fields = ('user__username', 'job_title', 'description')

@admin.register(EducationLevel)
class EducationLevelAdmin(admin.ModelAdmin):
    list_display = ('education_level_id', 'education_name', 'created_at', 'updated_at')
    search_fields = ('education_name',)

@admin.register(Skill)
class SkillAdmin(admin.ModelAdmin):
    list_display = ('skill_id', 'skill_name', 'created_at', 'updated_at')
    search_fields = ('skill_name',)

@admin.register(Language)
class LanguageAdmin(admin.ModelAdmin):
    list_display = ('language_id', 'language_name', 'created_at', 'updated_at')
    search_fields = ('language_name',)

@admin.register(UserCompany)
class UserCompanyAdmin(admin.ModelAdmin):
    list_display = ('user_company_id', 'user', 'company_name', 'start_date', 'end_date', 'created_at', 'updated_at')
    search_fields = ('user__username', 'company_name')
    list_filter = ('start_date', 'end_date')

@admin.register(UserEducation)
class UserEducationAdmin(admin.ModelAdmin):
    list_display = ('user_education_id','education_level', 'start_date', 'end_date', 'created_at', 'updated_at')
    search_fields = ('user__username',)
    list_filter = ('start_date', 'end_date')

@admin.register(School)
class SchoolAdmin(admin.ModelAdmin):
    list_display = ('school_id', 'school_name', 'created_at', 'updated_at')
    search_fields = ('school_name',)

@admin.register(Major)
class MajorAdmin(admin.ModelAdmin):
    list_display = ('major_id', 'major_name', 'created_at', 'updated_at')
    search_fields = ('major_name',)

@admin.register(UserAward)
class UserAwardAdmin(admin.ModelAdmin):
    list_display = ('user_award_id', 'user', 'award_name', 'award_category', 'date', 'created_at', 'updated_at')
    search_fields = ('user__username', 'award_name', 'award_category')
    list_filter = ('date',)
