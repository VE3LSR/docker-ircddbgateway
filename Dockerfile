FROM ubuntu:xenial
MAINTAINER projects@ve3lsr.ca

RUN apt-get update && apt-get install -yq libwxgtk3.0 wget && apt-get clean && rm -rf /var/lib/apt/lists/* /var/tmp/* /tmp/*

# Add the linbpq file
ADD ircddbgatewayd /usr/local/bin
ADD opendv /usr/share/
ADD https://raw.githubusercontent.com/dl5di/OpenDV/master/ircDDBGateway/Data/CCS_Hosts.txt /root

ENTRYPOINT /usr/local/bin/ircddbgatewayd -confdir /etc/ircddbgateway
