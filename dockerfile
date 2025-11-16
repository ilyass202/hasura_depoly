FROM hasura/graphql-engine:v2.40.0.cli-migrations-v3

ENV HASURA_GRAPHQL_ENABLE_CONSOLE=true
ENV HASURA_GRAPHQL_DATABASE_URL=postgresql://postgres:nbAQrjvKzuvDqdeBPbUoEZjbxUwnMwPd@postgres.railway.internal:5432/railway
ENV HASURA_GRAPHQL_ADMIN_SECRET=ilyassAshraf
CMD ["graphql-engine", "serve"]
