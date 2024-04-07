#
# Build: docker build -t t/ubuntu:mate-vnc
# Run:
#   docker run -d --name=ubuntu-mate -p 5900:5900 t/ubuntu:mate-vnc
#
# Connect to ubuntu-mate:
#     vncviewer ${HOST_IP}:5900
#

FROM ubuntu:20.04

ENV REFRESHED_AT 2024-03-28

RUN apt-get update -qq

# Using apt-cacher-ng proxy for caching deb package
RUN echo 'Acquire::http::Proxy "http://172.17.0.1:3142";' > /etc/apt/apt.conf.d/01proxy

# Make the "en_US.UTF-8" locale
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y locales \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends software-properties-common
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y ubuntu-mate-core

# Install vnc server
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tightvncserver expect

# Install firefox, vim
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends firefox vim

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y caja-open-terminal
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y default-jre
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y fonts-noto-cjk
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y ffmpeg

# Define working directory
WORKDIR /data

ENV USER root

# Expose ports
EXPOSE 5900

COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

# Define default command
CMD ["vncserver", ":1", "-geometry", "1366x768", "-depth", "24", "-rfbport", "5900"]
