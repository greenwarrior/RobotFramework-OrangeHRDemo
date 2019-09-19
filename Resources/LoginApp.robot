*** Settings ***
Resource  ../Resources/CommonWeb.robot
Resource  ../Resources/PO/Landing.robot
Resource  ../Resources/PO/SignIn.robot


*** Variables ***


*** Keywords ***
Navigate to Landing Page
    Landing.Navigate to

Login to Account
    [Arguments]  ${UserData}
    Navigate to Landing Page
    SignIn.Fill In Login Credentials  ${UserData}
    SignIn.Click Login

Verify Login Page is Loaded Successfully
    SignIn.Verify Page Loaded

Test Multiple Login Scenarios
    [Arguments]  ${Credentials}
    Navigate to Landing Page
    SignIn.Attempt Login  ${Credentials}
    SignIn.Verify Login Page Error Message  ${Credentials.ExpectedErrorMessage}


