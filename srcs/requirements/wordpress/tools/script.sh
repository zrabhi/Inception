#!/bin/bash
# wp-cli
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

cd  /var/www/html

# Checks for WordPress updates via Version Check API.

# wp core <command> means : Downloads, installs, updates, and manages a WordPress installation.
# wp core check-update

wp core download --allow-root

rm wp-config-sample.php
# touch ls

exec "$@"