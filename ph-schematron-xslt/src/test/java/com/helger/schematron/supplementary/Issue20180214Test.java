/*
 * Copyright (C) 2014-2023 Philip Helger (www.helger.com)
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
package com.helger.schematron.supplementary;

import static org.junit.Assert.assertTrue;

import java.io.File;

import org.junit.Test;

import com.helger.schematron.api.xslt.ISchematronXSLTBasedResource;
import com.helger.schematron.sch.SchematronResourceSCH;

public final class Issue20180214Test
{
  @Test
  public void testRead () throws Exception
  {
    final ISchematronXSLTBasedResource aRes = SchematronResourceSCH.fromFile (new File ("src/test/resources/external/issues/20180214/04-ESPD-Common-BR-rules.sch"));
    aRes.setAllowForeignElements (true);
    assertTrue (aRes.isValidSchematron ());
  }
}
