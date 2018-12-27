<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:urn="urn:sap-com:document:sap:soap:functions:mc-style">
            <soap:Header />
            <soap:Body>
                <urn:_-n42_-cqhaJob00001000>
                    <Data>
                        <xsl:for-each select="/*[local-name()='Document']/*[local-name()='Content']/*[local-name()='ExportXML']/*[local-name()='record']">
                            <item>
                                <xsl:for-each select="./*[local-name()='field']">
                                    <xsl:element name="{@name}">
                                        <xsl:value-of select="text()" />
                                    </xsl:element>
                                </xsl:for-each>
                            </item>
                        </xsl:for-each>
                    </Data>
                </urn:_-n42_-cqhaJob00001000>
            </soap:Body>
        </soap:Envelope>
    </xsl:template>
</xsl:stylesheet>