$apicontext= New-AzureRmApiManagementContext -ResourceGroupName "<<resource group name where APIM instance is resides>>" -ServiceName "<<name of the APIM instance>>"
New-AzureRmApiManagementBackend -Context $apicontext -BackendId "C32BackEnd" -Protocol http -url "https://<<the ip of the back-end api domain that use self-sign certificate for SSL>>/" -SkipCertificateChainValidation 1
