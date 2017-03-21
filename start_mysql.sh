#!/bin/bash

docker run -d -e MYSQL_USER=test -e MYSQL_PASS=password -e DB_NAME=test -e SQL_FILE=/opt/mysql/import.sql -p 3306:3306 -v /opt/mysql:/var/lib/mysql:rw  mysql:5.7
