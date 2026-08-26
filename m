Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979DB2E7165
	for <dmaengine@vger.kernel.org>; Wed, 26 Aug 2026 02:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787712050; cv=none; b=maGnzlXudfcJzjJYF2DmDOjlmLmvuS2T4OCeUk0cf0btqYe/R6oTrGAhStvhMQcOAgflL43dx96Pwwap+62HfOUYYmroIV2uJfjGiyh4F8LolGUZ9chvDHrZr+7CulixI62delb254Zci1vOC9azt7mw/auDDa0rIBRZivlbO7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787712050; c=relaxed/simple;
	bh=Q/ba6rrz9Iw7+Y9A/qw1n7IqOmUJJcPITi7eRXxJZSc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T5QF3L4aJ6bnEvz8qlGQsxB8Oc5x6/lKIUwb8vIk5jV2sJ94BDfM6/MyRh5PrrifrB4hxAA7rFUIjMkOHSujVSThxMFsjD8V31YqeLgefZnO9K2oya14dYkEd+/Amp9uEvVBqHgfdDq9UN+3MsQJl23R5rYx0MGdONfEj9GtrGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gosEKn4A; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gosEKn4A"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-836ce6cbe1eso3263997b3.1
        for <dmaengine@vger.kernel.org>; Tue, 25 Aug 2026 19:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787712046; x=1788316846; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sFcQNAEgapc01hiKVhmrcgq3W/QfrjksyHpLfTytFFk=;
        b=gosEKn4Ae2thekxEljK1f1QiyPyJSYQz0SxdQTk7qaqUzTKHyXuwmx06CZ5WQnIe8U
         b4RpAxVIGv8+9WvPUUSmwgAGQrdNkwC78LmfJV4HEfHBiHz9QH80ZeDwJV80GoM7VRFP
         wFcDdrW6n2OmIaj6GKjGFaTcEeqfHK2vHYYE4f95XzZyMlob3ymhShWDpVBe4tHRPQni
         qIjZxJS0MQIQZQLU0Laz8fQOWI3r6JaLBIaino5Sm9f5cbtz+dn8kpxV+3FnZLBTQ3P3
         y69Mr+KRP4MgL66QeEP5r+mIqPFFNwlhVvblsergCNOpUKI6oE5LgZQVFE2iarxjjzlJ
         XC8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787712046; x=1788316846;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sFcQNAEgapc01hiKVhmrcgq3W/QfrjksyHpLfTytFFk=;
        b=S+lm+ASBaUVEkioSOJrhSIuDJLHi8sV8bsg00Bl3iS0ijVd+wXuMrd09KaSO7gA/2i
         JZ+FTh+Z2Erpm7ueI82ZNKPUAOUHY2rdOsuU6RxUNqLdSgJG0JdHvCLsdmtlwUixXQty
         9f4VvxbqFFst0BtiygT3wv6FXW11NSw+qp/n8H0vWtEZS9I8vPDbzNjAX5BXR0rr1qHk
         W8xxJr1e+leWrbe2ccXC9mo4HNGkVJ+VWiom3pNG8raBYL/T3PshAqleGUyTi4cidHWQ
         0jAA25j8WOHwwCl4FCXWcl4ZdzsmV2WO06QPMwXmR/GGoYF+7JYk8dFRDPpRfnsgQbcP
         b4RA==
X-Gm-Message-State: AFuF++ncfK7NZFAVBLFvbtQVpTNdnJHee5DKVEIwtk2Jde9LSfHikDwz
	n77Ff3jFknO89ji+kczkG0x7+IPEwxjdm7//pCjGy6p/zonRsUxHLNWK
