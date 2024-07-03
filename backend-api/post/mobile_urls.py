from django.urls import path, include
from .views import *


urlpatterns = [
    path("posts/list/", post_list, name="post-mobile-list"),   # GET

    # Post DETAIL   path("posts/<int:pk>/")
    path("internship-posts/list/", internship_post_list, name="internship-post-list"),  # GET
    
    path("comments/", comment_list_create, name="comment-list-create"),     # LIST and CREATE Comments
    path('replies/', reply_list_create, name='reply-list-create'),          # LIST, CREATE replies
    path('favorites/', favorite_list_create, name='favorite-list-create'),  # LIST and CREATE Favorite
    path('favorites/<int:pk>/', favorite_delete, name='favorite-delete'),   # REMOVE Favorite
]
