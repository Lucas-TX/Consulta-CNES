*** Settings ***
Documentation   Talk about what this suite of tests does
Library         SeleniumLibrary
# Run esse script:
# robot -d Results Tests/Consulta_CNES.robot
*** Variables ***

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

    wait until page contains    CONSULTA ESTABELECIMENTO - IDENTIFICAÇÃO
    select from list by value   xpath=/html/body/div[2]/main/div/div[2]/div/form[1]/div[2]/div[1]/div/select    41





    sleep                       3s
    close browser


