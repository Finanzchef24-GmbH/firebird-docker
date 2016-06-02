#Base file from https://github.com/jacobalberty/firebird-docker/blob/19cbe776d931767ddb35762a02421408582e0264/3.0/Dockerfile
FROM debian:jessie
MAINTAINER Vlad Barboni <vlad.barboni@finanzchef24.de>

ENV PREFIX=/usr/local/firebird
ENV DEBIAN_FRONTEND noninteractive
ENV FBURL=http://downloads.sourceforge.net/project/firebird/firebird/3.0-Release/Firebird-3.0.0.32483-0.tar.bz2

ADD build.sh ./build.sh

RUN ./build.sh && \
    rm -f ./build.sh

ADD firebird.conf /var/firebird/etc/firebird.conf

VOLUME ["/databases", "/var/firebird/run", "/var/firebird/log", "/var/firebird/system", "/tmp/firebird"]

EXPOSE 3050/tcp

ENTRYPOINT ["/usr/local/firebird/bin/fbguard"]