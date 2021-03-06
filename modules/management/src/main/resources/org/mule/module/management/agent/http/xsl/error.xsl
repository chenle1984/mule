<?xml version="1.0"?>
<!--
 $Id$
 
 Copyright (c) MuleSoft, Inc.  All rights reserved.  http://www.mulesoft.com
 
 The software in this package is published under the terms of the CPAL v1.0
 license, a copy of which has been included with this distribution in the
 LICENSE.txt file.
 -->
<!--
 Copyright (C) The MX4J Contributors.
 All rights reserved.

 This software is distributed under the terms of the MX4J License version 1.0.
 See the terms of the MX4J License in the documentation provided with this software.

 Author: Carlos Quiroz (tibu@users.sourceforge.net)
 Revision: 1.2
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
   <xsl:output method="html" indent="yes" encoding="UTF-8"/>

   <xsl:param name="html.stylesheet">stylesheet.css</xsl:param>
   <xsl:param name="html.stylesheet.type">text/css</xsl:param>
   <xsl:param name="head.title">error.title</xsl:param>
   <xsl:include href="common.xsl"/>

   <xsl:template match="/" name="httpexception">
      <html>
         <xsl:call-template name="head"/>
         <body>
            <xsl:call-template name="toprow"/>
            <table width="100%" cellpadding="0" cellspacing="0" border="0">
               <tr>
                  <td width="100%" class="page_title">
                     <xsl:call-template name="str">
                        <xsl:with-param name="id">error.title</xsl:with-param>
                     </xsl:call-template>
                  </td>
               </tr>
               <xsl:for-each select="HttpException">
                  <tr>
                     <td>
                        <xsl:call-template name="str">
                           <xsl:with-param name="id">error.httpexception.code</xsl:with-param>
                           <xsl:with-param name="p0">
                              <xsl:value-of select="@code"/>
                           </xsl:with-param>
                        </xsl:call-template>
                     </td>
                  </tr>
                  <tr>
                     <td>
                        <xsl:call-template name="str">
                           <xsl:with-param name="id">error.httpexception.message</xsl:with-param>
                           <xsl:with-param name="p0">
                              <xsl:value-of select="@description"/>
                           </xsl:with-param>
                        </xsl:call-template>
                     </td>
                  </tr>
               </xsl:for-each>
            </table>
            <xsl:call-template name="bottom"/>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>

