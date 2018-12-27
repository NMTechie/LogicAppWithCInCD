param
(
    [Parameter(Mandatory = $True)]
    [string] $EnvironmentName,

    [string] $ConfigFileName = "MetaData.json"
)

#check the file extension
if (-not $ConfigFileName.ToLower().EndsWith(".json")) {
    $ConfigFileName = "$($ConfigFileName).json"
}

#read the configuration file
$ParameterFilePath = [System.io.path]::combine($PSScriptRoot ,'ApiManagement', $EnvironmentName, $ConfigFileName)
$json = Get-Content -Path $ParameterFilePath | Out-String | ConvertFrom-Json

#prepare the necessary parameters
$resourceGroupName = $json.ResourceGroupName
$apimManagementName = $json.ApimManagementName
$apimContext = New-AzureRmApiManagementContext -ResourceGroupName $resourceGroupName -ServiceName $apimManagementName

$products = $json.products
foreach ($apimProduct in $products) {
    #create or update an product
    $properties = $apimProduct.properties
    $Product = Get-AzureRmApiManagementProduct -Context $apimContext -Title $properties.displayName -ErrorAction Ignore
    if ($Product) {
        Write-Host -ForegroundColor Red "product $($apimProduct.Id) has already exsited!"
        #set-AzureRmApiManagementProduct command hasn't return value
        Set-AzureRmApiManagementProduct -Context $apimContext -ProductId $apimProduct.Id -Title $properties.displayName -Description $properties.description -State $properties.state -SubscriptionRequired $properties.subscriptionRequired -SubscriptionsLimit $properties.subscriptionCountLimit -ApprovalRequired $properties.approvalRequired -LegalTerms $properties.terms -ErrorAction Ignore
        $Product = Get-AzureRmApiManagementProduct -Context $apimContext -Title $properties.displayName
    }
    else {
        $Product = New-AzureRmApiManagementProduct -Context $apimContext -ProductId $apimProduct.Id -Title $properties.displayName -Description $properties.description -State $properties.state -SubscriptionRequired $properties.subscriptionRequired -SubscriptionsLimit $properties.subscriptionCountLimit -ApprovalRequired $properties.approvalRequired -LegalTerms $properties.terms -ErrorAction Ignore
    }
    #set the group to which it belongs
    foreach ($group in $apimProduct.groups) {
        if ($group.name.ToLower() -ne "administrators") {
            $groupObj = Get-AzureRmApiManagementGroup -Context $apimContext -Name $group.name
            Add-AzureRmApiManagementProductToGroup -Context $apimContext -GroupId $groupObj.GroupId -ProductId $Product.ProductId
        }
    }
    #set the product level policy
    if ($apimProduct.policies.properties.policyContent.Trim() -ne "") {
        Set-AzureRmApiManagementPolicy -Context $apimContext -ProductId $Product.ProductId -Policy $apimProduct.policies.properties.policyContent
    }

    #import the API into APIM
    $apis = $apimProduct.apis
    foreach ($api in $apis) {
        #check if the API exists
        $apiExisted = Get-AzureRmApiManagementApi -Context $apimContext -Name $api.properties.displayName -ErrorAction Ignore;
        if ($apiExisted) {
            echo "Remove API $($apiExisted.ApiId) from APIM"
            Remove-AzureRmApiManagementApi -Context $apimContext -ApiId $apiExisted.ApiId;
        }
        #check the category before importing the API
        echo "Import API $($api.properties.displayName) to $($apimManagementName)"
        $apiFilePath = [System.io.path]::combine($PSScriptRoot, 'ApiManagement', $EnvironmentName , ($api.properties.specificationPath))
        if ($api.properties.specificationFormat.ToLower() -eq "swagger") {
            $newAPI = Import-AzureRmApiManagementApi -Context $apimContext -SpecificationFormat Swagger -SpecificationPath $apiFilePath -Path $api.properties.path -ApiId $api.ApiId
        }
        elseif ($api.properties.specificationFormat.ToLower() -eq "wsdl") {
		echo "Import API Import-AzureRmApiManagementApi -Context $($apimContext) -SpecificationFormat Wsdl -SpecificationPath $($apiFilePath) -Path $($api.properties.path) -ApiId $($api.ApiId) -ApiType Soap -WsdlServiceName $($api.properties.wsdlServiceName) -WsdlEndpointName $($api.properties.wsdlEndpointName)"
            $newAPI = Import-AzureRmApiManagementApi -Context $apimContext -SpecificationFormat Wsdl -SpecificationPath $apiFilePath -Path $api.properties.path -ApiId $api.ApiId -ApiType Soap -WsdlServiceName $api.properties.wsdlServiceName -WsdlEndpointName $api.properties.wsdlEndpointName
        }
		echo "API ID is $($newAPI.ApiId)"
        #set the corresponding Policy to the API
        if($api.properties.policySettingFile -ne "") {
            $apiPolicyPath = [System.io.path]::combine($PSScriptRoot, 'ApiManagement', $EnvironmentName , ($api.properties.policySettingFile))
            $policyContent = Get-Content -Raw -Path $apiPolicyPath
            Set-AzureRmApiManagementPolicy -Context $apimContext -ApiId $newAPI.ApiId -Policy $policyContent
        }
        #add API to Product
        Add-AzureRmApiManagementApiToProduct -Context $apimContext -ProductId $Product.ProductId -ApiId $newAPI.ApiId
    }
}
