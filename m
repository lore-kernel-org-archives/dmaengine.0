Return-Path: <dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D0CDC00143
	for <dmaengine@archiver.kernel.org>; Thu, 26 Aug 2021 09:47:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 82AEF610CA
	for <dmaengine@archiver.kernel.org>; Thu, 26 Aug 2021 09:47:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240851AbhHZJsf (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Thu, 26 Aug 2021 05:48:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240854AbhHZJsc (ORCPT
        <rfc822;dmaengine@vger.kernel.org>); Thu, 26 Aug 2021 05:48:32 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D44EAC0613D9
        for <dmaengine@vger.kernel.org>; Thu, 26 Aug 2021 02:47:45 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1mJBz5-0003dG-RG; Thu, 26 Aug 2021 11:47:43 +0200
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1mJBz5-0006le-AK; Thu, 26 Aug 2021 11:47:43 +0200
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1mJBz4-005SjF-9N; Thu, 26 Aug 2021 11:47:42 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     vkoul@kernel.org, dmaengine@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, appana.durga.rao@xilinx.com,
        michal.simek@xilinx.com, m.tretter@pengutronix.de,
        kernel@pengutronix.de
Subject: [PATCH 5/7] dmaengine: zynqmp_dma: cleanup after completing all descriptors
Date:   Thu, 26 Aug 2021 11:47:40 +0200
Message-Id: <20210826094742.1302009-6-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210826094742.1302009-1-m.tretter@pengutronix.de>
References: <20210826094742.1302009-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: dmaengine@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

The current implementation iterates the entire done list for each
completed dma descriptor even if there are multiple completed
descriptors.

Avoid this by first moving all completed descriptors to the done list
and afterwards iterating the done list and finishing the descriptors.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/dma/xilinx/zynqmp_dma.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
index 61bb1d7f6ec0..f98ef5fe4902 100644
--- a/drivers/dma/xilinx/zynqmp_dma.c
+++ b/drivers/dma/xilinx/zynqmp_dma.c
@@ -759,10 +759,11 @@ static void zynqmp_dma_do_tasklet(struct tasklet_struct *t)
 
 	while (count) {
 		zynqmp_dma_complete_descriptor(chan);
-		zynqmp_dma_chan_desc_cleanup(chan);
 		count--;
 	}
 
+	zynqmp_dma_chan_desc_cleanup(chan);
+
 	if (chan->idle)
 		zynqmp_dma_start_transfer(chan);
 
-- 
2.30.2

