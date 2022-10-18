Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96C2BC4332F
	for <dmaengine@archiver.kernel.org>; Tue, 18 Oct 2022 08:39:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229770AbiJRIje (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Tue, 18 Oct 2022 04:39:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229957AbiJRIjc (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Tue, 18 Oct 2022 04:39:32 -0400
Received: from out30-131.freemail.mail.aliyun.com (out30-131.freemail.mail.aliyun.com [115.124.30.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69E866574;
        Tue, 18 Oct 2022 01:39:29 -0700 (PDT)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R991e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046049;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0VSTn1kW_1666082351;
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0VSTn1kW_1666082351)
          by smtp.aliyun-inc.com;
          Tue, 18 Oct 2022 16:39:26 +0800
From:   Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To:     peter.ujfalusi@gmail.com
Cc:     vkoul@kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
        Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH] dmaengine: ti: edma: Remove the unused function edma_and()
Date:   Tue, 18 Oct 2022 16:38:20 +0800
Message-Id: <20221018083820.25297-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

The function edma_and() is defined in the edma.c file, but not called
elsewhere, so remove this unused function.

drivers/dma/ti/edma.c:321:20: warning: unused function 'edma_and'.

Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=2430
Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/dma/ti/edma.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/dma/ti/edma.c b/drivers/dma/ti/edma.c
index fa06d7e6d8e3..9ea91c640c32 100644
--- a/drivers/dma/ti/edma.c
+++ b/drivers/dma/ti/edma.c
@@ -318,14 +318,6 @@ static inline void edma_modify(struct edma_cc *ecc, int offset, unsigned and,
 	edma_write(ecc, offset, val);
 }
 
-static inline void edma_and(struct edma_cc *ecc, int offset, unsigned and)
-{
-	unsigned val = edma_read(ecc, offset);
-
-	val &= and;
-	edma_write(ecc, offset, val);
-}
-
 static inline void edma_or(struct edma_cc *ecc, int offset, unsigned or)
 {
 	unsigned val = edma_read(ecc, offset);
-- 
2.20.1.7.g153144c

