*** Settings ***
Library         SeleniumLibrary
Library         JSONLibrary

#Pages
Resource        Pages/loginPage.resource


#Keywords
Resource        Keywords/LoginKeywords.resource


#locators
Resource        Locators/LoginLocators.resource


#Test
Resource        ../Test/SwagLabsTest.robot


*** Variables ***

${URL}                         https://www.saucedemo.com/v1/
${BROWSER}                     Chrome       
${CredentialsJson}            Settings/credentials.json

${IMPLICIT_WAIT}               5s
${PAGE_LOAD_TIMEOUT}           10s    
${WINDOW_SIZE}                 2560x1440