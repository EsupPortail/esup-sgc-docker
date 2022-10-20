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
 * modifier le fichier ```esup-sgc-config/persistence.xml``` en modifiant la valeur __update__ par __create__
 * éxécuter la commande
 ```
docker-compose -p sgc-stack up -d
 ```
 * lorsque esup-sgc s'est lancé, arréter le avec la commande (arrêt et nettoyage)
 ```
 docker-compose -p sgc-stack stop && docker-compose -p sgc-stack rm -f
 ```
 * remettre __update__ dans ```esup-sgc-config/persistence.xml```

### Lancement
 * éxécuter la commande
 ```
docker-compose -p sgc-stack up -d
 ```
 * naviguer sur http://localhost:8080 


## Fonctionnement

 * La base de données est persistée sous ```postgres-config/data```, pour repartir d'une base vierge, effacer ce dossier
 * Il n'y a pour l'instant pas d'authenfification, l'utilisateur connecté est à déclarer dans ```esup-sgc-config/spring/sgc.properties```
 * Toute la configuration de esup-sgc se fait au travers des fichiers ```esup-sgc-config/spring```
 * Pour ajouter des utilisateurs, modifier le fichier ldif ```ldap-config/data.ldif```
 * La driver ORACLE est embarqué dans l'image de esup-sgc, vous permettant de faire fonctionner directement SqlUserInfoService sur APOGEE/SCOLARIX/... 