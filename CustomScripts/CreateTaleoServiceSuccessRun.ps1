Select-AzureRmSubscription "ipaas Dev" -TenantId <<Subscription TenantId>>

$resourceGroup = Get-AzureRmResourceGroup -Name "ipaas-dev-we-shared-services-01"
$storageAccountName = "ipaasdevwesharedsta01"
$storageAccount = Get-AzureRmStorageAccount -ResourceGroupName $resourceGroup.ResourceGroupName -Name $storageAccountName

$tableName = "TaleoServiceSuccessRun"
Get-AzureStorageTable -Name $tableName -Context $storageAccount.Context -ErrorVariable ev -ErrorAction SilentlyContinue
if ($ev) {
New-AzureStorageTable -Name $tableName -Context $storageAccount.Context
}

# Start section for TaleoServiceSuccessRun for Requisition
$storageTable = Get-AzureStorageTable -Name "TaleoServiceSuccessRun" -Context $storageAccount.Context
Add-StorageTableRow `
    -table $storageTable `
    -partitionKey "submitLargeDocument" `
    -rowKey ("Requisition") `
	-property @{"SuccessRunDate"=[System.DateTime]::UtcNow.ToString("yyyy-MM-ddT00:00:00")}
Add-StorageTableRow `
    -table $storageTable `
    -partitionKey "submitLargeDocument" `
    -rowKey ("Offer") `
	-property @{"SuccessRunDate"=[System.DateTime]::UtcNow.ToString("yyyy-MM-ddT00:00:00")}
Add-StorageTableRow `
    -table $storageTable `
    -partitionKey "submitLargeDocument" `
    -rowKey ("JobSubmission") `
	-property @{"SuccessRunDate"=[System.DateTime]::UtcNow.ToString("yyyy-MM-ddT00:00:00")}
Add-StorageTableRow `
    -table $storageTable `
    -partitionKey "submitLargeDocument" `
    -rowKey ("OrganizationMaster") `
	-property @{"SuccessRunDate"=[System.DateTime]::UtcNow.ToString("yyyy-MM-ddT00:00:00")}
Add-StorageTableRow `
    -table $storageTable `
    -partitionKey "submitLargeDocument" `
    -rowKey ("JobField") `
	-property @{"SuccessRunDate"=[System.DateTime]::UtcNow.ToString("yyyy-MM-ddT00:00:00")}
Add-StorageTableRow `
    -table $storageTable `
    -partitionKey "submitLargeDocument" `
    -rowKey ("Location") `
	-property @{"SuccessRunDate"=[System.DateTime]::UtcNow.ToString("yyyy-MM-ddT00:00:00")}
	
	