Return-Path: <SRS0=64ix=DX=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6121CC43467
	for <dmaengine@archiver.kernel.org>; Fri, 16 Oct 2020 00:03:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2196920B1F
	for <dmaengine@archiver.kernel.org>; Fri, 16 Oct 2020 00:03:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728307AbgJPADC (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Thu, 15 Oct 2020 20:03:02 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:15298 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727930AbgJPADC (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Thu, 15 Oct 2020 20:03:02 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 4080FE96A5827965AF21;
        Fri, 16 Oct 2020 08:03:00 +0800 (CST)
Received: from SWX921481.china.huawei.com (10.126.203.187) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.487.0; Fri, 16 Oct 2020 08:02:53 +0800
From:   Barry Song <song.bao.hua@hisilicon.com>
To:     <vkoul@kernel.org>, <dmaengine@vger.kernel.org>
CC:     Barry Song <song.bao.hua@hisilicon.com>,
        Green Wan <green.wan@sifive.com>
Subject: [PATCH 03/10] dmaengine: sf-pdma: remove redundant irqsave and irqrestore in hardIRQ
Date:   Fri, 16 Oct 2020 12:59:14 +1300
Message-ID: <20201015235921.21224-4-song.bao.hua@hisilicon.com>
X-Mailer: git-send-email 2.21.0.windows.1
In-Reply-To: <20201015235921.21224-1-song.bao.hua@hisilicon.com>
References: <20201015235921.21224-1-song.bao.hua@hisilicon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.126.203.187]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

Running in hardIRQ, disabling IRQ is redundant.

Cc: Green Wan <green.wan@sifive.com>
Signed-off-by: Barry Song <song.bao.hua@hisilicon.com>
---
 drivers/dma/sf-pdma/sf-pdma.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/sf-pdma/sf-pdma.c b/drivers/dma/sf-pdma/sf-pdma.c
index 528deb5d9f31..981ddcc42d70 100644
--- a/drivers/dma/sf-pdma/sf-pdma.c
+++ b/drivers/dma/sf-pdma/sf-pdma.c
@@ -326,10 +326,9 @@ static irqreturn_t sf_pdma_done_isr(int irq, void *dev_id)
 {
 	struct sf_pdma_chan *chan = dev_id;
 	struct pdma_regs *regs = &chan->regs;
-	unsigned long flags;
 	u64 residue;
 
-	spin_lock_irqsave(&chan->vchan.lock, flags);
+	spin_lock(&chan->vchan.lock);
 	writel((readl(regs->ctrl)) & ~PDMA_DONE_STATUS_MASK, regs->ctrl);
 	residue = readq(regs->residue);
 
@@ -346,7 +345,7 @@ static irqreturn_t sf_pdma_done_isr(int irq, void *dev_id)
 		sf_pdma_xfer_desc(chan);
 	}
 
-	spin_unlock_irqrestore(&chan->vchan.lock, flags);
+	spin_unlock(&chan->vchan.lock);
 
 	return IRQ_HANDLED;
 }
@@ -355,11 +354,10 @@ static irqreturn_t sf_pdma_err_isr(int irq, void *dev_id)
 {
 	struct sf_pdma_chan *chan = dev_id;
 	struct pdma_regs *regs = &chan->regs;
-	unsigned long flags;
 
-	spin_lock_irqsave(&chan->lock, flags);
+	spin_lock(&chan->lock);
 	writel((readl(regs->ctrl)) & ~PDMA_ERR_STATUS_MASK, regs->ctrl);
-	spin_unlock_irqrestore(&chan->lock, flags);
+	spin_unlock(&chan->lock);
 
 	tasklet_schedule(&chan->err_tasklet);
 
-- 
2.25.1

