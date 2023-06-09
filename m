Return-Path: <dmaengine-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF903C7EE2F
	for <dmaengine@archiver.kernel.org>; Fri,  9 Jun 2023 08:17:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240320AbjFIIRv (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Fri, 9 Jun 2023 04:17:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240248AbjFIIRm (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Fri, 9 Jun 2023 04:17:42 -0400
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E052D30ED;
        Fri,  9 Jun 2023 01:17:10 -0700 (PDT)
X-GND-Sasl: kory.maincent@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1686298626;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GiInZFwv5UYo7clt/bdC/mTWPa4mwyqkZum6ygvm/Fw=;
        b=AyqcItkyGQ0Nf2EBvxSv7WugPbRmP9c+lYLP5DnylOOr8hMKkR04j+iZovz+F6Wp8BgN4K
        ET+m7VZ0WgduGkgYOcPMuMqDxIVP+PNQrSlLNi4t0J1I+/AytTqLR2bQFKNO209gvp0Htg
        9WMvMBFy4d8MOHdOxVGKE6vXYLXDZcmazPW/t9fcwyhtvw8FuhVmImdrZIM40u8dC6Ucdp
        CZGdkSsHQRfsfGUbqqUqYjvyTDiG14dPadFX4RcVyQKcKhWwoqYZigiB/5mKNXQ9ecNTyY
        Dy67EsthO1953HjstPMYiuPVjHBQR7CDYyvMiHlnDfEpdnxQQVLZQLoxUrY7lg==
X-GND-Sasl: kory.maincent@bootlin.com
X-GND-Sasl: kory.maincent@bootlin.com
X-GND-Sasl: kory.maincent@bootlin.com
X-GND-Sasl: kory.maincent@bootlin.com
X-GND-Sasl: kory.maincent@bootlin.com
X-GND-Sasl: kory.maincent@bootlin.com
X-GND-Sasl: kory.maincent@bootlin.com
X-GND-Sasl: kory.maincent@bootlin.com
X-GND-Sasl: kory.maincent@bootlin.com
X-GND-Sasl: kory.maincent@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id BD163C0014;
        Fri,  9 Jun 2023 08:17:05 +0000 (UTC)
From:   =?UTF-8?q?K=C3=B6ry=20Maincent?= <kory.maincent@bootlin.com>
To:     Cai Huoqing <cai.huoqing@linux.dev>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Vinod Koul <vkoul@kernel.org>,
        Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Kory Maincent <kory.maincent@bootlin.com>
Subject: [PATCH 9/9] dmaengine: dw-edma: eDMA: Fix possible race condition in local setup
Date:   Fri,  9 Jun 2023 10:16:54 +0200
Message-Id: <20230609081654.330857-10-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230609081654.330857-1-kory.maincent@bootlin.com>
References: <20230609081654.330857-1-kory.maincent@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Spam-Score: 300
X-GND-Status: SPAM
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

From: Kory Maincent <kory.maincent@bootlin.com>

When writing the linked list elements and pointer the control need to be
written at the end. If the control is written and the SAR and DAR not
stored we could face a race condition. Added a memory barrier to make sure
the memory has been written.

Fixes: 7e4b8a4fbe2c ("dmaengine: Add Synopsys eDMA IP version 0 support")
Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---

This patch has not been tested since I don't have board with eDMA in local
setup.
---
 drivers/dma/dw-edma/dw-edma-v0-core.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-v0-core.c b/drivers/dma/dw-edma/dw-edma-v0-core.c
index a5d921ef54ec..612c8c49668f 100644
--- a/drivers/dma/dw-edma/dw-edma-v0-core.c
+++ b/drivers/dma/dw-edma/dw-edma-v0-core.c
@@ -284,10 +284,13 @@ static void dw_edma_v0_write_ll_data(struct dw_edma_chunk *chunk, int i,
 	if (chunk->chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL) {
 		struct dw_edma_v0_lli *lli = chunk->ll_region.vaddr.mem + ofs;
 
-		lli->control = control;
 		lli->transfer_size = size;
 		lli->sar.reg = sar;
 		lli->dar.reg = dar;
+
+		/* Make sure sar and dar is written before writing control */
+		dma_wmb();
+		lli->control = control;
 	} else {
 		struct dw_edma_v0_lli __iomem *lli = chunk->ll_region.vaddr.io + ofs;
 
@@ -306,8 +309,11 @@ static void dw_edma_v0_write_ll_link(struct dw_edma_chunk *chunk,
 	if (chunk->chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL) {
 		struct dw_edma_v0_llp *llp = chunk->ll_region.vaddr.mem + ofs;
 
-		llp->control = control;
 		llp->llp.reg = pointer;
+
+		/* Make sure sar and dar is written before writing control */
+		dma_wmb();
+		llp->control = control;
 	} else {
 		struct dw_edma_v0_llp __iomem *llp = chunk->ll_region.vaddr.io + ofs;
 
-- 
2.25.1

