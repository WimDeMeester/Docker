# Docker
The Docker scripts to create the DeepskyLog Docker image.

## Making the mysql Data Volume container
`docker build -t="mysql:v5.0" mysql-container`

## Run the Data Volume container
`docker run -d --name mysql mysql:v5.0 tail -f /dev/null`

## Making the docker container
`docker build -t deepskylog:v5.0 .`

## Running the docker container
`docker run -v /Users/wim/sourcecode/deepskylog/trunk:/var/www/html --volumes-from mysql -t -p 80:80 -p 3306:3306 deepskylog:v5.0`

## Find out the IP address of the webserver for DeepskyLog
* Mac: `boot2docker ip` (returns 192.168.59.103)


## Execute the database update scripts)
You only need to do this once. In your browser go to: http://192.168.59.103/scripts/updatev4.3-v5.0?.php
