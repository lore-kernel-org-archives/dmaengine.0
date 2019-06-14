Return-Path: <SRS0=LQqC=UN=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10FE2C31E4B
	for <dmaengine@archiver.kernel.org>; Fri, 14 Jun 2019 20:36:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D6E75217F9
	for <dmaengine@archiver.kernel.org>; Fri, 14 Jun 2019 20:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1560544564;
	bh=kUk3t82gGuHnL4aXnqL39UfdmXFerfyJYy1vpHjk6rg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=LUqWs/JrNXdJ5Q5f1izzht+AGEdFVkPSU/hMSbMD0QDUh2cjbhPoNd5KcwjyqGIZH
	 MzG6NUcOqfDgcQII6bwpjNCCqPILSyKkS/n4qKcr0D6lpL2QxsT2tpIIA6xYaPimWO
	 cGFuF3VG80XddZWYlXFC05oa61GtsPSBHJoOI6F0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727602AbfFNUf5 (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Fri, 14 Jun 2019 16:35:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:52108 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727179AbfFNU3t (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Fri, 14 Jun 2019 16:29:49 -0400
Received: from sasha-vm.mshome.net (unknown [131.107.159.134])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D8FED21852;
        Fri, 14 Jun 2019 20:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560544189;
        bh=kUk3t82gGuHnL4aXnqL39UfdmXFerfyJYy1vpHjk6rg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JAR0Lx4sxp33kVbAC2FJpbTOk8R/ei+36yzIEnlMT+soWVOWKjG3ALYXifQCS/PJ4
         jTXoq9ONtcExXiPd7dSs8ZvaQ+hvU5e+R0LBwP0qI1NBp55tLwifIRccutXgaIpHsU
         1bGnu+RnwkvK7yRjrGzY5ni3POf6lvmodoP6Lliw=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Eric Long <eric.long@unisoc.com>,
        Baolin Wang <baolin.wang@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Sasha Levin <sashal@kernel.org>,
        dmaengine@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 03/39] dmaengine: sprd: Fix block length overflow
Date:   Fri, 14 Jun 2019 16:29:08 -0400
Message-Id: <20190614202946.27385-3-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614202946.27385-1-sashal@kernel.org>
References: <20190614202946.27385-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

From: Eric Long <eric.long@unisoc.com>

[ Upstream commit 89d03b3c126d683f7b2cd5b07178493993d12448 ]

The maximum value of block length is 0xffff, so if the configured transfer length
is more than 0xffff, that will cause block length overflow to lead a configuration
error.

Thus we can set block length as the maximum burst length to avoid this issue, since
the maximum burst length will not be a big value which is more than 0xffff.

Signed-off-by: Eric Long <eric.long@unisoc.com>
Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/dma/sprd-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/sprd-dma.c b/drivers/dma/sprd-dma.c
index 55df0d41355b..1ed1c7efa288 100644
--- a/drivers/dma/sprd-dma.c
+++ b/drivers/dma/sprd-dma.c
@@ -663,7 +663,7 @@ static int sprd_dma_fill_desc(struct dma_chan *chan,
 	temp |= slave_cfg->src_maxburst & SPRD_DMA_FRG_LEN_MASK;
 	hw->frg_len = temp;
 
-	hw->blk_len = len & SPRD_DMA_BLK_LEN_MASK;
+	hw->blk_len = slave_cfg->src_maxburst & SPRD_DMA_BLK_LEN_MASK;
 	hw->trsc_len = len & SPRD_DMA_TRSC_LEN_MASK;
 
 	temp = (dst_step & SPRD_DMA_TRSF_STEP_MASK) << SPRD_DMA_DEST_TRSF_STEP_OFFSET;
-- 
2.20.1

