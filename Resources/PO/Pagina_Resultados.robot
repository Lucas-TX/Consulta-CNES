*** Settings ***
Documentation   Page Objects do resultado da consulta dos estabelecimentos
Library         SeleniumLibrary

*** Variables ***

${BOTAO_DETALHES}           xpath=/html/body/div[2]/main/div/div[2]/div/div[3]/table/tbody/tr[1]/td[8]/a


*** Keywords ***

Abre Detalhes
    click link  ${BOTAO_DETALHES}


