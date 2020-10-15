Return-Path: <SRS0=64ix=DX=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB8F5C43467
	for <dmaengine@archiver.kernel.org>; Fri, 16 Oct 2020 00:03:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 683942083B
	for <dmaengine@archiver.kernel.org>; Fri, 16 Oct 2020 00:03:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727930AbgJPADI (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Thu, 15 Oct 2020 20:03:08 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:59268 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730479AbgJPADH (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Thu, 15 Oct 2020 20:03:07 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 7FC2CDA817BEFA42357C;
        Fri, 16 Oct 2020 08:03:05 +0800 (CST)
Received: from SWX921481.china.huawei.com (10.126.203.187) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.487.0; Fri, 16 Oct 2020 08:02:55 +0800
From:   Barry Song <song.bao.hua@hisilicon.com>
To:     <vkoul@kernel.org>, <dmaengine@vger.kernel.org>
CC:     Barry Song <song.bao.hua@hisilicon.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 04/10] dmaengine: tegra210-adma: remove redundant irqsave and irqrestore in hardIRQ
Date:   Fri, 16 Oct 2020 12:59:15 +1300
Message-ID: <20201015235921.21224-5-song.bao.hua@hisilicon.com>
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

Cc: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Jon Hunter <jonathanh@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Signed-off-by: Barry Song <song.bao.hua@hisilicon.com>
---
 drivers/dma/tegra210-adma.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/tegra210-adma.c b/drivers/dma/tegra210-adma.c
index c5fa2ef74abc..4735742e826d 100644
--- a/drivers/dma/tegra210-adma.c
+++ b/drivers/dma/tegra210-adma.c
@@ -408,19 +408,18 @@ static irqreturn_t tegra_adma_isr(int irq, void *dev_id)
 {
 	struct tegra_adma_chan *tdc = dev_id;
 	unsigned long status;
-	unsigned long flags;
 
-	spin_lock_irqsave(&tdc->vc.lock, flags);
+	spin_lock(&tdc->vc.lock);
 
 	status = tegra_adma_irq_clear(tdc);
 	if (status == 0 || !tdc->desc) {
-		spin_unlock_irqrestore(&tdc->vc.lock, flags);
+		spin_unlock(&tdc->vc.lock);
 		return IRQ_NONE;
 	}
 
 	vchan_cyclic_callback(&tdc->desc->vd);
 
-	spin_unlock_irqrestore(&tdc->vc.lock, flags);
+	spin_unlock(&tdc->vc.lock);
 
 	return IRQ_HANDLED;
 }
-- 
2.25.1

