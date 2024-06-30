# apps.py

from django.apps import AppConfig

class BaseConfig(AppConfig):
    name = 'base'

    def ready(self):
        import base.internship_admin
        import base.account_admin
        import base.post_admin
