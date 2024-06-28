from django.urls import path
from .views import *

app_name = "users"

urlpatterns = [
    path("create/", CreateAccount.as_view(), name="create_user"),   # Register or Login User Social Account
    
    path("create-company/", register_company_profile, name="register_company_profile"),   # Register User Social Account
    
    path("all/", AllUsers.as_view(), name="all"),                   # List All Users
    path("currentUser/", CurrentUser.as_view(), name="current"),    # Get Current User Information
    
    path('generate/', LoginView.as_view(), name='generate'),    # Generate OTP Login
    path('login_with_otp/', LoginWithOtpView.as_view(), name='login_with_otp'),   # Login with OTP
    path('logout/', user_logout, name='logout'),   # Logout
       
    path('change_password/', change_password, name='change_password'),
    
]
