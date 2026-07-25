Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51E321CC44;
	Sat, 25 Jul 2026 12:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784982382; cv=none; b=sSRSZyB50BxaEY65DMZiCUGkb55+CRGDbLK21ySEmULNFD3nOxSCjeft4M/BGKRlFRifXuLd4nPFnPnrZMm2akyzQVeilLYG8aSvNVr5iLJHQD6G9DN/ZyC8avlL1/JS46liebU9ZHVrVP9ymIsFyXguCKW7KHbTIOncpImMC0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784982382; c=relaxed/simple;
	bh=ZMGropUP2WdpAYQkvJed9sV/RKshVltisNwaLVXH1rM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rDc1yITqQu/G/tNykqw8pzNiKxGTPVmGfFMXCpo8hkXieMYQtCIjYzJ0dKC3GcCFJZ5NOPfL8yn0BmobcNBEXMTjlIWo7EfpIXj1iSD65YJp7jBDx6faT4gneAF0/f0LS7s6Aun3b7h2Z4/ghBqI8alwBVXoDJEKRMxCmJWjB1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=cohOaONL; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="cohOaONL"
Received: by chaosmail.tech (Postfix) id B4BCB1C8829;
	Sat, 25 Jul 2026 12:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1784982371;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PhLi5spYWXcMVuF6GZd55l1tVJZbYbFAOR7DnpSDG7I=;
	b=cohOaONLOPQv57VllKM2f6217PubX14P/YSMA9dc/q0nvqhvWnWpiH3m6tM1EUqBf0yT0W
	oIExO535bxfsxy+60221nguosR10CO1E0woaR4ifSSjzYE+F+HotxwfvIxpB3rd17plEbv
	s4M86w6i39CLp80bgC+Ofau5ph/eODs=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Sat, 25 Jul 2026 14:25:57 +0200
Subject: [PATCH 2/2] dmaengine: apple-admac: Add M3 generation ADMACs
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260725-t603x-admac-v1-2-6a4dec023f02@chaosmail.tech>
References: <20260725-t603x-admac-v1-0-6a4dec023f02@chaosmail.tech>
In-Reply-To: <20260725-t603x-admac-v1-0-6a4dec023f02@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <k@chaosmail.tech>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784982368; l=3308;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=ZMGropUP2WdpAYQkvJed9sV/RKshVltisNwaLVXH1rM=;
 b=pZcylqFAj6gEUftFZ8u+rR/Vd8+7Y/pgBw2PPy+lew+ETa95bTBF5y5qD6BHdgV+daKslq0Jq
 IlSf4uv6E5PC1iQ56JrDdVNyrPJBSYKQo6sw2WWKFkngLwJ6ppngcFE
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
index 14a5ee14a481..7ee9a59081c1 100644
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
 
+static const struct admac_hw admac_t8013_hw = {
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
+	{ .compatible = "apple,t8103-admac", .data = &admac_t8013_hw },
+	{ .compatible = "apple,admac", .data = &admac_t8013_hw },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, admac_of_match);

-- 
2.55.0

