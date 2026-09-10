Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B457D397329
	for <dmaengine@vger.kernel.org>; Thu, 10 Sep 2026 20:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789071364; cv=none; b=nlJidPi6/dGtYNH36myRFnzhfse/rNzmuglARe/XRyDhVOxARTVjY6+HxfcWCkqVfH9mpKwiREv9wqmHadvU+mS5Vbsu0gjE0W+Ru+f2T4Url9bpr+EtyeCCYB+x85Ect9vBTAPq+Q/5rtn5uZNyiXXd0GXgPBriRk0WfDmvWCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789071364; c=relaxed/simple;
	bh=2t6iEDA7zf3AOayYdwXK0SOCLfzvJ3STyo7Hy22ZSX0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qs5LWUPePecrg5uqU1zjQlsft/7QauCXs96XHJSGATQBXmu2FGi5rjP0LGEWeUYlJsJ68HkdhaJ3ocIOgdu27YZHNj4aCDviH8xlR/HA99fo+yNeiptyFY/37kTnqhxc1LpH1TQJjl0D4GGC7JmDOfNO3yVDoSjMSIG/oPKyl0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BkojnT5M; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BkojnT5M"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-939d917fee3so7970585a.3
        for <dmaengine@vger.kernel.org>; Thu, 10 Sep 2026 13:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789071361; x=1789676161; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xp9c7LyaPvV/qIFnSXfT0Qk+bTOQ/yY3E+O4DTcTZiY=;
        b=BkojnT5MQMJEkDnbqVBwXXkDPTHbwN8zZz0KFPbNf+jCBkljbgepeVCC1XUchsDeUo
         N+XJlThYA23yz9JWk/mENaUIe47grYIcVygFDjRj/R/Ng3xk1YrwXXStCwkn5ZMLaYh0
         3v8P42Sx+RxluB/HYEYsd/4yWhP9jngIgLqOjXbggqOwZPrGnjZbKDJq5LcM1Rt00z03
         Jfpt3A7pWQqGwh2tBKrVEh/4WChosGAnb8opFQOJm4PPxKJQMtISnpJA4rALYMdyejlD
         PJLEqy+uSdcbB/ts5Hy+S+rUTe5Y7A1WEi7d/yZWzSwLhHYjoIaRruy6OYJy8lPj+CYM
         9pFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789071361; x=1789676161;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xp9c7LyaPvV/qIFnSXfT0Qk+bTOQ/yY3E+O4DTcTZiY=;
        b=JKOXVndrhU5LIrVi6Df9Gs9Ymzm3bhneuHDcuJ1FWELYs5dHw/3zpjtF9cTIbiCqXn
         qmLvs/H3CVb1872hmVBOmgxPaK2N1NzlFDMS4ow96itMYNxM2YSU6hF2GgPvQYp3PpC3
         t9I/JNL7Gdz5Ylmofxlqmy7QKfQ6crI0LaDqVLBGzEmLgfno4MLe4CbXH3cq1w2oGoQn
         bO3AZwnYq3n4Bg+96P68rKHXZpNNe/7FJObgI/4247H4v3Woc+Mf/PlS3DCn+8/gLxv/
         vHuc6+932ypqPlSSJ8dwfQ1B9PTkHkLQMm2trmCdgQNacNgvxolRDH2IJ478LHUQ5pEe
         6eOQ==
X-Gm-Message-State: AFuF++mQ/yuLCGPAHtgvb0wWCmyL5YIj2Z2MmGh44RszkrXjoowj/OQe
	bkjkfnFrJUEqL5F4H/KQUPpXZEuUIQ3szgY1RwNgumXi5cJvmdRHlL/JwsIW7A==
X-Gm-Gg: AYBFou39drJIQK0Kgcxml4WuqKBAhnl2KH4FJ2h77QcNpAdsiULZJrBldEBbe5D7uNO
	+awrm4EYjRa8BYgjuU46U1N1lcu2MJfrRySr+w0jcDyJEmxwV8XnYBFAIl9Q1+79yGc9W/UAXWa
	T9x4haOSityGWb8zcVVF/Woh0vE5MzgiRsTVu4+04QwrZOajZRICANFVLgPOqlQQn6SEhDpcR2N
	KIoRk0WIPx76iYEC6bbjNay/JXrP3ejpsyoK8LNXHxLYPzxzyKRBAFIBFfq2S65z+LbPCx5CakH
	t50oW3N1Fvx14T8vsS+xofLjJy0eNGEXkBcxlaXHso3sRwvv5LMXHa5mzKaFnWWZ6gLiQdbx0fg
	SdkrMGUwxQCmnGNk3R+N7I9N4icJT4TDA1z9hShLI4lHPZqbzLppZY6etq8PolvLoNucTYZtLOa
	X285ETOyOxDKG4DD42Y6tcU45dzxLrdTLJ2w1mrllMEh817cs6eJp2n7zZh7B+4G0Zpe97vN9vc
	HZ05DHLX+hocEX7SXRoeEoMPimi6GutP3J5zK1Q4xnTGT86zJqY/xy+/B4LNiKdh7bkc72+lcu1
	QXDRATmcWie8NNToIzkbYhtXd5AMDr4M9j0JKkHGnKYZsgmO
