package com.helger.schematron.cit;

import com.helger.commons.io.resource.ClassPathResource;
import com.helger.commons.io.resource.IReadableResource;
import com.helger.schematron.ESchematronMode;
import com.helger.schematron.pure.SchematronResourcePure;
import com.helger.schematron.sch.SchematronResourceSCH;
import com.helger.schematron.schxslt.xslt2.SchematronResourceSchXslt_XSLT2;
import com.helger.schematron.svrl.SVRLMarshaller;
import com.helger.schematron.svrl.jaxb.SchematronOutputType;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.w3c.dom.Document;

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
                                                       "biicore/BIICORE-UBL-T01.sch",
                                                       "biirules/BIIRULES-UBL-T01.sch",
                                                       "VariableTests.sch" };
  private static final String [] XML = new String [] { "valid01.xml",
                                                       "valid01.xml",
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

}
