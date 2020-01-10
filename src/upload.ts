import fs from 'fs'
import path from 'path'

export default class Upload {
    public static async resolve(upload: any): Promise<any> {
        const { filename, mimetype, encoding, createReadStream } = upload
        const stream = createReadStream()
        // Save file to the local filesystem
        const { filepath } = await Upload.saveOnFileSystem({ stream, filename })
        // Return metadata to save it to Postgres
        return filepath
    }

    private static saveOnFileSystem({ stream, filename }: any): Promise<any> {
        const timestamp = new Date().toISOString().replace(/\D/g, '')
        const id = `${timestamp}_${filename}`
        const filepath = path.join(process.env.UPLOAD_DIR_NAME || 'upload', id)
        const fsPath = path.join(process.cwd(), filepath)
        return new Promise((resolve, reject) =>
            stream
                .on('error', (error: any) => {
                    if (stream.truncated) {
                        // Delete the truncated file
                        fs.unlinkSync(fsPath)
                    }
                    reject(error)
                })
                .on('end', () => resolve({ id, filepath }))
                .pipe(fs.createWriteStream(fsPath)),
        )
    }
}
