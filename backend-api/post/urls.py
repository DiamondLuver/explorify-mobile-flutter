from django.urls import path, include
from .views import *


urlpatterns = [
    path("posts/", post_list_create, name="post-list-create"),              # LIST and CREATE Post
    path("posts/<int:pk>/", post_detail, name="post-detail"),               # DETAIL, UPDATE and DELETE Post
    path("comments/", comment_list_create, name="comment-list-create"),     # LIST and CREATE Comments
    path('replies/', reply_list_create, name='reply-list-create'),          # LIST, CREATE replies
    path('favorites/', favorite_list_create, name='favorite-list-create'),  # LIST and CREATE Favorite
    path('favorites/<int:pk>/', favorite_delete, name='favorite-delete'),   # REMOVE Favorite
]
