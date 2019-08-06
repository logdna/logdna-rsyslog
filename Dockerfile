FROM alpine:3.10
LABEL maintainer="help@logdna.com"
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories \
    && apk --no-cache update  \
    && apk add --no-cache \
       rsyslog \
       rsyslog-http \
    && rm -rf /var/cache/apk/*
