Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F0B2980A8
	for <dmaengine@vger.kernel.org>; Sat, 18 Jul 2026 03:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784345486; cv=none; b=HSZtgPu2yJZQOqwNNjVTaltisAZ0nTqayM4TGGsBRhcFHIWe+asUGKEQmvYtJGAp5jco+zos3RbdY3XyM5EGfaoLBsShnM/nuhab6AmDv8f6NHOJml+MTYiAchUDYHawVzDcO+DPiFh+d+/nvvUnqcAB1hkVxpEfl0ybdBxDqSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784345486; c=relaxed/simple;
	bh=u5uLb1mOWLZlYIpd7LB3ChW/bEop60v+/1Gt3LkAFPM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iQ8YqF18OYLBLFJd4RI4BzIGWWGRm9S5DAKjam2A9WoCIYncvtah73fLbWRi3x5wxxWwoJXUwhCO5ICOImpwhdZVO29c5qn4we6xWSrPORa1qAs4KYg26aVAJJDqehpl81bl9YSYSLDJX/LofU1lwRtPknFwInp+DoBVQd2As9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NUc70PZw; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NUc70PZw"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2caea3f742bso103651945ad.0
        for <dmaengine@vger.kernel.org>; Fri, 17 Jul 2026 20:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784345484; x=1784950284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=K5Dn1vEgsuMV0WdgO8qoRZSdiD+ozNAcDDPOdeBez6s=;
        b=NUc70PZwVDtJV5VCwrp50bsZqxVGXTeTVfqV813CFPtw+jRUTytAqzTuiMxM26jrw1
         dcHR7r3RCKs93Ddi/VBkSYBrDxLeg2JGFtp1Z/1kCTlH1Nt4cMU9vNqv4BdFF5zzSO+A
         CG9APVJGHiyc3Hq2wvvp8SEyjYDRRtMFk5jtV6he1iAxzJ/aRkfqByd6nd4HPxStMKcR
         21Wow3hPftO6Q3FeSTUmOtU0b9XEY9fDDbFcyUIZgjRxvrOK+pFsn9IxmgGJ9CzfEOdE
         /Ry0wYxl09UhSoLFtGg/TsJ/TlR1c0MPGi/vuvmU5RXKWq4mPfd4dlXfkNaMx6W3frdm
         4iog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784345484; x=1784950284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K5Dn1vEgsuMV0WdgO8qoRZSdiD+ozNAcDDPOdeBez6s=;
        b=GkTOPZFuhYKna101+TyoGp12CymHwC/OWph1RPP69gSdA77tGMiTyBE50SJe2Cf3rx
         nRiBLOzk7QsLDG3EjCUunbhXhXYBROs2KSs8J704qo+F6soNRTlsCvi5JmC1uBhhff3M
         0c6cPiVbbOhwuXvvnWewLRTerStbL29rH0MT/nOYSman5pV0O5SQV3wTIPeBPsza08rE
         vKAqICxEYrXh5BN4/O3v7JQ2Ji5rom/GudIaXtTKYGN/npv1UsyiGKt9yUgIcq3jAMSY
         gCVj05Qyb1JJnr08yL0lvRwzvvhrbO1T/dYUK5JxLZqOlNyQhTQAUgUDhkEWYkCLHfbi
         x2lg==
X-Gm-Message-State: AOJu0YxlmpAc11XI+VpQm0MsP8luI/xDat2SnZycy8U/+hpcmPp/43jz
	nfuw1R3QLzjez94JEr9elbA0qWOmfzvePjUDnh+qKKN9Y9HQe/tBFfyZn2RHjQ==
X-Gm-Gg: AfdE7cl84nNFvqOcdpO/+lmVddujaMFAJSnjEJ7BB8K+BuxbL79O4nXO56v5AT6gpcY
	TTM59BgQXpmRsbGrkjQC5vBqeag0q/Thgts8zkHaTtvT8Kp/2hKIULjxoa/wkeF6vfW0qiZlTLr
	KxipK+a9X0oWxPC91O1N/s7zpLXohNR3OaFwZBR2clwQkJAPIUSHRu1isBKevXrZh1U6v2v6N1p
	vqwhSFDrZQqT+fXRpLp1OwPT9v18EtkhXp9388S87rsQBeuL4oOifVx2I/VehUM6llQ1+EaoD1L
	kPLAOoUoP8iQuH8b/lhDBmV16j8rClCVe9KdP1xSxdX5xNcfgHdaBGMaxf1WTVAzESOucTw977m
	7CREAq4+kbz0TwYLUtc8aMsnWI7mZdmaBmsoBBJS78enaMs0Ggs2iwj5QlXSfwP+txlqMS5TW9W
	1CBCBSniUMMFlzNAjIN/1Mumr1b21AoOn/M2kAXFNhpr3hDpXfqNLKmBgUpgtVkoUCPMO6jvpVM
	J8aSGv+/M5FDJjrJ8TZZNoklpJIwWAKIZi10pPdGzxDjxYjmt/HACU=
