<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:svg="http://www.w3.org/2000/svg" version="1.0">
<xsl:output method="xml" media-type="image/svg"
    encoding="utf-8" doctype-public="-//W3C//DTD SVG 1.1//EN"
    doctype-system="http://www.w3.org/TR/2001/REC-SVG-20010904/DTD/svg10.dtd" />
    <xsl:template match="/">
        <svg:svg width="700" height="400" font-family="Segoe UI">
            <svg:title>RAPORT</svg:title>
            <svg:rect x="0" y="0" width="700" height="400" fill="black" />
            <svg:text x="350" y="40" fill="white" font-weight="bold" text-anchor="middle" font-size="20px">
                Średnia cena książek w wydawnictwach
            </svg:text>
            
            <svg:rect x="50" y="60" width="600" height="250" fill="white" />
            <svg:text x="55" y="75" font-size="12px" fill="black">Średnia cena [zł]</svg:text>
            <svg:line x1="70" y1="80" x2="70" y2="290" stroke="black" stroke-width="2px" />
            <svg:line x1="70" y1="290" x2="640" y2="290" stroke="black" stroke-width="2px" />


            <svg:text x="130" y="350" font-size="16px" fill="green">Altenberg</svg:text>
            <svg:text x="280" y="350" font-size="16px" fill="red">Penguin Books</svg:text>
            <svg:text x="450" y="350" font-size="16px" fill="blue">Zielona Sowa</svg:text>

            <xsl:variable name="maxPrice">
                <xsl:for-each select="/Podsumowanie/Wydawnictwa/Wydawnictwo">
                    <xsl:sort select="ŚredniaCena" order="descending" />
                    <xsl:if test="position() = 1">
                        <xsl:value-of select="ŚredniaCena" />
                    </xsl:if>
                </xsl:for-each>
            </xsl:variable>
        
        <xsl:variable name="maxHeight">210</xsl:variable>
        <xsl:variable name="firstPrice">
            <xsl:for-each select="/Podsumowanie/Wydawnictwa/Wydawnictwo">
                <xsl:if test="position()=1">
                    <xsl:value-of select="ŚredniaCena" />
                </xsl:if>
            </xsl:for-each>
        </xsl:variable>
        <xsl:variable name="firstHeight">
            <xsl:value-of select="$firstPrice * $maxHeight div $maxPrice" />
        </xsl:variable>

        <xsl:element name="svg:rect">
            <xsl:attribute name="fill">green</xsl:attribute>
            <xsl:attribute name="y"><xsl:value-of select="80 + ($maxHeight - $firstHeight)"/></xsl:attribute>
            <xsl:attribute name="x">150</xsl:attribute>
            <xsl:attribute name="width">50px</xsl:attribute>
            <svg:animate attributeName="height" from="0" to="{$firstHeight}" 
                dur="2s" fill="freeze"/>
        </xsl:element>
        <svg:text x="158" y="{75 + ($maxHeight - $firstHeight)}" fill="green"><xsl:value-of select="$firstPrice" /></svg:text>


        <xsl:variable name="secondPrice">
            <xsl:for-each select="/Podsumowanie/Wydawnictwa/Wydawnictwo">
                <xsl:if test="position()=2">
                    <xsl:value-of select="ŚredniaCena" />
                </xsl:if>
            </xsl:for-each>
        </xsl:variable>
        <xsl:variable name="secondHeight">
            <xsl:value-of select="$secondPrice * $maxHeight div $maxPrice" />
        </xsl:variable>

        <xsl:element name="svg:rect">
            <xsl:attribute name="fill">red</xsl:attribute>
            <xsl:attribute name="y">
                <xsl:value-of select="80 + ($maxHeight - $secondHeight)"/>
            </xsl:attribute>
            <xsl:attribute name="x">300</xsl:attribute>
            <xsl:attribute name="width">50px</xsl:attribute>
            <svg:animate attributeName="height" from="0" to="{$secondHeight}" dur="2s" fill="freeze"/>
        </xsl:element>
        <svg:text x="308" y="{75 + ($maxHeight - $secondHeight)}" fill="red"><xsl:value-of select="$secondPrice" /></svg:text>

        <xsl:variable name="thirdPrice">
            <xsl:for-each select="/Podsumowanie/Wydawnictwa/Wydawnictwo">
                <xsl:if test="position()=3">
                    <xsl:value-of select="ŚredniaCena" />
                </xsl:if>
            </xsl:for-each>
        </xsl:variable>
        <xsl:variable name="thirdHeight">
            <xsl:value-of select="$thirdPrice * $maxHeight div $maxPrice" />
        </xsl:variable>

        <xsl:element name="svg:rect">
            <xsl:attribute name="fill">blue</xsl:attribute>
            <xsl:attribute name="y">
                <xsl:value-of select="80 + ($maxHeight - $thirdHeight)"/>
            </xsl:attribute>
            <xsl:attribute name="x">470</xsl:attribute>
            <xsl:attribute name="width">50px</xsl:attribute>
            <svg:animate attributeName="height" from="0" to="{$thirdHeight}" dur="2s" fill="freeze"/>
        </xsl:element>
        <svg:text x="470" y="{75 + ($maxHeight - $thirdHeight)}" fill="blue">
            <xsl:value-of select="$thirdPrice" />
        </svg:text>
        </svg:svg>
    </xsl:template>
    
</xsl:stylesheet>