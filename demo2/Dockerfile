# Dockerfile: text document containing all commands a user could call on the command line to assemble an image.
# https://docs.docker.com/engine/reference/builder
# https://docs.docker.com/storage/volumes
# https://www.fosstechnix.com/dockerfile-instructions
# https://stackoverflow.com/questions/27093612/in-a-dockerfile-how-to-update-path-environment-variable
# https://docs.docker.com/engine/reference/commandline/builder_build
# Usage:  $ sudo docker build  --force-rm --tag ubuntu-bisq .
# Run Image:  $ sudo docker run -ti ubuntu-bisq
# $ sudo docker search ubuntu
FROM ubuntu:22.04
ENV BISQ_HOME="/home/bisq"
RUN apt -y update \
    && apt -y upgrade \
    && apt -y install vim zip tar iputils-ping wget curl gnupg \
    && mkdir ${BISQ_HOME}
WORKDIR ${BISQ_HOME}

RUN wget -q https://download.java.net/java/GA/jdk15.0.2/0d1cfde4252546c6931946de8db48ee2/7/GPL/openjdk-15.0.2_linux-x64_bin.tar.gz.sha256 \
    && wget -q https://download.java.net/java/GA/jdk15.0.2/0d1cfde4252546c6931946de8db48ee2/7/GPL/openjdk-15.0.2_linux-x64_bin.tar.gz \
    && echo "$(cat openjdk-15.0.2_linux-x64_bin.tar.gz.sha256) openjdk-15.0.2_linux-x64_bin.tar.gz" | sha256sum --check --status \
    && tar -xf openjdk-15.0.2_linux-x64_bin.tar.gz \
    && curl https://bisq.network/pubkey/29CDFD3B.asc | gpg --import \
    && wget -q https://github.com/bisq-network/bisq/releases/download/v1.9.1/bisq-cli-1.9.1.zip.asc \
    && wget -q https://github.com/bisq-network/bisq/releases/download/v1.9.1/bisq-cli-1.9.1.zip \
    && gpg --digest-algo SHA256 --verify bisq-cli-1.9.1.zip.asc \
    && wget -q https://github.com/bisq-network/bisq/releases/download/v1.9.1/bisq-daemon-1.9.1.zip.asc \
    && wget -q https://github.com/bisq-network/bisq/releases/download/v1.9.1/bisq-daemon-1.9.1.zip \
    && gpg --digest-algo SHA256 --verify bisq-daemon-1.9.1.zip.asc \
    && unzip -q bisq-cli-1.9.1.zip \
    && unzip -q bisq-daemon-1.9.1.zip \
    && rm -v *.sha256 \
    && rm -v *.asc \
    && rm -v *.tar.gz \
    && rm -v *.zip

ENV JAVA_HOME="${BISQ_HOME}/jdk-15.0.2"
ENV PATH="${JAVA_HOME}/bin:${PATH}"
EXPOSE 9998

COPY --chown=root:root start-bisq.sh ${BISQ_HOME}

