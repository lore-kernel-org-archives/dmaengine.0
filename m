Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D749C11F64
	for <dmaengine@archiver.kernel.org>; Thu,  1 Jul 2021 15:31:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1D6236141C
	for <dmaengine@archiver.kernel.org>; Thu,  1 Jul 2021 15:31:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233239AbhGAPe2 (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Thu, 1 Jul 2021 11:34:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233064AbhGAPe1 (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Thu, 1 Jul 2021 11:34:27 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D40AC061762;
        Thu,  1 Jul 2021 08:31:56 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id p8so8816479wrr.1;
        Thu, 01 Jul 2021 08:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=qN42ft8TO2D20OJfcUBVmNsGjubNKzxaIpoGBDjnO30=;
        b=Q7QeFRYl7E8TGVI6mpGHeYbpPhGVz34QWBhGzMMsjh4Bs6YWjM2qYqgmf0JRNBJy2a
         3lFCVl6R3hyIpFjKdgZkNYD5bD9CVRXcyIfLCeIamimChCDq7kslUlK7dFN7WiyZgpUI
         pPJ8EueVXNyQKlLN4tgYi5Lfzk+QnzKr0hiUcQskudq/84vuANguULX/weG/7mCLDWP4
         yMdxwZZihKgyWXuzbbx/Pm16tuOL4vXbVdSzSQuGXjOpH1WoEgfq56HIDPnkrTV74eb9
         uICaBniL/x9CXDDy1ASKA+KPBCFam8+J9SrY2O9Kk/eUm0jAxYKQOWzCnn1TxRPtmj0g
         6FVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=qN42ft8TO2D20OJfcUBVmNsGjubNKzxaIpoGBDjnO30=;
        b=PaXa6yoCWMlehVrVPLWskcCpsvxrob/TC/Btov3OC1RvVhaifeImcc8cJ7lM8DqfH0
         SBGzS/dHsWI5tfhg6+Zpmq2G7gcXb8+76SWZnM8cZsqmI0mfg3XSf97Y3Bd/wIONCTrg
         Yx7I53Ym9Bx6HXS2JNu9N296kMRf0vxrHtJjndvAFhqYwakH/9RJbvkSHB8mxKqee4na
         fUDGUSc+mgSciqjS/6nXwTCEsfa/3vPNTL0nACnLIVv73FhxMwgtRDt6JTUU4OgQtOe7
         ASOsVCUKHXUoeuphf4tPEIn6XXAVXmu1QkQ28wJAcwpUEbl2cqCBBxw7e1+Bt/uFUgct
         sd/A==
X-Gm-Message-State: AOAM531QmgMsSNShiwsfJtAu/yutHJckTCOx76sKaVBgFoa1VFvW4+oG
        D7S9RHfVl5XJuGtQYFt/9FunrSeUAIxCi93+
X-Google-Smtp-Source: ABdhPJyIwrGCUiIisBSvA/Fnc66c8FQsKA95biC021Cnax4FXkMb2O882/LBxxAptkQ4atwhOeO7mw==
X-Received: by 2002:a5d:5307:: with SMTP id e7mr242782wrv.353.1625153514460;
        Thu, 01 Jul 2021 08:31:54 -0700 (PDT)
Received: from pc ([196.235.73.129])
        by smtp.gmail.com with ESMTPSA id l20sm385220wmq.3.2021.07.01.08.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jul 2021 08:31:54 -0700 (PDT)
Date:   Thu, 1 Jul 2021 16:31:52 +0100
From:   Salah Triki <salah.triki@gmail.com>
To:     dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ppc4xx: replace sscanf() by kstrtoul()
Message-ID: <20210701153152.GA256018@pc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

Fix the checkpatch.pl warning: "Prefer kstrto<type> to single variable sscanf".

Signed-off-by: Salah Triki <salah.triki@gmail.com>
---
 drivers/dma/ppc4xx/adma.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/ppc4xx/adma.c b/drivers/dma/ppc4xx/adma.c
index df7704053d91..e2b5129c5f84 100644
--- a/drivers/dma/ppc4xx/adma.c
+++ b/drivers/dma/ppc4xx/adma.c
@@ -4319,6 +4319,7 @@ static ssize_t enable_store(struct device_driver *dev, const char *buf,
 			    size_t count)
 {
 	unsigned long val;
+	int err;
 
 	if (!count || count > 11)
 		return -EINVAL;
@@ -4327,7 +4328,10 @@ static ssize_t enable_store(struct device_driver *dev, const char *buf,
 		return -EFAULT;
 
 	/* Write a key */
-	sscanf(buf, "%lx", &val);
+	err = kstrtoul(buf, 16, &val);
+	if (err)
+		return err;
+
 	dcr_write(ppc440spe_mq_dcr_host, DCRN_MQ0_XORBA, val);
 	isync();
 
@@ -4368,7 +4372,7 @@ static ssize_t poly_store(struct device_driver *dev, const char *buf,
 			  size_t count)
 {
 	unsigned long reg, val;
-
+	int err;
 #ifdef CONFIG_440SP
 	/* 440SP uses default 0x14D polynomial only */
 	return -EINVAL;
@@ -4378,7 +4382,9 @@ static ssize_t poly_store(struct device_driver *dev, const char *buf,
 		return -EINVAL;
 
 	/* e.g., 0x14D or 0x11D */
-	sscanf(buf, "%lx", &val);
+	err = kstrtoul(buf, 16, &val);
+	if (err)
+		return err;
 
 	if (val & ~0x1FF)
 		return -EINVAL;
-- 
2.25.1

