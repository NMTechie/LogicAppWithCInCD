Select-AzureRmSubscription "ipaas Dev" -TenantId <subscription TenantId>

$resourceGroup = Get-AzureRmResourceGroup -Name "ipaas-dev-we-shared-services-01"
$storageAccountName = "ipaasdevwesharedsta01"
$storageAccount = Get-AzureRmStorageAccount -ResourceGroupName $resourceGroup.ResourceGroupName -Name $storageAccountName

$tableName = "TaleoServiceCallStatus"
Get-AzureStorageTable -Name $tableName -Context $storageAccount.Context -ErrorVariable ev -ErrorAction SilentlyContinue
if ($ev) {
New-AzureStorageTable -Name $tableName -Context $storageAccount.Context
}