<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" version="1.0" encoding="UTF-8"/>
<xsl:template match="/">
<html>
<body>
<h2>Autorzy:</h2>
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

<h2>Książki:</h2>
<ul>
    <xsl:for-each select="/Wydawnictwa/Wydawnictwo/Książki/Książka">
        <xsl:sort select="Tytuł" />
        <li>
            <xsl:value-of select="Tytuł" />
        </li>
    </xsl:for-each>
</ul>

<h2>Wydawnictwa:</h2>
<ul>
    <xsl:for-each select="/Wydawnictwa/Wydawnictwo">
        <xsl:sort select="Nazwa" />
        <li>
            <xsl:value-of select="Nazwa" />
            <ul>
                <li>
                    <xsl:text>Liczba książek: </xsl:text>
                    <xsl:value-of select="count(Książki/Książka)" />
                </li>
                <li>
                    <xsl:text>Średnia cena książki: </xsl:text>
                    <xsl:value-of select="avg(Książki/Książka/Cena)" />
                </li>
            </ul>
        </li>
    </xsl:for-each>
</ul>

<h3>Liczba wydawnictw: <xsl:value-of select="count(//Wydawnictwo)" /></h3>
<h3>Liczba autorów: <xsl:value-of select="count(//Autor)" /></h3>
<h3>Liczba książek: <xsl:value-of select="count(//Książka)" /></h3>
<h4>Najdroższa książka: <xsl:value-of select="max(//Książka/Cena)" /></h4>
<h4>Najstarsza książka: <xsl:value-of select="min(//Książka/DataWydania)" /></h4>
</body>
</html>
</xsl:template>
</xsl:stylesheet>