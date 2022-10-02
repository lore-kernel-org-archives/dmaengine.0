Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6D45C43217
	for <dmaengine@archiver.kernel.org>; Sun,  2 Oct 2022 23:06:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229788AbiJBXGt (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Sun, 2 Oct 2022 19:06:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230494AbiJBXGb (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Sun, 2 Oct 2022 19:06:31 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD83112755;
        Sun,  2 Oct 2022 16:01:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DB0C2B80DD8;
        Sun,  2 Oct 2022 22:53:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AB50C433D6;
        Sun,  2 Oct 2022 22:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664751206;
        bh=JMY2yHIJQoF20ytPxniJHlxxD17968IV8wAg1htep04=;
        h=From:To:Cc:Subject:Date:From;
        b=EoHnISVlomnkC1QjeI96DW2l20KGSCsnZ2jvQR7mnmVdM3pECVlR8ym0PRZsgXh+f
         CHF+ZNY/K+4GRxAwxJfeKBRfKbMPtsmtl817flMZNWuN53jPJfc6eokokgs3Xq/xbU
         apRG11EVpkQQqJOz5F62GPmuF2IuIPGKTKrpbYght+874IiktaDlMekYzSNFSKyJwL
         tMpWd8LViuWQ6ko0j6QTCdvIyPKMP0giSQLFzQRxpwuaopfpeksw0tejokODKJpAUY
         M8bnphcGpqkRCvh4hjVEpjfN0KlxcgPOsvthTTO5QyTBz6MOuSfoH597wwcdwBs7OA
         j5Btkb+rYI1ow==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Swati Agarwal <swati.agarwal@xilinx.com>,
        Vinod Koul <vkoul@kernel.org>, Sasha Levin <sashal@kernel.org>,
        michal.simek@xilinx.com, radhey.shyam.pandey@xilinx.com,
        lars@metafoo.de, shravya.kumbham@xilinx.com,
        adrianml@alumnos.upm.es, dmaengine@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 4.14 1/6] dmaengine: xilinx_dma: cleanup for fetching xlnx,num-fstores property
Date:   Sun,  2 Oct 2022 18:53:16 -0400
Message-Id: <20221002225323.240142-1-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

From: Swati Agarwal <swati.agarwal@xilinx.com>

[ Upstream commit 462bce790e6a7e68620a4ce260cc38f7ed0255d5 ]

Free the allocated resources for missing xlnx,num-fstores property.

Signed-off-by: Swati Agarwal <swati.agarwal@xilinx.com>
Link: https://lore.kernel.org/r/20220817061125.4720-3-swati.agarwal@xilinx.com
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/dma/xilinx/xilinx_dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index 3c2084766a31..9319349e69d2 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -2565,7 +2565,7 @@ static int xilinx_dma_probe(struct platform_device *pdev)
 		if (err < 0) {
 			dev_err(xdev->dev,
 				"missing xlnx,num-fstores property\n");
-			return err;
+			goto disable_clks;
 		}
 
 		err = of_property_read_u32(node, "xlnx,flush-fsync",
-- 
2.35.1

