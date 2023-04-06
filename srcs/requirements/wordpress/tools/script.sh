#!/bin/bash
# wp-cli

mkdir -p /run/php/
touch /run/php/php7.3-fpm.pid

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
    chown -R www-data:www-data /var/www/html/
    cd  /var/www/html/
    wp core download --allow-root
#
# rm wp-config-sample.php
# touch ls


wp config create --allow-root --url=localhost --dbhost=mariadb --dbname=$USER_DATABASE --dbuser=$USER_WP --dbpass=$USER_PASSWORD --skip-check
wp core install --allow-root --url=localhost --title=zrabhi --admin_user=zrabhi --admin_password=zrabhi --admin_email=zrabhi@example.com --skip-email
wp user create --allow-root avnn ann@exavmple.com --user_pass=Qwerty.123
# wp core --allow-root config --dbname='wordpress' --dbuser='zac' --dbpass='PASSzrabhi01' --dbhost='mariadb' --skip-check

# wp core install --url='localhost' --title='MY website' --admin_user='zac' --admin_password='PASSzac01' --admin_email='zac.rabhi12@gmail.com' --allow-root

# # create second user in wordpress
# wp user create $USER $USER_EMAIL --user_pass=$USER_PASSWORD --role='author' --allow-root


## install theme
wp theme install astra --activate --allow-root

# wp plugin install redis-cache --activate --allow-root

# wp plugin update --all --allow-root


# wp redis enable --allow-root
# change is modifying the unix socket used for the connection of PHP-FPM with the web server,
# from the default /run/php/php7.3-fpm.sock to TCP/IP port 9000 .

# wp config set FORCE_SSL_ADMIN 'false' --allow-root

# # set Hostname of redis container
# wp config set WP_REDIS_HOST 'redis' --allow-root

# # set The Port of Redis, This command is also assuming that Redis is running and listen on port 6379,
# wp config set WP_REDIS_PORT '6379' --allow-root

# # The instruction "wp config set WP_CACHE 'true'" is a command that sets the value of the WP_CACHE constant in the WordPress configuration file to "true".
# # This constant controls whether caching is enabled in WordPress or not.
# wp config set WP_CACHE 'true' --allow-root

# # instal the wordpress

# # install redi-cache plugin
# wp plugin install redis-cache --allow-root

# # activate the plugin of redis-cache
# wp plugin activate redis-cache --allow-root 

# # enable the plugin of redis-cache 
# wp redis enable --allow-root
sed -i 's|listen = /run/php/php7.3-fpm.sock|listen = 0.0.0.0:9000|g' /etc/php/7.3/fpm/pool.d/www.conf

# sed -i 's/.*listen = \/run\/php\/php7.3-fpm.sock*./listen = 9000\n/' /etc/php/7.3/fpm/pool.d/www.conf
fi
exec "$@"
