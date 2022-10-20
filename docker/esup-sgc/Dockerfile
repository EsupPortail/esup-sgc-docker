FROM tomcat:9.0.58-jre11-openjdk-bullseye

COPY sgc-*.war /usr/local/tomcat/webapps/ROOT.war
RUN unzip /usr/local/tomcat/webapps/ROOT.war -d /usr/local/tomcat/webapps/ROOT

COPY rootfs/usr/local/tomcat/conf/server.xml /usr/local/tomcat/conf
COPY rootfs/usr/local/tomcat/lib/ojdbc7.jar /usr/local/tomcat/lib/ojdbc7.jar

EXPOSE 8205
EXPOSE 8209

CMD ["catalina.sh", "run"]
