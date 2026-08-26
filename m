Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE582DF138
	for <dmaengine@vger.kernel.org>; Wed, 26 Aug 2026 02:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787712043; cv=none; b=La/ILxPzp4WEiqRPTjcf/JXoEnAsPKQ5ZLPMSnNMwh1MJ2/0TgGeyzqsc9v2KaM3wcxra8cqShPkWbRlFL5XgczF8EM6xPaHsBTo0xCyUcZdJgQzyVZpTUJEEHeEJLyAQl0CrX9sNB8hIyMxxRzytEAZIteSHGU8XFEvjJ+p6cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787712043; c=relaxed/simple;
	bh=bWDpjVeQL4ZPcqxBnAYAbjPHfWZWc/lgdxSnGkqNQ2M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nQHuxktJW0g/2Q8JMgfOMLGknyTRcTlgV12WAsyKCmALKOwmBSKHJD72LdPRFRh8BDn+deYB2dpOV8qjw7nvenl4tBfKl4Z7T7XSmstq+rSjynGJm0Z6Wo6iM9/3bREkqOvqvBQeAsRXpUNt0UY5v7iWBbV3ho/non7YsuE/C6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HpveYs8r; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HpveYs8r"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-81ee6b2da98so5759837b3.3
        for <dmaengine@vger.kernel.org>; Tue, 25 Aug 2026 19:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787712040; x=1788316840; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=37syxcZjr+SQHdWr5tam1HRyww9ToksagoIyI3QIPxo=;
        b=HpveYs8rS2cPJLNM/j/fa1FJgcae6LaCz4286iKr9Mmd6NNSIrEipdfaYteNw+92Bt
         fdcets6mPdYKB6cB8T6hRti/99qex4QrmK/LqcUwu5V6nBSqdTfc4ww6dZmIivxE+GfC
         FGS1cNq39mugZY14NPpiEerw5tHS+h1DWTJ2iEpvb3NpF0CBtIgB0HCFgSIKuZl0bynq
         zf3ZiTAgrC143MjOPdJuCpuWAtSoZbme0H37jl/Xp5GL+iZdZvCEN2vmzDilzeffWA5v
         5NEScOSpl8pfM+wJCiZnGHgx8PAHb1bx8Vpl2OzMAYZMcf5KkkXjdecnDGb8pO3+QwcL
         V9Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787712040; x=1788316840;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=37syxcZjr+SQHdWr5tam1HRyww9ToksagoIyI3QIPxo=;
        b=axXjsWoVQgWcC08/dlUPggz19blyD+YE3O1ltNcMGt6e3iOoegP+z+jD7mZVWEEsRJ
         DJFp3Ky11SsS38QWvw7pwrtw/xQcql+Lyxqq+nUIxchSGN7TzxD98AxtcmApG0v1sIqd
         qX2+V4CjWEjrPFpDk00tkEMA1mf/TqbD5DGn7mF4o4rdM5NOtP4oKbO1NgXaG0ntBs2L
         3LZNuqRO37abKoMi7AtLqJAkhikOWGmB1LmDiKhpJbTQUI8t06hc4RsFFA0aQaTjTAZw
         bIOG8jWNgsautDdkSRqXD5NbI/IaoCEg2OV3MynO4l4vsmFpY+T65ogiKHte/QX9zva4
         zCKQ==
X-Gm-Message-State: AFuF++nkoVDMAntjdz57MNPW938DkVcHCRx1Kwaf1BjA/VhZGc4zlRUG
	Kcev7o2Y2eA9X3xpRPJVULCeCx26gb86abTj71P/4ORsi9ZhQ0mso1o9
