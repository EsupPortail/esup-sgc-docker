FROM debian:bookworm

RUN apt-get update

# X11
#RUN apt-get install -y libv4l-0 libgtk-3-0 mesa-utils x11-apps

# PCSC / NFC
RUN apt-get install -y pcscd pcsc-tools usbutils libusb-java 

# git / maven / java / javafx
RUN apt-get install -y git maven openjfx

WORKDIR /opt/esup-nfc-tag-desktop

CMD git clone https://github.com/EsupPortail/esup-nfc-tag-desktop.git . \
&& git checkout -b esupnfctagdesktop-1.3 $(git describe --tags --abbrev=0) \
&& ln -sf /docker-config/esupnfctag.properties /opt/esup-nfc-tag-desktop/src/main/resources/esupnfctag.properties \
&& mvn package \
&& tail -f /dev/null