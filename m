Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD0936EAA4;
	Sun, 27 Sep 2026 09:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790499832; cv=none; b=OldqVP+Hd4zEWqzsFbvNnd/M8TXbdsuv/y4ZoHXOcYJVhWbj3oLEHNFTvKGFkdBeym/eMz547lPBxE69JyO33iJ17TMKKE1Hmve6V89HASoyiuvlA2thrw1Y9TL7jfqukbmtN0WEO7E2HZokhvgW6wgPXGQrj6KNpcTdoduqubY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790499832; c=relaxed/simple;
	bh=GjYBghR8lvbcWUMNNuUf3bkqPEiweR9OTdLjh1wKATU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=prUtfvWEO5Xt71PXtIu9n53EzkTHYjQhfJ3FlTFVG6+6IajqJLDFYjXbtZtop24g/voVTeO1MUXJ8zUZfSuG1IH6TgxMgGc316/PQ8jf1zXfIcxOFMM+Z00MG4LoJJ06JRiiqfjktPXeBytcSVWDHHf7de+J6MTAqpSyE9AAqoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gKpdiyDj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gKpdiyDj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D45371F000FF;
	Sun, 27 Sep 2026 09:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790499831;
	bh=ltnfreQ1KYDoX1EuYMlLJEcYXQGR6tVxiOcY+313dtc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=gKpdiyDj+YRzUQBTgTLP4qp4Gd4kHHibC1jORAISxvtcZ4Z38xHucCfvWg6xua19u
	 Ktx3ZJWFdWiqG17UCSX8QQutdQ3VeessdGswhebCobymihMpiC7KrH4KiAT88DRMvW
	 D7/4uTulz71aL8+giCpjv1tOr1o8PjvppVFYimodFqFZ5fa0A+UpK/F46beZUwz0X1
	 VV/Tiqi3RYIuy49znr01vghS7eJ9CfB/O+NgXzfzj2ZDFbJEa/rVFXZm68BlMIHJAC
	 X2iKKBnAAiDdvwd0sefgN1U2uVw/wad3quco9XlaRuFKuGKt9hKW864PcK++ubUSES
	 EswkPzBpbHMiw==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 27 Sep 2026 11:03:28 +0200
Subject: [PATCH v7 15/24] dmaengine: ste_dma40: Fix memcpy channel parsing
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260927-dma40-fixes-v7-15-89f595e8851d@kernel.org>
References: <20260927-dma40-fixes-v7-0-89f595e8851d@kernel.org>
In-Reply-To: <20260927-dma40-fixes-v7-0-89f595e8851d@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, phone-devel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, sashiko-bot@kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.3

d40_of_probe() validates the memcpy-channels property against
D40_MEMCPY_MAX_CHANS, but reads the property directly into a smaller global
array. A long property can therefore overwrite adjacent data. The mutable
global also lets a later DMA40 instance replace the memcpy channel mapping
used for future allocations on an earlier instance.

Store the mapping in the per-device platform data, validate the property
against that storage, and check the property read result. The property is
required and d40_probe() always populates the platform data, so remove the
obsolete global mapping and fallback.

