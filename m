Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772F54FE2C9;
	Fri, 18 Sep 2026 16:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789748687; cv=none; b=F5EcWR4hbg6bAghQtHdjBBe30kpmGDTbFFH/wE6SKVNtgc9GHb8zkosch9z640ps6zdIZ39il6R0UZSHf9pNWDv/CAf7HR9CSsd10ozbw95i02Eh3tuq6BZyAxHlhA/3No3mOeKMO7F5L3SAMHTBWFZ+Df5dpCMHiYb+bNSg5K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789748687; c=relaxed/simple;
	bh=GMlLifWzj+NT1uyhg0IZjJdZb5h9j7mjV5oW0BGjE+Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E/6m6clnA0m2DNaiJ0LK3PtP/C/L7CV4YpkgTWZ3BeqF52ZRqD6z7kgdKqpf002lob3Nd2noZkMMOWiihKOGe/OwKwIMD2XrcACeOG1YOSnlQZ27SyZkffKeijkO+qO/sZoJ1191iieCU+ax+eaoPVk1cIXdxN/gGdJn92QuYzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=THwrjNWc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="THwrjNWc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F23AA1F000FF;
	Fri, 18 Sep 2026 16:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789748685;
	bh=0rX4QOzbgDekeiqSBQIBKPJsAP2J8BOUjSZ/ZycLWgY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=THwrjNWcVGWf/Yk7NViWWoFa9pESt96BeDPdUGH6249u0EY862RDAp0uXaJtYMeVz
	 0juyVHEKaFvaAb0ubuLHlcEmsurkjRvvn25negT3mJBe4s2hodQf8dh5gjsMggA1rV
	 iyHJrtscTaW4u5v+hYsJ5/wlAaGvsOSiljxbmnpf6zQkB8GsnHVJ4BYGO+Q2iSWuvZ
	 TJn9hEPhy3HLD9f+K4/ro+H5DR1wxCzkpQuKbmhYLi57876Tg2HAq+tM0E4QdCyVH1
	 68kZ+aDXvHyqchG5I8BiES8EGEpYprDw711tVijdckxO72pOduqYyu4tTEN0yKfzhh
	 2rk5GN55yRqoQ==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 18 Sep 2026 18:24:29 +0200
Subject: [PATCH v3 10/22] dmaengine: ste_dma40: Fix DMA registration unwind
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-dma40-fixes-v3-10-8dd8450669e8@kernel.org>
References: <20260918-dma40-fixes-v3-0-8dd8450669e8@kernel.org>
In-Reply-To: <20260918-dma40-fixes-v3-0-8dd8450669e8@kernel.org>
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
index 38c1cc43cb87..af885561f693 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -2898,6 +2898,18 @@ static void __init d40_chan_init(struct d40_base *base, struct dma_device *dma,
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
@@ -2944,6 +2956,11 @@ static int __init d40_dmaengine_init(struct d40_base *base,
 
 	d40_ops_init(base, &base->dma_slave);
 
+	err = devm_add_action_or_reset(base->dev, d40_kill_tasklets,
+				       &base->dma_slave);
+	if (err)
+		goto exit;
+
 	err = dmaenginem_async_device_register(&base->dma_slave);
 
 	if (err) {
@@ -2959,6 +2976,11 @@ static int __init d40_dmaengine_init(struct d40_base *base,
 
 	d40_ops_init(base, &base->dma_memcpy);
 
+	err = devm_add_action_or_reset(base->dev, d40_kill_tasklets,
+				       &base->dma_memcpy);
+	if (err)
+		goto exit;
+
 	err = dmaenginem_async_device_register(&base->dma_memcpy);
 
 	if (err) {
@@ -2976,6 +2998,12 @@ static int __init d40_dmaengine_init(struct d40_base *base,
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
@@ -3573,6 +3601,7 @@ static int __init d40_probe(struct platform_device *pdev)
 	struct d40_base *base;
 	struct resource *res;
 	struct resource res_lcpa;
+	void *dmaenginem_reg_group;
 	int num_reserved_chans;
 	bool runtime_pm_enabled = false;
 	bool irq_requested = false;
@@ -3706,20 +3735,33 @@ static int __init d40_probe(struct platform_device *pdev)
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

