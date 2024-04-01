FROM lscr.io/linuxserver/radarr:latest@sha256:122cb0e9104f5b29b48a2578e0ad02ad82c8b8568b8bc5154eb6e360f4e72799 as radarr
COPY certs /usr/share/ca-certificates
LABEL com.centurylinklabs.watchtower.enable="true"
RUN update-ca-certificates

FROM lscr.io/linuxserver/sonarr:latest@sha256:f11f32d67bb7ef20333e22546b04a244e4e8172cb9744b026381cf898a1f2ece as sonarr
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
