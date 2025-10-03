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
${URL}                         https://www.saucedemo.com/v1/
${BROWSER}                     Chrome       

${CredentialsJson}             Resources/Settings/credentials.json


*** Keywords ***
Go to Login Page
    Open Browser   browser=chrome  
    ...  options=add_experimental_option("detach", True)
    Maximize Browser Window
    Go To    ${URL}

Close the login page
    Capture Page Screenshot
    Close Browser
