<?xml version="1.0" encoding="UTF-8"?>
    <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        exclude-result-prefixes="xsl"
        version="2.0">
        <xd:doc scope="stylesheet">
            <xd:desc>
                <xd:p><xd:b>Created on:</xd:b> April 3, 2012</xd:p>
                <xd:p><xd:b>Author:</xd:b> Terry Catapano</xd:p>
                <xd:p>Convert an EAD2002 RNG-valid or XSD-valid instance to one in no namespace</xd:p>
            </xd:desc>
        </xd:doc>
        <xsl:template match="/">
            <xsl:apply-templates/>
        </xsl:template>
        <!-- Namespace stripping templates -->
        <xsl:template match="*" > 
            <xsl:element name="{local-name()}" inherit-namespaces="no">
                <xsl:apply-templates select="@* | node()"/>
            </xsl:element>
        </xsl:template>
        <xsl:template match="@*|text()|comment()|processing-instruction()">
            <xsl:copy inherit-namespaces="no" copy-namespaces="no">
                <xsl:apply-templates select="@*|node()"/>
            </xsl:copy>
        </xsl:template>
        <xsl:template match="@xsi:schemaLocation" mode="strip-ns" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"/>
    </xsl:stylesheet>

