Return-Path: <SRS0=IPQN=XT=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3D28C432C1
	for <dmaengine@archiver.kernel.org>; Tue, 24 Sep 2019 08:51:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9B82F214D9
	for <dmaengine@archiver.kernel.org>; Tue, 24 Sep 2019 08:51:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726029AbfIXIvT (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Tue, 24 Sep 2019 04:51:19 -0400
Received: from mga03.intel.com ([134.134.136.65]:8091 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725943AbfIXIvT (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Tue, 24 Sep 2019 04:51:19 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Sep 2019 01:51:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,543,1559545200"; 
   d="scan'208";a="340015920"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 24 Sep 2019 01:51:17 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 62F4C1A1; Tue, 24 Sep 2019 11:51:16 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Viresh Kumar <vireshk@kernel.org>, dmaengine@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] dmaengine: dw: platform: Mark 'hclk' clock optional
Date:   Tue, 24 Sep 2019 11:51:16 +0300
Message-Id: <20190924085116.83683-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

On some platforms the clock can be fixed rate, always running one and
there is no need to do anything with it.

In order to support those platforms, switch to use optional clock.

Fixes: f8d9ddbc2851 ("Enable iDMA 32-bit on Intel Elkhart Lake")
Depends-on: 60b8f0ddf1a9 ("clk: Add (devm_)clk_get_optional() functions")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/dma/dw/platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/dw/platform.c b/drivers/dma/dw/platform.c
index 6a94f22b6637..bffc79a620ae 100644
--- a/drivers/dma/dw/platform.c
+++ b/drivers/dma/dw/platform.c
@@ -66,7 +66,7 @@ static int dw_probe(struct platform_device *pdev)
 
 	data->chip = chip;
 
-	chip->clk = devm_clk_get(chip->dev, "hclk");
+	chip->clk = devm_clk_get_optional(chip->dev, "hclk");
 	if (IS_ERR(chip->clk))
 		return PTR_ERR(chip->clk);
 	err = clk_prepare_enable(chip->clk);
-- 
2.23.0

