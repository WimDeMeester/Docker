#!/bin/bash
tail -F /var/log/httpd/* &
mysql_install_db
/usr/bin/mysqld_safe &
sleep 10s
echo "CREATE database deepskylog;" | mysql 
mysql deepskylog < /www.deepskylog.org.sql 
rm /www.deepskylog.org.sql 

# TODO: Execute database update scripts

exec httpd -D FOREGROUND 
