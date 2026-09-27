Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA7D3AA50A;
	Sun, 27 Sep 2026 09:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790499850; cv=none; b=XE/l9zuTHq3GgL0arUU8k9g0Z4lOy27xmyLHaHp5gTZxw3b2io+o1PFREf9bM4la/WVidqhTtydet0gnKAsTMPcSW0/q37TxrZvCUKpQk1A/B1ERmO1H5IV4ePIor8Orl7R53CkeyB/mSztszmR43TRmp2NOJqo8fL00Ud9J1hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790499850; c=relaxed/simple;
	bh=qAzwC0xt3piy/GVnTnMzGcqCBIM0Sr2T8VbJQAVolxI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BfRXML1CSdXE5BBzJ0wN3ebEVYLvYpews/ZyFx0MUlKKtUGQjQAbaR6JaTJonoZvgDdZO9fAeXimBAdQIJum0IgRNDGMdXhiiFypbPPw+XFAvTAZNyD1q6tOz9GdSbRj/c8RS3f799SJuRlbUtlpUnnMTengj7Ght4WIemw+ADQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J+M8sjKi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J+M8sjKi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49E881F00893;
	Sun, 27 Sep 2026 09:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790499848;
	bh=SVzuOELlhNBnB4e81xAyFiS7U7MZMLYccOZjq4tYMU8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=J+M8sjKi8GsgBAs+sH2SFeESKpmYv25wwRy3/0V365NUkBMPlsTxcdEqoZPurwd8i
	 I8igyOQTtAS8h7nqnHU9N12wooKAMjr+xkJ3SgiUlXCXdAK/LFfYB11qE7ZNJccB5T
	 lZwFQ7IXMzLlxM6cjY8ECuuv43QV3w3NH0dmbtqY5UGZLgZf+hlHZOGp/B1AdwzlkI
	 V2K4uc7cJRZsA1SU44eDjbFPvzJGzAKMUdhJfvTReafIDSqoTMvd7i4+qGI3j7fykx
	 npkPgbGDaLKB7BUWSBB/jRcnjzdaHimSUB1TTeG0509DOIEDMhffPrtLiidUDkd99v
	 bzNYXFk5tRwiA==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 27 Sep 2026 11:03:37 +0200
Subject: [PATCH v7 24/24] dmaengine: ste_dma40: Validate memcpy
 configuration
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260927-dma40-fixes-v7-24-89f595e8851d@kernel.org>
References: <20260927-dma40-fixes-v7-0-89f595e8851d@kernel.org>
In-Reply-To: <20260927-dma40-fixes-v7-0-89f595e8851d@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, phone-devel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, sashiko-bot@kernel.org, 
 Frank Li <Frank.Li@nxp.com>
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 4bf969511439..71942d0b0516 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -1895,7 +1895,8 @@ static int d40_validate_conf(struct d40_chan *d40c,
 	    d40c->base->gen_dmac.num_event_groups)
 		invalid_dev_type = true;
 
-	if (!conf->dir) {
+	if (conf->dir != DMA_MEM_TO_MEM &&
+	    !is_slave_direction(conf->dir)) {
 		chan_err(d40c, "Invalid direction.\n");
 		res = -EINVAL;
 	}
@@ -2187,12 +2188,17 @@ static int d40_allocate_channel(struct d40_chan *d40c, bool *first_phy_user)
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
 
@@ -2200,6 +2206,10 @@ static int d40_config_memcpy(struct d40_chan *d40c)
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

