*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/CommonWeb.robot
Resource  ../Resources/LoginApp.robot
Resource  ../Resources/EntitlementApp.robot
Resource  ../Data/DataInput.robot
Test Setup  CommonWeb.Begin Web Test
Test Teardown  CommonWeb.End Web Test

*** Variables ***
${ELEMENT_TO_EXTRACT}  id=entitlements_employee_empName
${NAME}   Thomas Fleming


*** Keywords ***
Extract Element Value
    [Arguments]  ${Elements}
    ${Element_Value} =  Get Value  ${Elements}
    [Return]   ${Element_Value}

User Can Add Initial Entitlement for a Selected Employee
    EntitlementApp.Navigate to 'Add Leave Entitlement' Page
    EntitlementApp.Verify 'Add Leave Entitlement' Page is Displayed
    Sleep  1 s
    Input Text  ${LEAVE.EMPLOYEE_NAME_INPUT_TEXT}   ${NAME}
    Select From List By Value  ${LEAVE.SELECTION}  2
    Select From List By Value  ${LEAVE.PERIOD_SELECTION}   2019-01-01$$2019-12-31
    Input Text  ${LEAVE.ENTTLEMENT_INPUT_TEXT}  1
    Click Button  ${LEAVE.ENTITLEMENT_SAVE_BUTTON}
    Sleep  5 s
    Wait Until Page Contains  ${LEAVE.ENTITLEMENTS_PAGE}
    Sleep  5 s
    ${E_Name} =  Extract Element Value  ${ELEMENT_TO_EXTRACT}
    Should Be Equal As Strings    ${E_Name}    ${NAME}

User can add and cancel entitlements to multiple user without saving
    EntitlementApp.Navigate to 'Add Leave Entitlement' Page
    EntitlementApp.Verify 'Add Leave Entitlement' Page is Displayed
    EntitlementApp.Add Leave Entitlements for Multiple Employees  ${E_ENTITLEMENT_MULTI}
    EntitlementApp.Add Employee Leave Entitlement Details  ${E_ENTITLEMENT_MULTI}
    EntitlementApp.Cancel Current Leave Entitlement
    EntitlementApp.Verify Leave Entitlement is Cancelled

User can cancel confirmation of current entitlements to multiple employees
    EntitlementApp.Navigate to 'Add Leave Entitlement' Page
    EntitlementApp.Verify 'Add Leave Entitlement' Page is Displayed
    EntitlementApp.Add Leave Entitlements for Multiple Employees  ${E_ENTITLEMENT_MULTI}
    EntitlementApp.Add Employee Leave Entitlement Details  ${E_ENTITLEMENT_MULTI}
    EntitlementApp.Save Current Employee Entitlement
    EntitlementApp.Verify Matching Employees Assigned to Current Entitlements
    EntitlementApp.Cancel Current Multi Employee Leave Entitlement
    EntitlementApp.Verify Leave Entitlement is Cancelled

User can confirm to assign current entitlements to multiple employees
    # Pre-condition
    EntitlementApp.Navigate to 'Add Leave Entitlement' Page
    EntitlementApp.Verify 'Add Leave Entitlement' Page is Displayed
    EntitlementApp.Add Leave Entitlements for Multiple Employees  ${E_ENTITLEMENT_MULTI}
    EntitlementApp.Add Employee Leave Entitlement Details  ${E_ENTITLEMENT_MULTI}
    EntitlementApp.Save Current Employee Entitlement
    EntitlementApp.Verify Matching Employees Assigned to Current Entitlements
    EntitlementApp.Confirm Saving Current Multi Employee Leave Entitlement
    EntitlementApp.Verify Leave Entitlement is Applied

User should be able to add then cancel entitlement of a selected employee
    EntitlementApp.Navigate to 'Add Leave Entitlement' Page
    EntitlementApp.Verify 'Add Leave Entitlement' Page is Displayed
    EntitlementApp.Fill in Namee of Employee  ${E_ENTITLEMENT_SINGLE}
    EntitlementApp.Add Employee Leave Entitlement Details  ${E_ENTITLEMENT_SINGLE}
    EntitlementApp.Cancel Current Leave Entitlement
    EntitlementApp.Verify Leave Entitlement is Cancelled

User can confirm to update current entitlements of a selected employee
    EntitlementApp.Navigate to 'Add Leave Entitlement' Page
    EntitlementApp.Verify 'Add Leave Entitlement' Page is Displayed
    EntitlementApp.Fill in Namee of Employee  ${E_ENTITLEMENT_SINGLE}
    EntitlementApp.Add Employee Leave Entitlement Details  ${E_ENTITLEMENT_SINGLE}
    EntitlementApp.Save Current Employee Entitlement
    EntitlementApp.Verify Updated Entitlement
    EntitlementApp.Cancel Current Entitlement for a Selected Employee
    EntitlementApp.Verify Leave Entitlement is Cancelled





*** Test Cases ***
User should be able to perform different entitlement actions
    [Tags]  current
    LoginApp.Login to account  ${ADMIN_USER}
    #User Can Add Initial Entitlement for a Selected Employee
    #User can add and cancel entitlements to multiple user without saving
    #User can cancel confirmation of current entitlements to multiple employees
    #User can confirm to assign current entitlements to multiple employees
    #User should be able to add then cancel entitlement of a selected employee
    User can confirm to update current entitlements of a selected employee

