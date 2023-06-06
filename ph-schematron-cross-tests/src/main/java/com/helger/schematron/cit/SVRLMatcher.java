package com.helger.schematron.cit;

import com.helger.schematron.ESchematronMode;
import com.helger.schematron.svrl.AbstractSVRLMessage;
import com.helger.schematron.svrl.SVRLHelper;
import com.helger.schematron.svrl.jaxb.SchematronOutputType;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

//Eine kleine Klasse, die die beiden Ergebnisse (SVRL) aufnimmt - und auf der ich dann die Vergleiche fahren kann
public class SVRLMatcher implements ISVRLMatcher {

  //Dauer der Prüfung
  //Basierend auf den Daten nette HTML/XML Reports erstellen
  //"SVRLDelta" Klasse machen, die aus einem "SVRLMatcher" rauskommt und ein Set von Deltas enthält

  private final ESchematronMode m_aImpl1;
  private final ESchematronMode m_aImpl2;
  private final SchematronOutputType m_aSvrl1;
  private final SchematronOutputType m_aSvrl2;

  public SVRLMatcher(ESchematronMode aImpl1, ESchematronMode aImpl2,
                     SchematronOutputType aSvrl1, SchematronOutputType aSvrl2) {

    if(aImpl1 != ESchematronMode.SCHEMATRON) {
      throw new IllegalArgumentException("First argument must be ESchematronMode.SCHEMATRON!");
    }
    if(!(aImpl2 == ESchematronMode.PURE || aImpl2 == ESchematronMode.SCHXSLT_XSLT2)) {
      throw new IllegalArgumentException("Second argument must be ESchematronMode.PURE or "
                                         + "ESchematronMode.SCHXSLT_XSLT2!");
    }

    this.m_aImpl1 = aImpl1;
    this.m_aImpl2 = aImpl2;
    this.m_aSvrl1 = aSvrl1;
    this.m_aSvrl2 = aSvrl2;
  }

  public boolean isSimilarSchematronOutputType() {
    List<AbstractSVRLMessage> svrlMessageListSvrl1= new ArrayList<>();
    svrlMessageListSvrl1.addAll(SVRLHelper.getAllFailedAssertions(m_aSvrl1));
    svrlMessageListSvrl1.addAll(SVRLHelper.getAllSuccessfulReports(m_aSvrl1));

    List<AbstractSVRLMessage> svrlMessageListSvrl2= new ArrayList<>();
    svrlMessageListSvrl2.addAll(SVRLHelper.getAllFailedAssertions(m_aSvrl2));
    svrlMessageListSvrl2.addAll(SVRLHelper.getAllSuccessfulReports(m_aSvrl2));

    if((svrlMessageListSvrl1.size() != svrlMessageListSvrl2.size())) {
      return false;
    }

    for (AbstractSVRLMessage svrlMessage1 : svrlMessageListSvrl1) {
      boolean current = false;
      for (AbstractSVRLMessage svrlMessage2 : svrlMessageListSvrl2) {
        if(m_aImpl2 == ESchematronMode.PURE) {
          current = SVRLMatcher.isSimilarSchPureAbstractSVRLMessage(svrlMessage1, svrlMessage2);
        } else if (m_aImpl2 == ESchematronMode.SCHXSLT_XSLT2) {
          current = SVRLMatcher.isSimilarSchSchXsltAbstractSVRLMessage(svrlMessage1, svrlMessage2);
        } else {
          throw new IllegalArgumentException("No isSimilar() implemented for ESchematronMode " + m_aImpl2);
        }
        if (current) {
          break;
        }
      }
      if (!current) {
        return false;
      }
    }

    return true;
  }

  /**
   * Compare sch and pure AbstractSVRLMessages for similarity.
   * <p>
   * Note: location is not compared because SchematronResourceSCH, SchematronResourcePure and
   *       SchematronResourceSchXslt_XSLT2 return the same location in different form.
   *       "/AAA[1]" vs. "/AAA" vs. "/Q{}AAA[1]"
   *       /*:Order[namespace-uri()='urn:oasis:names:specification:ubl:schema:xsd:Order-2'][1] vs. /ubl:Order
   */
  private static boolean isSimilarSchPureAbstractSVRLMessage(AbstractSVRLMessage asm1, AbstractSVRLMessage asm2) {
    return Objects.equals(asm1.getDiagnisticReferences(), asm2.getDiagnisticReferences())
           && Objects.equals(asm1.getText(), asm2.getText())
           && Objects.equals(asm1.getID(), asm2.getID())
           //&& Objects.equals(asm1Location, asm2.getLocation())
           && Objects.equals(asm1.getTest(), asm2.getTest())
           && Objects.equals(asm1.getRole(), asm2.getRole())
           && Objects.equals(asm1.getFlag(), asm2.getFlag());
  }

  /**
   * Compare two AbstractSVRLMessages for similarity.
   * <p>
   * Note: location is not compared because SchematronResourceSCH, SchematronResourcePure and
   *       SchematronResourceSchXslt_XSLT2 return the same location in different form.
   *       "/AAA[1]" vs. "/AAA" vs. "/Q{}AAA[1]"
   *       /*:Order[namespace-uri()='urn:oasis:names:specification:ubl:schema:xsd:Order-2'][1] vs. /ubl:Order
   * <p>
   * Note: text is not compared because SchematronResourceSCH and SchematronResourceSchXslt_XSLT2
   *       return the same text in different form.
   *       "AAA misses attribute name." vs. "AAA misses attribute [Span@0x6475e778: clazz=any; content=name]."
   */
  private static boolean isSimilarSchSchXsltAbstractSVRLMessage(AbstractSVRLMessage asm1, AbstractSVRLMessage asm2) {
    return Objects.equals(asm1.getDiagnisticReferences(), asm2.getDiagnisticReferences())
           //&& Objects.equals(asm1.getText(), asm2.getText())
           && Objects.equals(asm1.getID(), asm2.getID())
           //&& Objects.equals(asm1Location, asm2.getLocation())
           && Objects.equals(asm1.getTest(), asm2.getTest())
           && Objects.equals(asm1.getRole(), asm2.getRole())
           && Objects.equals(asm1.getFlag(), asm2.getFlag());
  }
}
