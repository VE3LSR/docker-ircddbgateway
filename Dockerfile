FROM ubuntu:xenial
MAINTAINER projects@ve3lsr.ca

RUN apt-get update && apt-get install -yq libwxgtk3.0 wget && apt-get clean && rm -rf /var/lib/apt/lists/* /var/tmp/* /tmp/*

# Add the linbpq file
ADD ircddbgatewayd /usr/local/bin
ADD Data/* /usr/share/ircddbgateway/

ENTRYPOINT /usr/local/bin/ircddbgatewayd -confdir /etc/ircddbgateway -logdir /var/log/ircddbgateway -debug

