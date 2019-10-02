<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" indent="yes"/>


  <xsl:template match="/">
    
    
    <html>
      <head>
        <title>Mein Tiere</title>
      </head>
      <body>
        <h1>Meine Tiere</h1>
        <xsl:variable name="peter">Ist Cool</xsl:variable>
        
        <xsl:call-template name="ZeigeBier"/>
        <xsl:apply-templates/>
        <xsl:value-of select="sum(/Tiere/Tier/AnzahlBeine)"/>
        <xsl:call-template name="ZeigeBier"/>

        <xsl:for-each select="/Tiere/Tier">
          <xsl:sort select="Bezeichnung" order="ascending"/>
          <xsl:value-of select="Bezeichnung"/>,
        </xsl:for-each>
        <xsl:value-of select="$peter"/>
        <hr/>
        ©2019
      </body>
    </html>
  </xsl:template>

  <xsl:template name ="ZeigeBier">
    🍺
  </xsl:template>


  <xsl:template match="/Tiere">
    <table border="1">
      <tr>
        <th>#</th>
        <th>Bezeichnung</th>
        <th>Zone</th>
        <th>Beine</th>
        <th>Gewicht</th>
      </tr>
      <xsl:apply-templates/>
    </table>
  </xsl:template>


  <xsl:template match="/Tiere/Tier">
    <tr>
      <td>
        <xsl:value-of select ="position()"/>
      </td>
      <td>
        <xsl:value-of select ="Bezeichnung"/>
      </td>
      <td>
        <xsl:value-of select ="Wohnort/Zone"/>
      </td>
      <td>

        <xsl:attribute name="bgcolor">
          <xsl:choose>
            <xsl:when test ="AnzahlBeine = 2">
              lightgreen
            </xsl:when>
            <xsl:when test ="AnzahlBeine = 4">
              lightblue
            </xsl:when>
            <xsl:otherwise>
              red
            </xsl:otherwise>
          </xsl:choose>
        </xsl:attribute>
        <xsl:value-of select ="AnzahlBeine"/>
      </td>
      <td>
        <xsl:apply-templates/>
      </td>
    </tr>
  </xsl:template>

  <xsl:template match="/Tiere/Tier/Gewicht">
    <xsl:if test="@Einheit ='g'">
      <xsl:attribute name="bgcolor">
        red
      </xsl:attribute>
    </xsl:if>

    <xsl:value-of select="."/>
    &#160;
    <xsl:value-of select="@Einheit"/>


    <!--<xsl:text> </xsl:text>-->
    <!--<xsl:value-of select="' '"/>-->
  </xsl:template>

  <xsl:template match="@* | node()">
    <!--<xsl:copy>
      <xsl:apply-templates select="@* | node()"/>
    </xsl:copy>-->
  </xsl:template>


</xsl:stylesheet>
