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
1 User should be to able cancel unsaved employee entitlement
    [Tags]  smoke
    LoginApp.Login to account  ${ADMIN_USER}
    EntitlementApp.Navigate to "Entitlement" Page
    #EntitlementApp.Navigate to "Add Leave Entitlements' Page
    #EntitlementApp.Fill in Employee Name  ${E_ENTITLEMENT_SINGLE}
    #EntitlementApp.Add Entitlement Details (Type, Period, Number)  ${E_ENTITLEMENT_SINGLE}
    #EntitlementApp.Cancel Current Leave Entitlement
    #EntitlementApp.Verify Leave Entitlement is Not Applied   ${E_ENTITLEMENT_SINGLE}


2 User should be able to add initial employee entitlement
    [Tags]  smoke
    LoginApp.Login to account  ${ADMIN_USER}
    EntitlementApp.Navigate to "Entitlement" Page
    EntitlementApp.Navigate to "Add Leave Entitlements' Page
    EntitlementApp.Fill in Employee Name  ${E_ENTITLEMENT_SINGLE}
    EntitlementApp.Add Entitlement Details (Type, Period, Number)  ${E_ENTITLEMENT_SINGLE}
    EntitlementApp.Save Current Employee Entitlement
    EntitlementApp.Verify Leave Entitlement is Applied Successfully   ${E_ENTITLEMENT_SINGLE}

3 User should be able to update existing employee entitlement
    [Tags]  smoke
    # Pre-condition
    LoginApp.Login to account  ${ADMIN_USER}
    EntitlementApp.Navigate to "Entitlement" Page
    EntitlementApp.Navigate to "Add Leave Entitlements' Page
    EntitlementApp.Fill in Employee Name  ${E_ENTITLEMENT_SINGLE}
    EntitlementApp.Add Entitlement Details (Type, Period, Number)  ${E_ENTITLEMENT_SINGLE}
    EntitlementApp.Save Current Employee Entitlement
    EntitlementApp.Confirm to Update Employee Entitlement
    EntitlementApp.Verify Employee Entitlement is Updated  ${E_ENTITLEMENT_SINGLE}

4 User should be able to delete existing employee entitlement
    [Tags]  smoke
    LoginApp.Login to account  ${ADMIN_USER}
    EntitlementApp.Navigate to "Entitlement" Page
    EntitlementApp.Navigate to 'Employee Entitlements' Page
    EntitlementApp.Search for Employee Entitlement to Delete (Employee Name,Type, Period)   ${E_ENTITLEMENT_SINGLE}
    EntitlementApp.Delete Selected Entitlement
    EntitlementApp.Confirm to Delete Entitlement
    EntitlementApp.Verify Selected Employee Entitlement is Deleted



5 User should be able to cancel unsaved entitlements for multiple employees
    [Tags]  smoke
    LoginApp.Login to account  ${ADMIN_USER}
    EntitlementApp.Navigate to "Entitlement" Page
    EntitlementApp.Navigate to "Add Leave Entitlements' Page
    EntitlementApp.Check Off Entitlements for Multiple Employees
    EntitlementApp.Add Leave Entitlement Details (Location,Sub Unit, Type, Period, Number)  ${E_ENTITLEMENT_MULTI}
    EntitlementApp.Cancel Current Leave Entitlement
    EntitlementApp.Verify Leave Entitlement is Not Applied  ${E_ENTITLEMENT_MULTI}

6 User should be able to cancel saved entitlements for multiple employees
    [Tags]  smoke
    LoginApp.Login to account  ${ADMIN_USER}
   EntitlementApp.Navigate to "Entitlement" Page
    EntitlementApp.Navigate to "Add Leave Entitlements' Page
    EntitlementApp.Check Off Entitlements for Multiple Employees
    EntitlementApp.Add Leave Entitlement Details (Location,Sub Unit, Type, Period, Number)  ${E_ENTITLEMENT_MULTI}
    EntitlementApp.Save Current Employee Entitlement
    EntitlementApp.Entitlement for Multiple Matching Employees Popup Message is Displayed
    EntitlementApp.Cancel Saved Multi Employee Leave Entitlements
    EntitlementApp.Verify Entitlement To Multiple Employees is Not Applied  ${E_ENTITLEMENT_MULTI}

7 User should be able to add saved entitlements for multiple employees
    [Tags]  smoke
    LoginApp.Login to account  ${ADMIN_USER}
    EntitlementApp.Navigate to "Entitlement" Page
    EntitlementApp.Navigate to "Add Leave Entitlements' Page
    EntitlementApp.Check Off Entitlements for Multiple Employees
    EntitlementApp.Add Leave Entitlement Details (Location,Sub Unit, Type, Period, Number)  ${E_ENTITLEMENT_MULTI}
    EntitlementApp.Save Current Employee Entitlement
    EntitlementApp.Entitlement for Multiple Matching Employees Popup Message is Displayed
    EntitlementApp.Confirm Saved Multi Employee Leave Entitlements
    EntitlementApp.Verify Entitlements To Multiple Employess Are Applied







