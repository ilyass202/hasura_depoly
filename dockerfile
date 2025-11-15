# Dockerfile
FROM hasura/graphql-engine:v2.40.0

# Variables d'environnement
ENV HASURA_GRAPHQL_ENABLE_CONSOLE=true
ENV HASURA_GRAPHQL_ADMIN_SECRET=ilyassAshraf

# Copie les migrations
COPY migrations /hasura-migrations

# Applique les migrations au démarrage
CMD ["graphql-engine", "serve"]