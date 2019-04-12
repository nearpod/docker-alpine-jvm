FROM adoptopenjdk/openjdk8:jdk8u202-b08-alpine

MAINTAINER dockerfiles@nearpod.com

WORKDIR /usr/local

ENV LANG="C.UTF-8"

ENV PATH=$PATH:$JAVA_HOME/bin

RUN set -ex; \
    WORKDIR=$PWD; \
    apk --no-cache add ca-certificates curl bash; \
    update-ca-certificates; \
    rm -rf /var/lib/{apt,dpkg,cache,log}/ /tmp/* /var/tmp/*; \
    java -version

