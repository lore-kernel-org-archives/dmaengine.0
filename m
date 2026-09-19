Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218DF26738C;
	Sat, 19 Sep 2026 22:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789856579; cv=none; b=kWwGwIEqjhGoORmIbFpEZD015neGwQcjdPulUsOn5AUZZCN3drBqxXITSYLyfMWs4A1TjfpRft9ZRynksD5f5zYfGeK+/oasXgq21FIeArZ9/a81E/RpJSlMSXjJnA5Mo0Tnbb3VWrFfFCq4fHlejxigGS33ICMQylVxoNSKmqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789856579; c=relaxed/simple;
	bh=rsE5cBHWzOOatDxhlUdoTpoFOgYIOXMBODuwmb2BlcY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uz36UlwRSOZRM9JeNxn0rUx9MiKHnkOXrOUNCYYYevNVVNCSDX7EbMtQ1hm0J3ITEKhKg6+wVe/njrUsGkMsuIqQkYCg5hx1NJ0/2xAwoB8Uo/pyTlwXRSqZDXgV63IKT0UZz2gsGQyX8URXhzRqcRxcn0uG2W3Vuma4EWUvqkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BD2ZZCj/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BD2ZZCj/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 787CA1F000FF;
	Sat, 19 Sep 2026 22:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789856577;
	bh=CHqkAdVlV6S9qMVPk9U75zZM6KPMVw15WYADgWMwglc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=BD2ZZCj/KFyCTCNyG1E7X8vsVmXoqrQ+S9JD++aqNI9zeglTDMcvYuKI9WfxrM1iB
	 6Tcss2h7MV7uHWHGAWu0OT4SawxRPdkjSedi1WGT3V3k1YX3KWwzN12u4ru8M+P/FL
	 FIJ4UjrZK8kFx6WW4xwbOcrM8NMwSrO5PgC4iVmrMpmMgyluI+/APomIZfgtuliqlO
	 LO3zUXUkvGZ4g7vFNHGcU02mFwvxxPEOT4+wXt5UqHz45u8+5rRNls7pRwg6/EYfyW
	 57XM3NKQRsVfWiYfsLg/tP3k7pkY7aWkUAEzqf3tcVkn7vFhKZHHRDayHBuf6KhbBv
	 1Go6Y4hpeM0Cw==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 20 Sep 2026 00:22:34 +0200
Subject: [PATCH v4 23/23] dmaengine: ste_dma40: Validate memcpy
 configuration
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-dma40-fixes-v4-23-d751b2d9c23f@kernel.org>
References: <20260920-dma40-fixes-v4-0-d751b2d9c23f@kernel.org>
In-Reply-To: <20260920-dma40-fixes-v4-0-d751b2d9c23f@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, phone-devel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, sashiko-bot@kernel.org
X-Mailer: b4 0.14.3

d40_config_memcpy() builds a default memcpy configuration without passing
it through d40_validate_conf(). A dev_type supplied through the
memcpy-channels device tree property can therefore bypass the bounds
checks added for client configurations.

The generic DMA direction enum assigns zero to DMA_MEM_TO_MEM, unlike
DMA40's old private enum. Allow memory-to-memory directions in the
validator so checking the generated configuration does not reject all
memcpy channels.

Validate the generated memcpy configuration before deriving logical
channel registers or allocating the channel.

Fixes: 2c2b62d5d911 ("dmaengine: ste_dma40: Replace ST-E's home-brew DMA direction defs with generic ones")
Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/dmaengine/20260819225008.5F9651F000E9@smtp.kernel.org/
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 0fbd77588231..2152f63cb6bb 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -1863,7 +1863,8 @@ static int d40_validate_conf(struct d40_chan *d40c,
 	    d40c->base->gen_dmac.num_event_groups)
 		invalid_dev_type = true;
 
-	if (!conf->dir) {
+	if (conf->dir != DMA_MEM_TO_MEM &&
+	    !is_slave_direction(conf->dir)) {
 		chan_err(d40c, "Invalid direction.\n");
 		res = -EINVAL;
 	}
@@ -2137,12 +2138,17 @@ static int d40_allocate_channel(struct d40_chan *d40c, bool *first_phy_user)
 static int d40_config_memcpy(struct d40_chan *d40c)
 {
 	dma_cap_mask_t cap = d40c->chan.device->cap_mask;
+	int ret;
 
 	if (dma_has_cap(DMA_MEMCPY, cap) && !dma_has_cap(DMA_SLAVE, cap)) {
 		d40c->dma_cfg = dma40_memcpy_conf_log;
 		d40c->dma_cfg.dev_type =
 			d40c->base->plat_data->memcpy_channels[d40c->chan.chan_id];
 
+		ret = d40_validate_conf(d40c, &d40c->dma_cfg);
+		if (ret)
+			return ret;
+
 		d40_log_cfg(&d40c->dma_cfg,
 			    &d40c->log_def.lcsp1, &d40c->log_def.lcsp3);
 
@@ -2150,6 +2156,10 @@ static int d40_config_memcpy(struct d40_chan *d40c)
 		   dma_has_cap(DMA_SLAVE, cap)) {
 		d40c->dma_cfg = dma40_memcpy_conf_phy;
 
+		ret = d40_validate_conf(d40c, &d40c->dma_cfg);
+		if (ret)
+			return ret;
+
 		/* Generate interrupt at end of transfer or relink. */
 		d40c->dst_def_cfg |= BIT(D40_SREG_CFG_TIM_POS);
 

-- 
2.55.0

