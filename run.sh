#! /bin/bash

echo "Starting up mysqld"
if [ "`ls -A /var/lib/mysql`" == "" ]; then
	mysqld --initialize-insecure --user=mysql
	/usr/sbin/mysqld &
	sleep 2s
	mysql -e "grant all privileges on *.* to '${MYSQL_USER}'@'%' identified by '${MYSQL_PASS}';"
	mysql -e "grant all privileges on *.* to 'root'@'%' identified by '${MYSQL_USER}';"
	
	if [ ! -d /var/lib/mysql/${DB_NAME} ]; then
		if [ -f ${SQL_FILE} ]; then
			echo "Creating database ${DB_NAME}"
			mysql -e "create database ${DB_NAME}; use ${DB_NAME}; source ${SQL_FILE};"
		fi
	fi
	
	/usr/bin/mysqladmin -u root -p shutdown
	sleep 2
	echo "Restarting"
fi
/usr/sbin/mysqld
