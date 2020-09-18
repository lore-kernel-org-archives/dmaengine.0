Return-Path: <SRS0=veQE=C3=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D456C43466
	for <dmaengine@archiver.kernel.org>; Fri, 18 Sep 2020 02:46:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4C4C5235F8
	for <dmaengine@archiver.kernel.org>; Fri, 18 Sep 2020 02:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600397196;
	bh=Mmmn4O9DHxEkZ0A4g/zA5vFLwhO4s+XICS06F85x+Wo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=TUaJyW5+NZusJNFO/RMDyyjT5ftcZxzvCn6zxwglz+PqZoSOO8M7GbsUI6L1KuoTG
	 xZkqWoC3tLFT9BBOthnp9AHe2vrhWK5nd69TmDoq3Dr78LA5GFEgf/dmN3eI/GgXXM
	 maJyxriB5uQCaQQ53dSKRfkXWQNLVvgG5xHpPqtI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730061AbgIRCqf (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Thu, 17 Sep 2020 22:46:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:33720 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728368AbgIRCJu (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Thu, 17 Sep 2020 22:09:50 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DC93F23976;
        Fri, 18 Sep 2020 02:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600394989;
        bh=Mmmn4O9DHxEkZ0A4g/zA5vFLwhO4s+XICS06F85x+Wo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZgMwOnuOl3+7zn4pTZ8F9KCZuCR58kQv5uX0rP2GJUYsKkoG23iHMJtOz52O36xKJ
         cLSfaPweJZz7PwLcCpfsXr4C9ZsPWWaybZpv++ZgFju40h+Ano2d4T/HUskmE7ZB+c
         4ctxZEDk523kaqvU4Yjt5SLw22wZt6OToGnfNBKE=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Amelie Delaunay <amelie.delaunay@st.com>,
        Vinod Koul <vkoul@kernel.org>, Sasha Levin <sashal@kernel.org>,
        dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 4.19 088/206] dmaengine: stm32-dma: use vchan_terminate_vdesc() in .terminate_all
Date:   Thu, 17 Sep 2020 22:06:04 -0400
Message-Id: <20200918020802.2065198-88-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200918020802.2065198-1-sashal@kernel.org>
References: <20200918020802.2065198-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

From: Amelie Delaunay <amelie.delaunay@st.com>

[ Upstream commit d80cbef35bf89b763f06e03bb4ff8f933bf012c5 ]

To avoid race with vchan_complete, use the race free way to terminate
running transfer.

Move vdesc->node list_del in stm32_dma_start_transfer instead of in
stm32_mdma_chan_complete to avoid another race in vchan_dma_desc_free_list.

Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
Link: https://lore.kernel.org/r/20200129153628.29329-9-amelie.delaunay@st.com
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/dma/stm32-dma.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/stm32-dma.c b/drivers/dma/stm32-dma.c
index 4903a408fc146..ac7af440f8658 100644
--- a/drivers/dma/stm32-dma.c
+++ b/drivers/dma/stm32-dma.c
@@ -494,8 +494,10 @@ static int stm32_dma_terminate_all(struct dma_chan *c)
 
 	spin_lock_irqsave(&chan->vchan.lock, flags);
 
-	if (chan->busy) {
-		stm32_dma_stop(chan);
+	if (chan->desc) {
+		vchan_terminate_vdesc(&chan->desc->vdesc);
+		if (chan->busy)
+			stm32_dma_stop(chan);
 		chan->desc = NULL;
 	}
 
@@ -551,6 +553,8 @@ static void stm32_dma_start_transfer(struct stm32_dma_chan *chan)
 		if (!vdesc)
 			return;
 
+		list_del(&vdesc->node);
+
 		chan->desc = to_stm32_dma_desc(vdesc);
 		chan->next_sg = 0;
 	}
@@ -628,7 +632,6 @@ static void stm32_dma_handle_chan_done(struct stm32_dma_chan *chan)
 		} else {
 			chan->busy = false;
 			if (chan->next_sg == chan->desc->num_sgs) {
-				list_del(&chan->desc->vdesc.node);
 				vchan_cookie_complete(&chan->desc->vdesc);
 				chan->desc = NULL;
 			}
-- 
2.25.1

