Return-Path: <SRS0=/BL3=Z4=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09687C2D0C0
	for <dmaengine@archiver.kernel.org>; Fri,  6 Dec 2019 13:53:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D50A120706
	for <dmaengine@archiver.kernel.org>; Fri,  6 Dec 2019 13:53:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726171AbfLFNxs (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Fri, 6 Dec 2019 08:53:48 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:49163 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726386AbfLFNxs (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Fri, 6 Dec 2019 08:53:48 -0500
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1idE3G-0008N9-Nb; Fri, 06 Dec 2019 14:53:46 +0100
Received: from sha by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1idE3F-0001E9-Nj; Fri, 06 Dec 2019 14:53:45 +0100
From:   Sascha Hauer <s.hauer@pengutronix.de>
To:     dmaengine@vger.kernel.org
Cc:     Vinod Koul <vkoul@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 1/5] dmaengine: virt-dma: Add missing locking around list operations
Date:   Fri,  6 Dec 2019 14:53:40 +0100
Message-Id: <20191206135344.29330-2-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191206135344.29330-1-s.hauer@pengutronix.de>
References: <20191206135344.29330-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: dmaengine@vger.kernel.org
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

All list operations are protected by &vc->lock. As vchan_vdesc_fini()
is called unlocked add the missing locking around the list operations.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/dma/virt-dma.h | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/virt-dma.h b/drivers/dma/virt-dma.h
index ab158bac03a7..41883ee2c29f 100644
--- a/drivers/dma/virt-dma.h
+++ b/drivers/dma/virt-dma.h
@@ -113,10 +113,15 @@ static inline void vchan_vdesc_fini(struct virt_dma_desc *vd)
 {
 	struct virt_dma_chan *vc = to_virt_chan(vd->tx.chan);
 
-	if (dmaengine_desc_test_reuse(&vd->tx))
+	if (dmaengine_desc_test_reuse(&vd->tx)) {
+		unsigned long flags;
+
+		spin_lock_irqsave(&vc->lock, flags);
 		list_add(&vd->node, &vc->desc_allocated);
-	else
+		spin_unlock_irqrestore(&vc->lock, flags);
+	} else {
 		vc->desc_free(vd);
+	}
 }
 
 /**
-- 
2.24.0

