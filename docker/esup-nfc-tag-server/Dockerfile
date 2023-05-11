FROM tomcat:9.0.58-jre11-openjdk-bullseye

COPY esupNfcTagServer-*.war /usr/local/tomcat/webapps/ROOT.war
RUN unzip /usr/local/tomcat/webapps/ROOT.war -d /usr/local/tomcat/webapps/ROOT

COPY rootfs/usr/local/tomcat/conf/server.xml /usr/local/tomcat/conf

RUN chmod +x /usr/local/tomcat/bin/catalina.sh

EXPOSE 8305
EXPOSE 8309

CMD ["catalina.sh", "run"]
