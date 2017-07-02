#
# Author: Cuong Tran
#
# Build: docker build -t cuongtransc/ubuntu:mate-vnc
# Run:
#   docker run -d --name=ubuntu-mate -p 5900:5900 cuongtransc/ubuntu:mate-vnc
#
# Connect to ubuntu-mate:
#     vncviewer ${HOST_IP}:5900
#

# FROM ubuntu:14.04
FROM ubuntu:16.04
MAINTAINER Cuong Tran "cuongtransc@gmail.com"

ENV REFRESHED_AT 2017-05-01

RUN apt-get update -qq

# Using apt-cacher-ng proxy for caching deb package
RUN echo 'Acquire::http::Proxy "http://172.17.0.1:3142/";' > /etc/apt/apt.conf.d/01proxy

# Make the "en_US.UTF-8" locale
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y locales \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y software-properties-common

# install ubuntu-mate-core
RUN apt-add-repository -y ppa:ubuntu-mate-dev/ppa \
    && apt-add-repository -y ppa:ubuntu-mate-dev/trusty-mate \
    && apt-get update -qq

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends ubuntu-mate-core

# install vnc server
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y tightvncserver expect

# install firefox, vim
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y firefox vim

# Define working directory
WORKDIR /data

ENV USER root

# Expose ports
EXPOSE 5900

COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

# Define default command
CMD ["vncserver", ":1", "-geometry", "1000x700", "-depth", "24", "-rfbport", "5900"]

