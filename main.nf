#!/usr/bin/env nextflow
nextflow.enable.dsl=2

/************************** 
* LOG INFO
**************************/

log.info """\

 U P L O A D  T O  G O O G L E  C L O U D  B U C K E T
 =====================================================
 files          : ${params.file}
 directories    : ${params.dir}
 """

/************************** 
* INPUTs
**************************/

files_ch = Channel
    .fromPath(params.file, checkIfExists: true)

//dir_ch = Channel
    //.fromPath(params.dir,checkIfExists: true, type: 'dir')

// Log infos based on user inputs
if ( params.help ) { exit 0, helpMSG() }

// profile helps
    if ( workflow.profile == 'standard' ) { exit 1, "NO EXECUTION PROFILE SELECTED, use e.g. [-profile ukj_cloud]" }

/************************** 
* WORFLOW
**************************/

include { file_upload_mara_wf } from './workflows/upload.nf'
include { file_upload_mike_wf } from './workflows/upload.nf'
include { file_upload_mateusz_wf } from './workflows/upload.nf'
include { file_upload_ricc_wf } from './workflows/upload.nf'
include { dir_upload_mara_wf } from './workflows/upload.nf'
include { dir_upload_mike_wf } from './workflows/upload.nf'
include { dir_upload_mateusz_wf } from './workflows/upload.nf'
include { dir_upload_ricc_wf } from './workflows/upload.nf'

/************************** 
* MAIN WORKFLOW
**************************/

workflow {

    if (params.file && params.mara) {file_upload_mara_wf(files_ch)}
    if (params.file && params.mike) {file_upload_mike_wf(files_ch)}
    if (params.file && params.mateusz) {file_upload_mateusz_wf(files_ch)}
    if (params.file && params.ricc) {file_upload_ricc_wf(files_ch)}

    if (params.dir && params.mara) {dir_upload_mara_wf(dir_ch)}
    if (params.dir && params.mike) {dir_upload_mike_wf(dir_ch)}
    if (params.dir && params.mateusz) {dir_upload_mateusz_wf(dir_ch)}
    if (params.dir && params.ricc) {dir_upload_ricc_wf(dir_ch)}
}

/*************  
* MSG
*************/

def helpMSG() {
    c_green = "\033[0;32m";
    c_reset = "\033[0m";
    c_yellow = "\033[0;33m";
    c_blue = "\033[0;34m";
    c_dim = "\033[2m";
    log.info """
 
\033[0;33mUsage examples:${c_reset}

    nextflow run maralohde/bucket_uploader -profile ukj_cloud

${c_yellow}Inputs (choose one):${c_reset}
    --file          upload only a file
                    multiple files: --file 'file_*'          

    --dir           upload a directory
                        
${c_yellow} Bucket (choose one) ${c_reset}
    --mike          upload to "backup-case-mike"
    --ricc          upload to "backup-case-ricc"
    --marteusz      upload to "backup-case-marteusz"
    --mara          upload to "backup-case-mara"

 ${c_yellow} Path (choose one) ${c_reset}
    --output        choose path for storage

""".stripIndent()


}

def header() {
    c_green = "\033[0;32m";
    c_reset = "\033[0m";
    log.info """
________________________________________________________________________________
    
${c_green}Outbreak${c_reset} | A outbreak visualisation workflow
    """
}

def defaultMSG() {
    log.info """
    .
    \u001B[32mProfile:             $workflow.profile\033[0m
    \033[2mCurrent User:        $workflow.userName
    Nextflow-version:    $nextflow.version
    poreCov-version:     $workflow.revision
    \u001B[0m
    Pathing:
    \033[2mWorkdir location [-work-Dir]:
        $workflow.workDir
    Output dir [--output]: 
        $params.output
    Databases location [--databases]:
        $params.databases
    Singularity cache dir [--cachedir]: 
        $params.cachedir
    \u001B[1;30m______________________________________\033[0m
    Parameters:
    \033[2mMedaka model:         $params.medaka_model [--medaka_model]
    CPU-cores per process:          $params.cores [--cores]
    Total CPU-cores to use:          $params.max_cores [--max_cores]
    Memory in GB:         $params.memory [--memory]\u001B[0m
    \u001B[1;30m______________________________________\033[0m
    """.stripIndent()
}
