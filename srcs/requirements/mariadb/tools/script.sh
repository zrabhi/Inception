#!/bin/bash

# usermod -a -G mysql mysql 
# mkdir -p /var/run/mysqld 
# chown -R mysql:mysql /var/run/mysqld/ 

if [ ! -d "/var/lib/mysql/$USER_DATABASE" ]
then
    service mysql start &
    wait $!
    echo "step 1" >> /dev/stderr

    mysql -u root -e "CREATE DATABASE IF NOT EXISTS $USER_DATABASE;"
    echo "step 2" >> /dev/stderr

    mysql -u root -e "CREATE USER IF NOT EXISTS  '$USER_WP'@'%' IDENTIFIED BY '$USER_PASSWORD';"
    echo "step 3" >> /dev/stderr

    mysql -u root -e "GRANT ALL PRIVILEGES ON $USER_DATABASE.* TO '$USER_WP'@'%' IDENTIFIED BY '$USER_PASSWORD';"
    echo "step 4" >> /dev/stderr

    # mysql -u root -e  "CREATE USER '$MYSQL_ROOT'@'%' IDENTIFIED BY '$MYSQL_ROOTPASS';"
    mysql -u root -e "FLUSH PRIVILEGES;" 
    echo "step 5" >> /dev/stderr
    
    service mysql stop &
    wait $! 
fi
exec "$@"
# # else
#     # kill `cat /var/run/mysqld/mysqld.pid`
# fi

# if [ ! -d "/var/lib/mysql/$USER_DATABASE" ]
# then
   
# mysql -u root -e "CREATE DATABASE IF NOT EXISTS $USER_DATABASE;"
# mysql -u root -e "CREATE USER IF NOT EXISTS  '$USER_WP'@'%' IDENTIFIED BY '$USER_PASSWORD';"
# mysql -u root -e "GRANT ALL PRIVILEGES ON $USER_DATABASE.* TO '$USER_WP'@'%' IDENTIFIED BY '$USER_PASSWORD';"
# # mysql -u root -e  "CREATE USER '$MYSQL_ROOT'@'%' IDENTIFIED BY '$MYSQL_ROOTPASS';"
# mysql -u root -e "FLUSH PRIVILEGES;" 
# service mysql stop
# # kill cat /var/run/mysqld/mysqld.pid
#     # service  mysql stop 
