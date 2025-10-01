*** Settings ***
Resource    ../Base.resource

*** Keywords ***
Go to Login Page
    Open Browser    ${URL}    ${BROWSER}    options=add_argument(--window-size=${WINDOW_SIZE})
    Set Selenium Implicit Wait    ${IMPLICIT_WAIT}
    Set Selenium Timeout    ${PAGE_LOAD_TIMEOUT}
    Go To    ${URL}

Fill Username
    [Arguments]    ${username}
    Input Text    ${LOGIN_USERNAME_FIELD}    ${username}

Fill Password
    [Arguments]    ${password}
    Input Text    ${LOGIN_PASSWORD_FIELD}    ${password}

Click Login
    Click Button    ${LOGIN_BUTTON}