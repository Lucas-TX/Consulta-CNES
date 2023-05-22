*** Settings ***
Documentation   Page Objects da página que identifica e mostra os módulos do estabelecimento
Library         SeleniumLibrary

*** Variables ***

${BOTAO_HABILITA_IMPRIMIR}           xpath=//*[@id="estabContent"]/header/nav/div/a/span

*** Keywords ***

Verifica abertura da página de identificação
    wait until page contains  Identificação

Abre ficha para impressão
    click element  ${BOTAO_HABILITA_IMPRIMIR}
