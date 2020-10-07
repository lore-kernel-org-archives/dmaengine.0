Return-Path: <SRS0=s11Q=DO=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51F38C4363C
	for <dmaengine@archiver.kernel.org>; Wed,  7 Oct 2020 08:31:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EF8B820B1F
	for <dmaengine@archiver.kernel.org>; Wed,  7 Oct 2020 08:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602059507;
	bh=BVxAdzWinbQ1U9T+9ex7WCAtfOn3r+IzHJEnVpg/Kts=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=N+q+ftjiWqiworJykr6IMbupVIBvGW6j5NodFln5f41HffHsRTNuafJSUUuB+SOlE
	 I858G3vs31BwE6eUPOFIYs3Q06rRIyKaXivNKGR/iiALFfck+9Rj2Trrw3G0G3+2iZ
	 ea+6ewCAXvsFoMxsWb6SmdSLlA80Pamg2uIdTSWo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727927AbgJGIbq (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 7 Oct 2020 04:31:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:58756 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726463AbgJGIbn (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Wed, 7 Oct 2020 04:31:43 -0400
Received: from localhost.localdomain (unknown [122.171.222.162])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 612AC2076C;
        Wed,  7 Oct 2020 08:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602059503;
        bh=BVxAdzWinbQ1U9T+9ex7WCAtfOn3r+IzHJEnVpg/Kts=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ak6duaGaC7SFSExgrU2B2eNxxVs9YVb9Lt9qFWdJ0cec+qASKTwBWfRO9LcucsZ0p
         osRcM6URQ9Rsh0/2t6yZmViO2Kja3+DLWgXxti9GXQWKA3nOPxnfdIxQES/OUwecyo
         t0U6To7kSumJehY7Ij+OBYMWojaFmOYVDLqpO0kM=
From:   Vinod Koul <vkoul@kernel.org>
To:     dmaengine@vger.kernel.org
Cc:     Vinod Koul <vkoul@kernel.org>, Allen Pais <allen.lkml@gmail.com>,
        Romain Perier <romain.perier@gmail.com>,
        linux-kernel@vger.kernel.org,
        Michal Simek <michal.simek@xilinx.com>,
        =?UTF-8?q?Rafa=C5=82=20Hibner?= <rafal.hibner@secom.com.pl>
Subject: [PATCH 4/5] dmaengine: zynqmp_dma: fix kernel-doc style for tasklet
Date:   Wed,  7 Oct 2020 14:01:12 +0530
Message-Id: <20201007083113.567559-5-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201007083113.567559-1-vkoul@kernel.org>
References: <20201007083113.567559-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

Commit f19a11d40a78 ("dmaengine: xilinx: convert tasklets to use new
tasklet_setup() API") updated driver to use new tasklet_setup() API but
missed to update the documentation for the tasklet function.

Fixes: f19a11d40a78 ("dmaengine: xilinx: convert tasklets to use new tasklet_setup() API")
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/dma/xilinx/zynqmp_dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
index 15b0f961fdf8..d8419565b92c 100644
--- a/drivers/dma/xilinx/zynqmp_dma.c
+++ b/drivers/dma/xilinx/zynqmp_dma.c
@@ -742,7 +742,7 @@ static irqreturn_t zynqmp_dma_irq_handler(int irq, void *data)
 
 /**
  * zynqmp_dma_do_tasklet - Schedule completion tasklet
- * @data: Pointer to the ZynqMP DMA channel structure
+ * @t: Pointer to the ZynqMP DMA channel structure
  */
 static void zynqmp_dma_do_tasklet(struct tasklet_struct *t)
 {
-- 
2.26.2

