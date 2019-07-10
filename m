Return-Path: <SRS0=BhcN=VH=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE33BC74A2E
	for <dmaengine@archiver.kernel.org>; Wed, 10 Jul 2019 15:05:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9DFB1214AF
	for <dmaengine@archiver.kernel.org>; Wed, 10 Jul 2019 15:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1562771119;
	bh=kkVtKIKtY+cKBVcVE9XetstR4pjnwlDvVK28e/w5Q7g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=iRVPS9wXGLPQzEyZpj3IqVCnO7bQGShuqHPbLQKCw8u4FhT9ctCeLFTVXc1ez4oVv
	 p+COHiWhkSW487IBd+9bfj0i7vvChLfAQNqumeau/y1MUhm2pYkdZFaqjLu3ed/DOM
	 b928BWMgwh+zji4+hg0Lp5HPTxTVrofcHeBH0+Ic=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728026AbfGJPDA (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Wed, 10 Jul 2019 11:03:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:34828 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727978AbfGJPC7 (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Wed, 10 Jul 2019 11:02:59 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 67145208E4;
        Wed, 10 Jul 2019 15:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1562770978;
        bh=kkVtKIKtY+cKBVcVE9XetstR4pjnwlDvVK28e/w5Q7g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=oLe3BNRsasVE+pGUlmjRUjfLGFlWJwKSXUrXX2NKojdGBSxKEQnEsWxJ6B2blBTBt
         mWZUPk9IseVqV9i3xLRyQQ71Vis7Nb5PEZVtylP8D8DeGBvgsOqEYtRrFj+HIg8ueH
         PN/WoU0NRzJW5x4HRCc1Rpei8TUOPc/pg5pMOoUM=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Vinod Koul <vkoul@kernel.org>, Sasha Levin <sashal@kernel.org>,
        dmaengine@vger.kernel.org
Subject: [PATCH AUTOSEL 5.1 10/11] dmaengine: jz4780: Fix an endian bug in IRQ handler
Date:   Wed, 10 Jul 2019 11:02:37 -0400
Message-Id: <20190710150240.6984-10-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190710150240.6984-1-sashal@kernel.org>
References: <20190710150240.6984-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>

[ Upstream commit 4c89cc73d1da42ae48b5c5dfbfd12304d0b86786 ]

The "pending" variable was a u32 but we cast it to an unsigned long
pointer when we do the for_each_set_bit() loop.  The problem is that on
big endian 64bit systems that results in an out of bounds read.

Fixes: 4e4106f5e942 ("dmaengine: jz4780: Fix transfers being ACKed too soon")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/dma/dma-jz4780.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/dma-jz4780.c b/drivers/dma/dma-jz4780.c
index f49534019d37..503d9f13ea97 100644
--- a/drivers/dma/dma-jz4780.c
+++ b/drivers/dma/dma-jz4780.c
@@ -722,12 +722,13 @@ static irqreturn_t jz4780_dma_irq_handler(int irq, void *data)
 {
 	struct jz4780_dma_dev *jzdma = data;
 	unsigned int nb_channels = jzdma->soc_data->nb_channels;
-	uint32_t pending, dmac;
+	unsigned long pending;
+	uint32_t dmac;
 	int i;
 
 	pending = jz4780_dma_ctrl_readl(jzdma, JZ_DMA_REG_DIRQP);
 
-	for_each_set_bit(i, (unsigned long *)&pending, nb_channels) {
+	for_each_set_bit(i, &pending, nb_channels) {
 		if (jz4780_dma_chan_irq(jzdma, &jzdma->chan[i]))
 			pending &= ~BIT(i);
 	}
-- 
2.20.1

