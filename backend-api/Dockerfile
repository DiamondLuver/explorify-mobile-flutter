# Dockerfile
# Base Image
FROM python:3.12

# Set working directory
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY ./ /app

# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt

# Django Application
# Start application
CMD sh -c "python manage.py migrate && python manage.py runserver 0.0.0.0:8989"