FROM debian:bullseye-slim

RUN apt-get update -y
RUN apt-get install -y git openjdk-11-jdk-headless maven
RUN apt-get install -y locales
RUN apt-get install -y postgresql-client

RUN sed -i -e 's/# fr_FR.UTF-8 UTF-8/fr_FR.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=fr_FR.UTF-8

ENV LANG fr_FR.UTF-8
ENV GIT_REPO_URL https://github.com/EsupPortail/esup-sgc.git
ENV GIT_REPO_TAG esup-sgc-2.0.0
ENV DST_DIR /opt/esup-sgc

WORKDIR $DST_DIR

CMD [ "/docker-config/start-docker.sh" ]