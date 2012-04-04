<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="xd xsl"
    version="2.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Nov 10, 2011</xd:p>
            <xd:p><xd:b>Author:</xd:b> Terry Catapano</xd:p>
            <xd:p>Convert an EAD2002 RNG-valid or XSD-valid instance to HTML using a EAD (DTD) to HTML stylesheet (here eadcbs8.xsl)</xd:p>
        </xd:desc>
    </xd:doc>
    <!-- include EAD (DTD-valid) to HTML stylesheet [in this case eadcbs8.xsl] -->
    <xsl:include href="eadcbs8.xsl"/>
    <!-- create copy of input instance stripped of all namespaces -->
    <xsl:variable name="instance-ns-stripped">
        <xsl:apply-templates select="/" mode="strip-ns"/>
    </xsl:variable>
    <!-- match against input document root and process namespace stripped instance in parameter -->
    <xsl:template match="/">
        <!-- Remove comment to send $instance-ns-stripped to stderr for debugging
            <xsl:message select="$instance-ns-stripped"/>
         -->
        <xsl:for-each select="$instance-ns-stripped">
            <xsl:apply-templates/>
        </xsl:for-each>
    </xsl:template>
    <!-- Namespace stripping templates -->
    <xsl:template match="*" mode="strip-ns"> 
        <xsl:element name="{local-name()}" inherit-namespaces="no">
            <xsl:apply-templates select="@* | node()" mode="strip-ns"/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="@*|text()|comment()|processing-instruction()" mode="strip-ns">
        <xsl:copy inherit-namespaces="no" copy-namespaces="no">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="@xsi:schemaLocation" mode="strip-ns" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"/>
</xsl:stylesheet>
