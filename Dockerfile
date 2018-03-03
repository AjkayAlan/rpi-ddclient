FROM resin/rpi-raspbian:stretch
LABEL maintainer="github.com/AjkayAlan"

USER root

# Install ddclient
RUN apt-get update \
    && apt-get install -y ddclient libio-socket-ssl-perl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY ddclient.conf /etc/ddclient.conf

# Use ddclient
CMD ["/usr/sbin/ddclient","-foreground"]
