#!/bin/bash

# suppression fichiers compilés ...
rm -rf esup-sgc esup-nfc-tag-server
mkdir esup-sgc esup-nfc-tag-server 

# suppression de tout docker - confirmation est demandée à l'utilisateur - par défaut N
docker system prune -a
