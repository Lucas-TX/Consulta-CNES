# Run esse script:
# robot -d Results Tests/Consulta_CNES.robot

# TODO: Usar .bat file para executar essa suite de testes
# TODO: Renomear tags de cada teste
# TODO: Colocar dados lidos na lista e insesir no log
# TODO: Fazer loop em cada CNES da página Resultados (10)
# TODO: Alterar locators do Estado para contemplar option[i] -> UF, i -> 2:28
# Opções em formato de UF em que varia de 2 a 28
# /html/body/div[2]/main/div/div[2]/div/form[1]/div[2]/div[1]/div/select/option[28]
# /html/body/div[2]/main/div/div[2]/div/form[1]/div[2]/div[1]/div/select/option[13]
# /html/body/div[2]/main/div/div[2]/div/form[1]/div[2]/div[1]/div/select/option[2]

# TODO: Definir estratégia de Leitura de cada página de resultados->
# TODO: Refazer busca desde o início para capturar os outros 9 resultados
# TODO: voltar da impressão e refazer a impressão para os outros resultados

# TODO: Há como ler todo o Data table da página de resultados?




*** Settings ***
Documentation       Essa suite de testes consulta e extrai dados dos estabelecimentos de saúde de um dado município
Resource            ../Resources/Consulta_App.robot
Resource            ../Resources/Comum.robot
Resource            ../Resources/Leitura_CSV.robot
Suite Setup         Comum.Inicia Teste Web
Suite Teardown      Comum.Fecha browser

*** Variables ***
${URL}                      https://cnes.datasus.gov.br/pages/estabelecimentos/consulta.jsp
${ESTADO}                   PARANA
${MUNICIPIO}                CURITIBA
${CNES_FILE_NAME}           -CNES.pdf

${CNES}                     0
${QTD_PAGINAS}              0  # Armazena a quantidade de páginas disponíveis


*** Test Cases ***

Deve ser capaz de ler os dados do ".csv"
    [Documentation]             Teste de carregamento dos resultado da busca dos estabelecimentos de saúde
    [Tags]                      1001    Smoke   Carregamento

    Leitura_CSV.Leitura arquivo "LOCALIDADES.csv"
    log  Leitura de todos os dados do CSV e retorno de uma lista de listas

Deve ser capaz de carregar os estabelecimentos presentes na localidade
    [Documentation]             Teste de carregamento dos resultado da busca dos estabelecimentos de saúde
    [Tags]                      1002    Smoke   Carregamento

    Consulta_App.Pesquisa Estabelecimentos de Saúde    ${URL}   ${ESTADO}   ${MUNICIPIO}

Deve ser capaz de ler e armazenar dados
    [Documentation]             Teste de carregamento da página inicial para consulta dos estabelecimentos
    [Tags]                      1003    Smoke   Carregamento

    # capturando primeira linha apenas: tr[1]

    # /html/body/div[2]/main/div/div[2]/div/div[3]/table/tbody/tr[1] -> Seletor 1° linha
    # /html/body/div[2]/main/div/div[2]/div/div[3]/table/tbody/tr[2] -> Seletor 2° linha

    ${UF}                   get text        xpath=/html/body/div[2]/main/div/div[2]/div/div[3]/table/tbody/tr[1]/td[1]
    ${MUNICIPIO}            get text        xpath=/html/body/div[2]/main/div/div[2]/div/div[3]/table/tbody/tr[1]/td[2]
    ${CNES}                 get text        xpath=/html/body/div[2]/main/div/div[2]/div/div[3]/table/tbody/tr[1]/td[3]
    ${NOME_FANTASIA}        get text        xpath=/html/body/div[2]/main/div/div[2]/div/div[3]/table/tbody/tr[1]/td[4]
    ${NATUREZA_JURIDICA}    get text        xpath=/html/body/div[2]/main/div/div[2]/div/div[3]/table/tbody/tr[1]/td[5]
    ${GESTAO}               get text        xpath=/html/body/div[2]/main/div/div[2]/div/div[3]/table/tbody/tr[1]/td[6]
    ${ATENDE_SUS}           get text        xpath=/html/body/div[2]/main/div/div[2]/div/div[3]/table/tbody/tr[1]/td[7]

    log many  ${UF}    ${MUNICIPIO}    ${CNES}    ${NOME_FANTASIA}    ${NATUREZA_JURIDICA}    ${GESTAO}    ${ATENDE_SUS}



Deve ser capaz de visualizar a ficha do estabelecimento
    [Documentation]             Teste de carregamento da página inicial para consulta dos estabelecimentos
    [Tags]                      1004    Smoke   Carregamento

    Consulta_App.Abre Ficha do estabelecimento

Deve ser capaz de imprimir a ficha completa do estabelecimento
    [Documentation]             Teste de carregamento da página inicial para consulta dos estabelecimentos
    [Tags]                      1005    Smoke   Carregamento

    Consulta_App.Imprime ficha completa

Deve ser capaz de salvar arquivo na pasta "Output"
    [Documentation]             Teste de carregamento da página inicial para consulta dos estabelecimentos
    [Tags]                      1006    Smoke   Carregamento

    ${CNES_FILE_NAME}           set variable                  123456-CNES.pdf
    ${username}                 Get Environment Variable      USERNAME
    ${DOWNLOAD_DIRECTORY}       Catenate                      SEPARATOR=${/}    C:    Users    ${username}    Downloads


    Consulta_App.Valida e move arquivo baixado para pasta "Output"     ${DOWNLOAD_DIRECTORY}     ${CNES_FILE_NAME}


