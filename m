Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97166531AF6;
	Tue, 22 Sep 2026 23:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790119873; cv=none; b=jN8/9OzdNZVLWDJ8x89zoakp8UMXMoajGVTmvJ5ljOisLvfI7t7pNPBYfIVbcLLVN2Yr2JCQW7yWWe1WbTTGXNLkE36Wo/aE56jx5Tsr6RHd+HKtVb0A92cLCJzH0TaNa9PoZuyWVKNDTzc1N5k6t00D+Zmec3OlhjkPgQVO1Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790119873; c=relaxed/simple;
	bh=MM/eZnNFAK+0o5Pb6b+ru1/NNuMTApUKQfFLZTSvipY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jlxr4hOkdt5jBbTZ7FjAiuJ8OcDPaW3WN1URSyVOY+nygWwoyqFnnQXYr93a+vLCcFryjew6OLuXqekuPUt42exGCH+Tk88v0aFmU9WaNKGrQ1AU++2BthC7EBfjM5yJrcv2t3nuGbMzX9wF7zK0MgcY6GLjpstdq9mY9uG945w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A2bPvYNV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A2bPvYNV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB1711F00893;
	Tue, 22 Sep 2026 23:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790119871;
	bh=oRXgPoLd5uFOIe0FEVhL4IbjxzxD1bIuxAWJH+xFeRo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=A2bPvYNVh4KRej98KgXfZbnCK+ENGSbeIxBL6NBmvmYXFgw9vxYohfjYBOl2ZZnrK
	 +4OIOgcFnJWtbbTlKSqSOgyH+mhwhQrnjAPOTgyayS63otsayuBAzIqkEN4FXGND2o
	 haqQ6Pi/XwiPJKBup+AjCI7Wtpr99eVT4t0gfuGXszJ2S56dRBIRTSHIGOVVY4DV7X
	 crliJdXfqTp2YJph4AQdQeyTyDn7esJNPPGL8jgm5yjDE3TW9esFWfX5Bdnq70dv46
	 1vhczfEtySAWKKoCpvdWH4j7eWdDJqW1hMOJyXxoWDT6xHT3nBxt/buSayD4ETFyRS
	 KTEzqg0YZmp/w==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 23 Sep 2026 01:30:56 +0200
Subject: [PATCH v5 11/23] dmaengine: ste_dma40: Fix DMA registration unwind
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-dma40-fixes-v5-11-709d160cde76@kernel.org>
References: <20260923-dma40-fixes-v5-0-709d160cde76@kernel.org>
In-Reply-To: <20260923-dma40-fixes-v5-0-709d160cde76@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, phone-devel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, sashiko-bot@kernel.org
X-Mailer: b4 0.14.3

d40_dmaengine_init() registers DMAengine devices using devres-managed
unregister actions. If probe fails after one of those registrations, the
DMAengine devices stay visible until devres unwinds after d40_probe()
returns.

The channel tasklets are also initialized before each DMAengine device is
registered. An interrupt can therefore have queued a tasklet by the time a
later registration step fails, but unregistering the DMAengine devices
does not drain that tasklet before probe-owned storage is released.

Add tasklet cleanup actions to the DMAengine registration devres group.
On failure, free the IRQ before releasing the group so no new tasklets can
be scheduled, then unregister the DMAengine devices and drain their
tasklets before freeing the remaining probe resources. Keep the managed
registrations and cleanup actions in place on successful probe by removing
only the temporary group markers.

Fixes: 42ae6f1695be ("dmaengine: ste_dma40: Remove platform data")
Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/dmaengine/20260819225215.5EA2F1F000E9@smtp.kernel.org/
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c | 46 ++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 44 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 0782becdab11..3f5b25933ff5 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -3047,6 +3047,18 @@ static void __init d40_chan_init(struct d40_base *base, struct dma_device *dma,
 	}
 }
 
+static void d40_kill_tasklets(void *data)
+{
+	struct dma_device *dma = data;
+	struct d40_chan *d40c;
+	struct dma_chan *chan;
+
+	list_for_each_entry(chan, &dma->channels, device_node) {
+		d40c = container_of(chan, struct d40_chan, chan);
+		tasklet_kill(&d40c->tasklet);
+	}
+}
+
 static void d40_ops_init(struct d40_base *base, struct dma_device *dev)
 {
 	if (dma_has_cap(DMA_SLAVE, dev->cap_mask)) {
@@ -3093,6 +3105,11 @@ static int __init d40_dmaengine_init(struct d40_base *base,
 
 	d40_ops_init(base, &base->dma_slave);
 
+	err = devm_add_action_or_reset(base->dev, d40_kill_tasklets,
+				       &base->dma_slave);
+	if (err)
+		goto exit;
+
 	err = dmaenginem_async_device_register(&base->dma_slave);
 
 	if (err) {
@@ -3108,6 +3125,11 @@ static int __init d40_dmaengine_init(struct d40_base *base,
 
 	d40_ops_init(base, &base->dma_memcpy);
 
+	err = devm_add_action_or_reset(base->dev, d40_kill_tasklets,
+				       &base->dma_memcpy);
+	if (err)
+		goto exit;
+
 	err = dmaenginem_async_device_register(&base->dma_memcpy);
 
 	if (err) {
@@ -3125,6 +3147,12 @@ static int __init d40_dmaengine_init(struct d40_base *base,
 	dma_cap_set(DMA_CYCLIC, base->dma_both.cap_mask);
 
 	d40_ops_init(base, &base->dma_both);
+
+	err = devm_add_action_or_reset(base->dev, d40_kill_tasklets,
+				       &base->dma_both);
+	if (err)
+		goto exit;
+
 	err = dmaenginem_async_device_register(&base->dma_both);
 
 	if (err) {
@@ -3722,6 +3750,7 @@ static int __init d40_probe(struct platform_device *pdev)
 	struct d40_base *base;
 	struct resource *res;
 	struct resource res_lcpa;
+	void *dmaenginem_reg_group;
 	int num_reserved_chans;
 	bool runtime_pm_enabled = false;
 	bool irq_requested = false;
@@ -3855,20 +3884,33 @@ static int __init d40_probe(struct platform_device *pdev)
 	d40_hw_init(base);
 	enable_irq(base->irq);
 
+	dmaenginem_reg_group = devres_open_group(dev, NULL, GFP_KERNEL);
+	if (!dmaenginem_reg_group) {
+		ret = -ENOMEM;
+		goto destroy_cache;
+	}
+
 	ret = d40_dmaengine_init(base, num_reserved_chans);
 	if (ret)
-		goto destroy_cache;
+		goto release_dmaenginem;
 
 	ret = of_dma_controller_register(np, d40_xlate, NULL);
 	if (ret) {
 		dev_err(dev,
 			"could not register of_dma_controller\n");
-		goto destroy_cache;
+		goto release_dmaenginem;
 	}
+	devres_remove_group(dev, dmaenginem_reg_group);
 
 	dev_info(base->dev, "initialized\n");
 	return 0;
 
+ release_dmaenginem:
+	if (irq_requested) {
+		free_irq(base->irq, base);
+		irq_requested = false;
+	}
+	devres_release_group(dev, dmaenginem_reg_group);
  destroy_cache:
 	if (base->lcla_pool.dma_addr)
 		dma_unmap_single(base->dev, base->lcla_pool.dma_addr,

-- 
2.55.0

