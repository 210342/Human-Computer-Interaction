<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format">

    <xsl:output method="xml" encoding="utf-8" />
    <xsl:template match="/">
        <fo:root>
            <fo:layout-master-set>
                <fo:simple-page-master master-name="header" page-height="297mm" page-width="210mm" margin-top="30"
                                       margin-bottom="30" margin-left="30" margin-right="30">
                    <fo:region-body />
                    <fo:region-before margin-bottom="30" />
                    <fo:region-after margin-top="10"/>
                </fo:simple-page-master>
            </fo:layout-master-set>
            <fo:page-sequence master-reference="header">
                <fo:static-content flow-name="xsl-region-before">
                    <fo:block text-align="center" font-family="Segoe UI" font-size="40px">
                        <xsl:text>RAPORT</xsl:text>
                    </fo:block>
                </fo:static-content>
                <fo:static-content flow-name="xsl-region-after">
                    <fo:block text-align="right" font-family="Segoe UI" font-size="16px">
                        <fo:page-number/>
                    </fo:block>
                </fo:static-content>
                <fo:flow flow-name="xsl-region-body">
                    <xsl:apply-templates/>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>


    <xsl:template match="Wydawnictwo">
        <fo:block font-family="Times New Roman">
            <xsl:apply-templates select="Autorzy" />
        </fo:block>
        <fo:block font-family="Times New Roman">
            <xsl:apply-templates select="Książki" />
        </fo:block>
    </xsl:template>
    <xsl:template match="Autorzy">
        <fo:block font-size="22px" text-align="center" margin-top="20" margin-bottom="5" padding-top="20">
            <xsl:text>&#xA;Autorzy z wydawnictwa </xsl:text>
            <fo:inline font-weight="bold">
                <xsl:value-of select="../Nazwa" />
            </fo:inline>
            <xsl:text>:&#xA;</xsl:text>
        </fo:block>
        <fo:block font-size="16px" text-align="left">
            <xsl:apply-templates select="Autor" />
        </fo:block>
        <fo:block font-size="16px" text-align="left">
            <xsl:apply-templates select="Książki" />
        </fo:block>
    </xsl:template>

    <xsl:template match="Autor">
        <fo:block font-size="16px" text-align="left" >
            <fo:block>
                <fo:block margin-left="5mm">
                    <xsl:value-of select="Imię"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="Nazwisko"/>
                    <xsl:text> (</xsl:text>
                    <xsl:value-of select="@Id"/>
                    <xsl:text>) </xsl:text>
                </fo:block>
            </fo:block>
        </fo:block>
    </xsl:template>

    <xsl:template match="Książki">
        <fo:block font-size="18px" text-align="center" margin-top="15" margin-bottom="5">
            <xsl:text>&#xA;Książki wydane przez </xsl:text>
            <xsl:value-of select="../Nazwa" />
            <xsl:text>:&#xA;</xsl:text>
        </fo:block>
        <fo:block>
            <xsl:apply-templates select="Książka" />
        </fo:block>
    </xsl:template>

    <xsl:template match="Książka">
        <fo:block>
            <xsl:text>Tytuł: </xsl:text>
            <xsl:value-of select="Tytuł" />
            <fo:block />
            <xsl:variable name="autor" select="@Autor" />
            <xsl:if test="../../Autorzy/Autor/@Id = $autor">
                <xsl:text>Autor: </xsl:text>
                <xsl:value-of select="../../Autorzy/Autor/Imię" />
                <xsl:text> </xsl:text>
                <xsl:value-of select="../../Autorzy/Autor/Nazwisko" />
                <xsl:text>&#xA;&#xA;</xsl:text>
            </xsl:if>
        </fo:block>
    </xsl:template>


</xsl:stylesheet>