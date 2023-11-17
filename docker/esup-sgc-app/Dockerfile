FROM tomcat:9.0.82-jre11-temurin-jammy

RUN apt-get update \
    && apt-get install -y \
    unzip curl imagemagick ghostscript

# Install chrome avec dpkg (erreur) => true pour que ça fasse le repair juste après ...
RUN cd /tmp \
    && wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
    && dpkg -i google-chrome-stable_current_amd64.deb || true \
    && apt --fix-broken install -y \
    && rm -f google-chrome-stable_current_amd64.deb \
    && apt-get clean

# Autoriser la conversion PDF avec ImageMagick  
RUN sed -e '/\=\"PDF/s/\(^.*$\)/<!--\1-->/' /etc/ImageMagick-6/policy.xml > /etc/ImageMagick-6/policy-new.xml && \
    mv /etc/ImageMagick-6/policy-new.xml /etc/ImageMagick-6/policy.xml

EXPOSE 8209

CMD rm -rf /usr/local/tomcat/webapps/* \
&& ln -s /opt/esup-sgc/target/ROOT /usr/local/tomcat/webapps/ROOT \
&& ./bin/catalina.sh run