Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794960485;
	b=YXlIKfozfCrsykNF9aXTVRMa2UHiKKy+OPI1SCqCiAJ03GCJPgXtzqDBJxE2l9o/V4YK
	 GhHWwiI7b75lT80vaeyVb1ZRsGaWmog7xelMKnJf+WLKMypeHb8jP+utGhVZYSZ5Nu0ye
	 rUYxH3jBeMouNG1G3Yl9wIwGStIP2DOfBicRpbuNUONn7Rv5gilGfjik9ZbeYqLuhQ5xN
	 nXOgFInt/cqclURGXZophWOqH0rF1inqWVK7MQfRc+om9UcQoZ8zNlbrftK8rTXsw3SyF
	 rw9d2UOwbomFV7FaME83zofK3ucLafShH6ijeXUatXxvwDesaFcS+Q/SEwA8wkDCZDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794960485;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=mZRahmf+nFgqKUzG9ukr/7RT5YTO4HPa5I75kKuTXUg=;
	b=geQebEyxlGWpxWjfgCQlc3iJKAu/LF5l19HqHT6koT8lBfQzLkWFOrY6e6mdP36behrT
	 U81M8uloQlZFet8ZCO3fu0k4ZK3iAUaCqfxH5lc9JvR6/TIsUW2tP9IxBbil+rQxm+dJd
	 3y3aaUIGtzV/V8tFfjQ/RMFFY2I2nAU+LCCRbWhHMvgThR6npwRgHu876Y4ZJgo8Qhwkm
	 kM7YhkhH1vtwQM67cw8UO0JmbsTuxwJBvXUtMC6FDYk63/R3RYXsjLbj2rekmR4dYMGCo
	 D4Ia1Jl0BZ11idyA+LuieR4Ep+LPzN8bUzqhIi+X/bukx9NBXDyhNxZFPpZ9MpR4G0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="z3fPrjW/";
	arc=none smtp.remote-ip=209.85.167.177
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78287606A32C
	for <dmaengine@vger.kernel.org>; Wed, 18 Nov 2026 00:08:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78287606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z3fPrjW/
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-5641f26ce05so137309b6e.2
        for <dmaengine@vger.kernel.org>; Tue, 17 Nov 2026 16:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794960483; x=1795565283; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mZRahmf+nFgqKUzG9ukr/7RT5YTO4HPa5I75kKuTXUg=;
        b=z3fPrjW/gupKsNppSFcMFAKkANtMeF0LeBowApEVDhFvET5+SYl6PpoEEqMUeVkQ3O
         jArYFHxOrL0W8f2FdMwzvfWVL+vEmhuI8XtrSlct3h2VYidI3F77ipT+y/59xsiR91Lo
         MlP9mdAWbtYKYIQeKETvt7KxVtFjc5K6SluzXLeF8FVtq9HAqgseAKysjM1518CnTdWH
         nWQ6NHGsk6KUpyb4DvTGmtd19LEDwMeneQohcMJ8qtqUm/AhoDwALXp2YkloSIs2uNqe
         ZXXtClScmXceEgBwjelEZuoSI4Z5ev2DiVISER5qUlG3pKWCQehZbQ3F7p7Mqsf4wsxo
         /5DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794960483; x=1795565283;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mZRahmf+nFgqKUzG9ukr/7RT5YTO4HPa5I75kKuTXUg=;
        b=c4K4oG2kkrLYMRzBlG24pxgKyUkUZt8ytl8dCScp6E80sPl0f+0vLVsqAo5EzRcC9R
         +H4cLRp5vCb50gRXPo82y+3C9sdy+wiZYqLnTgbnGHdpKXDs9qnTu90v+MQoxUrkR2dg
         NPABBFVv1mnyveKmlsjEyhTpaug11DaUt3EUsvxUVGt4/L2aNflS0SoqWj0R+Wqu8tq6
         b5oE6XM2svr230KCI750UYfWmfqIGrw6zkxwkJA6Bv4gxo0IOFw5vi5WX1513+65xHG3
         KRTYWoF58SSt7IWY7tdq2lfWnXHbRjxRa1dpplF1yKAxcYis7u6xZKYSc77Gby7ZvPdM
         446Q==
