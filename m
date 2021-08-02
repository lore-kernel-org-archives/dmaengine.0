Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5BEAC00143
	for <dmaengine@archiver.kernel.org>; Mon,  2 Aug 2021 12:05:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BDC2B60EFD
	for <dmaengine@archiver.kernel.org>; Mon,  2 Aug 2021 12:05:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233446AbhHBMFU (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 2 Aug 2021 08:05:20 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:38780 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S233557AbhHBMFU (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Mon, 2 Aug 2021 08:05:20 -0400
X-IronPort-AV: E=Sophos;i="5.84,288,1620658800"; 
   d="scan'208";a="89557449"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 02 Aug 2021 21:05:10 +0900
Received: from localhost.localdomain (unknown [10.226.92.138])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id BCDC54356346;
        Mon,  2 Aug 2021 21:05:08 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, dmaengine@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v6 2/3] dmaengine: Extend the dma_slave_width for 128 bytes
Date:   Mon,  2 Aug 2021 13:04:59 +0100
Message-Id: <20210802120500.7635-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210802120500.7635-1-biju.das.jz@bp.renesas.com>
References: <20210802120500.7635-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

Add DMA_SLAVE_BUSWIDTH_128_BYTES to dma_slave_width for DMA engines
and users to select 128 bytes as bus width.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v5-v6:
 * No change
v5:-
 * New patch
---
 include/linux/dmaengine.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
index 93c3ca5fdafd..e5c2c9e71bf1 100644
--- a/include/linux/dmaengine.h
+++ b/include/linux/dmaengine.h
@@ -380,6 +380,7 @@ enum dma_slave_buswidth {
 	DMA_SLAVE_BUSWIDTH_16_BYTES = 16,
 	DMA_SLAVE_BUSWIDTH_32_BYTES = 32,
 	DMA_SLAVE_BUSWIDTH_64_BYTES = 64,
+	DMA_SLAVE_BUSWIDTH_128_BYTES = 128,
 };
 
 /**
@@ -398,7 +399,7 @@ enum dma_slave_buswidth {
  * @src_addr_width: this is the width in bytes of the source (RX)
  * register where DMA data shall be read. If the source
  * is memory this may be ignored depending on architecture.
- * Legal values: 1, 2, 3, 4, 8, 16, 32, 64.
+ * Legal values: 1, 2, 3, 4, 8, 16, 32, 64, 128.
  * @dst_addr_width: same as src_addr_width but for destination
  * target (TX) mutatis mutandis.
  * @src_maxburst: the maximum number of words (note: words, as in
-- 
2.17.1

