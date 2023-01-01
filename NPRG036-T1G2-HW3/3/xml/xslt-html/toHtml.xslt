<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    <xsl:template match="Stations">
        <html>
            <head>
                <title xml:lang='en'>
                    Public Transport Stations
                </title>
            </head>
            <body>
                <h1 xml:lang='en'>
                    Public Transport Stations
                </h1>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="Station[@xml:lang='cs']">
        <h3>
            <xsl:value-of select="name"/>
        </h3>
        <p>Station ID: <xsl:value-of select="descendant::stationId"/></p>
        <p>Number of transport types: <xsl:value-of select="count(descendant::transportType)"/></p>
        <h4>Coordinates</h4>
        <ul>
            <li>Latitude: <xsl:value-of select="descendant::latitude"/></li>
            <li>Longitude: <xsl:value-of select="descendant::longitude"/></li>
          </ul>
    </xsl:template>

    <xsl:template match="text()">
        <xsl:apply-templates/>
    </xsl:template>
</xsl:stylesheet>
