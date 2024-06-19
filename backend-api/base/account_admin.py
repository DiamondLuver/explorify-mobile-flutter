from django.contrib import admin
from account.models import User, Profile, ContactInformation, Otp, Role
from internship.models import CompanyProfile
from django.contrib.auth.admin import UserAdmin

# from account.forms import CustomUserChangeForm
from django.utils.safestring import mark_safe
from django.urls import path
from django.contrib.auth.forms import UserChangeForm, UserCreationForm
from django.utils.translation import gettext_lazy as _


class ContactInformationInline(admin.StackedInline):
    model = ContactInformation
    extra = 1
    max_num = 1


class ProfileInline(admin.StackedInline):
    model = Profile
    extra = 1
    max_num = 1
    readonly_fields = ["profile_picture_display"]

    def profile_picture_display(self, obj):
        if obj.profile_pic:
            return mark_safe(
                f'<img src="{obj.profile_pic.url}" width="150" height="150" />'
            )
        return mark_safe(
            f'<img src="/static/images/profile_pics/Default.png" width="150" height="150" />'
        )

    profile_picture_display.short_description = "Profile Picture"


class CompanyProfileInline(admin.StackedInline):
    model = CompanyProfile
    extra = 1
    max_num = 1
    readonly_fields = ["company_profile_picture_display"]

    def company_profile_picture_display(self, obj):
        if obj.company_pic:
            return mark_safe(
                f'<img src="{obj.company_pic.url}" width="150" height="150" />'
            )
        return mark_safe(
            f'<img src="/static/images/profile_pics/Default.png" width="150" height="150" />'
        )

    company_profile_picture_display.short_description = "Company Profile Picture"


class CustomUserChangeForm(UserChangeForm):
    class Meta(UserChangeForm.Meta):
        model = User


class CustomUserAdmin(UserAdmin):
    form = CustomUserChangeForm
    fieldsets = (
        (None, {"fields": ("username", "password")}),
        (_("Personal info"), {"fields": ("first_name", "last_name", "email", "role")}),
        (
            _("Additional Information"),
            {"fields": ("location", "school", "headline", "last_login")},
        ),
        (
            _("Permissions"),
            {
                "fields": (
                    "is_active",
                    "is_staff",
                    "is_superuser",
                    "groups",
                    "user_permissions",
                )
            },
        ),
    )

    add_fieldsets = (
        (
            None,
            {
                "classes": ("wide",),
                "fields": ("username", "password1", "password2"),
            },
        ),
        (
            _("Additional Information"),
            {
                "fields": (
                    "role",
                    "first_name",
                    "last_name",
                    "email",
                    "location",
                    "school",
                    "headline",
                    "last_login",
                )
            },
        ),
        (
            _("Permissions"),
            {
                "fields": (
                    "is_active",
                    "is_staff",
                    "is_superuser",
                    "groups",
                    "user_permissions",
                )
            },
        ),
    )

    list_display = ("username", "first_name", "last_name", "email", "role", "is_active")
    search_fields = ("username", "first_name", "last_name", "email")
    ordering = ("username",)
    readonly_fields = ("last_login",)
    list_filter = ["role", "is_active"]


    def get_fieldsets(self, request, obj=None):
        if not obj:
            return self.add_fieldsets
        return super().get_fieldsets(request, obj)

    def get_inline_instances(self, request, obj=None):
        inlines = []
        if obj and obj.role.role_id != 2:
            inlines = [ProfileInline, ContactInformationInline]
        else:
            inlines = [CompanyProfileInline, ProfileInline, ContactInformationInline]
        return [inline(self.model, self.admin_site) for inline in inlines]


admin.site.register(User, CustomUserAdmin)
admin.site.register(Role)
admin.site.register(Profile)
admin.site.register(Otp)
