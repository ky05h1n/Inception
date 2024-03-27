#!/bin/sh

DIR= /run/php
if [-d "$DIR"]; then
	echo "directory exist"
else
	mkdir /run/php
fi

sleep 10
wp config create	--allow-root \
					--dbname=$DB_NAME \
					--dbuser=$DB_USER \
					--dbpass=$DB_PASS \
					--dbhost=mariadb:3306 --path='/var/www/wordpress'
