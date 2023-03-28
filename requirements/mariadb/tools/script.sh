#!/bin/bash

service mysql start
mysql -u root < /tmp/setup.sql
exec "$@"

