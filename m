Return-Path: <dmaengine-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0A39C7619A
	for <dmaengine@archiver.kernel.org>; Mon, 27 Mar 2023 09:48:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232738AbjC0Jsl (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Mon, 27 Mar 2023 05:48:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231740AbjC0Jsj (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Mon, 27 Mar 2023 05:48:39 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 396E04206
        for <dmaengine@vger.kernel.org>; Mon, 27 Mar 2023 02:48:37 -0700 (PDT)
Received: from ramsan.of.borg ([84.195.187.55])
        by xavier.telenet-ops.be with bizsmtp
        id dMob2900D1C8whw01MobGQ; Mon, 27 Mar 2023 11:48:35 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pgjSB-00Exm2-Fi;
        Mon, 27 Mar 2023 11:48:35 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pgjSs-003t8c-W8;
        Mon, 27 Mar 2023 11:48:35 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Vinod Koul <vkoul@kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Cc:     dmaengine@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dmaengine: sh: rz-dmac: Remove unused rz_dmac_chan.*_word_size
Date:   Mon, 27 Mar 2023 11:48:33 +0200
Message-Id: <021bdf56f1716276a55bcfb1ea81bba5f1d42b3d.1679910274.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

The src_word_size and dst_word_size members of the rz_dmac_chan
structure were never used, so they can be removed.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/dma/sh/rz-dmac.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c
index 6b62e01ba658ac13..9479f29692d3e3d7 100644
--- a/drivers/dma/sh/rz-dmac.c
+++ b/drivers/dma/sh/rz-dmac.c
@@ -67,8 +67,6 @@ struct rz_dmac_chan {
 	struct rz_dmac_desc *desc;
 	int descs_allocated;
 
-	enum dma_slave_buswidth src_word_size;
-	enum dma_slave_buswidth dst_word_size;
 	dma_addr_t src_per_address;
 	dma_addr_t dst_per_address;
 
@@ -603,9 +601,7 @@ static int rz_dmac_config(struct dma_chan *chan,
 	u32 val;
 
 	channel->src_per_address = config->src_addr;
-	channel->src_word_size = config->src_addr_width;
 	channel->dst_per_address = config->dst_addr;
-	channel->dst_word_size = config->dst_addr_width;
 
 	val = rz_dmac_ds_to_val_mapping(config->dst_addr_width);
 	if (val == CHCFG_DS_INVALID)
-- 
2.34.1

