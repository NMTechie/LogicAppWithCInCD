Select-AzureRmSubscription "ipaas Dev" -TenantId <<Subscription TenantId>>

$resourceGroup = Get-AzureRmResourceGroup -Name "ipaas-dev-we-shared-services-01"
$storageAccountName = "ipaasdevwesharedsta01"
$storageAccount = Get-AzureRmStorageAccount -ResourceGroupName $resourceGroup.ResourceGroupName -Name $storageAccountName

$tableName = "TaleoServiceMetaData"
Get-AzureStorageTable -Name $tableName -Context $storageAccount.Context -ErrorVariable ev -ErrorAction SilentlyContinue
if ($ev) {
New-AzureStorageTable -Name $tableName -Context $storageAccount.Context
}

# Start section for TaleoServiceMetaData for Requisition
$storageTable = Get-AzureStorageTable -Name "TaleoServiceMetaData" -Context $storageAccount.Context
Add-StorageTableRow `
    -table $storageTable `
    -partitionKey "submitLargeDocument" `
    -rowKey ("Requisition") `
	-property @{"ServiceBody"="------=_Part_3_7794965.1541143688509
Content-Type: application/xop+xml; charset=UTF-8; type=`"text/xml`"
Content-Transfer-Encoding: 8bit
Content-ID: <rootpart@soapui.org>

<soapenv:Envelope xmlns:soapenv=`"http://schemas.xmlsoap.org/soap/envelope/`" xmlns:add=`"http://www.w3.org/2005/03/addressing`" xmlns:man=`"http://www.taleo.com/ws/integration/toolkit/2011/05/management`">
   <soapenv:Header>
      <add:Action>http://www.taleo.com/ws/integration/toolkit/2005/07/action/export</add:Action>
      <add:ReplyTo>
         <add:Address>http://www.taleo.com/ws/integration/toolkit/2005/07/addressing/queue</add:Address>
         <!--Optional:-->
         <add:ReferenceParameters>
            <!--You may enter ANY elements at this point-->
         </add:ReferenceParameters>
      </add:ReplyTo>
      <add:MessageID>??MsgKey??</add:MessageID>
   </soapenv:Header>
   <soapenv:Body>
      <man:submitLargeDocument>
         <man:Document><inc:Include href=`"cid:1534913975281`" xmlns:inc=`"http://www.w3.org/2004/08/xop/include`"/></man:Document>
      </man:submitLargeDocument>
   </soapenv:Body>
</soapenv:Envelope>
------=_Part_3_7794965.1541143688509
Content-Type: text/xml; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-ID: <1534913975281>
Content-Disposition: attachment; name=`"RequisitionQuery.xml`"

<Document xmlns=`"http://www.taleo.com/ws/integration/toolkit/2011/05`">
    <Attributes>
        <Attribute name=`"version`">http://www.taleo.com/ws/tee800/2009/01</Attribute>
        <Attribute name=`"mode`">XML</Attribute>
    </Attributes>
    <Content>
        <ExportQuery xmlns=`"http://www.taleo.com/ws/integration/toolkit/2005/07/action/export`">
            <quer:query projectedClass=`"Requisition`" alias=`"Requisitions_Query`" preventDuplicates=`"true`" xmlns:quer=`"http://www.taleo.com/ws/integration/query`">
                <quer:subQueries />
                <quer:projections>
                    <quer:projection alias=`"Requisitionid`">
                        <quer:field path=`"ContestNumber`" />
                    </quer:projection>
                    <quer:projection alias=`"Numofopenings`">
                        <quer:field path=`"JobInformation,NumberToHire`" />
                    </quer:projection>
                    <quer:projection alias=`"Justification`">
                        <quer:field path=`"JobInformation,Justification,Description`" />
                    </quer:projection>
                    <quer:projection alias=`"Requisitiontitle`">
                        <quer:field path=`"JobInformation,Title`" />
                    </quer:projection>
                    <quer:projection alias=`"Titlebymanager`">
                        <quer:field path=`"ManagerRequisitionTitle`" />
                    </quer:projection>
                    <quer:projection alias=`"Busjustification`">
                        <quer:field path=`"JobInformation,BUSINESS_5fJUSTIFICATION`" />
                    </quer:projection>
                    <quer:projection alias=`"Replacementname`">
                        <quer:field path=`"JobInformation,ALU_5fReplacement_5fName`" />
                    </quer:projection>
                    <quer:projection alias=`"Replacementempid`">
                        <quer:field path=`"JobInformation,REPLACEMENT_5fHRID`" />
                    </quer:projection>
                    <quer:projection alias=`"Costcenter`">
                        <quer:field path=`"JobInformation,ALA_5fLU_5fDepartment_5fName`" />
                    </quer:projection>
                    <quer:projection alias=`"Greencard`">
                        <quer:field path=`"JobInformation,Green_20Card,Description`" />
                    </quer:projection>
                    <quer:projection alias=`"Apprforextrecr`">
                        <quer:field path=`"JobInformation,Approved_20for_20external_20recruitment,Description`" />
                    </quer:projection>
                    <quer:projection alias=`"Apprforexthiring`">
                        <quer:field path=`"JobInformation,approved_20for_20external_20hiring`" />
                    </quer:projection>
                    <quer:projection alias=`"Extapproveddate`">
                        <quer:field path=`"JobInformation,External_20approved_20date`" />
                    </quer:projection>
                    <quer:projection alias=`"Justforextapr`">
                        <quer:field path=`"JobInformation,Justification_20for_20external_20approval`" />
                    </quer:projection>
                    <quer:projection alias=`"Incentiveplan`">
                        <quer:field path=`"JobInformation,OfferParameter,To_20which_20incentive_20plan_20type_20is_20this_20position_20eligible_3f,Description`" />
                    </quer:projection>
                    <quer:projection alias=`"Posbudgetedin`">
                        <quer:field path=`"JobInformation,Position_28s_29_20budgeted_20in,Description`" />
                    </quer:projection>
                    <quer:projection alias=`"Jobcode`">
                        <quer:field path=`"JobInformation,ALU_5fJobCode,Description`" />
                    </quer:projection>
                    <quer:projection alias=`"Legalentitydesc`">
                        <quer:field path=`"JobInformation,ALU_5fLegl_5fEntity,Description`" />
                    </quer:projection>
                    <quer:projection alias=`"Legalentitycode`">
                        <quer:field path=`"JobInformation,ALU_5fLegl_5fEntity,Code`" />
                    </quer:projection>
                    <quer:projection alias=`"Busassignment`">
                        <quer:field path=`"JobInformation,ALU_5fBusiness_5fAssignment_5fValue`" />
                    </quer:projection>
                    <quer:projection alias=`"PositionNsaIpl`">
                        <quer:field path=`"JobInformation,Is_20this_20position_20tied_20to_20NSA_2fIPL_3f,Description`" />
                    </quer:projection>
                    <quer:projection alias=`"Usergroup`">
                        <quer:field path=`"JobInformation,JobInformationGroup,Description`" />
                    </quer:projection>
                    <quer:projection alias=`"Recfirstname`">
                        <quer:field path=`"JobInformation,RecruiterOwner,FirstName`" />
                    </quer:projection>
                    <quer:projection alias=`"Reclastname`">
                        <quer:field path=`"JobInformation,RecruiterOwner,LastName`" />
                    </quer:projection>
                    <quer:projection alias=`"Hmfirstname`">
                        <quer:field path=`"HiringManager,FirstName`" />
                    </quer:projection>
                    <quer:projection alias=`"Hmlastname`">
                        <quer:field path=`"HiringManager,LastName`" />
                    </quer:projection>
                    <quer:projection alias=`"Recasstfirstname`">
                        <quer:field path=`"RecruiterAssistant,FirstName`" />
                    </quer:projection>
                    <quer:projection alias=`"Recasstlastname`">
                        <quer:field path=`"RecruiterAssistant,LastName`" />
                    </quer:projection>
                    <quer:projection alias=`"Hmasstfirstname`">
                        <quer:field path=`"HiringManagerAssistant,FirstName`" />
                    </quer:projection>
                    <quer:projection alias=`"Hmasstlastname`">
                        <quer:field path=`"HiringManagerAssistant,LastName`" />
                    </quer:projection>
                    <quer:projection alias=`"Collfirstname`">
                        <quer:field path=`"Collaborators,FirstName`" />
                    </quer:projection>
                    <quer:projection alias=`"Colllastname`">
                        <quer:field path=`"Collaborators,LastName`" />
                    </quer:projection>
                    <quer:projection alias=`"Organization`">
                        <quer:field path=`"JobInformation,Organization,Name`" />
                    </quer:projection>
                    <quer:projection alias=`"Primarylocation`">
                        <quer:field path=`"JobInformation,PrimaryLocation,Name`" />
                    </quer:projection>
                    <quer:projection alias=`"Secondarylocn`">
                        <quer:field path=`"JobInformation,OtherLocations,Name`" />
                    </quer:projection>
                    <quer:projection alias=`"Jobfield`">
                        <quer:field path=`"JobInformation,JobField,Name`" />
                    </quer:projection>
                    <quer:projection alias=`"Template`">
                        <quer:field path=`"BaseJobTemplate,JobInformation,Title`" />
                    </quer:projection>
                    <quer:projection alias=`"Employeestatus`">
                        <quer:field path=`"JobInformation,EmployeeStatus,Description`" />
                    </quer:projection>
                    <quer:projection alias=`"Jobschedule`">
                        <quer:field path=`"JobInformation,JobSchedule,Description`" />
                    </quer:projection>
                    <quer:projection alias=`"Joblevel`">
                        <quer:field path=`"JobInformation,JobLevel,Description`" />
                    </quer:projection>
                    <quer:projection alias=`"Jobtype`">
                        <quer:field path=`"JobInformation,JobType,Description`" />
                    </quer:projection>
                    <quer:projection alias=`"Educationlevel`">
                        <quer:field path=`"JobInformation,StudyLevel,Description`" />
                    </quer:projection>
                    <quer:projection alias=`"Travel`">
                        <quer:field path=`"JobInformation,WillingnessToTravel,Description`" />
                    </quer:projection>
                    <quer:projection alias=`"Bonuscurrency`">
                        <quer:field path=`"JobInformation,BonusCurrency,Description`" />
                    </quer:projection>
                    <quer:projection alias=`"Eerefbonus`">
                        <quer:field path=`"JobInformation,InternalBonusTracking`" />
                    </quer:projection>
                    <quer:projection alias=`"Eerefbonusamt`">
                        <quer:field path=`"JobInformation,InternalBonusAmount`" />
                    </quer:projection>
                    <quer:projection alias=`"Pubrefbonus`">
                        <quer:field path=`"JobInformation,ExternalBonusTracking`" />
                    </quer:projection>
                    <quer:projection alias=`"Pubrefbonusamt`">
                        <quer:field path=`"JobInformation,ExternalBonusAmount`" />
                    </quer:projection>
                    <quer:projection alias=`"AddlInformation`">
                        <quer:field path=`"JobInformation,AdditionalInformation`" />
                    </quer:projection>
                    <quer:projection alias=`"Reqstatusparent`">
                        <quer:field path=`"State,ParentState,Description`" />
                    </quer:projection>
                    <quer:projection alias=`"Reqstatusdetail`">
                        <quer:field path=`"State,Description`" />
                    </quer:projection>
                    <quer:projection alias=`"Reqpstgdateint`">
                        <quer:replace>
                            <quer:field path=`"ContestNumber`" />
                            <quer:field path=`"ContestNumber`" />
                            <quer:string />
                        </quer:replace>
                    </quer:projection>
                    <quer:projection alias=`"Reqpstgdateext`">
                        <quer:replace>
                            <quer:field path=`"ContestNumber`" />
                            <quer:field path=`"ContestNumber`" />
                            <quer:string />
                        </quer:replace>
                    </quer:projection>
                    <quer:projection alias=`"Requnpstgdateint`">
                        <quer:replace>
                            <quer:field path=`"ContestNumber`" />
                            <quer:field path=`"ContestNumber`" />
                            <quer:string />
                        </quer:replace>
                    </quer:projection>
                    <quer:projection alias=`"Requnpstgdateext`">
                        <quer:replace>
                            <quer:field path=`"ContestNumber`" />
                            <quer:field path=`"ContestNumber`" />
                            <quer:string />
                        </quer:replace>
                    </quer:projection>
                    <quer:projection alias=`"Reqpstgstatusint`">
                        <quer:replace>
                            <quer:field path=`"ContestNumber`" />
                            <quer:field path=`"ContestNumber`" />
                            <quer:string />
                        </quer:replace>
                    </quer:projection>
                    <quer:projection alias=`"Reqpstgstatusext`">
                        <quer:replace>
                            <quer:field path=`"ContestNumber`" />
                            <quer:field path=`"ContestNumber`" />
                            <quer:string />
                        </quer:replace>
                    </quer:projection>
                    <quer:projection alias=`"Reqfrsttobeappr`">
                        <quer:replace>
                            <quer:field path=`"ContestNumber`" />
                            <quer:field path=`"ContestNumber`" />
                            <quer:string />
                        </quer:replace>
                    </quer:projection>
                    <quer:projection alias=`"Reqfrstfullyappr`">
                        <quer:replace>
                            <quer:field path=`"ContestNumber`" />
                            <quer:field path=`"ContestNumber`" />
                            <quer:string />
                        </quer:replace>
                    </quer:projection>
                    <quer:projection alias=`"Reqltstfullyappr`">
                        <quer:replace>
                            <quer:field path=`"ContestNumber`" />
                            <quer:field path=`"ContestNumber`" />
                            <quer:string />
                        </quer:replace>
                    </quer:projection>
                    <quer:projection alias=`"Reqcreationdate`">
                        <quer:replace>
                            <quer:field path=`"ContestNumber`" />
                            <quer:field path=`"ContestNumber`" />
                            <quer:string />
                        </quer:replace>
                    </quer:projection>
                    <quer:projection alias=`"Reqfilleddate`">
                        <quer:field path=`"JobInformation,CreationDate`" />
                    </quer:projection>
                    <quer:projection alias=`"Reqnoopngsleft`">
                        <quer:replace>
                            <quer:field path=`"ContestNumber`" />
                            <quer:field path=`"ContestNumber`" />
                            <quer:string />
                        </quer:replace>
                    </quer:projection>
                    <quer:projection alias=`"Reqnoofcand`">
                        <quer:replace>
                            <quer:field path=`"ContestNumber`" />
                            <quer:field path=`"ContestNumber`" />
                            <quer:string />
                        </quer:replace>
                    </quer:projection>
                    <quer:projection alias=`"Reqnoextcand`">
                        <quer:replace>
                            <quer:field path=`"ContestNumber`" />
                            <quer:field path=`"ContestNumber`" />
                            <quer:string />
                        </quer:replace>
                    </quer:projection>
                    <quer:projection alias=`"Reqnointcand`">
                        <quer:replace>
                            <quer:field path=`"ContestNumber`" />
                            <quer:field path=`"ContestNumber`" />
                            <quer:string />
                        </quer:replace>
                    </quer:projection>
                    <quer:projection alias=`"Reqnocandcurrhrd`">
                        <quer:replace>
                            <quer:field path=`"ContestNumber`" />
                            <quer:field path=`"ContestNumber`" />
                            <quer:string />
                        </quer:replace>
                    </quer:projection>
                    <quer:projection alias=`"Reqapprfirstname`">
                        <quer:field path=`"ApprovalContext,Approvals,Approbator,FirstName`" />
                    </quer:projection>
                    <quer:projection alias=`"Reqapprlastname`">
                        <quer:field path=`"ApprovalContext,Approvals,Approbator,LastName`" />
                    </quer:projection>
                    <quer:projection alias=`"Reqaprvrdate`">
                        <quer:field path=`"ApprovalContext,Approvals,CreationDate`" />
                    </quer:projection>
                    <quer:projection alias=`"Reqaprvrdecision`">
                        <quer:field path=`"ApprovalContext,Approvals,ApprovalStatus,Description`" />
                    </quer:projection>
                    <quer:projection alias=`"Recruiterempid`">
                        <quer:field path=`"JobInformation,RecruiterOwner,EmployeeID`" />
                    </quer:projection>
                    <quer:projection alias=`"Hmemployeeid`">
                        <quer:field path=`"HiringManager,EmployeeID`" />
                    </quer:projection>
                    <quer:projection alias=`"Recruiteremail`">
                        <quer:field path=`"JobInformation,RecruiterOwner,CorrespondenceEmail`" />
                    </quer:projection>
                    <quer:projection alias=`"Hmemail`">
                        <quer:field path=`"HiringManager,CorrespondenceEmail`" />
                    </quer:projection>
                    <quer:projection alias=`"Recrasstempid`">
                        <quer:field path=`"RecruiterAssistant,EmployeeID`" />
                    </quer:projection>
                    <quer:projection alias=`"Hmasstempid`">
                        <quer:field path=`"HiringManagerAssistant,EmployeeID`" />
                    </quer:projection>
                    <quer:projection alias=`"Recrasstemail`">
                        <quer:field path=`"RecruiterAssistant,CorrespondenceEmail`" />
                    </quer:projection>
                    <quer:projection alias=`"Hmasstemail`">
                        <quer:field path=`"HiringManagerAssistant,CorrespondenceEmail`" />
                    </quer:projection>
                </quer:projections>
                <quer:projectionFilterings />
                <quer:filterings>
                    <quer:filtering>
                        <quer:includedIn>
                            <quer:field path=`"State,ParentState,Description`" />
                            <quer:list>
                                <quer:string>Pending</quer:string>
                                <quer:string>Open</quer:string>
                                <quer:string>Filled</quer:string>
                            </quer:list>
                        </quer:includedIn>
                    </quer:filtering>
                    <quer:filtering>
                        <quer:includedIn>
                            <quer:field path=`"State,Description`" />
                            <quer:list>
                                <quer:string>To Be Approved</quer:string>
                                <quer:string>Approved</quer:string>
                                <quer:string>Sourcing</quer:string>
                                <quer:string>Filled</quer:string>
                            </quer:list>
                        </quer:includedIn>
                    </quer:filtering>
                    <quer:filtering>
                        <quer:equal>
                            <quer:field path=`"JobInformation,JobInformationGroup,Description`" />
                            <quer:string>Main Group</quer:string>
                        </quer:equal>
                    </quer:filtering>
                    <quer:filtering>
                        <quer:greaterThanOrEqual>
                            <quer:field path=`"JobInformation,LastModifiedDate`" />
                            <quer:date>??FromDate??</quer:date>
                        </quer:greaterThanOrEqual>
                    </quer:filtering>
                    <quer:filtering>
                        <quer:lessThanOrEqual>
                            <quer:field path=`"JobInformation,LastModifiedDate`" />
                            <quer:date>??ToDate??</quer:date>
                        </quer:lessThanOrEqual>
                    </quer:filtering>
                </quer:filterings>
                <quer:sortings>
                    <quer:sorting ascending=`"true`">
                        <quer:field path=`"ContestNumber`" />
                    </quer:sorting>
                </quer:sortings>
                <quer:sortingFilterings />
                <quer:groupings />
                <quer:joinings />
            </quer:query>
        </ExportQuery>
    </Content>
</Document>
------=_Part_3_7794965.1541143688509--";"ServiceContentType"="multipart/related; type=`"application/xop+xml`"; start=`"<rootpart@soapui.org>`"; start-info=`"text/xml`"; boundary=`"----=_Part_3_7794965.1541143688509`"";"ServiceMIMEVersion"="1.0";"ServiceMethod"="POST";"ServiceSOAPAction"="http://www.taleo.com/ws/integration/toolkit/2011/05/management/IntegrationManagementService#submitLargeDocument";"ServiceURI"="https://nok-ipaas-dev-we-apm-01.azure-api.net/OurTalentBulkAPI"}
# End section for TaleoServiceMetaData  for Requisition


