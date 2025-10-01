*** Settings ***
Resource    ../Resources/Base.resource
Test Setup       Go to Login Page
Test Teardown    Run Keywords    sleep    10s    AND    Close the login page 

*** Test Cases ***
TC01-Usuário insere credenciais válidas
    [Documentation]    Teste de login válido
    Login with credentials    0
    Page Should Contain Element    ${DivTitleHeaderInventory}
    
Criar-Usuário insere username Locked Out
    [Documentation]    Teste de login com usuário bloqueado
    Login with credentials    1
    Page Should Contain    Epic sadface: Sorry, this user has been locked out.

TC10-Usuário tenta logar sem preencher username ou senha
    [Documentation]    Teste de login sem preencher username ou senha
    Login without credentials
    Page Should Contain    Epic sadface: Username is required
    
TC07-Usuário realiza logout
    [Documentation]    Teste de logout
    Login with credentials    0
    Page Should Contain Element    ${DivTitleHeaderInventory}
    Sleep    10s
    Click on "Open Menu"
    Click on "Logout"
    Page Should Contain Element    ${LOGIN_BUTTON}