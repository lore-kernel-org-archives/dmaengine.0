Return-Path: <SRS0=egwF=A5=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF648C433E1
	for <dmaengine@archiver.kernel.org>; Sat, 18 Jul 2020 13:52:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 855C42074B
	for <dmaengine@archiver.kernel.org>; Sat, 18 Jul 2020 13:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1595080338;
	bh=AomjsvQpNNm5nuJPYBEOB2xsI+7XPf7vGxKGBp5ZrY0=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=wFAzY1GgBobt9BdvMSiw1GIblhVVPd3q92/CxiuxltslR4ibULBaas+7oh43Tg6XI
	 V48bNAPhe51Cz3xRyNgcB3tzW6JD3UZmy/7NPawU8tAhQqHZNunaMrsCkDHm2KP9LC
	 Tfvf5pS74nc94V/b9zDzf/Gd7HJQGi20cLXZ6wGM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726713AbgGRNwS (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Sat, 18 Jul 2020 09:52:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:52978 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726640AbgGRNwR (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Sat, 18 Jul 2020 09:52:17 -0400
Received: from localhost.localdomain (unknown [122.171.202.192])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A64D420684;
        Sat, 18 Jul 2020 13:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595080337;
        bh=AomjsvQpNNm5nuJPYBEOB2xsI+7XPf7vGxKGBp5ZrY0=;
        h=From:To:Cc:Subject:Date:From;
        b=O/nqqNG/0AprEL+iesKmVGQItFlMpjJNySemo6Y/pMtXp2eeSB8HTiG2A2GmdAJLx
         uKS7xwPDR0BNl0sR9cPI6Kgy5shuVuF85hGkGKz71F/xVUt9CBVyBaeJx9T3f6xebB
         /4RdQPgWSjMUUfTKozFJr1MJ2ZLUYECy6Fx2Z29Q=
From:   Vinod Koul <vkoul@kernel.org>
To:     dmaengine@vger.kernel.org
Cc:     Vinod Koul <vkoul@kernel.org>, Hyun Kwon <hyun.kwon@xilinx.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH 1/3] dmaengine: xilinx: dpdma: remove comparison of unsigned expression
Date:   Sat, 18 Jul 2020 19:21:59 +0530
Message-Id: <20200718135201.191881-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

xilinx_dpdma_config() channel id is unsigned int and compares with
ZYNQMP_DPDMA_VIDEO0 which is zero, so remove this comparison

drivers/dma/xilinx/xilinx_dpdma.c:1073:15: warning: comparison of
unsigned expression in ‘>= 0’ is always true [-Wtype-limits] if
	(chan->id >= ZYNQMP_DPDMA_VIDEO0 && chan->id <= ZYNQMP_DPDMA_VIDEO2)

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/dma/xilinx/xilinx_dpdma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/xilinx/xilinx_dpdma.c b/drivers/dma/xilinx/xilinx_dpdma.c
index af88a6762ef4..8e602378f2dc 100644
--- a/drivers/dma/xilinx/xilinx_dpdma.c
+++ b/drivers/dma/xilinx/xilinx_dpdma.c
@@ -1070,7 +1070,7 @@ static int xilinx_dpdma_config(struct dma_chan *dchan,
 	 * Abuse the slave_id to indicate that the channel is part of a video
 	 * group.
 	 */
-	if (chan->id >= ZYNQMP_DPDMA_VIDEO0 && chan->id <= ZYNQMP_DPDMA_VIDEO2)
+	if (chan->id <= ZYNQMP_DPDMA_VIDEO2)
 		chan->video_group = config->slave_id != 0;
 
 	spin_unlock_irqrestore(&chan->lock, flags);
-- 
2.26.2

