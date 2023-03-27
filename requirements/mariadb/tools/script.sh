#!/bin/bash
#service mysql status
service mysql start
mysql -u root < /tmp/setup.sql

exec "$@"

