#!/bin/sh
# db preconf

# uncomment to create db if necessary
# psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
#     CREATE DATABASE $POSTGRES_DB;
# EOSQL

# create postgres schema,
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" -f /docker-entrypoint-initdb.d/resources/schema.sql
# sample data (not mandatory),
psql --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" -f /docker-entrypoint-initdb.d/resources/template.seed.sql
# and roles
psql -v ON_ERROR_STOP=1 --set=postgraphile_api_pass="'""$POSTGRAPHILE_API_PASS""'" \
    --set=postgraphile_api_user="$POSTGRAPHILE_API_USER" --username "$POSTGRES_USER" \
    --dbname "$POSTGRES_DB" -f /docker-entrypoint-initdb.d/resources/roles.sql