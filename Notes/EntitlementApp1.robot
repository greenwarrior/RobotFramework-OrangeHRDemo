*** Settings ***
Library  SeleniumLibrary
Resource  ../Data/DataInput.robot
Resource  ../Resources/PO/EntitlementPage.robot
Resource  ../Resources/Utilities.robot

*** Variables ***


*** Keywords ***
Navigate to "Entitlement" Page
    EntitlementPage.Click Leave Menu
    EntitlementPage.Click Entitlements Menu

Navigate to "Add Leave Entitlements' Page
    EntitlementPage.Click Add Entitlements Menu
    Verify 'Add Leave Entitlement' Page is Displayed

Verify 'Add Leave Entitlement' Page is Displayed
    EntitlementPage.Check Form Title is 'Add Leave Entitlement'

Fill in Employee Name
    [Arguments]  ${Entitlement}
    Utilities.Enter Field Value then Press Enter Key  ${LEAVE.EMPLOYEE_NAME_INPUT_TEXT}  ${Entitlement.EmployeeName}
    Sleep  1 s

Add Entitlement Details (Type, Period, Number)
    [Arguments]  ${Entitlement}
    Select Leave Type for Employee  ${Entitlement.Type}
    Select Leave Period for Employee  ${Entitlement.Period}
    Fill in Number Entitlements for Employee  ${Entitlement.Entitlements}

Select Leave Type for Employee
    [Arguments]  ${Type}
    EntitlementPage.Select Leave Type  ${Type}
    #Select From List By Value  ${LEAVE.SELECTION}  ${Type}

Select Leave Period for Employee
    [Arguments]  ${Period}
    EntitlementPage.Select Leave Period  ${Period}
    #Select From List By Value  ${LEAVE.PERIOD_SELECTION}   ${Period}

Fill in Number Entitlements for Employee
    [Arguments]  ${NumberEntitlements}
    EntitlementPage.Fill in Number Entitlements  ${NumberEntitlements}

Cancel Current Leave Entitlement
    EntitlementPage.Click Cancel Button

Verify Leave Entitlement is Not Applied
    [Arguments]  ${Entitlement}
    EntitlementPage.Navigates to 'View Leave Entitlements' Page
    EntitlementPage.Employee Name is Blank
    Entitlement is Not Added

Verify Leave Entitlement is Applied Successfully
    [Arguments]  ${Entitlement}
    EntitlementPage.Navigates to 'View Leave Entitlements' Page
    EntitlementPage.Employee Name is Displayed  ${Entitlement.EmployeeName}
    Entitlement is Added  Added

Entitlement is Not Added
    Page Should Not Contain  Added

Entitlement is Added
    [Arguments]  ${text}
    EntitlementPage.Check If Entitlement Added in Result Table  ${text}


Save Current Employee Entitlement
    EntitlementPage.Click Save Button

Verify Employee Entitlement is Updated
    [Arguments]  ${Entitlement}
    EntitlementPage.Navigates to 'View Leave Entitlements' Page
    EntitlementPage.Employee Name is Displayed  ${Entitlement.EmployeeName}
    Entitlement is Added  Added

Navigate to 'Employee Entitlements' Page
    EntitlementPage.Click "Employee Entitlements" Link
    Verify "Employee Entitlements" Page is Displayed

Verify "Employee Entitlements" Page is Displayed
    EntitlementPage.Check Form Title is "Leave Entitlements"

Search for Employee Entitlement to Delete (Employee Name,Type, Period)
    [Arguments]  ${Entitlement}
    Fill in Employee Name  ${Entitlement}
    Select Leave Type for Employee  ${Entitlement.Type}
    Select Leave Period for Employee  ${Entitlement.Period}
    EntitlementPage.Click Search Button

Check off the Selected Entitlement From the Search Results
    EntitlementPage.Select 'Check All' checkbox in the Results Form

Delete Selected Entitlement
    Check off the Selected Entitlement From the Search Results
    EntitlementPage.Click the Delete Button

Confirm to Delete Entitlement
    EntitlementPage.Click OK Button

Verify Selected Employee Entitlement is Deleted
    EntitlementPage.No Entitlement Record is Displayed

Check Off Entitlements for Multiple Employees
    EntitlementPage.Check off "Add to Multiple Employees"

Add Leave Entitlement Details (Location,Sub Unit, Type, Period, Number)
    [Arguments]  ${Entitlement}
    EntitlementPage.Select Location  ${Entitlement.Location}
    EntitlementPage.Select Sub Unit  ${Entitlement.Unit}
    Add Entitlement Details (Type, Period, Number)  ${Entitlement}

