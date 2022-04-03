Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1598C433EF
	for <dmaengine@archiver.kernel.org>; Sun,  3 Apr 2022 12:35:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237664AbiDCMhD (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Sun, 3 Apr 2022 08:37:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236325AbiDCMhC (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Sun, 3 Apr 2022 08:37:02 -0400
X-Greylist: delayed 182 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 03 Apr 2022 05:35:02 PDT
Received: from cmccmta3.chinamobile.com (cmccmta3.chinamobile.com [221.176.66.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C5A1D12ACC
        for <dmaengine@vger.kernel.org>; Sun,  3 Apr 2022 05:35:02 -0700 (PDT)
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[172.16.121.3])
        by rmmx-syy-dmz-app11-12011 (RichMail) with SMTP id 2eeb624993bcb75-fb97d;
        Sun, 03 Apr 2022 20:31:58 +0800 (CST)
X-RM-TRANSID: 2eeb624993bcb75-fb97d
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from 192.168.125.128 (unknown[112.22.3.63])
        by rmsmtp-syy-appsvr02-12002 (RichMail) with SMTP id 2ee2624993b80a5-f0d37;
        Sun, 03 Apr 2022 20:31:57 +0800 (CST)
X-RM-TRANSID: 2ee2624993b80a5-f0d37
From:   jianchunfu <jianchunfu@cmss.chinamobile.com>
To:     vkoul@kernel.org
Cc:     dmaengine@vger.kernel.org,
        jianchunfu <jianchunfu@cmss.chinamobile.com>
Subject: [PATCH] dmaengine: ep93xx: Remove redundant word in comment
Date:   Sun,  3 Apr 2022 20:31:20 +0800
Message-Id: <20220403123120.7794-1-jianchunfu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.18.4
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

Remove the second 'to' which is repeated.

Signed-off-by: jianchunfu <jianchunfu@cmss.chinamobile.com>
---
 drivers/dma/ep93xx_dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/ep93xx_dma.c b/drivers/dma/ep93xx_dma.c
index 98f9ee703..971ff5f9a 100644
--- a/drivers/dma/ep93xx_dma.c
+++ b/drivers/dma/ep93xx_dma.c
@@ -132,7 +132,7 @@ struct ep93xx_dma_desc {
 /**
  * struct ep93xx_dma_chan - an EP93xx DMA M2P/M2M channel
  * @chan: dmaengine API channel
- * @edma: pointer to to the engine device
+ * @edma: pointer to the engine device
  * @regs: memory mapped registers
  * @irq: interrupt number of the channel
  * @clk: clock used by this channel
-- 
2.18.4



