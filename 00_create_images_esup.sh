mkdir _tmp
cd _tmp

# esup-sgc
git clone https://github.com/EsupPortail/esup-sgc.git
cp -r ../docker/esup-sgc esup-sgc/docker4dev
cd esup-sgc/docker4dev
cd ..
rm -rf target
export JAVA_HOME=$(/usr/libexec/java_home -v11)
mvn clean package
rm -f docker4dev/sgc-*.war
rm -rf docker4dev/sgc-*
mv target/sgc-*.war docker4dev
cd docker4dev
docker build -t esup-sgc .
cd ../..

# esup-nfc-tag
git clone https://github.com/EsupPortail/esup-nfc-tag-server
cp -r ../docker/esup-nfc-tag-server esup-nfc-tag-server/docker4dev
cd esup-nfc-tag-server/docker4dev
cd ..
rm -rf target
export JAVA_HOME=$(/usr/libexec/java_home -v11)
mvn clean package
rm -f docker4dev/esupNfcTagServer-*.war
rm -rf docker4dev/esupNfcTagServer-*
mv target/esupNfcTagServer-*.war docker4dev
cd docker4dev
docker build -t esup-nfc-tag .
cd ../../..

# nettoyage
rm -rf _tmp