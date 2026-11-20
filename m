Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202051;
	b=sftzsWPyFKTsX8PxzMy6+x3fGRXnW6+wv5Di9cveHHGRAT1/EDCpqpxlQkMyggzmCvZ2
	 NE7E6apgXGGtTgoJs0B4d2Ypd/zdHc0oHP0sNXtX3utOVZMqBcQn+z5Lo3FtVCK8/3T9O
	 AT7+8m/rixX8beqSF6uB5G4E25wgfSkXBL8N9dv2GmRuQ6XYrdVIO24tBIoACEwsuTzbJ
	 AzHrHkgF67U+KFu1iuza80ybR+ExnKxcau/QEP79Ucb51XBMaqkvGCKMM51KWVD8SN8EY
	 EM498w1D9Qf+nTfAR3B2z8sG94K+yxYgGVXYSOLYYN8icP+sYK/k6yxDh5AwugLttaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202051;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=lXcJhRw0GkyIcp+Z+lj797v+WGYfXH6jpd253OJB95U=;
	b=1E/H+dYCYQBqGx4dMCofNbvL4mi+imW+GZtxqkyJ7EisBy7ZTs4cZOVzKLSTa01rhwvV
	 384S/Ihb9+IwNlQuH/jqtgKrf/HHMgFSstrBCjrf43FYJNnYYsBAXcoHg8OK3TFmR4RV+
	 rVK9y5r8rxOpvV7YgSJ2jQ3AV1IiwhK0Hnbu4IXZ0njZ+OxxpMkhfmiT6YdV/ZcZSkEb0
	 jn/pAuzCnbbmvuUn3C4tPDTohRIrlqAwUnFUJ3UpeIiMZHSKDFdUORuwtgIu1tm8c7lZY
	 jksr+B4bvCsUPqkJc8gGCJhZYaUSEmCNZqmWPJ4nYPeQgI6WH4dcKpnCcvAoDS4IH7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kTTlopaR;
	arc=none smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6C060A381D
	for <dmaengine@vger.kernel.org>; Fri, 20 Nov 2026 19:14:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D6C060A381D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kTTlopaR
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-70b875f6f1fso1005447eaf.2
        for <dmaengine@vger.kernel.org>; Fri, 20 Nov 2026 11:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795202049; x=1795806849; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lXcJhRw0GkyIcp+Z+lj797v+WGYfXH6jpd253OJB95U=;
        b=kTTlopaR2KIAIgfDie50kv3fjqD8+HUqzuaCmYvDzehD/y6MhfCJL1jx+aURTBYHWB
         hgZCZVUBWrX2hppnZUiVFRe1gAr7xSBxJpRRRixtTp+jlFa7rWKq1ajJWbcCEAJMmsJg
         EJTjcIrm47HapgYTmOXe/+jPOZDXvt25l0cUutIVPs5RKGlcoMBaJ8x1FnTX1JoG5zlp
         rXeoOVuiiz5uttXz8043brrT+Rj91Uhf+o2YUoi8+TBnUbD69nbmYM7bxSYll185BkYB
         SpGKS0CZco3zJoNzw6Nba4dJhdqItkBuSjgHjlHpxVKOkEqJMfgLj1lZNRJN/zpE4Fi0
         V9cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202049; x=1795806849;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lXcJhRw0GkyIcp+Z+lj797v+WGYfXH6jpd253OJB95U=;
        b=f5p4T8/B7IwrjzT6BoQPUiEo6ow88Tt7b1JSFAp94AviRhSIPs/yEkX/yxOIlmjElL
         tbYEE9SktIe1e/TNBXKKQxYIwywmdX1UjZxj+BQ9Kfkf1kLHl7/4VbpZsIwOXNaPEtZe
         ae6vlaxHvQ9ZT33Jr0GzRPK6qOMfitBO6WzB3tQRBWrOaxkWxnXyW5Icf6tyCx8n8m5c
         QKDDspqCtbBnS0wTXruoQIA+v2+W9d/YUBmApX1msiGexube9sKy4dMPs1nOY0JGpMhh
         qCSRPh4Px+fx/dszvu0aEujZfZkmQw40R+k5mNEkZIMwjk+SneGHoqJzuQpLFtpwq6vz
         LSgw==
X-Forwarded-Encrypted: i=1; AL+hErFO2AXTrNLi9OA4c38kQRyiV9Rbg4VlQ4EMBI6dZ2JyxJYw4j5ITaLnl5moCxo90fJYSwAr036w56k=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mL32NSR6OyVwGm6vrnKLTZvvKukxsje+CtaJoTrDI6mYoU+Wj
	tvIkndkDGyaVWc8WeYQakUj8ZpXbf3sQgWEWnR9aBjniMJyyn4Mrnd2e
