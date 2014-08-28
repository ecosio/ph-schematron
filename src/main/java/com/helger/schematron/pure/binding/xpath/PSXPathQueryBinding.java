/**
 * Copyright (C) 2014 phloc systems (www.phloc.com)
 * Copyright (C) 2014 Philip Helger (www.helger.com)
 * philip[at]helger[dot]com
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *         http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.helger.schematron.pure.binding.xpath;

import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.xml.xpath.XPathFunctionResolver;
import javax.xml.xpath.XPathVariableResolver;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotations.ReturnsMutableCopy;
import com.helger.commons.compare.ComparatorStringLongestFirst;
import com.helger.commons.log.InMemoryLogger;
import com.helger.commons.string.StringHelper;
import com.helger.schematron.SchematronException;
import com.helger.schematron.pure.binding.IPSQueryBinding;
import com.helger.schematron.pure.binding.SchematronBindException;
import com.helger.schematron.pure.bound.IPSBoundSchema;
import com.helger.schematron.pure.bound.xpath.PSXPathBoundSchema;
import com.helger.schematron.pure.errorhandler.IPSErrorHandler;
import com.helger.schematron.pure.model.PSParam;
import com.helger.schematron.pure.model.PSSchema;
import com.helger.schematron.pure.preprocess.PSPreprocessor;

/**
 * Default XPath/XSLT query binding
 *
 * @author Philip Helger
 */
public class PSXPathQueryBinding implements IPSQueryBinding
{
  public static final char PARAM_VARIABLE_PREFIX = '$';

  private static final Logger s_aLogger = LoggerFactory.getLogger (PSXPathQueryBinding.class);
  private static final PSXPathQueryBinding s_aInstance = new PSXPathQueryBinding ();

  private PSXPathQueryBinding ()
  {}

  @Nonnull
  public static PSXPathQueryBinding getInstance ()
  {
    return s_aInstance;
  }

  @Nonnull
  public String getNegatedTestExpression (@Nonnull final String sTest)
  {
    ValueEnforcer.notNull (sTest, "Test");

    if (sTest.startsWith ("not(") && sTest.endsWith (")"))
      return sTest.substring (4, sTest.length () - 2);

    return "not(" + sTest + ")";
  }

  @Nonnull
  @ReturnsMutableCopy
  public Map <String, String> getStringReplacementMap (@Nonnull final List <PSParam> aParams)
  {
    final Map <String, String> ret = new TreeMap <String, String> (new ComparatorStringLongestFirst ());
    for (final PSParam aParam : aParams)
      ret.put (PARAM_VARIABLE_PREFIX + aParam.getName (), aParam.getValue ());
    return ret;
  }

  @Nullable
  public static String getWithParamTextsReplacedStatic (@Nullable final String sText,
                                                        @Nullable final Map <String, String> aStringReplacements)
  {
    if (sText == null)
      return null;
    if (sText.indexOf (PARAM_VARIABLE_PREFIX) < 0)
    {
      // No replacement necessary
      return sText;
    }
    final String ret = StringHelper.replaceMultiple (sText, aStringReplacements);
    if (false && ret.indexOf (PARAM_VARIABLE_PREFIX) >= 0)
      s_aLogger.warn ("Text still contains variables after replacement: " + ret);
    return ret;
  }

  @Nullable
  public String getWithParamTextsReplaced (@Nullable final String sText,
                                           @Nullable final Map <String, String> aStringReplacements)
  {
    return getWithParamTextsReplacedStatic (sText, aStringReplacements);
  }

  @Nonnull
  public IPSBoundSchema bind (@Nonnull final PSSchema aSchema,
                              @Nullable final String sPhase,
                              @Nullable final IPSErrorHandler aCustomErrorListener) throws SchematronException
  {
    ValueEnforcer.notNull (aSchema, "Schema");
    final InMemoryLogger aLogger = new InMemoryLogger ();
    if (!aSchema.isValid (aLogger))
      throw new SchematronBindException ("The passed schema is not valid and can therefore not be bound: " +
                                         aLogger.getAllMessages ());

    PSSchema aSchemaToUse = aSchema;
    if (!aSchemaToUse.isPreprocessed ())
    {
      // Required for parameter resolution
      final PSPreprocessor aPreprocessor = new PSPreprocessor (this);

      // Keep as much of the original information as possible, as it is not our
      // goal to minify the scheme
      aPreprocessor.setKeepReports (true);
      aPreprocessor.setKeepDiagnostics (true);
      aPreprocessor.setKeepTitles (true);

      // Apply preprocessing
      aSchemaToUse = aPreprocessor.getForcedPreprocessedSchema (aSchema);
    }

    // TODO
    final XPathVariableResolver aXPVR = null;
    final XPathFunctionResolver aXPFR = null;
    return new PSXPathBoundSchema (this, aSchemaToUse, sPhase, aCustomErrorListener, aXPVR, aXPFR);
  }
}