X-Gm-Gg: AR+sD10uu+TzSPFa+jEH6y9hTTV5GnCCe2RL3rrhGEWOFNJ0enlQj0WYCHMfLwgrZff
	hVnDmSPRtIn3JzDzXP4cN6jpV+kBpBJPIk5g8avWir5OALy7Y9qcEfn8JuSv2vD6lE/krmAWL3Q
	Rx1sN+MR5TbTLZJkC21YP5jLSN7BEGr4XF4/smSsFasX5oa4srqhcSVTrn/tm6Gu0mAR73VgBiT
	ryOahvGy4xsADWe1tbd4dsPR4JqL8F3mlpK5ddJFBJVHYyPLCxN0eyBWxSaykZ/5FPZblT79h5u
	QuGw8yGFnvLQh15OGZe0IOhhisD+NVQ12ghNhuqhVCQp9wnWXk9PkWQgEYkuiMfmCV7N9JiNdR6
	ulyG569nIuAw90Zcv7zVbNlGTun/ktD5hBv8r0Oxzae7J6pYo7YciEHm3c64SO/u65xYmNiEnNh
	2idwmpRQ6h3JUFFiuhykD/Ei4KEbhFfW4tapuZc6TA5B5WOrucY35f+b5Ecz8VHw==
X-Received: by 2002:a05:690c:a583:b0:845:23cf:7c01 with SMTP id 00721157ae682-8573c7dfc2dmr13611677b3.10.1787712045994;
        Tue, 25 Aug 2026 19:40:45 -0700 (PDT)
Received: from [172.17.0.2] ([138.28.231.64])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-857053839fdsm9976087b3.10.2026.08.25.19.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 19:40:45 -0700 (PDT)
From: Yuanshen Cao <alex.caoys@gmail.com>
Date: Wed, 26 Aug 2026 02:40:31 +0000
Subject: [PATCH v5 5/5] dmaengine: sun6i-dma: Implement support for
 Allwinner A733 DMA controller
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-sun60i-a733-dma-v5-5-abc5229b441e@gmail.com>
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

Implement support for the Allwinner A733 DMA controller by defining
A733-specific register offsets, bitfield masks, and the
`sun60i_a733_dma_cfg` configuration structure.

This includes the IRQ stride, offsets, and channel counts specific to the
A733, as well as the 32G mask for high-address fields in the LLI. Add
`sun60i_a733_dma_cfg`, which ties all the refactored functionality
together for A733.

Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
---
 drivers/dma/sun6i-dma.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index ffb63212bea7..66281e01972d 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -54,10 +54,14 @@
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
@@ -107,6 +111,8 @@
  */
 #define SRC_HIGH_ADDR_MASK	GENMASK(17, 16)
 #define DST_HIGH_ADDR_MASK	GENMASK(19, 18)
+#define SRC_HIGH_ADDR_32G_MASK	GENMASK(13, 11)
+#define DST_HIGH_ADDR_32G_MASK	GENMASK(17, 15)
 
 /*
  * Various hardware related defines
@@ -1318,6 +1324,32 @@ static struct sun6i_dma_config sun50i_h6_dma_cfg = {
 	SUN6I_DMA_IRQ_A31_COMMON_CFG
 };
 
+/*
+ * The A733 binding uses the number of dma channels from the
+ * device tree node.
+ */
+static struct sun6i_dma_config sun60i_a733_dma_cfg = {
+	.clock_autogate_enable = sun6i_enable_clock_autogate_h3,
+	.set_burst_length = sun6i_set_burst_length_h3,
+	.set_drq          = sun6i_set_drq_h6,
+	.set_mode         = sun6i_set_mode_h6,
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
@@ -1352,6 +1384,7 @@ static const struct of_device_id sun6i_dma_match[] = {
 	{ .compatible = "allwinner,sun50i-a64-dma", .data = &sun50i_a64_dma_cfg },
 	{ .compatible = "allwinner,sun50i-a100-dma", .data = &sun50i_a100_dma_cfg },
 	{ .compatible = "allwinner,sun50i-h6-dma", .data = &sun50i_h6_dma_cfg },
+	{ .compatible = "allwinner,sun60i-a733-dma", .data = &sun60i_a733_dma_cfg },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, sun6i_dma_match);

-- 
2.55.0

