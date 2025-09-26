*** Settings ***
Resource    ../Base.resource

*** Keywords ***
Go to Login Page
    [Documentation]    Navigates to the login page.
    Open Browser    ${URL}    ${BROWSER}    options=add_argument(--headless=${HEADLESS})    options=add_argument(--window-size=${WINDOW_SIZE})
    Set Selenium Implicit Wait    ${IMPLICIT_WAIT}
    Set Selenium Timeout    ${PAGE_LOAD_TIMEOUT}

Login With Valid Credentials
    [Documentation]    Logs in with valid credentials from JSON file.
    ${credentials}=    Load JSON From File    ${CredentialsJson}
    ${user_dictionary}=    Get Value From Json    ${credentials}    $.users[?(@.role=="standard")][0]
    
    # Pega username e password
    ${username}=    Get From Dictionary    ${user_dictionary}    username
    ${password}=    Get From Dictionary    ${user_dictionary}    password
    Log To Console    Usuario: ${username}, Senha: ${password}
    Input Text    ${LOGIN_USERNAME_FIELD}    ${username}
    Input Text    ${LOGIN_PASSWORD_FIELD}    ${password}
    Click Button    ${LOGIN_BUTTON}
    Wait Until Page Contains Element    ${PRODUCTS_TITLE}    timeout=${PAGE_LOAD_TIMEOUT}