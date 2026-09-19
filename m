Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284FF370AEB;
	Sat, 19 Sep 2026 22:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789856570; cv=none; b=kn4EzV45CHO/JZiN29YTtlsOkJlL97+MrMG+wPKi7lOT+p+Ybg27rYU+sNL1Vb/ipZvy5wV8p9p667Ox2Nxy46vrtf8fOh9nhFPaBvcW5eMIMYDEtYAjTklBOdVxA0qKx/f/zRdnluU7SwG06MK/LrLp72qyINSVSrbJfuhzgNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789856570; c=relaxed/simple;
	bh=hT3mQTXhntfqE8qr9AL/E13R0bSrJKzQKv1ouKwNU2c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R6E7AMrP962YlftFyHh0YBEswPconnOhapDUHvXysrFQetyZntww/st+tCzaYlIsL7Iuw6mEaRYp4+upoVmAYP3QBROijCBVGj09dd+5DC1bcGLbEgzcTtQZgbnSkeyRY0UseAVCwfwWlUyaR7jAuYIyAQpLpex6+VyROCJIOiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UrTijffv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UrTijffv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E5041F00893;
	Sat, 19 Sep 2026 22:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789856568;
	bh=yYhmTlEKQ5LpgVcTx01Vl4yy5sGFi+K/G6za0nluOfI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=UrTijffvrZHwd0QBgyE+A57nFwoVJ4EK7EpKw+wpl6vH/Dh9Gu2pRBX11Esk5Xh49
	 KIPot7lvB2eZjU+fxqam0Q0K9cBxKMCDVucDaZ381WT4XxWxCpxeIIS60MlZlejfdt
	 gncK68nRd6UsgeQPpDrgka3OwoxGcTLa83qi2p4LdbdPoXIloI8abm5qcLUCVsLBiQ
	 0L9T6RTNC2YtS4rdQDQjHCcGfxwdvAadhe3EFAsqE6XXdRgSms6rWuxpp0hGuqtj41
	 RFriPCigubE314zEO3xAkVtVqkk2qoCEyBNI5BCtJLmkvuj/Uyh63JvvFBqpOSkjLu
	 7WWrbE9XOyOrA==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 20 Sep 2026 00:22:29 +0200
Subject: [PATCH v4 18/23] dmaengine: ste_dma40: Reject direction changes
 after allocation
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-dma40-fixes-v4-18-d751b2d9c23f@kernel.org>
References: <20260920-dma40-fixes-v4-0-d751b2d9c23f@kernel.org>
In-Reply-To: <20260920-dma40-fixes-v4-0-d751b2d9c23f@kernel.org>
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
index 7cd063e81328..35cee6e48558 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -2384,7 +2384,13 @@ d40_prep_sg(struct dma_chan *dchan, struct scatterlist *sg_src,
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
 
@@ -2857,6 +2863,13 @@ static int d40_set_runtime_config_write(struct dma_chan *chan,
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
@@ -2865,13 +2878,6 @@ static int d40_set_runtime_config_write(struct dma_chan *chan,
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
@@ -2881,13 +2887,6 @@ static int d40_set_runtime_config_write(struct dma_chan *chan,
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

