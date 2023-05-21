*** Settings ***
Documentation   Resources are located in the PO directory
Resource  ../Resources/PO/Pagina_Consulta.robot
Resource  ../Resources/PO/Pagina_Resultados.robot
Resource  ../Resources/PO/Pagina_Identificacão.robot
Resource  ../Resources/PO/Pagina_Impressão.robot


*** Variables ***

*** Keywords ***

Pesquisa Estabelecimentos de Saúde
    Pagina_Consulta.Carrega Página
    Pagina_Consulta.Verifica Carregamento
    Pagina_Consulta.Seleciona Estado
    Pagina_Consulta.Seleciona Município
    Pagina_Consulta.Pesquisa
    Pagina_Consulta.Verifica Carregamento Dos Resultados



