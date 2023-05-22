*** Settings ***
Documentation   Resources are located in the PO directory
Resource  ../Resources/PO/Pagina_Consulta.robot
Resource  ../Resources/PO/Pagina_Resultados.robot
Resource  ../Resources/PO/Pagina_Identificacão.robot
Resource  ../Resources/PO/Pagina_Impressão.robot


*** Variables ***

*** Keywords ***

Pesquisa Estabelecimentos de Saúde
    [Arguments]                         ${URL}  ${ESTADO}   ${MUNICIPIO}
    Carrega página                      ${URL}
    Verifica carregamento
    Seleciona estado                    ${ESTADO}
    Seleciona município                 ${MUNICIPIO}
    Pesquisa
    Verifica carregamento dos resultados

Abre ficha do estabelecimento
    Abre Detalhes
    Verifica abertura da página de identificação
    Abre ficha para impressão
    Verifica carregamento da ficha do estabelecimento

Imprime ficha completa
    Seleciona ficha completa
    Imprime ficha do estabelecimento
