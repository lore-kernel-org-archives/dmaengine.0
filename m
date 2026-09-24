Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE1430C618;
	Thu, 24 Sep 2026 08:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790238956; cv=none; b=QZhiqlRza1TuMJjOlRx3TAMjpmS7810J8ewemNXRZubfbv5ChtE+KmofdQ6Nd5wCjStUbxWEWJIcSyJSOKVL40UPlTYY9M1NtpT2WUR0cuFXxuIdx6qbQR65BoBiMf9jID0Jw92vDDHX1VSjJIEkA29cZI6dRijrm298/58YMpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790238956; c=relaxed/simple;
	bh=S4S4NgTJmabOnmFLqe5WnNkonLRwbHqb4tvIdxCtFAk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q3Tt7s+JpPvyLT8f6xWxHicOL3i2g04fqiHtQAI2u5m06jj7OpvmPrZZxYCo9BgicSgRTKgJZ1tDK/Yrwe8nHkIaVbyDv34aVztCDoOldinamHfPnTle+pkynR2XIBJFW/GwUXVshZWTCBDtcR9QZl7cPRdnDKuZG+BEranFa+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RdSKaPet; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RdSKaPet"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BA151F000FF;
	Thu, 24 Sep 2026 08:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790238955;
	bh=0jBmkuuGEvsFmlsJBj6Ibgk9Nlu4rTmc8HC+Fjjcgss=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=RdSKaPet1uALE73WjWWTuy5Eky89z3/c4mcwymkTWg+GV0hhAsfwQbNeqV5a+YMPC
	 5TH710TVPwJ+K7dBbgK0dQKPYeyLgwypbt9njlyfPx8t24mWvBM9zN6fc29JZsorp/
	 QCp5trQmX/IGc6sPAIwWMucQFcxaxyK7mBvED4RxAx9bq/HD+DaC/mNRxvTh+jf0JZ
	 Cagge8Ns6oyCnoMLUau1l0MnQBRg5XuGmC4PNLQxrf22zcEiKDpJnEMopAZo2Waojy
	 eAaStaYqrXsPDmoMfiH1d7pjgcqJqvoCusKPc+VGWnvKc+CosftbSOfvP+aM8hnd6B
	 3OtSM4HmJwV6Q==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 24 Sep 2026 10:35:35 +0200
Subject: [PATCH v6 23/23] dmaengine: ste_dma40: Validate memcpy
 configuration
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-dma40-fixes-v6-23-fdb6755020a2@kernel.org>
References: <20260924-dma40-fixes-v6-0-fdb6755020a2@kernel.org>
In-Reply-To: <20260924-dma40-fixes-v6-0-fdb6755020a2@kernel.org>
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
index d65bf6cfea53..c10012026ea0 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -1897,7 +1897,8 @@ static int d40_validate_conf(struct d40_chan *d40c,
 	    d40c->base->gen_dmac.num_event_groups)
 		invalid_dev_type = true;
 
-	if (!conf->dir) {
+	if (conf->dir != DMA_MEM_TO_MEM &&
+	    !is_slave_direction(conf->dir)) {
 		chan_err(d40c, "Invalid direction.\n");
 		res = -EINVAL;
 	}
@@ -2171,12 +2172,17 @@ static int d40_allocate_channel(struct d40_chan *d40c, bool *first_phy_user)
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
 
@@ -2184,6 +2190,10 @@ static int d40_config_memcpy(struct d40_chan *d40c)
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

