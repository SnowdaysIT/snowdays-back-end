#!/bin/sh

npm install
node_modules/.bin/postgraphile -c postgres://postgraphile_api:apiConnector@$TARGET_DB/$DB_NAME -s public_api,private_api --jwt-token-identifier public_api.jwt_token  --jwt-secret "aa"  --watch --append-plugins @graphile-contrib/pg-simplify-inflector
