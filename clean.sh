#!/bin/bash

# suppresion de toutes les images
docker rm $(docker ps -a -f status=exited -f name=esup-sgc-docker -q)
docker rmi $(docker images --format "{{.Repository}} {{.ID}}" | grep esup-sgc-docker | awk '{print $2}') -f

# suppression des volumes build
docker volume remove esup-sgc-docker_esup-nfc-tag-vol
docker volume remove esup-sgc-docker_esup-sgc-vol