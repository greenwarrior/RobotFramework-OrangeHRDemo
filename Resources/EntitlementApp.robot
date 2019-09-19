*** Settings ***
Library  SeleniumLibrary
Resource  ../Data/DataInput.robot
Resource  ../Resources/PO/EntitlementPage.robot
Resource  ../Resources/Utilities.robot

*** Variables ***


*** Keywords ***
Navigate to 'Entitlement' Page
    Click Link  ${LEAVE.MENU}
    Click Link  ${LEAVE.ENTITLEMENT_MENU}

Navigate to 'Add Entitlements' Page
    Click Link  ${LEAVE.ADD_ENTITLEMENTS_LINK}

Navigate to 'Employee Entitlements' Page
    Click Link  ${LEAVE.EMP_ENTITLEMENTS_LINK}

Verify 'Add Leave Entitlement' Page is Displayed
    Wait Until Page Contains   ${LEAVE.ADD_ENTITLEMENT_PAGE}
    Sleep  5 s

Add Leave Entitlements for Multiple Employees
    [Arguments]  ${Entitlement}
    Click Element  ${LEAVE.MULTIPLE_EMPLOYESS_CHECKBOX}
    Select From List By Value  ${LEAVE.LOCATION_SELECTION}  ${Entitlement.Location}
    Select From List By Value  ${LEAVE.UNIT_SELECTION}  ${Entitlement.Unit}

Add Employee Leave Entitlement Details
    [Arguments]  ${Entitlement}
    Select Leave Type  ${Entitlement.Type}
    Select Leave Period  ${Entitlement.Period}
    Fill in How Many Entitlements  ${Entitlement.Entitlements}

Select Leave Type
    [Arguments]  ${Type}
    Select From List By Value  ${LEAVE.SELECTION}  ${Type}

Select Leave Period
    [Arguments]  ${Period}
    Select From List By Value  ${LEAVE.PERIOD_SELECTION}   ${Period}

Fill in How Many Entitlements
    [Arguments]  ${Entitlements}
    Clear Element Text  ${LEAVE.ENTTLEMENT_INPUT_TEXT}
    Input Text  ${LEAVE.ENTTLEMENT_INPUT_TEXT}  ${Entitlements}


Add Employee Leave Entitlement - Single or Bulk
     [Arguments]  ${Entitlement}
     run keyword if  '${Entitlement.Multi}' == 'Yes'  Add Leave Entitlements for Multiple Employees  ${Entitlement}
     run keyword if  '${Entitlement.Multi}' == 'No'  Add Leave Entitlement for An Employee  ${Entitlement.EmployeeName}

Save Current Employee Entitlement
    Click Button  ${LEAVE.ENTITLEMENT_SAVE_BUTTON}

Verify Matching Employees Assigned to Current Entitlements
    Wait Until Page Contains  OrangeHRM - Matching Employees
    Sleep  5 s

Cancel Current Multi Employee Leave Entitlement
    Click Button   ${LEAVE.BULK_CANCEL_BUTTON}
    Log  '${LEAVE.BULK_CANCEL_BUTTON}'
    Verify 'Add Leave Entitlement' Page is Displayed

Cancel Current Leave Entitlement
    Click Button  ${LEAVE.ENTITLEMENT_CANCEL_BUTTON}

Verify Leave Entitlement is Cancelled
     Wait Until Page Contains  ${LEAVE.ENTITLEMENTS_PAGE}

Fill in Name of Employee
    [Arguments]  ${Entitlement}
    # Verify multiple employee not checked
    #Click Element	${LEAVE.EMPLOYEE_NAME_INPUT_TEXT}
    #Input Text  ${LEAVE.EMPLOYEE_NAME_INPUT_TEXT}  ${Entitlement.EmployeeName}
    #Click Element	${LEAVE.EMPLOYEE_NAME_INPUT_TEXT}
    Utilities.Enter Text then Press Enter  ${LEAVE.EMPLOYEE_NAME_INPUT_TEXT}  ${Entitlement.EmployeeName}
    Sleep  1 s

Confirm Saving Current Multi Employee Leave Entitlement
    Click Button  ${LEAVE.BULK_CONFRIM_BUTTON}

Verify Updated Entitlement
    Sleep  1 s
    Wait Until Page Contains  OrangeHRM - Updating Entitlement
    Sleep  10 s

Cancel Current Entitlement for a Selected Employee
    Wait Until Page Contains Element  ${LEAVE_CANCEL_UPDATE_BUTTON}
    Click Button   ${LEAVE_CANCEL_UPDATE_BUTTON}

