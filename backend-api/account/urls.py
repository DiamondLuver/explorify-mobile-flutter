from django.urls import path
from .views import LoginView, LoginWithOtpView

urlpatterns = [
    path('api/generate/', LoginView.as_view(), name='generate'),
    path('api/login_with_otp/', LoginWithOtpView.as_view(), name='login_with_otp'),
]
