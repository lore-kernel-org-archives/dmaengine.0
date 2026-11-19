Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795104120;
	b=28jbGOpWKAwy3IgGvQq00TCkiCxEmp91fE64uH+Ymo7nAOEh0VWpiUKX3u2e7y3V0Ol1
	 ofP06/QWz/1zbPevNlk3L3vATCNO4sSaPPdEk49Wkb/NDRvUITd6VUR0L3J7gwabydQ34
	 +Oh7NiZUnmCl4u1VgAcBSvDgkXjws5TDCyqoNUnyvVfs3Lq6tS+oJrlKtdSQ9QyfcdQ5+
	 Gwa9JXZobm38HdUUQVibR/h6WIyk0JTMzaBVYkPswfOx53yD87B4MCzNsiEaJHkP81sEk
	 BEcb8Ub7Ju4anNn1jX2mFwjX37iJh4RgfEed56/P/LpSu4wtxSnFqdowR59AbohEftw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795104120;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=iK6zyPeBY1pH/t4BLMOptSyyu5CkzAyptNTdF8l1WS8=;
	b=qPYFHbYPuNiX9nJwCjyMEw4/Y6IrIbbHXE1uc2UEu83IfawIVSotMX5Ks1zTFB/C3zGn
	 zBOEwZ0IookoKj1KmurO//V6dHkZHjn3x/uEc3htRj0KWBKpeJV60TLYX1CeWElc7/H0Z
	 pvBE7Ua5qG2CkUYSIrSkpfVRjQ+hFNOHOZvSUw603rPJ4UYWnslybffTbh67PU5GRk0uB
	 DUJ2eTSexASBK7AuWUEteYUfFCLWnB+g5QsnO+cVgWpQJNy0LUlfTBKMyMTMeW5V2FRQG
	 Lf5+tnEW95mrxFyxK+1S5mcHcwrJeT9/5e3477imR1NgyujhW8k8EgNDaEoXZBrPN+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fj2Upmrl;
	arc=none smtp.remote-ip=209.85.128.169
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6943460A2628
	for <dmaengine@vger.kernel.org>; Thu, 19 Nov 2026 16:02:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6943460A2628
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fj2Upmrl
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8b4d6981c67so15191677b3.1
        for <dmaengine@vger.kernel.org>; Thu, 19 Nov 2026 08:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795104119; x=1795708919; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iK6zyPeBY1pH/t4BLMOptSyyu5CkzAyptNTdF8l1WS8=;
        b=Fj2Upmrl8xZxiAEuQY3yOXiMg9GVGVjNFbIcqXifeL4/JacH5y0989zwudxq5Mzxwu
         ZcRtTVnP4rHsEHP/vJYqi3Lh/ClwldeRg6pvQvHhSHIz3lNFbpqApHZ4UPWQeXREouRz
         Twa2d3Ar/ftUY/TYMJhs2cb6T/gEo8RH+vQUs5PykRk94rKC1EZG1FAkk12F9wSqq1IE
         ruKDJw7Igrtv5W5c1ZauhmtrL6p3Vp/WjT4b/oTPsSnQ6G21Jmgr+IfoZWSWHlDap03S
         L3ExXPP0QYJFKhJR7suzQYs2ZvJO7OVyn5Fn/gvb3THhXABjCRkPmdfkdUCZ687GPG0l
         PcSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795104119; x=1795708919;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iK6zyPeBY1pH/t4BLMOptSyyu5CkzAyptNTdF8l1WS8=;
        b=YC7BItEulVhSSdNSyEYT/UvatDuD0UFES/3ueMXGDJYKuEuuE2LyrmccMYBVehK8tw
         tsiWt3JpJUmusbGWh8kStcfXu7vR50lZo2xIj5uSIJucgc204BHbnLExHnK+xdMwbscA
         HSXL88D6B4EPszdT+mET9iACQngQerMtfsKAODAQSTQii+8B9SQVSO7z0IFkZ0xSLJ6K
         gRPL6bkasp+mxenUstkEmb6TF8bhVMZHC9+usUAZ5wZh5NbJHwEe4Mx1MxMxhSD5S/nv
         kmnqvTTa1Jf6s2qIVA9im7DWBfD8O+E3T4l6mpGekSFnfIj5mo/GGm+RrmAaLjao1jxl
         T7wQ==
