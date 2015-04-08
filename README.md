# Docker
The Docker scripts to create the DeepskyLog Docker image.

## Making the docker container
`docker build -t deepskylog .`

## Running the docker container
docker run -v /Users/wim/sourcecode/deepskylog/trunk:/var/www/html -t -p 80:80 deepskylog
