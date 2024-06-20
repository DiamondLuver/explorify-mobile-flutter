from django.urls import path
from . import views

urlpatterns = [
 
    # api for Company Profile view 
    path('company/list/', views.view_company , name = 'view-company'),
    path('company/details/<int:companyId>/', views.view_details, name = 'view-details'),
    path('company/create/',views.add_company, name='add-company'),
    path('company/update/<int:companyId>/', views.update_company, name='update_company'),
    path('company/delete/<int:companyId>/', views.delete_company, name='delete_company'),

    # for Internship view 

    path('post/list/', views.view_post , name = 'view-post'),
    path('post/details/<int:postId>/', views.view_details_post, name = 'view-details'),
    path('post/create/',views.add_post, name='add-post'),
    path('post/update/<int:postId>/', views.update_post, name='update_post'),
    path('post/delete/<int:postId>/', views.delete_post, name='delete_post'),
    
]