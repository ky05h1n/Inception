#!/bin/sh
mkdir /var/www/
mkdir /var/www/html

cd /var/www/html

wp core download --allow-root

mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
mv /wp-config.php /var/www/html/wp-config.php

sed -i -r "s/database_name_here/$DB_NAME/1"   wp-config.php
sed -i -r "s/username_here/$DB_USER/1"  wp-config.php
sed -i -r "s/password_here/$DB_PASS/1"    wp-config.php
sed -i -r "s/localhost/$DB_HOST/1"    wp-config.php



# wp config create --allow-root \
#     --dbname="$DB_NAME" \
#     --dbuser="$DB_USER" \
#     --dbpass="$DB_PASS" \
#     --dbhost="$DB_HOST:3306" \
#     --path='/var/www/wordpress'


wp core install --url=$DOMAIN_NAME/ --title=$TITLE \
    --admin_user=$ADMIN_USER \
    --admin_password=$ADMIN_PASSWORD \
    --admin_email=$ADMIN_EMAIL \
    --skip-email --allow-root

wp user create $USER_WP $USER_EMAIL --user_pass=$USER_PASSWORD --role=author --allow-root --path='/var/www/wordpress'
wp plugin update --all --allow-root

sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf

mkdir -p /run/php
/usr/sbin/php-fpm7.4 -F
