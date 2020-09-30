Return-Path: <SRS0=+u/s=DH=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF9C7C4727E
	for <dmaengine@archiver.kernel.org>; Wed, 30 Sep 2020 12:17:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A693A2085B
	for <dmaengine@archiver.kernel.org>; Wed, 30 Sep 2020 12:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601468277;
	bh=JWcEpWeXXDgFpiksI0O40lx3I8r1hrk6QQ6Dic1xlCo=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=fSYO70YJl/Gtv3UAq5JIEoBtiHNvpWWigKKcuRIIO4ovYo/TZTYDqpYdzxJJ374sw
	 qJ/sX4RdSj1WTBhnX0C4vH0feaRUsiCFIZ0/JhDisP3KZ+AcpQ4xanZqBCa4zBI2Br
	 Ny24ir07KzMLWUDNhoFqBW8r/1epQdaZ2L1iJMeY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728042AbgI3MR5 (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 30 Sep 2020 08:17:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:48332 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727997AbgI3MR5 (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Wed, 30 Sep 2020 08:17:57 -0400
Received: from localhost.localdomain (unknown [122.179.64.44])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 32FBF20789;
        Wed, 30 Sep 2020 12:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601468276;
        bh=JWcEpWeXXDgFpiksI0O40lx3I8r1hrk6QQ6Dic1xlCo=;
        h=From:To:Cc:Subject:Date:From;
        b=EES+uOEo4PNouoawDgHJhLVFLBfnodhcQIRvne5YTTc4tD1MWS421Kquo1AoLw8Zh
         OevMWBCeoG4hxNWuUy8sMwOqggdwh/gSqKjXS+FUWIdR1jVTDV3UTkUnuWAcG1hux0
         /GbWTClxlDPOJDxYwxB26d/6VCdmbeW6BW5NDmkY=
From:   Vinod Koul <vkoul@kernel.org>
To:     dmaengine@vger.kernel.org
Cc:     Vinod Koul <vkoul@kernel.org>, kernel test robot <lkp@intel.com>,
        Allen Pais <allen.lkml@gmail.com>
Subject: [PATCH] dmaengine: pl330: fix argument for tasklet
Date:   Wed, 30 Sep 2020 17:47:35 +0530
Message-Id: <20200930121735.49699-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

Commit 59cd818763e8 ("dmaengine: fsl: convert tasklets to use new
tasklet_setup() API") converted the pl330 driver to use new tasklet
functions but missed that driver calls the tasklet function directly as
well, so update it.

Fixes: 59cd818763e8 ("dmaengine: fsl: convert tasklets to use new tasklet_setup() API")
Reported-by: kernel test robot <lkp@intel.com>
Cc: Allen Pais <allen.lkml@gmail.com>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/dma/pl330.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
index d98fb318dd2d..e9f0101d92fa 100644
--- a/drivers/dma/pl330.c
+++ b/drivers/dma/pl330.c
@@ -2484,7 +2484,7 @@ static void pl330_issue_pending(struct dma_chan *chan)
 	list_splice_tail_init(&pch->submitted_list, &pch->work_list);
 	spin_unlock_irqrestore(&pch->lock, flags);
 
-	pl330_tasklet((unsigned long)pch);
+	pl330_tasklet(&pch->task);
 }
 
 /*
-- 
2.26.2

