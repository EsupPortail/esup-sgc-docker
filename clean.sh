#!/bin/bash

# suppresion de toutes les images
docker rm $(docker ps -a -f status=exited -q); docker rmi $(docker images -q) -f

# suppression des volumes build
docker volume remove sgc-docker_esup-nfc-tag-vol
docker volume remove sgc-docker_esup-sgc-vol