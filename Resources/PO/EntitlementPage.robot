*** Settings ***
Library  SeleniumLibrary
Resource  ../PO/Utilities.robot



*** Variables ***
${LEAVE.MENU}  id=menu_leave_viewLeaveModule
${LEAVE.ENTITLEMENT_MENU}  id=menu_leave_Entitlements
${LEAVE.ADD_ENTITLEMENTS_LINK}  id=menu_leave_addLeaveEntitlement
${LEAVE.ADD_LEAVE_ENTITLEMENTS_FORM}  id=frmLeaveEntitlementAdd
${LEAVE.SEARCH_ENTITLEMENTS_FORM}  id=leave-entitlementsSearch
${LEAVE.MULTIPLE_EMPLOYESS_CHECKBOX}  id=entitlements_filters_bulk_assign
${LEAVE.EMPLOYEE_NAME_INPUT_TEXT}  id=entitlements_employee_empName
${LEAVE.LOCATION_SELECTION}  css=#entitlements_filters_location
${LEAVE.UNIT_SELECTION}  css=#entitlements_filters_subunit
${LEAVE.SELECTION}  css=#entitlements_leave_type
${LEAVE.PERIOD_SELECTION}  css=#period
${LEAVE.ENTTLEMENT_INPUT_TEXT}   id=entitlements_entitlement
${LEAVE.ENTITLEMENT_CANCEL_BUTTON}  id=btnCancel
${LEAVE.ENTITLEMENT_SAVE_BUTTON}  id=btnSave
${LEAVE.ADD_ENTITLEMENT_HEADING}  Add Leave Entitlement
${LEAVE.SEARCH_ENTITLEMENT_HEADING}  Leave Entitlements
${LEAVE.CONFIRM_MATCHING_EMPLOYEES_POPUP}  OrangeHRM - Matching Employees
${LEAVE.BULK_CONFRIM_BUTTON}  id=dialogConfirmBtn
${LEAVE.BULK_CANCEL_BUTTON}  id=bulkAssignCancelBtn
${LEAVE_CANCEL_UPDATE_BUTTON}  //*[@id="dialogUpdateEntitlementCancelBtn"]
${LEAVE_CONFIRM_UPDATE_BUTTON}  //*[@id="dialogUpdateEntitlem entCancelBtn"]
${LEAVE_VIEW_SAVED_ENTITLEMENT_URL}  https://opensource-demo.orangehrmlive.com/index.php/leave/viewLeaveEntitlements/savedsearch/1
${LEAVE_VIEW_SEARCH_ENTITLEMENT_UR}  https://opensource-demo.orangehrmlive.com/index.php/leave/viewLeaveEntitlements/reset/1
${LEAVE_ADD_LEAVE_ENTITLEMENTS_URL}  https://opensource-demo.orangehrmlive.com/index.php/leave/addLeaveEntitlement
${LEAVE.EMP_ENTITLEMENTS_LINK}  id=menu_leave_viewLeaveEntitlements
${LEAVE_EMP_ENTITLEMENT_SEARCH_BUTTON}  id=searchBtn
${LEAVE.EMPLOYEE_NAME_INPUT_ID_VALUE}  entitlements_employee_empName
${LEAVE.SELECT_ALL_EMP_ENTITLEMENT_CHECKBOX}  id="ohrmList_chkSelectAll"
${LEAVE.DELETE_ENTITLEMENT_BUTTON}  id=btnDelete
#${LEAVE.EMP_ENTITLEMENT_NAME_INPUT_TEXT}  id=entitlements_employee_empName
#${LEAVE.EMP_ENTITLEMENT_LEAVE_SELECTION}   id=entitlements_leave_type
#${LEAVE.EMP_ENTITLEMENT_PERIOD_SELECTION}  id=period


*** Keywords ***
Click Leave Menu
    Wait Until Element Is Visible  ${LEAVE.MENU}
    Click Link  ${LEAVE.MENU}

Click Entitlements Menu
    Wait Until Element Is Visible  ${LEAVE.ENTITLEMENT_MENU}
    Click Link  ${LEAVE.ENTITLEMENT_MENU}

Click Add Entitlements Menu
    Wait Until Element Is Visible  ${LEAVE.ADD_ENTITLEMENTS_LINK}
    Click Link  ${LEAVE.ADD_ENTITLEMENTS_LINK}

Form "Add Leave Entitlements" is Visible
    Wait Until Element Is Visible  ${LEAVE.ADD_LEAVE_ENTITLEMENTS_FORM}

"Add Leave Entitlements" URL is Correct
    Utilities.Verify Correct URL  ${LEAVE_ADD_LEAVE_ENTITLEMENTS_URL}

Form "Leave Entitlements" is Visible
    Wait Until Element Is Visible  ${LEAVE.SEARCH_ENTITLEMENTS_FORM}

Form Title is "Leave Entitlements"
    Wait Until Page Contains   ${LEAVE.SEARCH_ENTITLEMENT_HEADING}

View Leave Entitlements URL is Correct
    Utilities.Verify Correct URL  ${LEAVE_VIEW_SEARCH_ENTITLEMENT_UR}

Enter Employee Name in Input Text Box
    [Arguments]  ${Entitlement}
    Sleep  1 s
    Utilities.Enter Field Value then Press Enter Key  ${LEAVE.EMPLOYEE_NAME_INPUT_TEXT}  ${Entitlement.EmployeeName}
    ${name} =  Get Element Attribute  ${LEAVE.EMPLOYEE_NAME_INPUT_TEXT}  value
    Run Keyword If    "${name}"== "${Entitlement.EmployeeName}"    Log  Name field contains ${name}
    #Input Text  ${LEAVE.EMPLOYEE_NAME_INPUT_TEXT}  ${Entitlement.EmployeeName}

