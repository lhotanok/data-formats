<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   xmlns:fn="http://www.w3.org/2005/xpath-functions">
    <xsl:output method="text" encoding="UTF-8" />

    <xsl:variable name="xsd">http://www.w3.org/2001/XMLSchema#</xsl:variable>
    <xsl:variable name="ex">http://example.org/vocabulary/</xsl:variable>
    <xsl:variable name="exstation">https://example.org/resource/stations/</xsl:variable>

    <xsl:variable name="bus">Bus</xsl:variable>
    <xsl:variable name="tram">Tram</xsl:variable>
    <xsl:variable name="metro">Metro</xsl:variable>
    <xsl:variable name="train">Train</xsl:variable>
    <xsl:variable name="ferry">Ferry</xsl:variable>
    <xsl:variable name="funicular">Funicular</xsl:variable>

<xsl:template match="Stations">
@prefix geo: &lt;http://www.w3.org/2003/01/geo/wgs84_pos#&gt; .
@prefix xsd: &lt;http://www.w3.org/2001/XMLSchema#&gt; .
@prefix ex: &lt;http://example.org/vocabulary/&gt; .
@prefix exstation: &lt;https://example.org/resource/stations/&gt; .
@prefix extype: &lt;https://example.org/resource/transporttypes/&gt; .

extype:bus a ex:TransportType ;
    ex:transportTypeName "Bus"@en .

extype:tram a ex:TransportType ;
    ex:transportTypeName "Tram"@en .

extype:metro a ex:TransportType ;
    ex:transportTypeName "Metro"@en .

extype:train a ex:TransportType ;
    ex:transportTypeName "Train"@en .

extype:ferry a ex:TransportType ;
    ex:transportTypeName "Ferry"@en .

extype:funicular a ex:TransportType ;
    ex:transportTypeName "Funicular"@en .

<xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="Station">

        <xsl:variable name="stationId" select="stationId"/>
        <xsl:variable name="stationIRI" select="concat('exstation:station', format-number($stationId, '0000'))"/>

<xsl:value-of select="$stationIRI"/> a ex:Station ;
    ex:stationName &quot;<xsl:value-of select="name"/>&quot;@<xsl:value-of select="@xml:lang"/> ;
    geo:lat <xsl:value-of select="latitude"/> ;
    geo:long <xsl:value-of select="longitude"/> .

<xsl:apply-templates>
    <xsl:with-param name="stationIRI" select="$stationIRI"/>

</xsl:apply-templates>
</xsl:template>

<xsl:template match="transportType/name">
<xsl:param name="stationIRI"/>
<xsl:if test="text()=$bus"><xsl:value-of select="$stationIRI"/> ex:stationHasType extype:bus .
</xsl:if>
<xsl:if test="text()=$tram"><xsl:value-of select="$stationIRI"/> ex:stationHasType extype:tram .
</xsl:if>
<xsl:if test="text()=$metro"><xsl:value-of select="$stationIRI"/> ex:stationHasType extype:metro .
</xsl:if>
<xsl:if test="text()=$train"><xsl:value-of select="$stationIRI"/> ex:stationHasType extype:train .
</xsl:if>
<xsl:if test="text()=$ferry"><xsl:value-of select="$stationIRI"/> ex:stationHasType extype:ferry .
</xsl:if>
<xsl:if test="text()=$funicular"><xsl:value-of select="$stationIRI"/> ex:stationHasType extype:funicular .
</xsl:if>

</xsl:template>
<xsl:template match="text()"/>
</xsl:stylesheet>
