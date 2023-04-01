#!/bin/bash

service mysql start &
wait $!
if [ ! -d "/var/lib/mysql/$USER_DATABASE" ]
then
   
    mysql -u root -e "CREATE DATABASE $USER_DATABASE;"
    mysql -u root -e "DROP USER IF EXISTS $USER_WP;"
    mysql -u root -e "CREATE USER '$USER_WP'@'%' IDENTIFIED BY '$USER_PASSWORD';"
    mysql -u root -e "GRANT ALL PRIVILEGES ON $USER_DATABASE.* TO '$USER_WP'@'%' IDENTIFIED BY '$USER_PASSWORD';"
    mysql -u root -e "FLUSH PRIVILEGES;" 
    service  mysql stop &
    wait $!
fi 
    
exec "$@"