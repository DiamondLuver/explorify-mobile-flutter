from django.apps import AppConfig
from django.utils.translation import gettext as _

class PostConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'post'
    verbose_name = ("POST ARTICLES")
    def ready(self):
        import post.mobile_urls
