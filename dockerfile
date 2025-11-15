# Dockerfile
FROM hasura/graphql-engine:v2.40.0

ENV HASURA_GRAPHQL_ENABLE_CONSOLE=true
ENV HASURA_GRAPHQL_ADMIN_SECRET=ilyassAshraf

# Copie migrations
COPY migrations /hasura-migrations

CMD ["graphql-engine", "serve"]