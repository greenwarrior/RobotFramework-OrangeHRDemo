*** Settings ***
Resource  ../Resources/CommonWeb.robot
Resource  ../Resources/LoginApp.robot
Resource  ../Data/DataInput.robot
Test Setup  CommonWeb.Begin Web Test
Test Teardown  CommonWeb.End Web Test

*** Variables ***


*** Keywords ***



*** Test Cases ***
User should be able to view landing page
    [Tags]  landing
    LoginApp.Navigate to Landing Page
    Sleep  5 s

Test multiple login scenarios messages
    [Tags]  multi
    [Template]  Test Multiple Login Scenarios
    ${UNREGISTERED_USER}
    ${INCORRECT_PASSWORD_USER}
    ${BLANK_CREDENTIALS_USER}


Valid users should be able to login to account
    [Tags]  Login
    LoginApp.Login to account  ${ADMIN_USER}








