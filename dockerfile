# Dockerfile
FROM hasura/graphql-engine:v2.40.0.cli-migrations-v3

# Variables
ENV HASURA_GRAPHQL_ENABLE_CONSOLE=false
ENV HASURA_GRAPHQL_ADMIN_SECRET=ilyassAshraf

# Attendre PostgreSQL + appliquer migrations
CMD ["sh", "-c", "sleep 10 && graphql-engine serve"]