FROM alpine:latest

ARG TARGETOS
ARG TARGETARCH

RUN apk update && apk add --no-cache supervisor && mkdir -p /opt/blackbox_exporter/etc

ADD build-dir/${TARGETOS}/${TARGETARCH}/blackbox_exporter /opt/blackbox_exporter/

ADD blackbox.yml /opt/blackbox_exporter/etc/blackbox.yml

ADD supervisord.conf /etc/supervisord.conf

ADD start-blackbox.sh /start-blackbox.sh

ADD start.sh /start.sh

RUN chmod +x /opt/blackbox_exporter/blackbox_exporter

EXPOSE 9115

WORKDIR /

CMD ["/bin/sh", "/start.sh"]
