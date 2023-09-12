#!/bin/bash
DST_DIR_EMPTY=$([ "$(ls -A $DST_DIR)" ] && echo "False" || echo "True")

if [ "$DST_DIR_EMPTY" = "True" ]
then
    echo "Répertoire $DST_DIR vide, récupération depuis $GIT_REPO_URL (tag $GIT_REPO_TAG)"
    git clone $GIT_REPO_URL .
    git checkout -b $GIT_REPO_TAG $(git describe --tags --abbrev=0)
else
    echo "Répertoire $DST_DIR non vide, conversation du binaire existant"
fi

echo "Montage des fichiers configuration (config esup-sgc)"
ln -sf /docker-config/applicationContext-custom.xml $DST_DIR/src/main/resources/META-INF/spring/applicationContext-custom.xml
ln -sf /docker-config/applicationContext-security.xml $DST_DIR/src/main/resources/META-INF/spring/applicationContext-security.xml
ln -sf /docker-config/database.properties $DST_DIR/src/main/resources/META-INF/spring/database.properties
ln -sf /docker-config/persistence.xml $DST_DIR/src/main/resources/META-INF/persistence.xml
ln -sf /docker-config/context.xml $DST_DIR/src/main/webapp/META-INF/context.xml

if [ "$DST_DIR_EMPTY" = "True" ]
then
    echo "Compilation et installation"
    mvn compile exec:java -Dexec.args="dbupgrade"
    mvn package && rm -rf target/ROOT
    mv target/$(git describe --tags --abbrev=0 | sed 's/esup-//') target/ROOT
fi

echo "Build terminé"
tail -f /dev/null 