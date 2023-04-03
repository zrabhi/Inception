#!/bin/bash
# wp-cli

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar


chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

cd  /var/www/html

# wp --allow-root 
# Checks for WordPress updates via Version Check API.

# wp core <command> means : Downloads, installs, updates, and manages a WordPress installation.
# wp core check-update

wp core download --allow-root
#
chown -R www-data:www-data /var/www/html/
# rm wp-config-sample.php
# touch ls
wp core --allow-root config --dbname='wordpress' --dbuser='zac' --dbpass='password1' --dbhost='mariadb' --skip-check
# sed -i 's/.*listen = \/run\/php\/php7.3-fpm.sock*./listen = 9000\n/' /etc/php/7.3/fpm/pool.d/www.conf

exec "$@"