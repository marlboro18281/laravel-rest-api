FROM php:8.2-fpm-alpine

WORKDIR /var/www/laravel

RUN apk update && apk add --no-cache \
    libpng-dev \
    libzip-dev \
    oniguruma-dev \
    libxml2-dev \
    && docker-php-ext-install pdo pdo_mysql mbstring xml bcmath gd zip \
    && mkdir -p /var/www/laravel/storage /var/www/laravel/bootstrap/cache \
    && chown -R www-data:www-data /var/www/laravel \
    && chmod -R 775 /var/www/laravel/storage \
    && chmod -R 775 /var/www/laravel/bootstrap/cache