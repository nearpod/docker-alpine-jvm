FROM frolvlad/alpine-glibc:alpine-3.6

MAINTAINER dockerfiles@nearpod.com

WORKDIR /usr/local

ENV LANG="C.UTF-8"

ARG ZULU_ARCH=zulu8.23.0.3-jdk8.0.144-linux_x64
ARG JAVA_HOME=/usr/local/lib/jvm/$ZULU_ARCH
ENV JAVA_HOME=$JAVA_HOME
ENV PATH=$PATH:$JAVA_HOME/bin

RUN set -ex; \
    WORKDIR=$PWD; \
    apk --no-cache --update add ca-certificates curl bash; \
    mkdir -p "$JAVA_HOME"; \
    curl -SLs -q "http://cdn.azul.com/zulu/bin/${ZULU_ARCH}.tar.gz" | tar -xzf - --strip-components=1 -C "$JAVA_HOME"; \
    rm -rf "$JAVA_HOME/demo" "$JAVA_HOME/man" "$JAVA_HOME/sample" "$JAVA_HOME/src.zip";