X-Forwarded-Encrypted: i=1; AL+hErGL0neWN3+gymUCf6XVv6BwJUCdSGYySLp58LwKSf9ScEVakdVmIlLixFW2Erq/fAU4C2LPfiVMD00=@vger.kernel.org
X-Gm-Message-State: APuU4Z95SzFwFWyA+4iurkKY6FNXrJBt/JxMlkOBJ5RTuYnFIuD4syK0
	p2SZmoMHUFYSbNVARBsfOXOU1vxiHwpcpF0FzIwI8n/eglz/XlWWA69O
X-Gm-Gg: AYBFou0LQ/zBG6Lh5qs7y56SDT1RLfOQ1MsbVlZbUsXnb4sfGsp4wvcMxClX1bWepWB
	8R2ZF7LZj8P7IIYnoWSyiNUq0aZ3vyekqjS9Qbcaay8KzpLg3rQqhJHyTgSiDyqDFzbZzqPnpXd
	NZGq8g7UMhnwRdq3orKL2xlvpVXjf4VA+97Kk6c5qUII7cSClbTGNWCZrUPZdjD4G81WGYAO2dA
	cUzNkWQIYFUeeFh15x7efG+35Ims9iA5aCUqL0YZLphV2cGTXJ9M1xcQvCVnDLC6pZ9tFPCOQ/S
	NupBm4UkVCsVPmfCR8GgrMLA9jYX/JMeE64LtbiETC/nxiyZOz+PGntZa5inbM+6Do5jYE9jYYe
	RxhMShQJU8sRbsI+xzvgdwYQI6OpMfYlTLo1DHVYip9Xqyw7oGUc6ir9ZHD5s6zjOvpxjjZhxRw
	hKHGTXvgnI7L2qOWYyaltWjH2WSDBTkxsLHkdk6vH9abX6O2OezHvih0noqX+MnfZoTjddH68Po
	XxApCxNzYjCkc6xeourumlLLfK4hogbRFL3UWD1RMdbP6fwxAy3NtHkLetpoNF/xlVOdhlhtDhf
	8AbVa1x4PTfXfn2cu2kWp2sxv6mTk2ODjuxVAVUt2+2n1kFnvkutg2rm6IOiOU9NcAg/zQBlMps
	A5GVF27nPN7hpAWOg/oKi3CIIvfHKEs+wCxMzpKN/1psEU88WSKMFr/9w4FinAhuee8pJ8dqYZL
	j9Wxs48saLQzOxcst5KHLBzZgJOSpv9gzGNZW5Nv6YZdAevfRSQso=
X-Received: by 2002:a05:6808:15aa:b0:4e8:2150:2a1 with SMTP id 5614622812f47-57743134191mr1370941b6e.68.1794960483361;
        Tue, 17 Nov 2026 16:08:03 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5777b393d40sm434954b6e.17.2026.11.17.16.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 16:08:02 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 17 Nov 2026 17:07:47 -0700
Subject: [PATCH v7 8/8] dmaengine: dw-axi-dmac: guard shared IRQs across
 the controller lifetime
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-submit-dw-axi-dma-stop-pause-v1-v7-8-d5f2309afd72@gmail.com>
References: <20261117-submit-dw-axi-dma-stop-pause-v1-v7-0-d5f2309afd72@gmail.com>
In-Reply-To: <20261117-submit-dw-axi-dma-stop-pause-v1-v7-0-d5f2309afd72@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Sergey Khimich <serghox@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>
Cc: Mitch Barnett <mitch@accuratesound.ca>, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

Requesting a shared interrupt allows the handler to run before probe has
enabled the clocks or registered the DMA channel devices. Initializing
the virtual channels first protects their locks, but does not make the
register accesses or channel-device diagnostics safe. The same register
access problem exists when another device raises a shared interrupt while
the controller is runtime-suspended.

