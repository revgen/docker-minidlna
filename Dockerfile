FROM alpine:3.8

ARG NAME="rev9en/minidlna"
ARG VERSION="1.0.3"

LABEL version="${VERSION}"
LABEL description="Docker image with minidlna"
LABEL date="2019-03-23"
LABEL maintainer="Evgen Rusakov"
LABEL url.docker="https://hub.docker.com/r/rev9en/minidlna"
LABEL url.source="https://github.com/revgen/docker/docker-minidlna"

RUN apk --no-cache add minidlna && \
    mkdir -p /media/Music && \
    mkdir -p /media/Pictures && \
    mkdir -p /media/Video && \
    mkdir -p /media/Downloads

COPY ./entrypoint.sh /
COPY ./minidlna.conf /etc/

VOLUME [ "/media/Music", "/media/Pictures", "/media/Video", "/media/Downloads" ]
# ssdp port
EXPOSE 1900/udp
# trivnet1 port
EXPOSE 8200

ENTRYPOINT ["/entrypoint.sh"]
