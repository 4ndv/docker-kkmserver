FROM ubuntu:20.04

ARG KKMSERVER_VERSION
ARG TARGETARCH
ARG KKMSERVER_PACKAGE=kkm_server_${KKMSERVER_VERSION}_${TARGETARCH}.deb

ADD container/ /
ADD deb/ /deb

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -qq update \
  && apt-get -qq install --no-install-recommends \
       ca-certificates \
       libc6-dev \
       libcurl4 \
       libgdiplus \
       libicu66 \
       liblttng-ust0 \
       libssl1.1 \
       netcat `# For health checks` \
       openssl \
  && dpkg --install deb/${KKMSERVER_PACKAGE} \
  && apt-get -qq clean \
  && rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && rm --recursive --force /deb

ENV LANG ru_RU.utf8

CMD ["/opt/kkmserver/kkmserver", "-s"]
