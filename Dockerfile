FROM adoptopenjdk/openjdk11:jdk-11.0.6_10-ubuntu-slim

MAINTAINER dockerfiles@nearpod.com

WORKDIR /usr/local

ENV LANG="C.UTF-8"

ENV PATH=$PATH:$JAVA_HOME/bin

RUN set -ex; \
    WORKDIR=$PWD; \
    apt-get update; \
    apt-get install -y apt-utils libtcnative-1; \
    update-ca-certificates; \
    apt-get clean; \
    rm -rf /var/lib/{apt/lists,cache,log}/* /tmp/* /var/tmp/*; \
    java -version

