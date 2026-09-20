Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7042E47206D;
	Sun, 20 Sep 2026 19:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789930810; cv=none; b=CBjecV+30DDUBCwdvFvqTmSLk0PkejCd5P32GvH0HCoLsUDukh4sBl3FNTjfvDUBTZuKS/WZx4OizOylVDZ1yhNljPafV/PFjAE0KVl4BzgeovaiKE/VSEaofYrb8JxD/zrDzhqDnFRYT7xtPIaHe8wv7Qh2jw3CLLvD515Qoag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789930810; c=relaxed/simple;
	bh=7NXweZTPit+QgVmCucn4cliTisW0CBLiHPWsg6CvLiI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=szK3PIEYWTLHW3h441R4dzNLKLhx4WONXzVoWIFcCAPUFVBKrq+ipZl4aUqS8BOphukw7A6w6dubkivQDTUl84UyHeN25iDCPP5WY+NqwxnS/iGMa2N2PFy9fcVnyUqHmYtnzjfC6l9Ykmmj6gan4XcWV4eQewNpuP9gyOTXR/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PTGsyab8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PTGsyab8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D4181F000FF;
	Sun, 20 Sep 2026 19:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789930809;
	bh=jdItISkNJU7I3D4PBotkmESX1X2ntiJgTiBui+SITkw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=PTGsyab88r+5tnn3XyrmgVB0osLDD3FM/9r+O15hv1r5a6WTczuH5Qk9P3EzAvXMF
	 gmuO5iyCr+MT3m0hlMc0GwssYlk8sFTstZXPpCP90XdweaRs146p7QpnsVvNNN03ft
	 SA5yEUMUjsckpveWqKw61Opc1PkHQwh9XseGzhaaKWMxRjygJVoAQrgkpm6rmOqXO2
	 9XLJ9pn0Z1PbDiEiBURh2xaoVHmad/oYR5KJ7IOugQwv95IqkQWnQofd+tGzVxaZWJ
	 K3L8bHh+KnhogHAXl5yqcBf6u02S4JtBOmL2jwf0iP5fzJSApU0nhQxDq2TPq0+96L
	 6hsbygBQvlktw==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 20 Sep 2026 20:59:50 +0200
Subject: [PATCH v5 15/23] dmaengine: ste_dma40: Fix memcpy channel parsing
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-dma40-fixes-v5-15-5c55cd7f92f9@kernel.org>
References: <20260920-dma40-fixes-v5-0-5c55cd7f92f9@kernel.org>
In-Reply-To: <20260920-dma40-fixes-v5-0-5c55cd7f92f9@kernel.org>
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
index 02ccad255a75..48dccd432ff4 100644
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
@@ -2145,7 +2130,8 @@ static int d40_config_memcpy(struct d40_chan *d40c)
 
 	if (dma_has_cap(DMA_MEMCPY, cap) && !dma_has_cap(DMA_SLAVE, cap)) {
 		d40c->dma_cfg = dma40_memcpy_conf_log;
-		d40c->dma_cfg.dev_type = dma40_memcpy_channels[d40c->chan.chan_id];
+		d40c->dma_cfg.dev_type =
+			d40c->base->plat_data->memcpy_channels[d40c->chan.chan_id];
 
 		d40_log_cfg(&d40c->dma_cfg,
 			    &d40c->log_def.lcsp1, &d40c->log_def.lcsp3);
@@ -3428,12 +3414,7 @@ static int __init d40_hw_detect_init(struct platform_device *pdev,
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
@@ -3682,6 +3663,7 @@ static int __init d40_of_probe(struct device *dev,
 	struct stedma40_platform_data *pdata;
 	int num_phy = 0, num_memcpy = 0, num_disabled = 0;
 	const __be32 *list;
+	int ret;
 
 	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
 	if (!pdata)
@@ -3695,18 +3677,19 @@ static int __init d40_of_probe(struct device *dev,
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

