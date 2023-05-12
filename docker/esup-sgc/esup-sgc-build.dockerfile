FROM debian:bullseye-slim

RUN apt-get update -y
RUN apt-get install -y git openjdk-11-jdk-headless maven
RUN apt-get install -y locales
RUN apt-get install -y postgresql-client

RUN sed -i -e 's/# fr_FR.UTF-8 UTF-8/fr_FR.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=fr_FR.UTF-8

ENV LANG fr_FR.UTF-8

WORKDIR /opt/esup-sgc

CMD git clone https://github.com/EsupPortail/esup-sgc.git . \
&& git checkout -b lasttag $(git describe --tags --abbrev=0) ;\
sed -i 's/localhost/esup-sgc-db/' src/main/resources/META-INF/spring/database.properties \
&& sed -i 's/ldap\.univ-ville\.fr/esup-sgc-openldap/' src/main/resources/META-INF/spring/applicationContext-services.xml \
&& sed -i 's/update/create/' src/main/resources/META-INF/persistence.xml \
&& mvn compile exec:java -Dexec.args="dbupgrade" \
&& git checkout HEAD -f src/main/resources/META-INF/persistence.xml ;\
mvn package && rm -rf target/ROOT && mv target/$(git describe --tags --abbrev=0 | sed 's/esup-//') target/ROOT \
&& tail -f /dev/null