Publish IRQ readiness after hardware initialization and DMA registration.
Once published, take a runtime PM reference only if the controller is
already active. This keeps the clocks enabled through the handler without
waking an idle controller for another device's interrupt. Drain handlers
before disabling clocks, including during forced system suspend, which
does not wait for their runtime PM references.

Keep the initial power reference until registration completes and mark
the manually resumed device active before enabling runtime PM. Balance
the clocks and reference on probe failure. Resume through runtime PM on
removal so an active controller does not acquire an extra clock reference.

Withdraw IRQ readiness and mask the controller before releasing its
shared IRQs. A handler already in flight can re-enable the source on
exit, so mask it again after draining all IRQs, while the clocks are
still enabled.

Fixes: 1fe20f1b8454 ("dmaengine: Introduce DW AXI DMAC driver")
Closes: https://lore.kernel.org/r/sashiko-outbox-216269@kernel.org/
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 77 ++++++++++++++++++++------
 drivers/dma/dw-axi-dmac/dw-axi-dmac.h          |  1 +
 2 files changed, 60 insertions(+), 18 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index 0116c44d3bef..b1d753036744 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -276,6 +276,7 @@ static void axi_dma_hw_init(struct axi_dma_chip *chip)
 	for (i = 0; i < chip->dw->hdata->nr_channels; i++) {
 		axi_chan_irq_disable(&chip->dw->chan[i], DWAXIDMAC_IRQ_ALL);
 		axi_chan_disable(&chip->dw->chan[i]);
+		axi_chan_irq_clear(&chip->dw->chan[i], DWAXIDMAC_IRQ_ALL);
 	}
 	ret = dma_set_mask_and_coherent(chip->dev, DMA_BIT_MASK(64));
 	if (ret)
@@ -1166,6 +1167,14 @@ static irqreturn_t dw_axi_dma_interrupt(int irq, void *dev_id)
 
 	u32 status, i;
 
+	/* Pair with publication after channel registration in dw_probe(). */
+	if (!smp_load_acquire(&chip->irq_ready))
+		return IRQ_NONE;
+
+	/* Shared interrupts can arrive while the controller is suspended. */
+	if (IS_ENABLED(CONFIG_PM) && pm_runtime_get_if_active(chip->dev) <= 0)
+		return IRQ_NONE;
+
 	/* Disable DMAC interrupts. We'll enable them after processing channels */
 	axi_dma_irq_disable(chip);
 
@@ -1191,6 +1200,9 @@ static irqreturn_t dw_axi_dma_interrupt(int irq, void *dev_id)
 	/* Re-enable interrupts */
 	axi_dma_irq_enable(chip);
 
+	if (IS_ENABLED(CONFIG_PM))
+		pm_runtime_put(chip->dev);
+
 	return IRQ_HANDLED;
 }
 
@@ -1377,12 +1389,28 @@ static int dma_chan_resume(struct dma_chan *dchan)
 	return ret;
 }
 
-static int axi_dma_suspend(struct axi_dma_chip *chip)
+static void axi_dma_quiesce_irqs(struct axi_dma_chip *chip)
 {
 	axi_dma_irq_disable(chip);
-	axi_dma_disable(chip);
+	for (unsigned int i = 0; i < DMAC_MAX_CHANNELS; i++)
+		if (chip->irq[i] > 0)
+			synchronize_irq(chip->irq[i]);
+
+	/* A handler already in progress may have re-enabled interrupts. */
+	axi_dma_irq_disable(chip);
+}
 
+static void axi_dma_power_off(struct axi_dma_chip *chip)
+{
+	axi_dma_disable(chip);
 	clk_bulk_disable_unprepare(ARRAY_SIZE(chip->clks), chip->clks);
+}
+
+static int axi_dma_suspend(struct axi_dma_chip *chip)
+{
+	/* System sleep can suspend despite an IRQ handler's runtime PM reference. */
+	axi_dma_quiesce_irqs(chip);
+	axi_dma_power_off(chip);
 
 	return 0;
 }
