from django.urls import path

from . import views

urlpatterns = [
    path('', views.todos),
    path('test/', views.test_api, name='test_api'),
    path('todo/<int:pk>/', views.todo),
]