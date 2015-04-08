FROM ringo/scientific:6.5
MAINTAINER Wim De Meester <deepskywim@gmail.com>

# Update all packages
RUN yum -y update

# Update to Scientific Linux 6.6
RUN yum -y install yum-conf-sl6x
RUN yum -y upgrade

# Add epel repository
RUN cd /tmp
RUN wget http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
RUN rpm -ivh epel-release-6-8.noarch.rpm
RUN yum -y update

# Install apache
RUN yum -y install httpd

# Install mysql
#RUN yum -y install mysql

# TODO: INSTALL php
