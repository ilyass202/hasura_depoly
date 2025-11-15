# Dockerfile
FROM hasura/graphql-engine:v2.40.0

# Variables d'environnement
ENV HASURA_GRAPHQL_ENABLE_CONSOLE=true
ENV HASURA_GRAPHQL_ADMIN_SECRET=ilyassAshraf

# Utilise TCP (pas socket)
ENV HASURA_GRAPHQL_DATABASE_URL=${DATABASE_URL}
ENV HASURA_GRAPHQL_MIGRATIONS_DATABASE_URL=${DATABASE_URL}
ENV HASURA_GRAPHQL_METADATA_DATABASE_URL=${DATABASE_URL}

# Copie les migrations
COPY migrations /hasura-migrations

# Démarre Hasura
CMD ["graphql-engine", "serve"]