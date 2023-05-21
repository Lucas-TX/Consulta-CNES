*** Settings ***
Documentation   Talk about what this suite of tests does
Library         SeleniumLibrary
# Run esse script:
# robot -d Results Tests/Consulta_CNES.robot
*** Variables ***
${qtd_paginas}  35  # Armazena a quantidade de páginas disponíveis
${UF}   null
${municipio}    null
${nome_fantasia}    null
${natureza_juridica}    null
${gestao}   null
${atende_SUS}   null


*** Test Cases ***
Deve ser capaz de carregar a página de consulta
    [Documentation]             Teste de carregamento da página inicial para consulta dos estabelecimentos
    [Tags]                      1001    Smoke   Carregamento
    # Inicializando Selenium
    set selenium speed          .2s
    set selenium timeout        10s

    # Abrindo browser
    log                         Starting test case
    open browser                https://cnes.datasus.gov.br/pages/estabelecimentos/consulta.jsp     chrome

    # Maximiza o browser
    maximize browser window

    # Verifica se página foi carregada
    wait until page contains    CONSULTA ESTABELECIMENTO - IDENTIFICAÇÃO

    # Consulta estabelecimentos
    select from list by label   xpath=/html/body/div[2]/main/div/div[2]/div/form[1]/div[2]/div[1]/div/select    PARANA
    select from list by label   xpath=/html/body/div[2]/main/div/div[2]/div/form[1]/div[2]/div[2]/div/select    CURITIBA
    click button                xpath=/html/body/div[2]/main/div/div[2]/div/form[2]/div/button

    # Verifica se os estabelecimentos foram carregados - não está funcionando
    wait until page contains    CNES
    sleep  5s

    # Captura quantidade de páginas lidas
     set variable  ${qtd_paginas} get text  xpath=/html/body/div[2]/main/div/div[2]/div/div[3]/div/div/div/ul/li[10]/a/span
    log         ${qtd_paginas}

    # Captura dados: UF,Município, CNES, Nome Fantasia, Natureza Jurídica(Grupo),Gestão, Atende SUS
    # capturando primeira linha apenas: tr[1]
    ${UF}  get text                 xpath=/html/body/div[2]/main/div/div[2]/div/div[3]/table/tbody/tr[1]/td[1]
    ${municipio}  get text          xpath=/html/body/div[2]/main/div/div[2]/div/div[3]/table/tbody/tr[1]/td[2]
    ${cnes}  get text               xpath=/html/body/div[2]/main/div/div[2]/div/div[3]/table/tbody/tr[1]/td[3]
    ${nome_fantasia}  get text      xpath=/html/body/div[2]/main/div/div[2]/div/div[3]/table/tbody/tr[1]/td[4]
    ${natureza_juridica}  get text  xpath=/html/body/div[2]/main/div/div[2]/div/div[3]/table/tbody/tr[1]/td[5]
    ${gestao}  get text             xpath=/html/body/div[2]/main/div/div[2]/div/div[3]/table/tbody/tr[1]/td[6]
    ${atende_SUS}  get text         xpath=/html/body/div[2]/main/div/div[2]/div/div[3]/table/tbody/tr[1]/td[7]

    # /html/body/div[2]/main/div/div[2]/div/div[3]/table/tbody/tr[1] -> Seletor 1° linha
    # /html/body/div[2]/main/div/div[2]/div/div[3]/table/tbody/tr[2] -> Seletor 2° linha

    # Clicando em DETALHES
    click link  xpath=/html/body/div[2]/main/div/div[2]/div/div[3]/table/tbody/tr[1]/td[8]/a

    # Verifica se a janela com a ficha do estabelecimento foi carregada
    wait until page contains  Identificação

    # Abre ficha do estabelecimento
    click element  xpath=//*[@id="estabContent"]/header/nav/div/a/span

    # Verifica se a ficha do estabelecimento está aberta
    wait until page contains  Ficha do Estabelecimento

    # Seleciona ficha completa
    select checkbox  xpath=//*[@id="todos"]

    # Imprime ficha do estabelecimento
    click button  xpath=//*[@id="informeModal"]/div/div/div/div[2]/button[1]

    # Verifica se o arquivo foi baixado
    # Renomear arquivo
    # Mover arquivo para pasta de interesse
    # Fecha ficha do estabelecimento
    click button  xpath=//*[@id="informeModal"]/div/div/div/div[2]/button[2]

    # Verifica se a ficha do estabelecimento foi fechada

    sleep                       3s
    close browser


