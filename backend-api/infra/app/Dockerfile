# Use PHP 8.2 FPM image
FROM php:8.2-fpm

# Update and install dependencies
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
     git \
     curl \
     libpng-dev \
     libonig-dev \
     libxml2-dev \
     zip \
     unzip \
     zlib1g-dev \
     libpq-dev \
     libzip-dev \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
  && docker-php-ext-install pdo pdo_pgsql pgsql zip bcmath gd \
  && docker-php-ext-enable opcache

# Remove unnecessary packages
RUN apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false \
     && rm -rf /var/lib/apt/lists/*

# Copy Composer binary from Composer official image
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Expose port 9000
EXPOSE 9000
