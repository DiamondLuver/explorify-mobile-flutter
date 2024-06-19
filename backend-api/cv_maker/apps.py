from django.apps import AppConfig
from django.db.models.signals import post_migrate
class CvMakerConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'cv_maker'
    def ready(self):
        from  cv_maker.preset_data import load_preset_data
        post_migrate.connect(load_preset_data, sender=self)