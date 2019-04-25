Return-Path: <SRS0=dFZC=S3=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F66CC10F03
	for <dmaengine@archiver.kernel.org>; Thu, 25 Apr 2019 03:55:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 54D05218AD
	for <dmaengine@archiver.kernel.org>; Thu, 25 Apr 2019 03:55:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388441AbfDYDy7 (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 24 Apr 2019 23:54:59 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:60687 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S2387786AbfDYDy7 (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Wed, 24 Apr 2019 23:54:59 -0400
X-UUID: 5db40ca606bf4d2983552bcff52703dc-20190425
X-UUID: 5db40ca606bf4d2983552bcff52703dc-20190425
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw02.mediatek.com
        (envelope-from <shun-chih.yu@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 1033662821; Thu, 25 Apr 2019 11:54:50 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 25 Apr 2019 11:54:47 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 25 Apr 2019 11:54:47 +0800
From:   <shun-chih.yu@mediatek.com>
To:     Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Dan Williams <dan.j.williams@intel.com>
CC:     <dmaengine@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <srv_wsdupstream@mediatek.com>,
        Shun-Chih Yu <shun-chih.yu@mediatek.com>
Subject: [PATCH 1/1] dmaengine: mediatek-cqdma: fix wrong register usage in mtk_cqdma_start
Date:   Thu, 25 Apr 2019 11:53:50 +0800
Message-ID: <1556164430-30724-1-git-send-email-shun-chih.yu@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-TM-SNTS-SMTP: FEA1B573FD70D5A9418479ABCC9C2A3B9372CB373A0E187D8A420144FC3FF66E2000:8
X-MTK:  N
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org
Message-ID: <20190425035350.Tn9GUxVmLK5jfLGBSw37nuzqKPg1TSrhx6LDPmZM-xY@z>

From: Shun-Chih Yu <shun-chih.yu@mediatek.com>

This patch fixes wrong register usage in the mtk_cqdma_start. The
destination register should be MTK_CQDMA_DST2 instead.

Fixes: b1f01e48df5a ("dmaengine: mediatek: Add MediaTek Command-Queue DMA controller for MT6765 SoC")
Signed-off-by: Shun-Chih Yu <shun-chih.yu@mediatek.com>
---
 drivers/dma/mediatek/mtk-cqdma.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/mediatek/mtk-cqdma.c b/drivers/dma/mediatek/mtk-cqdma.c
index 131f397..8148538 100644
--- a/drivers/dma/mediatek/mtk-cqdma.c
+++ b/drivers/dma/mediatek/mtk-cqdma.c
@@ -253,7 +253,7 @@ static void mtk_cqdma_start(struct mtk_cqdma_pchan *pc,
 #ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
 	mtk_dma_set(pc, MTK_CQDMA_DST2, cvd->dest >> MTK_CQDMA_ADDR2_SHFIT);
 #else
-	mtk_dma_set(pc, MTK_CQDMA_SRC2, 0);
+	mtk_dma_set(pc, MTK_CQDMA_DST2, 0);
 #endif
 
 	/* setup the length */
-- 
1.7.9.5

