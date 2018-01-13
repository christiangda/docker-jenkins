FROM jenkins/jenkins:lts-slim

ARG DOCKER_VERSION
USER root

ENV DOCKER_VERSION=${DOCKER_VERSION:-17.12.0-ce} \
    DEBIAN_FRONTEND=noninteractive

RUN /usr/local/bin/install-plugins.sh \
         docker-plugin \
         blueocean \
     && apt-get update && apt-get install -y --no-install-recommends \
        wget \
        gnupg \
        ca-certificates \
    && wget -q "https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz" \
    && tar -xv -C /usr/bin --strip-components=1 -f "docker-${DOCKER_VERSION}.tgz" \
    && rm -rf "docker-${DOCKER_VERSION}.tgz" \
    && rm -rf /tmp/* /var/tmp/* /var/lib/apt/lists/*

USER jenkins