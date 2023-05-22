*** Settings ***
Documentation   Resources are located in the PO directory
Resource  ../Resources/PO/Pagina_Consulta.robot
Resource  ../Resources/PO/Pagina_Resultados.robot
Resource  ../Resources/PO/Pagina_Identificacão.robot
Resource  ../Resources/PO/Pagina_Impressão.robot


*** Variables ***

*** Keywords ***

Pesquisa Estabelecimentos de Saúde
    [Arguments]                         ${URL}
    Carrega Página                      ${URL}
    Verifica Carregamento
    Seleciona Estado
    Seleciona Município
    Pesquisa
    Verifica Carregamento Dos Resultados