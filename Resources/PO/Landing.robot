*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${LOGIN_USER_INPUT}  id=txtUsername
${LOGIN_PASSWORD_INPUT}  id=txtPassword
${LOGIN_BUTTON}  id=btnLogin

*** Keywords ***
Navigate to
    Go to  ${BASE_URL}


