from django.urls import path
from . import views

urlpatterns = [
    path('api/register/', views.register_view, name='register'),
    path('api/login/', views.login_view, name='login'),
    path('api/verify-otp/', views.verify_otp_view, name='verify-otp'),

    # api for Company Profile view 
    path('api/company/list/', views.view_company , name = 'view-company'),
    path('api/company/details/<int:companyId>/', views.view_details, name = 'view-details'),
    path('api/company/create/',views.add_company, name='add-company'),
    path('api/company/update/<int:companyId>/', views.update_company, name='update_company'),
    path('api/company/delete/<int:companyId>/', views.delete_company, name='delete_company'),

    # for Internship view 

    path('api/post/list/', views.view_post , name = 'view-post'),
    path('api/post/details/<int:postId>/', views.view_details, name = 'view-details'),
    path('api/post/create/',views.add_post, name='add-post'),
    path('api/post/update/<int:postId>/', views.update_post, name='update_post'),
    path('api/post/delete/<int:postId>/', views.delete_post, name='delete_post'),
    
]