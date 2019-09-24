*** Settings ***
Library  SeleniumLibrary
Library  CustomLib/utility.py


*** Keywords ***
Extract Element Value
    [Arguments]  ${Element}
    ${Tag_Text} =  get element text  ${Element}
    [Return]  ${Tag_Text}

Enter Field Value then Press Enter Key
    [Arguments]  ${TextInputField}  ${TextInputValue}
    enter text key press  ${TextInputField}  ${TextInputValue}

#Verify Correct URL
#    [Arguments]  ${ExpectedUrl}
#    Utilities.Verify Correct URL  ${ExpectedUrl}

Verify Correct URL
    [Arguments]  ${BaseUrl}
    ${url} =  Execute Javascript  return window.location.href;
    Should Be Equal As Strings    ${url}    ${BaseUrl}
    Log  ${url}
    Log  ${BaseUrl}
    [Return]  ${url}

Utilities.Text Field is Blank
    [Arguments]  ${Element}
    ${name} =  Get Element Attribute  ${Element}  value
    Run Keyword If    "${name}"== "${BLANK_INPUT_FIELD}"    Log  Name field contains ${name}

Check Attribute Value
    [Arguments]  ${element}  ${value}
    Sleep  1 s
    Element Attribute Value Should Be  ${element}  value  ${value}
    Log  ${value}

Check If Form Contains Text
    [Arguments]  ${element}  ${text}
    Element Should Contain  ${element}   ${text}
