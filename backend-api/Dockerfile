# Stage 1: Build Stage
FROM python:3.11-slim AS builder

WORKDIR /app

COPY ./requirements.txt .

# Install build dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    && python -m venv /opt/venv \
    && /opt/venv/bin/pip install --upgrade pip \
    && /opt/venv/bin/pip wheel --no-cache-dir --no-deps --wheel-dir /usr/local/wheels -r requirements.txt

# Stage 2: Final Stage
FROM python:3.11-slim

# Copy the built wheels from the previous stage
COPY --from=builder /usr/local/wheels /usr/local/wheels

# Install application dependencies from wheels
RUN python -m venv /opt/venv \
    && /opt/venv/bin/pip install --no-cache /usr/local/wheels/*

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PATH="/opt/venv/bin:$PATH"

WORKDIR /app

# Copy the application code
COPY . .

# Expose the port the app runs on
EXPOSE 8989

# CMD ["sh", "-c", "python manage.py migrate && python manage.py createsuperuser --no-input --username ${DJANGO_SUPERUSER_USERNAME} --email ${DJANGO_SUPERUSER_EMAIL} || true && python manage.py runserver 0.0.0.0:8989"]
