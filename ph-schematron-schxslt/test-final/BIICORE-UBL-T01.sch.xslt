<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<transform xmlns="http://www.w3.org/1999/XSL/Transform" version="2.0">
  <ns0:Description xmlns:ns0="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
    <ns1:creator xmlns:ns1="http://purl.org/dc/terms/">
      <ns1:Agent>
        <ns2:prefLabel xmlns:ns2="http://www.w3.org/2004/02/skos/core#">SchXslt/1.9.4 SAXON/HE 11.4</ns2:prefLabel>
        <ns2:schxslt.compile.typed-variables xmlns:ns2="https://doi.org/10.5281/zenodo.1495494#">true</ns2:schxslt.compile.typed-variables>
      </ns1:Agent>
    </ns1:creator>
    <ns1:created xmlns:ns1="http://purl.org/dc/terms/">2022-11-17T08:42:41.968+01:00</ns1:created>
  </ns0:Description>
  <output indent="yes" />
  <template match="root()">
    <variable as="element()?" name="metadata">
      <ns0:metadata xmlns:ns0="http://purl.oclc.org/dsdl/svrl">
        <ns1:creator xmlns:ns1="http://purl.org/dc/terms/">
          <ns1:Agent>
            <ns2:prefLabel xmlns:ns2="http://www.w3.org/2004/02/skos/core#">
              <value-of select="(system-property('xsl:product-name'), system-property('xsl:product-version'))" separator="/" />
            </ns2:prefLabel>
          </ns1:Agent>
        </ns1:creator>
        <ns1:created xmlns:ns1="http://purl.org/dc/terms/">
          <value-of select="current-dateTime()" />
        </ns1:created>
        <ns1:source xmlns:ns1="http://purl.org/dc/terms/">
          <ns2:Description xmlns:ns2="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
            <ns1:creator>
              <ns1:Agent>
                <ns3:prefLabel xmlns:ns3="http://www.w3.org/2004/02/skos/core#">SchXslt/1.9.4 SAXON/HE 11.4</ns3:prefLabel>
                <ns3:schxslt.compile.typed-variables xmlns:ns3="https://doi.org/10.5281/zenodo.1495494#">true</ns3:schxslt.compile.typed-variables>
              </ns1:Agent>
            </ns1:creator>
            <ns1:created>2022-11-17T08:42:41.968+01:00</ns1:created>
          </ns2:Description>
        </ns1:source>
      </ns0:metadata>
    </variable>
    <variable as="element(schxslt:report)" name="report">
      <ns0:report xmlns:ns0="https://doi.org/10.5281/zenodo.1495494">
        <call-template name="w339aac11" />
      </ns0:report>
    </variable>
    <variable as="node()*" name="schxslt:report">
      <sequence select="$metadata" />
      <for-each select="$report/schxslt:document">
        <for-each select="schxslt:pattern">
          <sequence select="node()" />
          <sequence select="../schxslt:rule[@pattern = current()/@id]/node()" />
        </for-each>
      </for-each>
    </variable>
    <ns0:schematron-output xmlns:ns0="http://purl.oclc.org/dsdl/svrl" title="BIICORE T01 bound to UBL">
      <ns0:ns-prefix-in-attribute-values prefix="cbc" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" />
      <ns0:ns-prefix-in-attribute-values prefix="cac" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" />
      <ns0:ns-prefix-in-attribute-values prefix="ubl" uri="urn:oasis:names:specification:ubl:schema:xsd:Order-2" />
      <sequence select="$schxslt:report" />
    </ns0:schematron-output>
  </template>
  <template match="text() | @*" mode="#all" priority="-10" />
  <template match="/" mode="#all" priority="-10">
    <apply-templates mode="#current" select="node()" />
  </template>
  <template match="*" mode="#all" priority="-10">
    <apply-templates mode="#current" select="@*" />
    <apply-templates mode="#current" select="node()" />
  </template>
  <template name="w339aac11">
    <ns0:document xmlns:ns0="https://doi.org/10.5281/zenodo.1495494">
      <ns0:pattern id="w339aac11">
        <if test="exists(base-uri(root()))">
          <attribute name="documents" select="base-uri(root())" />
        </if>
        <for-each select="root()">
          <ns1:active-pattern xmlns:ns1="http://purl.oclc.org/dsdl/svrl" id="UBL-T01" name="UBL-T01">
            <attribute name="documents" select="base-uri(.)" />
          </ns1:active-pattern>
        </for-each>
      </ns0:pattern>
      <apply-templates mode="w339aac11" select="root()" />
    </ns0:document>
  </template>
  <template match="/ubl:Order/cac:BuyerCustomerParty/cac:Party" mode="w339aac11" priority="5">
    <param as="xs:string*" name="schxslt:patterns-matched" />
    <choose>
      <when test="$schxslt:patterns-matched[. = 'w339aac11']">
        <ns0:rule xmlns:ns0="https://doi.org/10.5281/zenodo.1495494" pattern="w339aac11">
          <comment>WARNING: Rule for context "/ubl:Order/cac:BuyerCustomerParty/cac:Party" shadowed by preceding rule</comment>
          <ns1:suppressed-rule xmlns:ns1="http://purl.oclc.org/dsdl/svrl">
            <attribute name="context">/ubl:Order/cac:BuyerCustomerParty/cac:Party</attribute>
          </ns1:suppressed-rule>
        </ns0:rule>
        <next-match>
          <with-param as="xs:string*" name="schxslt:patterns-matched" select="$schxslt:patterns-matched" />
        </next-match>
      </when>
      <otherwise>
        <ns0:rule xmlns:ns0="https://doi.org/10.5281/zenodo.1495494" pattern="w339aac11">
          <ns1:fired-rule xmlns:ns1="http://purl.oclc.org/dsdl/svrl">
            <attribute name="context">/ubl:Order/cac:BuyerCustomerParty/cac:Party</attribute>
          </ns1:fired-rule>
          <if test="not(count(cac:PartyIdentification)&lt;=1 and contains(preceding::cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(preceding::cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">count(cac:PartyIdentification)&lt;=1 and contains(preceding::cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(preceding::cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R435]-Element 'PartyIdentification' may occur at maximum 1 times.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(count(cac:PartyName)=1 and contains(preceding::cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(preceding::cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">count(cac:PartyName)=1 and contains(preceding::cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(preceding::cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R436]-Element 'PartyName' must occur exactly 1 times.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(count(cac:PartyLegalEntity)&lt;=1 and contains(preceding::cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(preceding::cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">count(cac:PartyLegalEntity)&lt;=1 and contains(preceding::cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(preceding::cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R437]-Element 'PartyLegalEntity' may occur at maximum 1 times.</ns1:text>
            </ns1:failed-assert>
          </if>
        </ns0:rule>
        <next-match>
          <with-param as="xs:string*" name="schxslt:patterns-matched" select="($schxslt:patterns-matched, 'w339aac11')" />
        </next-match>
      </otherwise>
    </choose>
  </template>
  <template match="/ubl:Order/cac:SellerSupplierParty/cac:Party" mode="w339aac11" priority="4">
    <param as="xs:string*" name="schxslt:patterns-matched" />
    <choose>
      <when test="$schxslt:patterns-matched[. = 'w339aac11']">
        <ns0:rule xmlns:ns0="https://doi.org/10.5281/zenodo.1495494" pattern="w339aac11">
          <comment>WARNING: Rule for context "/ubl:Order/cac:SellerSupplierParty/cac:Party" shadowed by preceding rule</comment>
          <ns1:suppressed-rule xmlns:ns1="http://purl.oclc.org/dsdl/svrl">
            <attribute name="context">/ubl:Order/cac:SellerSupplierParty/cac:Party</attribute>
          </ns1:suppressed-rule>
        </ns0:rule>
        <next-match>
          <with-param as="xs:string*" name="schxslt:patterns-matched" select="$schxslt:patterns-matched" />
        </next-match>
      </when>
      <otherwise>
        <ns0:rule xmlns:ns0="https://doi.org/10.5281/zenodo.1495494" pattern="w339aac11">
          <ns1:fired-rule xmlns:ns1="http://purl.oclc.org/dsdl/svrl">
            <attribute name="context">/ubl:Order/cac:SellerSupplierParty/cac:Party</attribute>
          </ns1:fired-rule>
          <if test="not(count(cac:PartyIdentification)&lt;=1 and contains(preceding::cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(preceding::cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">count(cac:PartyIdentification)&lt;=1 and contains(preceding::cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(preceding::cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R438]-Element 'PartyIdentification' may occur at maximum 1 times.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(count(cac:PartyName)=1 and contains(preceding::cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(preceding::cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">count(cac:PartyName)=1 and contains(preceding::cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(preceding::cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R439]-Element 'PartyName' must occur exactly 1 times.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(count(cac:PartyLegalEntity)&lt;=1 and contains(preceding::cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(preceding::cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">count(cac:PartyLegalEntity)&lt;=1 and contains(preceding::cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(preceding::cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R440]-Element 'PartyLegalEntity' may occur at maximum 1 times.</ns1:text>
            </ns1:failed-assert>
          </if>
        </ns0:rule>
        <next-match>
          <with-param as="xs:string*" name="schxslt:patterns-matched" select="($schxslt:patterns-matched, 'w339aac11')" />
        </next-match>
      </otherwise>
    </choose>
  </template>
  <template match="/ubl:Order/cac:OrderLine/cac:LineItem/cac:Item" mode="w339aac11" priority="3">
    <param as="xs:string*" name="schxslt:patterns-matched" />
    <choose>
      <when test="$schxslt:patterns-matched[. = 'w339aac11']">
        <ns0:rule xmlns:ns0="https://doi.org/10.5281/zenodo.1495494" pattern="w339aac11">
          <comment>WARNING: Rule for context "/ubl:Order/cac:OrderLine/cac:LineItem/cac:Item" shadowed by preceding rule</comment>
          <ns1:suppressed-rule xmlns:ns1="http://purl.oclc.org/dsdl/svrl">
            <attribute name="context">/ubl:Order/cac:OrderLine/cac:LineItem/cac:Item</attribute>
          </ns1:suppressed-rule>
        </ns0:rule>
        <next-match>
          <with-param as="xs:string*" name="schxslt:patterns-matched" select="$schxslt:patterns-matched" />
        </next-match>
      </when>
      <otherwise>
        <ns0:rule xmlns:ns0="https://doi.org/10.5281/zenodo.1495494" pattern="w339aac11">
          <ns1:fired-rule xmlns:ns1="http://purl.oclc.org/dsdl/svrl">
            <attribute name="context">/ubl:Order/cac:OrderLine/cac:LineItem/cac:Item</attribute>
          </ns1:fired-rule>
          <if test="not(count(cbc:Description)&lt;=1 and contains(preceding::cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(preceding::cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">count(cbc:Description)&lt;=1 and contains(preceding::cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(preceding::cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R441]-Element 'Description' may occur at maximum 1 times.</ns1:text>
            </ns1:failed-assert>
          </if>
        </ns0:rule>
        <next-match>
          <with-param as="xs:string*" name="schxslt:patterns-matched" select="($schxslt:patterns-matched, 'w339aac11')" />
        </next-match>
      </otherwise>
    </choose>
  </template>
  <template match="/ubl:Order/cac:OriginatoCustomerParty" mode="w339aac11" priority="2">
    <param as="xs:string*" name="schxslt:patterns-matched" />
    <choose>
      <when test="$schxslt:patterns-matched[. = 'w339aac11']">
        <ns0:rule xmlns:ns0="https://doi.org/10.5281/zenodo.1495494" pattern="w339aac11">
          <comment>WARNING: Rule for context "/ubl:Order/cac:OriginatoCustomerParty" shadowed by preceding rule</comment>
          <ns1:suppressed-rule xmlns:ns1="http://purl.oclc.org/dsdl/svrl">
            <attribute name="context">/ubl:Order/cac:OriginatoCustomerParty</attribute>
          </ns1:suppressed-rule>
        </ns0:rule>
        <next-match>
          <with-param as="xs:string*" name="schxslt:patterns-matched" select="$schxslt:patterns-matched" />
        </next-match>
      </when>
      <otherwise>
        <ns0:rule xmlns:ns0="https://doi.org/10.5281/zenodo.1495494" pattern="w339aac11">
          <ns1:fired-rule xmlns:ns1="http://purl.oclc.org/dsdl/svrl">
            <attribute name="context">/ubl:Order/cac:OriginatoCustomerParty</attribute>
          </ns1:fired-rule>
          <if test="not(count(cac:PartyIdentification)&lt;=1 and contains(preceding::cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(preceding::cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">count(cac:PartyIdentification)&lt;=1 and contains(preceding::cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(preceding::cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R442]-Element 'PartyIdentification' may occur at maximum 1 times.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(count(cac:PartyName)&lt;=1 and contains(preceding::cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(preceding::cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">count(cac:PartyName)&lt;=1 and contains(preceding::cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(preceding::cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R443]-Element 'PartyName' may occur at maximum 1 times</ns1:text>
            </ns1:failed-assert>
          </if>
        </ns0:rule>
        <next-match>
          <with-param as="xs:string*" name="schxslt:patterns-matched" select="($schxslt:patterns-matched, 'w339aac11')" />
        </next-match>
      </otherwise>
    </choose>
  </template>
  <template match="/ubl:Order" mode="w339aac11" priority="1">
    <param as="xs:string*" name="schxslt:patterns-matched" />
    <choose>
      <when test="$schxslt:patterns-matched[. = 'w339aac11']">
        <ns0:rule xmlns:ns0="https://doi.org/10.5281/zenodo.1495494" pattern="w339aac11">
          <comment>WARNING: Rule for context "/ubl:Order" shadowed by preceding rule</comment>
          <ns1:suppressed-rule xmlns:ns1="http://purl.oclc.org/dsdl/svrl">
            <attribute name="context">/ubl:Order</attribute>
          </ns1:suppressed-rule>
        </ns0:rule>
        <next-match>
          <with-param as="xs:string*" name="schxslt:patterns-matched" select="$schxslt:patterns-matched" />
        </next-match>
      </when>
      <otherwise>
        <ns0:rule xmlns:ns0="https://doi.org/10.5281/zenodo.1495494" pattern="w339aac11">
          <ns1:fired-rule xmlns:ns1="http://purl.oclc.org/dsdl/svrl">
            <attribute name="context">/ubl:Order</attribute>
          </ns1:fired-rule>
          <if test="not(contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')</attribute>
              <ns1:text>[BIICORE-T01-R000]-This XML instance is NOT a core BiiTrdm001 transaction</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(count(//*[not(text())]) > 0))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(count(//*[not(text())]) &gt; 0)</attribute>
              <ns1:text>[BIICORE-T01-R001]-An Order SHOULD not contain empty elements.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cbc:SalesOrderID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cbc:SalesOrderID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R002]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cbc:CopyIndicator) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cbc:CopyIndicator) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R003]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cbc:UUID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cbc:UUID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R004]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cbc:RequestedInvoiceCurrencyCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cbc:RequestedInvoiceCurrencyCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R005]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cbc:PricingCurrencyCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cbc:PricingCurrencyCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R006]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cbc:TaxCurrencyCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cbc:TaxCurrencyCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R007]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cbc:CustomerReference) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cbc:CustomerReference) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R008]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cbc:AccountingCostCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cbc:AccountingCostCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R009]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cbc:LineCountNumeric) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cbc:LineCountNumeric) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R010]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:ValidityPeriod/cbc:StartDate) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:ValidityPeriod/cbc:StartDate) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R011]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:ValidityPeriod/cbc:StartTime) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:ValidityPeriod/cbc:StartTime) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R012]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:ValidityPeriod/cbc:EndTime) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:ValidityPeriod/cbc:EndTime) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R013]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:ValidityPeriod/cbc:DurationMeasure) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:ValidityPeriod/cbc:DurationMeasure) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R014]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:ValidityPeriod/cbc:Description) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:ValidityPeriod/cbc:Description) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R015]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:ValidityPeriod/cbc:DescriptionCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:ValidityPeriod/cbc:DescriptionCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R016]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:QuotationDocumentReference/cbc:CopyIndicator) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:QuotationDocumentReference/cbc:CopyIndicator) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R017]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:QuotationDocumentReference/cbc:UUID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:QuotationDocumentReference/cbc:UUID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R018]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:QuotationDocumentReference/cbc:IssueDate) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:QuotationDocumentReference/cbc:IssueDate) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R019]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:QuotationDocumentReference/cbc:DocumentTypeCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:QuotationDocumentReference/cbc:DocumentTypeCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R020]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:QuotationDocumentReference/cbc:DocumentType) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:QuotationDocumentReference/cbc:DocumentType) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R021]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:QuotationDocumentReference/cbc:XPath) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:QuotationDocumentReference/cbc:XPath) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R022]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:QuotationDocumentReference/cac:Attachment) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:QuotationDocumentReference/cac:Attachment) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R023]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderDocumentReference/cbc:CopyIndicator) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderDocumentReference/cbc:CopyIndicator) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R024]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderDocumentReference/cbc:UUID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderDocumentReference/cbc:UUID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R025]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderDocumentReference/cbc:IssueDate) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderDocumentReference/cbc:IssueDate) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R026]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderDocumentReference/cbc:DocumentTypeCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderDocumentReference/cbc:DocumentTypeCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R027]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderDocumentReference/cbc:DocumentType) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderDocumentReference/cbc:DocumentType) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R028]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderDocumentReference/cbc:XPath) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderDocumentReference/cbc:XPath) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R029]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderDocumentReference/cac:Attachment) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderDocumentReference/cac:Attachment) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R030]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderDocumentReference/cbc:CopyIndicator) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderDocumentReference/cbc:CopyIndicator) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R031]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderDocumentReference/cbc:UUID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderDocumentReference/cbc:UUID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R032]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderDocumentReference/cbc:IssueDate) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderDocumentReference/cbc:IssueDate) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R033]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderDocumentReference/cbc:DocumentTypeCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderDocumentReference/cbc:DocumentTypeCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R034]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderDocumentReference/cbc:XPath) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderDocumentReference/cbc:XPath) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R035]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderDocumentReference/cac:Attachment) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderDocumentReference/cac:Attachment) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R036]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:AdditionalDocumentReference/cbc:CopyIndicator) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:AdditionalDocumentReference/cbc:CopyIndicator) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R037]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:AdditionalDocumentReference/cbc:UUID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:AdditionalDocumentReference/cbc:UUID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R038]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:AdditionalDocumentReference/cbc:IssueDate) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:AdditionalDocumentReference/cbc:IssueDate) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R039]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:AdditionalDocumentReference/cbc:DocumentTypeCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:AdditionalDocumentReference/cbc:DocumentTypeCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R040]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:AdditionalDocumentReference/cbc:XPath) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:AdditionalDocumentReference/cbc:XPath) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R041]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:DocumentHash) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:DocumentHash) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R042]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:ExpiryDate) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:ExpiryDate) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R043]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:ExpiryTime) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:AdditionalDocumentReference/cac:Attachment/cac:ExternalReference/cbc:ExpiryTime) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R044]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:Contract/cbc:IssueDate) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:Contract/cbc:IssueDate) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R045]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:Contract/cbc:IssueTime) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:Contract/cbc:IssueTime) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R046]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:Contract/cbc:ContractTypeCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:Contract/cbc:ContractTypeCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R047]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:Contract/cac:ValidityPeriod) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:Contract/cac:ValidityPeriod) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R048]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:Contract/cac:ContractDocumentReference) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:Contract/cac:ContractDocumentReference) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R049]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:Signature) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:Signature) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R050]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cbc:SupplierAssignedAccountID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cbc:SupplierAssignedAccountID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R051]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cbc:CustomerAssignedAccountID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cbc:CustomerAssignedAccountID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R052]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cbc:AdditionalAccountID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cbc:AdditionalAccountID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R053]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:DeliveryContact/cbc:ID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:DeliveryContact/cbc:ID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R054]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:DeliveryContact/cbc:Note) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:DeliveryContact/cbc:Note) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R055]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:DeliveryContact/cac:OtherCommunication) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:DeliveryContact/cac:OtherCommunication) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R056]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:AccountingContact) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:AccountingContact) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R057]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:BuyerContact) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:BuyerContact) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R058]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cbc:MarkCareIndicator) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cbc:MarkCareIndicator) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R059]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cbc:MarkAttentionIndicator) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cbc:MarkAttentionIndicator) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R060]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cbc:WebsiteURI) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cbc:WebsiteURI) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R061]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cbc:LogoReferenceID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cbc:LogoReferenceID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R062]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:Language) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:Language) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R063]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:AddressTypeCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:AddressTypeCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R064]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:AddressFormatCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:AddressFormatCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R065]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:Floor) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:Floor) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R066]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:Room) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:Room) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R067]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:BlockName) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:BlockName) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R068]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:BuildingName) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:BuildingName) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R069]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:InhouseMail) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:InhouseMail) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R070]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:MarkAttention) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:MarkAttention) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R071]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:MarkCare) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:MarkCare) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R072]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:PlotIdentification) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:PlotIdentification) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R073]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:CitySubdivisionName) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:CitySubdivisionName) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R074]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:CountrySubentityCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:CountrySubentityCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R075]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:Region) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:Region) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R076]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:District) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:District) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R077]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:TimezoneOffset) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cbc:TimezoneOffset) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R078]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cac:AddressLine) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cac:AddressLine) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R079]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:Name) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:Name) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R080]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cac:LocationCoordinate) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PostalAddress/cac:LocationCoordinate) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R081]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PhysicalLocation) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PhysicalLocation) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R082]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:TaxLevelCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:TaxLevelCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R083]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:ExemptionReasonCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:ExemptionReasonCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R084]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:ExemptionReason) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cbc:ExemptionReason) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R085]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cbc:ID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cbc:ID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R086]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cbc:AddressTypeCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cbc:AddressTypeCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R087]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cbc:AddressFormatCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cbc:AddressFormatCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R088]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cbc:Postbox) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cbc:Postbox) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R089]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cbc:Floor) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cbc:Floor) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R090]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cbc:Room) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cbc:Room) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R091]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cbc:StreetName) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cbc:StreetName) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R092]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cbc:AdditionalStreetName) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cbc:AdditionalStreetName) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R093]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cbc:BlockName) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cbc:BlockName) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R094]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cbc:BuildingName) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cbc:BuildingName) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R095]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cbc:BuildingNumber) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cbc:BuildingNumber) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R096]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cbc:InhouseMail) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cbc:InhouseMail) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R097]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cbc:Department) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cbc:Department) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R098]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cbc:MarkAttention) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cbc:MarkAttention) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R099]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cbc:MarkCare) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cbc:MarkCare) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R100]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cbc:PlotIdentification) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cbc:PlotIdentification) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R101]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cbc:CitySubdivisionName) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cbc:CitySubdivisionName) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R102]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cbc:PostalZone) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cbc:PostalZone) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R103]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cbc:CountrySubentity) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cbc:CountrySubentity) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R104]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cbc:CountrySubentityCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cbc:CountrySubentityCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R105]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cbc:Region) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cbc:Region) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R106]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cbc:District) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cbc:District) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R107]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cbc:TimezoneOffset) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cbc:TimezoneOffset) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R108]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cac:AddressLine) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cac:AddressLine) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R109]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cac:Country/cbc:Name) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cac:Country/cbc:Name) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R110]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cac:LocationCoordinate) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:RegistrationAddress/cac:LocationCoordinate) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R111]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress/cbc:ID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress/cbc:ID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R112]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress/cbc:AddressFormatCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress/cbc:AddressFormatCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R113]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress/cbc:Postbox) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress/cbc:Postbox) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R114]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress/cbc:Floor) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress/cbc:Floor) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R115]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress/cbc:Room) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress/cbc:Room) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R116]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress/cbc:StreetName) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress/cbc:StreetName) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R117]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress/cbc:AdditionalStreetName) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress/cbc:AdditionalStreetName) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R118]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress/cbc:BuildingName) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress/cbc:BuildingName) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R119]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress/cbc:BuildingNumber) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress/cbc:BuildingNumber) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R120]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress/cbc:Department) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress/cbc:Department) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R121]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress/cbc:MarkAttention) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress/cbc:MarkAttention) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R122]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress/cbc:MarkCare) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress/cbc:MarkCare) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R123]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress/cbc:CityName) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress/cbc:CityName) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R124]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress/cbc:PostalZone) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress/cbc:PostalZone) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R125]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress/cbc:CountrySubentity) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress/cbc:CountrySubentity) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R126]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress/cbc:CountrySubentityCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress/cbc:CountrySubentityCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R127]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress/cbc:Region) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress/cbc:Region) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R128]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress/cbc:District) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress/cbc:District) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R129]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress/cac:AddressLine) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PartyTaxScheme/cac:TaxScheme/cac:JurisdictionRegionAddress/cac:AddressLine) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R130]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:ID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:ID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R131]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AddressTypeCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AddressTypeCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R132]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AddressFormatCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AddressFormatCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R133]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Postbox) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Postbox) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R134]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Floor) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Floor) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R135]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Room) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Room) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R136]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:StreetName) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:StreetName) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R137]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AdditionalStreetName) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AdditionalStreetName) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R138]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BlockName) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BlockName) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R139]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BuildingName) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BuildingName) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R140]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BuildingNumber) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BuildingNumber) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R141]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:InhouseMail) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:InhouseMail) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R142]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Department) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Department) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R143]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:MarkAttention) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:MarkAttention) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R144]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:MarkCare) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:MarkCare) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R145]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:PlotIdentification) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:PlotIdentification) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R146]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CitySubdivisionName) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CitySubdivisionName) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R147]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:PostalZone) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:PostalZone) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R148]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentityCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentityCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R149]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Region) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Region) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R150]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:District) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:District) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R151]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:TimezoneOffset) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:TimezoneOffset) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R152]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R153]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:Name) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:Name) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R154]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:LocationCoordinate) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:LocationCoordinate) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R155]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:CorporateRegistrationScheme) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:PartyLegalEntity/cac:CorporateRegistrationScheme) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R156]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:ID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:ID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R157]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:Name) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:Name) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R158]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:Note) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:Contact/cbc:Note) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R159]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:Contact/cac:OtherCommunication) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:Contact/cac:OtherCommunication) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R160]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:Person/cbc:Title) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:Person/cbc:Title) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R161]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:Person/cbc:NameSuffix) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:Person/cbc:NameSuffix) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R162]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:Person/cbc:OrganizationDepartment) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:Person/cbc:OrganizationDepartment) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R163]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:BuyerCustomerParty/cac:Party/cac:AgentParty) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:BuyerCustomerParty/cac:Party/cac:AgentParty) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R164]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:SellerSupplierParty/cbc:CustomerAssignedAccountID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:SellerSupplierParty/cbc:CustomerAssignedAccountID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R165]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:SellerSupplierParty/cbc:AdditionalAccountID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:SellerSupplierParty/cbc:AdditionalAccountID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R166]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:SellerSupplierParty/cbc:DataSendingCapability) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:SellerSupplierParty/cbc:DataSendingCapability) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R167]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:SellerSupplierParty/cac:DespatchContact) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:SellerSupplierParty/cac:DespatchContact) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R168]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:SellerSupplierParty/cac:AccountingContact) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:SellerSupplierParty/cac:AccountingContact) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R169]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:SellerSupplierParty/cac:SellerContact) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:SellerSupplierParty/cac:SellerContact) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R170]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:SellerSupplierParty/cac:Party/cbc:MarkCareIndicator) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:SellerSupplierParty/cac:Party/cbc:MarkCareIndicator) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R171]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:SellerSupplierParty/cac:Party/cbc:MarkAttentionIndicator) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:SellerSupplierParty/cac:Party/cbc:MarkAttentionIndicator) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R172]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:SellerSupplierParty/cac:Party/cbc:WebsiteURI) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:SellerSupplierParty/cac:Party/cbc:WebsiteURI) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R173]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:SellerSupplierParty/cac:Party/cbc:LogoReferenceID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:SellerSupplierParty/cac:Party/cbc:LogoReferenceID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R174]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:SellerSupplierParty/cac:Party/cac:Language) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:SellerSupplierParty/cac:Party/cac:Language) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R175]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:AddressTypeCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:AddressTypeCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R176]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:AddressFormatCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:AddressFormatCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R177]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:Floor) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:Floor) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R178]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:Room) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:Room) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R179]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:BlockName) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:BlockName) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R180]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:BuildingName) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:BuildingName) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R181]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:InhouseMail) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:InhouseMail) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R182]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:MarkAttention) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:MarkAttention) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R183]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:MarkCare) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:MarkCare) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R184]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:PlotIdentification) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:PlotIdentification) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R185]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:CitySubdivisionName) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:CitySubdivisionName) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R186]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:Region) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:Region) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R187]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:District) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:District) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R188]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:TimezoneOffset) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:TimezoneOffset) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R189]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:AddressLine) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:AddressLine) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R190]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:Name) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:Name) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R191]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:LocationCoordinate) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:LocationCoordinate) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R192]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:SellerSupplierParty/cac:Party/cac:PhysicalLocation) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:SellerSupplierParty/cac:Party/cac:PhysicalLocation) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R193]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:SellerSupplierParty/cac:Party/cac:PartyTaxScheme) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:SellerSupplierParty/cac:Party/cac:PartyTaxScheme) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R194]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:ID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:ID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R195]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AddressTypeCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AddressTypeCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R196]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AddressFormatCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AddressFormatCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R197]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Postbox) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Postbox) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R198]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Floor) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Floor) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R199]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Room) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Room) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R200]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:StreetName) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:StreetName) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R201]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AdditionalStreetName) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:AdditionalStreetName) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R202]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BlockName) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BlockName) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R203]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BuildingName) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BuildingName) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R204]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BuildingNumber) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BuildingNumber) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R205]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:InhouseMail) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:InhouseMail) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R206]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Department) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Department) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R207]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:MarkAttention) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:MarkAttention) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R208]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:MarkCare) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:MarkCare) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R209]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:PlotIdentification) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:PlotIdentification) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R210]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CitySubdivisionName) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CitySubdivisionName) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R211]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:PostalZone) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:PostalZone) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R212]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentityCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentityCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R213]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Region) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:Region) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R214]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:District) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:District) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R215]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:TimezoneOffset) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:TimezoneOffset) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R216]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R217]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:Name) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:Country/cbc:Name) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R218]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:LocationCoordinate) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:LocationCoordinate) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R219]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:CorporateRegistrationScheme) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cac:CorporateRegistrationScheme) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R220]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:ID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:ID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R221]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Name) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Name) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R222]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Note) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:SellerSupplierParty/cac:Party/cac:Contact/cbc:Note) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R223]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:SellerSupplierParty/cac:Party/cac:Contact/cac:OtherCommunication) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:SellerSupplierParty/cac:Party/cac:Contact/cac:OtherCommunication) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R224]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:SellerSupplierParty/cac:Party/cac:Person/cbc:Title) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:SellerSupplierParty/cac:Party/cac:Person/cbc:Title) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R225]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:SellerSupplierParty/cac:Party/cac:Person/cbc:NameSuffix) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:SellerSupplierParty/cac:Party/cac:Person/cbc:NameSuffix) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R226]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:SellerSupplierParty/cac:Party/cac:Person/cbc:OrganizationDepartment) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:SellerSupplierParty/cac:Party/cac:Person/cbc:OrganizationDepartment) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R227]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:SellerSupplierParty/cac:Party/cac:AgentParty) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:SellerSupplierParty/cac:Party/cac:AgentParty) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R228]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OriginatorCustomerParty/cbc:SupplierAssignedAccountID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OriginatorCustomerParty/cbc:SupplierAssignedAccountID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R229]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OriginatorCustomerParty/cbc:CustomerAssignedAccountID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OriginatorCustomerParty/cbc:CustomerAssignedAccountID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R230]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OriginatorCustomerParty/cbc:AdditionalAccountID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OriginatorCustomerParty/cbc:AdditionalAccountID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R231]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OriginatorCustomerParty/cac:DeliveryContact) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OriginatorCustomerParty/cac:DeliveryContact) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R232]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OriginatorCustomerParty/cac:AccountingContact) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OriginatorCustomerParty/cac:AccountingContact) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R233]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OriginatorCustomerParty/cac:BuyerContact) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OriginatorCustomerParty/cac:BuyerContact) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R234]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OriginatorCustomerParty/cac:Party/cbc:MarkCareIndicator) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OriginatorCustomerParty/cac:Party/cbc:MarkCareIndicator) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R235]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OriginatorCustomerParty/cac:Party/cbc:MarkAttentionIndicator) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OriginatorCustomerParty/cac:Party/cbc:MarkAttentionIndicator) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R236]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OriginatorCustomerParty/cac:Party/cbc:WebsiteURI) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OriginatorCustomerParty/cac:Party/cbc:WebsiteURI) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R237]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OriginatorCustomerParty/cac:Party/cbc:LogoReferenceID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OriginatorCustomerParty/cac:Party/cbc:LogoReferenceID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R238]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OriginatorCustomerParty/cac:Party/cac:Language) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OriginatorCustomerParty/cac:Party/cac:Language) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R239]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OriginatorCustomerParty/cac:Party/cac:PostalAddress) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OriginatorCustomerParty/cac:Party/cac:PostalAddress) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R240]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OriginatorCustomerParty/cac:Party/cac:PhysicalLocation) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R241]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OriginatorCustomerParty/cac:Party/cac:PartyTaxScheme) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OriginatorCustomerParty/cac:Party/cac:PartyTaxScheme) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R242]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OriginatorCustomerParty/cac:Party/cac:PartyLegalEntity) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R243]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OriginatorCustomerParty/cac:Party/cac:Contact/cbc:ID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OriginatorCustomerParty/cac:Party/cac:Contact/cbc:ID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R244]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OriginatorCustomerParty/cac:Party/cac:Contact/cbc:Name) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OriginatorCustomerParty/cac:Party/cac:Contact/cbc:Name) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R245]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OriginatorCustomerParty/cac:Party/cac:Contact/cbc:Note) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OriginatorCustomerParty/cac:Party/cac:Contact/cbc:Note) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R246]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OriginatorCustomerParty/cac:Party/cac:Contact/cac:OtherCommunication) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OriginatorCustomerParty/cac:Party/cac:Contact/cac:OtherCommunication) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R247]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OriginatorCustomerParty/cac:Party/cac:Person/cbc:Title) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OriginatorCustomerParty/cac:Party/cac:Person/cbc:Title) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R248]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OriginatorCustomerParty/cac:Party/cac:Person/cbc:NameSuffix) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OriginatorCustomerParty/cac:Party/cac:Person/cbc:NameSuffix) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R249]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OriginatorCustomerParty/cac:Party/cac:Person/cbc:OrganizationDepartment) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OriginatorCustomerParty/cac:Party/cac:Person/cbc:OrganizationDepartment) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R250]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OriginatorCustomerParty/cac:Party/cac:AgentParty) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OriginatorCustomerParty/cac:Party/cac:AgentParty) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R251]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:FreightForwarderParty) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:FreightForwarderParty) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R252]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:AccountingCustomerParty) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:AccountingCustomerParty) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R253]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:Delivery/cbc:ID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:Delivery/cbc:ID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R254]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:Delivery/cbc:Quantity) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:Delivery/cbc:Quantity) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R255]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:Delivery/cbc:MinimumQuantity) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:Delivery/cbc:MinimumQuantity) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R256]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:Delivery/cbc:MaximumQuantity) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:Delivery/cbc:MaximumQuantity) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R257]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:Delivery/cbc:ActualDeliveryTime) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:Delivery/cbc:ActualDeliveryTime) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R258]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:Delivery/cbc:LatestDeliveryDate) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:Delivery/cbc:LatestDeliveryDate) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R259]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:Delivery/cbc:LatestDeliveryTime) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:Delivery/cbc:LatestDeliveryTime) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R260]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:Delivery/cbc:TrackingID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:Delivery/cbc:TrackingID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R261]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:Delivery/cac:DeliveryAddress) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:Delivery/cac:DeliveryAddress) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R262]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:Delivery/cac:DeliveryLocation/cbc:ID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:Delivery/cac:DeliveryLocation/cbc:ID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R263]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:Delivery/cac:DeliveryLocation/cbc:Description) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:Delivery/cac:DeliveryLocation/cbc:Description) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R264]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:Delivery/cac:DeliveryLocation/cbc:Conditions) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:Delivery/cac:DeliveryLocation/cbc:Conditions) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R265]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:Delivery/cac:DeliveryLocation/cbc:CountrySubentity) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:Delivery/cac:DeliveryLocation/cbc:CountrySubentity) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R266]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:Delivery/cac:DeliveryLocation/cbc:CountrySubentityCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:Delivery/cac:DeliveryLocation/cbc:CountrySubentityCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R267]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:Delivery/cac:DeliveryLocation/cac:ValidityPeriod) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:Delivery/cac:DeliveryLocation/cac:ValidityPeriod) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R268]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:AddressTypeCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:AddressTypeCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R269]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:AddressFormatCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:AddressFormatCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R270]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:Floor) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:Floor) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R271]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:Room) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:Room) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R272]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:BlockName) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:BlockName) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R273]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:BuildingName) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:BuildingName) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R274]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:InhouseMail) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:InhouseMail) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R275]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:Department) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:Department) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R276]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:MarkAttention) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:MarkAttention) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R277]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:MarkCare) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:MarkCare) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R278]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:PlotIdentification) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:PlotIdentification) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R279]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:CitySubdivisionName) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:CitySubdivisionName) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R280]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:CountrySubentityCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:CountrySubentityCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R281]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:Region) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:Region) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R282]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:District) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:District) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R283]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:TimezoneOffset) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:Delivery/cac:DeliveryLocation/cac:Address/cbc:TimezoneOffset) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R284]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:Delivery/cac:DeliveryLocation/cac:Address/cac:AddressLine) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:Delivery/cac:DeliveryLocation/cac:Address/cac:AddressLine) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R285]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country/cbc:Name) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:Delivery/cac:DeliveryLocation/cac:Address/cac:Country/cbc:Name) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R286]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:Delivery/cac:DeliveryLocation/cac:Address/cac:LocationCoordinate) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:Delivery/cac:DeliveryLocation/cac:Address/cac:LocationCoordinate) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R287]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:Delivery/cac:RequestedDeliveryPeriod/cbc:StartTime) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:Delivery/cac:RequestedDeliveryPeriod/cbc:StartTime) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R288]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:Delivery/cac:RequestedDeliveryPeriod/cbc:EndTime) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:Delivery/cac:RequestedDeliveryPeriod/cbc:EndTime) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R289]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:Delivery/cac:RequestedDeliveryPeriod/cbc:DurationMeasure) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:Delivery/cac:RequestedDeliveryPeriod/cbc:DurationMeasure) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R290]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:Delivery/cac:RequestedDeliveryPeriod/cbc:DescriptionCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:Delivery/cac:RequestedDeliveryPeriod/cbc:DescriptionCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R291]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:Delivery/cac:RequestedDeliveryPeriod/cbc:Description) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:Delivery/cac:RequestedDeliveryPeriod/cbc:Description) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R292]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:Delivery/cac:PromisedDeliveryPeriod) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:Delivery/cac:PromisedDeliveryPeriod) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R293]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:Delivery/cac:EstimatedDeliveryPeriod) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:Delivery/cac:EstimatedDeliveryPeriod) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R294]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:Delivery/cac:DeliveryParty/cbc:MarkCareIndicator) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:Delivery/cac:DeliveryParty/cbc:MarkCareIndicator) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R295]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:Delivery/cac:DeliveryParty/cbc:MarkAttentionIndicator) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:Delivery/cac:DeliveryParty/cbc:MarkAttentionIndicator) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R296]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:Delivery/cac:DeliveryParty/cbc:WebsiteURI) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:Delivery/cac:DeliveryParty/cbc:WebsiteURI) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R297]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:Delivery/cac:DeliveryParty/cbc:LogoReferenceID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:Delivery/cac:DeliveryParty/cbc:LogoReferenceID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R298]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:Delivery/cac:DeliveryParty/cac:Language) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:Delivery/cac:DeliveryParty/cac:Language) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R299]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:Delivery/cac:DeliveryParty/cac:PostalAddress) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:Delivery/cac:DeliveryParty/cac:PostalAddress) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R300]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:Delivery/cac:DeliveryParty/cac:PhysicalLocation) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:Delivery/cac:DeliveryParty/cac:PhysicalLocation) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R301]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:Delivery/cac:DeliveryParty/cac:PartyTaxScheme) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:Delivery/cac:DeliveryParty/cac:PartyTaxScheme) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R302]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:Delivery/cac:DeliveryParty/cac:PartyLegalEntity) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:Delivery/cac:DeliveryParty/cac:PartyLegalEntity) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R303]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:Delivery/cac:DeliveryParty/cac:Contact/cbc:ID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:Delivery/cac:DeliveryParty/cac:Contact/cbc:ID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R304]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:Delivery/cac:DeliveryParty/cac:Contact/cbc:Note) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:Delivery/cac:DeliveryParty/cac:Contact/cbc:Note) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R306]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:Delivery/cac:DeliveryParty/cac:OtherCommunication) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:Delivery/cac:DeliveryParty/cac:OtherCommunication) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R307]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:Delivery/cac:DeliveryParty/cac:Person) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:Delivery/cac:DeliveryParty/cac:Person) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R308]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:Delivery/cac:DeliveryParty/cac:AgentParty) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:Delivery/cac:DeliveryParty/cac:AgentParty) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R309]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:Delivery/cac:Despatch) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:Delivery/cac:Despatch) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R310]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:DeliveryTerms/cbc:LossRiskResponsibilityCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:DeliveryTerms/cbc:LossRiskResponsibilityCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R311]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:DeliveryTerms/cbc:LossRisk) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:DeliveryTerms/cbc:LossRisk) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R312]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:DeliveryTerms/cac:AllowanceCharge) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:DeliveryTerms/cac:AllowanceCharge) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R313]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:DeliveryTerms/cac:DeliveryLocation/cbc:Description) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:DeliveryTerms/cac:DeliveryLocation/cbc:Description) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R314]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:DeliveryTerms/cac:DeliveryLocation/cbc:Conditions) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:DeliveryTerms/cac:DeliveryLocation/cbc:Conditions) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R315]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:DeliveryTerms/cac:DeliveryLocation/cbc:CountrySubentity) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:DeliveryTerms/cac:DeliveryLocation/cbc:CountrySubentity) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R316]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:DeliveryTerms/cac:DeliveryLocation/cbc:CountrySubentityCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:DeliveryTerms/cac:DeliveryLocation/cbc:CountrySubentityCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R317]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:DeliveryTerms/cac:DeliveryLocation/cac:ValidityPeriod) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:DeliveryTerms/cac:DeliveryLocation/cac:ValidityPeriod) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R318]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:DeliveryTerms/cac:DeliveryLocation/cac:Address) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:DeliveryTerms/cac:DeliveryLocation/cac:Address) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R319]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:PaymentMeans) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:PaymentMeans) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R320]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:TransactionConditions) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:TransactionConditions) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R321]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:AllowanceCharge/cbc:ID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:AllowanceCharge/cbc:ID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R322]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:AllowanceCharge/cbc:AllowanceChargeReasonCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:AllowanceCharge/cbc:AllowanceChargeReasonCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R323]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:AllowanceCharge/cbc:MultiplierFactorNumeric) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:AllowanceCharge/cbc:MultiplierFactorNumeric) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R324]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:AllowanceCharge/cbc:PrepaidIndicator) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:AllowanceCharge/cbc:PrepaidIndicator) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R325]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:AllowanceCharge/cbc:SequenceNumeric) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:AllowanceCharge/cbc:SequenceNumeric) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R326]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:AllowanceCharge/cbc:BaseAmount) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:AllowanceCharge/cbc:BaseAmount) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R327]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:AllowanceCharge/cbc:AccountingCostCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:AllowanceCharge/cbc:AccountingCostCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R328]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:AllowanceCharge/cbc:AccountingCost) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:AllowanceCharge/cbc:AccountingCost) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R329]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:AllowanceCharge/cac:TaxCategory) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:AllowanceCharge/cac:TaxCategory) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R330]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:AllowanceCharge/cac:TaxTotal) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:AllowanceCharge/cac:TaxTotal) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R331]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:AllowanceCharge/cac:PaymentMeans) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:AllowanceCharge/cac:PaymentMeans) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R332]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:DestinationCountry) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:DestinationCountry) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R333]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:TaxTotal/cbc:RoundingAmount) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:TaxTotal/cbc:RoundingAmount) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R334]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:TaxTotal/cbc:TaxEvidenceIndicator) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:TaxTotal/cbc:TaxEvidenceIndicator) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R335]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:TaxTotal/cac:TaxSubtotal) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:TaxTotal/cac:TaxSubtotal) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R336]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:AnticipatedMonetaryTotal/cbc:TaxExclusiveAmount) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:AnticipatedMonetaryTotal/cbc:TaxExclusiveAmount) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R337]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:AnticipatedMonetaryTotal/cbc:TaxInclusiveAmount) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:AnticipatedMonetaryTotal/cbc:TaxInclusiveAmount) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R338]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:AnticipatedMonetaryTotal/cbc:PrepaidAmount) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:AnticipatedMonetaryTotal/cbc:PrepaidAmount) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R339]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:AnticipatedMonetaryTotal/cbc:PayableRoundingAmount) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:AnticipatedMonetaryTotal/cbc:PayableRoundingAmount) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R340]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cbc:SubstitutionStatusCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cbc:SubstitutionStatusCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R341]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:SellerProposedSubstituteLineItem) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:SellerProposedSubstituteLineItem) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R342]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:SellerSubstitutedLineItem) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:SellerSubstitutedLineItem) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R343]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:BuyerProposedSubstituteLineItem) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:BuyerProposedSubstituteLineItem) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R344]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:CatalogueLineReference) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:CatalogueLineReference) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R345]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:QuotationLineReference) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:QuotationLineReference) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R346]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:DocumentReference) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:DocumentReference) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R347]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cbc:SalesOrderID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cbc:SalesOrderID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R348]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cbc:Note) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cbc:Note) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R349]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cbc:UUID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cbc:UUID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R350]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cbc:LineStatusCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cbc:LineStatusCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R351]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cbc:MinimumQuantity) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cbc:MinimumQuantity) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R352]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cbc:MaximumQuantity) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cbc:MaximumQuantity) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R353]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cbc:MinimumBackorderQuantity) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cbc:MinimumBackorderQuantity) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R354]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cbc:MaximumBackorderQuantity) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cbc:MaximumBackorderQuantity) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R355]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cbc:InspectionMethodCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cbc:InspectionMethodCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R356]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cbc:BackOrderAllowedIndicator) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cbc:BackOrderAllowedIndicator) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R357]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cbc:AccountingCostCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cbc:AccountingCostCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R358]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:Delivery/cbc:ID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:Delivery/cbc:ID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R359]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:Delivery/cbc:Quantity) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:Delivery/cbc:Quantity) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R360]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:Delivery/cbc:MinimumQuantity) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:Delivery/cbc:MinimumQuantity) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R361]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:Delivery/cbc:MaximumQuantity) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:Delivery/cbc:MaximumQuantity) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R362]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:Delivery/cbc:ActualDeliveryTime) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:Delivery/cbc:ActualDeliveryTime) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R363]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:Delivery/cbc:LatestDeliveryDate) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:Delivery/cbc:LatestDeliveryDate) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R364]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:Delivery/cbc:LatestDeliveryTime) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:Delivery/cbc:LatestDeliveryTime) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R365]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:Delivery/cbc:TrackingID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:Delivery/cbc:TrackingID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R366]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:Delivery/cac:DeliveryAddress) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:Delivery/cac:DeliveryAddress) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R367]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:Delivery/cac:DeliveryLocation) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:Delivery/cac:DeliveryLocation) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R368]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:Delivery/cac:RequestedDeliveryPeriod/cbc:StartTime) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:Delivery/cac:RequestedDeliveryPeriod/cbc:StartTime) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R369]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:Delivery/cac:RequestedDeliveryPeriod/cbc:EndTime) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:Delivery/cac:RequestedDeliveryPeriod/cbc:EndTime) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R370]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:Delivery/cac:RequestedDeliveryPeriod/cbc:DurationMeasure) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:Delivery/cac:RequestedDeliveryPeriod/cbc:DurationMeasure) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R371]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:Delivery/cac:RequestedDeliveryPeriod/cbc:DescriptionCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:Delivery/cac:RequestedDeliveryPeriod/cbc:DescriptionCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R372]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:Delivery/cac:RequestedDeliveryPeriod/cbc:Description) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:Delivery/cac:RequestedDeliveryPeriod/cbc:Description) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R373]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:Delivery/cac:PromisedDeliveryPeriod) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:Delivery/cac:PromisedDeliveryPeriod) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R374]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:Delivery/cac:EstimatedDeliveryPeriod) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:Delivery/cac:EstimatedDeliveryPeriod) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R375]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:Delivery/cac:DeliveryParty) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:Delivery/cac:DeliveryParty) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R376]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:Delivery/cac:Despatch) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:Delivery/cac:Despatch) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R377]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:DeliveryTerms) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:DeliveryTerms) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R378]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:OriginatoriParty/cbc:MarkCareIndicator) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:OriginatoriParty/cbc:MarkCareIndicator) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R379]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:OriginatoriParty/cbc:MarkAttentionIndicator) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:OriginatoriParty/cbc:MarkAttentionIndicator) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R380]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:OriginatoriParty/cbc:WebsiteURI) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:OriginatoriParty/cbc:WebsiteURI) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R381]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:OriginatoriParty/cbc:LogoReferenceID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:OriginatoriParty/cbc:LogoReferenceID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R382]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:OriginatoriParty/cbc:EndpointID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:OriginatoriParty/cbc:EndpointID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R383]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:OriginatoriParty/cac:Language) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:OriginatoriParty/cac:Language) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R384]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:OriginatoriParty/cac:PostalAddress) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:OriginatoriParty/cac:PostalAddress) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R385]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:OriginatoriParty/cac:PhysicalLocation) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:OriginatoriParty/cac:PhysicalLocation) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R386]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:OriginatoriParty/cac:PartyTaxScheme) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:OriginatoriParty/cac:PartyTaxScheme) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R387]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:OriginatoriParty/cac:PartyLegalEntity) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:OriginatoriParty/cac:PartyLegalEntity) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R388]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:OriginatoriParty/cac:Contact) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:OriginatoriParty/cac:Contact) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R389]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:OriginatoriParty/cac:Person) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:OriginatoriParty/cac:Person) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R390]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:OriginatoriParty/cac:AgentParty) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:OriginatoriParty/cac:AgentParty) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R391]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:OrderedShipment) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:OrderedShipment) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R392]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:PricingReference) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:PricingReference) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R393]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:AllowanceCharge) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:AllowanceCharge) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R394]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:Price/cbc:PriceChangeReason) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:Price/cbc:PriceChangeReason) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R395]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:Price/cbc:PriceTypeCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:Price/cbc:PriceTypeCode) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R396]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:Price/cbc:PriceType) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:Price/cbc:PriceType) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R397]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:Price/cbc:OrderableUnitFactorRate) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:Price/cbc:OrderableUnitFactorRate) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R398]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:Price/cac:ValidityPeriod) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:Price/cac:ValidityPeriod) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R399]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:Price/cac:PriceList) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:Price/cac:PriceList) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R400]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:Price/cac:AllowanceCharge) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:Price/cac:AllowanceCharge) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R401]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:Item/cbc:PackQuantity) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:Item/cbc:PackQuantity) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R402]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:Item/cbc:PackSizeNumeric) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:Item/cbc:PackSizeNumeric) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R403]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:Item/cbc:CatalogueIndicator) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:Item/cbc:CatalogueIndicator) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R404]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:Item/cbc:HazardousRiskIndicator) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:Item/cbc:HazardousRiskIndicator) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R405]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:Item/cbc:AdditionalInformation) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:Item/cbc:AdditionalInformation) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R406]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:Item/cbc:Keyword) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:Item/cbc:Keyword) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R407]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:Item/cbc:BrandName) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:Item/cbc:BrandName) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R408]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:Item/cbc:ModelName) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:Item/cbc:ModelName) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R409]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cbc:ExtendedID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cbc:ExtendedID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R410]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cbc:PhysycalAttribute) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cbc:PhysycalAttribute) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R411]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cbc:MeasurementDimension) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cbc:MeasurementDimension) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R412]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cbc:IssuerParty) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:Item/cac:SellersItemIdentification/cbc:IssuerParty) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R413]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cbc:ExtendedID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cbc:ExtendedID) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R414]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cbc:PhysycalAttribute) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cbc:PhysycalAttribute) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R415]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cbc:MeasurementDimension) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cbc:MeasurementDimension) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R416]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cbc:IssuerParty) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:Item/cac:StandardItemIdentification/cbc:IssuerParty) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R417]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:Item/cac:BuyersItemIdentification) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:Item/cac:BuyersItemIdentification) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R418]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:Item/cac:CommodityClassification) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:Item/cac:CommodityClassification) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R419]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:Item/cac:ManufacturersItemIdentification) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:Item/cac:ManufacturersItemIdentification) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R420]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:Item/cac:CatalogueItemIdentification) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:Item/cac:CatalogueItemIdentification) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R421]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:Item/cac:AdditionalItemIdentification) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:Item/cac:AdditionalItemIdentification) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R422]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:Item/cac:CatalogueDocumentReference) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:Item/cac:CatalogueDocumentReference) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R423]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:Item/cac:ItemSpecificationDocumentReference) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:Item/cac:ItemSpecificationDocumentReference) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R424]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:Item/cac:OriginCountry) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:Item/cac:OriginCountry) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R425]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:Item/cac:OriginCountry) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:Item/cac:OriginCountry) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R425]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:Item/cac:HazardousItem) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:Item/cac:HazardousItem) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R427]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:Item/cac:ManufacturerParty) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:Item/cac:ManufacturerParty) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R428]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:Item/cac:InformationContentProviderParty) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:Item/cac:InformationContentProviderParty) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R429]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:Item/cac:OriginAddress) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:Item/cac:OriginAddress) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R430]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:Item/cac:ItemInstance) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:Item/cac:ItemInstance) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R431]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:Item/cac:ClassifiedTaxCategory) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:Item/cac:ClassifiedTaxCategory) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R432]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:Item/cac:AdditionalItemProperty/cac:UsabilityPeriod) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:Item/cac:AdditionalItemProperty/cac:UsabilityPeriod) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R433]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(not(cac:OrderLine/cac:LineItem/cac:Item/cac:AdditionalItemProperty/cac:ItemPropertyGroup) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">not(cac:OrderLine/cac:LineItem/cac:Item/cac:AdditionalItemProperty/cac:ItemPropertyGroup) and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R434]-A conformant CEN BII Order core data model SHOULD not have data elements not in the core.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(count(cbc:Note)&lt;=1 and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">count(cbc:Note)&lt;=1 and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R444]-Element 'Note' may occur at maximum 1 times.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(count(cac:ValidityPeriod)&lt;=1 and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">count(cac:ValidityPeriod)&lt;=1 and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R445]-Element 'Validity Period' may occur at maximum 1 times.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(count(cac:OrderDocumentReference)&lt;=1 and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">count(cac:OrderDocumentReference)&lt;=1 and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R446]-Element 'Order Document Reference' may occur at maximum 1 times.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(count(cac:Contract)&lt;=1 and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">count(cac:Contract)&lt;=1 and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R447]-Element 'Contract' may occur at maximum 1 times.</ns1:text>
            </ns1:failed-assert>
          </if>
          <if test="not(count(cac:Delivery)&lt;=1 and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">count(cac:Delivery)&lt;=1 and contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R448]-Element 'Delivery' may occur at maximum 1 times.</ns1:text>
            </ns1:failed-assert>
          </if>
        </ns0:rule>
        <next-match>
          <with-param as="xs:string*" name="schxslt:patterns-matched" select="($schxslt:patterns-matched, 'w339aac11')" />
        </next-match>
      </otherwise>
    </choose>
  </template>
  <template match="/ubl:Order/cac:Delivery/cac:DeliveryParty" mode="w339aac11" priority="0">
    <param as="xs:string*" name="schxslt:patterns-matched" />
    <choose>
      <when test="$schxslt:patterns-matched[. = 'w339aac11']">
        <ns0:rule xmlns:ns0="https://doi.org/10.5281/zenodo.1495494" pattern="w339aac11">
          <comment>WARNING: Rule for context "/ubl:Order/cac:Delivery/cac:DeliveryParty" shadowed by preceding rule</comment>
          <ns1:suppressed-rule xmlns:ns1="http://purl.oclc.org/dsdl/svrl">
            <attribute name="context">/ubl:Order/cac:Delivery/cac:DeliveryParty</attribute>
          </ns1:suppressed-rule>
        </ns0:rule>
        <next-match>
          <with-param as="xs:string*" name="schxslt:patterns-matched" select="$schxslt:patterns-matched" />
        </next-match>
      </when>
      <otherwise>
        <ns0:rule xmlns:ns0="https://doi.org/10.5281/zenodo.1495494" pattern="w339aac11">
          <ns1:fired-rule xmlns:ns1="http://purl.oclc.org/dsdl/svrl">
            <attribute name="context">/ubl:Order/cac:Delivery/cac:DeliveryParty</attribute>
          </ns1:fired-rule>
          <if test="not(count(cac:PartyName)&lt;=1 and contains(preceding::cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(preceding::cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0')))">
            <ns1:failed-assert xmlns:ns1="http://purl.oclc.org/dsdl/svrl" flag="warning" location="{schxslt:location(.)}">
              <attribute name="test">count(cac:PartyName)&lt;=1 and contains(preceding::cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0') or not (contains(preceding::cbc:CustomizationID, 'urn:www.cenbii.eu:transaction:biicoretrdm001:ver1.0'))</attribute>
              <ns1:text>[BIICORE-T01-R449]-Element 'PartyName' may occur at maximum 1 times</ns1:text>
            </ns1:failed-assert>
          </if>
        </ns0:rule>
        <next-match>
          <with-param as="xs:string*" name="schxslt:patterns-matched" select="($schxslt:patterns-matched, 'w339aac11')" />
        </next-match>
      </otherwise>
    </choose>
  </template>
  <function as="xs:string" name="schxslt:location">
    <param as="node()" name="node" />
    <variable as="xs:string*" name="segments">
      <for-each select="($node/ancestor-or-self::node())">
        <variable name="position">
          <number level="single" />
        </variable>
        <choose>
          <when test=". instance of element()">
            <value-of select="concat('Q{', namespace-uri(.), '}', local-name(.), '[', $position, ']')" />
          </when>
          <when test=". instance of attribute()">
            <value-of select="concat('@Q{', namespace-uri(.), '}', local-name(.))" />
          </when>
          <when test=". instance of processing-instruction()">
            <value-of select="concat('processing-instruction(&quot;', name(.), '&quot;)[', $position, ']')" />
          </when>
          <when test=". instance of comment()">
            <value-of select="concat('comment()[', $position, ']')" />
          </when>
          <when test=". instance of text()">
            <value-of select="concat('text()[', $position, ']')" />
          </when>
          <otherwise />
        </choose>
      </for-each>
    </variable>
    <value-of select="concat('/', string-join($segments, '/'))" />
  </function>
</transform>