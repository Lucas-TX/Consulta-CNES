# Run esse script:
# robot -d Results Tests/Consulta_CNES.robot

# TODO: Usar .bat file para executar essa suite de testes
# TODO: Renomear tags de cada teste
# TODO: Verificar possibilidade de colocar dados na lista
# TODO: Fazer loop em cada CNES da página Resultados (10)
# TODO: Verificar com usar .csv como input
# TODO: Usar Repeat Keyword para repetir ações




*** Settings ***
Documentation       Essa suite de testes consulta e extrai dados dos estabelecimentos de saúde de um dado município
Resource            ../Resources/Consulta_App.robot
Resource            ../Resources/Comum.robot
Suite Setup         Comum.Inicia Teste Web
Suite Teardown      Comum.Fecha browser




*** Variables ***
${URL}                      https://cnes.datasus.gov.br/pages/estabelecimentos/consulta.jsp
${ESTADO}                   PARANA
${MUNICIPIO}                CURITIBA
${CNES_FILE_NAME}           Número-CNES.pdf

@{DADOS_ESTABELECIMENTO}    VAZIO
${QTD_PAGINAS}              0  # Armazena a quantidade de páginas disponíveis
${UF}                       vazio
${CNES}                     VAZIO
${NOME_FANTASIA}            VAZIO
${NATUREZA_JURIDICA}        null
${GESTAO}                   null
${ATENDE_SUS}               null


*** Test Cases ***
Deve ser capaz de carregar os estabelecimentos presentes na localidade
    [Documentation]             Teste de carregamento dos resultado da busca dos estabelecimentos de saúde
    [Tags]                      1001    Smoke   Carregamento

    Consulta_App.Pesquisa Estabelecimentos de Saúde    ${URL}   ${ESTADO}   ${MUNICIPIO}

Deve ser capaz de ler e armazenar
    [Documentation]             Teste de carregamento da página inicial para consulta dos estabelecimentos
    [Tags]                      1002    Smoke   Carregamento

    # Captura quantidade de páginas lidas
    ${QTD_PAGINAS}   get text  xpath=/html/body/div[2]/main/div/div[2]/div/div[3]/div/div/div/ul/li[10]/a/span
    log              ${QTD_PAGINAS}

    # Captura dados: UF,Município, CNES, Nome Fantasia, Natureza Jurídica(Grupo),Gestão, Atende SUS
    # capturando primeira linha apenas: tr[1]
    # TODO: armazenar dados em um vetor
    # @{dados_estabelecimento}    get text
    ${UF}                           get text                 xpath=/html/body/div[2]/main/div/div[2]/div/div[3]/table/tbody/tr[1]/td[1]
    ${MUNICIPIO}                    get text          xpath=/html/body/div[2]/main/div/div[2]/div/div[3]/table/tbody/tr[1]/td[2]
    ${CNES}                         get text               xpath=/html/body/div[2]/main/div/div[2]/div/div[3]/table/tbody/tr[1]/td[3]
    ${NOME_FANTASIA}                get text      xpath=/html/body/div[2]/main/div/div[2]/div/div[3]/table/tbody/tr[1]/td[4]
    ${NATUREZA_JURIDICA}            get text  xpath=/html/body/div[2]/main/div/div[2]/div/div[3]/table/tbody/tr[1]/td[5]
    ${GESTAO}                       get text             xpath=/html/body/div[2]/main/div/div[2]/div/div[3]/table/tbody/tr[1]/td[6]
    ${ATENDE_SUS}                   get text         xpath=/html/body/div[2]/main/div/div[2]/div/div[3]/table/tbody/tr[1]/td[7]

    # /html/body/div[2]/main/div/div[2]/div/div[3]/table/tbody/tr[1] -> Seletor 1° linha
    # /html/body/div[2]/main/div/div[2]/div/div[3]/table/tbody/tr[2] -> Seletor 2° linha

Deve ser capaz de visualizar a ficha do estabelecimento
    [Documentation]             Teste de carregamento da página inicial para consulta dos estabelecimentos
    [Tags]                      1003    Smoke   Carregamento

    Consulta_App.Abre Ficha do estabelecimento

Deve ser capaz de imprimir a ficha completa do estabelecimento
    [Documentation]             Teste de carregamento da página inicial para consulta dos estabelecimentos
    [Tags]                      1004    Smoke   Carregamento

    Consulta_App.Imprime ficha completa

Deve ser capaz de salvar arquivo na pasta "Output"
    [Documentation]             Teste de carregamento da página inicial para consulta dos estabelecimentos
    [Tags]                      1005    Smoke   Carregamento

    ${CNES_FILE_NAME}           set variable                  123456-CNES.pdf
    ${username}                 Get Environment Variable      USERNAME
    ${DOWNLOAD_DIRECTORY}       Catenate                      SEPARATOR=${/}    C:    Users    ${username}    Downloads


    Consulta_App.Valida e move arquivo baixado para pasta "Output"     ${DOWNLOAD_DIRECTORY}     ${CNES_FILE_NAME}


