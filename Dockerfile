FROM adoptopenjdk/openjdk8:jdk8u212-b03-slim

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

