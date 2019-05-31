<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="text" />
    <xsl:template match="text()">
        <xsl:value-of select="concat(normalize-space(.), '')" />
        <xsl:apply-templates />
    </xsl:template>
    <xsl:template match="/">
        <xsl:text>Raport: &#xA;</xsl:text>
        <xsl:apply-templates />
    </xsl:template>
    <xsl:template match="Autorzy">
        <xsl:text>&#xA;Autorzy z wydawnictwa </xsl:text>
        <xsl:value-of select="../Nazwa" />
        <xsl:text>:&#xA;</xsl:text>
        <xsl:apply-templates select="Autor" />
        <xsl:apply-templates select="Książki" />
    </xsl:template>
    <xsl:template match="Autor">
        <xsl:value-of select="Imię" />
        <xsl:text>  </xsl:text>
        <xsl:value-of select="Nazwisko" />
        <xsl:text> (</xsl:text>
        <xsl:value-of select="@Id" />
        <xsl:text>) &#xA;</xsl:text>
    </xsl:template>
    <xsl:template match="Książki">
        <xsl:text>&#xA;Książki wydane przez </xsl:text>
        <xsl:value-of select="../Nazwa" />
        <xsl:text>:&#xA;</xsl:text>
        <xsl:apply-templates select="Książka" />
    </xsl:template>
    <xsl:template match="Książka">
        <xsl:text>Tytuł: </xsl:text>
        <xsl:value-of select="Tytuł" />
        <xsl:text>&#xA;</xsl:text>
        <xsl:choose>
            <xsl:when test="../../Autorzy/Autor/@Id = @Autor">
                <xsl:text>Autor: </xsl:text>
                <xsl:value-of select="../../Autorzy/Autor/Name" />
                <xsl:text>&#xA;</xsl:text>
            </xsl:when>
        </xsl:choose>

    </xsl:template>
</xsl:stylesheet>