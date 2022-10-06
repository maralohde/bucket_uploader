#!/usr/bin/env nextflow

log.info """\
 U P L O A D  T O  G O O G L E  C L O U D  B U C K E T
 =====================================================
 files        : ${params.files}
 """

files_ch = Channel
    .fromPath(params.files, checkIfExists: true)


process file_upload {
    executor = "local"
    publishDir "gs://backup-case-mara/"

    input:
    file files from files_ch

    output:
    files_ch

    script:
    """
    echo "upload"
    """
}
