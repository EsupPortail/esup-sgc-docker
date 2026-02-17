FROM tomcat:10.1-jdk21-temurin-jammy

EXPOSE 8309

CMD rm -rf /usr/local/tomcat/webapps/* \
&& ln -s /opt/esup-nfc-tag-server/target/ROOT /usr/local/tomcat/webapps/ROOT \
&& ./bin/catalina.sh run