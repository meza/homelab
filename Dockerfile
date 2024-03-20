FROM lscr.io/linuxserver/radarr:latest@sha256:d5cd4924a8806c5dac024b018ad902d4e426fbab7f72c53e06e448207d9f4bd1 as radarr
COPY certs /usr/share/ca-certificates
LABEL com.centurylinklabs.watchtower.enable="true"
RUN update-ca-certificates

FROM lscr.io/linuxserver/sonarr:latest@sha256:29fc87e914b8e288651271e2ba304bbdf2b2e7d2b3cbe700345c997d0e90a821 as sonarr
COPY certs /usr/share/ca-certificates
LABEL com.centurylinklabs.watchtower.enable="true"
RUN update-ca-certificates

FROM linuxserver/sabnzbd:latest@sha256:62f8f7ff234da814bf361b5587bd0c9d9edcfb5c9597f069aff56d5f73d212a6 as sabnzbd
COPY certs /usr/share/ca-certificates
LABEL com.centurylinklabs.watchtower.enable="true"
RUN update-ca-certificates

FROM adguard/adguardhome:latest@sha256:9bcf15ca5d860c58dbe8c7f175d16291bf0ddc9621645facdd91d5253ab8ce46 as adguard
COPY certs /usr/share/ca-certificates
LABEL com.centurylinklabs.watchtower.enable="true"
RUN update-ca-certificates

FROM gitea/gitea:latest@sha256:76d2105926379d9e90c5cea897ddcfd449bdc9564d4d4bbcf809dfc619f1dfda as gitea
COPY certs /usr/share/ca-certificates
LABEL com.centurylinklabs.watchtower.enable="true"
RUN update-ca-certificates