X-Gm-Gg: AYBFou2xD0O/Asyv/TGI3tTrGhuvZX39KMchBhnjvaKUJqjyejckvlnStzxZnV2jcrs
	8K6NwIImLL7/XWS8+O8uBOoVZyCVg2s3mHi4aL1d70gjKWSDE+9OgUTGxJbd5OFQ9c54Tp5K9z+
	lZmtRCemP7++O2Dd1sZO4racFkIRWXL1FW7Er/WtvTqI3g7bi1a9i9c6DLgvL5zihuTggDgue5L
	7kHFDOLQAFvdwsa09Hw1nBvAwx/CqgCoriRZjAtu+3m8vf0bdEHSqTS6QwleGO/HNPSNvXI8GO4
	g8A3OiEVchYHc4viZhLyGrvkz/XR4F/HEpBPfTQjW4FjMTeFQReLdF6Id+W23gxTo/u/6BaeMfW
	usvkDHlno3/89I/QORRu4MlL0M823+4sMbpX0f0IpKOJq1guCt68qiQ5Nbar+ebY0fDoT1qwo1d
	TJ0PDegCdOGe/gRn2OuxanSWp4M6O94FhOXcjCsfppj7XQKpDDDTSZ0Q1sDQ1C9wOZW/ecmu/2P
	cbzY740vOaGn8wuE965QJXMejztRZXfNJPC3krO7TeHIxLaAu7QD6zstPnzRDODeBhN2g3fD0rQ
	cz8FK1eZqDWUspssow+YNldNPlkbn3nIDZ6JXFlJMIZrmyDpmLwjX0mlRhJs+ZmPty+U5z6PIWh
	SkS5kwWxAJqtxo7S7FsWafIltWBjlY1GruoN2xUvQ0uHyKRMkWDwh/5lWtHcq4mOzap+Yo9DECC
	jLMjRcINoWRAJ4ChhT8FfUptyV+h01JK5Jdtv2z8LzJuwiCjlrrYPX
X-Received: by 2002:a05:6820:55ca:20b0:71b:561:a13 with SMTP id 006d021491bc7-71b3947af20mr2530106eaf.39.1795202049421;
        Fri, 20 Nov 2026 11:14:09 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168f3964sm2654782a34.14.2026.11.20.11.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:14:09 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 12:13:59 -0700
Subject: [PATCH v9 9/9] dmaengine: dw-axi-dmac: guard shared IRQs across
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
Message-Id: <20261120-submit-dw-axi-dma-stop-pause-v1-v9-9-48ab58961d6e@gmail.com>
References: <20261120-submit-dw-axi-dma-stop-pause-v1-v9-0-48ab58961d6e@gmail.com>
In-Reply-To: <20261120-submit-dw-axi-dma-stop-pause-v1-v9-0-48ab58961d6e@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Sergey Khimich <serghox@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>, Baruch Siach <baruch@tkos.co.il>
Cc: Mitch Barnett <mitch@accuratesound.ca>, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

An interrupt from another device on the shared line can run the handler
before the DMA channel devices exist or while the register clocks are
off. During probe the device is runtime-active before DMAengine
registration finishes. Conversely, the controller can already signal an
interrupt during resume, before the PM core marks it active. Runtime PM
status alone therefore cannot tell the handler when it may touch channels.

Mask the controller and clear stale channel status before requesting
the IRQs. Keep the global mask in place until DMA registration returns.
A transfer that completes during registration leaves its channel status
pending and is serviced when the controller interrupts are enabled.

Serialize the hardware mask and handler readiness under a chip lock.
Mask the source before withdrawing the handler and prevent a handler
already processing channels from re-enabling it on exit. Drain each IRQ
before disabling the clocks. This also covers forced system suspend and
lets removal leave an already suspended controller powered down.

Fixes: 1fe20f1b8454 ("dmaengine: Introduce DW AXI DMAC driver")
Closes: https://lore.kernel.org/r/sashiko-outbox-216269@kernel.org/
Link: https://lore.kernel.org/r/sashiko-outbox-219846@kernel.org/
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 119 ++++++++++++++++---------
 drivers/dma/dw-axi-dmac/dw-axi-dmac.h          |   3 +
 2 files changed, 81 insertions(+), 41 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index 531705f8f89b..eab3c31f77df 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -277,6 +277,7 @@ static void axi_dma_hw_init(struct axi_dma_chip *chip)
 	for (i = 0; i < chip->dw->hdata->nr_channels; i++) {
 		axi_chan_irq_disable(&chip->dw->chan[i], DWAXIDMAC_IRQ_ALL);
 		axi_chan_disable(&chip->dw->chan[i]);
+		axi_chan_irq_clear(&chip->dw->chan[i], DWAXIDMAC_IRQ_ALL);
 	}
 	ret = dma_set_mask_and_coherent(chip->dev, DMA_BIT_MASK(64));
 	if (ret)
