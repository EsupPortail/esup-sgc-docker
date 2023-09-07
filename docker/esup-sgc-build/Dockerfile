FROM debian:bullseye-slim

RUN apt-get update -y
RUN apt-get install -y git openjdk-11-jdk-headless maven
RUN apt-get install -y locales
RUN apt-get install -y postgresql-client

RUN sed -i -e 's/# fr_FR.UTF-8 UTF-8/fr_FR.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=fr_FR.UTF-8

ENV LANG fr_FR.UTF-8
ENV GIT_ESUPSGC_URL https://github.com/EsupPortail/esup-sgc.git
ENV GIT_ESUPSGC_TAG esup-sgc-2.0.0

WORKDIR /opt/esup-sgc

CMD git clone $GIT_ESUPSGC_URL . \
&& git checkout -b $GIT_ESUPSGC_TAG $(git describe --tags --abbrev=0) \
&& ln -sf /docker-config/applicationContext-services.xml /opt/esup-sgc/src/main/resources/META-INF/spring/applicationContext-services.xml \
&& ln -sf /docker-config/database.properties /opt/esup-sgc/src/main/resources/META-INF/spring/database.properties \
&& ln -sf /docker-config/persistence.xml /opt/esup-sgc/src/main/resources/META-INF/persistence.xml \
&& mvn compile exec:java -Dexec.args="dbupgrade" \
&& mvn package && rm -rf target/ROOT \
&& mv target/$(git describe --tags --abbrev=0 | sed 's/esup-//') target/ROOT \
&& tail -f /dev/null