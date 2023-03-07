<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo ="http://www.w3.org/1999/XSL/Format">

    <xsl:output 
        method="xml"
        encoding="UTF-8"
        indent="yes" >
    </xsl:output>

	<xsl:template match="/">

		<fo:root>

			<fo:layout-master-set>
                <fo:simple-page-master master-name="premierePage" page-height="29.7cm" page-width="21cm" margin-top="5cm" margin-bottom="7cm" margin-left="2.5cm" margin-right="2.5cm">
					<fo:region-body margin-top="1.5cm" margin-bottom="0.5cm"> </fo:region-body>
				</fo:simple-page-master>
				<fo:simple-page-master master-name="pageTitle" page-height="29.7cm" page-width="21cm" margin-top="1.5cm" margin-bottom="2cm" margin-left="2.5cm" margin-right="2.5cm">

					<fo:region-body margin-top="1.5cm" margin-bottom="0.5cm"> </fo:region-body>
					<fo:region-before extent="1.5m" />
					<fo:region-after extent="0.5cm" />

				</fo:simple-page-master>
			</fo:layout-master-set>

            <fo:page-sequence master-reference="premierePage">
				<fo:flow flow-name="xsl-region-body" vertical-align="middle">
					<fo:block text-align="center" font-size="22pt" font-weight="bold" padding-top="20pt" border-top="0.4mm #4c4c4c solid" padding-bottom="20pt"> Régularité mensuelle des TGVs</fo:block>
					<fo:block text-align="center" font-size="22pt" padding-bottom="22pt" border-bottom="0.2mm #4c4c4c solid">MOD 8.4 - BE3 - ECL 2022</fo:block>
                    <fo:block text-align="center" font-size="16pt" padding-top="64pt" padding-bottom="16pt">Khaoula Abouelfadl</fo:block>
				</fo:flow>

			</fo:page-sequence>
			<fo:page-sequence master-reference="pageTitle">
				    
				<fo:static-content flow-name="xsl-region-before"> 
				    <fo:block text-align="left" color="#4c4c4c" font-size="10pt" padding-bottom="10pt" border-bottom="0.2mm #4c4c4c solid">Regularite des lignes de TGV - Abouelfadl khaoula</fo:block>
				</fo:static-content>

				<fo:static-content flow-name="xsl-region-after" vertical-align="top"> 
				    <fo:block width="3cm" text-align="right" color="#4c4c4c" font-size="10pt">   <fo:page-number/>  </fo:block>
				</fo:static-content>

				<fo:flow flow-name="xsl-region-body">
                  <xsl:for-each select="//axe">
                    <fo:list-block font-size="12pt" text-align="start">
                       <fo:list-item>
                        <fo:list-item-label>
                          <fo:block>-</fo:block>
                        </fo:list-item-label>
                        <fo:list-item-body margin-left="0.5cm">
                          <fo:block> Axe <xsl:value-of select="@nom" /></fo:block>
                        </fo:list-item-body>
                       </fo:list-item>
                    </fo:list-block>
                  </xsl:for-each>
				</fo:flow>

			</fo:page-sequence>


		</fo:root>
	</xsl:template>

</xsl:stylesheet>