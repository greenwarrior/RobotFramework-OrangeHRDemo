*** Settings ***
Library  SeleniumLibrary


*** Variables ***

*** Keywords ***
Begin Web Test
    set selenium timeout  30 seconds
    Open Browser  about:blank  chrome
    Maximize Browser Window

End Web Test
    Close Browser


Extract Element Value
    [Arguments]  ${Elements}
    ${Element_Value} =  Get Value  ${Elements}
    [Return]   ${Element_Value}