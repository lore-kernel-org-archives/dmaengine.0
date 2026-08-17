Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED7A18DB1F
	for <dmaengine@vger.kernel.org>; Mon, 17 Aug 2026 00:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786927508; cv=none; b=ThBLiz/cni2lTbkPctyqcpoaaOrg6h9N3i5Mf7H51GAWElzg3DolTX61MXA+76GS/N1Qw5bjmbDn+w7meNo4uStGRmmt/UMgONdNPfJI7Tz/V8h9pCTF/EXSUipMDV1Zefd0j4ISUym8tDMdSOPkuqHmdsU7X8SbGpEjd+aHML0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786927508; c=relaxed/simple;
	bh=6jFhbJJCiNC+3thzAvQqswbkPgvLt+9SerRvpHFhlbM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=npxsTAAlvLB0c5LyLXrtK/G4fKk+M4Gtrh83eWBbfw/6sy0EpmW5a0Lxp896DGYb8OiM6rNqdKxUEtolXqQnt1g0mqvSGoNvlmut/mm1dvD/CjC9oxFZ5IWkWXr4KLhvblTAT/Yl5Ng8qc6/8IJ8Ct9IBYN5pVKLWn6WFXq9NnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VOiaIxHK; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VOiaIxHK"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cbb7926836eso1846065a12.3
        for <dmaengine@vger.kernel.org>; Sun, 16 Aug 2026 17:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786927504; x=1787532304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=virBiSedo0RsjgNtDHeYNu9b5zOw0VcBr57wB4SYviw=;
        b=VOiaIxHKUuwf1fLVgylx9pcJDCZwM4VOLOITJFArTmXRTlqyoVWbmhYXpYDf2OFnbC
         JfalXL78UY/xVT3GZC/mjryQ6WzCYIsmegrHMJsvbSIE3RXB4cedzZ7eYCSGLz4WiYF/
         9e86i4tKgbQs1yel55d990odZsfQDhx4uwzVNAmRGW6OAs4gG9dC6QeGeEvn8QOTmsK8
         PpCAd66+Z7xzkvx40mdQCkexMq51kyShCF2x8l7Gno9e2EUWwqPE9LZenhWSE4EUvSiv
         o+Yi2G498vqDGMDgrotBo/KlFDG3ZJy2JplF+Euqu2hOsRBv97dtAT/SKLcMo4Gxz7Sr
         Tuqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786927504; x=1787532304;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=virBiSedo0RsjgNtDHeYNu9b5zOw0VcBr57wB4SYviw=;
        b=UDLtrZ9BWw1wtQf9LsquLyPX06e6kABz8sRvlzF4vEg3gRNw8rvNHshVs9/sqR87cg
         HVO8NJ6goKPzpYdoQVqkYFUS89qXhWl3NxSdYMipM3SpZWkUAKabJPnpMQWoQV13J3lC
         FF1G0VM1eq+lZxDuS5Nz/KVA7NTt7Pjptwe2R17uerywsayfNlP7ZEBlu1f88xPuE9aw
         ztRzekdPghhaZRotZ0MmUJDGfiIG00fhvggbeKTWfrH7HsMJpBV0ZhB5IMj1UvJyjNpm
         b9PJpDoxoW9NT9sigHBsfl2k8kUDS/YyIy3+A/TaYAhx3bsYkjYHvg6htPDUn62InxAx
         I/dQ==
X-Gm-Message-State: AOJu0YxdsNJuSV/wA6DAb61NtKgvZn0YQR/Q8SV7Z4qD+4Ro/V802OIo
	TIaHZ2EkFYnHm2hP0lR0gpaOyQTC3XSHp4aI3k3aFgeYjPjq8lCpOW9Z5m49eA==
X-Gm-Gg: AR+sD120u0bl7g3y4zdJ7+brGJ43dIAIEKQeoVTlGbTkNw1gQv4u5aTiNh7k9txULyP
	v7ARgcIrWTMgOJ9ZCHD+SQz++wmYJXRi7gIP3nnH/t+nb8hlWxlatI7WPWgwzpWAeVEpPIsZmk9
	/e4uguxZcn5wD8HGBuV2dXAXtb2e9qg4vqr6qkVgVyLe5ciyPHbtVWub6Pcy9XF8sLWa6et0sg/
	1wndkOiNNWfJCtFLyk+t7H6qpW0atWTns04XaJpzsKtYDliKz8Tb+KfsPKw7FO6geGZAbbv1zqC
	0M5dh1+l++o7btSqXk/TAotSjEmNOgUU4/WGCxcTYNaJfyy3VXDMRQSMqiSNfiSgtjEHnSPYrFg
	jJ3ZkrKdR9n+fj7uiTH2YF5mLCVZjxMe7jY69jqPyF32uA1VprSjpnrvFHe6GErO4QhgR/1iKy4
	ZM5/aG50L+XKnRnrafrvWESnP1XZO1bYa1wUH/XlKHKTJY2FG2ZdRrQF9HwGIr2Bghl/gw68T/Z
	bUK/62jc300fZGF6+Gl73wLvXVxoIbkgJryKJIHhjcDOlZ27XBKOV6grzDjeiCWCndGcBBsYkjK
	xlapj08gbI2b0r8XLu34Pd8ObvyuI3mpAnTKkCy2p8Qyca7c