X-Received: by 2002:a17:902:d491:b0:2ca:bb7e:29a7 with SMTP id d9443c01a7336-2cf34a76fe0mr60486945ad.41.1784345484357;
        Fri, 17 Jul 2026 20:31:24 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf344b16d4sm20876595ad.20.2026.07.17.20.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 20:31:23 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] dmaengine: fsl_raid: replace in_be32/out_be32 with ioread32be/iowrite32be
Date: Fri, 17 Jul 2026 20:31:22 -0700
Message-ID: <20260718033122.2372985-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mechanical conversion of the ppc4xx-specific accessors to the generic
portable helpers.

As a result, enable COMPILE_TEST for extra compile coverage.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/Kconfig    |  2 +-
 drivers/dma/fsl_raid.c | 50 ++++++++++++++++++------------------------
 2 files changed, 22 insertions(+), 30 deletions(-)

diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
index cb92687294c3..dbdb35f6610a 100644
--- a/drivers/dma/Kconfig
+++ b/drivers/dma/Kconfig
@@ -242,7 +242,7 @@ config FSL_QDMA
 
 config FSL_RAID
 	tristate "Freescale RAID engine Support"
-	depends on FSL_SOC && !ASYNC_TX_ENABLE_CHANNEL_SWITCH
+	depends on (FSL_SOC && !ASYNC_TX_ENABLE_CHANNEL_SWITCH) || COMPILE_TEST
 	select DMA_ENGINE
 	select DMA_ENGINE_RAID
 	help
diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
index 2d86f61105e5..e559c636bf55 100644
--- a/drivers/dma/fsl_raid.c
+++ b/drivers/dma/fsl_raid.c
@@ -114,7 +114,7 @@ static void fsl_re_issue_pending(struct dma_chan *chan)
 
 	spin_lock_irqsave(&re_chan->desc_lock, flags);
 	avail = FSL_RE_SLOT_AVAIL(
-		in_be32(&re_chan->jrregs->inbring_slot_avail));
+		ioread32be(&re_chan->jrregs->inbring_slot_avail));
 
 	list_for_each_entry_safe(desc, _desc, &re_chan->submit_q, node) {
 		if (!avail)
@@ -127,7 +127,7 @@ static void fsl_re_issue_pending(struct dma_chan *chan)
 
 		re_chan->inb_count = (re_chan->inb_count + 1) &
 						FSL_RE_RING_SIZE_MASK;
-		out_be32(&re_chan->jrregs->inbring_add_job, FSL_RE_ADD_JOB(1));
+		iowrite32be(FSL_RE_ADD_JOB(1), &re_chan->jrregs->inbring_add_job);
 		avail--;
 	}
 	spin_unlock_irqrestore(&re_chan->desc_lock, flags);
@@ -167,7 +167,7 @@ static void fsl_re_dequeue(struct tasklet_struct *t)
 	fsl_re_cleanup_descs(re_chan);
 
 	spin_lock_irqsave(&re_chan->desc_lock, flags);
-	count =	FSL_RE_SLOT_FULL(in_be32(&re_chan->jrregs->oubring_slot_full));
+	count = FSL_RE_SLOT_FULL(ioread32be(&re_chan->jrregs->oubring_slot_full));
 	while (count--) {
 		found = 0;
 		hwdesc = &re_chan->oub_ring_virt_addr[re_chan->oub_count];
@@ -192,8 +192,7 @@ static void fsl_re_dequeue(struct tasklet_struct *t)
 		oub_count = (re_chan->oub_count + 1) & FSL_RE_RING_SIZE_MASK;
 		re_chan->oub_count = oub_count;
 
-		out_be32(&re_chan->jrregs->oubring_job_rmvd,
-			 FSL_RE_RMVD_JOB(1));
+		iowrite32be(FSL_RE_RMVD_JOB(1), &re_chan->jrregs->oubring_job_rmvd);
 	}
 	spin_unlock_irqrestore(&re_chan->desc_lock, flags);
 }
@@ -206,7 +205,7 @@ static irqreturn_t fsl_re_isr(int irq, void *data)
 
 	re_chan = dev_get_drvdata((struct device *)data);
 
-	irqstate = in_be32(&re_chan->jrregs->jr_interrupt_status);
+	irqstate = ioread32be(&re_chan->jrregs->jr_interrupt_status);
 	if (!irqstate)
 		return IRQ_NONE;
 