@@ -1651,8 +1679,6 @@ static int dw_probe(struct platform_device *pdev)
 	dma_set_max_seg_size(&pdev->dev, MAX_BLOCK_SIZE);
 	platform_set_drvdata(pdev, chip);
 
-	pm_runtime_enable(chip->dev);
-
 	/*
 	 * We can't just call pm_runtime_get here instead of
 	 * pm_runtime_get_noresume + axi_dma_resume because we need
@@ -1661,16 +1687,23 @@ static int dw_probe(struct platform_device *pdev)
 	pm_runtime_get_noresume(chip->dev);
 	ret = axi_dma_resume(chip);
 	if (ret < 0)
-		goto err_pm_disable;
+		goto err_pm_put;
 
 	axi_dma_hw_init(chip);
 
-	pm_runtime_put(chip->dev);
+	ret = pm_runtime_set_active(chip->dev);
+	if (ret)
+		goto err_suspend;
+	pm_runtime_enable(chip->dev);
 
 	ret = dmaenginem_async_device_register(&dw->dma);
 	if (ret)
 		goto err_pm_disable;
 
+	/* Publish initialized hardware and channel devices to the IRQ handler. */
+	smp_store_release(&chip->irq_ready, true);
+	pm_runtime_put(chip->dev);
+
 	/* Register with OF helpers for DMA lookups */
 	ret = of_dma_controller_register(pdev->dev.of_node,
 					 dw_axi_dma_of_xlate, dw);
@@ -1685,6 +1718,11 @@ static int dw_probe(struct platform_device *pdev)
 
 err_pm_disable:
 	pm_runtime_disable(chip->dev);
+err_suspend:
+	axi_dma_suspend(chip);
+	pm_runtime_set_suspended(chip->dev);
+err_pm_put:
+	pm_runtime_put_noidle(chip->dev);
 
 	return ret;
 }
@@ -1697,21 +1735,24 @@ static void dw_remove(struct platform_device *pdev)
 	u32 i;
 	int ret;
 
-	/* Enable clk before accessing to registers */
-	ret = clk_bulk_prepare_enable(ARRAY_SIZE(chip->clks), chip->clks);
-	if (ret)
-		dev_warn(chip->dev, "failed to enable clocks before remove: %d\n",
-			 ret);
-	axi_dma_irq_disable(chip);
-	for (i = 0; i < dw->hdata->nr_channels; i++) {
-		axi_chan_disable(&chip->dw->chan[i]);
-		axi_chan_irq_disable(&chip->dw->chan[i], DWAXIDMAC_IRQ_ALL);
+	WRITE_ONCE(chip->irq_ready, false);
+	ret = pm_runtime_resume_and_get(chip->dev);
+	pm_runtime_disable(chip->dev);
+	if (ret < 0) {
+		dev_warn(chip->dev, "failed to resume before remove: %d\n", ret);
+		goto free_irqs;
 	}
-	axi_dma_disable(chip);
 
-	pm_runtime_disable(chip->dev);
-	axi_dma_suspend(chip);
+	axi_dma_quiesce_irqs(chip);
+	for (i = 0; i < dw->hdata->nr_channels; i++) {
+		axi_chan_disable(&dw->chan[i]);
+		axi_chan_irq_disable(&dw->chan[i], DWAXIDMAC_IRQ_ALL);
+	}
+	axi_dma_power_off(chip);
+	pm_runtime_put_noidle(chip->dev);
+	pm_runtime_set_suspended(chip->dev);
 
+free_irqs:
 	for (i = 0; i < DMAC_MAX_CHANNELS; i++)
 		if (chip->irq[i] > 0)
 			devm_free_irq(chip->dev, chip->irq[i], chip);
diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
index b18c9880711a..926d14b23615 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
@@ -70,6 +70,7 @@ struct dw_axi_dma {
 struct axi_dma_chip {
 	struct device		*dev;
 	int			irq[DMAC_MAX_CHANNELS];
+	bool			irq_ready;
 	void __iomem		*regs;
 	void __iomem		*apb_regs;
 	struct clk_bulk_data	clks[2];

-- 
2.53.0

