from django.contrib import admin
from django.urls import path
from django.urls.conf import include
from todo import urls

urlpatterns = [
    path('api/v1/', include(urls)),
    path('admin/', admin.site.urls),
]