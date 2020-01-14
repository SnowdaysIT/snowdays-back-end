import PgSimplifyInflector from '@graphile-contrib/pg-simplify-inflector'
import express from 'express'
import { graphqlUploadExpress } from 'graphql-upload'
import path from 'path'
import { postgraphile } from 'postgraphile'
import PostGraphileUploadFieldPlugin from 'postgraphile-plugin-upload-field'
import Upload from './upload'
// Create a new express application instance
const app: express.Application = express()

app.use(`/${process.env.UPLOAD_DIR_NAME || 'upload'}`, express.static(path.resolve(process.env.UPLOAD_DIR_NAME || 'upload')))

const postgraphileOptions: object = {
    appendPlugins: [PgSimplifyInflector, PostGraphileUploadFieldPlugin],
    dynamicJson: true,
    enableCors: true,
    enableQueryBatching: true,
    enhanceGraphiql: true,
    exportGqlSchemaPath: 'schema.graphql',
    extendedErrors: ['hint', 'detail', 'errcode'],
    graphileBuildOptions: {
        uploadFieldDefinitions: [
            {
                match: ({ schema, table, column, tags }: any) =>
                    (column === 'badge_front_id' || column === 'badge_back_id'),
                resolve: Upload.resolve,
            },
        ],
    },
    graphiql: true,
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
