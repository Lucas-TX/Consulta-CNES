# Run esse script:
# robot -d Results Tests/Consulta_CNES.robot

# TODO: Usar .bat file para executar essa suite de testes

*** Settings ***
Documentation       Essa suite de testes consulta e extrai dados dos estabelecimentos de saúde de um dado município
Resource            ../Resources/Consulta_CNES_App.robot
Resource            ../Resources/Comum.robot
Suite Setup         Comum.Inicia Teste Web
Suite Teardown      Comum.Fecha browser


*** Variables ***
${URL}                      https://cnes.datasus.gov.br/pages/estabelecimentos/consulta.jsp
${ESTADO}                   PARANA
${MUNICIPIO}                CURITIBA

${QTD_PAGINAS}              0  # Armazena a quantidade de páginas disponíveis
@{DADOS_ESTABELECIMENTO}    VAZIO
${UF}                       vazio
${CNES}                     VAZIO
${NOME_FANTASIA}            VAZIO
${NATUREZA_JURIDICA}        null
${GESTAO}                   null
${ATENDE_SUS}               null


*** Test Cases ***
Deve ser capaz de carregar os estabelecimentos presentes na localidade
    [Documentation]             Teste de carregamento da página inicial para consulta dos estabelecimentos
    [Tags]                      1001    Smoke   Carregamento

    Consulta_CNES_App.Pesquisa Estabelecimentos de Saúde


    # Captura quantidade de páginas lidas
    ${QTD_PAGINAS}   get text  xpath=/html/body/div[2]/main/div/div[2]/div/div[3]/div/div/div/ul/li[10]/a/span
    log              ${QTD_PAGINAS}

    # Captura dados: UF,Município, CNES, Nome Fantasia, Natureza Jurídica(Grupo),Gestão, Atende SUS
    # capturando primeira linha apenas: tr[1]
    # TODO: armazenar dados em um vetor
    # @{dados_estabelecimento}    get text
    ${UF}                           get text                 xpath=/html/body/div[2]/main/div/div[2]/div/div[3]/table/tbody/tr[1]/td[1]
    ${MUNICIPIO}                    get text          xpath=/html/body/div[2]/main/div/div[2]/div/div[3]/table/tbody/tr[1]/td[2]
    ${CNES}                         get text               xpath=/html/body/div[2]/main/div/div[2]/div/div[3]/table/tbody/tr[1]/td[3]
    ${NOME_FANTASIA}                get text      xpath=/html/body/div[2]/main/div/div[2]/div/div[3]/table/tbody/tr[1]/td[4]
    ${NATUREZA_JURIDICA}            get text  xpath=/html/body/div[2]/main/div/div[2]/div/div[3]/table/tbody/tr[1]/td[5]
    ${GESTAO}                       get text             xpath=/html/body/div[2]/main/div/div[2]/div/div[3]/table/tbody/tr[1]/td[6]
    ${ATENDE_SUS}                   get text         xpath=/html/body/div[2]/main/div/div[2]/div/div[3]/table/tbody/tr[1]/td[7]

    # /html/body/div[2]/main/div/div[2]/div/div[3]/table/tbody/tr[1] -> Seletor 1° linha
    # /html/body/div[2]/main/div/div[2]/div/div[3]/table/tbody/tr[2] -> Seletor 2° linha

    # Clicando em DETALHES
    click link  xpath=/html/body/div[2]/main/div/div[2]/div/div[3]/table/tbody/tr[1]/td[8]/a

    # Verifica se a janela com a ficha do estabelecimento foi carregada
    wait until page contains  Identificação

    # Abre ficha do estabelecimento
    click element  xpath=//*[@id="estabContent"]/header/nav/div/a/span

    # Verifica se a ficha do estabelecimento está aberta
    wait until page contains  Ficha do Estabelecimento

    # Seleciona ficha completa
    select checkbox  xpath=//*[@id="todos"]

    # Imprime ficha do estabelecimento
    click button  xpath=//*[@id="informeModal"]/div/div/div/div[2]/button[1]

    # TODO: Verifica se o arquivo foi baixado
    # TODO: Renomear arquivo
    # TODO: Mover arquivo para pasta de interesse
    # Fecha ficha do estabelecimento
    click button  xpath=//*[@id="informeModal"]/div/div/div/div[2]/button[2]

    # TODO: Verifica se a ficha do estabelecimento foi fechada
    sleep                       3s

