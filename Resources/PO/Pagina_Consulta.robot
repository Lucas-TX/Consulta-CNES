*** Settings ***
Documentation   Page Objects da página de consulta dos estabelecimentos
Library         SeleniumLibrary
*** Variables ***
*** Keywords ***



Carrega Página
    go to   https://cnes.datasus.gov.br/pages/estabelecimentos/consulta.jsp

Verifica Carregamento
    wait until page contains    CONSULTA ESTABELECIMENTO - IDENTIFICAÇÃO

Seleciona Estado
    select from list by label   xpath=/html/body/div[2]/main/div/div[2]/div/form[1]/div[2]/div[1]/div/select    PARANA

Seleciona Município
    select from list by label   xpath=/html/body/div[2]/main/div/div[2]/div/form[1]/div[2]/div[2]/div/select    CURITIBA

Pesquisa
    click button                xpath=/html/body/div[2]/main/div/div[2]/div/form[2]/div/button

Verifica Carregamento Dos Resultados
    wait until page contains element  xpath=/html/body/div[2]/main/div/div[2]/div/div[3]/table/tbody/tr[1]/td[8]/a
    # sleep  5s

