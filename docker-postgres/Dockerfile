FROM postgres:11.17-bullseye

# préalable pour installer avec apt
USER root

# installation postgresql-contrib
RUN apt-get update \
  && apt-get install -y postgresql-contrib \
  && apt-get clean

# retour au user standard
USER 1001
