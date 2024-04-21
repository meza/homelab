FROM lscr.io/linuxserver/radarr:latest@sha256:de7e51182113b430d9b6cb93ebc3389e1c73f11e7eabf47d0af5de106cdc296a as radarr
COPY certs /usr/share/ca-certificates
LABEL com.centurylinklabs.watchtower.enable="true"
RUN update-ca-certificates

FROM lscr.io/linuxserver/sonarr:latest@sha256:58fca88cafda8915f45b780124c767d5b63b7a1194d4781edc8c4b7fb0d6e9c3 as sonarr
COPY certs /usr/share/ca-certificates
LABEL com.centurylinklabs.watchtower.enable="true"
RUN update-ca-certificates

FROM linuxserver/sabnzbd:latest@sha256:9d7c22bb7936fbf96a164f8d4ad50c165d1cbb83adba84f4971ab5f21dd79a93 as sabnzbd
COPY certs /usr/share/ca-certificates
LABEL com.centurylinklabs.watchtower.enable="true"
RUN update-ca-certificates

FROM adguard/adguardhome:latest@sha256:d0fcf8c8691df20fe1a280d0a4cbc8493b04c7bd8cf8ca56264279510f030e49 as adguard
COPY certs /usr/share/ca-certificates
LABEL com.centurylinklabs.watchtower.enable="true"
RUN update-ca-certificates

FROM gitea/gitea:latest@sha256:0056032dc8c6ab70583e4a105b9ee0dc72dce4f4fbc8022c98bcec46b0273883 as gitea
COPY certs /usr/share/ca-certificates
LABEL com.centurylinklabs.watchtower.enable="true"
RUN update-ca-certificates

FROM registry:latest@sha256:fb9c9aef62af3955f6014613456551c92e88a67dcf1fc51f5f91bcbd1832813f as registry
COPY certs /usr/share/ca-certificates
LABEL com.centurylinklabs.watchtower.enable="true"
RUN update-ca-certificates

FROM python:latest as gitea-mirror

ENV VIRTUAL_ENV=/opt/venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

RUN python3 -m venv $VIRTUAL_ENV \
    && pip3 install "PyGithub" \
    && mkdir -p /config \
    && mkdir -p /app

VOLUME /config

COPY files/gitea-mirror/entrypoint.sh /entrypoint.sh
ADD https://github.com/varunsridharan/github-gitea-mirror.git#main /app
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
