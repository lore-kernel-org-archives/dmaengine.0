Return-Path: <SRS0=kZNx=DI=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E93BC4727E
	for <dmaengine@archiver.kernel.org>; Thu,  1 Oct 2020 16:47:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5B81A20872
	for <dmaengine@archiver.kernel.org>; Thu,  1 Oct 2020 16:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601570870;
	bh=6a+8ixGmdmsL/4zBV+7lpsad2j1JCLdaxnQN3mPa3io=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=vSRhAeS7bETrKgYvp2E+Ipy8YANl6WexWc3hSq9qZxPtzEA/BHP9AL25Uktn9ttln
	 mEL0BMugJlJQh7BRKnLxv9sUC7X+FSjuDpluJIuI54Yf5ERIzWZY/X3ITJOPBf1BfM
	 9NDwLkLBUtVngimdyo6tnTwZHCO6+zGJPtn7Nd1Q=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732213AbgJAQru (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Thu, 1 Oct 2020 12:47:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:56648 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732208AbgJAQru (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Thu, 1 Oct 2020 12:47:50 -0400
Received: from localhost.localdomain (unknown [122.167.37.56])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B30242075F;
        Thu,  1 Oct 2020 16:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601570869;
        bh=6a+8ixGmdmsL/4zBV+7lpsad2j1JCLdaxnQN3mPa3io=;
        h=From:To:Cc:Subject:Date:From;
        b=msdP9UgL72X7JI07hxNzqZIRteRlrvijr2QzPBCJS6TPNvgkRa+Z+dyp2sEYVU4sv
         +veMKQpuHZs92q3ylQ4MWINCkmXpcVDjTZrddtpo8F4D3V1s6ZcHaUXhky37Z9GREL
         KWWsWO4k9d8WeTWWfjpxOQWez0HuUda4WdOuiDiE=
From:   Vinod Koul <vkoul@kernel.org>
To:     dmaengine@vger.kernel.org
Cc:     Vinod Koul <vkoul@kernel.org>,
        Romain Perier <romain.perier@gmail.com>,
        Allen Pais <allen.lkml@gmail.com>
Subject: [PATCH] dmaengine: fsl: remove bad channel update
Date:   Thu,  1 Oct 2020 22:17:40 +0530
Message-Id: <20201001164740.178977-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

Commit 59cd818763e8 ("dmaengine: fsl: convert tasklets to use new
tasklet_setup() API") broke this driver by not removing the old channel
update method.

Fix this by remove the offending call as channel is queried from
tasklet structure.

Fixes: 59cd818763e8 ("dmaengine: fsl: convert tasklets to use new tasklet_setup() API")
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/dma/fsl_raid.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
index 1ddd7cee2e7a..fdf3500d96a9 100644
--- a/drivers/dma/fsl_raid.c
+++ b/drivers/dma/fsl_raid.c
@@ -163,8 +163,6 @@ static void fsl_re_dequeue(struct tasklet_struct *t)
 	unsigned int count, oub_count;
 	int found;
 
-	re_chan = dev_get_drvdata((struct device *)data);
-
 	fsl_re_cleanup_descs(re_chan);
 
 	spin_lock_irqsave(&re_chan->desc_lock, flags);
-- 
2.26.2

