#!/bin/bash
tail -F /var/log/httpd/* &
exec httpd -D FOREGROUND &
exec /usr/bin/mysqld_safe
