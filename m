Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B311E47C5
	for <dmaengine@vger.kernel.org>; Sat, 18 Jul 2026 23:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784416639; cv=none; b=lE2MTU44hYZIVk1pOAvgVgmcd+/JieOdo73m9VuEHcbSzJ2gLG5UBkE4lH/IjqyEyWcPwTrLO14BX3RFWLUBOYUFlUlaOIO46F8sKZ/A7zI9nJZF+CXG85miHb6rpUvGO/KoP2yzrqyu/tdq/riChdBCdv5QTu13jTs86YhGRJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784416639; c=relaxed/simple;
	bh=UJ7vyM2rJp8+CcOLDMMT2R4YtHzDWXlxufszC5uVg2M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=io8+3hJf+yhx/atg0Qt27VA/LGzT9Fyh0IcGzg+6LcTmzTmJNjXkiBmUprVKsiYNkgL08O1BxvQIQeHEyLTBM8evPdijuXkJZXHTPfpZcKAC4IXcEPUEmDBDSwoeVLvAhhu+F5+PCLTlJuuZLWV/2LY1XCUl294OVJmqZc1YmOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TeuhCAt5; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TeuhCAt5"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cacb8416a1so55068075ad.1
        for <dmaengine@vger.kernel.org>; Sat, 18 Jul 2026 16:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784416638; x=1785021438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QAs/jDOkLcxZMEnK/1/+jTZT0MCD6a9ikkJvf7W+O2E=;
        b=TeuhCAt5Bv7PEQjreLE3XycvZgaeNa5WMUCFOL1F5qwMqOqj8oioeqIblGfukW/jda
         54gBpkhgl8dmGB8/BgELuUzeSGMbT0RofkcEa6syw1v9EXhBFPFbrwSKAtzzeekCP747
         ooYUlCa5rB17xaE9yQjsphDJj0cfvWjaH8NDF1L58PP2cPWX+yYdQ86gl5Q6fJ39WCG6
         NgiPefXPZkOv8Y2XDtr3SHeb/v3IQndwGOcG7L661vtlvYquRqvngoyArcuXehfxUKpN
         D0U5dyL/VoHEEMWnAYGYZOG87LG/u1XMSErI+U+QbXMrgHCJ1eED2C6K33S41tOa6IuC
         npZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784416638; x=1785021438;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QAs/jDOkLcxZMEnK/1/+jTZT0MCD6a9ikkJvf7W+O2E=;
        b=XX9XuJedqLnKpDLzDK4Jh/JRkkY3qOmejH366w5xEtUdCkDWBwpZq0W/8L/EqPl3BE
         4D50ZHT4+dVSL4IzehRqe/K5H3+hcy4eV40kOrIArKI9lSvUvWrJ399IhAtCWiOP8Lr9
         QfNn7sUGh0BpYQP5cZBhvss1asDePlOoeYpA8yBd1sP/kAEkqnCIvXkIwnNvrRSjRXVW
         Q1fj9jgnp4wjaQD4oLfyU8NzwuBvkO5mAQ+HJ18+O7SEtN6hYc2hGwuZN51Bg2hOCJib
         jBminqQyF3FFRIGsoWjgyMdkw5QZTyYp7dCLm7G5N3Q0Y6zrCIjm/Wt8WUUaBY0PVxhD
         zB7A==
X-Gm-Message-State: AOJu0YyqKUOkJ9sUUKsW8kQwWdfZuOu1gmsrIvISsWpG05yvfVq/VMmJ
	2IsNzONsOgpYM+YSXg7Sj6fzL49Ry71dfRrl/u0pO65HmlHskIgE2KghO0lHgg==