Verify Correct URL
    [Arguments]  ${BaseUrl}
    ${url} =  Execute Javascript  return window.location.href;
    Should Be Equal As Strings    ${url}    ${BaseUrl}
    Log  ${url}
    Log  ${BaseUrl}
    [Return]  ${url}

Fill in Employee Details
    [Arguments]  ${Entitlement}
    Fill in Name of Employee  ${Entitlement}
    Select Leave Type  ${Entitlement.Type}
    Select Leave Period  ${Entitlement.Period}


Click Search Button
    Click Button  ${LEAVE_EMP_ENTITLEMENT_SEARCH_BUTTON}

Check Leave Type
    [Arguments]  ${Entitlement}
    ${Leave_Type} =  Utilities.Get Text  css=#resultTable > tbody > tr > td:nth-child(2)
    Should Be Equal As Strings    ${Leave_Type}    ${Entitlement.Type}

Verify Correct Employee Name is Displayed
    [Arguments]  ${EmployeeName}
    Sleep  1 s
    Element Attribute Value Should Be  ${LEAVE.EMPLOYEE_NAME_INPUT_ID_VALUE}  value  ${EmployeeName}

Verify Correct URL - Saved Employee Entitlement
    [Arguments]  ${ExpectedUrl}
    Verify Correct URL  ${ExpectedUrl}

Verify Leave Entitlement is Applied Successfully
    [Arguments]  ${Entitlement}  ${Url}
    Sleep  2 s
    #Wait Until Page Contains  ${Url}
    Verify Correct URL - Saved Employee Entitlement  ${Url}
    Sleep  2 s
    Verify Correct Employee Name is Displayed  ${Entitlement.EmployeeName}
    #Wait Until Page Contains  Added
    Element Should Contain  //*[@id="resultTable"]/tbody/tr   Added

Verify Leave Entitlement is Not Applied
    [Arguments]  ${Entitlement}  ${Url}
    Sleep  2 s
    #Wait Until Page Contains  ${Url}
    Verify Correct URL - Saved Employee Entitlement  ${Url}
    Sleep  2 s
    ${name} =  Get Element Attribute  ${LEAVE.EMPLOYEE_NAME_INPUT_ID_VALUE}  value
    Run Keyword If    "${name}"== "${BLANK_INPUT_FIELD}"    Log  Name field contains ${name}
    Page Should Not Contain  Added

Verify Leave Entitlement is Applied Successfully - Multiple
    [Arguments]  ${Url}  ${Element}
    Sleep  2 s
    #Wait Until Page Contains  ${Url}
    Verify Correct URL - Saved Employee Entitlement  ${Url}
    Sleep  2 s
    ${name} =  Get Element Attribute  ${Element}  value
    Run Keyword If    "${name}"== "${BLANK_INPUT_FIELD}"    Log  Name field contains ${name}
    Page Should Not Contain  Added

Search Employee
    [Arguments]  ${Entitlement}
    Click Button  ${LEAVE.EMPLOYEE_NAME_INPUT_ID_VALUE}
    Sleep  1 s
    EntitlementApp.Fill in Employee Details  ${Entitlement}
    EntitlementApp.Click Search Button

Select All Entitlement of Searched Employee
    #${elem_attr} =  Get Element Attribute  id=ohrmList_chkSelectAll  name
    ${elem_attr} =  Get Element Attribute  //*[@id="resultTable"]/tbody/tr/td[1]/input  name
    Click Element  ${elem_attr}
    #Select Checkbox  //*[@id="ohrmList_chkSelectAll"]//*[@name="chkSelectAll"]

Delete Selected Entitlement
    Click Button  ${LEAVE.DELETE_ENTITLEMENT_BUTTON}

Confirm to Delete Entitlement - OK
    Wait Until Element Is Visible  id=deleteConfModal
    Wait Until Page Contains  Delete records?
    Click Button  id=dialogDeleteBtn

Verify Selected Employee Entitlement is Deleted
    Element Should Contain  //*[@id="resultTable"]/tbody/tr/td   No Records Found


Confirm to Update Employee Entitlement
    Wait Until Element Is Visible  id=employeeEntitlement
    Wait Until Page Contains  Existing Entitlement value
    Click Button  id=dialogUpdateEntitlementConfirmBtn

Verify Employee Entitlement is Updated
    Wait Until Element Is Visible  xpath=//*[@id="resultTable"]/tbody/tr
    Element Should Contain  xpath=//*[@id="resultTable"]/tbody/tr   Added









