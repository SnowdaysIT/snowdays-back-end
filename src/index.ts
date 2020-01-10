import express from "express"
import { graphqlUploadExpress } from "graphql-upload"
import { postgraphile } from "postgraphile"
import { PostGraphileUploadFieldPlugin } from "postgraphile-plugin-upload-field"
import Upload from "./upload"

// Create a new express application instance
const app: express.Application = express()

const postgraphileOptions: object = {
    watchPg: false,
    dynamicJson: true,
    setofFunctionsContainNulls: false,
    ignoreRBAC: false,
    ignoreIndexes: false,
    showErrorStack: "json",
    extendedErrors: ["hint", "detail", "errcode"],
    appendPlugins: [require("@graphile-contrib/pg-simplify-inflector"), PostGraphileUploadFieldPlugin],
    exportGqlSchemaPath: "schema.graphql",
    graphiql: true,
    enhanceGraphiql: true,
    enableQueryBatching: true,
    legacyRelations: "omit",
    jwtSecret: "aa",
    jwtPgTypeIdentifier: "public_api.jwt_token",
    pgDefaultRole: "anonymous_user",
    graphileBuildOptions: {
        uploadFieldDefinitions: [
            {
                match: ({ schema, table, column, tags }) =>
                    column === "header_image_file",
                resolve: Upload.resolve,
            },
        ],
    },
}

app.use(graphqlUploadExpress())

app.use(
    postgraphile(
        process.env.DATABASE_URL || "postgres://postgraphile_api:apiConnector@localhost/snowdays_test",
        ["public_api", "private_api"],
        postgraphileOptions,
    ),
)

app.listen(process.env.PORT || 3000, () => {
    console.log(`Postgraphile running on: ${process.env.PORT || 3000}`)
})