@@ -1167,8 +1168,11 @@ static irqreturn_t dw_axi_dma_interrupt(int irq, void *dev_id)
 
 	u32 status, i;
 
-	/* Disable DMAC interrupts. We'll enable them after processing channels */
-	axi_dma_irq_disable(chip);
+	scoped_guard(spinlock_irqsave, &chip->irq_lock) {
+		if (!chip->irq_ready)
+			return IRQ_NONE;
+		axi_dma_irq_disable(chip);
+	}
 
 	/* Poll, clear and process every channel interrupt status */
 	for (i = 0; i < dw->hdata->nr_channels; i++) {
@@ -1189,8 +1193,10 @@ static irqreturn_t dw_axi_dma_interrupt(int irq, void *dev_id)
 		spin_unlock_irqrestore(&chan->vc.lock, flags);
 	}
 
-	/* Re-enable interrupts */
-	axi_dma_irq_enable(chip);
+	scoped_guard(spinlock_irqsave, &chip->irq_lock) {
+		if (chip->irq_ready)
+			axi_dma_irq_enable(chip);
+	}
 
 	return IRQ_HANDLED;
 }
@@ -1378,17 +1384,39 @@ static int dma_chan_resume(struct dma_chan *dchan)
 	return ret;
 }
 
-static int axi_dma_suspend(struct axi_dma_chip *chip)
+static void axi_dma_start_irqs(struct axi_dma_chip *chip)
 {
-	axi_dma_irq_disable(chip);
-	axi_dma_disable(chip);
+	guard(spinlock_irqsave)(&chip->irq_lock);
 
-	clk_bulk_disable_unprepare(ARRAY_SIZE(chip->clks), chip->clks);
+	chip->irq_ready = true;
+	axi_dma_irq_enable(chip);
+}
 
-	return 0;
+static bool axi_dma_quiesce_irqs(struct axi_dma_chip *chip)
+{
+	scoped_guard(spinlock_irqsave, &chip->irq_lock) {
+		if (!chip->irq_ready)
+			return false;
+		axi_dma_irq_disable(chip);
+		/* Flush the mask before withdrawing the handler. */
+		axi_dma_ioread32(chip, DMAC_CFG);
+		chip->irq_ready = false;
+	}
+
+	for (unsigned int i = 0; i < DMAC_MAX_CHANNELS; i++)
+		if (chip->irq[i] > 0)
+			synchronize_irq(chip->irq[i]);
+
+	return true;
+}
+
+static void axi_dma_power_off(struct axi_dma_chip *chip)
+{
+	axi_dma_disable(chip);
+	clk_bulk_disable_unprepare(ARRAY_SIZE(chip->clks), chip->clks);
 }
 
-static int axi_dma_resume(struct axi_dma_chip *chip)
+static int axi_dma_power_on(struct axi_dma_chip *chip)
 {
 	int ret;
 
@@ -1396,8 +1424,8 @@ static int axi_dma_resume(struct axi_dma_chip *chip)
 	if (ret < 0)
 		return ret;
 
+	axi_dma_irq_disable(chip);
 	axi_dma_enable(chip);
-	axi_dma_irq_enable(chip);
 
 	return 0;
 }
@@ -1406,14 +1434,23 @@ static int __maybe_unused axi_dma_runtime_suspend(struct device *dev)
 {
 	struct axi_dma_chip *chip = dev_get_drvdata(dev);
 
-	return axi_dma_suspend(chip);
+	if (axi_dma_quiesce_irqs(chip))
+		axi_dma_power_off(chip);
+
+	return 0;
 }
 
 static int __maybe_unused axi_dma_runtime_resume(struct device *dev)
 {
 	struct axi_dma_chip *chip = dev_get_drvdata(dev);
+	int ret;
 
-	return axi_dma_resume(chip);
+	ret = axi_dma_power_on(chip);
+	if (ret)
+		return ret;
+
+	axi_dma_start_irqs(chip);
+	return 0;
 }
 
 static struct dma_chan *dw_axi_dma_of_xlate(struct of_phandle_args *dma_spec,
@@ -1560,6 +1597,7 @@ static int dw_probe(struct platform_device *pdev)
 	chip->dw = dw;
 	chip->dev = &pdev->dev;
 	chip->dw->hdata = hdata;
+	spin_lock_init(&chip->irq_lock);
 
 	chip->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(chip->regs))
