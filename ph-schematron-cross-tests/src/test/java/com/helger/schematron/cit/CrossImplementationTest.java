package com.helger.schematron.cit;

import com.helger.commons.collection.impl.CommonsArrayList;
import com.helger.commons.collection.impl.ICommonsList;
import com.helger.commons.io.resource.ClassPathResource;
import com.helger.commons.io.resource.IReadableResource;
import com.helger.schematron.ESchematronMode;
import com.helger.schematron.pure.SchematronResourcePure;
import com.helger.schematron.sch.SchematronResourceSCH;
import com.helger.schematron.schxslt.xslt2.SchematronResourceSchXslt_XSLT2;
import com.helger.schematron.svrl.SVRLMarshaller;
import com.helger.schematron.svrl.jaxb.SchematronOutputType;
import com.helger.schematron.testfiles.SchematronTestHelper;

import org.junit.Ignore;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.w3c.dom.Document;

import java.util.HashSet;
import java.util.Set;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

/**
 * Test class for cross implementation tests
 *
 * @author Stefan Katzensteiner
 */
public final class CrossImplementationTest {
  private static final Logger LOGGER = LoggerFactory.getLogger (CrossImplementationTest.class);
  private static final String [] SCH = new String [] { "valid01.sch",
                                                       "valid02.sch",
                                                       "valid03.sch",
                                                       "biicore/BIICORE-UBL-T01.sch",
                                                       "biirules/BIIRULES-UBL-T01.sch",
                                                       "VariableTests.sch" };
  private static final String [] XML = new String [] { "valid01.xml",
                                                       "valid01.xml",
                                                       "valid03.xml",
                                                       "goodOrder01.xml",
                                                       "goodOrder01.xml",
                                                       "valid01.xml" };

  @Test
  public void testCrossImplementationConsistencySchPure () throws Exception {
    for (int i = 0; i < SCH.length; ++i) {

      LOGGER.info("Schematron: " + SCH[i] + ", XML: " + XML[i]);

      //prep
      String schPath = "external/test-sch/" + SCH[i];
      final IReadableResource aSchRes = new ClassPathResource(schPath);
      assertTrue(aSchRes.getPath(), aSchRes.exists());

      String xmlPath = "external/test-xml/" + XML[i];
      final IReadableResource aXmlRes = new ClassPathResource(xmlPath);
      assertTrue(aXmlRes.getPath(), aXmlRes.exists());

      //schematron-sch
      SchematronResourceSCH aSchematronSchRes = SchematronResourceSCH.fromClassPath(schPath);
      assertTrue("invalid schematron", aSchematronSchRes.isValidSchematron());

      final Document aDocSch = aSchematronSchRes.applySchematronValidation(aXmlRes);
      assertNotNull(aDocSch);

      final SchematronOutputType aSVRLSch = new SVRLMarshaller().read(aDocSch);
      assertNotNull(aSVRLSch);

      //schematron-pure
      SchematronResourcePure aSchematronPureRes = SchematronResourcePure.fromClassPath(schPath);
      assertTrue("invalid schematron", aSchematronPureRes.isValidSchematron());

      final Document aDocPure = aSchematronPureRes.applySchematronValidation(aXmlRes);
      assertNotNull(aDocPure);

      final SchematronOutputType aSVRLPure = new SVRLMarshaller().read(aDocPure);
      assertNotNull(aSVRLPure);

      //match
      ISVRLMatcher svrlMatcher = new SVRLMatcher(
          ESchematronMode.SCHEMATRON,
          ESchematronMode.PURE,
          aSVRLSch,
          aSVRLPure);

      assertTrue(svrlMatcher.isSimilarSchematronOutputType());
    }
  }

  @Test
  public void testCrossImplementationConsistencySchSchXslt () throws Exception {
    for (int i = 0; i < SCH.length; ++i) {

      LOGGER.info("Schematron: " + SCH[i] + ", XML: " + XML[i]);

      //prep
      String schPath = "external/test-sch/" + SCH[i];
      final IReadableResource aSchRes = new ClassPathResource(schPath);
      assertTrue(aSchRes.getPath(), aSchRes.exists());

      String xmlPath = "external/test-xml/" + XML[i];
      final IReadableResource aXmlRes = new ClassPathResource(xmlPath);
      assertTrue(aXmlRes.getPath(), aXmlRes.exists());

      //schematron-sch
      SchematronResourceSCH aSchematronSchRes = SchematronResourceSCH.fromClassPath(schPath);
      assertTrue("invalid schematron", aSchematronSchRes.isValidSchematron());

      final Document aDocSch = aSchematronSchRes.applySchematronValidation(aXmlRes);
      assertNotNull(aDocSch);

      final SchematronOutputType aSVRLSch = new SVRLMarshaller().read(aDocSch);
      assertNotNull(aSVRLSch);

      //schematron-schxslt
      SchematronResourceSchXslt_XSLT2 aSchematronSchXsltRes =
          SchematronResourceSchXslt_XSLT2.fromClassPath(schPath);
      assertTrue("invalid schematron", aSchematronSchXsltRes.isValidSchematron());

      final Document aDocSchXslt = aSchematronSchXsltRes.applySchematronValidation(aXmlRes);
      assertNotNull(aDocSchXslt);

      final SchematronOutputType aSVRLSchXslt = new SVRLMarshaller().read(aDocSchXslt);
      assertNotNull(aSVRLSchXslt);

      //match
      ISVRLMatcher svrlMatcher = new SVRLMatcher(
          ESchematronMode.SCHEMATRON,
          ESchematronMode.SCHXSLT_XSLT2,
          aSVRLSch,
          aSVRLSchXslt);

      assertTrue(svrlMatcher.isSimilarSchematronOutputType());
    }
  }

