$apicontext= New-AzureRmApiManagementContext -ResourceGroupName "ipaas-int-we-apim-01" -ServiceName "nok-ipaas-int-we-apm-01"
New-AzureRmApiManagementBackend -Context $apicontext -BackendId "C32BackEnd" -Protocol http -url "https://<<the ip of the back-end api domain that use self-sign certificate for SSL>>/" -SkipCertificateChainValidation 1