X-Gm-Gg: AR+sD12eX3UfS9eJ5rPJ0gUi2dsTzGf+Z0hrzjVJjktmJuIq25w0g02tC0OvrYwweKK
	ilY6SxDv8IlOYp02aszRc/cE0XjKO4J7JDqZGKNjcgCvpQu7xaocsvyInpXdbWAao8tAF0eKJQg
	bwTDmpsKyNchIIBGqu+REWaIbIgsN0fvL9END9yswhEL+taWGpLlBHwaBsunG0DNPIjkayUoDFo
	yawPqwbvGHtuobQP8mgBaxbmYA3xww1gh6BSeff0VJMuGsg63WN3trtt6zDEzjqMZ9cO+T2TAOq
	YRW2UnqC3HkKHFoZ5+ZuqvinODhfWfIefWTr0meqGBX8VhrFiQgYbVahkrYfSSnE3F8YlSw+yGQ
	VXyivADymHMFDaVihjuKHri9LgQMCw8SZwR2vCJWrqGXdSZRR2scW4eltfhfL9x+/Mmqzh1h6Bl
	Xto03EjW1ARn3lSrvtyARiCUeYWAaBu4A7/r4BSs7Ho8zR6/5c2SlQDE6YQQRP5g==
X-Received: by 2002:a05:690c:c6c9:b0:824:a7ec:e33b with SMTP id 00721157ae682-8574172d157mr12603437b3.34.1787712040275;
        Tue, 25 Aug 2026 19:40:40 -0700 (PDT)
Received: from [172.17.0.2] ([138.28.231.64])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-857053839fdsm9976087b3.10.2026.08.25.19.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 19:40:39 -0700 (PDT)
From: Yuanshen Cao <alex.caoys@gmail.com>
Date: Wed, 26 Aug 2026 02:40:27 +0000
Subject: [PATCH v5 1/5] dmaengine: sun6i-dma: Refactor to support A733
 interrupt and register handling
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-sun60i-a733-dma-v5-1-abc5229b441e@gmail.com>
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

The `sun6i-dma` driver currently uses hardcoded logic for interrupt
handling (reading/writing interrupt enable and status registers) and
register dumping.

To support the Allwinner A733, which has a different register layout and
interrupt handling logic, add `irq_stride`, `irq_en_offset`, and
`irq_stat_offset` to `struct sun6i_dma_config`. Implement generic
`sun6i_read/write_irq_*` functions using these new configuration fields
to accommodate different hardware revisions.

Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
---
 drivers/dma/sun6i-dma.c | 87 +++++++++++++++++++++++++++++++++++++------------
 1 file changed, 67 insertions(+), 20 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index f47a326dd7ff..f305fbfb3545 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -27,7 +27,6 @@
 /*
  * Common registers
  */
-#define DMA_IRQ_EN(x)		((x) * 0x04)
 #define DMA_IRQ_HALF			BIT(0)
 #define DMA_IRQ_PKG			BIT(1)
 #define DMA_IRQ_QUEUE			BIT(2)
@@ -36,8 +35,6 @@
 #define DMA_IRQ_CHAN_WIDTH		4
 
 
-#define DMA_IRQ_STAT(x)		((x) * 0x04 + 0x10)
-
 #define DMA_STAT		0x30
 
 /* Offset between DMA_IRQ_EN and DMA_IRQ_STAT limits number of channels */
@@ -52,6 +49,14 @@
 #define SUNXI_H3_SECURE_REG		0x20
 #define SUNXI_H3_DMA_GATE		0x28
 #define SUNXI_H3_DMA_GATE_ENABLE	0x4
+
+/*
+ * Interrupts specific registers
+ */
+#define DMA_IRQ_STRIDE_A31		0x04
+#define DMA_IRQ_EN_OFFSET_A31		0x00
+#define DMA_IRQ_STAT_OFFSET_A31		0x10
+
 /*
  * Channels specific registers
  */
