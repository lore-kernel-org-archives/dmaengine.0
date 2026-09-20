Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F6B44E675;
	Sun, 20 Sep 2026 19:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789930803; cv=none; b=D1aZa5ky0x/8pbN3/69P+kfNGnaZWeI/z/p/cX9y5/H/U9RM7b43aZKURTvWziopDyRnVSyCBVWktpG3SnwnWJgeNdsX2a8C4ntkRaOHlsffsnO26hITpvjtgdLdI3ek5xovJ84EtUPXEvON+PlReElCO4x79RVDbDJV633VmRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789930803; c=relaxed/simple;
	bh=y8SLUXdt96PHq4pH+/8T6VINJJrTEHA3RAMCJeqzUvk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VxHHCMJxD5wEVM5YlcEHaoIf0m9EXYvbA+Rx5Mmods8F9wo5tbRyOFaJ1tALgH/6N/p/bTTjOyUfVVCZrpXJA5RRPMW9ZKikv05orI4op7XgxzfN0EVdSCxzWud0O0VMtXmrDwHf9Bl3kwMcg73/EiboSPntUfwtIb/wSdK4x6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GsF1BDYl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GsF1BDYl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B29B1F000FF;
	Sun, 20 Sep 2026 19:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789930801;
	bh=XIJg3z/oeCRCBrXfWs/5Lh2zIKbH74jnAacoBZjxWm0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=GsF1BDYlsXbhptYz7yyLQTvFoeyGOKtDmJWT2FYQZxpFb0lY+SWNpJxrL2Dmx//bd
	 Ygp1ZuBajCqZ2CFszG/pr1IzF+mq4mwWloHhMF5QCPDuR/30QQL9ug9y+xF5mcjHwD
	 k1Kh9CIoDJ62ETaZUhaZJb1hlV/0jtgkTQqFvME266PmbXieoKAJutMQcXPCcwVHlE
	 NxGj9r+aLgmGLjywJGGtba76qGuCgFpRhMxtE3gtkn3DRSftwLJEE8x70ETxAg8mur
	 wgfVciDm5ApsulDwe21+lXib7taTZs1aU4bd/yt9jQDnrOojNwpyB4sLnLAV5u6ylF
	 ndN0ICPbnMKBQ==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 20 Sep 2026 20:59:46 +0200
Subject: [PATCH v5 11/23] dmaengine: ste_dma40: Fix DMA registration unwind
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-dma40-fixes-v5-11-5c55cd7f92f9@kernel.org>
References: <20260920-dma40-fixes-v5-0-5c55cd7f92f9@kernel.org>
In-Reply-To: <20260920-dma40-fixes-v5-0-5c55cd7f92f9@kernel.org>
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
index ba529bd91752..52d39883da51 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -3033,6 +3033,18 @@ static void __init d40_chan_init(struct d40_base *base, struct dma_device *dma,
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
@@ -3079,6 +3091,11 @@ static int __init d40_dmaengine_init(struct d40_base *base,
 
 	d40_ops_init(base, &base->dma_slave);
 
+	err = devm_add_action_or_reset(base->dev, d40_kill_tasklets,
+				       &base->dma_slave);
+	if (err)
+		goto exit;
+
 	err = dmaenginem_async_device_register(&base->dma_slave);
 
 	if (err) {
@@ -3094,6 +3111,11 @@ static int __init d40_dmaengine_init(struct d40_base *base,
 
 	d40_ops_init(base, &base->dma_memcpy);
 
+	err = devm_add_action_or_reset(base->dev, d40_kill_tasklets,
+				       &base->dma_memcpy);
+	if (err)
+		goto exit;
+
 	err = dmaenginem_async_device_register(&base->dma_memcpy);
 
 	if (err) {
@@ -3111,6 +3133,12 @@ static int __init d40_dmaengine_init(struct d40_base *base,
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
@@ -3708,6 +3736,7 @@ static int __init d40_probe(struct platform_device *pdev)
 	struct d40_base *base;
 	struct resource *res;
 	struct resource res_lcpa;
+	void *dmaenginem_reg_group;
 	int num_reserved_chans;
 	bool runtime_pm_enabled = false;
 	bool irq_requested = false;
@@ -3841,20 +3870,33 @@ static int __init d40_probe(struct platform_device *pdev)
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

