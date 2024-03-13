FROM lscr.io/linuxserver/radarr:latest@sha256:ea775bc8c1911ff5b51c6a1199c266032e6fd406d28199b2f188b6073c6b1c64 as radarr
COPY certs /usr/share/ca-certificates
LABEL com.centurylinklabs.watchtower.enable="true"
RUN update-ca-certificates

FROM lscr.io/linuxserver/sonarr:latest@sha256:86122cfebc3bdb59cc9c49e531bc79bf26e8f6aec2df2172c9aadb09f3d589b0 as sonarr
COPY certs /usr/share/ca-certificates
LABEL com.centurylinklabs.watchtower.enable="true"
RUN update-ca-certificates

FROM linuxserver/sabnzbd:latest@sha256:e211fb0366a98952dd8befd92184a2a37b7a4c2c1652ee1d91f7fa2487151b5a as sabnzbd
COPY certs /usr/share/ca-certificates
LABEL com.centurylinklabs.watchtower.enable="true"
RUN update-ca-certificates

FROM adguard/adguardhome:latest@sha256:52a9c2e7b4c56e5f08e1b2f3196d500c931adadc8917712ff9ef9ea922c030fe as adguard
COPY certs /usr/share/ca-certificates
LABEL com.centurylinklabs.watchtower.enable="true"
RUN update-ca-certificates

FROM gitea/gitea:latest@sha256:76d2105926379d9e90c5cea897ddcfd449bdc9564d4d4bbcf809dfc619f1dfda as gitea
COPY certs /usr/share/ca-certificates
LABEL com.centurylinklabs.watchtower.enable="true"
RUN update-ca-certificates
