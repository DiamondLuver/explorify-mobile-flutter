from django.contrib import admin
from django.urls import path, include
from django.conf import settings
from django.conf.urls.static import static
from .views import index

BASE_PREFIX = 'api/v1/'  

urlpatterns = [
    path('', index, name="index"),
    path('admin/', admin.site.urls),
    path(BASE_PREFIX , include([
        # add these
        path('auth/', include("rest_framework.urls")),
        path('auth/', include('social_django.urls', namespace='social')),
        path('auth/', include("drf_social_oauth2.urls", namespace="drf")),
        path('auth/password_reset/', include('django_rest_passwordreset.urls', namespace='password_reset')),  # Reset password via Email
    ])),
    
    # REGISTER URL HERE
    path(BASE_PREFIX, include([
        path('', include('internship.urls')),            # from internship APP
        path('account/', include("account.urls")),       # from account APP
        path('', include("cv_maker.urls")),              # from cv_maker APP
        path('', include("cv_maker_data.urls")),         # from cv_maker_data APP
        path('', include("post.urls")),                  # from post APP
    ])),
    
    
]

# if settings.DEBUG:
urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

admin.site.site_title = "Explorify site admin (DEV)"
admin.site.site_header = "Explorify administration"
admin.site.index_title = "Site administration"
