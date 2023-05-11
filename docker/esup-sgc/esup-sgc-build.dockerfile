FROM debian:bullseye-slim

RUN apt-get update -y
RUN apt-get install -y git openjdk-11-jdk-headless maven

WORKDIR /opt/esup-sgc

CMD git clone https://github.com/EsupPortail/esup-sgc.git . \
&& git checkout -b lasttag $(git describe --tags --abbrev=0) \
&& sed -i 's/localhost/esup-sgc-db/' src/main/resources/META-INF/spring/database.properties \
&& sed -i 's/ldap\.univ-ville\.fr/esup-sgc-openldap/' src/main/resources/META-INF/spring/applicationContext-services.xml \
&& sed -i 's/update/create/' src/main/resources/META-INF/persistence.xml \
&& mvn compile exec:java -Dexec.args="dbupgrade" \
&& git checkout HEAD -f src/main/resources/META-INF/persistence.xml ;\
mvn package && mv target/$(git describe --tags --abbrev=0 | sed 's/esup-//') target/ROOT
