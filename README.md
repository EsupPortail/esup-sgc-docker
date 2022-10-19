# sgc-docker

## Lancement
### Préalable : créer une image docker de esup-sgc
 * décompresser le dossier https://github.com/ctarade/sgc-docker-files/blob/main/docker4dev.zip dans esup-sgc 
 * éxécuter build.sh dans docker4dev

Retour au projet docker

 ### Création de la base de données
 * modifier le fichier 'esup-sgc-config' en modifiant la valeur "update" par "create"
 * éxécuter start.sh
 * lorsque esup-sgc s'est lancé, éxécuter stop_delete.sh
 * modifier le fichier 'esup-sgc-config' en modifiant la valeur "create" par "update"
 * éxécuter start.sh puis naviguez sur http://localhost:8080 