*** Settings ***
Library         SeleniumLibrary


*** Keywords ***

Inicializa Selenium
    set selenium speed          .2s
    set selenium timeout        10s

Inicia Teste Web
    Inicializa Selenium
    open browser                about:blank    chrome
    maximize browser window

Fecha browser
    close browser