Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABA72DF138
	for <dmaengine@vger.kernel.org>; Wed, 26 Aug 2026 02:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787712046; cv=none; b=GB9FGGx+q4f4SZJirQ9SQJ21qeTZlZPBBSOoJkxtZKZVI/BpmKLroNhQDfD8GV/MFpjUFycpdUTnEqCi+ZUbtKMFDu1PiMHNxdDDGp8eqXeo4PcdEibM3b7gw0ebCV2l30ArWc8FeGERW7FimNZihRcEbBXbHE7Sj9gpiSINCIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787712046; c=relaxed/simple;
	bh=6+ewAXqjW78W01kuIRgLZxa+1D1OKS1tJVFYiHwc4QM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qtMWtNgsmr74C5HL6MkYkYPyCKuUSyjh7LvzjklntHyWyNpbQbdxThI9/FK8GzHOFyv2WA7D9+XvtLySqBSY19ogABdgYCPMbZYM6WqzBweHYfUkQ6jm7rCyKNiuLj3E5Oq+hsG6X4sG/Eu/cTqVbvVNd6XXVnqd549u+dHPnVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RibYHCHG; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RibYHCHG"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-81ecf499af9so7441537b3.1
        for <dmaengine@vger.kernel.org>; Tue, 25 Aug 2026 19:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787712043; x=1788316843; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5RAoTdggxobD2oaFa5ZIipVOPvbxRenYgCW3U/I11VY=;
        b=RibYHCHGMwXEKQYg4Rj9frgxe7M+cfl7LngbAYvEqGsIhF2fcCK5fkiK/4Ze3jxcFx
         65VvjLKpoU5US61+hRGybuzELpmzvrjxfZCQ52svZvY8/3HI6JAriMqIoHOVZWOaZkjj
         J6c19PsGgBGCNkHH/t3jg5FISDpDSf5FaknApgBLvr7dKZO4+wqBM8PulcvGPN+z9Yky
         dma87QNY3dJ4aC3RNlUFCBFVlLih8ESOAEPh6iojJFkC3Ls9jDVVHHbps7nmRfqfH7TU
         NbTftsaGiMn5eE6jIJYX2dGl0HNujP+VqSIUbTgcHbh7PG84gS/QKm1EYq5TrogSsplZ
         7kpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787712043; x=1788316843;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5RAoTdggxobD2oaFa5ZIipVOPvbxRenYgCW3U/I11VY=;
        b=bUmAKLJji8YLSdqPYntwl4t797dKGOzsWlzH8bbu+UPJLGlsyKqvyzApfOIiEtbtVq
         UrUr4mnpvRZsILQI0f6VOficD448LhaIMQrrlFMc9+PhOkA5NziFQ9E4naB5yn4lfMmS
         LbDxumlNvzMO/Le83losd8zFnZt5X54fsDgUj3RQonK9TWwEsJZaB6ohsxTGqsHoXQ8C
         apv4mP8ljYEOA4oIuDl5caTQDU5BSXLG3QM3TTnl2dN9ln4K4ebFgZJOOZX0IcvnRZsS
         h7lX2OWsGk7fqhXXPB7TsdgLFusMio1SnZSljXa459nW3tfkMAfMtXGz/ew8GM2JTqV4
         1YvA==
X-Gm-Message-State: AFuF++nKcau33EBhWkF2s/bnCBX+6MfEq7jkfkFbwZ/JnwKf+z78sQg5
	N/5TV/ZK2F63WjHaCaemaXImKeA66W6LJD6rdesByY+E/IzpdVYYN+sL
X-Gm-Gg: AR+sD13avCy3WUq7rQ0zw8lSVIh7EhhkDfMLHlEKcArlgA8o8HoogXo2wmF/I15HziT
	C2k1uegOr3iLQjar5O7aVQW5QLcVaflMjEllo8bIrl36HnzKg6F1zMSgZupDVc31y1THGBjX3m4
	ZhRMZI8ZtxSDY5/ROJbOX8cTSZCGziJkSQr8dQK65u+mMXiLp3k9wsirzTWVUws1o80JR8O8uQF
	I6+6lk3H77GwYT+7okslHxbKQ9fJ5WwE7JuUa9szO96P+d1pm+iBo00KmC+vSYiW7zkeftXkb5I
	GINSWQgRmvzoNi8TLf0LUiYDIjdBXf1wzS3A8KEXf4vsMbA4LBGbj0cFI8drkXxPaGERz7JymFk
	LQUIKmGhthMkUaN6phzlk6wj4V7W/OuH+rxju96hNHHVzbWEknZHHlq4QdKYJYBhoCq1wc0NaIn
	6N4bs6aRuwzk0GDUN/dd+SN1SVTlDNlrbtAXaBt5B9TWBjL7npWgLb/GTzayo9qA==
X-Received: by 2002:a05:690c:6311:b0:816:b469:cd12 with SMTP id 00721157ae682-8573cad05f0mr16824987b3.8.1787712043065;
        Tue, 25 Aug 2026 19:40:43 -0700 (PDT)
Received: from [172.17.0.2] ([138.28.231.64])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-857053839fdsm9976087b3.10.2026.08.25.19.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 19:40:42 -0700 (PDT)
From: Yuanshen Cao <alex.caoys@gmail.com>
Date: Wed, 26 Aug 2026 02:40:29 +0000
Subject: [PATCH v5 3/5] dmaengine: sun6i-dma: Add num_channels_per_reg for
 flexible interrupt mapping
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-sun60i-a733-dma-v5-3-abc5229b441e@gmail.com>
References: <20260826-sun60i-a733-dma-v5-0-abc5229b441e@gmail.com>
In-Reply-To: <20260826-sun60i-a733-dma-v5-0-abc5229b441e@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Yuanshen Cao <alex.caoys@gmail.com>
X-Mailer: b4 0.16.0