@@ -144,6 +149,9 @@ struct sun6i_dma_config {
 	u32 dst_addr_widths;
 	bool has_high_addr;
 	bool has_mbus_clk;
+	u32 irq_stride;
+	u32 irq_en_offset;
+	u32 irq_stat_offset;
 };
 
 /*
@@ -234,19 +242,43 @@ to_sun6i_desc(struct dma_async_tx_descriptor *tx)
 	return container_of(tx, struct sun6i_desc, vd.tx);
 }
 
+static u32 sun6i_read_irq_en(struct sun6i_dma_dev *sdev, u32 irq_reg)
+{
+	return readl(sdev->base + irq_reg * sdev->cfg->irq_stride + sdev->cfg->irq_en_offset);
+}
+
+static void sun6i_write_irq_en(struct sun6i_dma_dev *sdev, u32 irq_reg, u32 irq_val)
+{
+	writel(irq_val, sdev->base + irq_reg * sdev->cfg->irq_stride + sdev->cfg->irq_en_offset);
+}
+
+static u32 sun6i_read_irq_stat(struct sun6i_dma_dev *sdev, u32 irq_reg)
+{
+	return readl(sdev->base + irq_reg * sdev->cfg->irq_stride + sdev->cfg->irq_stat_offset);
+}
+
+static void sun6i_write_irq_stat(struct sun6i_dma_dev *sdev, u32 irq_reg, u32 status)
+{
+	writel(status, sdev->base + irq_reg * sdev->cfg->irq_stride + sdev->cfg->irq_stat_offset);
+}
+
 static inline void sun6i_dma_dump_com_regs(struct sun6i_dma_dev *sdev)
 {
-	dev_dbg(sdev->slave.dev, "Common register:\n"
-		"\tmask0(%04x): 0x%08x\n"
-		"\tmask1(%04x): 0x%08x\n"
-		"\tpend0(%04x): 0x%08x\n"
-		"\tpend1(%04x): 0x%08x\n"
-		"\tstats(%04x): 0x%08x\n",
-		DMA_IRQ_EN(0), readl(sdev->base + DMA_IRQ_EN(0)),
-		DMA_IRQ_EN(1), readl(sdev->base + DMA_IRQ_EN(1)),
-		DMA_IRQ_STAT(0), readl(sdev->base + DMA_IRQ_STAT(0)),
-		DMA_IRQ_STAT(1), readl(sdev->base + DMA_IRQ_STAT(1)),
-		DMA_STAT, readl(sdev->base + DMA_STAT));
+	int i;
+
+	for (i = 0; i < 2; i++) {
+		dev_dbg(sdev->slave.dev, "Common register:\n"
+			"chan num %d\n"
+			"\tmask(%04x): 0x%08x\n"
+			"\tpend(%04x): 0x%08x\n"
+			"\tstats(%04x): 0x%08x\n",
+			i,
+			i * sdev->cfg->irq_stride + sdev->cfg->irq_en_offset,
+			sun6i_read_irq_en(sdev, i),
+			i * sdev->cfg->irq_stride + sdev->cfg->irq_stat_offset,
+			sun6i_read_irq_stat(sdev, i),
+			DMA_STAT, readl(sdev->base + DMA_STAT));
+	}
 }
 
 static inline void sun6i_dma_dump_chan_regs(struct sun6i_dma_dev *sdev,
@@ -460,11 +492,11 @@ static int sun6i_dma_start_desc(struct sun6i_vchan *vchan)
 
 	vchan->irq_type = vchan->cyclic ? DMA_IRQ_PKG : DMA_IRQ_QUEUE;
 
-	irq_val = readl(sdev->base + DMA_IRQ_EN(irq_reg));
+	irq_val = sun6i_read_irq_en(sdev, irq_reg);
 	irq_val &= ~((DMA_IRQ_HALF | DMA_IRQ_PKG | DMA_IRQ_QUEUE) <<
 			(irq_offset * DMA_IRQ_CHAN_WIDTH));
 	irq_val |= vchan->irq_type << (irq_offset * DMA_IRQ_CHAN_WIDTH);
-	writel(irq_val, sdev->base + DMA_IRQ_EN(irq_reg));
+	sun6i_write_irq_en(sdev, irq_reg, irq_val);
 
 	writel(pchan->desc->p_lli, pchan->base + DMA_CHAN_LLI_ADDR);
 	writel(DMA_CHAN_ENABLE_START, pchan->base + DMA_CHAN_ENABLE);
@@ -549,14 +581,14 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 	u32 status;
 
 	for (i = 0; i < sdev->num_pchans / DMA_IRQ_CHAN_NR; i++) {
-		status = readl(sdev->base + DMA_IRQ_STAT(i));
+		status = sun6i_read_irq_stat(sdev, i);
 		if (!status)
 			continue;
 
 		dev_dbg(sdev->slave.dev, "DMA irq status %s: 0x%x\n",
 			str_high_low(i), status);
 
-		writel(status, sdev->base + DMA_IRQ_STAT(i));
+		sun6i_write_irq_stat(sdev, i, status);
 
 		for (j = 0; (j < DMA_IRQ_CHAN_NR) && status; j++) {
 			pchan = sdev->pchans + j;
@@ -1072,9 +1104,11 @@ static struct dma_chan *sun6i_dma_of_xlate(struct of_phandle_args *dma_spec,
 
 static inline void sun6i_kill_tasklet(struct sun6i_dma_dev *sdev)
 {
+	int i;
+
 	/* Disable all interrupts from DMA */
