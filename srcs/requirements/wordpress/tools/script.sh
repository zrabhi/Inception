#!/bin/bash
# wp-cli



if [  -f "/var/www/html/wp-config.php" ]; then
    echo "wp exist"
else
# # curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

chmod -R 777 /var/www/html/
# wp --allow-root 
# Checks for WordPress updates via Version Check API.

# wp core <command> means : Downloads, installs, updates, and manages a WordPress installation.
# wp core check-update
cd  /var/www/html/
wp core download --allow-root
#
# rm wp-config-sample.php
# touch ls


wp config create --allow-root --url=$URL --dbhost=$DATABASE_HOST --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --skip-check
wp core install --allow-root --url=$URL --title=$TITLE --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL --skip-email
wp user create --allow-root $AUTHOR $AUTHOR_EMAIL --user_pass=$AUTHOR_PASSWORD --role=author


# # create second user in wordpress


## install theme
wp --allow-root theme install zeever --activate 

wp plugin update --all --allow-root

wp plugin install redis-cache --activate --allow-root


wp redis enable --allow-root
# change is modifying the unix socket used for the connection of PHP-FPM with the web server,
# from the default /run/php/php7.3-fpm.sock to TCP/IP port 9000 .


wp config set WP_CACHE 'true' --allow-root
# # set Hostname of redis container
wp config set WP_REDIS_HOST 'redis' --allow-root

# # set The Port of Redis, This command is also assuming that Redis is running and listen on port 6379,
wp config set WP_REDIS_PORT '6379' --allow-root

# give users and groups access to "/var/www/html/ "
chown -R www-data:www-data /var/www/html/



# wp redis enable --allow-root

# # enable the plugin of redis-cache 
sed -i 's|listen = /run/php/php7.3-fpm.sock|listen = 0.0.0.0:9000|g' /etc/php/7.3/fpm/pool.d/www.conf

# sed -i 's/.*listen = \/run\/php\/php7.3-fpm.sock*./listen = 9000\n/' /etc/php/7.3/fpm/pool.d/www.conf
fi
exec "$@"
