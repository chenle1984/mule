/*
 * $Id$
 * --------------------------------------------------------------------------------------
 * Copyright (c) MuleSoft, Inc.  All rights reserved.  http://www.mulesoft.com
 *
 * The software in this package is published under the terms of the CPAL v1.0
 * license, a copy of which has been included with this distribution in the
 * LICENSE.txt file.
 */

package org.mule.transport.ssl;

import org.mule.tck.junit4.FunctionalTestCase;
import org.mule.tck.junit4.rule.DynamicPort;
import org.mule.tck.testmodels.mule.TestExceptionStrategy;
import org.mule.tck.testmodels.mule.TestExceptionStrategy.ExceptionCallback;
import org.mule.transport.ConnectException;

import org.junit.Rule;
import org.junit.Test;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

public class SslInvalidKeystoreTestCase extends FunctionalTestCase implements ExceptionCallback
{
    @Rule
    public DynamicPort port1 = new DynamicPort("port1");

    private Throwable exceptionFromSystemExceptionHandler;

    public SslInvalidKeystoreTestCase()
    {
        super();
        setStartContext(false);
    }

    @Override
    protected String getConfigResources()
    {
        return "ssl-missing-keystore-config.xml";
    }

    @Test
    public void startingSslMessageReceiverWithoutKeystoreShouldThrowConnectException() throws Exception
    {
        TestExceptionStrategy exceptionListener = new TestExceptionStrategy();
        exceptionListener.setExceptionCallback(this);

        muleContext.setExceptionListener(exceptionListener);
        muleContext.start();

        assertNotNull(exceptionFromSystemExceptionHandler);
        assertTrue(exceptionFromSystemExceptionHandler instanceof ConnectException);
        assertTrue(exceptionFromSystemExceptionHandler.getMessage().contains("tls-key-store"));
    }

    public void onException(Throwable t)
    {
        exceptionFromSystemExceptionHandler = t;
    }
}
