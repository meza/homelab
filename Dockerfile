FROM lscr.io/linuxserver/radarr:latest@sha256:122cb0e9104f5b29b48a2578e0ad02ad82c8b8568b8bc5154eb6e360f4e72799 as radarr
COPY certs /usr/share/ca-certificates
LABEL com.centurylinklabs.watchtower.enable="true"
RUN update-ca-certificates

FROM lscr.io/linuxserver/sonarr:latest@sha256:f11f32d67bb7ef20333e22546b04a244e4e8172cb9744b026381cf898a1f2ece as sonarr
COPY certs /usr/share/ca-certificates
LABEL com.centurylinklabs.watchtower.enable="true"
RUN update-ca-certificates

FROM linuxserver/sabnzbd:latest@sha256:5b8d05994df326db82f744469e4321d1b9f4feb52f5d217c06ad384d5c8377e2 as sabnzbd
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