X-Received: by 2002:a05:6a00:179f:b0:842:2419:6bfe with SMTP id d2e1a72fcca58-84fde364c19mr20472853b3a.7.1786927504085;
        Sun, 16 Aug 2026 17:45:04 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8517d01c2e7sm2164077b3a.13.2026.08.16.17.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 17:45:02 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linuxppc-dev@lists.ozlabs.org (open list:FREESCALE SOC DRIVERS),
	linux-arm-kernel@lists.infradead.org (moderated list:FREESCALE SOC DRIVERS)
Subject: [PATCH] dmaengine: bestcomm: ioremap and get irq early
Date: Sun, 16 Aug 2026 17:45:00 -0700
Message-ID: <20260817004500.59251-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Doing so allows handling potential -EPROBE_DEFER before any work gets
done.

Replace the open-coded resource lookup, request_mem_region, ioremap and
the manual iounmap/release_mem_region cleanup in probe/remove with the
managed devm_platform_get_and_ioremap_resource() helper. This removes the
now-unused error-unmap/release paths and simplifies the driver.

Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>

dmaengine: bestcomm: get irq early

platform_get_irq can return -EPROBE_DEFER, which is useful to avoid
doing extra work in such a case

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/bestcomm/bestcomm.c            | 70 ++++++----------------
 include/linux/fsl/bestcomm/bestcomm_priv.h |  2 +-
 2 files changed, 18 insertions(+), 54 deletions(-)

