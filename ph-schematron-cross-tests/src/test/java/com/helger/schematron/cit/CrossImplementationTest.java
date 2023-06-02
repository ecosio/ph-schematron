package com.helger.schematron.cit;

import com.helger.commons.io.resource.ClassPathResource;
import com.helger.commons.io.resource.IReadableResource;
import com.helger.schematron.AbstractSchematronResource;
import com.helger.schematron.pure.SchematronResourcePure;
import com.helger.schematron.sch.SchematronResourceSCH;
import com.helger.schematron.svrl.AbstractSVRLMessage;
import com.helger.schematron.svrl.SVRLHelper;
import com.helger.schematron.svrl.SVRLMarshaller;
import com.helger.schematron.svrl.jaxb.SchematronOutputType;

import org.junit.Test;
import org.w3c.dom.Document;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

/**
 * Test class for cross implementation tests
 *
 * @author Stefan Katzensteiner
 */
public final class CrossImplementationTest {
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
  public void testCrossImplementationConsistencySimple () throws Exception {
    for (int i = 0; i < SCH.length; ++i) {

      String schPath = "external/test-sch/" + SCH[i];
      final IReadableResource aSchRes = new ClassPathResource(schPath);
      assertTrue(aSchRes.getPath(), aSchRes.exists());

      String xmlPath = "external/test-xml/" + XML[i];
      final IReadableResource aXmlRes = new ClassPathResource(xmlPath);
      assertTrue(aXmlRes.getPath(), aXmlRes.exists());

      List<AbstractSVRLMessage> svrlMessageSchList =
          validateAndExtractSVRLMessages(SchematronResourceSCH.fromClassPath(schPath), aXmlRes);

      List<AbstractSVRLMessage> svrlMessagePureList =
          validateAndExtractSVRLMessages(SchematronResourcePure.fromClassPath(schPath), aXmlRes);

      //Compare results

      if(svrlMessageSchList.size() != svrlMessagePureList.size()) {
        fail("Number of AbstractSVRLMessages is not equal");
      }

      for (AbstractSVRLMessage svrlMessageSch : svrlMessageSchList) {
        boolean current = false;
        for (AbstractSVRLMessage svrlMessagePure : svrlMessagePureList) {
          current = isSimilarAbstractSVRLMessage(svrlMessageSch, svrlMessagePure);
          if (current) {
            break;
          }
        }
        if (!current) {
          fail("No matching AbstractSVRLMessage found!");
        }
      }
    }
  }

  private List<AbstractSVRLMessage> validateAndExtractSVRLMessages(
      AbstractSchematronResource aSchematronRes,
      IReadableResource aXmlRes) throws Exception {

    assertTrue("invalid schematron", aSchematronRes.isValidSchematron());

    final Document aDoc = aSchematronRes.applySchematronValidation(aXmlRes);
    assertNotNull(aDoc);

    final SchematronOutputType aSVRL = new SVRLMarshaller().read(aDoc);
    assertNotNull(aSVRL);

    List<AbstractSVRLMessage> svrlMessageList = new ArrayList<>();
    svrlMessageList.addAll(SVRLHelper.getAllFailedAssertions(aSVRL));
    svrlMessageList.addAll(SVRLHelper.getAllSuccessfulReports(aSVRL));

    return svrlMessageList;
  }

  /**
   * Compare two AbstractSVRLMessages for similarity.
   * <p>
   * Note: location is not compared because SchematronResourceSCH and SchematronResourcePure
   *       return the same location in different form.
   *       /AAA[1] vs. /AAA
   *       /*:Order[namespace-uri()='urn:oasis:names:specification:ubl:schema:xsd:Order-2'][1] vs. /ubl:Order
   */
  public static boolean isSimilarAbstractSVRLMessage(AbstractSVRLMessage asm1, AbstractSVRLMessage asm2) {
    return Objects.equals(asm1.getDiagnisticReferences(), asm2.getDiagnisticReferences())
           && Objects.equals(asm1.getText(), asm2.getText())
           && Objects.equals(asm1.getID(), asm2.getID())
           //&& Objects.equals(asm1Location, asm2.getLocation())
           && Objects.equals(asm1.getTest(), asm2.getTest())
           && Objects.equals(asm1.getRole(), asm2.getRole())
           && Objects.equals(asm1.getFlag(), asm2.getFlag());
  }

}
