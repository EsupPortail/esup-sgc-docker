# sgc-docker

## Pré-requis
* Java OpenJDK 11
* Maven
* Docker

### Construction docker esup-sgc/tomcat

Création d'un .war et déploiement dans une image docker tomcat
 ```
 ./00_create_images_esup.sh
 ```

 ### Création de la base de données la 1ère fois
 * modifier les fichiers ```config/esup-sgc/persistence.xml``` et ```config/esup-nfc-tag/persistence.xml``` en modifiant la valeur __update__ par __create__
 * exécuter la commande
 ```
docker-compose -p sgc-stack up -d
 ```
 * lorsque esup-sgc s'est lancé, arréter le avec la commande (arrêt et nettoyage)
 ```
 docker-compose -p sgc-stack stop && docker-compose -p sgc-stack rm -f
 ```
 * remettre __update__ dans ```config/esup-sgc/persistence.xml``` et ```config/esup-nfc-tag/persistence.xml```

### Lancement
 * exécuter la commande
 ```
docker-compose -p sgc-stack up -d
 ```
 * naviguer sur http://localhost:8080 pour lancer esup-sgc
 * naviguer sur http://localhost:8081 pour lancer esup-nfc-tag


## Fonctionnement

 * La base de données est persistée sous ```config/postgres/data```, pour repartir d'une base vierge, effacer ce dossier
 * Il n'y a pour l'instant pas d'authenfification sur esup-sgc, l'utilisateur connecté est à déclarer dans ```config/esup-sgc/spring/sgc.properties```
 * Il n'y a pour l'instant pas d'authenfification possible sur esup-nfc-tag
 * Les configurations de esup-sgc/esup-nfc-tag se font respectivement dans ```config/esup-sgc/spring``` et ```config/esup-nfc-tag/spring```
 * Pour ajouter des utilisateurs, modifier le fichier ldif ```config/ldap/data.ldif```
 * La driver ORACLE est embarqué dans l'image de esup-sgc, vous permettant de faire fonctionner directement SqlUserInfoService sur APOGEE/SCOLARIX/... 