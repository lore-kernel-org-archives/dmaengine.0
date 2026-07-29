Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7870A4749D6;
	Wed, 29 Jul 2026 11:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785325616; cv=none; b=cx9//w2rmuJxOsIr9dplOS9VNoTVkj/V/caGQUSTmwBppXbloGJrLG2/853dfi7MLStjLRW3jPnpZ9NWWWrIN7ed8xFreP/meZTTYCw4RHQj7V7Nz4hs8VePsqrRvt4BuJw+5jnNkXkh9fTM10hfM/NjvrLVUOy7DdjKFY9Aa40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785325616; c=relaxed/simple;
	bh=KF1A2iyE3TFi2OyUnOG2tm9359rUCpVRvLWRA/axo+E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CNCBp7bTVekKotk3ZMKIx+dWsCdP+iOrkjwh8iEbvZZCE90U4z8v//LxwlSF08rKKhY9fPt+otSNOEuE6Y6nR9/pMKQ4Jb8kxJgQ1xr9MQ3fiLVgPv6SH9pxqK3qtgOioajxd/v0oYvKPaSs48uwFGq6dQ8INtqtKxC0+yDRDy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=QLrqABkH; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="QLrqABkH"
Received: by chaosmail.tech (Postfix) id CE0D11C8820;
	Wed, 29 Jul 2026 11:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1785325606;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9tmvwrJ0xAvFpL6kO2DR2jbek1e3eFM52GDYpZIs/VY=;
	b=QLrqABkHOz64G5kfp690ogIu7bvkdHeN6I338zpf2aZn5pCyZceseeOYbqk4OQfL+FpDOj
	R10ck+9emtf5G9OqC1GhEWzeYa0SvAukHmUyrIQs+/lp9CXV/Oy/zqVWx9Iwz1iyxUT89l
	D6/ML06tj5xuJAtWT7r7opDwtt68qNY=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Wed, 29 Jul 2026 13:46:35 +0200
Subject: [PATCH v2 2/2] dmaengine: apple-admac: Add M3 generation ADMACs
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-t603x-admac-v2-2-e4b2bb6ca45e@chaosmail.tech>
References: <20260729-t603x-admac-v2-0-e4b2bb6ca45e@chaosmail.tech>
In-Reply-To: <20260729-t603x-admac-v2-0-e4b2bb6ca45e@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <k@chaosmail.tech>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785325604; l=3308;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=KF1A2iyE3TFi2OyUnOG2tm9359rUCpVRvLWRA/axo+E=;
 b=OOecFCG2yjQneFPJHEl1F5nHn6efDo2iklDsDRWNddvwJXHoGDxa7EnG+KlZWXOGt0V5D6gPb
 9x9dBgXW/uWAEsaI4e+Yd/k+RFn9aoBF4S1aCFhTlP7kHGAFoghUUQc
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=

The admacs present on t8122 and t603x SoCs need additional writes in
order to operate correctly. The exact purpose of this register
is unknown

Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 drivers/dma/apple-admac.c | 32 ++++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/apple-admac.c b/drivers/dma/apple-admac.c
index 14a5ee14a481..72ff677c8ce5 100644
--- a/drivers/dma/apple-admac.c
+++ b/drivers/dma/apple-admac.c
@@ -39,10 +39,14 @@
 
 #define FLAG_DESC_NOTIFY	BIT(16)
 
+#define T8122_UNK_28_VAL	0x200000
+
 #define REG_TX_START		0x0000
 #define REG_TX_STOP		0x0004
 #define REG_RX_START		0x0008
 #define REG_RX_STOP		0x000c
+#define REG_UNK_28		0x0028
+#define REG_UNK_2C		0x002c
 #define REG_IMPRINT		0x0090
 #define REG_TX_SRAM_SIZE	0x0094
 #define REG_RX_SRAM_SIZE	0x0098
@@ -127,6 +131,7 @@ struct admac_data {
 	struct mutex cache_alloc_lock;
 	struct admac_sram txcache, rxcache;
 
+	bool set_unk28;
 	int irq;
 	int irq_index;
 	int nchannels;
@@ -147,6 +152,10 @@ struct admac_tx {
 	struct list_head node;
 };
 
+struct admac_hw {
+	bool set_unk28;
+};
+
 static int admac_alloc_sram_carveout(struct admac_data *ad,
 				     enum dma_transfer_direction dir,
 				     u32 *out)
@@ -747,6 +756,11 @@ static int admac_device_config(struct dma_chan *chan,
 	u32 bus_width = readl_relaxed(ad->base + REG_BUS_WIDTH(adchan->no)) &
 		~(BUS_WIDTH_WORD_SIZE | BUS_WIDTH_FRAME_SIZE);
 
+	if (ad->set_unk28) {
+		writel_relaxed(T8122_UNK_28_VAL, ad->base + REG_UNK_28);
+		writel_relaxed(T8122_UNK_28_VAL, ad->base + REG_UNK_2C);
+	}
+
 	switch (is_tx ? config->dst_addr_width : config->src_addr_width) {
 	case DMA_SLAVE_BUSWIDTH_1_BYTE:
 		wordsize = 1;
@@ -805,6 +819,7 @@ static int admac_probe(struct platform_device *pdev)
 	struct device_node *np = pdev->dev.of_node;
 	struct admac_data *ad;
 	struct dma_device *dma;
+	const struct admac_hw *hw;
 	int nchannels;
 	int err, irq, i;
 
@@ -813,6 +828,9 @@ static int admac_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "missing or invalid dma-channels property\n");
 		return -EINVAL;
 	}
+	hw = of_device_get_match_data(&pdev->dev);
+	if (!hw)
+		return -EINVAL;
 
 	ad = devm_kzalloc(&pdev->dev, struct_size(ad, channels, nchannels), GFP_KERNEL);
 	if (!ad)
@@ -821,6 +839,7 @@ static int admac_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, ad);
 	ad->dev = &pdev->dev;
 	ad->nchannels = nchannels;
+	ad->set_unk28 = hw->set_unk28;
 	mutex_init(&ad->cache_alloc_lock);
 
 	/*
@@ -935,9 +954,18 @@ static void admac_remove(struct platform_device *pdev)
 	reset_control_rearm(ad->rstc);
 }
 
+static const struct admac_hw admac_t8103_hw = {
+	.set_unk28 = false,
+};
+
+static const struct admac_hw admac_t8122_hw = {
+	.set_unk28 = true,
+};
+
 static const struct of_device_id admac_of_match[] = {
-	{ .compatible = "apple,t8103-admac", },
-	{ .compatible = "apple,admac", },
+	{ .compatible = "apple,t8122-admac", .data = &admac_t8122_hw },
+	{ .compatible = "apple,t8103-admac", .data = &admac_t8103_hw },
+	{ .compatible = "apple,admac", .data = &admac_t8103_hw },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, admac_of_match);

-- 
2.55.0

