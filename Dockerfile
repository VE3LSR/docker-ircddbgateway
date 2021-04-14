FROM debian:buster-slim as builder
MAINTAINER projects@ve3lsr.ca

RUN apt-get update && apt-get install -y --no-install-recommends \
            git \
            build-essential \
            pkg-config \
            libusb-1.0-0-dev \
            libwxgtk3.0-dev \
            libasound2-dev \
            debhelper \
            autotools-dev \
            ca-certificates \
         && apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/*

WORKDIR /opt/

RUN git clone --depth 1 https://github.com/g4klx/ircDDBGateway.git

WORKDIR /opt/ircDDBGateway

RUN make

FROM debian:buster-slim
MAINTAINER projects@ve3lsr.ca

RUN apt-get update && apt-get install -y --no-install-recommends \
            libwxgtk3.0 \
            wget \
            cron \
         && apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/*

# Add the linbpq file
COPY --from=builder /opt/ircDDBGateway/ircDDBGateway/ircddbgatewayd /usr/local/bin/
COPY --from=builder /opt/ircDDBGateway/RemoteControl/remotecontrold /usr/local/bin/
COPY --from=builder /opt/ircDDBGateway/Data /usr/share/ircddbgateway/

ENTRYPOINT /usr/local/bin/ircddbgatewayd -confdir /etc/ircddbgateway -logdir /var/log/ircddbgateway -debug
