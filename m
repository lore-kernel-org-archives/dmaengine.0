Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1433470105
	for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 19:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784663670; cv=none; b=rQ36BwW/aj1QjM4sVlPx27SAYuUO9NTLivt+piB0U6g9nubhPwws36gh09AfT3FVUz3alUACQp3wKZNdmueWDYL0qIRjNVTVOJkOUHKp4f1WQ1tgOJkaPm4RwkrBELwisgVq7pl8XmThSSJfVF8iFhcm9AqaNyXsR3Rex2Uy4qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784663670; c=relaxed/simple;
	bh=iQRvYkuGeznfIuqjLwJhAMRRK7Gljo9+K5pD37PTcPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TlOvGanHYs0Mf2DvVfSefHeMSAGvFxWeaWXOoL/VN1BQClRvzr+I9Jm82+qFcnQsQNLsB9r572ft4XoXVd8GpPrAkSD7mCyd7Lorjg+ZoMsWRQr/36Wza/Gz8xMzCMNZCca9c0MW3Bdgj9ktmxPuW/M1c8528HJawNLwET7rUFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n6dxF/z2; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n6dxF/z2"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cacb8416a1so83975965ad.1
        for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 12:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784663668; x=1785268468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s3Txra/qgH/KAcr965ibAc9XFuCUYI2T81C6LAHA9wQ=;
        b=n6dxF/z2Sc4rVdkTcmRtFAA8vlRbfQMMN6EW1lKQcKa2s4ZvfEXsJke5KR5wiSr8Wr
         LVO5+wGA7pSZI4eJa08YhtzZ1Y7of/M6639J5t918r5LpEq2A9rkOBZePd5c74s0OQpO
         b46oE8gTR34ifTYB0Gc9Iq4fVoCNe2jLaKvk6lkcbhG/88BtG0H8624HwuFSeBHOUyWG
         r095NN2kB6xvqMVV0zTp4dSctFegvpliFf+MTOFYztx5TguFMXH3X6DIYddnhYSDqbZ2
         SdWCthZ9lMzguFWW/NbvYryK4mDDmhO2Qf2UEs9vj7wALkqbq7UYI4gwt81Vb9ZnAm6g
         YCvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784663668; x=1785268468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s3Txra/qgH/KAcr965ibAc9XFuCUYI2T81C6LAHA9wQ=;
        b=EWJNE1DZkVU3fJGHY7wr20FD+3bcyoAVNrvaE6EcoOjYsALW5M9rI56A/nM2hTA4Bo
         tSkiKp3uUUOrbO9Wts2HOiLmDZC4YSV0L2rJZq4Ko+LZYKNO7vsLWLFUVhhrvzdIHcwa
         xhzC/Bh1wzgx/IxHsvlBG0yWIipkaAT8gx9ahMFQ/8zkzYDc8LXxniKCOFMw/rX5G0+w
         KN3n47TLT4t+p1zCx3ii3damlEnFVos8ydZhU/kNT3wk1GFhx3RW5mOzUO90fXZY1sWE
         O/7sT1q81onGio8vhAbwmSF2WVGUVZh05EYFKXK97J242Zi5GJhscfAQOq7C0C955TkX
         p5sQ==
X-Gm-Message-State: AOJu0Yy3aKoPvrzBhejelQADb0GR7gJp4jWQFEqdYhe5zzbGvNF/FH1Z
	2ikkuRsCuPTuPUIgPjU0lzfQ00tVHhD37hpCtZIc8lyktKZnKmWObcGybw+kGA==
X-Gm-Gg: AR+sD13ins2ygxqJAqBjLnRPxdJqX9/EWXeJTEPm0JxtDhXs/bGuE9/IH7cStQWxJ2k
	oVKXIffFLcOMd6ZrIHjJBYdybwilJwrFPgjZkaHg35usvHk8yfVwkMQFljQfj9xfJinDbvxy8Au
	NxvsmhuhFVgGBqUoWvYFYauaMJjOioNbPY+xcJSNHeUkJp3f2U23JDy+gCASzytl9rum7L3TPrI
	tEt0ALdgwefU9OxLHleL6+aQC4g+EOxKJjs0R34Ae+LKoSRqyVnBQJl+6Ok213e1FMn3aVe30/u
	JD/vbxPjnfdtlgua+0Scf6+z7VTzCsA6gjHtmNa55TN1w6E+JJtgwXby6QrLwDt+oTBLfkyfRg6
	F3zBS9KZl/c2wc3jPpYKQqHRKopc69hsqOwitBW0+yT/bDktX3lQh4LEUl+xVjh+C/9uI+oFceL
	Zxdrh0Af1UqMqlK1B52e+YWv/TIxBHmDJ2UCpMQefZgo+HlWsksFNjrTSGkSnzb1RIzDija5Evi
	q60bZfB6bSV9FPeXVuGVIBy/c0YIun1uyP89BPVLvC13Rr3bXrrL+U=
