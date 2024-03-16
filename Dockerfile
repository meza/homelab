FROM lscr.io/linuxserver/radarr:latest@sha256:ea775bc8c1911ff5b51c6a1199c266032e6fd406d28199b2f188b6073c6b1c64 as radarr
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

FROM adguard/adguardhome:latest@sha256:52a9c2e7b4c56e5f08e1b2f3196d500c931adadc8917712ff9ef9ea922c030fe as adguard
COPY certs /usr/share/ca-certificates
LABEL com.centurylinklabs.watchtower.enable="true"
RUN update-ca-certificates

FROM gitea/gitea:latest@sha256:76d2105926379d9e90c5cea897ddcfd449bdc9564d4d4bbcf809dfc619f1dfda as gitea
COPY certs /usr/share/ca-certificates
LABEL com.centurylinklabs.watchtower.enable="true"
RUN update-ca-certificates
