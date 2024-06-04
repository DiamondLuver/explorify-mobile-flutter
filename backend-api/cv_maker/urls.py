# urls.py
from django.urls import path
from .views import CVFormAPIView

urlpatterns = [
    path("cv-form-data/", CVFormAPIView.as_view(), name="cv-form-data"),  # use Post method to Generate CV & Get Method to get Data for CV
]
