Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A819238166
	for <dmaengine@vger.kernel.org>; Wed, 26 Aug 2026 01:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787707839; cv=none; b=b3NEDmwsc5LgRmsCzAq1cw/Kgg41LTE/5E1Um7qfeVad0APYiV63dEjf9F/sSl0K1WRSt9Yezh8FOyfEOe61U9VsQrxIOVGV5V9/72C6r2JLkNlTfK17bFOWeiKu0+Noj0wPsDrPiecei2a25L51bJgkdgB0x/KGV3c9lcHWV8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787707839; c=relaxed/simple;
	bh=iEeYpXVBs+6TjhynLsq72YEZrB4FSj6Ah2QNjNtJqLc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QlV3s3eUHW3nzw3//ZV6VLjDeWzU/tIU5dA3/gsrn1130+05aVzDpFJR03cDCNUNQf25gP2fU3ebQSdK3+mEaRO2RwDwRSiH70ncmC0ZmMiJT/he23aU2JSkDq3nVf9BJrYfyK0F9pidFAw/HrcEmnq5okxAUWhdHzTQvPq9/xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lukzKeLT; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lukzKeLT"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-92e7632b193so21327285a.2
        for <dmaengine@vger.kernel.org>; Tue, 25 Aug 2026 18:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787707830; x=1788312630; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+RELVhCB2dHvNU7KH92aA8UYXxthIHKWatUemcM2Bk0=;
        b=lukzKeLTe92vK0qJi0omI0wEgy1ivSQXoF58RlKf2Z6vf2AaGd4DGp9YoGAnY1eglj
         R6/PAyIh4t9hSjHw5ssFY8XPvKgMFLo81DkQbKBMVvCasHlWsfWMD6PkquW9/zP9+csY
         yR0ifWkJcAjq8k25jcHeCGcokvlE6nVZOCq4Nha7uTgHvIg6d6M7SXD4rUn7k8n3uCcy
         uBXj1EJvd2T+RDNpO3npGRxtxb5mNGx1pENScSMAWdKEmuBnv1IweCrp5j9hKVQl70JU
         2gmENnxSZA4/pjDLZAup01hNwi7+uJLwGusJBroGs9m7irQLF3MAtIbUr98dwPA1MuQH
         7RCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787707830; x=1788312630;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+RELVhCB2dHvNU7KH92aA8UYXxthIHKWatUemcM2Bk0=;
        b=b+M1yyf7zi425oOf1j/468Rw56zclc5EJzMUoz9ZC+Dh5WEUzEivKuTXQKbm21jXeX
         rcN2oFvm5VlRvJXFNgyioj+I11gW/620oksfCt2tmJq7LmKAI/NmX3m6PcyK1bYp7UrT
         udC7OTUYDrKb5XYUoO0fVe1wHhXKvCqCsShfujtLpNnjrFvK8zRvbXTFcBqa/wvKXS4U
         pnUPKaHXB80oFzqyYPgLpuE8ssKvbEXg/5zPSJGbD6SrvsHIXlmN/1WXCxFIUnzaQoGM
         7Q+AyTR2HAGjQqgX9n0YiE+KoGsxyIFyDBSlAPnBu8AB5yQospIVf/cQ4qcZnrWvyUry
         7mVw==
X-Forwarded-Encrypted: i=1; AHgh+RrAM9yF8X8C5TTDxsm1huFGkYwtFvijGRZf+5nLSKQllYrSP/OeNiRXPog1kvWjD9ZK+u+OjqMtWVc=@vger.kernel.org
X-Gm-Message-State: AFuF++ntOqDnLHFzRErcGLR3jxr0jiCKxrgF00IdlRPh8keKoTw4qTVg
	9rNMeE6QvKF61g8o+Bc6/e+wcsDNE+7PrLqe9rUUCAh7m02nU1AhKTt0
X-Gm-Gg: AR+sD11Tr5IskvXaxPkm4CgQybKeP36kz6xrYP7/8s7fSn/l+xhPpKazhqcGFYu9CwS
	wckwrjUD2+YHtvGlDWUAE8dpl7FICJPaYkb3Efqyjj+c+X8nKLWGh+hCyvFxF/Swcl463xapkH6
	1Z3Ve4Gfe/MyOpYjA4SP8cm0XSWHeaK3s6/+XwACBaSnyzQt/PLRlXP5bMGmGSG+bL4c5Yho8Qj
	1u9fFOKF2xayPYoKLAczreB8wygJpGeQ4MtECbn+nlpMuW0a+86WIvit5sa8dvvmX/TtsDE2HaO
	WkGKGwY80Gmlrem2o/3ItG71jKW8jLRwqyBMRH9XyJlSn7fxPi+iM7N+0CM1V0AYEszQz5u1EdE
	6opwQ/Cxku+NHPR9IJjZJjfanXIbub5HjsEs4RGDcY2+O/+wOjcOBCeDiLL+nOAQKVM6J8ErHxX
	5v4GsJ3I5/vVBdAnVbza+eJ/DNfOJvcYtYGlcSF+q/NTHgVlZlo3aH749+GYY+2g==
