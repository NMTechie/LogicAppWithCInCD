param
(
    [Parameter(Mandatory = $True)]
    [string] $ConfigFileName = "Configuration.dev.json"
)

$currentPath = [System.io.path]::combine($PSScriptRoot, 'IntegrationAccount')
$ParameterFilePath = [System.io.path]::combine($currentPath, $ConfigFileName)

$json = Get-Content -Raw -Path $ParameterFilePath | Out-String | ConvertFrom-Json
$resourceGroupName = $json.integrationAccountResourceGroupName
$integrationAccountName = $json.integrationAccountName
$location = $json.integrationAccountLocationName
$pricingTier = $json.integrationAccountPricingTier

$existed = @(Get-AzureRmIntegrationAccount -ResourceGroupName $resourceGroupName -Name $integrationAccountName -ErrorAction Ignore)
if (!$existed) {
    # create new integration account
    echo "creating new  integration account $($integrationAccountName) in $($resourceGroupName) resource group"
    New-AzureRmIntegrationAccount -ResourceGroupName $resourceGroupName -Name $integrationAccountName -Location $location -Sku $pricingTier
}

foreach ($map in $json.maps) {
    echo "import Map $($map.name)"
    $integrationAccountMap = Get-AzureRmIntegrationAccountMap -ResourceGroupName $resourceGroupName -Name $integrationAccountName -MapName $map.name -ErrorAction Ignore
    if ($integrationAccountMap) {
        # Update the existing MAP
        echo "Updating the existing map $($integrationAccountMap.Name)"
        Set-AzureRmIntegrationAccountMap -ResourceGroupName $resourceGroupName -Name $integrationAccountName -MapName $map.name -MapType $map.type -ContentType $map.contentType -MapFilePath "$($currentPath)\$($map.FilePath)" -Force
    } else {
        # Create a new MAP
        New-AzureRmIntegrationAccountMap -ResourceGroupName $resourceGroupName -Name $integrationAccountName -MapName $map.name -MapType $map.type -ContentType $map.contentType -MapFilePath "$($currentPath)\$($map.FilePath)"
        echo "Map $($map.name) is created"
    }
}

foreach ($schema in $json.schemas) {
    echo "import Schema $($map.name)"
    $integrationAccountSchema = Get-AzureRmIntegrationAccountSchema -ResourceGroupName $resourceGroupName -Name $integrationAccountName -SchemaName $schema.name -ErrorAction Ignore
    if ($integrationAccountSchema) {
        # Update the existing Schema
        echo "Updating existing schema $($integrationAccountSchema.Name)"
        Set-AzureRmIntegrationAccountSchema -ResourceGroupName $resourceGroupName -Name $integrationAccountName -SchemaName $schema.name -SchemaType $schema.type -SchemaFilePath "$($currentPath)\$($schema.FilePath)" -Force
    } else {
        # Create a new Schema
        New-AzureRmIntegrationAccountSchema -ResourceGroupName $resourceGroupName -Name $integrationAccountName -SchemaName $schema.name -SchemaType $schema.type -SchemaFilePath "$($currentPath)\$($schema.FilePath)"
        echo "Schema $($schema.name) is created"
     }
}