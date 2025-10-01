*** Settings ***
Resource    ../Base.resource

*** Keywords ***
Click on "Open Menu"
    Click Element    ${BtnOpenMenu}
    Sleep    2s

Click on "Logout"
    Click Element    ${ABtnLogout}
    