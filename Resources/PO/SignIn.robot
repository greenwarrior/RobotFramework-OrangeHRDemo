*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${LOGIN_USER_INPUT}  id=txtUsername
${LOGIN_PASSWORD_INPUT}  id=txtPassword
${LOGIN_BUTTON}  id=btnLogin

*** Keywords ***
Fill In Login Credentials
    [Arguments]  ${UserData}
    Fill Username  ${UserData.UserName}
    Fill Password  ${UserData.Password}

Fill Username
    [Arguments]  ${Username}
    Input Text  ${LOGIN_USER_INPUT}  ${Username}

Fill Password
    [Arguments]  ${Password}
    Input Text  ${LOGIN_PASSWORD_INPUT}  ${Password}

Click Login
     Click Button  ${LOGIN_BUTTON}


Verify Page Loaded
    Wait until page contains  Welcome


Enter Credentials
    [Arguments]  ${Credentials}
    run keyword unless  '${Credentials.UserName}' == '#BLANK'  Input Text  ${LOGIN_USER_INPUT}  ${Credentials.UserName}
    run keyword unless  '${Credentials.Password}' == '#BLANK'  Input Text  ${LOGIN_PASSWORD_INPUT}   ${Credentials.Password}

Attempt Login
    [Arguments]  ${Credentials}
    Enter Credentials  ${Credentials}
    Click Login

Verify Login Page Error Message
    [Arguments]  ${ExpectedErrorMessage}
    Page Should Contain  ${ExpectedErrorMessage}
    log  ${ExpectedErrorMessage}
