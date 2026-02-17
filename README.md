# esup-sgc-docker

*Environnement Dockerisé pour le projet esup-sgc*

Ce dépôt permet de déployer rapidement un environnement complet pour **esup-sgc**, incluant :
- **esup-sgc** (application de gestion des cartes)
- **esup-nfc-tag** (application de gestion des tags NFC)
- **PostgreSQL** (base de données)
- **OpenLDAP** (serveur LDAP pour la gestion des utilisateurs)
- **Traefik** (reverse proxy)
- **Shibboleth** (fédération d’identité)

## Pré-requis
- Docker
- Docker Compose (inclus avec Docker Desktop ou à installer séparément)
- Git (pour cloner le dépôt)

## **Installation et configuration**

### Cloner le dépôt
```bash
git clone https://github.com/EsupPortail/esup-sgc-docker.git
cd esup-sgc-docker
```

## Personnalisation

### 1. Annuaire LDAP (dossier config/ldap)
- Les utilisateurs LDAP sont définis et sont modifiables dans le fichier `config/ldap/data.ldif`.
- Pour modifier le schéma, cf les fichiers `config/ldap/*.schema`.
- Il est possible d'utiliser un annuaire LDAP externe en remplaçant toutes les occurences de "ldap://my-ldap" par l'URL de votre serveur LDAP.

### 2. Base de données PostgreSQL
- Par défaut, une base PostgreSQL embarquée est utilisée.
- Pour utiliser une base externe, modifier les fichiers `database.properties` avec les identifiants de votre base.

### 3. Configuration des applications
- Les configurations des applications sont dans le dossier `config/esup-nfc-tag` et `config/esup-sgc`.
- N'importe quel fichier de configuration peuvent être surchargé.
- Pour la bonne prise en compte, compléter les fichiers `start-docker.sh' avec les bons points de montages.

*Les versions de sgc / nfc-tag peuvent aussi être surchargées (cf la définition des variables GIT_REPO_TAG), attention à la cohérence des dépendances et des versions (jdk, tomcat, etc...).*

## Lancement de l’environnement

### 1. Démarrer les conteneurs
```bash
docker-compose up
```

### 2. Attendre que tout démarre ...

La première fois, le démarrage peut prendre plusieurs minutes (téléchargement des images, initialisation des bases de données, configuration des services).

Ne pas interrompre le processus, même si les logs semblent figés.

Les services sont prêts lorsque vous voyez dans les logs un message similaire à :
```
my-shib-idp-1         | tomcat-access;console;dev;nothing;127.0.0.1 - - [12/Feb/2026:08:06:31 +0000] "GET /idp/status HTTP/1.1" 200 2634
```

### 3. Accéder aux applications
- esup-sgc : [http://esup-sgc.localhost](http://esup-sgc.localhost)
- esup-nfc-tag : [http://esup-nfc-tag.localhost](http://esup-nfc-tag.localhost)

Identifiant / mot de passe par défaut : 
- manager : adminsgc / esup
- utilisateur : user / esup

### 4. Arrêter les conteneurs

Ne pas faire CTRL+C, les conteneurs ne seront pas stoppés proprement.

Préférez ouvrir un autre terminal puis :

```bash
docker-compose down
```

## Réinitialiser l’environnement
Pour supprimer tous les volumes et repartir de zéro :
```bash
sh clean.sh
```