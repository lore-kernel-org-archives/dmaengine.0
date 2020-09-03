Return-Path: <SRS0=MLMT=CM=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FAD1C2D0E2
	for <dmaengine@archiver.kernel.org>; Thu,  3 Sep 2020 20:26:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 83AD5206C0
	for <dmaengine@archiver.kernel.org>; Thu,  3 Sep 2020 20:26:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729107AbgICU00 (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Thu, 3 Sep 2020 16:26:26 -0400
Received: from foss.arm.com ([217.140.110.172]:40210 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729059AbgICU0Z (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Thu, 3 Sep 2020 16:26:25 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6B3121063;
        Thu,  3 Sep 2020 13:26:25 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.37])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7E8C43F71F;
        Thu,  3 Sep 2020 13:26:24 -0700 (PDT)
From:   Robin Murphy <robin.murphy@arm.com>
To:     vkoul@kernel.org
Cc:     dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 9/9] dmaengine: pl330: Drop local dma_parms
Date:   Thu,  3 Sep 2020 21:25:53 +0100
Message-Id: <c9e58882e33f22f9b0a6d65a5507e24004512148.1599164692.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.28.0.dirty
In-Reply-To: <cover.1599164692.git.robin.murphy@arm.com>
References: <cover.1599164692.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

Since commit f458488425f1 ("amba: Initialize dma_parms for amba
devices"), struct amba_device already provides a dma_parms structure,
so we can save allocating another one.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/dma/pl330.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
index 2c508ee672b9..3d784e99635b 100644
--- a/drivers/dma/pl330.c
+++ b/drivers/dma/pl330.c
@@ -460,9 +460,6 @@ struct pl330_dmac {
 	/* DMA-Engine Device */
 	struct dma_device ddma;
 
-	/* Holds info about sg limitations */
-	struct device_dma_parameters dma_parms;
-
 	/* Pool of descriptors available for the DMAC's channels */
 	struct list_head desc_pool;
 	/* To protect desc_pool manipulation */
@@ -3158,8 +3155,6 @@ pl330_probe(struct amba_device *adev, const struct amba_id *id)
 		}
 	}
 
-	adev->dev.dma_parms = &pl330->dma_parms;
-
 	/*
 	 * This is the limit for transfers with a buswidth of 1, larger
 	 * buswidths will have larger limits.
-- 
2.28.0.dirty

