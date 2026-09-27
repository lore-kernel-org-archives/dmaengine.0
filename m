Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC5A372B50;
	Sun, 27 Sep 2026 09:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790499824; cv=none; b=GyNO5Ly1wddHO4QLwVJ6rwy3QZPIHrcOn8VA5SeiGPupzjTu1n5gz38huzaPUwbrrfhM9jZutnpLBDA2+LLlkIEAVIaPkpn/5PRS5all0iRfM8wgjuXPnrW7m8cC7psc7b/H3nUvp3Z2UEDnH535l7rMYfq5qR/clcX6UEV+euE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790499824; c=relaxed/simple;
	bh=dd07anqsxYg5J0wgfi1sJvSvgz9Nxb+EEyOP15BPGMk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p+OIWx4SlW2xYRdcRXpR4HeAsXKyMvPB4BMfvEcBbnCVgPvorwEypDEhTApDi/ASPq9ms8v7AfY+Qb627NMW8PSDj/BdvOV6Sxl4Ogntv3fyL859b+8u4kdB02j/BUAH0fqHUPRp7tEzJC2BwhzAgtBMrelTCFKKXTr2TDdW3YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jLCZPfwy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jLCZPfwy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 187E61F000FF;
	Sun, 27 Sep 2026 09:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790499823;
	bh=WlB9OpRQMmuuS9c0FiSpIsfT1m73aP3mzBHcH2C5eAs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=jLCZPfwyW13h+fxmVzHHghgDFMznZnrnwWExGPGHfGEHAs4FIxN4ZgB5MiSClVd3M
	 cNwUAUHBk4kCYt/9n5OqhvCN7n7IP+irjsY/3WyXsleOyB9BXuZCppBDG8GsgrKGqB
	 y06+vZo0wa74Kc02jXZnfeXgBsTK8NUj99Zb34mUFcZXIMG6DKqg4ANPb5bZXhZ//W
	 y6iqEICEg0sRPoMN88w6RxYPAPQvltSAjBUdVddVX27t+Co9Y74LDiWDogVdfgPqI3
	 ML8fiZlTV1wQTx0ytu9IZBpM1f4SYFLyxgFtO7XKn37hN7UppBG02exhPJeCTOQpP2
	 PH0PeC/YytzzQ==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 27 Sep 2026 11:03:24 +0200
Subject: [PATCH v7 11/24] dmaengine: ste_dma40: Fix DMA registration unwind
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260927-dma40-fixes-v7-11-89f595e8851d@kernel.org>
References: <20260927-dma40-fixes-v7-0-89f595e8851d@kernel.org>
In-Reply-To: <20260927-dma40-fixes-v7-0-89f595e8851d@kernel.org>
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
Install each action before publishing its DMAengine device. If action
registration fails, those tasklets have never been exposed and cannot have
been scheduled, so use devm_add_action() without immediate reset cleanup.

On later failure, free the IRQ before releasing the group so no new
tasklets can be scheduled, then unregister the DMAengine devices and drain
their tasklets before freeing the remaining probe resources. Keep the
managed registrations and cleanup actions in place on successful probe by
removing only the temporary group markers.

Fixes: 42ae6f1695be ("dmaengine: ste_dma40: Remove platform data")
Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/dmaengine/20260819225215.5EA2F1F000E9@smtp.kernel.org/
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c | 45 +++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 43 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 4c545a947264..f72d91c8d0fa 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -3039,6 +3039,18 @@ static void __init d40_chan_init(struct d40_base *base, struct dma_device *dma,
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
@@ -3085,6 +3097,11 @@ static int __init d40_dmaengine_init(struct d40_base *base,
 
 	d40_ops_init(base, &base->dma_slave);
 
+	err = devm_add_action(base->dev, d40_kill_tasklets,
+			      &base->dma_slave);
+	if (err)
+		goto exit;
+
 	err = dmaenginem_async_device_register(&base->dma_slave);
 
 	if (err) {
@@ -3100,6 +3117,11 @@ static int __init d40_dmaengine_init(struct d40_base *base,
 
 	d40_ops_init(base, &base->dma_memcpy);
 
+	err = devm_add_action(base->dev, d40_kill_tasklets,
+			      &base->dma_memcpy);
+	if (err)
+		goto exit;
+
 	err = dmaenginem_async_device_register(&base->dma_memcpy);
 
 	if (err) {
@@ -3117,6 +3139,12 @@ static int __init d40_dmaengine_init(struct d40_base *base,
 	dma_cap_set(DMA_CYCLIC, base->dma_both.cap_mask);
 
 	d40_ops_init(base, &base->dma_both);
+
+	err = devm_add_action(base->dev, d40_kill_tasklets,
+			      &base->dma_both);
+	if (err)
+		goto exit;
+
 	err = dmaenginem_async_device_register(&base->dma_both);
 
 	if (err) {
@@ -3714,6 +3742,7 @@ static int __init d40_probe(struct platform_device *pdev)
 	struct d40_base *base;
 	struct resource *res;
 	struct resource res_lcpa;
+	void *dmaenginem_reg_group;
 	int num_reserved_chans;
 	u32 val;
 	int ret;
@@ -3844,20 +3873,32 @@ static int __init d40_probe(struct platform_device *pdev)
 		d40_err(dev, "No IRQ defined\n");
 		goto destroy_cache;
 	}
+
+	dmaenginem_reg_group = devres_open_group(dev, NULL, GFP_KERNEL);
+	if (!dmaenginem_reg_group) {
+		ret = -ENOMEM;
+		goto release_irq;
+	}
+
 	ret = d40_dmaengine_init(base, num_reserved_chans);
 	if (ret)
-		goto release_irq;
+		goto release_dmaenginem;
 
 	ret = of_dma_controller_register(np, d40_xlate, NULL);
 	if (ret) {
 		dev_err(dev,
 			"could not register of_dma_controller\n");
-		goto release_irq;
+		goto release_dmaenginem;
 	}
+	devres_remove_group(dev, dmaenginem_reg_group);
 
 	dev_info(base->dev, "initialized\n");
 	return 0;
 
+ release_dmaenginem:
+	free_irq(base->irq, base);
+	devres_release_group(dev, dmaenginem_reg_group);
+	goto destroy_cache;
  release_irq:
 	free_irq(base->irq, base);
  destroy_cache:

-- 
2.55.0