@@ -216,13 +215,13 @@ static irqreturn_t fsl_re_isr(int irq, void *data)
 	 * need to do something more than just crashing
 	 */
 	if (irqstate & FSL_RE_ERROR) {
-		status = in_be32(&re_chan->jrregs->jr_status);
+		status = ioread32be(&re_chan->jrregs->jr_status);
 		dev_err(re_chan->dev, "chan error irqstate: %x, status: %x\n",
 			irqstate, status);
 	}
 
 	/* Clear interrupt */
-	out_be32(&re_chan->jrregs->jr_interrupt_status, FSL_RE_CLR_INTR);
+	iowrite32be(FSL_RE_CLR_INTR, &re_chan->jrregs->jr_interrupt_status);
 
 	tasklet_schedule(&re_chan->irqtask);
 
@@ -708,30 +707,23 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
 	}
 
 	/* Program the Inbound/Outbound ring base addresses and size */
-	out_be32(&chan->jrregs->inbring_base_h,
-		 chan->inb_phys_addr & FSL_RE_ADDR_BIT_MASK);
-	out_be32(&chan->jrregs->oubring_base_h,
-		 chan->oub_phys_addr & FSL_RE_ADDR_BIT_MASK);
-	out_be32(&chan->jrregs->inbring_base_l,
-		 chan->inb_phys_addr >> FSL_RE_ADDR_BIT_SHIFT);
-	out_be32(&chan->jrregs->oubring_base_l,
-		 chan->oub_phys_addr >> FSL_RE_ADDR_BIT_SHIFT);
-	out_be32(&chan->jrregs->inbring_size,
-		 FSL_RE_RING_SIZE << FSL_RE_RING_SIZE_SHIFT);
-	out_be32(&chan->jrregs->oubring_size,
-		 FSL_RE_RING_SIZE << FSL_RE_RING_SIZE_SHIFT);
+	iowrite32be(chan->inb_phys_addr & FSL_RE_ADDR_BIT_MASK, &chan->jrregs->inbring_base_h);
+	iowrite32be(chan->oub_phys_addr & FSL_RE_ADDR_BIT_MASK, &chan->jrregs->oubring_base_h);
+	iowrite32be(chan->inb_phys_addr >> FSL_RE_ADDR_BIT_SHIFT, &chan->jrregs->inbring_base_l);
+	iowrite32be(chan->oub_phys_addr >> FSL_RE_ADDR_BIT_SHIFT, &chan->jrregs->oubring_base_l);
+	iowrite32be(FSL_RE_RING_SIZE << FSL_RE_RING_SIZE_SHIFT, &chan->jrregs->inbring_size);
+	iowrite32be(FSL_RE_RING_SIZE << FSL_RE_RING_SIZE_SHIFT, &chan->jrregs->oubring_size);
 
 	/* Read LIODN value from u-boot */
-	status = in_be32(&chan->jrregs->jr_config_1) & FSL_RE_REG_LIODN_MASK;
+	status = ioread32be(&chan->jrregs->jr_config_1) & FSL_RE_REG_LIODN_MASK;
 
 	/* Program the CFG reg */
-	out_be32(&chan->jrregs->jr_config_1,
-		 FSL_RE_CFG1_CBSI | FSL_RE_CFG1_CBS0 | status);
+	iowrite32be(FSL_RE_CFG1_CBSI | FSL_RE_CFG1_CBS0 | status, &chan->jrregs->jr_config_1);
 
 	dev_set_drvdata(chandev, chan);
 
 	/* Enable RE/CHAN */
-	out_be32(&chan->jrregs->jr_command, FSL_RE_ENABLE);
+	iowrite32be(FSL_RE_ENABLE, &chan->jrregs->jr_command);
 
 	return 0;
 
@@ -766,15 +758,15 @@ static int fsl_re_probe(struct platform_device *ofdev)
 	re_priv->base = re_regs;
 
 	/* Program the RE mode */
-	out_be32(&re_regs->global_config, FSL_RE_NON_DPAA_MODE);
+	iowrite32be(FSL_RE_NON_DPAA_MODE, &re_regs->global_config);
 
 	/* Program Galois Field polynomial */
-	out_be32(&re_regs->galois_field_config, FSL_RE_GFM_POLY);
+	iowrite32be(FSL_RE_GFM_POLY, &re_regs->galois_field_config);
 
 	dev_info(dev, "version %x, mode %x, gfp %x\n",
-		 in_be32(&re_regs->re_version_id),
-		 in_be32(&re_regs->global_config),
-		 in_be32(&re_regs->galois_field_config));
+		 ioread32be(&re_regs->re_version_id),
+		 ioread32be(&re_regs->global_config),
+		 ioread32be(&re_regs->galois_field_config));
 
 	dma_dev = &re_priv->dma_dev;
 	dma_dev->dev = dev;
-- 
2.55.0

