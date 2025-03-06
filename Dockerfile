# syntax=docker/dockerfile:1@sha256:93bfd3b68c109427185cd78b4779fc82b484b0b7618e36d0f104d4d801e66d25
FROM lscr.io/linuxserver/radarr:latest@sha256:0a8020afc5e3dcad1413ba125a980729a2b16ff0d88d108b3e1779111ef1c896 as radarr
COPY certs /usr/share/ca-certificates
LABEL com.centurylinklabs.watchtower.enable="true"
RUN update-ca-certificates

FROM lscr.io/linuxserver/sonarr:latest@sha256:4dfedb2598dc6bd51c40f4ecea2631dbe367840678ab109cd968f821d81a5327 as sonarr
COPY certs /usr/share/ca-certificates
LABEL com.centurylinklabs.watchtower.enable="true"
RUN update-ca-certificates

FROM linuxserver/sabnzbd:latest@sha256:c74f6a81b2730f9a16742ce8cb18553324473f6bb31d2a5258a25f0e00c2f217 as sabnzbd
COPY certs /usr/share/ca-certificates
LABEL com.centurylinklabs.watchtower.enable="true"
RUN update-ca-certificates

FROM adguard/adguardhome:latest@sha256:5c536c1e25f76693ae7ee5e64e8a029893e0f3f1778c8d2a9581383e60cfa9b9 as adguard
COPY certs /usr/share/ca-certificates
LABEL com.centurylinklabs.watchtower.enable="true"
RUN update-ca-certificates

FROM gitea/gitea:latest@sha256:5e55d8fd0622cf70425e4bb874f07f1b340fb53782901a2cc66da1a8b0f1de23 as gitea
COPY certs /usr/share/ca-certificates
LABEL com.centurylinklabs.watchtower.enable="true"
RUN update-ca-certificates

FROM registry:latest@sha256:a3d8aaa63ed8681a604f1dea0aa03f100d5895b6a58ace528858a7b332415373 as registry
COPY certs /usr/share/ca-certificates
LABEL com.centurylinklabs.watchtower.enable="true"
RUN update-ca-certificates

FROM python:latest@sha256:385ccb8304f6330738a6d9e6fa0bd7608e006da7e15bc52b33b0398e1ba4a15b as gitea-mirror

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
