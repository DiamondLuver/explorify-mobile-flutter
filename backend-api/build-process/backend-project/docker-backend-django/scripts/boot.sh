#!/bin/bash
set -e

echo "backend-project:boot:env:${APP_ENVIRONMENT}"
pip install --no-cache-dir -r ./requirements/requirements.txt

python manage.py makemigrations
python manage.py migrate
python manage.py collectstatic --noinput

# Create superuser
echo "Creating superuser..."
python manage.py shell <<EOF
from django.contrib.auth import get_user_model

User = get_user_model()
if not User.objects.filter(username='admin').exists():
    User.objects.create_superuser('admin', 'admin@example.com', 'password')
EOF

if [ "$APP_ENVIRONMENT" == "Local" ]; then
  echo "backend-project:run:local" && python manage.py runserver 0.0.0.0:8989 --insecure
fi

if [ "$APP_ENVIRONMENT" == "Production" ]; then
  echo "backend-project:run:prod" && /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisor-backend.conf
fi