#Start Section For TaleoServiceMetaData for MessageStatus
Add-StorageTableRow `
    -table $storageTable `
    -partitionKey "getMessageByKey" `
    -rowKey ("getMessageByKey") `
	-property @{"ServiceBody"="<soapenv:Envelope xmlns:soapenv=`"http://schemas.xmlsoap.org/soap/envelope/`" xmlns:man=`"http://www.taleo.com/ws/integration/toolkit/2011/05/management`">
   <soapenv:Header/>
   <soapenv:Body>
      <man:getMessageByKey>
         <man:messageKey>??</man:messageKey>
      </man:getMessageByKey>
   </soapenv:Body>
</soapenv:Envelope>";"ServiceContentType"="text/xml";"ServiceMIMEVersion"="1.0";"ServiceMethod"="POST";"ServiceSOAPAction"="http://www.taleo.com/ws/integration/toolkit/2011/05/management/IntegrationManagementService#getMessageByKey";"ServiceURI"="https://nok-ipaas-dev-we-apm-01.azure-api.net/OurTalentBulkAPI"}
#End Section For TaleoServiceMetaData for MessageStatus

#Start Section For TaleoServiceMetaData for GetLargetDocument
Add-StorageTableRow `
    -table $storageTable `
    -partitionKey "getLargeDocumentByKey" `
    -rowKey ("getLargeDocumentByKey") `
	-property @{"ServiceBody"="<soapenv:Envelope xmlns:soapenv=`"http://schemas.xmlsoap.org/soap/envelope/`" xmlns:man=`"http://www.taleo.com/ws/integration/toolkit/2011/05/management`">
   <soapenv:Header/>
   <soapenv:Body>
      <man:getLargeDocumentByKey>
         <man:messageKey>??</man:messageKey>
      </man:getLargeDocumentByKey>
   </soapenv:Body>
</soapenv:Envelope>";"ServiceContentType"="text/xml";"ServiceMIMEVersion"="1.0";"ServiceMethod"="POST";"ServiceSOAPAction"="http://www.taleo.com/ws/integration/toolkit/2011/05/management/IntegrationManagementService#getLargeDocumentByKey";"ServiceURI"="https://nok-ipaas-dev-we-apm-01.azure-api.net/OurTalentBulkAPI"}
#End Section For TaleoServiceMetaData for GetLargetDocument

# Start section for TaleoServiceMetaData  for Offer
Add-StorageTableRow `
    -table $storageTable `
    -partitionKey "submitLargeDocument" `
    -rowKey ("Offer") `
	-property @{"ServiceBody"="------=_Part_3_7794965.1541143688509
Content-Type: application/xop+xml; charset=UTF-8; type=`"text/xml`"
Content-Transfer-Encoding: 8bit
Content-ID: <rootpart@soapui.org>

<soapenv:Envelope xmlns:soapenv=`"http://schemas.xmlsoap.org/soap/envelope/`" xmlns:add=`"http://www.w3.org/2005/03/addressing`" xmlns:man=`"http://www.taleo.com/ws/integration/toolkit/2011/05/management`">
   <soapenv:Header>
      <add:Action>http://www.taleo.com/ws/integration/toolkit/2005/07/action/export</add:Action>
      <add:ReplyTo>
         <add:Address>http://www.taleo.com/ws/integration/toolkit/2005/07/addressing/queue</add:Address>
         <!--Optional:-->
         <add:ReferenceParameters>
            <!--You may enter ANY elements at this point-->
         </add:ReferenceParameters>
      </add:ReplyTo>
      <add:MessageID>??MsgKey??</add:MessageID>
   </soapenv:Header>
   <soapenv:Body>
      <man:submitLargeDocument>
         <man:Document><inc:Include href=`"cid:1534913975281`" xmlns:inc=`"http://www.w3.org/2004/08/xop/include`"/></man:Document>
      </man:submitLargeDocument>
   </soapenv:Body>
</soapenv:Envelope>
------=_Part_3_7794965.1541143688509
Content-Type: text/xml; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-ID: <1534913975281>
Content-Disposition: attachment; name=`"Offer.xml`"

<Document xmlns=`"http://www.taleo.com/ws/integration/toolkit/2011/05`">
    <Attributes>
        <Attribute name=`"version`">http://www.taleo.com/ws/tee800/2009/01</Attribute>
        <Attribute name=`"mode`">XML</Attribute>
    </Attributes>
    <Content>
        <ExportQuery xmlns=`"http://www.taleo.com/ws/integration/toolkit/2005/07/action/export`">
            <quer:query projectedClass=`"Offer`" alias=`"OfferMain`" preventDuplicates=`"true`" xmlns:quer=`"http://www.taleo.com/ws/integration/query`">
                <quer:subQueries />
                <quer:projections>
                    <quer:projection alias=`"Offernumber`">
                        <quer:field path=`"Number`" />
                    </quer:projection>
                    <quer:projection alias=`"Requisitionid`">
                        <quer:field path=`"Application,Requisition,ContestNumber`" />
                    </quer:projection>
                    <quer:projection alias=`"Applicationid`">
                        <quer:field path=`"Application,Number`" />
                    </quer:projection>
                    <quer:projection alias=`"Status`">
                        <quer:field path=`"Status,Description`" />
                    </quer:projection>
                    <quer:projection alias=`"Approveddate`">
                        <quer:field path=`"ApprovedDate`" />
                    </quer:projection>
                    <quer:projection alias=`"Extenddate`">
                        <quer:field path=`"ExtendDate`" />
                    </quer:projection>
                    <quer:projection alias=`"Expirationdate`">
                        <quer:field path=`"ExpirationDate`" />
                    </quer:projection>
                    <quer:projection alias=`"Targetstartdate`">
                        <quer:field path=`"TargetStartDate`" />
                    </quer:projection>
                    <quer:projection alias=`"Startdate`">
                        <quer:field path=`"ActualStartDate`" />
                    </quer:projection>
                    <quer:projection alias=`"Tentative`">
                        <quer:field path=`"Tentative`" />
                    </quer:projection>
                    <quer:projection alias=`"ContractendDate`">
                        <quer:field path=`"ContractEndDate`" />
                    </quer:projection>
                    <quer:projection alias=`"Createdon`">
                        <quer:field path=`"CaptureDate`" />
                    </quer:projection>
                    <quer:projection alias=`"Legalentity`">
                        <quer:field path=`"Legal_5fEntity,Description`" />
                    </quer:projection>
                    <quer:projection alias=`"Legalentitycode`">
                        <quer:field path=`"Legal_5fEntity,Code`" />
                    </quer:projection>
                    <quer:projection alias=`"Employeesubgroup`">
                        <quer:field path=`"employee_5fsub_5fgroup`" />
                    </quer:projection>
                    <quer:projection alias=`"Hiretype`">
                        <quer:field path=`"ALU_5fHire_5fJust_5fNo_5fContxt,Description`" />
                    </quer:projection>
                    <quer:projection alias=`"OfferapvlrsnCode`">
                        <quer:field path=`"Nokia_20_2d_20Offer_20Approval_20Reason_20Code,Description`" />
                    </quer:projection>
                    <quer:projection alias=`"Jobtitleoffered`">
                        <quer:field path=`"OfferJobTitle`" />
                    </quer:projection>
                    <quer:projection alias=`"Jobgrade`">
                        <quer:field path=`"job_5fgrade,Description`" />
                    </quer:projection>
                    <quer:projection alias=`"Finaljobcode`">
                        <quer:field path=`"job_5fcode,Description`" />
                    </quer:projection>
                    <quer:projection alias=`"Probationperiod`">
                        <quer:field path=`"ProbationPeriod`" />
                    </quer:projection>
                    <quer:projection alias=`"Stdhoursperweek`">
                        <quer:field path=`"StandardHours`" />
                    </quer:projection>
                    <quer:projection alias=`"Vacation`">
                        <quer:field path=`"Vacation`" />
                    </quer:projection>
                    <quer:projection alias=`"Vacationunits`">
                        <quer:field path=`"VacationType,Description`" />
                    </quer:projection>
                    <quer:projection alias=`"Paybasis`">
                        <quer:field path=`"PayFrequencyBasis,Description`" />
                    </quer:projection>
                    <quer:projection alias=`"Salary`">
                        <quer:field path=`"PayValue`" />
                    </quer:projection>
                    <quer:projection alias=`"Annualizedsalary`">
                        <quer:field path=`"Salary`" />
                    </quer:projection>
                    <quer:projection alias=`"Currency`">
                        <quer:field path=`"Currency,Description`" />
                    </quer:projection>
                    <quer:projection alias=`"Incentiveplan`">
                        <quer:field path=`"To_20which_20incentive_20plan_20type_20is_20this_20position_20eligible_3f,Description`" />
                    </quer:projection>
                    <quer:projection alias=`"Incentivepercent`">
                        <quer:field path=`"incentive_5fpercentage`" />
                    </quer:projection>
                    <quer:projection alias=`"Annualbonus`">
                        <quer:field path=`"AnnualBonus`" />
                    </quer:projection>
                    <quer:projection alias=`"Totaltargetcash`">
                        <quer:field path=`"total_5ftarget_5fcash`" />
                    </quer:projection>
                    <quer:projection alias=`"Signonbonus`">
                        <quer:field path=`"SignOnBonus`" />
                    </quer:projection>
                    <quer:projection alias=`"Otherbonus`">
                        <quer:field path=`"OtherBonus`" />
                    </quer:projection>
                    <quer:projection alias=`"Othercompensation`">
                        <quer:field path=`"OtherCompensation`" />
                    </quer:projection>
                    <quer:projection alias=`"Noticeprdbuyout`">
                        <quer:field path=`"notice_5fperiod_5fpay_5fout`" />
                    </quer:projection>
                    <quer:projection alias=`"Relocation`">
                        <quer:field path=`"relocation,Description`" />
                    </quer:projection>
                    <quer:projection alias=`"Relnelements`">
                        <quer:field path=`"relocation_5felements,Description`" />
                    </quer:projection>
                    <quer:projection alias=`"Relnlumpsum`">
                        <quer:field path=`"relocation_5flump_5fsum`" />
                    </quer:projection>
                    <quer:projection alias=`"Joboffaccptddate`">
                        <quer:field path=`"AcceptedDate`" />
                    </quer:projection>
                    <quer:projection alias=`"Candidatenumber`">
                        <quer:field path=`"Application,Candidate,History,Candidate,Candidate.Number`" />
                    </quer:projection>
                    <quer:projection alias=`"Candfirstname`">
                        <quer:field path=`"Application,Candidate,History,Candidate,Candidate.FirstName`" />
                    </quer:projection>
                    <quer:projection alias=`"Candlastname`">
                        <quer:field path=`"Application,Candidate,History,Candidate,Candidate.LastName`" />
                    </quer:projection>
                </quer:projections>
                <quer:projectionFilterings />
                <quer:filterings>
                    <quer:filtering>
                        <quer:includedIn>
                            <quer:field path=`"Status,Description`" />
                            <quer:list>
                                <quer:string>Approved</quer:string>
                                <quer:string>Extended</quer:string>
                                <quer:string>Accepted</quer:string>
                                <quer:string>In Negotiation</quer:string>
                            </quer:list>
                        </quer:includedIn>
                    </quer:filtering>
                    <quer:filtering>
                        <quer:greaterThanOrEqual>
                            <quer:field path=`"LastModifiedDate`" />
                            <quer:date>??FromDate??</quer:date>
                        </quer:greaterThanOrEqual>
                    </quer:filtering>
                    <quer:filtering>
                        <quer:lessThanOrEqual>
                            <quer:field path=`"LastModifiedDate`" />
                            <quer:date>??ToDate??</quer:date>
                        </quer:lessThanOrEqual>
                    </quer:filtering>
                </quer:filterings>
                <quer:sortings>
                    <quer:sorting ascending=`"true`">
                        <quer:field path=`"Application,Requisition,ContestNumber`" />
                    </quer:sorting>
                    <quer:sorting ascending=`"true`">
                        <quer:field path=`"Number`" />
                    </quer:sorting>
                </quer:sortings>
                <quer:sortingFilterings />
                <quer:groupings />
                <quer:joinings />
            </quer:query>
        </ExportQuery>
    </Content>
</Document>
------=_Part_3_7794965.1541143688509--";"ServiceContentType"="multipart/related; type=`"application/xop+xml`"; start=`"<rootpart@soapui.org>`"; start-info=`"text/xml`"; boundary=`"----=_Part_3_7794965.1541143688509`"";"ServiceMIMEVersion"="1.0";"ServiceMethod"="POST";"ServiceSOAPAction"="http://www.taleo.com/ws/integration/toolkit/2011/05/management/IntegrationManagementService#submitLargeDocument";"ServiceURI"="https://nok-ipaas-dev-we-apm-01.azure-api.net/OurTalentBulkAPI"}
# End section for TaleoServiceMetaData  for Offer

# Start section for TaleoServiceMetaData  for JobSubmission
Add-StorageTableRow `
    -table $storageTable `
    -partitionKey "submitLargeDocument" `
    -rowKey ("JobSubmission") `
	-property @{"ServiceBody"="------=_Part_3_7794965.1541143688509
Content-Type: application/xop+xml; charset=UTF-8; type=`"text/xml`"
Content-Transfer-Encoding: 8bit
Content-ID: <rootpart@soapui.org>

<soapenv:Envelope xmlns:soapenv=`"http://schemas.xmlsoap.org/soap/envelope/`" xmlns:add=`"http://www.w3.org/2005/03/addressing`" xmlns:man=`"http://www.taleo.com/ws/integration/toolkit/2011/05/management`">
   <soapenv:Header>
      <add:Action>http://www.taleo.com/ws/integration/toolkit/2005/07/action/export</add:Action>
      <add:ReplyTo>
         <add:Address>http://www.taleo.com/ws/integration/toolkit/2005/07/addressing/queue</add:Address>
         <!--Optional:-->
         <add:ReferenceParameters>
            <!--You may enter ANY elements at this point-->
         </add:ReferenceParameters>
      </add:ReplyTo>
      <add:MessageID>??MsgKey??</add:MessageID>
   </soapenv:Header>
   <soapenv:Body>
      <man:submitLargeDocument>
         <man:Document><inc:Include href=`"cid:1534913975281`" xmlns:inc=`"http://www.w3.org/2004/08/xop/include`"/></man:Document>
      </man:submitLargeDocument>
   </soapenv:Body>
</soapenv:Envelope>
------=_Part_3_7794965.1541143688509
Content-Type: text/xml; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-ID: <1534913975281>
Content-Disposition: attachment; name=`"JobSubmission.xml`"

<Document xmlns=`"http://www.taleo.com/ws/integration/toolkit/2011/05`">
    <Attributes>
        <Attribute name=`"version`">http://www.taleo.com/ws/tee800/2009/01</Attribute>
        <Attribute name=`"mode`">XML</Attribute>
    </Attributes>
    <Content>
        <ExportQuery xmlns=`"http://www.taleo.com/ws/integration/toolkit/2005/07/action/export`">
            <quer:query projectedClass=`"Application`" alias=`"JobApplication`" preventDuplicates=`"true`" xmlns:quer=`"http://www.taleo.com/ws/integration/query`">
                <quer:subQueries />
                <quer:projections>
                    <quer:projection alias=`"ApplicationID`">
                        <quer:field path=`"Number`" />
                    </quer:projection>
                    <quer:projection alias=`"RequisitionID`">
                        <quer:field path=`"Requisition,ContestNumber`" />
                    </quer:projection>
                    <quer:projection alias=`"CandidateID`">
                        <quer:field path=`"Candidate,Number`" />
                    </quer:projection>
                    <quer:projection alias=`"EmployeeNumber`">
                        <quer:field path=`"Candidate,EmployeeNumber`" />
                    </quer:projection>
                    <quer:projection alias=`"SourceType`">
                        <quer:field path=`"ProfileInformation,RecruitmentSource,Type,CustomDescription`" />
                    </quer:projection>
                    <quer:projection alias=`"Source`">
                        <quer:field path=`"ProfileInformation,RecruitmentSource,Description`" />
                    </quer:projection>
                    <quer:projection alias=`"Questionnaire`">
                        <quer:replace>
                            <quer:field path=`"ReferralType`" />
                            <quer:field path=`"ReferralType`" />
                            <quer:string />
                        </quer:replace>
                    </quer:projection>
                    <quer:projection alias=`"QuestionnaireAns`">
                        <quer:replace>
                            <quer:field path=`"ReferralType`" />
                            <quer:field path=`"ReferralType`" />
                            <quer:string />
                        </quer:replace>
                    </quer:projection>
                    <quer:projection alias=`"Gender`">
                        <quer:replace>
                            <quer:field path=`"ReferralType`" />
                            <quer:field path=`"ReferralType`" />
                            <quer:string />
                        </quer:replace>
                    </quer:projection>
                    <quer:projection alias=`"Internal`">
                        <quer:field path=`"Candidate,InternalApplication`" />
                    </quer:projection>
                    <quer:projection alias=`"CSWStepName`">
                        <quer:field path=`"CSWLatestStep,Name`" />
                    </quer:projection>
                    <quer:projection alias=`"CSWStepStatus`">
                        <quer:field path=`"CSWLatestStatus,Name`" />
                    </quer:projection>
                    <quer:projection alias=`"AppHireStartDate`">
                        <quer:replace>
                            <quer:field path=`"ReferralType`" />
                            <quer:field path=`"ReferralType`" />
                            <quer:string />
                        </quer:replace>
                    </quer:projection>
                    <quer:projection alias=`"AppCompletedDate`">
                        <quer:replace>
                            <quer:field path=`"ReferralType`" />
                            <quer:field path=`"ReferralType`" />
                            <quer:string />
                        </quer:replace>
                    </quer:projection>
                    <quer:projection alias=`"CurrCSWStartDate`">
                        <quer:field path=`"CSWLatestDate`" />
                    </quer:projection>
                    <quer:projection alias=`"LatestHiredDate`">
                        <quer:field path=`"DateOfEntry`" />
                    </quer:projection>
                    <quer:projection alias=`"ApplsCompleted`">
                        <quer:field path=`"ApplicationStatusesByContext,ApplicationStatusByContextDefinition,Name`" />
                    </quer:projection>
                    <quer:projection alias=`"ReferrerID`">
                        <quer:field path=`"Candidate,CandidateReferrer,Number`" />
                    </quer:projection>
                    <quer:projection alias=`"ReferrerEmail`">
                        <quer:field path=`"Candidate,CandidateReferrer,EmailAddress`" />
                    </quer:projection>
                    <quer:projection alias=`"ReferrerEmpID`">
                        <quer:field path=`"Candidate,CandidateReferrer,EmployeeNumber`" />
                    </quer:projection>
                    <quer:projection alias=`"ReferrerInternal`">
                        <quer:field path=`"Candidate,CandidateReferrer,InternalApplication`" />
                    </quer:projection>
                    <quer:projection alias=`"ReferrerFirstName`">
                        <quer:field path=`"Candidate,CandidateReferrer,FirstName`" />
                    </quer:projection>
                    <quer:projection alias=`"ReferrerLastName`">
                        <quer:field path=`"Candidate,CandidateReferrer,LastName`" />
                    </quer:projection>
                    <quer:projection alias=`"RefResidence_L1`">
                        <quer:field path=`"Candidate,CandidateReferrer,ResidenceLocation,Parent,Parent,Name`" />
                    </quer:projection>
                    <quer:projection alias=`"RefResidence_L2`">
                        <quer:field path=`"Candidate,CandidateReferrer,ResidenceLocation,Parent,Name`" />
                    </quer:projection>
                    <quer:projection alias=`"RefResidence_L3`">
                        <quer:field path=`"Candidate,CandidateReferrer,ResidenceLocation,Name`" />
                    </quer:projection>
                    <quer:projection alias=`"ReferrerCity`">
                        <quer:field path=`"Candidate,CandidateReferrer,City`" />
                    </quer:projection>
                    <quer:projection alias=`"ReferralStatus`">
                        <quer:field path=`"Candidate,ReferralStatus,Description`" />
                    </quer:projection>
                    <quer:projection alias=`"ReferenceDate`">
                        <quer:field path=`"Candidate,ReferenceDate`" />
                    </quer:projection>
                    <quer:projection alias=`"ReferenceEDate`">
                        <quer:field path=`"Candidate,ReferenceEndDate`" />
                    </quer:projection>
                    <quer:projection alias=`"IsCurrReferred`">
                        <quer:field path=`"Candidate,Referred`" />
                    </quer:projection>
                    <quer:projection alias=`"ReferralType`">
                        <quer:field path=`"Candidate,ReferralType`" />
                    </quer:projection>
                </quer:projections>
                <quer:projectionFilterings />
                <quer:filterings>
                    <quer:filtering>
                        <quer:equal>
                            <quer:field path=`"ApplicationStatusesByContext,ApplicationStatusByContextDefinition,Name`" />
                            <quer:string>Completed</quer:string>
                        </quer:equal>
                    </quer:filtering>
                    <quer:filtering>
                        <quer:and>
                            <quer:includedIn>
                                <quer:field path=`"Requisition,State,Description`" />
                                <quer:list>
                                    <quer:string>Pending</quer:string>
                                    <quer:string>Open</quer:string>
                                    <quer:string>Filled</quer:string>
                                </quer:list>
                            </quer:includedIn>
                            <quer:greaterThanOrEqual>
                                <quer:field path=`"Requisition,RequisitionEvent,EventDate`" />
                                <quer:date>??FromDate??</quer:date>
                            </quer:greaterThanOrEqual>
							<quer:lessThanOrEqual>
                                <quer:field path=`"Requisition,RequisitionEvent,EventDate`" />
                                <quer:date>??ToDate??</quer:date>
                            </quer:lessThanOrEqual>
                        </quer:and>
                    </quer:filtering>
                </quer:filterings>
                <quer:sortings>
                    <quer:sorting ascending=`"true`">
                        <quer:field path=`"Requisition,ContestNumber`" />
                    </quer:sorting>
                    <quer:sorting ascending=`"true`">
                        <quer:field path=`"Candidate,Number`" />
                    </quer:sorting>
                    <quer:sorting ascending=`"true`">
                        <quer:field path=`"Number`" />
                    </quer:sorting>
                </quer:sortings>
                <quer:sortingFilterings />
                <quer:groupings />
                <quer:joinings />
            </quer:query>
        </ExportQuery>
    </Content>
</Document>
------=_Part_3_7794965.1541143688509--";"ServiceContentType"="multipart/related; type=`"application/xop+xml`"; start=`"<rootpart@soapui.org>`"; start-info=`"text/xml`"; boundary=`"----=_Part_3_7794965.1541143688509`"";"ServiceMIMEVersion"="1.0";"ServiceMethod"="POST";"ServiceSOAPAction"="http://www.taleo.com/ws/integration/toolkit/2011/05/management/IntegrationManagementService#submitLargeDocument";"ServiceURI"="https://nok-ipaas-dev-we-apm-01.azure-api.net/OurTalentBulkAPI"}
# End section for TaleoServiceMetaData  for JobSubmission

# Start section for TaleoServiceMetaData for OrganizationMasterOLF

Add-StorageTableRow `
    -table $storageTable `
    -partitionKey "submitLargeDocument" `
    -rowKey ("OrganizationMaster") `
	-property @{"ServiceBody"="------=_Part_3_7794965.1541143688509
Content-Type: application/xop+xml; charset=UTF-8; type=`"text/xml`"
Content-Transfer-Encoding: 8bit
Content-ID: <rootpart@soapui.org>

<soapenv:Envelope xmlns:soapenv=`"http://schemas.xmlsoap.org/soap/envelope/`" xmlns:add=`"http://www.w3.org/2005/03/addressing`" xmlns:man=`"http://www.taleo.com/ws/integration/toolkit/2011/05/management`">
   <soapenv:Header>
      <add:Action>http://www.taleo.com/ws/integration/toolkit/2005/07/action/export</add:Action>
      <add:ReplyTo>
         <add:Address>http://www.taleo.com/ws/integration/toolkit/2005/07/addressing/queue</add:Address>
         <!--Optional:-->
         <add:ReferenceParameters>
            <!--You may enter ANY elements at this point-->
         </add:ReferenceParameters>
      </add:ReplyTo>
      <add:MessageID>??MsgKey??</add:MessageID>
   </soapenv:Header>
   <soapenv:Body>
      <man:submitLargeDocument>
         <man:Document><inc:Include href=`"cid:1534913975281`" xmlns:inc=`"http://www.w3.org/2004/08/xop/include`"/></man:Document>
      </man:submitLargeDocument>
   </soapenv:Body>
</soapenv:Envelope>
------=_Part_3_7794965.1541143688509
Content-Type: text/xml; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-ID: <1534913975281>
Content-Disposition: attachment; name=`"OrganizationMasterOLF.xml`"

<Document xmlns=`"http://www.taleo.com/ws/integration/toolkit/2011/05`">
    <Attributes>
        <Attribute name=`"version`">http://www.taleo.com/ws/tee800/2009/01</Attribute>
        <Attribute name=`"mode`">XML</Attribute>
    </Attributes>
    <Content>
        <ExportQuery xmlns=`"http://www.taleo.com/ws/integration/toolkit/2005/07/action/export`">
            <quer:query projectedClass=`"Organization`" alias=`"OrganizationMaster`" preventDuplicates=`"true`" xmlns:quer=`"http://www.taleo.com/ws/integration/query`">
                <quer:subQueries />
                <quer:projections>
                    <quer:projection alias=`"Orgcode`">
                        <quer:field path=`"Code`" />
                    </quer:projection>
                    <quer:projection alias=`"Orgname`">
                        <quer:field path=`"Name`" />
                    </quer:projection>
                    <quer:projection alias=`"Orglevel`">
                        <quer:field path=`"Level`" />
                    </quer:projection>
                    <quer:projection alias=`"Orgstatus`">
                        <quer:field path=`"Status,Description`" />
                    </quer:projection>
                    <quer:projection alias=`"Parentorgcode`">
                        <quer:field path=`"Parent,Code`" />
                    </quer:projection>
                    <quer:projection alias=`"Parentorgname`">
                        <quer:field path=`"Parent,Name`" />
                    </quer:projection>
                    <quer:projection alias=`"Parentorglevel`">
                        <quer:field path=`"Parent,Level`" />
                    </quer:projection>
                    <quer:projection alias=`"Parentorgstatus`">
                        <quer:field path=`"Parent,Status,Description`" />
                    </quer:projection>
                </quer:projections>
                <quer:projectionFilterings />
                <quer:filterings />
                <quer:sortings>
                    <quer:sorting ascending=`"true`">
                        <quer:field path=`"Level`" />
                    </quer:sorting>
                    <quer:sorting ascending=`"true`">
                        <quer:field path=`"Parent,Name`" />
                    </quer:sorting>
                </quer:sortings>
                <quer:sortingFilterings />
                <quer:groupings />
                <quer:joinings />
            </quer:query>
        </ExportQuery>
    </Content>
</Document>
------=_Part_3_7794965.1541143688509--";"ServiceContentType"="multipart/related; type=`"application/xop+xml`"; start=`"<rootpart@soapui.org>`"; start-info=`"text/xml`"; boundary=`"----=_Part_3_7794965.1541143688509`"";"ServiceMIMEVersion"="1.0";"ServiceMethod"="POST";"ServiceSOAPAction"="http://www.taleo.com/ws/integration/toolkit/2011/05/management/IntegrationManagementService#submitLargeDocument";"ServiceURI"="https://nok-ipaas-dev-we-apm-01.azure-api.net/OurTalentBulkAPI"}


# End section for TaleoServiceMetaData  for OrganizationMasterOLF

# Start section for TaleoServiceMetaData for JobFieldOLF

Add-StorageTableRow `
    -table $storageTable `
    -partitionKey "submitLargeDocument" `
    -rowKey ("JobField") `
	-property @{"ServiceBody"="------=_Part_3_7794965.1541143688509
Content-Type: application/xop+xml; charset=UTF-8; type=`"text/xml`"
Content-Transfer-Encoding: 8bit
Content-ID: <rootpart@soapui.org>

<soapenv:Envelope xmlns:soapenv=`"http://schemas.xmlsoap.org/soap/envelope/`" xmlns:add=`"http://www.w3.org/2005/03/addressing`" xmlns:man=`"http://www.taleo.com/ws/integration/toolkit/2011/05/management`">
   <soapenv:Header>
      <add:Action>http://www.taleo.com/ws/integration/toolkit/2005/07/action/export</add:Action>
      <add:ReplyTo>
         <add:Address>http://www.taleo.com/ws/integration/toolkit/2005/07/addressing/queue</add:Address>
         <!--Optional:-->
         <add:ReferenceParameters>
            <!--You may enter ANY elements at this point-->
         </add:ReferenceParameters>
      </add:ReplyTo>
      <add:MessageID>??MsgKey??</add:MessageID>
   </soapenv:Header>
   <soapenv:Body>
      <man:submitLargeDocument>
         <man:Document><inc:Include href=`"cid:1534913975281`" xmlns:inc=`"http://www.w3.org/2004/08/xop/include`"/></man:Document>
      </man:submitLargeDocument>
   </soapenv:Body>
</soapenv:Envelope>
------=_Part_3_7794965.1541143688509
Content-Type: text/xml; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-ID: <1534913975281>
Content-Disposition: attachment; name=`"JobField.xml`"

<Document xmlns=`"http://www.taleo.com/ws/integration/toolkit/2011/05`">
    <Attributes>
        <Attribute name=`"version`">http://www.taleo.com/ws/tee800/2009/01</Attribute>
        <Attribute name=`"mode`">XML</Attribute>
    </Attributes>
    <Content>
        <ExportQuery xmlns=`"http://www.taleo.com/ws/integration/toolkit/2005/07/action/export`">
            <quer:query projectedClass=`"JobField`" alias=`"JobFieldMaster`" preventDuplicates=`"true`" xmlns:quer=`"http://www.taleo.com/ws/integration/query`">
                <quer:subQueries />
                <quer:projections>
                    <quer:projection alias=`"Jobfieldcode`">
                        <quer:field path=`"Code`" />
                    </quer:projection>
                    <quer:projection alias=`"Jobfieldname`">
                        <quer:field path=`"Name`" />
                    </quer:projection>
                    <quer:projection alias=`"Jobfieldlevel`">
                        <quer:field path=`"Level`" />
                    </quer:projection>
                    <quer:projection alias=`"Jobfieldstatus`">
                        <quer:field path=`"Status,Description`" />
                    </quer:projection>
                    <quer:projection alias=`"Parentjfcode`">
                        <quer:field path=`"Parent,Code`" />
                    </quer:projection>
                    <quer:projection alias=`"Parentjfname`">
                        <quer:field path=`"Parent,Name`" />
                    </quer:projection>
                    <quer:projection alias=`"Parentjflevel`">
                        <quer:field path=`"Parent,Level`" />
                    </quer:projection>
                    <quer:projection alias=`"Parentjfstatus`">
                        <quer:field path=`"Parent,Status,Description`" />
                    </quer:projection>
                </quer:projections>
                <quer:projectionFilterings />
                <quer:filterings />
                <quer:sortings>
                    <quer:sorting ascending=`"true`">
                        <quer:field path=`"Level`" />
                    </quer:sorting>
                    <quer:sorting ascending=`"true`">
                        <quer:field path=`"Parent,Name`" />
                    </quer:sorting>
                </quer:sortings>
                <quer:sortingFilterings />
                <quer:groupings />
                <quer:joinings />
            </quer:query>
        </ExportQuery>
    </Content>
</Document>
------=_Part_3_7794965.1541143688509--";"ServiceContentType"="multipart/related; type=`"application/xop+xml`"; start=`"<rootpart@soapui.org>`"; start-info=`"text/xml`"; boundary=`"----=_Part_3_7794965.1541143688509`"";"ServiceMIMEVersion"="1.0";"ServiceMethod"="POST";"ServiceSOAPAction"="http://www.taleo.com/ws/integration/toolkit/2011/05/management/IntegrationManagementService#submitLargeDocument";"ServiceURI"="https://nok-ipaas-dev-we-apm-01.azure-api.net/OurTalentBulkAPI"}
# End section for TaleoServiceMetaData  for JobFieldOLF

# Start section for TaleoServiceMetaData for LocationOLF
Add-StorageTableRow `
    -table $storageTable `
    -partitionKey "submitLargeDocument" `
    -rowKey ("Location") `
	-property @{"ServiceBody"="------=_Part_3_7794965.1541143688509
Content-Type: application/xop+xml; charset=UTF-8; type=`"text/xml`"
Content-Transfer-Encoding: 8bit
Content-ID: <rootpart@soapui.org>

<soapenv:Envelope xmlns:soapenv=`"http://schemas.xmlsoap.org/soap/envelope/`" xmlns:add=`"http://www.w3.org/2005/03/addressing`" xmlns:man=`"http://www.taleo.com/ws/integration/toolkit/2011/05/management`">
   <soapenv:Header>
      <add:Action>http://www.taleo.com/ws/integration/toolkit/2005/07/action/export</add:Action>
      <add:ReplyTo>
         <add:Address>http://www.taleo.com/ws/integration/toolkit/2005/07/addressing/queue</add:Address>
         <!--Optional:-->
         <add:ReferenceParameters>
            <!--You may enter ANY elements at this point-->
         </add:ReferenceParameters>
      </add:ReplyTo>
      <add:MessageID>??MsgKey??</add:MessageID>
   </soapenv:Header>
   <soapenv:Body>
      <man:submitLargeDocument>
         <man:Document><inc:Include href=`"cid:1534913975281`" xmlns:inc=`"http://www.w3.org/2004/08/xop/include`"/></man:Document>
      </man:submitLargeDocument>
   </soapenv:Body>
</soapenv:Envelope>
------=_Part_3_7794965.1541143688509
Content-Type: text/xml; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-ID: <1534913975281>
Content-Disposition: attachment; name=`"Location.xml`"

<Document xmlns=`"http://www.taleo.com/ws/integration/toolkit/2011/05`">
    <Attributes>
        <Attribute name=`"version`">http://www.taleo.com/ws/tee800/2009/01</Attribute>
        <Attribute name=`"mode`">XML</Attribute>
    </Attributes>
    <Content>
        <ExportQuery xmlns=`"http://www.taleo.com/ws/integration/toolkit/2005/07/action/export`">
            <quer:query projectedClass=`"Location`" alias=`"LocationMaster`" preventDuplicates=`"true`" xmlns:quer=`"http://www.taleo.com/ws/integration/query`">
                <quer:subQueries />
                <quer:projections>
                    <quer:projection alias=`"Locationcode`">
                        <quer:field path=`"Code`" />
                    </quer:projection>
                    <quer:projection alias=`"Locationname`">
                        <quer:field path=`"Name`" />
                    </quer:projection>
                    <quer:projection alias=`"LocationLevel`">
                        <quer:field path=`"Level`" />
                    </quer:projection>
                    <quer:projection alias=`"Locationstatus`">
                        <quer:field path=`"Status,Description`" />
                    </quer:projection>
                    <quer:projection alias=`"Parentloccode`">
                        <quer:field path=`"Parent,Code`" />
                    </quer:projection>
                    <quer:projection alias=`"Parentlocname`">
                        <quer:field path=`"Parent,Name`" />
                    </quer:projection>
                    <quer:projection alias=`"Parentloclevel`">
                        <quer:field path=`"Parent,Level`" />
                    </quer:projection>
                    <quer:projection alias=`"Parentlocstatus`">
                        <quer:field path=`"Parent,Status,Description`" />
                    </quer:projection>
                </quer:projections>
                <quer:projectionFilterings />
                <quer:filterings />
                <quer:sortings>
                    <quer:sorting ascending=`"true`">
                        <quer:field path=`"Level`" />
                    </quer:sorting>
                    <quer:sorting ascending=`"true`">
                        <quer:field path=`"Parent,Code`" />
                    </quer:sorting>
                </quer:sortings>
                <quer:sortingFilterings />
                <quer:groupings />
                <quer:joinings />
            </quer:query>
        </ExportQuery>
    </Content>
</Document>
------=_Part_3_7794965.1541143688509--";"ServiceContentType"="multipart/related; type=`"application/xop+xml`"; start=`"<rootpart@soapui.org>`"; start-info=`"text/xml`"; boundary=`"----=_Part_3_7794965.1541143688509`"";"ServiceMIMEVersion"="1.0";"ServiceMethod"="POST";"ServiceSOAPAction"="http://www.taleo.com/ws/integration/toolkit/2011/05/management/IntegrationManagementService#submitLargeDocument";"ServiceURI"="https://nok-ipaas-dev-we-apm-01.azure-api.net/OurTalentBulkAPI"}
# End section for TaleoServiceMetaData  for LocationOLF