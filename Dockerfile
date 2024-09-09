# syntax=docker/dockerfile:1@sha256:fe40cf4e92cd0c467be2cfc30657a680ae2398318afd50b0c80585784c604f28
FROM lscr.io/linuxserver/radarr:latest@sha256:5ab12592e768d04d94bc04877bee194f372ea3946abc6de689311f4d8559ee2f as radarr
COPY certs /usr/share/ca-certificates
LABEL com.centurylinklabs.watchtower.enable="true"
RUN update-ca-certificates

FROM lscr.io/linuxserver/sonarr:latest@sha256:138998077a802c18b76c26636301fcd5517b7bfaf75db025d457199176078a12 as sonarr
COPY certs /usr/share/ca-certificates
LABEL com.centurylinklabs.watchtower.enable="true"
RUN update-ca-certificates

FROM linuxserver/sabnzbd:latest@sha256:66576a72ecb80c8d9e8ebffd4699995b29bfff4aefba4c6eae14baac3cbf6716 as sabnzbd
COPY certs /usr/share/ca-certificates
LABEL com.centurylinklabs.watchtower.enable="true"
RUN update-ca-certificates

FROM adguard/adguardhome:latest@sha256:d16cc7517ab96f843e7f8bf8826402dba98f5e6b175858920296243332391589 as adguard
COPY certs /usr/share/ca-certificates
LABEL com.centurylinklabs.watchtower.enable="true"
RUN update-ca-certificates

FROM gitea/gitea:latest@sha256:f4740095d43d8af73ac5d96eec83d4a795023f221aa3de854455c43e86c1b06b as gitea
COPY certs /usr/share/ca-certificates
LABEL com.centurylinklabs.watchtower.enable="true"
RUN update-ca-certificates

FROM registry:latest@sha256:ac0192b549007e22998eb74e8d8488dcfe70f1489520c3b144a6047ac5efbe90 as registry
COPY certs /usr/share/ca-certificates
LABEL com.centurylinklabs.watchtower.enable="true"
RUN update-ca-certificates

FROM python:latest@sha256:fcad5ffb670a9f1edc5cc232b2b321e617aaaae1a22c54242964178e408e0057 as gitea-mirror

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
