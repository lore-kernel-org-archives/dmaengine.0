Return-Path: <SRS0=6Pif=X4=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEFFFC10F14
	for <dmaengine@archiver.kernel.org>; Thu,  3 Oct 2019 03:58:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A784D222C4
	for <dmaengine@archiver.kernel.org>; Thu,  3 Oct 2019 03:58:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728752AbfJCD6L (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 2 Oct 2019 23:58:11 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:9498 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728743AbfJCD6L (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Wed, 2 Oct 2019 23:58:11 -0400
X-IronPort-AV: E=Sophos;i="5.67,250,1566831600"; 
   d="scan'208";a="28166764"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 03 Oct 2019 12:58:07 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id CFE074009F62;
        Thu,  3 Oct 2019 12:58:06 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     vkoul@kernel.org
Cc:     dmaengine@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v4 3/3] dmaengine: rcar-dmac: Add dma-channel-mask property support
Date:   Thu,  3 Oct 2019 12:58:06 +0900
Message-Id: <1570075086-25126-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1570075086-25126-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1570075086-25126-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
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

