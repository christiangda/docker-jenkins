FROM jenkins/jenkins:lts
# if we want to install via apt
USER root

RUN /usr/local/bin/install-plugins.sh docker-plugin

RUN /usr/local/bin/install-plugins.sh \
        docker-plugin \
        blueocean \
    && apt-get update && apt-get install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        software-properties-common \
    && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
    && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu zesty stable" \
    && apt-get update \
    && apt-get install -y docker-ce

# drop back to the regular jenkins user - good practice
USER jenkins