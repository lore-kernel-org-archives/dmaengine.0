Return-Path: <SRS0=JF7x=DL=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F35F3C4363C
	for <dmaengine@archiver.kernel.org>; Sun,  4 Oct 2020 14:03:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9C6F02078E
	for <dmaengine@archiver.kernel.org>; Sun,  4 Oct 2020 14:03:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="se7uaugh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725934AbgJDODT (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Sun, 4 Oct 2020 10:03:19 -0400
Received: from crapouillou.net ([89.234.176.41]:51496 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725832AbgJDODS (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Sun, 4 Oct 2020 10:03:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1601820194; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:references; bh=+kBvwShC4Gx7sin5hKSSdtMTenpa8TP0h/xGioxBnLU=;
        b=se7uaughVO3b0Yn++zNO3uN1hAslCP79XvqWIrpU4Q7rBSPw4aoqr32279BSvkdv3L8dIH
        YLShPmrrkMf60HvOyhfzGVtCxTLvuX3QNtmoyc4mWDwbSxjzoDN/xhGvdqYn5ZIbBJ/n3f
        /CGr5TTBBch5sFtpzJ/kn7Gz6BsntHI=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     od@zcrc.me, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
        stable@vger.kernel.org, Artur Rojek <contact@artur-rojek.eu>
Subject: [PATCH] dma: dma-jz4780: Fix race in jz4780_dma_tx_status
Date:   Sun,  4 Oct 2020 16:03:07 +0200
Message-Id: <20201004140307.885556-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

The jz4780_dma_tx_status() function would check if a channel's cookie
state was set to 'completed', and if not, it would enter the critical
section. However, in that time frame, the jz4780_dma_chan_irq() function
was able to set the cookie to 'completed', and clear the jzchan->vchan
pointer, which was deferenced in the critical section of the first
function.

Fix this race by checking the channel's cookie state after entering the
critical function and not before.

Fixes: d894fc6046fe ("dmaengine: jz4780: add driver for the Ingenic JZ4780 DMA controller")
Cc: stable@vger.kernel.org # v4.0
Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Reported-by: Artur Rojek <contact@artur-rojek.eu>
Tested-by: Artur Rojek <contact@artur-rojek.eu>
---
 drivers/dma/dma-jz4780.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/dma-jz4780.c b/drivers/dma/dma-jz4780.c
index 8beed91428bd..a608efaa435f 100644
--- a/drivers/dma/dma-jz4780.c
+++ b/drivers/dma/dma-jz4780.c
@@ -639,11 +639,11 @@ static enum dma_status jz4780_dma_tx_status(struct dma_chan *chan,
 	unsigned long flags;
 	unsigned long residue = 0;
 
+	spin_lock_irqsave(&jzchan->vchan.lock, flags);
+
 	status = dma_cookie_status(chan, cookie, txstate);
 	if ((status == DMA_COMPLETE) || (txstate == NULL))
-		return status;
-
-	spin_lock_irqsave(&jzchan->vchan.lock, flags);
+		goto out_unlock_irqrestore;
 
 	vdesc = vchan_find_desc(&jzchan->vchan, cookie);
 	if (vdesc) {
@@ -660,6 +660,7 @@ static enum dma_status jz4780_dma_tx_status(struct dma_chan *chan,
 	    && jzchan->desc->status & (JZ_DMA_DCS_AR | JZ_DMA_DCS_HLT))
 		status = DMA_ERROR;
 
+out_unlock_irqrestore:
 	spin_unlock_irqrestore(&jzchan->vchan.lock, flags);
 	return status;
 }
-- 
2.28.0

