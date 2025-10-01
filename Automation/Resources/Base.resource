*** Settings ***
Library         SeleniumLibrary
Library         JSONLibrary
Library         Collections

#Pages
Resource        Pages/loginPage.resource


#Keywords
Resource        Keywords/LoginKeywords.resource


#locators
Resource        Locators/LoginLocators.resource

*** Variables ***

${URL}                         https://www.saucedemo.com/v1/
${BROWSER}                     Chrome       

${CredentialsJson}             Resources/Settings/credentials.json


*** Keywords ***
Abrir o navegador
    Open Browser   browser=chrome  
    ...  options=add_experimental_option("detach", True)
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser
