*** Settings ***
Library     CSVLibrary


*** Variables ***
${PATH_CSV}     Input/LOCALIDADES.csv
@{LIST}         VAZIO


*** Keywords ***

Leitura arquivo "LOCALIDADES.csv"
    @{LIST}     read csv file to list   ${PATH_CSV}