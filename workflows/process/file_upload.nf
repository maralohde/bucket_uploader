process file_upload {
    label 'ubuntu'
    //executor = 'google-lifesciences'
    publishDir "gs://backup-case-mara/test", mode: 'copy', pattern: "${data}"

    input:
    path(data) //from files_ch

    //output:
    //path ("${data}")

    script:
    """
    echo ${data}
    """
}