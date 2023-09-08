FROM debian:bullseye-slim

RUN apt-get update -y
RUN apt-get install -y git openjdk-11-jdk-headless maven
RUN apt-get install -y locales
RUN apt-get install -y postgresql-client

RUN sed -i -e 's/# fr_FR.UTF-8 UTF-8/fr_FR.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=fr_FR.UTF-8

ENV LANG fr_FR.UTF-8
ENV GIT_REPO_URL https://github.com/EsupPortail/esup-nfc-tag-server.git
ENV GIT_REPO_TAG esupNfcTagServer-2.5.2
ENV DST_DIR /opt/esup-nfc-tag-server

WORKDIR /opt/esup-nfc-tag-server

CMD [ "/docker-config/start-docker.sh" ]