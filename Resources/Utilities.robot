*** Settings ***
Library  SeleniumLibrary
Library  ../CustomLib/utility.py


*** Keywords ***
Extract Element Value
    [Arguments]  ${Element}
    ${Tag_Text} =  get element text  ${Element}
    [Return]  ${Tag_Text}

Enter Text then Press Enter
    [Arguments]  ${TextInputField}  ${TextInputValue}
    enter text  ${TextInputField}  ${TextInputValue}








