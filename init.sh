#!/bin/sh

# Corriger les permissions (récupère le bon utilisateur dans le container)
echo "Fixing permissions on var/"
chown -R www-data:www-data var
# Générer les assets (avec Symfony AssetMapper + Tailwind)
chown www-data:www-data /var/tailwind/v3.4.17/tailwindcss-linux-x64
chmod +x /var/tailwind/v3.4.17/tailwindcss-linux-x64
php bin/console asset-map:compile
php bin/console importmap:install
php bin/console tailwind:build


# Installer les dépendances PHP
composer install --no-dev --optimize-autoloader

# Clear + warmup cache
php bin/console cache:clear --no-warmup
php bin/console cache:warmup

echo "Fixing ownerships"
chown -R www-data:www-data var vendor public

echo "Fixing permissions"
find var -type d -exec chmod 775 {} \;
find var -type f -exec chmod 664 {} \;
chown -R www-data:www-data /var/www

# Démarrer php-fpm
php-fpm
