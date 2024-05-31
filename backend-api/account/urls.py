from django.urls import path
from .views import LoginView, LoginWithOtpView, CreateAccount, AllUsers, CurrentUser

app_name = "users"

urlpatterns = [
    path("create/", CreateAccount.as_view(), name="create_user"),   # Register User Social Account
    path("all/", AllUsers.as_view(), name="all"),                   # List All Users
    path("currentUser/", CurrentUser.as_view(), name="current"),    # Get Current User Information
    
    path('generate/', LoginView.as_view(), name='generate'),    # Generate OTP Login
    path('login_with_otp/', LoginWithOtpView.as_view(), name='login_with_otp'),   # Login with OTP
]