Navigates to 'View Leave Entitlements' Page
    Sleep  1 s
    Utilities.Verify Correct URL  ${LEAVE_VIEW_SAVED_ENTITLEMENT_URL}
    Sleep  1 s

Click 'Employee Entitlements' Link
    Wait Until Element Is Visible  ${LEAVE.EMP_ENTITLEMENTS_LINK}
    Click Link  ${LEAVE.EMP_ENTITLEMENTS_LINK}

############################################################################
Select Leave Type
    [Arguments]  ${type}
    Select From List By Value  ${LEAVE.SELECTION}  ${type}

Select Leave Period
    [Arguments]  ${period}
    Select From List By Value  ${LEAVE.PERIOD_SELECTION}   ${period}

Fill in Number Entitlements
    [Arguments]  ${entitlement}
    Clear Element Text  ${LEAVE.ENTTLEMENT_INPUT_TEXT}
    Input Text  ${LEAVE.ENTTLEMENT_INPUT_TEXT}  ${entitlement}

Form Title is 'Add Leave Entitlements'
    Wait Until Page Contains   ${LEAVE.ADD_ENTITLEMENT_HEADING}


Check Form Title is "Leave Entitlements"
    Wait Until Page Contains   ${LEAVE.SEARCH_ENTITLEMENT_HEADING}
    #Sleep  5 s

Click Cancel Button
    Click Button  ${LEAVE.ENTITLEMENT_CANCEL_BUTTON}

Click Save Button
    Click Button  ${LEAVE.ENTITLEMENT_SAVE_BUTTON}



Navigates to 'Search Leave Entitlements' Page
    #Sleep  1 s
    Utilities.Verify Correct URL  ${LEAVE_VIEW_SEARCH_ENTITLEMENT_URL}
    #Sleep  1 s

Employee Name is Blank
    Utilities.Text Field is Blank  ${LEAVE.EMPLOYEE_NAME_INPUT_ID_VALUE}

Employee Name is Displayed
    [Arguments]  ${name}
    Check Attribute Value  ${LEAVE.EMPLOYEE_NAME_INPUT_ID_VALUE}  ${name}

Popup Message to Update Employee Entitlement is Displayed
    Wait Until Element Is Visible  id=employeeEntitlement
    #Sleep  1 s
    Wait Until Page Contains  OrangeHRM - Updating Entitlement
    #Sleep  1 s

Existing Entitlement Text is Displayed
    Wait Until Page Contains  Existing Entitlement value

Click the Confirm to Update Button
    Click Button  id=dialogUpdateEntitlementConfirmBtn

Check If Entitlement Added in Result Table
    [Arguments]  ${text}
    Wait Until Element Is Visible  xpath=//*[@id="resultTable"]/tbody/tr
    Utilities.Check If Form Contains Text   //*[@id="resultTable"]/tbody/tr  ${text}

Click Search Button
    Click Button  ${LEAVE_EMP_ENTITLEMENT_SEARCH_BUTTON}

Select 'Check All' checkbox in the Results Form
    #${elem_attr} =  Get Element Attribute  id=ohrmList_chkSelectAll  name
    ${elem_attr} =  Get Element Attribute  //*[@id="resultTable"]/tbody/tr/td[1]/input  name
    Click Element  ${elem_attr}
    #Select Checkbox  //*[@id="ohrmList_chkSelectAll"]//*[@name="chkSelectAll"]

Click the Delete Button
    Wait Until Element Is Visible  ${LEAVE.DELETE_ENTITLEMENT_BUTTON}
    Click Button  ${LEAVE.DELETE_ENTITLEMENT_BUTTON}

Click OK Button
    Confirm Delete Popup Message is Displayed
    Click Button  id=dialogDeleteBtn

Confirm Delete Popup Message is Displayed
    Wait Until Element Is Visible  id=deleteConfModal
    Wait Until Page Contains  Delete records?

No Entitlement Record is Displayed
    Element Should Contain  //*[@id="resultTable"]/tbody/tr/td   No Records Found

EntitlementPage.Check off "Add to Multiple Employees"
    Click Element  ${LEAVE.MULTIPLE_EMPLOYESS_CHECKBOX}

Select Location
    [Arguments]  ${location}
    Select From List By Value  ${LEAVE.LOCATION_SELECTION}  ${location}

Select Sub Unit
    [Arguments]  ${sub-unit}
    Select From List By Value  ${LEAVE.UNIT_SELECTION}  ${sub-unit}

EntitlementPage.Multiple Matching Employees Popup Message is Displayed
    Wait Until Element Is Visible  id=preview
    #Sleep  1 s
    Wait Until Page Contains  ${LEAVE.CONFIRM_MATCHING_EMPLOYEES_POPUP}
    #Sleep  1 s

Multiple Matching Employees is Displayed
    Wait Until Page Contains  The selected leave entitlement will be applied to the following employees.

Click Cancel Button (Entitlements for Multiple Employees)
    Wait Until Element Is Visible  //*[@id="bulkAssignCancelBtn"]
    ${elem_attr} =  Get Element Attribute  //*[@id="bulkAssignCancelBtn"]  id
    Click Button  ${elem_attr}

Click Confirm Button (Entitlements for Multiple Employees)
    Wait Until Element Is Visible  //*[@id="dialogConfirmBtn"]
    ${elem_attr} =  Get Element Attribute  //*[@id="dialogConfirmBtn"]  id
    Click Button  ${elem_attr}

Navigates to Back to 'Add Leave Entitlements' Page
    #Sleep  1 s
    Utilities.Verify Correct URL  ${LEAVE_ADD_LEAVE_ENTITLEMENTS_URL}
    #Sleep  1 s


