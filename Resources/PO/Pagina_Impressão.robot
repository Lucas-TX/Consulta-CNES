*** Settings ***
Documentation   Page Objects da página de seleção dos módulos para impressão
Library         SeleniumLibrary

*** Variables ***
${CHECKBOX_FICHA_COMPLETA}      xpath=//*[@id="todos"]
${BOTAO_IMPRIMIR}               xpath=//*[@id="informeModal"]/div/div/div/div[2]/button[1]
${BOTAO_FECHA_FICHA}            xpath=//*[@id="informeModal"]/div/div/div/div[2]/button[2]
*** Keywords ***

Verifica carregamento da ficha do estabelecimento
    wait until page contains  Ficha do Estabelecimento

Seleciona ficha completa
    select checkbox  ${CHECKBOX_FICHA_COMPLETA}

Imprime ficha do estabelecimento
    click button  ${BOTAO_IMPRIMIR}

Fecha ficha do estabelecimento
    click button    ${BOTAO_FECHA_FICHA}