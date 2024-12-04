# syntax=docker/dockerfile:1@sha256:db1ff77fb637a5955317c7a3a62540196396d565f3dd5742e76dddbb6d75c4c5
FROM lscr.io/linuxserver/radarr:latest@sha256:2e37ae0af799e01f413a97ee82c7e581a5b635816df0380889bc65d554dbeb17 as radarr
COPY certs /usr/share/ca-certificates
LABEL com.centurylinklabs.watchtower.enable="true"
RUN update-ca-certificates

FROM lscr.io/linuxserver/sonarr:latest@sha256:f1b771bf5f911ddb11aa86170ae27fab5ccde7d4671edcde6a3b264af8662945 as sonarr
COPY certs /usr/share/ca-certificates
LABEL com.centurylinklabs.watchtower.enable="true"
RUN update-ca-certificates

FROM linuxserver/sabnzbd:latest@sha256:1d31c01bb765cfbbe916b418b336223b07541e50065e6b4284f5ffb8ea452d12 as sabnzbd
COPY certs /usr/share/ca-certificates
LABEL com.centurylinklabs.watchtower.enable="true"
RUN update-ca-certificates

FROM adguard/adguardhome:latest@sha256:ec59d9d8d083b74620f827879bee7ad88621f96bc0c4347c84c176ffa349484c as adguard
COPY certs /usr/share/ca-certificates
LABEL com.centurylinklabs.watchtower.enable="true"
RUN update-ca-certificates

FROM gitea/gitea:latest@sha256:fe3b87545b0c703edc06de2315d490697e149d89f5bf8780f00173a5e8f254f2 as gitea
COPY certs /usr/share/ca-certificates
LABEL com.centurylinklabs.watchtower.enable="true"
RUN update-ca-certificates

FROM registry:latest@sha256:543dade69668e02e5768d7ea2b0aa4fae6aa7384c9a5a8dbecc2be5136079ddb as registry
COPY certs /usr/share/ca-certificates
LABEL com.centurylinklabs.watchtower.enable="true"
RUN update-ca-certificates

FROM python:latest@sha256:e95be020750503923c5d4f51a56ab8f5b21e40cdce66fb7000e270df68d04f8e as gitea-mirror

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
