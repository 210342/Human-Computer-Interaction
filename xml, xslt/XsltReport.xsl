<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" standalone="yes" />
<xsl:template match="/">
<Podsumowanie>
    <LiczbaWydawnictw>
        <xsl:value-of select="count(//Wydawnictwo)" />
    </LiczbaWydawnictw>
    <LiczbaAutorów>
        <xsl:value-of select="count(//Autor)" />
    </LiczbaAutorów>
    <LiczbaKsiążekOgółem>
        <xsl:value-of select="count(//Książka)" />
    </LiczbaKsiążekOgółem>

    <Wydawnictwa>
        <xsl:for-each select="/Wydawnictwa/Wydawnictwo">
            <xsl:sort select="Nazwa" />
            <Wydawnictwo>
                <Nazwa>
                    <xsl:value-of select="Nazwa" />
                </Nazwa>
                <LiczbaKsiążek>
                    <xsl:value-of select="count(Książki/Książka)" />
                </LiczbaKsiążek>

                <ŚredniaCena>
                    <xsl:value-of select="sum(Książki/Książka/Cena) div count(Książki/Książka/Cena)" />
                </ŚredniaCena>
            </Wydawnictwo>
        </xsl:for-each>
    </Wydawnictwa>

    <xsl:variable name="mostExpensiveBook">
        <xsl:for-each select="//Książka">
            <xsl:sort select="Cena" order="descending" />
            <xsl:if test="position() = 1">
                <xsl:value-of select="Tytuł" />
            </xsl:if>
        </xsl:for-each>
    </xsl:variable>
    <xsl:variable name="cheapestBook">
        <xsl:for-each select="//Książka">
            <xsl:sort select="Cena" order="ascending" />
            <xsl:if test="position() = 1">
                <xsl:value-of select="Tytuł" />
            </xsl:if>
        </xsl:for-each>
    </xsl:variable>
    <xsl:variable name="oldestBook">
        <xsl:for-each select="//Książka">
            <xsl:sort select="DataWydania" order="ascending" />
            <xsl:if test="position() = 1">
                <xsl:value-of select="Tytuł" />
            </xsl:if>
        </xsl:for-each>
    </xsl:variable>
    <NajtańszaKsiążka><xsl:value-of select="$cheapestBook" /></NajtańszaKsiążka>
    <NajdroższaKsiążka><xsl:value-of select="$mostExpensiveBook" /></NajdroższaKsiążka>
    <NajstarszaKsiążka><xsl:value-of select="$oldestBook" /></NajstarszaKsiążka>
</Podsumowanie>
</xsl:template>
</xsl:stylesheet>