X-Received: by 2002:a17:903:1aa4:b0:2bf:27b2:4b80 with SMTP id d9443c01a7336-2cf34873e2dmr204348135ad.14.1784663667865;
        Tue, 21 Jul 2026 12:54:27 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc7d8fbsm1664595eec.10.2026.07.21.12.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 12:54:26 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Xuelin Shi <xuelin.shi@freescale.com>,
	Harninder Rai <harninder.rai@freescale.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2 2/2] dmaengine: fsl_raid: free resources in probe
Date: Tue, 21 Jul 2026 12:54:22 -0700
Message-ID: <20260721195422.353794-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260721195422.353794-1-rosenp@gmail.com>
References: <20260721195422.353794-1-rosenp@gmail.com>
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
 drivers/dma/fsl_raid.c | 20 ++++++++++++++------
 drivers/dma/fsl_raid.h |  1 +
 2 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
index 2d54879cd6e1..cabc79e61e85 100644
--- a/drivers/dma/fsl_raid.c
+++ b/drivers/dma/fsl_raid.c
@@ -661,8 +661,7 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
 	chan_ofdev = of_platform_device_create(np, NULL, dev);
 	if (!chan_ofdev) {
 		dev_err(dev, "Not able to create ofdev for jr %d\n", q);
-		ret = -EINVAL;
-		goto err_free;
+		return -EINVAL;
 	}
 
 	/* read reg property from dts */
@@ -688,17 +687,19 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
 	chandev = &chan_ofdev->dev;
 	tasklet_setup(&chan->irqtask, fsl_re_dequeue);
 
+	platform_set_drvdata(chan_ofdev, chan);
 	ret = request_irq(chan->irq, fsl_re_isr, 0, chan->name, chan_ofdev);
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
@@ -712,7 +713,7 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
 	if (!chan->inb_ring_virt_addr) {
 		dev_err(dev, "No dma memory for inb_ring_virt_addr\n");
 		ret = -ENOMEM;
-		goto err_free;
+		goto err_free_irq;
 	}
 
 	chan->oub_ring_virt_addr = dma_pool_alloc(chan->re_dev->hw_desc_pool,
@@ -744,8 +745,6 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
 	out_be32(&chan->jrregs->jr_config_1,
 		 FSL_RE_CFG1_CBSI | FSL_RE_CFG1_CBS0 | status);
 
-	platform_set_drvdata(chan_ofdev, chan);
-
 	/* Enable RE/CHAN */
 	out_be32(&chan->jrregs->jr_command, FSL_RE_ENABLE);
 
@@ -754,7 +753,12 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
 err_free_1:
 	dma_pool_free(chan->re_dev->hw_desc_pool, chan->inb_ring_virt_addr,
 		      chan->inb_phys_addr);
+err_free_irq:
+	free_irq(chan->irq, chan_ofdev);
+err_free_tasklet:
+	tasklet_kill(&chan->irqtask);
 err_free:
+	of_platform_device_destroy(chan_ofdev);
 	return ret;
 }
 
@@ -892,6 +896,8 @@ static int fsl_re_probe(struct platform_device *ofdev)
 
 static void fsl_re_remove_chan(struct fsl_re_chan *chan)
 {
+	free_irq(chan->irq, chan->ofdev);
+
 	tasklet_kill(&chan->irqtask);
 
 	dma_pool_free(chan->re_dev->hw_desc_pool, chan->inb_ring_virt_addr,
@@ -899,6 +905,8 @@ static void fsl_re_remove_chan(struct fsl_re_chan *chan)
 
 	dma_pool_free(chan->re_dev->hw_desc_pool, chan->oub_ring_virt_addr,
 		      chan->oub_phys_addr);
+
+	of_platform_device_destroy(chan->ofdev);
 }
 
 static void fsl_re_remove(struct platform_device *ofdev)
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

