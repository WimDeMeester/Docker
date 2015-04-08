FROM ringo/scientific:6.5
MAINTAINER Wim De Meester <deepskywim@gmail.com>

# Update all packages
RUN yum -y update

# Update to Scientific Linux 6.6
RUN yum -y install yum-conf-sl6x
RUN yum -y upgrade

# Install apache
RUN yum -y install httpd

# Install mysql
#RUN yum -y install mysql

# TODO: INSTALL php
