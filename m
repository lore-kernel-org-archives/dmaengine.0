Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597C429ACFD;
	Sun, 20 Sep 2026 19:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789930815; cv=none; b=HiZlYUrgzKSHP1f70ve4fZxi78L27+sOFHQQnXq0FEKjF7Rpsydc977bvn0IMSfYv52m/MhPgfZljMfnl9Zq4m3EAYDxJ+U/7VIy61lXneNbTG+KnK9bWH72osvyJReI8WxohvmAMjB35gaF9lRJmiXcVEzvqMfEgqM9Lkp0Sxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789930815; c=relaxed/simple;
	bh=hv8qCkblH/MtGmmMlFiMchbh2ubEjKA3afseMJ7NdPc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HV3ruZAWYDymOdEw0GLpGyfFItHKLxXnfOITRbpkBIswfNVo/K9DU1yXeWuQf9SM0W8BUrBSMwFnNyCpZkwhgHe/FohR9HHtdBuHVLjw6dB4bmE6K1JSmDiUA9HNrOf5KwWcEH+nE7FFULk6gsWbMakJbiv8eIQx7hY4IG7pVFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g4+3Kg8l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g4+3Kg8l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CA101F00893;
	Sun, 20 Sep 2026 19:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789930813;
	bh=WJO81NUWReRPZOgEM/gFMg+YD7AJpXxDWshjmh2I/2M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=g4+3Kg8lUEdH1oAE5rRx2TKd7pKvHCryC39FW+gXTvS4KOMfx7uJ5WR1Gdb+1owGP
	 hBjk+vuCq/XfMRyZ46dFjRVAsBBRnUFLAvuEep/2j6aXnI8sooUl0nd/snchhhFV9v
	 SZr1xXGptasFO0VA+hvXT2n13YR1/21Ibn8y1du+RYue7hIf/s0UvJQgsxeHROibIy
	 12dPsdwV46QTFa/7Q57VU0bzzMN9ux/wCwW0tk7pYpNUSnPoHPUGBD9tsih1TrYTbl
	 q53285JdJGwGBD2WoLB44e5P7uxXehObhWIadfrWwNOQg//KxheWyKqJkwsDbN3ctT
	 zMu0dsvMjZfjA==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 20 Sep 2026 20:59:53 +0200
Subject: [PATCH v5 18/23] dmaengine: ste_dma40: Reject direction changes
 after allocation
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-dma40-fixes-v5-18-5c55cd7f92f9@kernel.org>
References: <20260920-dma40-fixes-v5-0-5c55cd7f92f9@kernel.org>
In-Reply-To: <20260920-dma40-fixes-v5-0-5c55cd7f92f9@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, phone-devel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, sashiko-bot@kernel.org
X-Mailer: b4 0.14.3

Logical channel allocation uses the configured direction to select the
source or destination allocation mask, derive the logical channel number,
and choose the LCPA location.

d40_set_runtime_config_write() nevertheless overwrites the configured
direction when a transfer is prepared for the opposite direction.
d40_free_dma() then clears the wrong allocation mask, leaking the original
resource and potentially releasing one used by another client.

Reject directions that differ from the direction used during allocation
and propagate runtime configuration errors to callers. Skip slave runtime
configuration for memcpy transfers, which also use d40_prep_sg() but do
not require it.

Fixes: 95e1400fa131 ("DMAENGINE: add runtime slave config to DMA40 v3")
Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/dmaengine/20260618051539.15E201F000E9@smtp.kernel.org/
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 9db4a325b36e..2966a8167c22 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -2406,7 +2406,13 @@ d40_prep_sg(struct dma_chan *dchan, struct scatterlist *sg_src,
 		return NULL;
 	}
 
-	d40_set_runtime_config_write(dchan, &chan->slave_config, direction);
+	if (direction != DMA_MEM_TO_MEM) {
+		ret = d40_set_runtime_config_write(dchan,
+						   &chan->slave_config,
+						   direction);
+		if (ret)
+			return NULL;
+	}
 
 	spin_lock_irqsave(&chan->lock, flags);
 
@@ -2880,6 +2886,13 @@ static int d40_set_runtime_config_write(struct dma_chan *chan,
 		return -EINVAL;
 	}
 
+	if (direction != cfg->dir) {
+		chan_err(d40c,
+			 "transfer direction %d differs from allocated direction %d\n",
+			 direction, cfg->dir);
+		return -EINVAL;
+	}
+
 	src_addr_width = config->src_addr_width;
 	src_maxburst = config->src_maxburst;
 	dst_addr_width = config->dst_addr_width;
@@ -2888,13 +2901,6 @@ static int d40_set_runtime_config_write(struct dma_chan *chan,
 	if (direction == DMA_DEV_TO_MEM) {
 		config_addr = config->src_addr;
 
-		if (cfg->dir != DMA_DEV_TO_MEM)
-			dev_dbg(d40c->base->dev,
-				"channel was not configured for peripheral "
-				"to memory transfer (%d) overriding\n",
-				cfg->dir);
-		cfg->dir = DMA_DEV_TO_MEM;
-
 		/* Configure the memory side */
 		if (dst_addr_width == DMA_SLAVE_BUSWIDTH_UNDEFINED)
 			dst_addr_width = src_addr_width;
@@ -2904,13 +2910,6 @@ static int d40_set_runtime_config_write(struct dma_chan *chan,
 	} else if (direction == DMA_MEM_TO_DEV) {
 		config_addr = config->dst_addr;
 
-		if (cfg->dir != DMA_MEM_TO_DEV)
-			dev_dbg(d40c->base->dev,
-				"channel was not configured for memory "
-				"to peripheral transfer (%d) overriding\n",
-				cfg->dir);
-		cfg->dir = DMA_MEM_TO_DEV;
-
 		/* Configure the memory side */
 		if (src_addr_width == DMA_SLAVE_BUSWIDTH_UNDEFINED)
 			src_addr_width = dst_addr_width;

-- 
2.55.0

