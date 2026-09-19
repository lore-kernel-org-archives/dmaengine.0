Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1329737C92A;
	Sat, 19 Sep 2026 22:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789856565; cv=none; b=laRINi7N+5X71KBAMAoG23tyBr5oJ+vDaFnJ8eu0YRg8KX/ezem4+OZEm03Ss56n1QHX0HmOUVT611FufFno9dqU/KBLVAw4nOiF6OZXGd1q8v8n/1DbdVv63nCbGba8VLyau8ITzo1TxInoKK6MBLhG182Y/1jGjeEktfD5XyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789856565; c=relaxed/simple;
	bh=/8QpG7woWATUY+gVUwL8VLWcu2/gOJziTk16dFLkzyU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TXYPPq8OjsNzuVC0/LK49cfFja52KeXGxDIw7hK6WwvwAjpH6XtcR6d293yUNUDWQOgmHU5hdohSYxEcFDnyEmGQm6uBrP0J01bbGvmVYQfugyZPD0x0cQyLAFlSveZLc1rkKgKJv1AyH7ch3+rcE7e8OGLSzadfQTo4zynmpzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FMgYFOAx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FMgYFOAx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F6071F00893;
	Sat, 19 Sep 2026 22:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789856563;
	bh=9JhSlmYOyCfAFblvUdef5xKemWpYFYUA3SveCPFx1OU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=FMgYFOAxCdKAc7KTIIJkz4DCbysTcW4sk2tXV/z9W1GW5e6CzYDI6k0TyRraiEUgh
	 E0U48K3NTuXtYV50ZNXsAyVf3rBjEcCu3b2SFzZf0JQJkm5mta0byzHoNgTGCg9e/Y
	 oWhjlaBJC5Vm9dQVY+ilBddSIs6clFMDyyeMW6DQyx3O0C0BHhfTQQ0REP7v5a+C4I
	 avOV4xThxSOnF7A/E7WILJv8Q5yeSVcwnF4+rne9IZ/kLCEF7ELB7CxJ58rKPT8i/k
	 VMBKNLzvVGZQxSTDhteZNwD55O7j34YAgzAu7bIKOD2rLnuBqtRDXE2OPjOeCWboxR
	 b6OQ7nqCs6xyQ==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 20 Sep 2026 00:22:26 +0200
Subject: [PATCH v4 15/23] dmaengine: ste_dma40: Fix memcpy channel parsing
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-dma40-fixes-v4-15-d751b2d9c23f@kernel.org>
References: <20260920-dma40-fixes-v4-0-d751b2d9c23f@kernel.org>
In-Reply-To: <20260920-dma40-fixes-v4-0-d751b2d9c23f@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, phone-devel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, sashiko-bot@kernel.org
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
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c | 45 ++++++++++++++-------------------------------
 1 file changed, 14 insertions(+), 31 deletions(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 9baa677278be..f3a0cdfe2d7e 100644
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
 
@@ -86,25 +90,6 @@ struct stedma40_platform_data {
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
@@ -2123,7 +2108,8 @@ static int d40_config_memcpy(struct d40_chan *d40c)
 
 	if (dma_has_cap(DMA_MEMCPY, cap) && !dma_has_cap(DMA_SLAVE, cap)) {
 		d40c->dma_cfg = dma40_memcpy_conf_log;
-		d40c->dma_cfg.dev_type = dma40_memcpy_channels[d40c->chan.chan_id];
+		d40c->dma_cfg.dev_type =
+			d40c->base->plat_data->memcpy_channels[d40c->chan.chan_id];
 
 		d40_log_cfg(&d40c->dma_cfg,
 			    &d40c->log_def.lcsp1, &d40c->log_def.lcsp3);
@@ -3405,12 +3391,7 @@ static int __init d40_hw_detect_init(struct platform_device *pdev,
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
@@ -3659,6 +3640,7 @@ static int __init d40_of_probe(struct device *dev,
 	struct stedma40_platform_data *pdata;
 	int num_phy = 0, num_memcpy = 0, num_disabled = 0;
 	const __be32 *list;
+	int ret;
 
 	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
 	if (!pdata)
@@ -3672,18 +3654,19 @@ static int __init d40_of_probe(struct device *dev,
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

