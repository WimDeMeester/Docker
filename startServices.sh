#!/bin/bash
# Check if there is a network connection on the host machine.
SERVERIP=134.58.117.134

ping -c 3 $SERVERIP > /dev/null 2>&1
if [ $? -eq 0 ]
then
  yum -y update
fi

tail -F /var/log/httpd/error_log &
mysql_install_db &
/usr/bin/mysqld_safe &
sleep 10s
RESULT=`mysqlshow deepskylog | grep -o deepskylog`
if [ "$RESULT" != "deepskylog" ]; then
  echo "CREATE database deepskylog;" | mysql 
  mysql deepskylog < /www.deepskylog.org.sql 
  rm /www.deepskylog.org.sql 
fi

# Add an admin user
mysql -uroot -e "CREATE USER 'admin'@'%' IDENTIFIED BY 'deepskylog'"
mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' WITH GRANT OPTION"

exec httpd -D FOREGROUND 
