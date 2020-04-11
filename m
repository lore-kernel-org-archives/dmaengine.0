Return-Path: <SRS0=b8XX=53=vger.kernel.org=dmaengine-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65156C352BE
	for <dmaengine@archiver.kernel.org>; Sat, 11 Apr 2020 23:42:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3388D206E9
	for <dmaengine@archiver.kernel.org>; Sat, 11 Apr 2020 23:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1586648571;
	bh=GZpUvxes6uoucxosh718E0d1UvRy0lIvPRouAwoKXhQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=RbeyCoPdV++nsIAmTiUex6zu7giBtY58xU1JE/3DH1EpbMjwJJZElHOe2YXNKc4Du
	 mRVOBxFdT1YE/nl5NSga1EAKG5FBPBHWF0LlP4Mn4EBBtxSkvYFXKT8MvxmfICg0dI
	 gxoGedVFPdEKcCDdHqOzkQ+vYQ4mGrw7FABYeQ+k=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728452AbgDKXGf (ORCPT <rfc822;dmaengine@archiver.kernel.org>);
        Sat, 11 Apr 2020 19:06:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:42002 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728443AbgDKXGd (ORCPT <rfc822;dmaengine@vger.kernel.org>);
        Sat, 11 Apr 2020 19:06:33 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 440AF216FD;
        Sat, 11 Apr 2020 23:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586646394;
        bh=GZpUvxes6uoucxosh718E0d1UvRy0lIvPRouAwoKXhQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IoOXSqGp00lwLI5WcKxjfkMBwDNlu+FTOvgR4WRgm4NYWZne1hqHpof82ZN2FDtFU
         wc2p6MND4yIlt+qjbqlY0hMdduTVt96NH49AgFIqZqoY9lo/ZR9ddQHD5GjjKnQbOu
         HsF0HDuTsBHHykfbfbeYvZVI23F2VIeq+JzfNfB8=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Vinod Koul <vkoul@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Sasha Levin <sashal@kernel.org>, dmaengine@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 5.6 132/149] dmaengine: sun4i: set the linear_mode properly
Date:   Sat, 11 Apr 2020 19:03:29 -0400
Message-Id: <20200411230347.22371-132-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200411230347.22371-1-sashal@kernel.org>
References: <20200411230347.22371-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: dmaengine-owner@vger.kernel.org
Precedence: bulk
List-ID: <dmaengine.vger.kernel.org>
X-Mailing-List: dmaengine@vger.kernel.org

From: Vinod Koul <vkoul@kernel.org>

[ Upstream commit 8faa77332fe01a681ef3097581a37b82adc1c14b ]

Commit 6ebb827f7aad ("dmaengine: sun4i: use 'linear_mode' in
sun4i_dma_prep_dma_cyclic") updated the condition but introduced a semi
colon this making this statement have no effect, so add the bitwise OR
to fix it"

Fixes: 6ebb827f7aad ("dmaengine: sun4i: use 'linear_mode' in sun4i_dma_prep_dma_cyclic")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Link: https://lore.kernel.org/r/20200214044609.2215861-1-vkoul@kernel.org
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/dma/sun4i-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/sun4i-dma.c b/drivers/dma/sun4i-dma.c
index e87fc7c460dd4..e7ff09a5031db 100644
--- a/drivers/dma/sun4i-dma.c
+++ b/drivers/dma/sun4i-dma.c
@@ -697,7 +697,7 @@ sun4i_dma_prep_dma_cyclic(struct dma_chan *chan, dma_addr_t buf, size_t len,
 		dest = sconfig->dst_addr;
 		endpoints = SUN4I_DMA_CFG_DST_DRQ_TYPE(vchan->endpoint) |
 			    SUN4I_DMA_CFG_DST_ADDR_MODE(io_mode) |
-			    SUN4I_DMA_CFG_SRC_DRQ_TYPE(ram_type);
+			    SUN4I_DMA_CFG_SRC_DRQ_TYPE(ram_type) |
 			    SUN4I_DMA_CFG_SRC_ADDR_MODE(linear_mode);
 	} else {
 		src = sconfig->src_addr;
-- 
2.20.1

