#!/usr/bin/env bash

POM_FILE="pom.xml"

if [ ! -f "$POM_FILE" ]; then
  echo "pom.xml introuvable"
  exit 1
fi

if grep -q "jaxb-runtime" "$POM_FILE"; then
  echo "Dépendance déjà présente"
else
  echo "Ajout de jaxb-runtime..."
  awk '
  /<\/dependencies>/ && !added {
    print "        <dependency>"
    print "            <groupId>org.glassfish.jaxb</groupId>"
    print "            <artifactId>jaxb-runtime</artifactId>"
    print "            <version>4.0.5</version>"
    print "        </dependency>"
    added=1
  }
  { print }
  ' "$POM_FILE" > "$POM_FILE.tmp" && mv "$POM_FILE.tmp" "$POM_FILE"
fi

if grep -q "byte-buddy" "$POM_FILE"; then
  echo "Dépendance déjà présente"
else
  echo "Ajout de byte-buddy..."
  awk '
  /<\/dependencies>/ && !added {
    print "        <dependency>"
    print "            <groupId>net.bytebuddy</groupId>"
    print "            <artifactId>byte-buddy</artifactId>"
    print "            <version>1.14.7</version>"
    print "        </dependency>"
    added=1
  }
  { print }
  ' "$POM_FILE" > "$POM_FILE.tmp" && mv "$POM_FILE.tmp" "$POM_FILE"
fi

echo "Vérification de jnasmartcardio..."

if grep -q "io.github.jnasmartcardio" "$POM_FILE"; then
  echo "Dépendance déjà présente"
else
  echo "Ajout de jnasmartcardio..."

  awk '
  /<\/dependencies>/ && !added {
    print "        <dependency>"
    print "            <groupId>io.github.jnasmartcardio</groupId>"
    print "            <artifactId>jnasmartcardio</artifactId>"
    print "            <version>0.2.7</version>"
    print "            <scope>test</scope>"
    print "        </dependency>"
    added=1
  }
  { print }
  ' "$POM_FILE" > "$POM_FILE.tmp" && mv "$POM_FILE.tmp" "$POM_FILE"
fi

echo "Terminé"
echo "Backup disponible : pom.xml.bak"