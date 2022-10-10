include { file_upload } from './process/file_upload.nf'

workflow file_upload_wf {
    take:   data
    main:   file_upload(data)
}