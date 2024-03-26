FROM lscr.io/linuxserver/radarr:latest@sha256:6c10e1133bc42649de220fa9e04e4c7bbe5ba4161a275ac1494f2bfd45417507 as radarr
COPY certs /usr/share/ca-certificates
LABEL com.centurylinklabs.watchtower.enable="true"
RUN update-ca-certificates

FROM lscr.io/linuxserver/sonarr:latest@sha256:29fc87e914b8e288651271e2ba304bbdf2b2e7d2b3cbe700345c997d0e90a821 as sonarr
COPY certs /usr/share/ca-certificates
LABEL com.centurylinklabs.watchtower.enable="true"
RUN update-ca-certificates

FROM linuxserver/sabnzbd:latest@sha256:0252a6a90048ec8efdbb2fa20d250ec38bb9446a9d8bd25b3c4921895fa15cf8 as sabnzbd
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
