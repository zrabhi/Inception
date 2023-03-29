#!/bin/bash

service mysql start
echo "DROP DATABASE IF EXISTS  $USER_DATABASE;" > setup.sql
echo "CREATE DATABASE $USER_DATABASE ;" > setup.sql
echo "DROP USER IF EXISTS $USER_WP;" >setup.sql
echo "CREATE USER $USER_WP@'%' IDENTIFIED BY $USER_PASSWORD;" > setup.sql
echo "GRANT ALL PRIVILEGES ON $USER_DATABASE.* TO $USER_WP@'%' IDENTIFIED BY $USER_PASSWORD;" > setup.sql 
echo "FLUSH PRIVILEGES;" > setup.sql
mysql -u root < /tmp/setup.sql
exec "$@"

