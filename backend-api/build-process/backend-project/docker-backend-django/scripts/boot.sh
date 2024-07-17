#!/bin/bash
set -e

echo "backend-project:boot:env:${APP_ENVIRONMENT}"
pip install --no-cache-dir -r ./requirements/requirements.txt

python manage.py makemigrations
python manage.py migrate
python manage.py collectstatic --noinput

# Create superuser and set role
echo "Creating superuser..."
python manage.py shell <<EOF
import os
from django.contrib.auth import get_user_model
from account.models import Role

User = get_user_model()

# Get environment variables
username = os.getenv('DJANGO_SUPERUSER_USERNAME')
email = os.getenv('DJANGO_SUPERUSER_EMAIL')
password = os.getenv('DJANGO_SUPERUSER_PASSWORD')
role_name = os.getenv('SUPERUSER_ROLE','Super-Admin')

# Ensure the role exists
role, created = Role.objects.get_or_create(role=role_name)

# Create the superuser if it doesn't exist
if not User.objects.filter(username=username).exists():
    user = User.objects.create_superuser(username, email, password)
    user.role = role
    user.save()
else:
    user = User.objects.get(username=username)
    user.role = role
    user.save()
EOF

if [ "$APP_ENVIRONMENT" == "Local" ]; then
  echo "backend-project:run:local" && python manage.py runserver 0.0.0.0:8989 --insecure
fi

if [ "$APP_ENVIRONMENT" == "Production" ]; then
  echo "backend-project:run:prod" && /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisor-backend.conf
fi
