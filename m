Return-Path: <SRS0=4eMl=EC=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD239C4363A
	for <dmaengine@archiver.kernel.org>; Tue, 27 Oct 2020 21:56:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 54D4E20829
	for <dmaengine@archiver.kernel.org>; Tue, 27 Oct 2020 21:56:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S374671AbgJ0V4p (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Tue, 27 Oct 2020 17:56:45 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:5581 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S374667AbgJ0V4p (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Tue, 27 Oct 2020 17:56:45 -0400
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CLQXH4W3Nzhc2R;
        Wed, 28 Oct 2020 05:56:47 +0800 (CST)
Received: from SWX921481.china.huawei.com (10.126.200.153) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.487.0; Wed, 28 Oct 2020 05:56:37 +0800
From:   Barry Song <song.bao.hua@hisilicon.com>
To:     <vkoul@kernel.org>, <dmaengine@vger.kernel.org>
CC:     <linuxarm@huawei.com>, Barry Song <song.bao.hua@hisilicon.com>,
        "Peter Ujfalusi" <peter.ujfalusi@ti.com>
Subject: [PATCH v2 02/10] dmaengine: ti: k3-udma: remove redundant irqsave and irqrestore in hardIRQ
Date:   Wed, 28 Oct 2020 10:52:44 +1300
Message-ID: <20201027215252.25820-3-song.bao.hua@hisilicon.com>
X-Mailer: git-send-email 2.21.0.windows.1
In-Reply-To: <20201027215252.25820-1-song.bao.hua@hisilicon.com>
References: <20201027215252.25820-1-song.bao.hua@hisilicon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.126.200.153]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

Running in hardIRQ, disabling IRQ is redundant since hardIRQ has disabled
IRQ. This patch removes the irqsave and irqstore to save some instruction
cycles.

Acked-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
Signed-off-by: Barry Song <song.bao.hua@hisilicon.com>
---
 drivers/dma/ti/k3-udma.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index 82cf6c77f5c9..e508280b3d70 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -1020,13 +1020,12 @@ static irqreturn_t udma_ring_irq_handler(int irq, void *data)
 {
 	struct udma_chan *uc = data;
 	struct udma_desc *d;
-	unsigned long flags;
 	dma_addr_t paddr = 0;
 
 	if (udma_pop_from_ring(uc, &paddr) || !paddr)
 		return IRQ_HANDLED;
 
-	spin_lock_irqsave(&uc->vc.lock, flags);
+	spin_lock(&uc->vc.lock);
 
 	/* Teardown completion message */
 	if (cppi5_desc_is_tdcm(paddr)) {
@@ -1077,7 +1076,7 @@ static irqreturn_t udma_ring_irq_handler(int irq, void *data)
 		}
 	}
 out:
-	spin_unlock_irqrestore(&uc->vc.lock, flags);
+	spin_unlock(&uc->vc.lock);
 
 	return IRQ_HANDLED;
 }
@@ -1086,9 +1085,8 @@ static irqreturn_t udma_udma_irq_handler(int irq, void *data)
 {
 	struct udma_chan *uc = data;
 	struct udma_desc *d;
-	unsigned long flags;
 
-	spin_lock_irqsave(&uc->vc.lock, flags);
+	spin_lock(&uc->vc.lock);
 	d = uc->desc;
 	if (d) {
 		d->tr_idx = (d->tr_idx + 1) % d->sglen;
@@ -1103,7 +1101,7 @@ static irqreturn_t udma_udma_irq_handler(int irq, void *data)
 		}
 	}
 
-	spin_unlock_irqrestore(&uc->vc.lock, flags);
+	spin_unlock(&uc->vc.lock);
 
 	return IRQ_HANDLED;
 }
-- 
2.25.1

