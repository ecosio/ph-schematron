/*
 * Copyright (C) 2014-2022 Philip Helger (www.helger.com)
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
package com.helger.schematron.pure.bound.xpath;

import javax.annotation.Nonnull;
import javax.annotation.concurrent.Immutable;
import javax.xml.xpath.XPathExpression;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.ReturnsMutableCopy;
import com.helger.commons.annotation.ReturnsMutableObject;
import com.helger.commons.collection.impl.ICommonsList;
import com.helger.commons.string.ToStringGenerator;
import com.helger.schematron.pure.model.PSRule;

/**
 * This class represents a single XPath-bound rule-element.
 *
 * @author Philip Helger
 */
@Immutable
public class PSXPathBoundRule
{
  private final PSRule m_aRule;
  private final String m_sRuleContext;
  private final XPathExpression m_aBoundRuleContext;
  private final ICommonsList <PSXPathBoundAssertReport> m_aBoundAssertReports;

  public PSXPathBoundRule (@Nonnull final PSRule aRule,
                           @Nonnull final String sRuleContext,
                           @Nonnull final XPathExpression aBoundRuleContext,
                           @Nonnull final ICommonsList <PSXPathBoundAssertReport> aBoundAssertReports)
  {
    ValueEnforcer.notNull (aRule, "Rule");
    ValueEnforcer.notEmpty (sRuleContext, "RuleContext");
    ValueEnforcer.notNull (aBoundRuleContext, "BoundRuleContext");
    ValueEnforcer.notNull (aBoundAssertReports, "BoundAssertReports");
    m_aRule = aRule;
    m_sRuleContext = sRuleContext;
    m_aBoundRuleContext = aBoundRuleContext;
    m_aBoundAssertReports = aBoundAssertReports;
  }

  @Nonnull
  public final PSRule getRule ()
  {
    return m_aRule;
  }

  @Nonnull
  public final String getRuleContext ()
  {
    return m_sRuleContext;
  }

  @Nonnull
  public final XPathExpression getBoundRuleContext ()
  {
    return m_aBoundRuleContext;
  }

  @Nonnull
  @ReturnsMutableObject
  public final ICommonsList <PSXPathBoundAssertReport> boundAssertReports ()
  {
    return m_aBoundAssertReports;
  }

  @Nonnull
  @ReturnsMutableCopy
  public final ICommonsList <PSXPathBoundAssertReport> getAllBoundAssertReports ()
  {
    return m_aBoundAssertReports.getClone ();
  }

  @Override
  public String toString ()
  {
    return new ToStringGenerator (this).append ("rule", m_aRule)
                                       .append ("ruleExpression", m_sRuleContext)
                                       .append ("boundRuleExpression", m_aBoundRuleContext)
                                       .append ("boundAssertReports", m_aBoundAssertReports)
                                       .getToString ();
  }
}
