#!/bin/bash
# usermod -a -G mysql mysql 
# mkdir -p /var/run/mysqld 
# chown -R mysql:mysql /var/run/mysqld/ 


# if [ ! -d "/var/lib/mysql/$USER_DATABASE" ];then
# service mysql start 
# # wait $!
# echo "step 1" >> /dev/stderr
# mysql -u root -e "CREATE DATABASE IF NOT EXISTS $USER_DATABASE;"
# echo "step 2" >> /dev/stderr
# mysql -u root -e "CREATE USER IF NOT EXISTS  '$USER_WP'@'%' IDENTIFIED BY '$USER_PASSWORD';"
# echo "step 3" >> /dev/stderr
# mysql -u root -e "GRANT ALL PRIVILEGES ON $USER_DATABASE.* TO '$USER_WP'@'%' IDENTIFIED BY '$USER_PASSWORD';"
# echo "step 4" >> /dev/stderr
# # mysql -u root -e  "CREATE USER '$MYSQL_ROOT'@'%' IDENTIFIED BY '$MYSQL_ROOTPASS';"
# mysql -u root -e "FLUSH PRIVILEGES;" 
# echo "step 5" >> /dev/stderr
# service mysql stop 
# # fi

# exec "$@"

# service mysql start

# # change the bind to 0.0.0.0 only accept client connections made to 0.0.0.0 (accept connection to any address)
# sed -i 's/bind-address            = 127.0.0.1/bind-address = 0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

# # create the database if not exist
# mysql -u root -e "CREATE DATABASE IF NOT EXISTS $USER_DATABASE;"
# mysql -u root -e "CREATE USER IF NOT EXISTS  '$USER_WP'@'%' IDENTIFIED BY '$USER_PASSWORD';"
# mysql -u root -e "GRANT ALL PRIVILEGES ON $USER_DATABASE.* TO '$USER_WP'@'%' IDENTIFIED BY '$USER_PASSWORD';"
# # mysql -u root -e  "CREATE USER '$MYSQL_ROOT'@'%' IDENTIFIED BY '$MYSQL_ROOTPASS';"
# mysql -u root -e "FLUSH PRIVILEGES;" 
# # mysql -u root -e  "CREATE USER '$MYSQL_ROOT'@'%' IDENTIFIED BY '$MYSQL_ROOTPASS';"

# # killing the porcess of mysqld to not restarting while waiting the wordpress to get setup
# service mysql stop
# # kill `cat /var/ru//n/mysqld/mysqld.pid`

# exec "$@"

service mysql start 

# change the bind to 0.0.0.0 only accept client connections made to 0.0.0.0 (accept connection to any address)
sed -i 's/bind-address            = 127.0.0.1/bind-address = 0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

# create the database if not exist
mysql -u root -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;"

# create the user if not exist
mysql -u root -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"

# grant all prd database to the user
mysql -u root -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';"

# this commandiaDB server to reload the grant tables and update its internal data structures with the current contents of the grant tables.
mysql -u root -e "FLUSH PRIVILEGES;"

# set the password to the root
mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOTPASS';"

# killing the porcess of mysqld to not restarting while waiting the wordpress to get setup
kill `cat /var/run/mysqld/mysqld.pid`

exec "$@"

# # else
#     # kill `cat /var/run/mysqld/mysqld.pid`
# fi

# if [ ! -d "/var/lib/mysql/$USER_DATABASE" ];then
# mysql -u root -e "CREATE DATABASE IF NOT EXISTS $USER_DATABASE;"
# mysql -u root -e "CREATE USER IF NOT EXISTS  '$USER_WP'@'%' IDENTIFIED BY '$USER_PASSWORD';"
# mysql -u root -e "GRANT ALL PRIVILEGES ON $USER_DATABASE.* TO '$USER_WP'@'%' IDENTIFIED BY '$USER_PASSWORD';"
# # mysql -u root -e  "CREATE USER '$MYSQL_ROOT'@'%' IDENTIFIED BY '$MYSQL_ROOTPASS';"
# mysql -u root -e "FLUSH PRIVILEGES;" 
# service mysql stop
# fi

# kill cat /var/run/mysqld/mysqld.pid
#     # service  mysql stop 
