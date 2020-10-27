Return-Path: <SRS0=4eMl=EC=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0230C388F9
	for <dmaengine@archiver.kernel.org>; Tue, 27 Oct 2020 21:56:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 68B00221FB
	for <dmaengine@archiver.kernel.org>; Tue, 27 Oct 2020 21:56:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S374676AbgJ0V45 (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Tue, 27 Oct 2020 17:56:57 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:6430 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S374670AbgJ0V44 (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Tue, 27 Oct 2020 17:56:56 -0400
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CLQXV0CN0z6yKD;
        Wed, 28 Oct 2020 05:56:58 +0800 (CST)
Received: from SWX921481.china.huawei.com (10.126.200.153) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.487.0; Wed, 28 Oct 2020 05:56:43 +0800
From:   Barry Song <song.bao.hua@hisilicon.com>
To:     <vkoul@kernel.org>, <dmaengine@vger.kernel.org>
CC:     <linuxarm@huawei.com>, Barry Song <song.bao.hua@hisilicon.com>
Subject: [PATCH v2 05/10] dmaengine: milbeaut-xdmac: remove redundant irqsave and irqrestore in hardIRQ
Date:   Wed, 28 Oct 2020 10:52:47 +1300
Message-ID: <20201027215252.25820-6-song.bao.hua@hisilicon.com>
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

Signed-off-by: Barry Song <song.bao.hua@hisilicon.com>
---
 drivers/dma/milbeaut-xdmac.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/milbeaut-xdmac.c b/drivers/dma/milbeaut-xdmac.c
index 85a597228fb0..584c931e807a 100644
--- a/drivers/dma/milbeaut-xdmac.c
+++ b/drivers/dma/milbeaut-xdmac.c
@@ -160,10 +160,9 @@ static irqreturn_t milbeaut_xdmac_interrupt(int irq, void *dev_id)
 {
 	struct milbeaut_xdmac_chan *mc = dev_id;
 	struct milbeaut_xdmac_desc *md;
-	unsigned long flags;
 	u32 val;
 
-	spin_lock_irqsave(&mc->vc.lock, flags);
+	spin_lock(&mc->vc.lock);
 
 	/* Ack and Stop */
 	val = FIELD_PREP(M10V_XDDSD_IS_MASK, 0x0);
@@ -177,7 +176,7 @@ static irqreturn_t milbeaut_xdmac_interrupt(int irq, void *dev_id)
 
 	milbeaut_xdmac_start(mc);
 out:
-	spin_unlock_irqrestore(&mc->vc.lock, flags);
+	spin_unlock(&mc->vc.lock);
 	return IRQ_HANDLED;
 }
 
-- 
2.25.1

