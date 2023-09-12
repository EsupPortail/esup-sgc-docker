FROM debian:bookworm

RUN apt-get update

# X11
#RUN apt-get install -y libv4l-0 libgtk-3-0 mesa-utils x11-apps

# PCSC / NFC
RUN apt-get install -y pcscd pcsc-tools usbutils libusb-java 

# git / maven / java / javafx
RUN apt-get install -y git maven openjfx

WORKDIR /opt/esup-sgc-client

CMD git clone https://github.com/EsupPortail/esup-sgc-client.git . \
&& git checkout -b lasttag $(git describe --tags --abbrev=0) \
&& ln -sf /docker-config/esupsgcclient.properties /opt/esup-sgc-client/esupsgcclient-core/src/main/resources/esupsgcclient.properties \
&& mvn -P evolis package \
&& tail -f /dev/null