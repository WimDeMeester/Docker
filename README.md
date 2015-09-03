# Docker
The Docker scripts to create the DeepskyLog Docker image.

## Install docker
Docker can be easily installed on Linux machines. On Mac or Windows, download [docker Toolbox](https://www.docker.com/toolbox/)
Before executing the following commands, install Docker Toolbox on your Mac or Windows machine.

## Making the mysql Data Volume container
`docker build -t="mysql:v5.0" mysql-container`

## Run the Data Volume container
`docker run -d --name mysql mysql:v5.0 tail -f /dev/null`

## Making the docker container
`docker build -t deepskylog:v5.0 .`

## Running the docker container
`docker run -v /Users/wim/sourcecode/deepskylog/trunk:/var/www/html --volumes-from mysql -t -p 80:80 -p 3306:3306 deepskylog:v5.0`

Change `/Users/wim/sourcecode/deepskylog/trunk` with the location of the DeepskyLog source code.

## Save the state of the docker container
From time to time, you want to save the state of the container. Possible reasons are:

+ There are some Scientific Linux updates that are installed every time.
+ You changed some things in the database and you want to have these changes available next time your start up the container.

The command to save the state is:

    docker commit `docker ps | grep deepskylog | awk '{print $1;}'` deepskylog:v5.0


## Find out the IP address of the webserver for DeepskyLog
* Mac: `docker-machine ip default` (returns 192.168.99.100)
* Windows: `docker-machine.exe ip default`
* Linux: You should just use `localhost`. Make sure that apache and mysql are not running on your computer.

## Make DeepskyLog work with the docker containers

In `lib/setup/`, copy the file `databaseInfo.php.dist` to `databaseInfo.php` and enter the correct ip address in the following line:

`$baseURL      = "http://192.168.59.103/";`

## Dump the database (only on Linux)
This can be used to update the database which is added to the Docker image.
`mysqldump -p -u admin -h 192.168.122.1 deepskylog > www.deepskylog.org.sql`

## Some interesting docker commands
`docker ps` shows the running docker .
`docker stop` stops a running docker container (add the container id)
`docker rm -v mysql` removes the mysql Volume container. You can start a new one.