Confirm to Update Employee Entitlement
    EntitlementPage.Popup Message to Update Employee Entitlement is Displayed
    EntitlementPage.Existing Entitlement Text is Displayed
    EntitlementPage.Click the Confirm to Update Button

Entitlement for Multiple Matching Employees Popup Message is Displayed
    EntitlementPage.Multiple Matching Employees Popup Message is Displayed
    EntitlementPage.Multiple Matching Employees is Displayed

Confirm to Apply Entitlements to Multiple Employees
    EntitlementPage.Click the Confirm to Entitlements to Multiple Employees

Cancel Saved Multi Employee Leave Entitlements
    EntitlementPage.Click Cancel Button (Entitlements for Multiple Employees)
    Verify 'Add Leave Entitlement' Page is Displayed

Verify Entitlement To Multiple Employees is Not Applied
    [Arguments]  ${Entitlement}
    EntitlementPage.Navigates to Back to 'Add Leave Entitlements' Page
    EntitlementPage.Employee Name is Blank
    Entitlement is Not Added

Confirm Saved Multi Employee Leave Entitlements
    EntitlementPage.Click Confirm Button (Entitlements for Multiple Employees)

Verify Entitlements To Multiple Employess Are Applied
    Multiple Employee Entitlements is Applied Message is Displayed
    EntitlementPage.Navigates to 'View Leave Entitlements' Page
    EntitlementPage.Check Form Title is "Leave Entitlements"

Multiple Employee Entitlements is Applied Message is Displayed
    Wait Until Page Contains  Entitlements added to

##################################################################################
Search Employee1
    [Arguments]  ${Entitlement}
    Fill in Employee Name  ${Entitlement}
    EntitlementApp.Click Search Button




Navigate to 'Employee Entitlements' Page1
    Click Link  ${LEAVE.EMP_ENTITLEMENTS_LINK}






Add Employee Leave Entitlement - Single or Bulk
     [Arguments]  ${Entitlement}
     run keyword if  '${Entitlement.Multi}' == 'Yes'  Add Leave Entitlements for Multiple Employees  ${Entitlement}
     run keyword if  '${Entitlement.Multi}' == 'No'  Add Leave Entitlement for An Employee  ${Entitlement.EmployeeName}









Verify Leave Entitlement is Cancelled
     Wait Until Page Contains  ${LEAVE.ENTITLEMENTS_PAGE}



Confirm Saving Current Multi Employee Leave Entitlement
    Click Button  ${LEAVE.BULK_CONFRIM_BUTTON}

Verify Updated Entitlement
    Sleep  1 s
    Wait Until Page Contains  OrangeHRM - Updating Entitlement
    Sleep  10 s

Cancel Current Entitlement for a Selected Employee
    Wait Until Page Contains Element  ${LEAVE_CANCEL_UPDATE_BUTTON}
    Click Button   ${LEAVE_CANCEL_UPDATE_BUTTON}

Fill in Employee Details
    [Arguments]  ${Entitlement}
    Fill in Name of Employee  ${Entitlement.EmployeeName}
    Select Leave Type  ${Entitlement.Type}
    Select Leave Period  ${Entitlement.Period}




Check Leave Type
    [Arguments]  ${Entitlement}
    ${Leave_Type} =  Utilities.Get Text  css=#resultTable > tbody > tr > td:nth-child(2)
    Should Be Equal As Strings    ${Leave_Type}    ${Entitlement.Type}







Verify Leave Entitlement is Applied Successfully - Multiple
    [Arguments]  ${Url}  ${Element}
    Sleep  2 s
    #Wait Until Page Contains  ${Url}
    Utilities.Verify Correct URL  ${Url}
    Sleep  2 s
    ${name} =  Get Element Attribute  ${Element}  value
    Run Keyword If    "${name}"== "${BLANK_INPUT_FIELD}"    Log  Name field contains ${name}
    Page Should Not Contain  Added






Confirm to Delete Entitlement - OK
    Wait Until Element Is Visible  id=deleteConfModal
    Wait Until Page Contains  Delete records?
    Click Button  id=dialogDeleteBtn






Verify Employee Entitlement is Updated1
    [Arguments]  ${Entitlement}  ${Url}
    EntitlementPage.Navigates to 'View Leave Entitlements' Page   ${Url}
    EntitlementPage.Employee Name is Displayed  ${Entitlement.EmployeeName}
    Entitlement is Added  Added


    Wait Until Element Is Visible  xpath=//*[@id="resultTable"]/tbody/tr
    Element Should Contain  xpath=//*[@id="resultTable"]/tbody/tr   Added









