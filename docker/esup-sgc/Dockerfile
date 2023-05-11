FROM tomcat:9.0.58-jre11-openjdk-bullseye

EXPOSE 8209

CMD rm -rf /usr/local/tomcat/webapps/* \
&& ln -s /opt/esup-sgc/target/ROOT /usr/local/tomcat/webapps/ROOT \
&& ./bin/catalina.sh run
