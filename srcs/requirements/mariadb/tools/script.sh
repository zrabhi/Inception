#!/bin/bash
service mysql start 
# creating backup file
# change the bind to 0.0.0.0 only accept client connections made to 0.0.0.0 (accept connection to any address)

sed -i 's/bind-address            = 127.0.0.1/bind-address = 0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

# create the database if not exist
mysql -u root -p$MYSQL_ROOTPASS -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;"
# create the -p$MYSQL_ROOTPASS ser if not exist
mysql -u root -p$MYSQL_ROOTPASS -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
# grant all p-p$MYSQL_ROOTPASS d database to the user
mysql -u root -p$MYSQL_ROOTPASS -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';"
# this comman-p$MYSQL_ROOTPASS iaDB server to reload the grant tables and update its internal data structures with the current contents of the grant tables.
mysql -u root -p$MYSQL_ROOTPASS -e "FLUSH PRIVILEGES;"
# set the pas-p$MYSQL_ROOTPASS word to the root
mysql -u root -p$MYSQL_ROOTPASS -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOTPASS';"

# killing the porcess of mysqld to not restarting while waiting the wordpress to get setup
kill `cat /var/run/mysqld/mysqld.pid`

exec "$@"