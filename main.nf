#!/usr/bin/env nextflow
nextflow.enable.dsl=2

/************************** 
* LOG INFO
**************************/

log.info """\

 U P L O A D  T O  G O O G L E  C L O U D  B U C K E T
 =====================================================
 files        : ${params.files}
 """

/************************** 
* INPUTs
**************************/

files_ch = Channel
    .fromPath(params.files, checkIfExists: true)

/************************** 
* WORFLOW
**************************/
include { file_upload_wf } from './workflows/upload.nf'

/************************** 
* MAIN WORKFLOW
**************************/

workflow {
    file_upload_wf(files_ch) 
}