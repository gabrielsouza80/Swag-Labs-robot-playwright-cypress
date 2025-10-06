*** Settings ***
Library         SeleniumLibrary
Library         JSONLibrary
Library         Collections
Library         Browser

#Keywords
Resource        ./Pages/LoginPage/LoginKeywords.resource
Resource        ./Pages/InventoryPage/InventoryKeywords.resource

#locators
Resource        ./Pages/LoginPage/LoginLocators.resource
Resource        ./Pages/InventoryPage/InventoryLocators.resource

*** Variables ***
${URL}         https://www.saucedemo.com/v1/
${BROWSER}     chromium
@{ARGS}        --disable-password-manager-reauthentication    --disable-save-password-bubble    --disable-notifications    --disable-popup-blocking



${CredentialsJson}             Resources/Settings/credentials.json


*** Keywords ***
Go to Login Page
    New Browser    ${BROWSER}    headless=False    args=${ARGS}
    New Context
    New Page    ${URL}

Close the login page
    Capture Page Screenshot
    Browser.Close Browser
