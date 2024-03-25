#!/bin/bash

service mariadb start

mysql -e "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;"
mysql -e "CREATE USER IF NOT EXISTS \`${DB_USER}\`@'localhost' IDENTIFIED BY '${DB_PASS}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO \`${DB_USER}\`@'localhost';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASS}';"
mysql -e "FLUSH PRIVILEGES;"

mysqladmin -u root -p${DB_ROOT_PASS} shutdown

exec mysqld_safe
# while true; do echo "dasdsad"; sleep 1 ; done 
