<?xml version="1.0" encoding="ISO-8859-1"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo ="http://www.w3.org/1999/XSL/Format">

    <xsl:output 
        method="xml"
        encoding="UTF-8"
        indent="yes" >
    </xsl:output>

	<xsl:template match="/">

		<fo:root>

			<fo:layout-master-set>

				<fo:simple-page-master master-name="A4" page-height="29.7cm" page-width="21cm" margin-top="1.5cm" margin-bottom="2cm" margin-left="2.5cm" margin-right="2.5cm">

					<fo:region-body margin-top="1.5cm" margin-bottom="0.5cm"> </fo:region-body>
					<fo:region-before extent="1.5m" />
					<fo:region-after extent="0.5cm" />

				</fo:simple-page-master>
			</fo:layout-master-set>

			<fo:page-sequence master-reference="A4">
				    
				<fo:static-content flow-name="xsl-region-before"> <!-- Contenu de la tête de page -->
				    <fo:block text-align="left" color="#4c4c4c" font-size="10pt" padding-bottom="10pt" border-bottom="0.2mm #4c4c4c solid">Regularite des lignes de TGV - khaoula abouelfadl </fo:block>
				</fo:static-content>

				<fo:static-content flow-name="xsl-region-after" vertical-align="top"> <!-- pied de page -->
				    <fo:block width="3cm" text-align="right" color="#4c4c4c" font-size="10pt"> -  <fo:page-number/> - </fo:block>
				</fo:static-content>

				<fo:flow flow-name="xsl-region-body">

					<xsl:for-each select="//axe">
		           		<fo:block font-size="12pt" text-align="start" margin-left="0.5cm" font-weight="bold" padding-after="12pt"> &#x2022; Axe <xsl:value-of select="@nom" /> </fo:block>
		           	</xsl:for-each>

				</fo:flow>

			</fo:page-sequence>


		</fo:root>
	</xsl:template>

</xsl:stylesheet>