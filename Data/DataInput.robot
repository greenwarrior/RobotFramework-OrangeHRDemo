*** Variables ***
${BASE_URL}  https://opensource-demo.orangehrmlive.com/

# INPUT DATA
&{ADMIN_USER}  UserName=Admin  Password=admin123
&{UNREGISTERED_USER}  UserName=SuperAdmin  Password=admin123  ExpectedErrorMessage=Invalid credentials
&{INCORRECT_PASSWORD_USER}  UserName=Admin  Password=admin123p  ExpectedErrorMessage=Invalid credentials
&{BLANK_CREDENTIALS_USER}  UserName=#BLANK  Password=#BLANK  ExpectedErrorMessage=
&{E_ENTITLEMENT_MULTI}   Location=-1  Unit=0  Type=2  Period=2019-01-01$$2019-12-31  Entitlements=1
&{E_ENTITLEMENT_SINGLE}   Location=-1  Unit=0  Type=2  Period=2019-01-01$$2019-12-31  Entitlements=1  EmployeeName=Linda Linda Anderson
${BLANK_INPUT_FIELD}  Type for hints...
