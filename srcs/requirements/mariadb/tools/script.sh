#!/bin/bash

# usermod -a -G mysql mysql 
# mkdir -p /var/run/mysqld 
# chown -R mysql:mysql /var/run/mysqld/ 

service mysql start 
# wait $!
# if [ ! -d "/var/lib/mysql/$USER_DATABASE" ]
# then
   
mysql -u root -e "CREATE DATABASE IF NOT EXISTS $USER_DATABASE;"
mysql -u root -e "CREATE USER IF NOT EXISTS  '$USER_WP'@'%' IDENTIFIED BY '$USER_PASSWORD';"
mysql -u root -e "GRANT ALL PRIVILEGES ON $USER_DATABASE.* TO '$USER_WP'@'%' IDENTIFIED BY '$USER_PASSWORD';"
# mysql -u root -e  "CREATE USER '$MYSQL_ROOT'@'%' IDENTIFIED BY '$MYSQL_ROOTPASS';"
mysql -u root -e "FLUSH PRIVILEGES;" 
service mysql stop
# else
    # kill `cat /var/run/mysqld/mysqld.pid`
# fi
# kill cat /var/run/mysqld/mysqld.pid
    # service  mysql stop 

exec "$@"