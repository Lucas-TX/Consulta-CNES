*** Settings ***
Documentation                           Page Objects da página de consulta dos estabelecimentos
Library                                 SeleniumLibrary

*** Variables ***
${CHECKBOX_ESTADO}                      xpath=/html/body/div[2]/main/div/div[2]/div/form[1]/div[2]/div[1]/div/select
${CHECKBOX_MUNICIPIO}                   xpath=/html/body/div[2]/main/div/div[2]/div/form[1]/div[2]/div[2]/div/select
${BOTAO_PESQUISAR}                      xpath=/html/body/div[2]/main/div/div[2]/div/form[2]/div/button
${BOTAO_MAIS_DETALHES}                  xpath=/html/body/div[2]/main/div/div[2]/div/div[3]/table/tbody/tr[1]/td[8]/button/span

*** Keywords ***
# TODO: Por que o pychram não está identificando aS variáveis Globais do Consulta_CNES.robot

Carrega Página
    go to   ${URL}

Verifica Carregamento
    wait until page contains            CONSULTA ESTABELECIMENTO - IDENTIFICAÇÃO

Seleciona Estado
    select from list by label           ${CHECKBOX_ESTADO}    ${ESTADO}

Seleciona Município
    select from list by label           ${CHECKBOX_MUNICIPIO}     ${MUNICIPIO}

Pesquisa
    click button                        ${BOTAO_PESQUISAR}

Verifica Carregamento Dos Resultados
    wait until page contains element    ${BOTAO_MAIS_DETALHES}

