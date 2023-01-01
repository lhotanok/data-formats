<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   xmlns:fn="http://www.w3.org/2005/xpath-functions">
    <xsl:output method="text" encoding="UTF-8" />

    <xsl:variable name="foaf">http://xmlns.com/foaf/0.1/</xsl:variable>
    <xsl:variable name="xsd">http://www.w3.org/2001/XMLSchema#</xsl:variable>
    <xsl:variable name="ex">http://example.org/vocabulary/</xsl:variable>
    <xsl:variable name="expas">https://example.org/resource/passengers/</xsl:variable>
    <xsl:variable name="exstation">https://example.org/resource/stations/</xsl:variable>
    <xsl:variable name="extick">https://example.org/resource/tickets/</xsl:variable>

<xsl:template match="Passengers">
@prefix foaf: &lt;http://xmlns.com/foaf/0.1/&gt; .
@prefix xsd: &lt;http://www.w3.org/2001/XMLSchema#&gt; .
@prefix ex: &lt;http://example.org/vocabulary/&gt; .
@prefix expas: &lt;https://example.org/resource/passengers/&gt; .
@prefix exstation: &lt;https://example.org/resource/stations/&gt; .
@prefix extick: &lt;https://example.org/resource/tickets/&gt; .

<xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="Passenger">
    <xsl:variable name="passengerId" select="format-number(fn:position() div 2, '0000')"/>
    <xsl:variable name="passengerIRI" select="concat('expas:expas', $passengerId)"/>
<xsl:value-of select="$passengerIRI"/> a ex:Passenger ;
    foaf:givenName &quot;<xsl:value-of select="firstName"/>&quot;@<xsl:value-of select="@xml:lang"/> ;
    foaf:familyName &quot;<xsl:value-of select="surname"/>&quot;@<xsl:value-of select="@xml:lang"/> .

<xsl:apply-templates>
    <xsl:with-param name="passengerIRI" select="$passengerIRI"/>
</xsl:apply-templates>
    </xsl:template>
    <xsl:template match="DestinationTicket">
    <xsl:param name="passengerIRI"/>
    <xsl:variable name="ticketId" select="ticketId"/>
    <xsl:variable name="ticketIRI" select="concat('extick:ticket', format-number($ticketId, '0000'))"/>
    <xsl:variable name="fromStationId" select="fromStationId"/>
    <xsl:variable name="toStationId" select="toStationId"/>

<xsl:value-of select="$passengerIRI"/> ex:owns <xsl:value-of select="$ticketIRI"/> .
<xsl:value-of select="$ticketIRI"/> a ex:DestinationTicket ;
    ex:ticketId <xsl:value-of select="$ticketId"/> ;
    ex:validFrom &quot;<xsl:value-of select="validFrom"/>&quot;^^xsd:dateTime ;
    ex:validTo &quot;<xsl:value-of select="validTo"/>&quot;^^xsd:dateTime ;
    ex:from <xsl:value-of select="concat('exstation:station', format-number($fromStationId, '0000'))"/> ;
    ex:to <xsl:value-of select="concat('exstation:station', format-number($toStationId, '0000'))"/> .

<xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="TimeTicket">
    <xsl:param name="passengerIRI"/>
    <xsl:variable name="ticketId" select="ticketId"/>
    <xsl:variable name="ticketIRI" select="concat('extick:ticket', format-number($ticketId, '0000'))"/>

<xsl:value-of select="$passengerIRI"/> ex:owns <xsl:value-of select="$ticketIRI"/> .
<xsl:value-of select="$ticketIRI"/> a ex:TimeTicket ;
    ex:ticketId <xsl:value-of select="$ticketId"/> ;
    ex:validFrom &quot;<xsl:value-of select="validFrom"/>&quot;^^xsd:dateTime ;
    ex:validTo &quot;<xsl:value-of select="validTo"/>&quot;^^xsd:dateTime .

<xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="text()"/>
</xsl:stylesheet>