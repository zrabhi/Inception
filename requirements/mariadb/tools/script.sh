#!/bin/bash

if [ ! -d "/var/lib/mysql/$USER_DATABASE" ]
then
    service mysql start   
    echo "CREATE DATABASE $USER_DATABASE ;" >> setup.sql
    echo "DROP USER IF EXISTS $USER_WP;" >> setup.sql
    echo "CREATE USER $USER_WP@'%' IDENTIFIED BY $USER_PASSWORD;" >> setup.sql
    echo "GRANT ALL PRIVILEGES ON $USER_DATABASE.* TO $USER_WP@'%' IDENTIFIED BY $USER_PASSWORD;" >> setup.sql 
    echo "FLUSH PRIVILEGES;" >> /tmp/setup.sql
    mysql -u root < /tmp/setup.sql
# exec '@?'
fi 


# kill $(cat /init/mysql.pid)

exec "$@"
# mysqld