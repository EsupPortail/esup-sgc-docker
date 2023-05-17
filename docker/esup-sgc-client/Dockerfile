FROM debian:bookworm

RUN apt-get update

# X11
RUN apt-get install -y libv4l-0 libgtk-3-0 mesa-utils x11-apps

# PCSC / NFC
RUN apt-get install -y pcscd pcsc-tools usbutils libusb-java 

# git / maven / java / javafx
RUN apt-get install -y git maven openjfx

WORKDIR /opt/esup-sgc-client

CMD  /etc/init.d/pcscd restart \
&& git clone https://github.com/EsupPortail/esup-sgc-client.git . \
&& git checkout -b lasttag $(git describe --tags --abbrev=0) ;\
sed -i 's|https://esup-sgc-demo\.univ-rouen\.fr|http://esup-sgc-front|' esupsgcclient-core/src/main/resources/esupsgcclient.properties \
&& sed -i 's|https://esup-nfc-tag-demo\.univ-rouen\.fr|http://esup-nfc-tag-front|' esupsgcclient-core/src/main/resources/esupsgcclient.properties \
&& mvn -P evolis package \
&& java --module-path /usr/share/openjfx/lib --add-modules=javafx.fxml,javafx.web,javafx.controls,javafx.swing -jar /opt/esup-sgc-client/esupsgcclient-assembly/target/esup-sgc-client-final.jar


