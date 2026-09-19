Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC8A388386;
	Sat, 19 Sep 2026 22:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789856558; cv=none; b=M5WvTnJ39pZazhaR1LZe+rswBxFqcPkuoY91Svm2O3dGmJ79BYD19zpKMZ3MHdP12k4L85MBaBk1ygBxLQJDEiud2elwIz6eDkAYxZ0a65MlN9s//RIn3mjY5mpo5ObyZjUPNB/Tj6F4M8Ua9y2btipq6zRszAg3hcs1vKg88LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789856558; c=relaxed/simple;
	bh=v674Dmxrw0U6iLUqGwvVRlD8rQuRgnhevTeKwQvVVOg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FnihrWt307kVfua1bP/d6TKawf0H8XG7NCENrrhkGGW8R/vG/ag4f5BrvZJ86Ri7sUDxSLDKYci9fHyFzNdiG9h0+lf0u2Fvc/lklpL7qnMJJUZTlkaMefV+OUs+o4YBi3u0672usAJSWpD90F1yUpZAaECzaMZRuZKxgPn3PbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PVyhHXx1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PVyhHXx1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8401C1F00893;
	Sat, 19 Sep 2026 22:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789856556;
	bh=Sf47oVfB4ILN1t25k5OY+SvgeBWUjrZgwkXQiQ41lYE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=PVyhHXx1YuKLp7RsNLtHt5nn1RMUbfWfRvyEwJeMbRuJgMU5dL6oikgMsGmHUXDOV
	 +pdnPWCcsQ1xLnjLczldI2ckJA4PwLjjRAIa0C3L8xiZVm7PoidsnMBA20iquAQr1d
	 2hAi0nEKb/5geR5VNbJmfdIHOj8rp53a+eVOsR3E2JJ48C1P5EaMtkvGs6A5W860G1
	 IPDSjSX76c0vOAtghwsqLO5ZPJ0JyGjOw3hzXPjvlFTPjUkaDUTlAIurLx9IwWJ0hF
	 i9ch4nmGTwg4Y/nP9/1iKbQtBTO7GtXmAR4O631ZYHSMVMXY3+uBtKAkgsRBoGxys8
	 6aPq0pZ3IwTlw==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 20 Sep 2026 00:22:22 +0200
Subject: [PATCH v4 11/23] dmaengine: ste_dma40: Fix DMA registration unwind
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-dma40-fixes-v4-11-d751b2d9c23f@kernel.org>
References: <20260920-dma40-fixes-v4-0-d751b2d9c23f@kernel.org>
In-Reply-To: <20260920-dma40-fixes-v4-0-d751b2d9c23f@kernel.org>
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
index 075c9b18d6c2..5175052f25bb 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -3010,6 +3010,18 @@ static void __init d40_chan_init(struct d40_base *base, struct dma_device *dma,
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
@@ -3056,6 +3068,11 @@ static int __init d40_dmaengine_init(struct d40_base *base,
 
 	d40_ops_init(base, &base->dma_slave);
 
+	err = devm_add_action_or_reset(base->dev, d40_kill_tasklets,
+				       &base->dma_slave);
+	if (err)
+		goto exit;
+
 	err = dmaenginem_async_device_register(&base->dma_slave);
 
 	if (err) {
@@ -3071,6 +3088,11 @@ static int __init d40_dmaengine_init(struct d40_base *base,
 
 	d40_ops_init(base, &base->dma_memcpy);
 
+	err = devm_add_action_or_reset(base->dev, d40_kill_tasklets,
+				       &base->dma_memcpy);
+	if (err)
+		goto exit;
+
 	err = dmaenginem_async_device_register(&base->dma_memcpy);
 
 	if (err) {
@@ -3088,6 +3110,12 @@ static int __init d40_dmaengine_init(struct d40_base *base,
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
@@ -3685,6 +3713,7 @@ static int __init d40_probe(struct platform_device *pdev)
 	struct d40_base *base;
 	struct resource *res;
 	struct resource res_lcpa;
+	void *dmaenginem_reg_group;
 	int num_reserved_chans;
 	bool runtime_pm_enabled = false;
 	bool irq_requested = false;
@@ -3818,20 +3847,33 @@ static int __init d40_probe(struct platform_device *pdev)
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

