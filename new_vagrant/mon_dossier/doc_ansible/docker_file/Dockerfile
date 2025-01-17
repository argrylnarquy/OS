FROM httpd:2.4-alpine

LABEL application="frontend"

# Créer un utilisateur non root et ajouter les permissions nécessaires
RUN addgroup -S appgroup && adduser -S appuser -G appgroup \
    && mkdir -p /usr/local/apache2/htdocs \
    && chown -R appuser:appgroup /usr/local/apache2 \
    && chmod -R 755 /usr/local/apache2

# Copier le fichier HTML directement dans le répertoire de l'application
COPY index.html /usr/local/apache2/htdocs/

# Modifier les permissions du fichier copié pour l'utilisateur non root
RUN chown -R appuser:appgroup /usr/local/apache2/htdocs

# Exposer le port 80
EXPOSE 80

# Passer à l'utilisateur non root
USER appuser

# Commande pour démarrer Apache
CMD ["httpd-foreground"]
