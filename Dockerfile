FROM lscr.io/linuxserver/radarr:latest@sha256:122cb0e9104f5b29b48a2578e0ad02ad82c8b8568b8bc5154eb6e360f4e72799 as radarr
COPY certs /usr/share/ca-certificates
LABEL com.centurylinklabs.watchtower.enable="true"
RUN update-ca-certificates

FROM lscr.io/linuxserver/sonarr:latest@sha256:24b7f3f1c9ed065adc3ca7c5440944560b010a38e9bfcb7c1d8e9c965cbc8ea8 as sonarr
COPY certs /usr/share/ca-certificates
LABEL com.centurylinklabs.watchtower.enable="true"
RUN update-ca-certificates

FROM linuxserver/sabnzbd:latest@sha256:7f707fa297fa0151857d5899dbbda02130da7c85b26454f563caf1a3f7eccff2 as sabnzbd
COPY certs /usr/share/ca-certificates
LABEL com.centurylinklabs.watchtower.enable="true"
RUN update-ca-certificates

FROM adguard/adguardhome:latest@sha256:9bcf15ca5d860c58dbe8c7f175d16291bf0ddc9621645facdd91d5253ab8ce46 as adguard
COPY certs /usr/share/ca-certificates
LABEL com.centurylinklabs.watchtower.enable="true"
RUN update-ca-certificates

FROM gitea/gitea:latest@sha256:8e43a60b211bf01f7819ff6be8bf4f48081086b02098a5d8152d12a6339d1eb3 as gitea
COPY certs /usr/share/ca-certificates
LABEL com.centurylinklabs.watchtower.enable="true"
RUN update-ca-certificates
