*** Settings ***
Resource    ../Base.resource

*** Keywords ***
Go to Login Page
    Open Browser   browser=chrome  
    ...  options=add_experimental_option("detach", True)
    Maximize Browser Window
    Go To    ${URL}

Fill Username
    [Arguments]    ${username}
    Input Text    ${LOGIN_USERNAME_FIELD}    ${username}

Fill Password
    [Arguments]    ${password}
    Input Text    ${LOGIN_PASSWORD_FIELD}    ${password}

Click Login
    Click Button    ${LOGIN_BUTTON}

Close the login page
    Capture Page Screenshot
    Close Browser
