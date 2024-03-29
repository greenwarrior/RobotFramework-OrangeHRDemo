*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/PO/EntitlementPage.robot



*** Variables ***


*** Keywords ***
Navigate to "Entitlement" Page
    EntitlementPage.Click Leave Menu
    EntitlementPage.Click Entitlements Menu

Navigate to "Add Leave Entitlements' Page
    EntitlementPage.Click Add Entitlements Menu
    Verify 'Add Leave Entitlement' Page is Displayed
    Form "Add Leave Entitlements" is Displayed

Verify 'Add Leave Entitlement' Page is Displayed
    EntitlementPage."Add Leave Entitlements" URL is Correct

Form "Add Leave Entitlements" is Displayed
    EntitlementPage.Form "Add Leave Entitlements" is Visible
    EntitlementPage.Form Title is 'Add Leave Entitlements'

Fill in Employee Name
    [Arguments]  ${Entitlement}
    EntitlementPage.Enter Employee Name in Input Text Box  ${Entitlement}
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
    EntitlementPage.Click 'Employee Entitlements' Link
    Verify "Employee Entitlements" Page is Displayed
    Form "Leave Entitlements" is Displayed

Verify "Employee Entitlements" Page is Displayed
    EntitlementPage.View Leave Entitlements URL is Correct


Form "Leave Entitlements" is Displayed
    EntitlementPage.Form "Leave Entitlements" is Visible
    EntitlementPage.Form Title is "Leave Entitlements"

Search for Employee Entitlement to Delete (Employee Name,Type, Period)
    [Arguments]  ${Entitlement}
    EntitlementApp.Fill in Employee Name  ${Entitlement}
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
