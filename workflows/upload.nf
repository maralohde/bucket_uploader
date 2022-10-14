include { file_upload_mike } from './process/file_upload.nf'
include { file_upload_mateusz } from './process/file_upload.nf'
include { file_upload_ricc } from './process/file_upload.nf'
include { file_upload_mara } from './process/file_upload.nf'

workflow file_upload_ricc_wf {
    take:   data
    main:   file_upload_ricc(data)
}

workflow dir_upload_ricc_wf {
    take:   dir
    main:   dir_upload_ricc(dir)
}

workflow file_upload_mike_wf {
    take:   data
    main:   file_upload_mike(data)
}

workflow dir_upload_mike_wf {
    take:   dir
    main:   dir_upload_mike(dir)
}

workflow file_upload_mara_wf {
    take:   data
    main:   file_upload_mara(data)
}

workflow dir_upload_mara_wf {
    take:   dir
    main:   dir_upload_mara(dir)
}

workflow file_upload_mateusz_wf {
    take:   data
    main:   file_upload_mateusz(data)
}

workflow dir_upload_mateusz_wf {
    take:   dir
    main:   dir_upload_mateusz(dir)
}
