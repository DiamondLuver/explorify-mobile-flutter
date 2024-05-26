from django import forms
from django.contrib.auth.forms import UserChangeForm
from django.contrib.auth.models import User

class CustomUserChangeForm(UserChangeForm):
    current_password = forms.CharField(
        label='Current Password',
        widget=forms.PasswordInput,
        required=False
    )
    password = forms.CharField(
        label='New Password',
        widget=forms.PasswordInput,
        required=False
    )
    class Meta:
        model = User
        fields = ('username', 'first_name', 'last_name', 'email', 'password')

    def clean_password(self):
       return self.initial["password"]

    def save(self, commit=True):
        user = super().save(commit=False)
        password = self.cleaned_data.get('password')
        if password:
            user.set_password(password)
        if commit:
            user.save()
        return user
