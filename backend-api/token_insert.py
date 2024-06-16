import os
import django

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'server.settings') 

django.setup()

from account.models import User
from oauth2_provider.models import Application

user = User.objects.get(username='admin')
# backend_url = os.getenv("BACKEND_URL")
client_id = os.getenv("APP_CLIENT_ID")
client_secret = os.getenv("APP_CLIENT_SECRET")
if not Application.objects.filter(client_id=client_id).exists():
    application = Application.objects.create(
        user=user,
        client_id=client_id,
        client_type='confidential',
        authorization_grant_type='password',
        client_secret=client_secret,
        name='Backend',)
    application.save()
else:
    print('Already exists')
    
    
# Then run in shell of docker : python token_insert.py
