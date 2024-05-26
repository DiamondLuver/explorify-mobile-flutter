from django.contrib import admin
from django.urls import path, include
from django.conf import settings
from django.conf.urls.static import static
urlpatterns = [
    path('admin/', admin.site.urls),
    
    # path('o/', include('oauth2_provider.urls', namespace='oauth2_provider')),
    
    path('', include('internship.urls')),
    path('', include('account.urls')),
]

# if settings.DEBUG:
urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

admin.site.site_title = "Explorify site admin (DEV)"
admin.site.site_header = "Explorify administration"
admin.site.index_title = "Site administration"