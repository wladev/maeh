FROM php:8.3-fpm

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git unzip libicu-dev libonig-dev libpq-dev libzip-dev zip curl \
    && docker-php-ext-install intl pdo pdo_pgsql zip opcache

# Install Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /var/www

# Copy existing application directory contents
COPY . .

# Permissions
RUN chown -R www-data:www-data /var/www \
    && chmod -R 775 /var/www/var

# (Optional tuning, mais tu peux la remettre si le fichier existe)
# COPY docker/php/conf.d/app.ini /usr/local/etc/php/conf.d/app.ini
