Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5165B3F483D;
	Wed, 12 Aug 2026 09:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786526809; cv=none; b=i0rl9J79g/MkDe0fd+PidIkIYp9a2wNoxTxJiWVRmyxEaXzn5tVKvODvPSZ7wJ9abZdT0MN+pB+bJFa3lrJPRkViYTskIUS4OOxx9zNRGfkv33O2TsqNYUH04h1TIBf6eFKSh6JCVGZyAoX3w14p/AG9yoBCuu8pXBycH1WYZ/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786526809; c=relaxed/simple;
	bh=iqpgnXjoJctug1BS/CGLHHYEeWe15yGKDUxQ6dH13qQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b+NWWF2YwWMK7obujJzn8H9prVpMUJVOCjhtGImcK//i2TcuQjcGMfjhSb9zAMmpG3OGU57ghEMZXMIUY6FN3xijoLHndJ1WnyYfN5pcOS0WgbEUhreD6dTw0BKqSINe0l381Jf8Yo1etWter1LRLG/TVUbA7wv8iqYQUpp1X/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=rNr92pCX; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="rNr92pCX"
Received: by chaosmail.tech (Postfix) id 525731CBF49;
	Wed, 12 Aug 2026 09:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1786526800;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nro8Z0P34FiLOz9GekJpKeBnvOZx/XL2v+1wurWV7cA=;
	b=rNr92pCXZ4vaNHvd/VvNbi8vEEEZ3ebtgTRqb6Do2t648LZgznF9JJUUNnC5m9UWjAtvmI
	reQKn2wbKf6mAcmcaVri19JyTPXGzJ/wyvbXsuRotoF9a6zHTdYd0J9DbAYNm4LhdjDEwu
	U+H4jz6hLeV/Vw8kP8p6DIHIyNPqIZQ=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Wed, 12 Aug 2026 11:26:34 +0200
Subject: [PATCH v3 2/2] dmaengine: apple-admac: Add M3 generation ADMACs
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-t603x-admac-v3-2-d1f137f803e1@chaosmail.tech>
References: <20260812-t603x-admac-v3-0-d1f137f803e1@chaosmail.tech>
In-Reply-To: <20260812-t603x-admac-v3-0-d1f137f803e1@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <k@chaosmail.tech>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786526797; l=2761;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=iqpgnXjoJctug1BS/CGLHHYEeWe15yGKDUxQ6dH13qQ=;
 b=2rnOo8+wzdSbWJ7P2hhJ5HESQh4EKmOYckNlJHriSClRw8ejfOfqy9vaxCGXEFiQRq/qszbJe
 1+LQAp1QFd3BSfFKFaoMohjBztDe0TgTVf4rhdu2P8rq0l5Hspsggs2
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=

The admacs present on t8122 and t603x SoCs need additional writes in
order to operate correctly. The exact purpose of this register
is unknown

Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 drivers/dma/apple-admac.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/dma/apple-admac.c b/drivers/dma/apple-admac.c
index 14a5ee14a481..fd6236c7c024 100644
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
 
@@ -822,6 +837,9 @@ static int admac_probe(struct platform_device *pdev)
 	ad->dev = &pdev->dev;
 	ad->nchannels = nchannels;
 	mutex_init(&ad->cache_alloc_lock);
+	hw = of_device_get_match_data(&pdev->dev);
+	if (hw)
+		ad->set_unk28 = hw->set_unk28;
 
 	/*
 	 * The controller has 4 IRQ outputs. Try them all until
@@ -935,7 +953,12 @@ static void admac_remove(struct platform_device *pdev)
 	reset_control_rearm(ad->rstc);
 }
 
+static const struct admac_hw admac_t8122_hw = {
+	.set_unk28 = true,
+};
+
 static const struct of_device_id admac_of_match[] = {
+	{ .compatible = "apple,t8122-admac", .data = &admac_t8122_hw },
 	{ .compatible = "apple,t8103-admac", },
 	{ .compatible = "apple,admac", },
 	{ }

-- 
2.55.0

