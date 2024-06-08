FROM python:3.12-slim

ENV PYTHONUNBUFFERED 1
ENV DJANGO_SETTINGS_MODULE=server.settings

# Update and install necessary dependencies including Pango
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        git-core \
        build-essential \
        binutils \
        libproj-dev \
        gdal-bin \
        supervisor \
        libgirepository1.0-dev \
        libcairo2-dev \
        gir1.2-glib-2.0 \
        libglib2.0-dev \
        libpango1.0-dev && \
    rm -rf /var/lib/apt/lists/*

COPY ./requirements /home/backend-project/requirements
RUN mkdir -p /home/backend-project/media
WORKDIR /home/backend-project

RUN pip install --upgrade pip
RUN pip install -r ./requirements/requirements.txt

EXPOSE 8989

RUN mkdir -p /var/logs/backend-explorify

COPY ./build-process/backend-project/docker-backend-django/scripts /home/docker/scripts
COPY ./build-process/backend-project/docker-backend-django/config/supervisor-backend.conf /etc/supervisor/conf.d/supervisor-backend.conf

RUN sed -i 's/\r$//' /home/docker/scripts/boot.sh  && \
    chmod +x /home/docker/scripts/boot.sh

ENTRYPOINT /home/docker/scripts/boot.sh

COPY ./ /home/backend-project
