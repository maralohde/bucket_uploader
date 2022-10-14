process file_upload_mara {
    label 'ubuntu'
    //executor = 'google-lifesciences'
    publishDir "gs://backup-case-mara/", mode: 'copy', pattern: "${data}"

    input:
    path(data) //from files_ch

    output:
    path ("${data}")

    script:
    """
    echo ${data}
    """
}

process file_upload_mateusz {
    label 'ubuntu'
    //executor = 'google-lifesciences'
    publishDir "gs://backup-case-mateusz/", mode: 'copy', pattern: "${data}"

    input:
    path(data) //from files_ch

    output:
    path ("${data}")

    script:
    """
    echo ${data}
    """
}

process file_upload_mike {
    label 'ubuntu'
    //executor = 'google-lifesciences'
    publishDir "gs://backup-case-mike/", mode: 'copy', pattern: "${data}"

    input:
    path(data) //from files_ch

    output:
    path ("${data}")

    script:
    """
    echo ${data}
    """
}

process file_upload_ricc {
    label 'ubuntu'
    //executor = 'google-lifesciences'
    publishDir "gs://backup-case-ricc/", mode: 'copy', pattern: "${data}"

    input:
    path(data) //from files_ch

    output:
    path ("${data}")

    script:
    """
    echo ${data}
    """
}