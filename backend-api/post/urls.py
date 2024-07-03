from django.urls import path, include
from .views import *

urlpatterns = [
    # For Mobile
    path('', include("post.mobile_urls")),
    path("posts/", post_list_create, name="post-list-create"),              # LIST and CREATE Post
    
    # Mobile & Web (Detail), Web (Update, Delete)
    path("posts/<int:pk>/", post_detail, name="post-detail"),               # DETAIL, UPDATE and DELETE Post

    path("internship-posts/", internship_post_list_create, name="internship-post-list-create"),     # LIST and CREATE Internship Post
    path("internship-posts/<int:pk>/", internship_post_detail, name="internship-post-detail"),      # DETAIL, UPDATE and DELETE Internship Post
]
