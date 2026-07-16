Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EFFB349CF6
	for <dmaengine@vger.kernel.org>; Thu, 16 Jul 2026 20:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784233802; cv=none; b=b3zva3NZPip/2/SQvf0qxzGpxs+KMbXmK4RvMbZ7cHGaVt2WS5IeoeRN3rkwVQCjukK1akTqXdYBOs1TespHJO/MactXq0ZI6qq48PrqhnWCUy2fM6sB9d8ga4K80jmyy66FwoVZh8kjWpAWLD+HeVqhwIjh9i/Bt7i88lq+XFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784233802; c=relaxed/simple;
	bh=wxjMkKsreed/7e27ZFCOcBPSRd1CCOhvpMtbH7hHHS8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fy/F0AdnYthANlmH+U0Xswc1aQjTpa6YtWCPULCB5vfgjVLYpL60G4P40vWjBZV/NqgyyMvKBNsbASUlz0rSWbnikloAxpJL9pIiz9LEaFeJBl/oH5JN0v1m5RSdzU9xVAAztEJhwmL8kqNUrcpXTHTXCeBzBVcBNI9Fe3L4vIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hRBbhsTK; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hRBbhsTK"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8485b358552so7864871b3a.2
        for <dmaengine@vger.kernel.org>; Thu, 16 Jul 2026 13:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784233800; x=1784838600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hp0UXZl7o8CuN52LDd3te+0pDBgn+7llmGMGyUuUZGw=;
        b=hRBbhsTKEdTg36fiC/xe8U63faTFdfBKjjswiqIIw+eKgdgV+21dV9+Awaew03yKuY
         pPM2Dscu1Q55GNH+y/17J0c0xVPXNnt9asJ/0Tcr7+NBuAUYPvrWe2XWOMhzjYP3ZW0y
         RXotSOTn/P+xZFf2q1kchymiGrIZYRcogqapqmrQluc1RDNx8qsRUkBOGxvZzzvdy0/i
         A3ToJfC48I5V57PI2HuOPM4Estl0rv6roaj0lexKj8ZcpZ7Waw95XKWUuBHkpSEyTe1B
         OULvSHtIQ8zUm9gi3NHZszQMU7b5006Jv9Dmzo/qPijH00b5V3osTzBMl4mGvx8Jebbi
         hJKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784233800; x=1784838600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hp0UXZl7o8CuN52LDd3te+0pDBgn+7llmGMGyUuUZGw=;
        b=LxoKN/AucusMDKRiRP22GR/Ha/1izDAx5B20xfUz6d6ScLLIYp3ULeS8522yn9Q/k6
         6U2EkuQVZ+dku3L/1it728fToa4LhlYN5OoMXYmz1PPpshN0YgHVE0Cl5aVn+FGFImvv
         TE+00KTf+/BirNE8Vtyi25vopIM2QemcwCu6c9Mg+D+UaBo4qR2lCSrACOPLipzUzuMm
         NglhnSJP/P2DW9ql05KGOjmJbamfRXRQDezY6ALbrKoOCFDUfR4dRIwlKopnO+iq365O
         leV/zYw2MBwB+SdKJuF0SWx7NZdCbjWSZlaLjjjLIUY+ebT0mL6LnmnNjmg5k3syBezq
         meuA==
X-Gm-Message-State: AOJu0YzNSc64gWk+E+o6mrsr6+GKxaTgh8pzMHPdzZ5ejE3gJC6PcmOg
	lLVhEVv3QzcLymPwezIUP/R9hbTbD+MoTs0IIZ3OxmtM4CH/fMMYpjY9Ks7w/w==
X-Gm-Gg: AfdE7cm1dFZzblz+bSASI+lWnLdhkbMuwMFuZrfC/RPPbeTAzVeF6ow7Pi+030wJ/G7
	Rr03fDAz0Pkrs2IuBmp/t7mIFNQ+1yZt1GVxEma4MgauDaeKyzFUkcH6t8raC0RFr/mhETVEA6E
	YGCyN+S2FJ4KZVp4AIpe9GldcR4RVHWBJCoJnlgdRsYNjxigamK8sgWPMb+eTeT2tSPdyGcLN1S
	2gr9OQcOA5Vnzl8Yv17Xer+zmlCJrEMDatZHYS5VpRqNplhviIt7yAtGAZL4JtM+3UDCuS2r6sl
	9+vAMDfhDdbPxPzrNVSLzM+hBzXQ41WFNxNme9C/FL0a82tLoI9EqZcg/maux4RpLRHNuf0sWqW
	Y8r2uvNIYvVxiNtS2XDbs6wGn0rFNR8hyCzy+bGxe0DfmMZjAen1ZPtFRWNU7lrT+wK5zHCe61n
	34SsZ30ia+OWf4wQqwc66kHsS2a6BRBMCYTh0yaQAr4oPMXi6+PsTts3n8jrIE/KDkqPIlv0Uc6
	RO9hnqmRocR9DzBdDw/5MxlSugljIQGcPagTIexb8+/Jv7xHpADxkc=
