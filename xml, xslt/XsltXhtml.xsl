<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html" version="1.0" encoding="utf-8" 
doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" />

<xsl:template match="/">
<html>
<body>

<h2>Wydawnictwa:</h2>
<ul>
    <xsl:for-each select="/Podsumowanie/Wydawnictwa/Wydawnictwo">
        <li>
            <xsl:value-of select="Nazwa" />
            <ul>
                <li>
                    <xsl:text>Liczba książek: </xsl:text>
                    <xsl:value-of select="LiczbaKsiążek" />
                </li>
                <li>
                    <xsl:text>Średnia cena książki: </xsl:text>
                    <xsl:value-of select="ŚredniaCena" />
                </li>
            </ul>
        </li>
    </xsl:for-each>
</ul>
<h2>Podsumowanie: </h2>
<ul>
    <li>
        <h3>Liczba wydawnictw: <xsl:value-of select="/Podsumowanie/LiczbaWydawnictw" /></h3>
    </li>
    <li>
        <h3>Liczba autorów: <xsl:value-of select="/Podsumowanie/LiczbaAutorów" /></h3>
    </li>
    <li>
        <h3>Liczba książek: <xsl:value-of select="/Podsumowanie/LiczbaKsiążekOgółem" /></h3>
    </li>
    <li>
        <h4>Najdroższa książka: <xsl:value-of select="/Podsumowanie/NajdroższaKsiążka" /></h4>
    </li>
    <li>
        <h4>Najtańsza książka: <xsl:value-of select="/Podsumowanie/NajtańszaKsiążka" /></h4>
    </li>
    <li>
        <h4>Najstarsza książka: <xsl:value-of select="/Podsumowanie/NajstarszaKsiążka" /></h4>
    </li>
</ul>
</body>
</html>
</xsl:template>
</xsl:stylesheet>