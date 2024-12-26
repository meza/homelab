# syntax=docker/dockerfile:1@sha256:93bfd3b68c109427185cd78b4779fc82b484b0b7618e36d0f104d4d801e66d25
FROM lscr.io/linuxserver/radarr:latest@sha256:0068f9fa55cdf8b72b831b8fd56e9e94cf1de969cfa1f58f7ba11ee3619eaf65 as radarr
COPY certs /usr/share/ca-certificates
LABEL com.centurylinklabs.watchtower.enable="true"
RUN update-ca-certificates

FROM lscr.io/linuxserver/sonarr:latest@sha256:b466acde22d18859336e790af23c0b56d9dbb7199935b226b3139bf416fe7e1c as sonarr
COPY certs /usr/share/ca-certificates
LABEL com.centurylinklabs.watchtower.enable="true"
RUN update-ca-certificates

FROM linuxserver/sabnzbd:latest@sha256:76a15e85e391eb2702ac1c6ccd90fc7b7546913065c1504f708ce9bf863aedbf as sabnzbd
COPY certs /usr/share/ca-certificates
LABEL com.centurylinklabs.watchtower.enable="true"
RUN update-ca-certificates

FROM adguard/adguardhome:latest@sha256:2979cc78a28aceb77f90980a5440578dbb7bc406dffe261e9ae402750193bde0 as adguard
COPY certs /usr/share/ca-certificates
LABEL com.centurylinklabs.watchtower.enable="true"
RUN update-ca-certificates

FROM gitea/gitea:latest@sha256:538658de667c5d098a274f2f63aa6ec891d88f670cdd5282cf27221ba747dda4 as gitea
COPY certs /usr/share/ca-certificates
LABEL com.centurylinklabs.watchtower.enable="true"
RUN update-ca-certificates

FROM registry:latest@sha256:543dade69668e02e5768d7ea2b0aa4fae6aa7384c9a5a8dbecc2be5136079ddb as registry
COPY certs /usr/share/ca-certificates
LABEL com.centurylinklabs.watchtower.enable="true"
RUN update-ca-certificates

FROM python:latest@sha256:cea505b81701dd9e46b8dde96eaa8054c4bd2035dbb660edeb7af947ed38a0ad as gitea-mirror

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
