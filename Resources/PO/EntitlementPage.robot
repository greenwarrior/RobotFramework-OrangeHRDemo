*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${LEAVE.MENU}  id=menu_leave_viewLeaveModule
${LEAVE.ENTITLEMENT_MENU}  id=menu_leave_Entitlements
${LEAVE.ADD_ENTITLEMENTS_LINK}  id=menu_leave_addLeaveEntitlement
${LEAVE.MULTIPLE_EMPLOYESS_CHECKBOX}  id=entitlements_filters_bulk_assign
${LEAVE.EMPLOYEE_NAME_INPUT_TEXT}  id=entitlements_employee_empName
${LEAVE.LOCATION_SELECTION}  css=#entitlements_filters_location
${LEAVE.UNIT_SELECTION}  css=#entitlements_filters_subunit
${LEAVE.SELECTION}  css=#entitlements_leave_type
${LEAVE.PERIOD_SELECTION}  css=#period
${LEAVE.ENTTLEMENT_INPUT_TEXT}   id=entitlements_entitlement
${LEAVE.ENTITLEMENT_CANCEL_BUTTON}  id=btnCancel
${LEAVE.ENTITLEMENT_SAVE_BUTTON}  id=btnSave
${LEAVE.ADD_ENTITLEMENT_PAGE}  Add Leave Entitlement
${LEAVE.ENTITLEMENTS_PAGE}  Leave Entitlements
${LEAVE.CONFIRM_POPUP}  OrangeHRM - Matching Employees
${LEAVE.BULK_CONFRIM_BUTTON}  id=dialogConfirmBtn
${LEAVE.BULK_CANCEL_BUTTON}  id=bulkAssignCancelBtn
${LEAVE_CANCEL_UPDATE_BUTTON}  //*[@id="dialogUpdateEntitlementCancelBtn"]
${LEAVE_CONFIRM_UPDATE_BUTTON}  //*[@id="dialogUpdateEntitlementCancelBtn"]
${LEAVE_LEAVE_ENTITLEMENT_URL}  https://opensource-demo.orangehrmlive.com/index.php/leave/viewLeaveEntitlements/savedsearch/1
${LEAVE.EMP_ENTITLEMENTS_LINK}  id=menu_leave_viewLeaveEntitlements
${LEAVE_EMP_ENTITLEMENT_SEARCH_BUTTON}  id=searchBtn
${LEAVE.EMPLOYEE_NAME_INPUT_ID_VALUE}  entitlements_employee_empName
${LEAVE.SELECT_ALL_EMP_ENTITLEMENT_CHECKBOX}  id="ohrmList_chkSelectAll"
${LEAVE.DELETE_ENTITLEMENT_BUTTON}  id=btnDelete
#${LEAVE.EMP_ENTITLEMENT_NAME_INPUT_TEXT}  id=entitlements_employee_empName
#${LEAVE.EMP_ENTITLEMENT_LEAVE_SELECTION}   id=entitlements_leave_type
#${LEAVE.EMP_ENTITLEMENT_PERIOD_SELECTION}  id=period