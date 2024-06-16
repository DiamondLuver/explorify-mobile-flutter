from django.contrib import admin
from account.models import User, Profile, ContactInformation, Otp
from django.contrib.auth.admin import UserAdmin
from account.forms import CustomUserChangeForm
from django.utils.safestring import mark_safe
from django.urls import path


class ContactInformationInline(admin.StackedInline):
    model = ContactInformation
    extra = 1
    max_num = 1
    
class ProfileInline(admin.StackedInline):
    model = Profile
    extra = 1
    max_num = 1 
    readonly_fields = ['profile_picture_display']

    def profile_picture_display(self, obj):
        if obj.profile_pic:
            return mark_safe(f'<img src="{obj.profile_pic.url}" width="150" height="150" />')
        return mark_safe(f'<img src="/static/images/profile_pics/Default.png" width="150" height="150" />')
    profile_picture_display.short_description = 'Profile Picture'

class CustomUserAdmin(UserAdmin):
    inlines = [ProfileInline, ContactInformationInline]
    form = CustomUserChangeForm
         
    fieldsets = (
        (None,  {'fields': ('username','current_password','password')}),
        ('Personal info', {'fields': ('first_name', 'last_name')}),
        ('Additional Information', {'fields': ('location', 'school', 'headline', 'last_login')}),
        ('Permissions', {'fields': ('is_active', 'is_staff', 'is_superuser', 'groups', 'user_permissions')}),
    )
    
    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': ('username', 'password1', 'password2'),
        }),
        ('Additional Information', {'fields': ('location', 'school', 'headline', 'last_login')}),
        ('Permissions', {'fields': ('is_active', 'is_staff', 'is_superuser', 'groups', 'user_permissions')}),
    )
    
    list_display = ('username', 'first_name', 'last_name', 'email', 'is_staff')
    search_fields = ('username', 'first_name', 'last_name', 'email')
    ordering = ('username',)
    can_delete = False
    
    def get_fieldsets(self, request, obj=None):
        fieldsets = super().get_fieldsets(request, obj)
        if obj:
            fieldsets[0][1]['fields'] = ('username','email', 'current_password', 'password')
        else:
            fieldsets[0][1]['fields'] = ('username', 'email', 'password1','password2')
        return fieldsets

admin.site.register(User, CustomUserAdmin)
# admin.site.register(Profile)
admin.site.register(Profile)
admin.site.register(Otp)
