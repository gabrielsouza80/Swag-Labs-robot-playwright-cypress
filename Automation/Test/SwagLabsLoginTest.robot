*** Settings ***
Resource                          ../Resources/Base.resource
Test Setup                        Go to Login Page
Test Teardown                     Run Keywords    sleep    10s    AND    Close the login page 

*** Test Cases ***

#TODO: <Login Tests>
TC01 – Autenticação de usuário → Usuário insere credenciais válidas    
    [Documentation]    Teste de login válido 
    [Tags]    TC01    
    Login with credentials    standard
    Check if you went to the expected page    ${DivTitleHeaderInventory}

TC10 – Validação de campos obrigatórios → Usuário tenta logar sem preencher username
    [Documentation]    Teste de login sem preencher username
    [Tags]    TC10
    Login with invalid credentials    ${EMPTY}    secret_sauce                
    Check message    Epic sadface: Username is required

Criar – Validação de campos obrigatórios → Usuário tenta logar sem preencher senha
    [Documentation]    Teste de login sem preencher senha
    [Tags]    TC10
    Login with invalid credentials    standard_user    ${EMPTY}
    Check message    Epic sadface: Password is required    
    
TC07 – Sessão de usuário → Usuário realiza logout
    [Documentation]    Teste de logout
    [Tags]    TC07
    Login with credentials    standard
    Check if you went to the expected page    ${DivTitleHeaderInventory}
    Click on "Logout"
    Check if you went to the expected page    ${LOGIN_BUTTON}

TC08 – Validação de autenticação → Usuário insere username inexistente
    [Documentation]    Teste de login com usuário inexistente
    [Tags]    TC08
    Login with invalid credentials    inexistent_user    secret_sauce
    Check message    ${Message}

TC09 – Validação de autenticação → Usuário insere senha incorreta
    [Documentation]    Teste de login com senha incorreta
    [Tags]    TC09
    Login with invalid credentials    standard_user    wrong_password
    Check message    ${Message}

TC11 – Validação de campos → Usuário insere username e senha acima do limite permitido
    [Documentation]    Teste de login com username e senha acima do limite permitido com 255 caracteres
    [Tags]    TC11
    ${long_username}    ${long_password}=    Username and password with 255 characters
    Login with invalid credentials    ${long_username}    ${long_password}
    Check message    ${Message}

TC12 – Segurança do login → Usuário erra a senha várias vezes seguidas
    [Documentation]    Teste de login com várias tentativas de senha incorreta
    [Tags]    TC12
    FOR    ${i}    IN RANGE    6
        Login with invalid credentials    standard_user    wrong_password
        Check message    ${Message}
    END
    
# #TC15 – Sessão de usuário / Carrinho → Usuário adiciona itens, faz logout e login novamente
#     [Documentation]    Teste de adicionar itens ao carrinho, fazer logout e login novamente
#     [Tags]    TC15

TC16 – Segurança de rotas → Usuário não logado acessa /checkout
     [Documentation]    Teste de acesso à página de checkout sem estar logado
     [Tags]    TC16
     Go To    https://www.saucedemo.com/v1/checkout-step-one.html
     Check if you went to the expected page    ${LOGIN_BUTTON}

Criar-Usuário insere username Locked Out
    [Documentation]    Teste de login com usuário bloqueado
    [Tags]    Criar
    Login with credentials    Locked
    Check message    Epic sadface: Sorry, this user has been locked out.    

Criar-Usuário insere username Problem User
    [Documentation]    Teste de login com usuário problemático
    [Tags]    
    Login with credentials    problem
    Check if you went to the expected page    ${DivTitleHeaderInventory}


Criar-Usuário insere username Performance Problem
    [Documentation]    Teste de login com usuário com problema de performance
    [Tags]    
    Login with credentials    performance_problem
    Check if you went to the expected page    ${DivTitleHeaderInventory}
