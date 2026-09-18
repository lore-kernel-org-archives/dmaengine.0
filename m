Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0E2274670;
	Fri, 18 Sep 2026 16:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789748708; cv=none; b=iplJkno1tszNOdh1f4fvZjn28WTz2pWIiXvdMGvlwRJMWL/HSS/zHJYlNTcF51Z0qvj54C1sl3n2VQucUN+BOhKFGP9fKUgc5pGGvFRTM0XD+L9a9SW/YZ9T3AEHuVF9R5scISWoo/j0+bn43W7JddPHgaK56gWTbyehhVV+kRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789748708; c=relaxed/simple;
	bh=NmgX1+yhPy9v3fRYqfJuz0msMqrxNAMimyxMgQt5XHg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g9LsnKHntDXGuTfQpA4zdXB7niDURd4YgHJqDICkfsobYUkWSTcZ3VQavLor7eq9GUqkGQpWTm2pmOlg6Evmtg7X7mkmh2oFscoEmX37S8K74tHe0CCwC+6G3VrkQnVQTzUsMQkc8pqJW4V5vKzh87Mq4HsyswG5Fjl05IkOs/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AXgz7pHx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AXgz7pHx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE1761F00898;
	Fri, 18 Sep 2026 16:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789748706;
	bh=0/Q2D3SYGfJ5K2lM36NPcejxamrhFmzFV7oj1E0uiYQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=AXgz7pHxZDoH6LNxLX47EQhCXXCbcjm/q5Nld9l3jIW92pBeMAkerkTl/i/4hI8o/
	 DOxDUsIdYNptsGMzCfnzOtpX5HtKx8RZYEg/AnvC4VIh1d95xHAXfLm8DwjUDY7Xtl
	 lkEu48fl7L0ofEnJuEfygF4rWeSUSHdYRmEZtGSHxgMUyMaciNWDFGn0y+fRzpg7Z2
	 OGRWTcQtf77sAxuChBxdWHCWebRsbhvjz/mJXBn5Z+JTbROgBIBlL9ygJ6A5iWL8G4
	 whczNX6w1PGY0PoQi0rRNvdOmBmJ5NiXu8CfCdsXhDT4KYlitEYE646Ys5LtDvfSoQ
	 0NiEMHSNBLsZg==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 18 Sep 2026 18:24:41 +0200
Subject: [PATCH v3 22/22] dmaengine: ste_dma40: Validate memcpy
 configuration
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-dma40-fixes-v3-22-8dd8450669e8@kernel.org>
References: <20260918-dma40-fixes-v3-0-8dd8450669e8@kernel.org>
In-Reply-To: <20260918-dma40-fixes-v3-0-8dd8450669e8@kernel.org>
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
index 3310f5086122..4969e78f365d 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -1763,7 +1763,8 @@ static int d40_validate_conf(struct d40_chan *d40c,
 	    d40c->base->gen_dmac.num_event_groups)
 		invalid_dev_type = true;
 
-	if (!conf->dir) {
+	if (conf->dir != DMA_MEM_TO_MEM &&
+	    !is_slave_direction(conf->dir)) {
 		chan_err(d40c, "Invalid direction.\n");
 		res = -EINVAL;
 	}
@@ -2038,12 +2039,17 @@ static int d40_allocate_channel(struct d40_chan *d40c, bool *first_phy_user)
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
 
@@ -2051,6 +2057,10 @@ static int d40_config_memcpy(struct d40_chan *d40c)
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

