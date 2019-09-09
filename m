Return-Path: <SRS0=Lu0e=XE=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56081C49ED7
	for <dmaengine@archiver.kernel.org>; Mon,  9 Sep 2019 06:35:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2FB7021924
	for <dmaengine@archiver.kernel.org>; Mon,  9 Sep 2019 06:35:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729708AbfIIGfj (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 9 Sep 2019 02:35:39 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:61519 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727174AbfIIGfj (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Mon, 9 Sep 2019 02:35:39 -0400
X-IronPort-AV: E=Sophos;i="5.64,483,1559487600"; 
   d="scan'208";a="25872153"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 09 Sep 2019 15:35:36 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id D5DE041A59F7;
        Mon,  9 Sep 2019 15:35:35 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     vinod.koul@intel.com
Cc:     dmaengine@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v3 4/4] dmaengine: rcar-dmac: Add dma-channel-mask property support
Date:   Mon,  9 Sep 2019 15:34:52 +0900
Message-Id: <1568010892-17606-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568010892-17606-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1568010892-17606-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

This patch adds dma-channel-mask property support not to reserve
some DMA channels for some reasons. (for example: a heterogeneous
CPU uses it.)

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/dma/sh/rcar-dmac.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
index 542786d..f06016d 100644
--- a/drivers/dma/sh/rcar-dmac.c
+++ b/drivers/dma/sh/rcar-dmac.c
@@ -203,7 +203,7 @@ struct rcar_dmac {
 
 	unsigned int n_channels;
 	struct rcar_dmac_chan *channels;
-	unsigned int channels_mask;
+	u32 channels_mask;
 
 	DECLARE_BITMAP(modules, 256);
 };
@@ -1810,7 +1810,15 @@ static int rcar_dmac_parse_of(struct device *dev, struct rcar_dmac *dmac)
 		return -EINVAL;
 	}
 
+	/*
+	 * If the driver is unable to read dma-channel-mask property,
+	 * the driver assumes that it can use all channels.
+	 */
 	dmac->channels_mask = GENMASK(dmac->n_channels - 1, 0);
+	of_property_read_u32(np, "dma-channel-mask", &dmac->channels_mask);
+
+	/* If the property has out-of-channel mask, this driver clears it */
+	dmac->channels_mask &= GENMASK(dmac->n_channels - 1, 0);
 
 	return 0;
 }
-- 
2.7.4

