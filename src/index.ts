import PgSimplifyInflector from '@graphile-contrib/pg-simplify-inflector'
import express from 'express'
import { graphqlUploadExpress } from 'graphql-upload'
import { postgraphile } from 'postgraphile'
// Create a new express application instance
const app: express.Application = express()

const postgraphileOptions: object = {
    appendPlugins: [PgSimplifyInflector],
    dynamicJson: true,
    enableCors: true,
    enableQueryBatching: true,
    enhanceGraphiql: true,
    exportGqlSchemaPath: 'schema.graphql',
    extendedErrors: ['hint', 'detail', 'errcode'],
    graphileBuildOptions: {},
    graphiql: process.env.ENABLE_PLAYGROUND || false,
    ignoreIndexes: false,
    ignoreRBAC: false,
    jwtPgTypeIdentifier: 'public_api.jwt_token',
    jwtSecret: process.env.JWT_SECRET,
    legacyRelations: 'omit',
    pgDefaultRole: 'anonymous_user',
    setofFunctionsContainNulls: false,
    showErrorStack: 'json',
    watchPg: false,
}

app.use(graphqlUploadExpress())

const DATABASE_URL='postgres://'+process.env.POSTGRAPHILE_API_USER+':'+process.env.POSTGRAPHILE_API_PASS+'@'+process.env.TARGET_DB_ADDR+'/'+process.env.POSTGRES_DB

app.use(
    postgraphile(
        DATABASE_URL,
        ['public_api', 'private_api'],
        postgraphileOptions,
    ),
)

app.listen(process.env.PORT || 3000, () => {
    console.log(`Postgraphile running on: ${process.env.PORT || 3000}`)
})
