*** Settings ***
Documentation       Resources are located in the Resources Directory
Resource            ../Resources/PO/Pagina_Consulta.robot
Resource            ../Resources/PO/Pagina_Resultados.robot
Resource            ../Resources/PO/Pagina_Identificacão.robot
Resource            ../Resources/PO/Pagina_Impressão.robot
Resource            ../Resources/OS.robot


*** Variables ***

*** Keywords ***

Pesquisa Estabelecimentos de Saúde
    [Arguments]                         ${URL}  ${ESTADO}   ${MUNICIPIO}

    Carrega página                      ${URL}
    Verifica carregamento
    Seleciona estado                    ${ESTADO}
    Seleciona município                 ${MUNICIPIO}
    Pesquisa
    Verifica carregamento dos resultados

Abre ficha do estabelecimento
    Abre Detalhes
    Verifica abertura da página de identificação
    Abre ficha para impressão
    Verifica carregamento da ficha do estabelecimento

Imprime ficha completa
    Seleciona ficha completa
    Imprime ficha do estabelecimento

Valida e move arquivo baixado para pasta "Output"
    [Arguments]     ${DOWNLOAD_DIRECTORY}     ${CNES_FILE_NAME}

    Verifica existência do arquivo baixado          ${DOWNLOAD_DIRECTORY}
    Renomeia e move arquivo para pasta "output"     ${DOWNLOAD_DIRECTORY}   ${CNES_FILE_NAME}
