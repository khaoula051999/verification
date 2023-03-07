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

				<fo:simple-page-master master-name="pageTitle" page-height="29.7cm" page-width="21cm" margin-top="1.5cm" margin-bottom="2cm" margin-left="2.5cm" margin-right="2.5cm">

					<fo:region-body margin-top="1.5cm" margin-bottom="0.5cm"> </fo:region-body>
					<fo:region-before extent="1.5m" />

				</fo:simple-page-master>
			</fo:layout-master-set>

			<fo:page-sequence master-reference="pageTitle">
				    
				<fo:static-content flow-name="xsl-region-before"> 
				    <fo:block text-align="left"  font-size="15pt" padding-bottom="10pt">Regularite des lignes de TGV - khaoula abouelfadl </fo:block>
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