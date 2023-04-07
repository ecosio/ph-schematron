<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <title>BIIPROFILES T14 bound to UBL</title>
  <ns prefix="cbc" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" />
  <ns prefix="cac" uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" />
  <ns prefix="ubl" uri="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" />
  <phase id="BIIPROFILES_T14_phase">
    <active pattern="UBL-T14" />
  </phase>
  
  <pattern id="UBL-T14">
  <rule context="//cbc:ProfileID">
    <assert flag="fatal" test=". = 'urn:www.cenbii.eu:profile:bii05:ver1.0' or . = 'urn:www.cenbii.eu:profile:bii06:ver1.0' or . = 'urn:www.cenbii.eu:profile:bii07:ver1.0' or . = 'urn:www.cenbii.eu:profile:bii08:ver1.0' or . = 'urn:www.cenbii.eu:profile:bii13:ver1.0' or . = 'urn:www.cenbii.eu:profile:bii19:ver1.0'">[BIIPROFILE-T14-R001]-An invoice transaction T14 must only be used in CEN BII Profiles 5, 6, 7, 8, 13 or 19.</assert>
  </rule>
</pattern>
</schema>
