#!/bin/bash
tail -F /var/log/httpd/* &
exec httpd -D FOREGROUND &
exec /usr/bin/mysqld_safe &
exec sleep 10s
exec echo "CREATE database deepskylog;" | mysql &
exec mysql deepskylog < /www.deepskylog.org.sql
exec rm /www.deepskylog.org.sql