X-Forwarded-Encrypted: i=1; AL+hErGMEHozmZem/dnn0KfwZ5tkzCADtrxCFIQNAdnpv5092/NB8s3ibE0SlaIm/yJncOcVjJA6oza9nrE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bF7AAHfEXlB8d4m01ghvx6wwdRnkDVclg7xm5MTTp0IMhTobJ
	kba4eZglsw6rxUlNqAJYoGe6GQSzsS+DlvIN32fCaPKeZgokM5fIEzlU
X-Gm-Gg: AZFdTZdj+hK4+zvsuYZ8bgM9JQrxgBHm3JcnYLxtrUKg82BbCsRwXEG/HwdtjONROUy
	IwBUeWA4WgWgzqd2w9LdahuE/lWZ5pptZpR/m8P81DhsHvI9PDxur0qenrekaunOErV4EQ2804x
	DmZdK6JAV0esAZaF/GCpc+h1QzBX0Q+cMXs+bZptiW06sQ9ddst8+KVE2piWQ3xxuTWejiG4TC2
	OUsXcvJs/tsB7HdemCXcENLSMqVVnKi0jv9qwde+M59McpR23qJqlKHPxTDPNhSdT1W7ypPlAJ8
	0sEWzmcoAAjMB3A8RiduVO3SDHYiJ3xy9V6BA5x78XCbVJeCQ7BAfJjO5An4yWrX4zJg4/jIr6i
	io4St09PYvRsGFQLdR6UggPcfnWKzbKpEgUp1kNkfRP+ZIIPIuqiSXHJBNVr67CdE5AGVFWQgUS
	iZ5ArksI+bKJuJ+jFbyiLWB8+5mlcjUwvXA96y0FV1ef7PLQ4BdAPA6ILpusqVc6udxYln0Bl86
	8QbZI8v5AiKI7y5fRunBTHq3Jwt9lvr0FBAlNO2U1WuzFuui9J+qAHK71t6ngIQz9IR3aOyt1kf
	UuApkLMlmeG6Ob/z7/0Y/O1v2k0h5m4rA7KhAshwdHrL0TST1BIBNzzHS+5Y1aOQUFzSvuKUUCA
	kLpKSWpzdNGvAoy+S9bl9X17O4rzt4UgpQtxEFoN4DL12Uv1wkk0sLTagMtuIgNj5hHWAKAoHrS
	/qvpR402gmC9EJFgl+T/kIhwYvDYJ2iJKFQn5dgB2t/8y4xucqLD8=
X-Received: by 2002:a05:690c:4a06:b0:8b4:d66a:2002 with SMTP id 00721157ae682-8b520515e7fmr753147b3.65.1795104119507;
        Thu, 19 Nov 2026 08:01:59 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b52031aa4bsm623267b3.34.2026.11.19.08.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:01:58 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Nov 2026 09:01:04 -0700
Subject: [PATCH v8 9/9] dmaengine: dw-axi-dmac: guard shared IRQs across
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
Message-Id: <20261119-submit-dw-axi-dma-stop-pause-v1-v8-9-f8e7fe60594c@gmail.com>
References: <20261119-submit-dw-axi-dma-stop-pause-v1-v8-0-f8e7fe60594c@gmail.com>
In-Reply-To: <20261119-submit-dw-axi-dma-stop-pause-v1-v8-0-f8e7fe60594c@gmail.com>
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
off. Checking the runtime PM status in the handler is not sufficient:
the controller can already signal an interrupt in the resume callback,
before the PM core marks the device active.

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

