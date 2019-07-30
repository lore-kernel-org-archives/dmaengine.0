Return-Path: <SRS0=kojw=V3=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FB9AC0650F
	for <dmaengine@archiver.kernel.org>; Tue, 30 Jul 2019 13:20:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 70522206E0
	for <dmaengine@archiver.kernel.org>; Tue, 30 Jul 2019 13:20:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="hGmfUxdC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730588AbfG3NUN (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Tue, 30 Jul 2019 09:20:13 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:56702 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727601AbfG3NUM (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Tue, 30 Jul 2019 09:20:12 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6UDK4j7109814;
        Tue, 30 Jul 2019 08:20:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1564492804;
        bh=A1hY1j0EjSsyhP7lVvn6SAE68U3tIYMeRYSABLOghr8=;
        h=From:To:CC:Subject:Date;
        b=hGmfUxdC91ECqh6zxCyML4ArKTwg2uJVxg0mQ87yKOpe7YOHb2nuHCw36KuTIHkLI
         TZ86a32tEWIp2Yyc9C6vPBLB/5zu0PaFOWlWQP+NrIH4iImehfs/ssZ/gQhCvJqfNn
         VvGcHxE3T/v1oIxvA4a5oxQq3RygXCrI1WzUyifg=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6UDK48A000583
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 30 Jul 2019 08:20:04 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 30
 Jul 2019 08:20:04 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 30 Jul 2019 08:20:04 -0500
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6UDK2Bt055518;
        Tue, 30 Jul 2019 08:20:02 -0500
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
To:     <vkoul@kernel.org>
CC:     <dan.j.williams@intel.com>, <dmaengine@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>
Subject: [PATCH] dmaengine: ti: edma: Remove 'Assignment in if condition'
Date:   Tue, 30 Jul 2019 16:20:06 +0300
Message-ID: <20190730132006.2790-1-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

While the compiler does not have problem with how it is implemented,
checkpatch does give en ERROR for this arrangement.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 drivers/dma/ti/edma.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/ti/edma.c b/drivers/dma/ti/edma.c
index fe468e2f7e67..6f2d6c592663 100644
--- a/drivers/dma/ti/edma.c
+++ b/drivers/dma/ti/edma.c
@@ -1832,7 +1832,6 @@ static enum dma_status edma_tx_status(struct dma_chan *chan,
 				      struct dma_tx_state *txstate)
 {
 	struct edma_chan *echan = to_edma_chan(chan);
-	struct virt_dma_desc *vdesc;
 	struct dma_tx_state txstate_tmp;
 	enum dma_status ret;
 	unsigned long flags;
@@ -1846,12 +1845,18 @@ static enum dma_status edma_tx_status(struct dma_chan *chan,
 	if (!txstate)
 		txstate = &txstate_tmp;
 
-	txstate->residue = 0;
 	spin_lock_irqsave(&echan->vchan.lock, flags);
-	if (echan->edesc && echan->edesc->vdesc.tx.cookie == cookie)
+	if (echan->edesc && echan->edesc->vdesc.tx.cookie == cookie) {
 		txstate->residue = edma_residue(echan->edesc);
-	else if ((vdesc = vchan_find_desc(&echan->vchan, cookie)))
-		txstate->residue = to_edma_desc(&vdesc->tx)->residue;
+	} else {
+		struct virt_dma_desc *vdesc = vchan_find_desc(&echan->vchan,
+							      cookie);
+
+		if (vdesc)
+			txstate->residue = to_edma_desc(&vdesc->tx)->residue;
+		else
+			txstate->residue = 0;
+	}
 
 	/*
 	 * Mark the cookie completed if the residue is 0 for non cyclic
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

