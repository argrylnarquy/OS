# Utiliser l'image MySQL officielle comme base
FROM mysql:8.0-debian


# Variables d'environnement pour initialiser la base de données
ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_DATABASE=testdb
ENV MYSQL_USER=testuser
ENV MYSQL_PASSWORD=testpassword

# Copier le script SQL d'initialisation dans le conteneur
COPY init.sql /docker-entrypoint-initdb.d/

# Expose le port 3306 pour la base de données
EXPOSE 3306
