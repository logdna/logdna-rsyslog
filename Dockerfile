FROM alpine:3.10
LABEL maintainer="help@logdna.com"
RUN apk --no-cache update  \
    && apk add --no-cache \
       rsyslog-tls \
    # Use experimental repo that supports rsyslog-http (not compatible with rsyslog-tls)
    && echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories \
    && apk --no-cache update  \
       rsyslog \
       rsyslog-http \
    && rm -rf /var/cache/apk/*
