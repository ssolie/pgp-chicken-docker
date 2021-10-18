#
# Dockerfile to create pgp-chicken image.
#

FROM debian:buster

LABEL maintainer="Steven Solie <steven@solie.ca>"

COPY pgp263ii/src /root/pgp263i
COPY install.sh /root
COPY install-pgp.sh /root
COPY beta4ups.asc /root

WORKDIR /root

#
# Perform all the steps in a single RUN to avoid creating file system layers.
#
RUN apt-get update && apt-get upgrade --yes && \
  apt-get install -y \
    make \
    gcc \
    expect \
  && \
  make -C pgp263i linux && \
  mv pgp263i/pgp . && \
  rm -r pgp263i && \
  mkdir .pgp && \
  ./install.sh && \
  apt-get --assume-yes purge \
    make \
    gcc \
    expect && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*
