*** Settings ***
Library         SeleniumLibrary
Library         JSONLibrary
Library         Collections


#Keywords
Resource        ./Pages/LoginPage/LoginKeywords.resource
Resource        ./Pages/InventoryPage/InventoryKeywords.resource

#locators
Resource        ./Pages/LoginPage/LoginLocators.resource
Resource        ./Pages/InventoryPage/InventoryLocators.resource

*** Variables ***
${URL}         https://www.saucedemo.com/v1/
${BROWSER}     Edge




${CredentialsJson}             Resources/Settings/credentials.json


*** Keywords ***
Go to Login Page
    # Abre o navegador com os argumentos
    Open Browser    ${URL}    ${BROWSER}    

    
Close the login page
    Capture Page Screenshot
    Close Browser