X-Received: by 2002:a05:620a:260f:b0:939:4a44:5f99 with SMTP id af79cd13be357-939ea012e39mr79672685a.10.1789071358621;
        Thu, 10 Sep 2026 13:15:58 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e80f5791sm66868385a.42.2026.09.10.13.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 13:15:58 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Harninder Rai <harninder.rai@freescale.com>,
	Xuelin Shi <xuelin.shi@freescale.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv3] dmaengine: fsl_raid: free resources in probe
Date: Thu, 10 Sep 2026 13:15:56 -0700
Message-ID: <20260910201556.44207-1-rosenp@gmail.com>
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

Also add of_platform_device_destroy() on failure as
of_platform_device_create() increases the reference count and needs
of_platform_device_destroy() on failure. Requires placing the pointer in
the struct for the _remove function.

Fixes: ad80da658bbc ("dmaengine: Driver support for FSL RaidEngine device.")
Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v3: pass chan to irq handler
 v2: split platform_get_data change
 drivers/dma/fsl_raid.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
index befb4bb69d54..b931bcc06ff2 100644
--- a/drivers/dma/fsl_raid.c
+++ b/drivers/dma/fsl_raid.c
@@ -212,11 +212,9 @@ static void fsl_re_dequeue(struct tasklet_struct *t)
 /* Per Job Ring interrupt handler */
 static irqreturn_t fsl_re_isr(int irq, void *data)
 {
-	struct fsl_re_chan *re_chan;
+	struct fsl_re_chan *re_chan = data;
 	u32 irqstate, status;
 
-	re_chan = dev_get_drvdata((struct device *)data);
-
 	irqstate = in_be32(&re_chan->jrregs->jr_interrupt_status);
 	if (!irqstate)
 		return IRQ_NONE;
@@ -653,10 +651,11 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
 	chan_ofdev = of_platform_device_create(np, NULL, dev);
 	if (!chan_ofdev) {
 		dev_err(dev, "Not able to create ofdev for jr %d\n", q);
-		ret = -EINVAL;
-		goto err_free;
+		return -EINVAL;
 	}
 
+	chandev = &chan_ofdev->dev;
+
 	/* read reg property from dts */
 	rc = of_property_read_u32(np, "reg", &ptr);
 	if (rc) {
@@ -677,14 +676,13 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
 
 	snprintf(chan->name, sizeof(chan->name), "re_jr%02d", q);
 
-	chandev = &chan_ofdev->dev;
 	tasklet_setup(&chan->irqtask, fsl_re_dequeue);
 
-	ret = request_irq(chan->irq, fsl_re_isr, 0, chan->name, chandev);
+	ret = request_irq(chan->irq, fsl_re_isr, 0, chan->name, chan);
 	if (ret) {
 		dev_err(dev, "Unable to register interrupt for JR %d\n", q);
 		ret = -EINVAL;
-		goto err_free;
+		goto err_free_tasklet;
 	}
 
 	re_priv->re_jrs[q] = chan;
@@ -704,7 +702,7 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
 	if (!chan->inb_ring_virt_addr) {
 		dev_err(dev, "No dma memory for inb_ring_virt_addr\n");
 		ret = -ENOMEM;
-		goto err_free;
+		goto err_free_irq;
 	}
 
 	chan->oub_ring_virt_addr = dma_pool_alloc(chan->re_dev->hw_desc_pool,
@@ -746,7 +744,12 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
 err_free_1:
 	dma_pool_free(chan->re_dev->hw_desc_pool, chan->inb_ring_virt_addr,
 		      chan->inb_phys_addr);
+err_free_irq:
+	free_irq(chan->irq, chan);
+err_free_tasklet:
+	tasklet_kill(&chan->irqtask);
 err_free:
+	of_platform_device_destroy(chandev, NULL);
 	return ret;
 }
 
@@ -852,6 +855,8 @@ static int fsl_re_probe(struct platform_device *ofdev)
 
 static void fsl_re_remove_chan(struct fsl_re_chan *chan)
 {
+	free_irq(chan->irq, chan);
+
 	tasklet_kill(&chan->irqtask);
 
 	dma_pool_free(chan->re_dev->hw_desc_pool, chan->inb_ring_virt_addr,
@@ -859,6 +864,8 @@ static void fsl_re_remove_chan(struct fsl_re_chan *chan)
 
 	dma_pool_free(chan->re_dev->hw_desc_pool, chan->oub_ring_virt_addr,
 		      chan->oub_phys_addr);
+
+	of_platform_device_destroy(chan->dev, NULL);
 }
 
 static void fsl_re_remove(struct platform_device *ofdev)
-- 
2.55.0

