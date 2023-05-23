*** Settings ***
Documentation   Page Objects do resultado da consulta dos estabelecimentos
Library         SeleniumLibrary
Library         String
*** Variables ***

${BOTAO_DETALHES}           xpath=/html/body/div[2]/main/div/div[2]/div/div[3]/table/tbody/tr[1]/td[8]/a
${SELETOR_QTD_PAGINAS}      xpath=/html/body/div[2]/main/div/div[2]/div/div[3]/div/div/div/ul/li[10]/a/span
${QTD_ITENS_PAGINA}         10
${SELETOR_DT_RESULTADOS}    xpath=/html/body/div[2]/main/div/div[2]/div/div[3]/table/tbody/tr[i]/td[j]


*** Keywords ***

Abre Detalhes
    click link  ${BOTAO_DETALHES}

Captura quantidade de páginas
    ${QTD_PAGINAS}   get text   ${SELETOR_QTD_PAGINAS}

Captura dados de uma linha
    [Arguments]  ${index}
    ${seletor_resultados}   Convert To Uppercase

    ${UF}                   get text        xpath=/html/body/div[2]/main/div/div[2]/div/div[3]/table/tbody/tr[i]/td[j]
    ${MUNICIPIO}            get text        xpath=/html/body/div[2]/main/div/div[2]/div/div[3]/table/tbody/tr[1]/td[i]
    ${CNES}                 get text        xpath=/html/body/div[2]/main/div/div[2]/div/div[3]/table/tbody/tr[1]/td[i]
    ${NOME_FANTASIA}        get text        xpath=/html/body/div[2]/main/div/div[2]/div/div[3]/table/tbody/tr[1]/td[i]
    ${NATUREZA_JURIDICA}    get text        xpath=/html/body/div[2]/main/div/div[2]/div/div[3]/table/tbody/tr[1]/td[i]
    ${GESTAO}               get text        xpath=/html/body/div[2]/main/div/div[2]/div/div[3]/table/tbody/tr[1]/td[i]
    ${ATENDE_SUS}           get text        xpath=/html/body/div[2]/main/div/div[2]/div/div[3]/table/tbody/tr[1]/td[i]

    log many  ${UF}    ${MUNICIPIO}    ${CNES}    ${NOME_FANTASIA}    ${NATUREZA_JURIDICA}    ${GESTAO}    ${ATENDE_SUS}

Captura todos os dados da página
    ${index}    set variable  0
    :FOR  ${index}  IN RANGE  ${QTD_ITENS_PAGINA}
    /  repeat keyword  ${qtd_itens_pagina}  Captura dados de uma linha  ${index}


