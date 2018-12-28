Import-AzureRmApiManagementApi -Context $apimContext -SpecificationFormat "Wsdl" -SpecificationPath "C:\Nilesh\Repos\Nokia\HRA\src\OurTalent\CustomScripts\ApiManagement\Dev\Apis\EnterpriseBulkAPIMgmtAPI.wsdl" -Path "OurTalentBulkAPI" -ApiId "OurTalentBulkAPI" -ApiType Soap -WsdlServiceName "OurTalentBulkAPI" -WsdlEndpointName "Test"

(Get-AzureRmContext).Subscription

Select-AzureRmSubscription "ipaas Dev" -TenantId 5d471751-9675-428d-917b-70f44f9630b0

Get-Module AzureRM -List | Select-Object Name, Version, Path

Update-Module -Name AzureRM

Get-InstalledModule -Name AzureRM -AllVersions

$DebugPreference="Continue"

Uninstall-Module -Name "AzureRM" -RequiredVersion 5.7.0 -Force