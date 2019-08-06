Return-Path: <SRS0=hhcP=WC=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A694C32751
	for <dmaengine@archiver.kernel.org>; Tue,  6 Aug 2019 09:41:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3248A2147A
	for <dmaengine@archiver.kernel.org>; Tue,  6 Aug 2019 09:41:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732547AbfHFJlA (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Tue, 6 Aug 2019 05:41:00 -0400
Received: from mga01.intel.com ([192.55.52.88]:49741 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726713AbfHFJlA (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Tue, 6 Aug 2019 05:41:00 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Aug 2019 02:41:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,353,1559545200"; 
   d="scan'208";a="179104035"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 06 Aug 2019 02:40:58 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id DE8C0445; Tue,  6 Aug 2019 12:40:55 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org,
        Viresh Kumar <vireshk@kernel.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 09/12] dmaengine: dw: platform: Switch to acpi_dma_controller_register()
Date:   Tue,  6 Aug 2019 12:40:51 +0300
Message-Id: <20190806094054.64871-9-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190806094054.64871-1-andriy.shevchenko@linux.intel.com>
References: <20190806094054.64871-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

There is a possibility to have registered ACPI DMA controller
while it has been gone already.

To avoid the potential crash, move to non-managed
acpi_dma_controller_register().

Fixes: 42c91ee71d6d ("dw_dmac: add ACPI support")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/dma/dw/platform.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/dw/platform.c b/drivers/dma/dw/platform.c
index 45cf47ca922f..ea096cf6ee2b 100644
--- a/drivers/dma/dw/platform.c
+++ b/drivers/dma/dw/platform.c
@@ -84,13 +84,20 @@ static void dw_dma_acpi_controller_register(struct dw_dma *dw)
 	dma_cap_set(DMA_SLAVE, info->dma_cap);
 	info->filter_fn = dw_dma_acpi_filter;
 
-	ret = devm_acpi_dma_controller_register(dev, acpi_dma_simple_xlate,
-						info);
+	ret = acpi_dma_controller_register(dev, acpi_dma_simple_xlate, info);
 	if (ret)
 		dev_err(dev, "could not register acpi_dma_controller\n");
 }
+
+static void dw_dma_acpi_controller_free(struct dw_dma *dw)
+{
+	struct device *dev = dw->dma.dev;
+
+	acpi_dma_controller_free(dev);
+}
 #else /* !CONFIG_ACPI */
 static inline void dw_dma_acpi_controller_register(struct dw_dma *dw) {}
+static inline void dw_dma_acpi_controller_free(struct dw_dma *dw) {}
 #endif /* !CONFIG_ACPI */
 
 #ifdef CONFIG_OF
@@ -249,6 +256,9 @@ static int dw_remove(struct platform_device *pdev)
 	struct dw_dma_chip *chip = data->chip;
 	int ret;
 
+	if (ACPI_HANDLE(&pdev->dev))
+		dw_dma_acpi_controller_free(chip->dw);
+
 	if (pdev->dev.of_node)
 		of_dma_controller_free(pdev->dev.of_node);
 
-- 
2.20.1

