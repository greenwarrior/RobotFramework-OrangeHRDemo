*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/CommonWeb.robot
Resource  ../Resources/LoginApp.robot
Resource  ../Resources/EntitlementApp.robot
Resource  ../Data/DataInput.robot
Test Setup  CommonWeb.Begin Web Test
Test Teardown  CommonWeb.End Web Test

*** Variables ***

*** Keywords ***

*** Test Cases ***
User should be to able cancel unsaved employee entitlement
    [Tags]  pass
    LoginApp.Login to account  ${ADMIN_USER}
    EntitlementApp.Navigate to 'Entitlement' Page
    EntitlementApp.Navigate to 'Add Entitlements' Page
    EntitlementApp.Verify 'Add Leave Entitlement' Page is Displayed
    EntitlementApp.Fill in Name of Employee  ${E_ENTITLEMENT_SINGLE}
    EntitlementApp.Add Employee Leave Entitlement Details  ${E_ENTITLEMENT_SINGLE}
    EntitlementApp.Cancel Current Leave Entitlement
    EntitlementApp.Verify Leave Entitlement is Not Applied   ${E_ENTITLEMENT_SINGLE}  ${LEAVE_LEAVE_ENTITLEMENT_URL}

User should be able to add initial employee entitlement
    [Tags]  pass
    # Pre-condition
    LoginApp.Login to account  ${ADMIN_USER}
    EntitlementApp.Navigate to 'Entitlement' Page
    EntitlementApp.Navigate to 'Add Entitlements' Page
    EntitlementApp.Verify 'Add Leave Entitlement' Page is Displayed
    EntitlementApp.Fill in Name of Employee  ${E_ENTITLEMENT_SINGLE}
    EntitlementApp.Add Employee Leave Entitlement Details  ${E_ENTITLEMENT_SINGLE}
    EntitlementApp.Save Current Employee Entitlement
    EntitlementApp.Verify Leave Entitlement is Applied Successfully   ${E_ENTITLEMENT_SINGLE}  ${LEAVE_LEAVE_ENTITLEMENT_URL}

User should be able to update existing employee entitlement
    [Tags]  pass
    # Pre-condition
    LoginApp.Login to account  ${ADMIN_USER}
    EntitlementApp.Navigate to 'Entitlement' Page
    EntitlementApp.Navigate to 'Add Entitlements' Page
    EntitlementApp.Verify 'Add Leave Entitlement' Page is Displayed
    EntitlementApp.Fill in Name of Employee  ${E_ENTITLEMENT_SINGLE}
    EntitlementApp.Add Employee Leave Entitlement Details  ${E_ENTITLEMENT_SINGLE}
    EntitlementApp.Save Current Employee Entitlement
    EntitlementApp.Confirm to Update Employee Entitlement
    EntitlementApp.Verify Employee Entitlement is Updated

User should be able to delete existing employee entitlement
    [Tags]  pass
    # Pre-condition
    LoginApp.Login to account  ${ADMIN_USER}
    EntitlementApp.Navigate to 'Entitlement' Page
    EntitlementApp.Navigate to 'Employee Entitlements' Page
    EntitlementApp.Search Employee   ${E_ENTITLEMENT_SINGLE}
    EntitlementApp.Select All Entitlement of Searched Employee
    EntitlementApp.Delete Selected Entitlement
    EntitlementApp.Confirm to Delete Entitlement - OK
    Verify Selected Employee Entitlement is Deleted

User should be able to cancel unsaved entitlements of multiple employees
    [Tags]  pass
    LoginApp.Login to account  ${ADMIN_USER}
    EntitlementApp.Navigate to 'Entitlement' Page
    EntitlementApp.Navigate to 'Add Entitlements' Page
    EntitlementApp.Verify 'Add Leave Entitlement' Page is Displayed
    EntitlementApp.Add Leave Entitlements for Multiple Employees  ${E_ENTITLEMENT_MULTI}
    EntitlementApp.Add Employee Leave Entitlement Details  ${E_ENTITLEMENT_MULTI}
    EntitlementApp.Cancel Current Leave Entitlement
    EntitlementApp.Verify Leave Entitlement is Cancelled

User should be able to cancel saved entitlements of multiple employees
    [Tags]  pass
    # Pre-condition
    LoginApp.Login to account  ${ADMIN_USER}
    EntitlementApp.Navigate to 'Entitlement' Page
    EntitlementApp.Navigate to 'Add Entitlements' Page
    EntitlementApp.Verify 'Add Leave Entitlement' Page is Displayed
    EntitlementApp.Add Leave Entitlements for Multiple Employees  ${E_ENTITLEMENT_MULTI}
    EntitlementApp.Add Employee Leave Entitlement Details  ${E_ENTITLEMENT_MULTI}
    EntitlementApp.Save Current Employee Entitlement
    EntitlementApp.Verify Matching Employees Assigned to Current Entitlements
    EntitlementApp.Cancel Current Multi Employee Leave Entitlement
    EntitlementApp.Verify Leave Entitlement is Cancelled

User should be able add saved entitlements of multiple employees
    [Tags]  pass
    # Pre-condition
    LoginApp.Login to account  ${ADMIN_USER}
    EntitlementApp.Navigate to 'Entitlement' Page
    EntitlementApp.Navigate to 'Add Entitlements' Page
    EntitlementApp.Verify 'Add Leave Entitlement' Page is Displayed
    EntitlementApp.Add Leave Entitlements for Multiple Employees  ${E_ENTITLEMENT_MULTI}
    EntitlementApp.Add Employee Leave Entitlement Details  ${E_ENTITLEMENT_MULTI}
    EntitlementApp.Save Current Employee Entitlement
    EntitlementApp.Verify Matching Employees Assigned to Current Entitlements
    EntitlementApp.Confirm Saving Current Multi Employee Leave Entitlement
    EntitlementApp.Verify Leave Entitlement is Applied Successfully - Multiple  ${LEAVE_LEAVE_ENTITLEMENT_URL}  ${LEAVE.EMPLOYEE_NAME_INPUT_ID_VALUE}