diff --git a/drivers/dma/bestcomm/bestcomm.c b/drivers/dma/bestcomm/bestcomm.c
index 432b43520ddc..55ad7bc34df7 100644
--- a/drivers/dma/bestcomm/bestcomm.c
+++ b/drivers/dma/bestcomm/bestcomm.c
@@ -48,6 +48,7 @@ bcom_task_alloc(int bd_count, int bd_size, int priv_size)
 {
 	int i, tasknum = -1;
 	struct bcom_task *tsk;
+	int irq;
 
 	/* Don't try to do anything if bestcomm init failed */
 	if (!bcom_eng)
@@ -68,6 +69,10 @@ bcom_task_alloc(int bd_count, int bd_size, int priv_size)
 	if (tasknum < 0)
 		return NULL;
 
+	irq = platform_get_irq(bcom_eng->pdev, tasknum);
+	if (irq < 0)
+		return irq;
+
 	/* Allocate our structure */
 	tsk = kzalloc(sizeof(struct bcom_task) + priv_size, GFP_KERNEL);
 	if (!tsk)
@@ -77,10 +82,7 @@ bcom_task_alloc(int bd_count, int bd_size, int priv_size)
 	if (priv_size)
 		tsk->priv = (void*)tsk + sizeof(struct bcom_task);
 
-	/* Get IRQ of that task */
-	tsk->irq = irq_of_parse_and_map(bcom_eng->ofnode, tsk->tasknum);
-	if (!tsk->irq)
-		goto error;
+	tsk->irq = irq;
 
 	/* Init the BDs, if needed */
 	if (bd_count) {
@@ -102,8 +104,6 @@ bcom_task_alloc(int bd_count, int bd_size, int priv_size)
 
 error:
 	if (tsk) {
-		if (tsk->irq)
-			irq_dispose_mapping(tsk->irq);
 		bcom_sram_free(tsk->bd);
 		kfree(tsk->cookie);
 		kfree(tsk);
@@ -126,7 +126,6 @@ bcom_task_free(struct bcom_task *tsk)
 	bcom_eng->tdt[tsk->tasknum].stop  = 0;
 
 	/* Free everything */
-	irq_dispose_mapping(tsk->irq);
 	bcom_sram_free(tsk->bd);
 	kfree(tsk->cookie);
 	kfree(tsk);
@@ -365,23 +364,24 @@ bcom_engine_cleanup(void)
 static int mpc52xx_bcom_probe(struct platform_device *op)
 {
 	struct device_node *ofn_sram;
-	struct resource res_bcom;
+	struct resource *res_bcom;
+	void __iomem *regs;
 
 	int rv;
 
 	/* Inform user we're ok so far */
 	printk(KERN_INFO "DMA: MPC52xx BestComm driver\n");
 
-	/* Get the bestcomm node */
-	of_node_get(op->dev.of_node);
+	regs = devm_platform_get_and_ioremap_resource(op, 0, &res_bcom);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
 
 	/* Prepare SRAM */
 	ofn_sram = of_find_matching_node(NULL, mpc52xx_sram_ids);
 	if (!ofn_sram) {
 		printk(KERN_ERR DRIVER_NAME ": "
 			"No SRAM found in device tree\n");
-		rv = -ENODEV;
-		goto error_ofput;
+		return -ENODEV;
 	}
 	rv = bcom_sram_init(ofn_sram, DRIVER_NAME);
 	of_node_put(ofn_sram);
@@ -389,7 +389,7 @@ static int mpc52xx_bcom_probe(struct platform_device *op)
 	if (rv) {
 		printk(KERN_ERR DRIVER_NAME ": "
 			"Error in SRAM init\n");
-		goto error_ofput;
+		return rv;
 	}
 
 	/* Get a clean struct */
@@ -400,37 +400,14 @@ static int mpc52xx_bcom_probe(struct platform_device *op)
 	}
 
 	/* Save the node */
-	bcom_eng->ofnode = op->dev.of_node;
-
-	/* Get, reserve & map io */
-	if (of_address_to_resource(op->dev.of_node, 0, &res_bcom)) {
-		printk(KERN_ERR DRIVER_NAME ": "
-			"Can't get resource\n");
-		rv = -EINVAL;
-		goto error_sramclean;
-	}
-
-	if (!request_mem_region(res_bcom.start, resource_size(&res_bcom),
-				DRIVER_NAME)) {
-		printk(KERN_ERR DRIVER_NAME ": "
-			"Can't request registers region\n");
-		rv = -EBUSY;
-		goto error_sramclean;
-	}
-
-	bcom_eng->regs_base = res_bcom.start;
-	bcom_eng->regs = ioremap(res_bcom.start, sizeof(struct mpc52xx_sdma));
-	if (!bcom_eng->regs) {
-		printk(KERN_ERR DRIVER_NAME ": "
-			"Can't map registers\n");
-		rv = -ENOMEM;
-		goto error_release;
-	}
+	bcom_eng->pdev = op;
+	bcom_eng->regs = regs;
+	bcom_eng->regs_base = res_bcom->start;
 
 	/* Now, do the real init */
 	rv = bcom_engine_init();
 	if (rv)
-		goto error_unmap;
+		goto error_sramclean;
 
 	/* Done ! */
 	printk(KERN_INFO "DMA: MPC52xx BestComm engine @%08lx ok !\n",
@@ -439,15 +416,9 @@ static int mpc52xx_bcom_probe(struct platform_device *op)
 	return 0;
 
 	/* Error path */
-error_unmap:
-	iounmap(bcom_eng->regs);
-error_release:
-	release_mem_region(res_bcom.start, sizeof(struct mpc52xx_sdma));
 error_sramclean:
 	kfree(bcom_eng);
 	bcom_sram_cleanup();
-error_ofput:
-	of_node_put(op->dev.of_node);
 
 	printk(KERN_ERR "DMA: MPC52xx BestComm init failed !\n");
 
@@ -463,13 +434,6 @@ static void mpc52xx_bcom_remove(struct platform_device *op)
 	/* Cleanup SRAM */
 	bcom_sram_cleanup();
 
-	/* Release regs */
-	iounmap(bcom_eng->regs);
-	release_mem_region(bcom_eng->regs_base, sizeof(struct mpc52xx_sdma));
-
-	/* Release the node */
-	of_node_put(bcom_eng->ofnode);
-
 	/* Release memory */
 	kfree(bcom_eng);
 	bcom_eng = NULL;
diff --git a/include/linux/fsl/bestcomm/bestcomm_priv.h b/include/linux/fsl/bestcomm/bestcomm_priv.h
index 3b52f3ffbdf8..cddde7c74cb5 100644
--- a/include/linux/fsl/bestcomm/bestcomm_priv.h
+++ b/include/linux/fsl/bestcomm/bestcomm_priv.h
@@ -66,7 +66,7 @@ struct bcom_tdt {
  * This holds all info needed globaly to handle the engine
  */
 struct bcom_engine {
-	struct device_node		*ofnode;
+	struct platform_device		*pdev;
 	struct mpc52xx_sdma __iomem     *regs;
 	phys_addr_t                      regs_base;
 
-- 
2.55.0