@@ -1614,10 +1652,6 @@ static int dw_probe(struct platform_device *pdev)
 		vchan_init(&chan->vc, &dw->dma);
 	}
 
-	ret = axi_req_irqs(pdev, chip);
-	if (ret)
-		return ret;
-
 	/* Set capabilities */
 	dma_cap_set(DMA_MEMCPY, dw->dma.cap_mask);
 	dma_cap_set(DMA_SLAVE, dw->dma.cap_mask);
@@ -1656,26 +1690,30 @@ static int dw_probe(struct platform_device *pdev)
 	dma_set_max_seg_size(&pdev->dev, MAX_BLOCK_SIZE);
 	platform_set_drvdata(pdev, chip);
 
-	pm_runtime_enable(chip->dev);
-
-	/*
-	 * We can't just call pm_runtime_get here instead of
-	 * pm_runtime_get_noresume + axi_dma_resume because we need
-	 * driver to work also without Runtime PM.
-	 */
+	/* Power up explicitly so probe also works without runtime PM. */
 	pm_runtime_get_noresume(chip->dev);
-	ret = axi_dma_resume(chip);
+	ret = axi_dma_power_on(chip);
 	if (ret < 0)
-		goto err_pm_disable;
+		goto err_pm_put;
 
 	axi_dma_hw_init(chip);
 
-	pm_runtime_put(chip->dev);
+	ret = axi_req_irqs(pdev, chip);
+	if (ret)
+		goto err_power_off;
+
+	ret = pm_runtime_set_active(chip->dev);
+	if (ret)
+		goto err_power_off;
+	pm_runtime_enable(chip->dev);
 
 	ret = dmaenginem_async_device_register(&dw->dma);
 	if (ret)
 		goto err_pm_disable;
 
+	axi_dma_start_irqs(chip);
+	pm_runtime_put(chip->dev);
+
 	/* Register with OF helpers for DMA lookups */
 	ret = of_dma_controller_register(pdev->dev.of_node,
 					 dw_axi_dma_of_xlate, dw);
@@ -1690,6 +1728,11 @@ static int dw_probe(struct platform_device *pdev)
 
 err_pm_disable:
 	pm_runtime_disable(chip->dev);
+err_power_off:
+	axi_dma_power_off(chip);
+	pm_runtime_set_suspended(chip->dev);
+err_pm_put:
+	pm_runtime_put_noidle(chip->dev);
 
 	return ret;
 }
@@ -1700,22 +1743,16 @@ static void dw_remove(struct platform_device *pdev)
 	struct dw_axi_dma *dw = chip->dw;
 	struct axi_dma_chan *chan, *_chan;
 	u32 i;
-	int ret;
-
-	/* Enable clk before accessing to registers */
-	ret = clk_bulk_prepare_enable(ARRAY_SIZE(chip->clks), chip->clks);
-	if (ret)
-		dev_warn(chip->dev, "failed to enable clocks before remove: %d\n",
-			 ret);
-	axi_dma_irq_disable(chip);
-	for (i = 0; i < dw->hdata->nr_channels; i++) {
-		axi_chan_disable(&chip->dw->chan[i]);
-		axi_chan_irq_disable(&chip->dw->chan[i], DWAXIDMAC_IRQ_ALL);
-	}
-	axi_dma_disable(chip);
 
 	pm_runtime_disable(chip->dev);
-	axi_dma_suspend(chip);
+	if (axi_dma_quiesce_irqs(chip)) {
+		for (i = 0; i < dw->hdata->nr_channels; i++) {
+			axi_chan_disable(&dw->chan[i]);
+			axi_chan_irq_disable(&dw->chan[i], DWAXIDMAC_IRQ_ALL);
+		}
+		axi_dma_power_off(chip);
+	}
+	pm_runtime_set_suspended(chip->dev);
 
 	for (i = 0; i < DMAC_MAX_CHANNELS; i++)
 		if (chip->irq[i] > 0)
diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
index b18c9880711a..80e4632c0d55 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
@@ -14,6 +14,7 @@
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/dmaengine.h>
+#include <linux/spinlock.h>
 #include <linux/types.h>
 
 #include "../virt-dma.h"
@@ -70,6 +71,8 @@ struct dw_axi_dma {
 struct axi_dma_chip {
 	struct device		*dev;
 	int			irq[DMAC_MAX_CHANNELS];
+	spinlock_t		irq_lock; /* Protects irq_ready and the global IRQ mask. */
+	bool			irq_ready;
 	void __iomem		*regs;
 	void __iomem		*apb_regs;
 	struct clk_bulk_data	clks[2];

-- 
2.53.0

