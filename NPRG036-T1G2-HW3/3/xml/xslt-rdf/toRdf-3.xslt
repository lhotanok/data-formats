<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:xs="http://www.w3.org/2001/XMLSchema"
xmlns:fn="http://www.w3.org/2005/xpath-functions">
<xsl:output method="text" encoding="UTF-8" />
<xsl:variable name="prefix">http://example.org/resource/</xsl:variable>

<xsl:variable name="bus">Bus</xsl:variable>
<xsl:variable name="tram">Tram</xsl:variable>
<xsl:variable name="metro">Metro</xsl:variable>
<xsl:variable name="train">Train</xsl:variable>
<xsl:variable name="ferry">Ferry</xsl:variable>
<xsl:variable name="funicular">Funicular</xsl:variable>

<xsl:template match="TrafficLines">
@prefix extrfcln: &lt;https://example.org/resource/trafficline/&gt; .
@prefix ex: &lt;https://example.org/vocabulary/&gt; .
@prefix extype: &lt;https://example.org/resource/transporttypes/&gt; .
@prefix exdep: &lt;https://example.org/resource/departures/&gt; .
@prefix extrfclnstn: &lt;https://example.org/resource/trafficlinestation/&gt; .
@prefix exdep: &lt;https://example.org/resource/departures/&gt; .

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
    <xsl:template match="TrafficLine">
    <xsl:variable name="TrafficLineId" select="trafficLineId"/>
    <xsl:variable name="TrafficLinePosition" select="fn:position() div 2"/>
    <xsl:variable name="TrafficLineIRI" select="concat('extrfcln:trafficline', format-number($TrafficLinePosition, '0000'))"/>
    <xsl:value-of select="$TrafficLineIRI"/> a ex:TrafficLine ;
    ex:trafficLineId <xsl:value-of select="$TrafficLineId"/> .

<xsl:apply-templates>
    <xsl:with-param name="TrafficLineIRI" select="$TrafficLineIRI"/>
    <xsl:with-param name="TrafficLineId" select="$TrafficLineId"/>
    <xsl:with-param name="TrafficLinePosition" select="$TrafficLinePosition"/>
</xsl:apply-templates>

</xsl:template>

<xsl:template match="TrafficLineStation">
<xsl:param name="TrafficLineIRI"/>
<xsl:param name="TrafficLineId"/>
<xsl:variable name="Order" select="order"/>
<xsl:variable name="MinutesToNext" select="minutesToNext"/>
<xsl:variable name="HasStationId" select="hasStationId" />
<xsl:variable name="TrafStationName" select="concat('extrfclnstn:trafficlinestation_', $TrafficLineId, '_', format-number(fn:position() div 2, '0000'))"/>

<xsl:value-of select="$TrafficLineIRI"/> ex:contains <xsl:value-of select="$TrafStationName"/> .
<xsl:value-of select="$TrafStationName"/> a ex:TrafficLineStation ;
    ex:order <xsl:value-of select="$Order"/> ;
    ex:minutesToNext <xsl:value-of select="$MinutesToNext"/> ;
    ex:trafficLineStationHasStation <xsl:value-of select="concat('exstation:station', format-number($HasStationId, '0000'))"/> .

<xsl:apply-templates/>
</xsl:template>

<xsl:template match="transportType/name">
<xsl:param name="TrafficLineIRI"/>
<xsl:if test="text()=$bus"><xsl:value-of select="$TrafficLineIRI"/> ex:trafficLineHasType extype:bus .
</xsl:if>
<xsl:if test="text()=$tram"><xsl:value-of select="$TrafficLineIRI"/> ex:trafficLineHasType extype:tram .
</xsl:if>
<xsl:if test="text()=$metro"><xsl:value-of select="$TrafficLineIRI"/> ex:trafficLineHasType extype:metro .
</xsl:if>
<xsl:if test="text()=$train"><xsl:value-of select="$TrafficLineIRI"/> ex:trafficLineHasType extype:train .
</xsl:if>
<xsl:if test="text()=$ferry"><xsl:value-of select="$TrafficLineIRI"/> ex:trafficLineHasType extype:ferry .
</xsl:if>
<xsl:if test="text()=$funicular"><xsl:value-of select="$TrafficLineIRI"/> ex:trafficLineHasType extype:funicular .
</xsl:if>

<xsl:apply-templates/>
</xsl:template>

<xsl:template match="Departures">
    <xsl:param name="TrafficLineIRI"/>
    <xsl:param name="TrafficLinePosition"/>
    <xsl:variable name="DepLineNumber" select="concat('exdep:depforline', format-number($TrafficLinePosition, '0000'))"/>
    <xsl:variable name="BussinessDayList" select="businessDay"/>
    <xsl:variable name="SaturdayList" select="saturday"/>
    <xsl:variable name="SundayList" select="sunday"/>
    <xsl:variable name="HolidaysList" select="holidays"/>
    <xsl:value-of select="$TrafficLineIRI"/> ex:follows <xsl:value-of select="$DepLineNumber"/> .
    <xsl:value-of select="$DepLineNumber"/> a ex:Departures ;
    <xsl:for-each select="$BussinessDayList/tokenize(string(.), ' ')">
    <xsl:if test="normalize-space(.) != ''">    ex:businessDay "<xsl:value-of select="normalize-space(.)" separator=" "/>"^^xsd:time ;
    </xsl:if>
    </xsl:for-each>
    <xsl:for-each select="$SaturdayList/tokenize(string(.), ' ')">
    <xsl:if test="normalize-space(.) != ''">    ex:saturday "<xsl:value-of select="normalize-space(.)" separator=" "/>"^^xsd:time ;
    </xsl:if>
    </xsl:for-each>
    <xsl:for-each select="$SundayList/tokenize(string(.), ' ')">
    <xsl:if test="normalize-space(.) != ''">    ex:sunday "<xsl:value-of select="normalize-space(.)" separator=" "/>"^^xsd:time ;
    </xsl:if>
    </xsl:for-each>
    <xsl:for-each select="$HolidaysList/tokenize(string(.), ' ')">
    <xsl:if test="normalize-space(.) != ''">    ex:holidays "<xsl:value-of select="normalize-space(.)" separator=" "/>"^^xsd:date ;
    </xsl:if>
    </xsl:for-each>
<xsl:apply-templates/>
</xsl:template>

<xsl:template match="text()"/>
</xsl:stylesheet>
