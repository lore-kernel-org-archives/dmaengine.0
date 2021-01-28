Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 382C0C433E0
	for <dmaengine@archiver.kernel.org>; Thu, 28 Jan 2021 08:47:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EAD2964DD1
	for <dmaengine@archiver.kernel.org>; Thu, 28 Jan 2021 08:47:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231687AbhA1Ipr (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Thu, 28 Jan 2021 03:45:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232227AbhA1Ioq (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Thu, 28 Jan 2021 03:44:46 -0500
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C30DCC061797
        for <dmaengine@vger.kernel.org>; Thu, 28 Jan 2021 00:45:01 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by baptiste.telenet-ops.be with bizsmtp
        id N8kx2400N4C55Sk018kx72; Thu, 28 Jan 2021 09:44:59 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1l52vB-001JYQ-CR; Thu, 28 Jan 2021 09:44:57 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1l52vA-009O1k-Vs; Thu, 28 Jan 2021 09:44:56 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 2/4] dmaengine: rcar-dmac: Add for_each_rcar_dmac_chan() helper
Date:   Thu, 28 Jan 2021 09:44:53 +0100
Message-Id: <20210128084455.2237256-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128084455.2237256-1-geert+renesas@glider.be>
References: <20210128084455.2237256-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

Add a helper macro for iterating over all DMAC channels, taking into
account the channel mask.  Use it where appropriate, to simplify code.

Restore "reverse Christmas tree" order of local variables while adding a
new variable.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v3:
  - Add Reviewed-by, Tested-by,
  - Place iterator after container being iterated,

v2:
  - Put the full loop control of for_each_rcar_dmac_chan() on a single
    line, to improve readability.
---
 drivers/dma/sh/rcar-dmac.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
index 4524718d4f90920e..83c9a5bd1077db3a 100644
--- a/drivers/dma/sh/rcar-dmac.c
+++ b/drivers/dma/sh/rcar-dmac.c
@@ -209,6 +209,10 @@ struct rcar_dmac {
 
 #define to_rcar_dmac(d)		container_of(d, struct rcar_dmac, engine)
 
+#define for_each_rcar_dmac_chan(i, dmac, chan)						\
+	for (i = 0, chan = &(dmac)->channels[0]; i < (dmac)->n_channels; i++, chan++)	\
+		if (!((dmac)->channels_mask & BIT(i))) continue; else
+
 /*
  * struct rcar_dmac_of_data - This driver's OF data
  * @chan_offset_base: DMAC channels base offset
@@ -817,15 +821,11 @@ static void rcar_dmac_chan_reinit(struct rcar_dmac_chan *chan)
 
 static void rcar_dmac_stop_all_chan(struct rcar_dmac *dmac)
 {
+	struct rcar_dmac_chan *chan;
 	unsigned int i;
 
 	/* Stop all channels. */
-	for (i = 0; i < dmac->n_channels; ++i) {
-		struct rcar_dmac_chan *chan = &dmac->channels[i];
-
-		if (!(dmac->channels_mask & BIT(i)))
-			continue;
-
+	for_each_rcar_dmac_chan(i, dmac, chan) {
 		/* Stop and reinitialize the channel. */
 		spin_lock_irq(&chan->lock);
 		rcar_dmac_chan_halt(chan);
@@ -1828,9 +1828,10 @@ static int rcar_dmac_probe(struct platform_device *pdev)
 		DMA_SLAVE_BUSWIDTH_2_BYTES | DMA_SLAVE_BUSWIDTH_4_BYTES |
 		DMA_SLAVE_BUSWIDTH_8_BYTES | DMA_SLAVE_BUSWIDTH_16_BYTES |
 		DMA_SLAVE_BUSWIDTH_32_BYTES | DMA_SLAVE_BUSWIDTH_64_BYTES;
+	const struct rcar_dmac_of_data *data;
+	struct rcar_dmac_chan *chan;
 	struct dma_device *engine;
 	struct rcar_dmac *dmac;
-	const struct rcar_dmac_of_data *data;
 	unsigned int i;
 	int ret;
 
@@ -1916,11 +1917,8 @@ static int rcar_dmac_probe(struct platform_device *pdev)
 
 	INIT_LIST_HEAD(&engine->channels);
 
-	for (i = 0; i < dmac->n_channels; ++i) {
-		if (!(dmac->channels_mask & BIT(i)))
-			continue;
-
-		ret = rcar_dmac_chan_probe(dmac, &dmac->channels[i], data, i);
+	for_each_rcar_dmac_chan(i, dmac, chan) {
+		ret = rcar_dmac_chan_probe(dmac, chan, data, i);
 		if (ret < 0)
 			goto error;
 	}
-- 
2.25.1

