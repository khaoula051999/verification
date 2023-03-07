<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo ="http://www.w3.org/1999/XSL/Format" >


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
                <fo:simple-page-master master-name="sommairePage" page-height="29.7cm" page-width="21cm" margin-top="5cm" margin-bottom="7cm" margin-left="2.5cm" margin-right="2.5cm">
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
					<fo:block page-break-after="always" text-align="center" space-before="2cm">
						<fo:external-graphic content-width="10%" content-height="15%" src="url(train-svgrepo-com.svg)"/>
					</fo:block> 
				</fo:flow>

			</fo:page-sequence>

            <fo:page-sequence master-reference="sommairePage">
				    
				<fo:flow flow-name="xsl-region-body">
                  <fo:block break-before='page'/>
                    <fo:block text-align="left" color="#4c4c4c" font-size="10pt" padding-bottom="10pt" border-bottom="0.2mm #4c4c4c solid">Sommaire</fo:block>
					<xsl:for-each select="//axe">
                      <fo:block margin-top="10pt" text-align-last="justify">
                       <fo:basic-link internal-destination="{generate-id(.)}">
                             Axe  <xsl:value-of select="@nom" />
                             <xsl:text> </xsl:text>
                         <fo:leader leader-pattern="dots"/>
                         <fo:page-number-citation ref-id="{generate-id(.)}"/>
                       </fo:basic-link>
                     </fo:block>
                   </xsl:for-each>
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
				 <xsl:for-each select="//axe" >
		           		<fo:block id="{generate-id(.)}" font-size="14pt" text-align="start" margin-left="0.5cm" font-weight="bold" padding-after="24pt" padding-before="24pt"> &#x2022; Axe <xsl:value-of select="@nom" /></fo:block>

		           	<fo:table text-align="center" border="0.3mm solid #000000">
		           		<fo:table-body>   			
		           			<fo:table-row>
		           				<fo:table-cell border-bottom="0.3mm solid #000000" border-right="0.3mm solid #000000"><fo:block font-size="12pt" font-weight="bold" text-align="left" padding-left="0.25cm">Gare Départ</fo:block></fo:table-cell>
		           				<fo:table-cell border-bottom="0.3mm solid #000000" border-right="0.3mm solid #000000"><fo:block font-size="12pt" font-weight="bold" text-align="left" padding-left="0.25cm">Gare Arrivée</fo:block></fo:table-cell>
		           				<fo:table-cell border-bottom="0.3mm solid #000000" border-left="0.3mm solid #000000"><fo:block font-size="12pt" font-weight="bold" text-align="left" padding-left="0.25cm">Régularité moyenne</fo:block></fo:table-cell>
		           			</fo:table-row>

			           		<xsl:for-each select="gare-depart">
			           			
			           			<xsl:variable name="depart"><xsl:value-of select="@nom" /></xsl:variable>
			           				<xsl:for-each select="gare-arrivee">
			           					<xsl:variable name="arrivee"><xsl:value-of select="@nom" /></xsl:variable>
			           					<xsl:variable name="somme"><xsl:value-of select='sum(mesure/@regularite)'/></xsl:variable>
			           					<xsl:variable name="compte"><xsl:value-of select="count(mesure)"/></xsl:variable>
			           					<xsl:variable name="intermediaire"><xsl:value-of select="$somme div $compte"/></xsl:variable>
			           					<xsl:variable name="stat"><xsl:value-of select='format-number($intermediaire, "#.00")'/></xsl:variable>
			           					<fo:table-row>
			           						<fo:table-cell border-bottom="0.2mm solid #8b8b8b" border-right="0.3mm solid #8b8b8b"><fo:block font-size="10pt" text-align="center"><xsl:value-of select="$depart"/></fo:block></fo:table-cell>
			           						<fo:table-cell border-bottom="0.2mm solid #8b8b8b" border-right="0.3mm solid #8b8b8b"><fo:block font-size="10pt" text-align="center"><xsl:value-of select="$arrivee"/></fo:block></fo:table-cell>
			           						<fo:table-cell border-bottom="0.2mm solid #8b8b8b" border-left="0.3mm solid #8b8b8b"><fo:block font-size="10pt" text-align="center"><xsl:value-of select="$stat" /> &#x25;</fo:block></fo:table-cell>
			           					</fo:table-row>
			           					

			           				</xsl:for-each>
			           		</xsl:for-each>


		           		</fo:table-body>
		           	</fo:table>
                       <fo:block font-size="12pt" font-weight="bold" text-align="left" padding-top="24pt" padding-bottom="12pt">Commentaires sur l'axe  <xsl:value-of select="@nom"/> </fo:block>

		           	<xsl:for-each select="gare-depart">
		           		<xsl:variable name="depart2"><xsl:value-of select="@nom"/></xsl:variable>
		           		<xsl:for-each select="gare-arrivee">
		           			<xsl:variable name="arrivee2"><xsl:value-of select="@nom"/></xsl:variable>
		           			<xsl:for-each select="mesure">
							    <xsl:if test='@commentaire !="" '>
							        <fo:block font-size="12pt" text-align="justify" padding-after="10pt" border-bottom="0.1mm solid #8b8b8b"> +  De <xsl:value-of select="$depart2"/> à <xsl:value-of select="$arrivee2"/>, <xsl:value-of select="@mois"/>.<xsl:value-of select="@annee"/>: </fo:block>
                                    <fo:block font-size="10pt" text-align="justify" padding-after="10pt"><xsl:value-of select="@commentaire"/></fo:block>
							    </xsl:if>
		           	        </xsl:for-each>
		                </xsl:for-each>
                    </xsl:for-each>
		           	<fo:block break-after="page"/>

		         </xsl:for-each>
			  </fo:flow>

			 </fo:page-sequence>


		</fo:root>
	</xsl:template>

</xsl:stylesheet>