X-Gm-Gg: AfdE7clrKt0u9nnBnMhYrJgwyTYKEiknHE5RLJq5rYQKpjZngFYZEGIO1kZmWXpqJbB
	eAqzDn9kR1rQUPCfW5sUs0r747irZe5o45MkAempY4dDTsy8FPF49Bp+R+Ko1+ZVWJs05fU4fSK
	0MvqQ1clNLQRegv0t+ZIj5KIYkaT865Yxs6y7zshAmF9OUFD+tbB8EQZHPpjBi1Tc2InVGJbExC
	njQVW6JO0ddfi3IxunSI9SaFlWoqUdRb9Z1AdzSJCh9hKedt6I9t/PlLaw6lZvO9eVn1Xgc3j54
	b5x57IG8OqctIuRcE75Mcfb2Y/1yKvvmKz7j69nMkcl6axD+MBgY9Z6IwRl5HflFaeOX2leGcKd
	BzMbSI5BgSBMTJqaOkcMYEDQGDX9Sl79O5f6ivvYUpM5kRiQlVLPzomRNrZRcJ3dRi0+q/dmQnY
	90vjkDVB015wjOO87E1bdLQFjtgt/UpdyTsy2fytS/ZolN6tmUZRFSiV/y8EiYvdfBfTZNs9EKT
	yMczGu2GZgFlX4TSdmNYUGUVqWV47Xq8NusMNDiEifMKLTTVN6/ua4=
X-Received: by 2002:a17:903:ad0:b0:2ca:d976:95ce with SMTP id d9443c01a7336-2cf349f20f7mr86498375ad.39.1784416637917;
        Sat, 18 Jul 2026 16:17:17 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf344f8c27sm32731155ad.34.2026.07.18.16.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 16:17:17 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Xuelin Shi <xuelin.shi@freescale.com>,
	Harninder Rai <harninder.rai@freescale.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] dmaengine: fsl_raid: free resources in probe
Date: Sat, 18 Jul 2026 16:17:15 -0700
Message-ID: <20260718231716.230144-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add free_irq() in the error unwind of fsl_re_chan_probe() and in
fsl_re_remove_chan() so the interrupt is always released.

Also add tasklet_kill(). Present in _remove but not _probe.

Also add platform_device_put on failure as of_platform_device_create()
increases the reference count and needs platform_device_put on failure.
Requires placing the pointer in the struct for the _remove function.
While at it, use platform_get/set_drvdata as there's no need for using a
device pointer for that.

Fixes: ad80da658bbc ("dmaengine: Driver support for FSL RaidEngine device.")
Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/fsl_raid.c | 32 ++++++++++++++++++++------------
 drivers/dma/fsl_raid.h |  1 +
 2 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
