Return-Path: <SRS0=64ix=DX=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A450C43457
	for <dmaengine@archiver.kernel.org>; Fri, 16 Oct 2020 00:03:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0C4F72087D
	for <dmaengine@archiver.kernel.org>; Fri, 16 Oct 2020 00:03:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733028AbgJPADM (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Thu, 15 Oct 2020 20:03:12 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:15299 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730479AbgJPADM (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Thu, 15 Oct 2020 20:03:12 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 5C93440114D4F8046D04;
        Fri, 16 Oct 2020 08:03:10 +0800 (CST)
Received: from SWX921481.china.huawei.com (10.126.203.187) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.487.0; Fri, 16 Oct 2020 08:03:01 +0800
From:   Barry Song <song.bao.hua@hisilicon.com>
To:     <vkoul@kernel.org>, <dmaengine@vger.kernel.org>
CC:     Barry Song <song.bao.hua@hisilicon.com>
Subject: [PATCH 08/10] dmaengine: moxart-dma: remove redundant irqsave and irqrestore in hardIRQ
Date:   Fri, 16 Oct 2020 12:59:19 +1300
Message-ID: <20201015235921.21224-9-song.bao.hua@hisilicon.com>
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

Signed-off-by: Barry Song <song.bao.hua@hisilicon.com>
---
 drivers/dma/moxart-dma.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/moxart-dma.c b/drivers/dma/moxart-dma.c
index 347146a6e1d0..74755093e14b 100644
--- a/drivers/dma/moxart-dma.c
+++ b/drivers/dma/moxart-dma.c
@@ -524,7 +524,6 @@ static irqreturn_t moxart_dma_interrupt(int irq, void *devid)
 	struct moxart_dmadev *mc = devid;
 	struct moxart_chan *ch = &mc->slave_chans[0];
 	unsigned int i;
-	unsigned long flags;
 	u32 ctrl;
 
 	dev_dbg(chan2dev(&ch->vc.chan), "%s\n", __func__);
@@ -541,14 +540,14 @@ static irqreturn_t moxart_dma_interrupt(int irq, void *devid)
 		if (ctrl & APB_DMA_FIN_INT_STS) {
 			ctrl &= ~APB_DMA_FIN_INT_STS;
 			if (ch->desc) {
-				spin_lock_irqsave(&ch->vc.lock, flags);
+				spin_lock(&ch->vc.lock);
 				if (++ch->sgidx < ch->desc->sglen) {
 					moxart_dma_start_sg(ch, ch->sgidx);
 				} else {
 					vchan_cookie_complete(&ch->desc->vd);
 					moxart_dma_start_desc(&ch->vc.chan);
 				}
-				spin_unlock_irqrestore(&ch->vc.lock, flags);
+				spin_unlock(&ch->vc.lock);
 			}
 		}
 
-- 
2.25.1

