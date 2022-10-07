#!/usr/bin/env nextflow
//nextflow.enable.dsl=2

log.info """\

 U P L O A D  T O  G O O G L E  C L O U D  B U C K E T
 =====================================================
 files        : ${params.files}
 """

files_ch = Channel
    .fromPath(params.files, checkIfExists: true)


process file_upload {
    //executor = 'google-lifesciences'
    publishDir "gs://backup-case-mara/test", mode: 'copy', pattern: "${data}"

    input:
    path(data) from files_ch

    output:
    path(data) 

    script:
    """
    echo ${data}
    """
}


//workflow {

//file_upload(files_ch)

//}