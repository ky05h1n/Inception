#!/bin/sh

sleep 10


if [ ! -d /run/php ]; then
    mkdir /run/php
fi


wp config create --allow-root \
    --dbname="$DB_NAME" \
    --dbuser="$DB_USER" \
    --dbpass="$DB_PASS" \
    --dbhost="$DB_HOST:3306" \
    --path='/var/www/wordpress'


wp core install --allow-root \
    --url="http://localhost" \  
    --title="$TITLE" \
    --admin_user="$ADMIN_USER" \
    --admin_password="$ADMIN_PASSWORD" \
    --admin_email="$ADMIN_EMAIL" \
    --path='/var/www/wordpress'


    wp user create $USER_WP $USER_EMAIL --user_pass=$USER_PASSWORD --role=author --allow-root --path='/var/www/wordpress'

sleep 10
/usr/sbin/php-fpm7.4 -F