  @Test
  @Ignore
  public void testValidSchematronsVsValidXmls () throws Exception {
    final ICommonsList <IReadableResource> aValidSchematrons = new CommonsArrayList <> ();
    for (final IReadableResource aRes : SchematronTestHelper.getAllValidSchematronFiles ())
      if (//aSchematronSchRes.isValidSchematron(): net.sf.saxon.s9api.SaxonApiException:
          // Errors were reported during stylesheet compilation
          !aRes.getPath ().endsWith ("/CellarBook.sch") &&
          //aSchematronSchRes.isValidSchematron(): net.sf.saxon.s9api.SaxonApiException:
          // Errors were reported during stylesheet compilation
          !aRes.getPath ().endsWith ("/schematron-svrl.sch") &&
          // external/test-sch/universalTests2.sch;external/test-xml/valid03.xml
          // https://github.com/phax/ph-schematron/issues/152
          !aRes.getPath ().endsWith ("/universalTests2.sch")
         )
        aValidSchematrons.add (aRes);

    Set<String> aSchematrons = new HashSet<>();

    for(IReadableResource aValidSchematron : aValidSchematrons) {
      for(IReadableResource aValidXml : SchematronTestHelper.getAllValidXMLFiles()) {

        LOGGER.info("Schematron: " + aValidSchematron.getPath() + ", XML: " + aValidXml.getPath());

        //prep
        final IReadableResource aSchRes = new ClassPathResource(aValidSchematron.getPath());
        assertTrue(aSchRes.getPath(), aSchRes.exists());

        final IReadableResource aXmlRes = new ClassPathResource(aValidXml.getPath());
        assertTrue(aXmlRes.getPath(), aXmlRes.exists());

        //schematron-sch
        SchematronResourceSCH aSchematronSchRes =
            SchematronResourceSCH.fromClassPath(aValidSchematron.getPath());
        assertTrue("invalid schematron", aSchematronSchRes.isValidSchematron());

        final Document aDocSch = aSchematronSchRes.applySchematronValidation(aXmlRes);
        assertNotNull(aDocSch);

        final SchematronOutputType aSVRLSch = new SVRLMarshaller().read(aDocSch);
        assertNotNull(aSVRLSch);

        //schematron-pure
        SchematronResourcePure aSchematronPureRes =
            SchematronResourcePure.fromClassPath(aValidSchematron.getPath());
        assertTrue("invalid schematron", aSchematronPureRes.isValidSchematron());

        final Document aDocPure = aSchematronPureRes.applySchematronValidation(aXmlRes);
        assertNotNull(aDocPure);

        final SchematronOutputType aSVRLPure = new SVRLMarshaller().read(aDocPure);
        assertNotNull(aSVRLPure);

        //match
        ISVRLMatcher svrlMatcher = new SVRLMatcher(
            ESchematronMode.SCHEMATRON,
            ESchematronMode.PURE,
            aSVRLSch,
            aSVRLPure);

        //assertTrue(svrlMatcher.isSimilarSchematronOutputType());
        if(!svrlMatcher.isSimilarSchematronOutputType()) {
          aSchematrons.add(aValidSchematron.getPath() + ";" + aValidXml.getPath());
        }
      }
    }

    System.out.println("----------------------------");
    System.out.println("----------------------------");
    aSchematrons.forEach(System.out::println);
  }

