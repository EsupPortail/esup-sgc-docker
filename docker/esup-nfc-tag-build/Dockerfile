FROM debian:bullseye-slim

RUN apt-get update -y
RUN apt-get install -y git openjdk-11-jdk-headless maven
RUN apt-get install -y locales
RUN apt-get install -y postgresql-client

RUN sed -i -e 's/# fr_FR.UTF-8 UTF-8/fr_FR.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=fr_FR.UTF-8

ENV LANG fr_FR.UTF-8
ENV GIT_ESUPNFCTAG_URL https://github.com/EsupPortail/esup-nfc-tag-server.git
ENV GIT_ESUPNFCTAG_TAG esupNfcTagServer-2.5.2

WORKDIR /opt/esup-nfc-tag-server

CMD git clone $GIT_ESUPNFCTAG_URL . \
&& git checkout -b $GIT_ESUPNFCTAG_TAG $(git describe --tags --abbrev=0) \
&& ln -sf /docker-config/applicationContext-custom.xml /opt/esup-nfc-tag-server/src/main/resources/META-INF/spring/applicationContext-custom.xml \
&& ln -sf /docker-config/applicationContext-security.xml /opt/esup-nfc-tag-server/src/main/resources/META-INF/spring/applicationContext-security.xml \
&& ln -sf /docker-config/database.properties /opt/esup-nfc-tag-server/src/main/resources/META-INF/spring/database.properties \
&& ln -sf /docker-config/persistence.xml /opt/esup-nfc-tag-server/src/main/resources/META-INF/persistence.xml \
&& ln -sf /docker-config/context.xml /opt/esup-nfc-tag-server/src/main/webapp/META-INF/context.xml \
&& mvn compile exec:java -Dexec.args="dbupgrade" \
&& mvn package && rm -rf target/ROOT \
&& mv target/$(git describe --tags --abbrev=0 | sed 's/esup-//') target/ROOT \
&& tail -f /dev/null