X-Received: by 2002:a05:6a00:b87:b0:848:63fb:fd93 with SMTP id d2e1a72fcca58-84a55894cbcmr11883404b3a.50.1784233799713;
        Thu, 16 Jul 2026 13:29:59 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f26f703sm5536776b3a.17.2026.07.16.13.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 13:29:59 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2 3/4] dma: fsl_raid: keep MMIO bases as void __iomem and cast at access
Date: Thu, 16 Jul 2026 13:29:48 -0700
Message-ID: <20260716202949.677290-4-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260716202949.677290-1-rosenp@gmail.com>
References: <20260716202949.677290-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The fsl_re_ctrl and fsl_re_chan_cfg structures describe memory-mapped
RAID Engine registers accessed only via ioread32be()/iowrite32be(), yet
the pointers to them (re_regs in struct fsl_re_drv_private, and jrregs
in struct fsl_re_chan) were not __iomem-qualified, so sparse emitted
"different address spaces" warnings for every register access.

Store both MMIO bases as a plain void __iomem * and derive jrregs with
void __iomem * arithmetic from re_regs, rather than carrying typed
register struct pointers through the driver. Each function that touches
the registers introduces a local typed pointer (struct fsl_re_ctrl
__iomem *ctrl) and uses ->field, which is the idiomatic kernel pattern
 and keeps the registers' __iomem qualification intact.

Reported-by: kernel test robot <lkp@intel.com>
Fixes: https://lore.kernel.org/oe-kbuild-all/202008111749.yy85rFMD%25lkp@intel.com/
Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/fsl_raid.c | 19 ++++++++++---------
 drivers/dma/fsl_raid.h |  4 ++--
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
index 888f55b672a5..524f83faf3da 100644
--- a/drivers/dma/fsl_raid.c
+++ b/drivers/dma/fsl_raid.c
@@ -657,8 +657,7 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
 		goto err_free;
 	}
 
-	chan->jrregs = (struct fsl_re_chan_cfg *)((u8 *)re_priv->re_regs +
-			off + ptr);
+	chan->jrregs = re_priv->base + off + ptr;
 
 	/* read irq property from dts */
 	chan->irq = irq_of_parse_and_map(np, 0);
@@ -746,6 +745,7 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
 /* Probe function for RAID Engine */
 static int fsl_re_probe(struct platform_device *ofdev)
 {
+	struct fsl_re_ctrl __iomem *re_regs;
 	struct fsl_re_drv_private *re_priv;
 	struct device_node *child;
 	u32 off;
@@ -764,20 +764,21 @@ static int fsl_re_probe(struct platform_device *ofdev)
 		return -ENODEV;
 
 	/* IOMAP the entire RAID Engine region */
-	re_priv->re_regs = devm_ioremap(dev, res->start, resource_size(res));
-	if (!re_priv->re_regs)
+	re_regs = devm_ioremap(dev, res->start, resource_size(res));
+	if (!re_regs)
 		return -EBUSY;
+	re_priv->base = re_regs;
 
 	/* Program the RE mode */
-	out_be32(&re_priv->re_regs->global_config, FSL_RE_NON_DPAA_MODE);
+	out_be32(&re_regs->global_config, FSL_RE_NON_DPAA_MODE);
 
 	/* Program Galois Field polynomial */
-	out_be32(&re_priv->re_regs->galois_field_config, FSL_RE_GFM_POLY);
+	out_be32(&re_regs->galois_field_config, FSL_RE_GFM_POLY);
 
 	dev_info(dev, "version %x, mode %x, gfp %x\n",
-		 in_be32(&re_priv->re_regs->re_version_id),
-		 in_be32(&re_priv->re_regs->global_config),
-		 in_be32(&re_priv->re_regs->galois_field_config));
+		 in_be32(&re_regs->re_version_id),
+		 in_be32(&re_regs->global_config),
+		 in_be32(&re_regs->galois_field_config));
 
 	dma_dev = &re_priv->dma_dev;
 	dma_dev->dev = dev;
diff --git a/drivers/dma/fsl_raid.h b/drivers/dma/fsl_raid.h
index 69d743c04973..adbfede330a7 100644
--- a/drivers/dma/fsl_raid.h
+++ b/drivers/dma/fsl_raid.h
@@ -256,7 +256,7 @@ struct fsl_re_hw_desc {
 struct fsl_re_drv_private {
 	u8 total_chans;
 	struct dma_device dma_dev;
-	struct fsl_re_ctrl *re_regs;
+	void __iomem *base;
 	struct fsl_re_chan *re_jrs[FSL_RE_MAX_CHANS];
 	struct dma_pool *cf_desc_pool;
 	struct dma_pool *hw_desc_pool;
@@ -273,7 +273,7 @@ struct fsl_re_chan {
 	struct device *dev;
 	struct fsl_re_drv_private *re_dev;
 	struct dma_chan chan;
-	struct fsl_re_chan_cfg *jrregs;
+	struct fsl_re_chan_cfg __iomem *jrregs;
 	int irq;
 	struct tasklet_struct irqtask;
 	u32 alloc_count;
-- 
2.55.0