The `sun6i-dma` driver previously assumed a fixed number of channels
per interrupt register. For example, `sun6i_kill_tasklet` was hardcoded
to disable interrupts only for registers 0 and 1. `DMA_MAX_CHANNELS` was
also not in used previously, and the old SoCs never has more than 16
channels.

The A733 has a different interrupt structure where the number of
channels per register may differ. Add `num_channels_per_reg` to `struct
sun6i_dma_config` to make the interrupt handling logic handware-agnostic
Update `sun6i_dma_interrupt`, `sun6i_dma_start_desc`, and
`sun6i_kill_tasklet` to use this value.

Additionally, set `DMA_MAX_CHANNELS` to 16 to ensure loops over
interrupts are correctly bounded, aligning with the hardware
specifications.

Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
---
 drivers/dma/sun6i-dma.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 1ffd870d9594..ffb63212bea7 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -32,14 +32,13 @@
 #define DMA_IRQ_PKG			BIT(1)
 #define DMA_IRQ_QUEUE			BIT(2)
 
-#define DMA_IRQ_CHAN_NR			8
 #define DMA_IRQ_CHAN_WIDTH		4
 
 
 #define DMA_STAT		0x30
 
 /* Offset between DMA_IRQ_EN and DMA_IRQ_STAT limits number of channels */
-#define DMA_MAX_CHANNELS	(DMA_IRQ_CHAN_NR * 0x10 / 4)
+#define DMA_MAX_CHANNELS	16
 
 /*
  * sun8i specific registers
@@ -58,6 +57,8 @@
 #define DMA_IRQ_EN_OFFSET_A31		0x00
 #define DMA_IRQ_STAT_OFFSET_A31		0x10
 
+#define DMA_IRQ_CHAN_NR_A31		8
+
 /*
  * Channels specific registers
  */
@@ -154,6 +155,7 @@ struct sun6i_dma_config {
 	u32 irq_stride;
 	u32 irq_en_offset;
 	u32 irq_stat_offset;
+	u32 num_channels_per_reg;
 };
 
 /*
@@ -268,7 +270,7 @@ static inline void sun6i_dma_dump_com_regs(struct sun6i_dma_dev *sdev)
 {
 	int i;
 
-	for (i = 0; i < 2; i++) {
+	for (i = 0; i < DIV_ROUND_UP(sdev->num_pchans, sdev->cfg->num_channels_per_reg); i++) {
 		dev_dbg(sdev->slave.dev, "Common register:\n"
 			"chan num %d\n"
 			"\tmask(%04x): 0x%08x\n"
@@ -489,8 +491,8 @@ static int sun6i_dma_start_desc(struct sun6i_vchan *vchan)
 
 	sun6i_dma_dump_lli(vchan, pchan->desc->v_lli, pchan->desc->p_lli);
 
-	irq_reg = pchan->idx / DMA_IRQ_CHAN_NR;
-	irq_offset = pchan->idx % DMA_IRQ_CHAN_NR;
+	irq_reg = pchan->idx / sdev->cfg->num_channels_per_reg;
+	irq_offset = pchan->idx % sdev->cfg->num_channels_per_reg;
 
 	vchan->irq_type = vchan->cyclic ? DMA_IRQ_PKG : DMA_IRQ_QUEUE;
 
@@ -582,7 +584,7 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 	int i, j, ret = IRQ_NONE;
 	u32 status;
 
-	for (i = 0; i < sdev->num_pchans / DMA_IRQ_CHAN_NR; i++) {
+	for (i = 0; i < sdev->num_pchans / sdev->cfg->num_channels_per_reg; i++) {
 		status = sun6i_read_irq_stat(sdev, i);
 		if (!status)
 			continue;
@@ -592,7 +594,7 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 
 		sun6i_write_irq_stat(sdev, i, status);
 
-		for (j = 0; (j < DMA_IRQ_CHAN_NR) && status; j++) {
+		for (j = 0; (j < sdev->cfg->num_channels_per_reg) && status; j++) {
 			pchan = sdev->pchans + j;
 			vchan = pchan->vchan;
 			if (vchan && (status & vchan->irq_type)) {
@@ -1110,7 +1112,7 @@ static inline void sun6i_kill_tasklet(struct sun6i_dma_dev *sdev)
 	int i;
 
 	/* Disable all interrupts from DMA */
-	for (i = 0; i < 2; i++)
+	for (i = 0; i < DMA_MAX_CHANNELS / sdev->cfg->num_channels_per_reg; i++)
 		sun6i_write_irq_en(sdev, i, 0);
 
 	/* Prevent spurious interrupts from scheduling the tasklet */
@@ -1138,7 +1140,8 @@ static inline void sun6i_dma_free(struct sun6i_dma_dev *sdev)
 #define SUN6I_DMA_IRQ_A31_COMMON_CFG	\
 	.irq_stride      = DMA_IRQ_STRIDE_A31,	\
 	.irq_en_offset   = DMA_IRQ_EN_OFFSET_A31,	\
-	.irq_stat_offset = DMA_IRQ_STAT_OFFSET_A31,
+	.irq_stat_offset = DMA_IRQ_STAT_OFFSET_A31,	\
+	.num_channels_per_reg = DMA_IRQ_CHAN_NR_A31,
 
 /*
  * For A31:

-- 
2.55.0

