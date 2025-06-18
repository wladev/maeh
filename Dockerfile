FROM php:8.2-fpm

# Dépendances système
RUN apt-get update && apt-get install -y \
    git unzip zip curl libpq-dev libonig-dev libxml2-dev \
    && docker-php-ext-install pdo pdo_mysql

# Installe Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Déplace les sources
WORKDIR /var/www
COPY . .

# Installe les dépendances PHP
RUN composer install

# Droits
RUN chown -R www-data:www-data /var/www
