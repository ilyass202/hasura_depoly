FROM hasura/graphql-engine:v2.40.0.cli-migrations-v3

ENV HASURA_GRAPHQL_ENABLE_CONSOLE=true
CMD ["graphql-engine", "serve"]
