<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" xmlns:tei="http://www.tei-c.org/ns/1.0" version="1.0">
   <xsl:output method="html" encoding="UTF-8" indent="yes" />
   <xsl:template match="/">
      <html>
         <head>
            <title>
               <xsl:value-of select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title" />
            </title>
            <meta charset="UTF-8" />
            <link rel="stylesheet" type="text/css" href="fogliostile.css" />
         </head>
         <body>
            <div class="header">
               <h1 class="mainTitle">
                  <xsl:value-of select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title" />
               </h1>
               <div class="descrizione">
                  <p>
                     All'interno di questo progetto sono riportate le codifiche in formato digitale di alcune cartoline
                     redatte durante la
                     <strong>Prima Guerra Mondiale</strong>, le quali si trovano attualmente presso il 
                     <xsl:value-of select="//tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:repository" />
                     (<xsl:value-of select="//tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:settlement" />).
                     <br />
                     Lo scambio di queste cartoline avviene tra Oliva Turtura, Giovanni Coliola e Giuseppe.
                  </p>
               </div>
            </div>
            <p id="selezione">Menu</p>
            <div class="elenco">
               <a href="#contenitore57" class="menucartolina" id="c57">
                  <xsl:value-of select="//tei:TEI[@xml:id='cart57']//tei:sourceDesc/tei:bibl/tei:title" />
               </a>
               <a href="#contenitore40" class="menucartolina" id="c40">
                  <xsl:value-of select="//tei:TEI[@xml:id='cart40']//tei:sourceDesc/tei:bibl/tei:title" />
               </a>
               <a href="#contenitore30" class="menucartolina" id="c30">
                  <xsl:value-of select="//tei:TEI[@xml:id='cart30']//tei:sourceDesc/tei:bibl/tei:title" />
               </a>
            </div>
            <div id="contenitore57" class="contenitori">
               <xsl:apply-templates select="//tei:TEI[@xml:id='cart57']" />
            </div>
            <div id="contenitore40" class="contenitori">
               <xsl:apply-templates select="//tei:TEI[@xml:id='cart40']" />
            </div>
            <div id="contenitore30" class="contenitori">
               <xsl:apply-templates select="//tei:TEI[@xml:id='cart30']" />
            </div>
            <div class="footer">
               <div class="infoFooter" id="about">
                  <h2>About</h2>
                  <p>
                     Il seguente progetto è stato realizzato per il corso di Codifica dei Testi (2020/2021)
                     <br />
                     <xsl:value-of select="//tei:respStmt[1]" />.
                     <br />
                  </p>
               </div>
               <div class="infoFooter" id="moreInfo">
                  <h2>More information</h2>
                  <p>
                     Cartoline ubicate presso:
                     <xsl:value-of select="//tei:msDesc/tei:msIdentifier/tei:repository" />(
                     <xsl:value-of select="//tei:msDesc/tei:msIdentifier/tei:settlement" />)
                     <br />
                     <xsl:value-of select="//tei:editionStmt/tei:respStmt[2]" />
                  </p>
               </div>
            </div>
         </body>
      </html>
   </xsl:template>
   <!--Template creazione fronte & retro cartoline -->
   <xsl:template match="//tei:TEI[@xml:id='cart57' or @xml:id='cart40' or @xml:id='cart30']">
      <h3 class="titolocart">
         <xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:bibl/tei:title" />
      </h3>
      <div class="infoCartolina">
         <xsl:apply-templates select="tei:facsimile//*[@xml:id='fronte057' or @xml:id='fronte040' or @xml:id='fronte030']/tei:graphic" />
         <div class="boxInfo" id="infoFronte">
            <p>
               <strong>Dimensioni: </strong>
               <xsl:value-of select="tei:teiHeader//tei:height" />x
               <xsl:value-of select="tei:teiHeader//tei:supportDesc/tei:support/tei:dimensions/tei:width" />cm
            </p>
            <p>
               <strong>Stato: </strong>
               <xsl:value-of select="tei:teiHeader//tei:supportDesc/tei:condition" />
            </p>
            <p>
               <strong>Lingue: </strong>
               <xsl:for-each select="tei:teiHeader/tei:profileDesc/tei:langUsage/tei:language">
                  <xsl:value-of select="." />
               </xsl:for-each>
            </p>
            <p>
               <strong>Mittente: </strong>
               <xsl:value-of select="tei:teiHeader//*[@type='sent']/tei:persName" />
            </p>
            <p>
               <strong>Destinatario: </strong>
               <xsl:value-of select="tei:teiHeader//*[@type='received']/tei:persName" />
            </p>
            <p>
               <strong>Data: </strong>
               <xsl:value-of select="tei:teiHeader//*[@type='sent']/tei:date" />
            </p>
         </div>
         <xsl:apply-templates select="tei:facsimile//*[@xml:id='retro057' or @xml:id='retro040' or @xml:id='retro030']/tei:graphic" />
         <div class="boxInfo" id="infoRetro">
            <p>
               <i>
                  <xsl:value-of select="tei:text//*[@type='postage_stamp']/tei:note" />
               </i>
            </p>
            <div class="divTesto">
               <xsl:apply-templates select="tei:text//*[@type='testoMessaggio']" />
            </div>
            <br />
            <div class="elemTipo">
               <p>
                  <strong>Elementi tipografici: </strong>
                  <xsl:value-of select="tei:text//*[@type='codStampa']/tei:p" />
                  <br />
                  <xsl:apply-templates select="tei:text//*[@type='stampe_cartolina']/tei:ab" />
               </p>
            </div>
         </div>
      </div>
   </xsl:template>
   <!--Img cartoline-->
   <xsl:template match="tei:facsimile//*[@xml:id='fronte057' or @xml:id='fronte040' or @xml:id='fronte030']/tei:graphic">
      <div class="boxInfo">
         <img src="{@url}" class="sizeFoto" />
      </div>
   </xsl:template>
   <xsl:template match="tei:facsimile//*[@xml:id='retro057' or @xml:id='retro040' or @xml:id='retro030']/tei:graphic">
      <div class="boxInfo">
         <img src="{@url}" class="sizeFoto" />
      </div>
   </xsl:template>
   <!--Testo retro-->
   <xsl:template match="tei:text//*[@type='testoMessaggio']">
      <div class="testofronte">
         <p>
            <xsl:apply-templates />
         </p>
      </div>
   </xsl:template>
   <xsl:template match="tei:lb">
      <br />
   </xsl:template>
   <xsl:template match="tei:text//*[@type='stampe_cartolina']/tei:ab">
      <xsl:apply-templates />
   </xsl:template>
   <xsl:template match="tei:choice">
      <xsl:value-of select="tei:abbr" />
   </xsl:template>
</xsl:stylesheet>