Return-Path: <SRS0=qqdP=TW=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB1C0C282CE
	for <dmaengine@archiver.kernel.org>; Wed, 22 May 2019 19:34:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7DFD32081C
	for <dmaengine@archiver.kernel.org>; Wed, 22 May 2019 19:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1558553691;
	bh=TnJ2bCfWpNnilFNi5is2KJP69mQPXJVdAWqct3X/4jk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=GN6gLvKad/vo3gsQJ63a4SmVL/MAff03yvY6lsw3cREd2QtPTe7Qqg/TE3+7I9ZAm
	 pDhcxnMHQuWtGOLHfH9DjCw5XIci3e4++Dy5K2zt883STEU+82Xi8XUmPLv2kmXVw4
	 PRYAneZ//B1I3IXfI81Wx6USKhpIVF4rcPdzdzaM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387486AbfEVTbV (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 22 May 2019 15:31:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:54822 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731751AbfEVTbU (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Wed, 22 May 2019 15:31:20 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4476A20675;
        Wed, 22 May 2019 19:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558553480;
        bh=TnJ2bCfWpNnilFNi5is2KJP69mQPXJVdAWqct3X/4jk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=iwGhtQMreOW09cEdPrCRgaBvTCB3pUtKnWjVdvXpapZebgWKYYklV0SSppXG83U7M
         c+n6JCBtZtM0eAv/7Et4AyVTlBm9HlTTev7HIg8caIxkdNRscKmIpgk7ECeOLsokaY
         x95ZaNrrjSvJqju+pVZVxHcQIP+KtLeXD2dWU7S0=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Nicolas Ferre <nicolas.ferre@microchip.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Vinod Koul <vkoul@kernel.org>, Sasha Levin <sashal@kernel.org>,
        linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 039/114] dmaengine: at_xdmac: remove BUG_ON macro in tasklet
Date:   Wed, 22 May 2019 15:29:02 -0400
Message-Id: <20190522193017.26567-39-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190522193017.26567-1-sashal@kernel.org>
References: <20190522193017.26567-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

From: Nicolas Ferre <nicolas.ferre@microchip.com>

[ Upstream commit e2c114c06da2d9ffad5b16690abf008d6696f689 ]

Even if this case shouldn't happen when controller is properly programmed,
it's still better to avoid dumping a kernel Oops for this.
As the sequence may happen only for debugging purposes, log the error and
just finish the tasklet call.

Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>
Acked-by: Ludovic Desroches <ludovic.desroches@microchip.com>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/dma/at_xdmac.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/at_xdmac.c b/drivers/dma/at_xdmac.c
index b222dd7afe8e2..12d9048293245 100644
--- a/drivers/dma/at_xdmac.c
+++ b/drivers/dma/at_xdmac.c
@@ -1608,7 +1608,11 @@ static void at_xdmac_tasklet(unsigned long data)
 					struct at_xdmac_desc,
 					xfer_node);
 		dev_vdbg(chan2dev(&atchan->chan), "%s: desc 0x%p\n", __func__, desc);
-		BUG_ON(!desc->active_xfer);
+		if (!desc->active_xfer) {
+			dev_err(chan2dev(&atchan->chan), "Xfer not active: exiting");
+			spin_unlock_bh(&atchan->lock);
+			return;
+		}
 
 		txd = &desc->tx_dma_desc;
 
-- 
2.20.1

