*** Settings ***
Library         OperatingSystem

*** Variables ***

${OUTPUT_DIRECTORY}             Results/Output
${STANDARD_FILE_NAME}           fichaCompletaEstabelecimento.pdf


*** Keywords ***

Verifica existência do arquivo baixado
    [Arguments]     ${DOWNLOAD_DIRECTORY}

    ${file_path}    Join Path                 ${DOWNLOAD_DIRECTORY}   ${STANDARD_FILE_NAME}

    wait until created      ${file_path}
    should exist            ${file_path}

Renomeia e move arquivo para pasta "Output"
    [Arguments]     ${DOWNLOAD_DIRECTORY}     ${CNES_FILE_NAME}

    ${source_path}      join path   ${DOWNLOAD_DIRECTORY}   ${STANDARD_FILE_NAME}
    ${target_path}      join path   ${OUTPUT_DIRECTORY}     ${CNES_FILE_NAME}

    move file           ${source_path}    ${target_path}
    should exist        ${target_path}
    should not exist    ${source_path}