-	writel(0, sdev->base + DMA_IRQ_EN(0));
-	writel(0, sdev->base + DMA_IRQ_EN(1));
+	for (i = 0; i < 2; i++)
+		sun6i_write_irq_en(sdev, i, 0);
 
 	/* Prevent spurious interrupts from scheduling the tasklet */
 	atomic_inc(&sdev->tasklet_shutdown);
@@ -1098,6 +1132,11 @@ static inline void sun6i_dma_free(struct sun6i_dma_dev *sdev)
 	}
 }
 
+#define SUN6I_DMA_IRQ_A31_COMMON_CFG	\
+	.irq_stride      = DMA_IRQ_STRIDE_A31,	\
+	.irq_en_offset   = DMA_IRQ_EN_OFFSET_A31,	\
+	.irq_stat_offset = DMA_IRQ_STAT_OFFSET_A31,
+
 /*
  * For A31:
  *
@@ -1129,6 +1168,7 @@ static struct sun6i_dma_config sun6i_a31_dma_cfg = {
 	.dst_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
 			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES),
+	SUN6I_DMA_IRQ_A31_COMMON_CFG
 };
 
 /*
@@ -1152,6 +1192,7 @@ static struct sun6i_dma_config sun8i_a23_dma_cfg = {
 	.dst_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
 			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES),
+	SUN6I_DMA_IRQ_A31_COMMON_CFG
 };
 
 static struct sun6i_dma_config sun8i_a83t_dma_cfg = {
@@ -1170,6 +1211,7 @@ static struct sun6i_dma_config sun8i_a83t_dma_cfg = {
 	.dst_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
 			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES),
+	SUN6I_DMA_IRQ_A31_COMMON_CFG
 };
 
 /*
@@ -1197,6 +1239,7 @@ static struct sun6i_dma_config sun8i_h3_dma_cfg = {
 			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_8_BYTES),
+	SUN6I_DMA_IRQ_A31_COMMON_CFG
 };
 
 /*
@@ -1218,6 +1261,7 @@ static struct sun6i_dma_config sun50i_a64_dma_cfg = {
 			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_8_BYTES),
+	SUN6I_DMA_IRQ_A31_COMMON_CFG
 };
 
 /*
@@ -1241,6 +1285,7 @@ static struct sun6i_dma_config sun50i_a100_dma_cfg = {
 			     BIT(DMA_SLAVE_BUSWIDTH_8_BYTES),
 	.has_high_addr = true,
 	.has_mbus_clk = true,
+	SUN6I_DMA_IRQ_A31_COMMON_CFG
 };
 
 /*
@@ -1263,6 +1308,7 @@ static struct sun6i_dma_config sun50i_h6_dma_cfg = {
 			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_8_BYTES),
 	.has_mbus_clk = true,
+	SUN6I_DMA_IRQ_A31_COMMON_CFG
 };
 
 /*
@@ -1286,6 +1332,7 @@ static struct sun6i_dma_config sun8i_v3s_dma_cfg = {
 	.dst_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
 			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES),
+	SUN6I_DMA_IRQ_A31_COMMON_CFG
 };
 
 static const struct of_device_id sun6i_dma_match[] = {

-- 
2.55.0