index 0b0b4e8fc821..b1a10292324d 100644
--- a/drivers/dma/fsl_raid.c
+++ b/drivers/dma/fsl_raid.c
@@ -212,10 +212,11 @@ static void fsl_re_dequeue(struct tasklet_struct *t)
 /* Per Job Ring interrupt handler */
 static irqreturn_t fsl_re_isr(int irq, void *data)
 {
+	struct platform_device *pdata = data;
 	struct fsl_re_chan *re_chan;
 	u32 irqstate, status;
 
-	re_chan = dev_get_drvdata((struct device *)data);
+	re_chan = platform_get_drvdata(pdata);
 
 	irqstate = in_be32(&re_chan->jrregs->jr_interrupt_status);
 	if (!irqstate)
@@ -645,7 +646,7 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
 	struct platform_device *chan_ofdev;
 
 	dev = &ofdev->dev;
-	re_priv = dev_get_drvdata(dev);
+	re_priv = platform_get_drvdata(ofdev);
 	dma_dev = &re_priv->dma_dev;
 
 	chan = devm_kzalloc(dev, sizeof(*chan), GFP_KERNEL);
@@ -656,8 +657,7 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
 	chan_ofdev = of_platform_device_create(np, NULL, dev);
 	if (!chan_ofdev) {
 		dev_err(dev, "Not able to create ofdev for jr %d\n", q);
-		ret = -EINVAL;
-		goto err_free;
+		return -EINVAL;
 	}
 
 	/* read reg property from dts */
@@ -683,17 +683,18 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
 	chandev = &chan_ofdev->dev;
 	tasklet_setup(&chan->irqtask, fsl_re_dequeue);
 
-	ret = request_irq(chan->irq, fsl_re_isr, 0, chan->name, chandev);
+	ret = request_irq(chan->irq, fsl_re_isr, 0, chan->name, chan_ofdev);
 	if (ret) {
 		dev_err(dev, "Unable to register interrupt for JR %d\n", q);
 		ret = -EINVAL;
-		goto err_free;
+		goto err_free_tasklet;
 	}
 
 	re_priv->re_jrs[q] = chan;
 	chan->chan.device = dma_dev;
 	chan->chan.private = chan;
 	chan->dev = chandev;
+	chan->ofdev = chan_ofdev;
 	chan->re_dev = re_priv;
 
 	spin_lock_init(&chan->desc_lock);
@@ -707,7 +708,7 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
 	if (!chan->inb_ring_virt_addr) {
 		dev_err(dev, "No dma memory for inb_ring_virt_addr\n");
 		ret = -ENOMEM;
-		goto err_free;
+		goto err_free_irq;
 	}
 
 	chan->oub_ring_virt_addr = dma_pool_alloc(chan->re_dev->hw_desc_pool,
@@ -739,7 +740,7 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
 	out_be32(&chan->jrregs->jr_config_1,
 		 FSL_RE_CFG1_CBSI | FSL_RE_CFG1_CBS0 | status);
 
-	dev_set_drvdata(chandev, chan);
+	platform_set_drvdata(chan_ofdev, chan);
 
 	/* Enable RE/CHAN */
 	out_be32(&chan->jrregs->jr_command, FSL_RE_ENABLE);
@@ -749,7 +750,12 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
 err_free_1:
 	dma_pool_free(chan->re_dev->hw_desc_pool, chan->inb_ring_virt_addr,
 		      chan->inb_phys_addr);
+err_free_irq:
+	free_irq(chan->irq, chan_ofdev);
+err_free_tasklet:
+	tasklet_kill(&chan->irqtask);
 err_free:
+	platform_device_put(chan_ofdev);
 	return ret;
 }
 
@@ -828,7 +834,7 @@ static int fsl_re_probe(struct platform_device *ofdev)
 		return -ENOMEM;
 	}
 
-	dev_set_drvdata(dev, re_priv);
+	platform_set_drvdata(ofdev, re_priv);
 
 	/* Parse Device tree to find out the total number of JQs present */
 	for_each_compatible_node_scoped(np, NULL, "fsl,raideng-v1.0-job-queue") {
@@ -864,21 +870,23 @@ static void fsl_re_remove_chan(struct fsl_re_chan *chan)
 {
 	tasklet_kill(&chan->irqtask);
 
+	free_irq(chan->irq, chan->ofdev);
+
 	dma_pool_free(chan->re_dev->hw_desc_pool, chan->inb_ring_virt_addr,
 		      chan->inb_phys_addr);
 
 	dma_pool_free(chan->re_dev->hw_desc_pool, chan->oub_ring_virt_addr,
 		      chan->oub_phys_addr);
+
+	platform_device_put(chan->ofdev);
 }
 
 static void fsl_re_remove(struct platform_device *ofdev)
 {
 	struct fsl_re_drv_private *re_priv;
-	struct device *dev;
 	int i;
 
-	dev = &ofdev->dev;
-	re_priv = dev_get_drvdata(dev);
+	re_priv = platform_get_drvdata(ofdev);
 
 	/* Cleanup chan related memory areas */
 	for (i = 0; i < re_priv->total_chans; i++)
diff --git a/drivers/dma/fsl_raid.h b/drivers/dma/fsl_raid.h
index adbfede330a7..34d362803610 100644
--- a/drivers/dma/fsl_raid.h
+++ b/drivers/dma/fsl_raid.h
@@ -270,6 +270,7 @@ struct fsl_re_chan {
 	struct list_head active_q; /* already issued on hw, not completed */
 	struct list_head submit_q;
 	struct list_head free_q; /* alloc available queue */
+	struct platform_device *ofdev;
 	struct device *dev;
 	struct fsl_re_drv_private *re_dev;
 	struct dma_chan chan;
-- 
2.55.0

