#!/bin/bash

service mysql start
echo "DROP DATABASE IF EXISTS  WORPRESS;" >> /tmp/setup.sql
echo "CREATE DATABASE WORPRESSE;"  >> /tmp/setup.sql
echo "DROP USER IF EXISTS zac; " >> /tmp/setup.sql
echo "CREATE USER zac@'%' IDENTIFIED BY 'pass';" >> /tmp/setup.sql
echo "GRANT ALL PRIVILEGES ON WORDPRESS.* TO 'zac'@'%' IDENTIFIED BY 'pass';" >> /tmp/setup.sql
echo "FLUSH PRIVILEGES;" >> /tmp/setup.sql
mysql -u root < /tmp/setup.sql
# exec '@?'
exec "$@"
# service mysql stop
# mysqld