X-Received: by 2002:a05:620a:8306:b0:937:11c9:37f1 with SMTP id af79cd13be357-9378015274emr224520185a.16.1787707830137;
        Tue, 25 Aug 2026 18:30:30 -0700 (PDT)
Received: from [172.17.0.2] ([138.28.231.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9377e67c52csm102398585a.38.2026.08.25.18.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 18:30:29 -0700 (PDT)
From: Yuanshen Cao <alex.caoys@gmail.com>
Date: Wed, 26 Aug 2026 01:30:07 +0000
Subject: [PATCH v4 5/5] dmaengine: sun6i-dma: Add support for Allwinner
 A733 DMA controller
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-sun60i-a733-dma-v4-5-dc2f745f40dc@gmail.com>
References: <20260826-sun60i-a733-dma-v4-0-dc2f745f40dc@gmail.com>
In-Reply-To: <20260826-sun60i-a733-dma-v4-0-dc2f745f40dc@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: Yuanshen Cao <alex.caoys@gmail.com>, dmaengine@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.16.0

Implement support for the Allwinner A733 DMA controller by defining
A733-specific register offsets, bitfield masks, and the
`sun60i_a733_dma_cfg` configuration structure.

This includes the IRQ stride, offsets, and channel counts specific to the
A733, as well as the 32G mask for high-address fields in the LLI. Add
`sun60i_a733_dma_cfg`, which ties all the refactored functionality
together for A733.

Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
---
 drivers/dma/sun6i-dma.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index b96d7d90f6b5..fb371b57d792 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -57,10 +57,14 @@
  * Interrupts specific registers
  */
 #define DMA_IRQ_STRIDE_A31		0x04
+#define DMA_IRQ_STRIDE_A733		0x40
 #define DMA_IRQ_EN_OFFSET_A31		0x00
+#define DMA_IRQ_EN_OFFSET_A733		0x134
 #define DMA_IRQ_STAT_OFFSET_A31		0x10
+#define DMA_IRQ_STAT_OFFSET_A733		0x138
 
 #define DMA_IRQ_CHAN_NR_A31		8
+#define DMA_IRQ_CHAN_NR_A733		1
 
 /*
  * Channels specific registers
@@ -110,6 +114,8 @@
  */
 #define SRC_HIGH_ADDR_MASK	GENMASK(17, 16)
 #define DST_HIGH_ADDR_MASK	GENMASK(19, 18)
+#define SRC_HIGH_ADDR_32G_MASK	GENMASK(13, 11)
+#define DST_HIGH_ADDR_32G_MASK	GENMASK(17, 15)
 
 /*
  * Various hardware related defines
@@ -1321,6 +1327,29 @@ static struct sun6i_dma_config sun50i_h6_dma_cfg = {
 	SUN6I_DMA_IRQ_A31_COMMON_CFG
 };
 
+/*
+ * The A733 binding uses the number of dma channels from the
+ * device tree node.
+ */
+static struct sun6i_dma_config sun60i_a733_dma_cfg = {
+	.clock_autogate_enable = sun6i_enable_clock_autogate_h3,
+	.src_burst_lengths = BIT(1) | BIT(4) | BIT(8) | BIT(16),
+	.dst_burst_lengths = BIT(1) | BIT(4) | BIT(8) | BIT(16),
+	.src_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
+			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
+			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES),
+	.dst_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
+			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
+			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES),
+	.src_high_addr_mask = SRC_HIGH_ADDR_32G_MASK,
+	.dst_high_addr_mask = DST_HIGH_ADDR_32G_MASK,
+	.has_mbus_clk = true,
+	.irq_stride      = DMA_IRQ_STRIDE_A733,
+	.irq_en_offset   = DMA_IRQ_EN_OFFSET_A733,
+	.irq_stat_offset = DMA_IRQ_STAT_OFFSET_A733,
+	.num_channels_per_reg = DMA_IRQ_CHAN_NR_A733,
+};
+
 /*
  * The V3s have only 8 physical channels, a maximum DRQ port id of 23,
  * and a total of 24 usable source and destination endpoints.
@@ -1355,6 +1384,7 @@ static const struct of_device_id sun6i_dma_match[] = {
 	{ .compatible = "allwinner,sun50i-a64-dma", .data = &sun50i_a64_dma_cfg },
 	{ .compatible = "allwinner,sun50i-a100-dma", .data = &sun50i_a100_dma_cfg },
 	{ .compatible = "allwinner,sun50i-h6-dma", .data = &sun50i_h6_dma_cfg },
+	{ .compatible = "allwinner,sun60i-a733-dma", .data = &sun60i_a733_dma_cfg },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, sun6i_dma_match);

-- 
2.55.0