  @Test
  @Ignore
  public void testTester () throws Exception {
    /*
external/test-sch/universalTests.sch;external/test-xml/CellarBook.xml
external/test-sch/biirules/BIIRULES-UBL-T10.sch;external/test-xml/ADVORD_03_03_00_Order_v2p2.xml
external/test-sch/universalTests.sch;external/test-xml/badOrder01.xml
external/test-sch/xfront/tests/check-classifications.sch;external/test-xml/CellarBook.xml
external/test-sch/universalTests-xslt2-multidocument.sch;external/test-xml/ADVORD_03_03_00_Order_v2p2.xml
external/test-sch/biirules/BIIRULES-UBL-T02.sch;external/test-xml/BII03 Order example 01.xml
external/test-sch/biirules/BIIRULES-UBL-T02.sch;external/test-xml/badOrder01.xml
external/test-sch/universalTests-xslt2.sch;external/test-xml/BII03 Order example 01.xml
external/test-sch/universalTests-xslt2-multidocument.sch;external/test-xml/valid03.xml
external/test-sch/universalTests.sch;external/test-xml/valid01.xml
external/test-sch/universalTests-xslt2.sch;external/test-xml/CellarBook.xml
external/test-sch/universalTests-xslt2.sch;external/test-xml/valid01.xml
external/test-sch/nonat/NONAT-ubl-T17.sch;external/test-xml/ADVORD_03_03_00_Order_v2p2.xml
external/test-sch/universalTests.sch;external/test-xml/ADVORD_03_03_00_Order_v2p2.xml
external/test-sch/universalTests-xslt2-multidocument.sch;external/test-xml/badOrder01.xml
external/test-sch/universalTests-xslt2.sch;external/test-xml/ADVORD_03_03_00_Order_v2p2.xml
external/test-sch/universalTests-xslt2.sch;external/test-xml/badOrder01.xml
external/test-sch/universalTests-xslt2-multidocument.sch;external/test-xml/CellarBook.xml
external/test-sch/biirules/BIIRULES-Facturae-T10.sch;external/test-xml/ADVORD_03_03_00_Order_v2p2.xml
external/test-sch/universalTests-xslt2.sch;external/test-xml/goodOrder01.xml
external/test-sch/universalTests.sch;external/test-xml/BII03 Order example 01.xml
external/test-sch/biirules/BIIRULES-UBL-T03.sch;external/test-xml/badOrder01.xml
external/test-sch/universalTests-xslt2-multidocument.sch;external/test-xml/goodOrder01.xml
external/test-sch/universalTests-xslt2-multidocument.sch;external/test-xml/valid01.xml
external/test-sch/universalTests-xslt2.sch;external/test-xml/valid03.xml
external/test-sch/biirules/BIIRULES-UBL-T03.sch;external/test-xml/BII03 Order example 01.xml
external/test-sch/biirules/BIIRULES-UBL-T15.sch;external/test-xml/ADVORD_03_03_00_Order_v2p2.xml
external/test-sch/universalTests.sch;external/test-xml/valid03.xml
external/test-sch/universalTests.sch;external/test-xml/goodOrder01.xml
external/test-sch/universalTests-xslt2-multidocument.sch;external/test-xml/BII03 Order example 01.xml
external/test-sch/eugen/EUGEN-UBL-T19.sch;external/test-xml/badOrder01.xml
external/test-sch/biirules/BIIRULES-UBL-T14.sch;external/test-xml/ADVORD_03_03_00_Order_v2p2.xml
     */

      //prep
      String schPath = "external/test-sch/universalTests2.sch";
      final IReadableResource aSchRes = new ClassPathResource(schPath);
      assertTrue(aSchRes.getPath(), aSchRes.exists());

      String xmlPath = "external/test-xml/valid03.xml";
      final IReadableResource aXmlRes = new ClassPathResource(xmlPath);
      assertTrue(aXmlRes.getPath(), aXmlRes.exists());

      //schematron-sch
      SchematronResourceSCH aSchematronSchRes = SchematronResourceSCH.fromClassPath(schPath);
      assertTrue("invalid schematron", aSchematronSchRes.isValidSchematron());

      final Document aDocSch = aSchematronSchRes.applySchematronValidation(aXmlRes);
      assertNotNull(aDocSch);

      final SchematronOutputType aSVRLSch = new SVRLMarshaller().read(aDocSch);
      assertNotNull(aSVRLSch);

      //schematron-pure
      SchematronResourcePure aSchematronPureRes = SchematronResourcePure.fromClassPath(schPath);
      assertTrue("invalid schematron", aSchematronPureRes.isValidSchematron());

      final Document aDocPure = aSchematronPureRes.applySchematronValidation(aXmlRes);
      assertNotNull(aDocPure);

      final SchematronOutputType aSVRLPure = new SVRLMarshaller().read(aDocPure);
      assertNotNull(aSVRLPure);

      //match
      ISVRLMatcher svrlMatcher = new SVRLMatcher(
          ESchematronMode.SCHEMATRON,
          ESchematronMode.PURE,
          aSVRLSch,
          aSVRLPure);

      assertTrue(svrlMatcher.isSimilarSchematronOutputType());
  }

}
