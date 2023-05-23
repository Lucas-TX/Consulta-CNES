*** Settings ***
Library     CSVLibrary
Library     RPA.Tasks



*** Variables ***
${PATH_CSV}     Input/LOCALIDADES.csv


*** Test Cases ***
Example Test Case
    @{LIST}     read csv file to list   ${PATH_CSV}

    Log  ${list}
    Log  ${list[0]}
    Log  ${list[1][0]}
    Log  ${list[1][1]}