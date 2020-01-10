import * as AWS from "aws-sdk"

export default class Upload {
    public static resolve(upload: any): string {
        const { filename, mimetype, encoding, createReadStream } = upload
        const stream = createReadStream()
        // save on S3
        return "file path"
    }
}
