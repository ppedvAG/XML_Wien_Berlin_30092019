<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
			xmlns:yweather="http://xml.weather.yahoo.com/ns/rss/1.0"	>

  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <H1>
      Das Wetter für
      <xsl:value-of select="/rss/channel/yweather:location/@city"/>,
      <xsl:value-of select="/rss/channel/yweather:location/@country"/>
    </H1>

    <div style="font-size:30px;">
      <xsl:value-of select="/rss/channel/item/yweather:condition/@temp"/>
      °<xsl:value-of select="/rs/channel/yweather:units/@temperature"/>
    </div>

    Sonnenaufgang: <strong>
      <xsl:value-of select="/rss/channel/yweather:astronomy/@sunrise"/>
    </strong>
    <br/>
    Sonnenuntergang: <strong>
      <xsl:value-of select="/rss/channel/yweather:astronomy/@sunset"/>
    </strong>
    <hr/>
    <table border="1">
      <tr>
        <th>Tag</th>
        <th>Temp</th>
        <th>Wetter</th>
      </tr>
      <xsl:for-each select="/rss/channel/item/yweather:forecast">
        <tr>
          <td align="right">---
            <xsl:value-of select="@day"/>
            <xsl:value-of select="@date"/>
          </td>
          <td align="right">
            <xsl:value-of select="@low"/>-<xsl:value-of select="@high"/> °<xsl:value-of select="/rss/channel/item/yweather:units/@temperature"/>
          </td>
          <td align="right">
            <xsl:value-of select="@text"/>
          </td>
        </tr>
      </xsl:for-each>
    </table>

  </xsl:template>




  <xsl:template match="@* | node()">
    <!--<xsl:copy>-->
    <xsl:apply-templates select="@* | node()"/>
    <!--</xsl:copy>-->
  </xsl:template>

</xsl:stylesheet>

