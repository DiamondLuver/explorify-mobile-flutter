from django.urls import path

from . import views

urlpatterns = [
    path('', views.todos),
    path('todo/<int:pk>/', views.todo),
]