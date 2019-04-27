<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
<html>
<body>
<ul>
    <xsl:for-each select="/Wydawnictwa/Wydawnictwo/Autorzy/Autor">
        <xsl:sort select="Nazwisko" />
        <li>
            <xsl:value-of select="@Id" /> <xsl:text>: </xsl:text>
            <xsl:value-of select="Nazwisko" /> <xsl:text> </xsl:text>
            <xsl:value-of select="Imię" />
            <ul> 
                <li>
                    <xsl:text>    Wydawnictwo: </xsl:text>
                    <xsl:value-of select="../../Nazwa" />
                </li>
            </ul>
        </li>
    </xsl:for-each>
</ul>

<ul>
    <xsl:for-each select="/Wydawnictwa/Wydawnictwo/Książki/Książka">
        <xsl:sort select="Tytuł" />
        <li>
            <xsl:value-of select="Tytuł" />
        </li>
    </xsl:for-each>
</ul>

<h3>Liczba wydawnictw: <xsl:value-of select="count(//Wydawnictwo)" /></h3>
<h3>Liczba autorów: <xsl:value-of select="count(//Autor)" /></h3>
<h3>Liczba książek: <xsl:value-of select="count(//Książka)" /></h3>
</body>
</html>
</xsl:template>
</xsl:stylesheet>