FROM lscr.io/linuxserver/radarr:latest@sha256:1afb332d12843163750a40a4e03b0a91b03db8831f9455cbb6fc06ebddbfa16e as radarr
COPY certs /usr/share/ca-certificates
LABEL com.centurylinklabs.watchtower.enable="true"
RUN update-ca-certificates

FROM lscr.io/linuxserver/sonarr:latest@sha256:7b0f3cd03b5cd606c7010557e36890b11f30c4ff1c683c07b60589b62e221d90 as sonarr
COPY certs /usr/share/ca-certificates
LABEL com.centurylinklabs.watchtower.enable="true"
RUN update-ca-certificates

FROM linuxserver/sabnzbd:latest@sha256:a051c4be8db68e7555aea3f3871f8f54f1f4c10692b381003a604c032310753a as sabnzbd
COPY certs /usr/share/ca-certificates
LABEL com.centurylinklabs.watchtower.enable="true"
RUN update-ca-certificates

FROM adguard/adguardhome:latest@sha256:d0fcf8c8691df20fe1a280d0a4cbc8493b04c7bd8cf8ca56264279510f030e49 as adguard
COPY certs /usr/share/ca-certificates
LABEL com.centurylinklabs.watchtower.enable="true"
RUN update-ca-certificates

FROM gitea/gitea:latest@sha256:8e43a60b211bf01f7819ff6be8bf4f48081086b02098a5d8152d12a6339d1eb3 as gitea
COPY certs /usr/share/ca-certificates
LABEL com.centurylinklabs.watchtower.enable="true"
RUN update-ca-certificates

FROM registry:latest@sha256:fb9c9aef62af3955f6014613456551c92e88a67dcf1fc51f5f91bcbd1832813f as registry
COPY certs /usr/share/ca-certificates
LABEL com.centurylinklabs.watchtower.enable="true"
RUN update-ca-certificates
