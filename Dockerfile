FROM lscr.io/linuxserver/radarr:latest@sha256:ea775bc8c1911ff5b51c6a1199c266032e6fd406d28199b2f188b6073c6b1c64 as radarr
COPY certs /usr/share/ca-certificates
LABEL com.centurylinklabs.watchtower.enable="true"
RUN update-ca-certificates

FROM lscr.io/linuxserver/sonarr:latest@sha256:86122cfebc3bdb59cc9c49e531bc79bf26e8f6aec2df2172c9aadb09f3d589b0 as sonarr
COPY certs /usr/share/ca-certificates
LABEL com.centurylinklabs.watchtower.enable="true"
RUN update-ca-certificates

FROM linuxserver/sabnzbd:latest@sha256:0048320fe830e5c6a06167ac57625b7777f7d1dff18c404181bd2bc2e6914e8f as sabnzbd
COPY certs /usr/share/ca-certificates
LABEL com.centurylinklabs.watchtower.enable="true"
RUN update-ca-certificates

FROM adguard/adguardhome:latest@sha256:049ef6c019a629b33db2ef957665b257fbd5761970a1517a309807fb128befb1 as adguard
COPY certs /usr/share/ca-certificates
LABEL com.centurylinklabs.watchtower.enable="true"
RUN update-ca-certificates

FROM gitea/gitea:latest@sha256:daeeb33fb2f90d94876597f3b6c73956687c03250d5e5ca71104fc03b9c626b3 as gitea
COPY certs /usr/share/ca-certificates
LABEL com.centurylinklabs.watchtower.enable="true"
RUN update-ca-certificates
