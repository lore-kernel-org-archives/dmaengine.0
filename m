Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37172346E59;
	Thu, 24 Sep 2026 08:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790238937; cv=none; b=mUTrb90aXuyJXCR4axQ7oaz7W78subOHNaI/q2haAqkkSkJJqkgILLg2OpMwSgVME4VNRn+/cC6pwVyTCTMHRwirs2XkDLjz9kH5qSYajXIf1cN076dv2S7F5oS4jUcNLQqEckIHtKaPdsLqHhRF8tGs9bi7GNmpSDpTttBLMjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790238937; c=relaxed/simple;
	bh=xJKBFeyA5DSSY4WzA4cX6WeKqU0hNzemvgQQ1ySiDjw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kd3wkCpmYW+hnWHp7BKL8rPuZD7yWB+bRFsg1ylSyuQ106HOOxXv8BqWre4wvT4IgYrv8DQnLI8DqSXoRPMrsJk4spn/FLcJTOGBhl4cPS0pegYz6RO6gNdD2s7JF/QNvUT8XeYxWdWfrorSpwmij1MV2+LheP5qJKAQZH2EzI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d8ZNOwLk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d8ZNOwLk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85C221F000FF;
	Thu, 24 Sep 2026 08:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790238935;
	bh=1zVR3pI8Y1vGS0j+6D58G9Ok8YTEzZ00UPcdI/wan8E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=d8ZNOwLkE+cZd7ZjOzNps3FvQdOlJF4pUI/aYcnA7LCuL99GIPr9iAym0B89ciB5E
	 iM9u+X+O0C/f/E2WKGUylm39ujjfLxQZbQJNCKfYbOBpIS0SK2Jfs5UPq76F0xhjut
	 mgOcB7kfxEDSj6rPvwn3uZGNyS1nr7/C04bGuUiJU8Pv0/Y/pvJ4E5gkYleDlf/80J
	 i587YIwhMqCfs4/fbqlenJuQyl4nM69PcFFgPQGH/qF20/8y3OytR/OTFRNer6EGXq
	 7IsG/cMypSRfi8vk71OILyV841Fdg34hKgyYOgJtvki9LXWAe5cPoYq7BVy8WW1Gwr
	 XcDrUMnTZSNHQ==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 24 Sep 2026 10:35:23 +0200
Subject: [PATCH v6 11/23] dmaengine: ste_dma40: Fix DMA registration unwind
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-dma40-fixes-v6-11-fdb6755020a2@kernel.org>
References: <20260924-dma40-fixes-v6-0-fdb6755020a2@kernel.org>
In-Reply-To: <20260924-dma40-fixes-v6-0-fdb6755020a2@kernel.org>
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
index 36f4cbd4da36..87b5f1d97ac2 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -3042,6 +3042,18 @@ static void __init d40_chan_init(struct d40_base *base, struct dma_device *dma,
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
@@ -3088,6 +3100,11 @@ static int __init d40_dmaengine_init(struct d40_base *base,
 
 	d40_ops_init(base, &base->dma_slave);
 
+	err = devm_add_action_or_reset(base->dev, d40_kill_tasklets,
+				       &base->dma_slave);
+	if (err)
+		goto exit;
+
 	err = dmaenginem_async_device_register(&base->dma_slave);
 
 	if (err) {
@@ -3103,6 +3120,11 @@ static int __init d40_dmaengine_init(struct d40_base *base,
 
 	d40_ops_init(base, &base->dma_memcpy);
 
+	err = devm_add_action_or_reset(base->dev, d40_kill_tasklets,
+				       &base->dma_memcpy);
+	if (err)
+		goto exit;
+
 	err = dmaenginem_async_device_register(&base->dma_memcpy);
 
 	if (err) {
@@ -3120,6 +3142,12 @@ static int __init d40_dmaengine_init(struct d40_base *base,
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
@@ -3717,6 +3745,7 @@ static int __init d40_probe(struct platform_device *pdev)
 	struct d40_base *base;
 	struct resource *res;
 	struct resource res_lcpa;
+	void *dmaenginem_reg_group;
 	int num_reserved_chans;
 	bool irq_requested = false;
 	u32 val;
@@ -3852,20 +3881,33 @@ static int __init d40_probe(struct platform_device *pdev)
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

