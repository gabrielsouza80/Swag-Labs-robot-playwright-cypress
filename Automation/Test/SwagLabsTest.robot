*** Settings ***
Resource    ../Resources/Base.resource
Test Setup       Go to Login Page
Test Teardown    Close the login page


*** Test Cases ***
Usuário insere credenciais válidas
    [Documentation]    Teste de login válido
    Login With Valid Credentials
    