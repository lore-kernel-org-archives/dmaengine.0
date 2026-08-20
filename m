Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6131C256C84;
	Thu, 20 Aug 2026 13:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787231719; cv=none; b=gPaNfgO5roESZe1zHtwL1/CWojCbf2GE05GsQCFB8s6PgN2QjPtD7Xgm5E+Z2DQfZfjvVKoMiCCOm2TtwCTqFJEtMXO9AhMAcIb1e9/8T2cK9iNfiK8OTrMHKv8fk+SJtaWlohwtc1Uv5cbNp1brj/jQyyjFUNzUYs4TmeQTLfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787231719; c=relaxed/simple;
	bh=Kr0SdhcA2grV2YBGggNFCU3co20SleYuCJ1BEIecRjg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s/JFD3BAHCWvvXUVfbOA6CZ4Oxdd5P+DKo8YCBA9ZDXEkJ3rBy2fTLqWork2r9CX29pWWYp/NUywl8gkcBm2J6pDKJQmwsNdZ96NqaEoybArHQBrfo57/nNORooQX9ehLq8iEC6Ja+Ul+VnO/ZBIemNBAGKelSAxDMIh0NBqesY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ns5kjY66; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ns5kjY66"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08F671F000E9;
	Thu, 20 Aug 2026 13:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787231718;
	bh=qQOY9horgD4H4HtJSP1z02q+GGmJGvFyimIDZfaWJuA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Ns5kjY66wa7w/jEWBRIDaTCeleTo1gb27w0+s9g4OuGVrS/G1fdPmerpJpxN2roSS
	 YmlwZDkqSYAbjWYX+v+PEW/JHOMJyE1YaQ0z1rUUbqPeqHecLumxWbqd7tw4W3RZ7d
	 8XHm1F/ad/xIhHYZEqgaJ5ZHCnahhduMiKPmdVpsuV5rXyXX1nw3f1Cxb6/NCVZEBZ
	 agdOhNPV1aqJhXwqUehWlndQJ39P9iGRfcTIY1pogG4QmTWdnLiHReSIh6W2O4Yhtl
	 hxWI8+FblBotGhTV+iTs/VHPBCKWSdfsijGgNI8b6RdN4dIFSrdTKZLftg88Lw1hjT
	 mrqf2CphCetqQ==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 20 Aug 2026 15:15:06 +0200
Subject: [PATCH v2 12/13] dmaengine: ste_dma40: Validate memcpy
 configuration
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-dma40-fixes-v2-12-63238334c707@kernel.org>
References: <20260820-dma40-fixes-v2-0-63238334c707@kernel.org>
In-Reply-To: <20260820-dma40-fixes-v2-0-63238334c707@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, phone-devel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, sashiko-bot@kernel.org
X-Mailer: b4 0.14.3

d40_config_memcpy() builds a default memcpy configuration without passing
it through d40_validate_conf(). A dev_type supplied through the
memcpy-channels device tree property can therefore bypass the bounds
checks added for client configurations.

Validate the generated memcpy configuration before deriving logical
channel registers or allocating the channel.

Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/dmaengine/20260819225008.5F9651F000E9@smtp.kernel.org/
Assisted-by: Codex:gpt-5-5
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index e0c694a1fc8b..49bca706b638 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -2013,11 +2013,16 @@ static int d40_allocate_channel(struct d40_chan *d40c, bool *first_phy_user)
 static int d40_config_memcpy(struct d40_chan *d40c)
 {
 	dma_cap_mask_t cap = d40c->chan.device->cap_mask;
+	int ret;
 
 	if (dma_has_cap(DMA_MEMCPY, cap) && !dma_has_cap(DMA_SLAVE, cap)) {
 		d40c->dma_cfg = dma40_memcpy_conf_log;
 		d40c->dma_cfg.dev_type = dma40_memcpy_channels[d40c->chan.chan_id];
 
+		ret = d40_validate_conf(d40c, &d40c->dma_cfg);
+		if (ret)
+			return ret;
+
 		d40_log_cfg(&d40c->dma_cfg,
 			    &d40c->log_def.lcsp1, &d40c->log_def.lcsp3);
 
@@ -2025,6 +2030,10 @@ static int d40_config_memcpy(struct d40_chan *d40c)
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