Fixes: a7dacb68b35a ("dmaengine: ste_dma40: Allow memcpy channels to be configured from DT")
Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/dmaengine/20260819225215.5EA2F1F000E9@smtp.kernel.org/
Assisted-by: LLM
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c | 45 ++++++++++++++-------------------------------
 1 file changed, 14 insertions(+), 31 deletions(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 70f2a6594945..43a6ded6aa09 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -28,6 +28,8 @@
 #include "ste_dma40.h"
 #include "ste_dma40_ll.h"
 
+#define D40_MEMCPY_MAX_CHANS	8
+
 /**
  * struct stedma40_platform_data - Configuration struct for the dma device.
  *
@@ -41,6 +43,7 @@
  * to use SoftLLI.
  * @use_esram_lcla: flag for mapping the lcla into esram region
  * @num_of_memcpy_chans: The number of channels reserved for memcpy.
+ * @memcpy_channels: The event lines used for memcpy.
  * @num_of_phy_chans: The number of physical channels implemented in HW.
  * 0 means reading the number of channels from DMA HW but this is only valid
  * for 'multiple of 4' channels, like 8.
@@ -51,6 +54,7 @@ struct stedma40_platform_data {
 	int				 num_of_soft_lli_chans;
 	bool				 use_esram_lcla;
 	int				 num_of_memcpy_chans;
+	u32				 memcpy_channels[D40_MEMCPY_MAX_CHANS];
 	int				 num_of_phy_chans;
 };
 
@@ -89,25 +93,6 @@ struct stedma40_platform_data {
 #define D40_ALLOC_PHY		BIT(30)
 #define D40_ALLOC_LOG_FREE	0
 
-#define D40_MEMCPY_MAX_CHANS	8
-
-/* Reserved event lines for memcpy only. */
-#define DB8500_DMA_MEMCPY_EV_0	51
-#define DB8500_DMA_MEMCPY_EV_1	56
-#define DB8500_DMA_MEMCPY_EV_2	57
-#define DB8500_DMA_MEMCPY_EV_3	58
-#define DB8500_DMA_MEMCPY_EV_4	59
-#define DB8500_DMA_MEMCPY_EV_5	60
-
-static int dma40_memcpy_channels[] = {
-	DB8500_DMA_MEMCPY_EV_0,
-	DB8500_DMA_MEMCPY_EV_1,
-	DB8500_DMA_MEMCPY_EV_2,
-	DB8500_DMA_MEMCPY_EV_3,
-	DB8500_DMA_MEMCPY_EV_4,
-	DB8500_DMA_MEMCPY_EV_5,
-};
-
 /* Default configuration for physical memcpy */
 static const struct stedma40_chan_cfg dma40_memcpy_conf_phy = {
 	.mode = STEDMA40_MODE_PHYSICAL,
@@ -2154,7 +2139,8 @@ static int d40_config_memcpy(struct d40_chan *d40c)
 
 	if (dma_has_cap(DMA_MEMCPY, cap) && !dma_has_cap(DMA_SLAVE, cap)) {
 		d40c->dma_cfg = dma40_memcpy_conf_log;
-		d40c->dma_cfg.dev_type = dma40_memcpy_channels[d40c->chan.chan_id];
+		d40c->dma_cfg.dev_type =
+			d40c->base->plat_data->memcpy_channels[d40c->chan.chan_id];
 
 		d40_log_cfg(&d40c->dma_cfg,
 			    &d40c->log_def.lcsp1, &d40c->log_def.lcsp3);
@@ -3434,12 +3420,7 @@ static int __init d40_hw_detect_init(struct platform_device *pdev,
 	num_phy_chans = min(num_phy_chans, STEDMA40_MAX_PHYS);
 
 	/* The number of channels used for memcpy */
-	if (plat_data->num_of_memcpy_chans)
-		num_memcpy_chans = plat_data->num_of_memcpy_chans;
-	else
-		num_memcpy_chans = ARRAY_SIZE(dma40_memcpy_channels);
-
-	num_memcpy_chans = min(num_memcpy_chans, D40_MEMCPY_MAX_CHANS);
+	num_memcpy_chans = plat_data->num_of_memcpy_chans;
 	num_log_chans = num_phy_chans * D40_MAX_LOG_CHAN_PER_PHY;
 
 	dev_info(dev,
@@ -3688,6 +3669,7 @@ static int __init d40_of_probe(struct device *dev,
 	struct stedma40_platform_data *pdata;
 	int num_phy = 0, num_memcpy = 0, num_disabled = 0;
 	const __be32 *list;
+	int ret;
 
 	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
 	if (!pdata)
@@ -3701,18 +3683,19 @@ static int __init d40_of_probe(struct device *dev,
 	list = of_get_property(np, "memcpy-channels", &num_memcpy);
 	num_memcpy /= sizeof(*list);
 
-	if (num_memcpy > D40_MEMCPY_MAX_CHANS || num_memcpy <= 0) {
+	if (num_memcpy > ARRAY_SIZE(pdata->memcpy_channels) ||
+	    num_memcpy <= 0) {
 		d40_err(dev,
 			"Invalid number of memcpy channels specified (%d)\n",
 			num_memcpy);
 		return -EINVAL;
 	}
+	ret = of_property_read_u32_array(np, "memcpy-channels",
+					 pdata->memcpy_channels, num_memcpy);
+	if (ret)
+		return ret;
 	pdata->num_of_memcpy_chans = num_memcpy;
 
-	of_property_read_u32_array(np, "memcpy-channels",
-				   dma40_memcpy_channels,
-				   num_memcpy);
-
 	list = of_get_property(np, "disabled-channels", &num_disabled);
 	num_disabled /= sizeof(*list);
 

-- 
2.55.0

