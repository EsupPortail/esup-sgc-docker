#!/bin/bash

# suppression fichiers compilés ...
rm -rf esup-sgc esup-nfc-tag-server esup-sgc-client
mkdir esup-sgc esup-nfc-tag-server esup-sgc-client

# suppression de tout docker - confirmation est demandée à l'utilisateur - par défaut N
docker system prune -a
