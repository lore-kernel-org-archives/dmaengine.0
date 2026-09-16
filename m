Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A260F3C10AF
	for <dmaengine@vger.kernel.org>; Wed, 16 Sep 2026 22:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789598533; cv=none; b=aFOh9Vp7+ifbI5GF/e9HZWs7Iv7u42dcg6g49kNqD2bpPWRX8ZeQF34e+ld29fnKQ84YdwUYFvfmErsS3J1ISE9N9RmFhfQALL9pBo2q/WPBF32oydrcokqYd0WYXpp7UQV0jEKQrU6cbzEnAGGfDUqjjzF013Z68ioMEg7I72k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789598533; c=relaxed/simple;
	bh=hHZxIDfTTXE3RHk4SVGuQUCFQzj7YuaDChZ/jubhCR8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KxJrw/X84ifKKMkK1XJQfPyR/10n251M9ufodQn9UbM3mkxOZ2r2GDwFm0fo7GBe29wZQC+dHhWWbBJ0aDh1cPtqoL9Slo9P7ViMPT+yNHpA1Tqex+6Om4oFwOYJG+s+lPx+rjI5yi9Rzbdf2IQq74AxwaaL0vPjl6BwxS5Vm8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WB43xwvO; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WB43xwvO"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2d747ee1f9bso1946075ad.3
        for <dmaengine@vger.kernel.org>; Wed, 16 Sep 2026 15:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789598519; x=1790203319; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wqgRj8Zu/oLhBcm8V6wCiIRsYY69FuThlNcNP+a4SnE=;
        b=WB43xwvOFQXKyCtk4CbeeisHyQMEpJ37kTc6qrBserLKkEJ+JSBJVsaECsZXxPHvyz
         f1LKiNm422G6ok3ezdi0SHD2Rfo5IN7RAvc1mm9cOXpJ52qnczDg9AGXLsrwpzebJNU3
         vmgdIOz1gZgZaINwpnmk0ZDDeXvYxollmVWLBPfyfmcBG2EaRMc4+Dwj3gVu40OI0RBS
         7aN+lKAWAaxudruPgicfkuJAqDmE5JQpUQCqoYKdXxoYYhhjkSQww7zVcg76PEqDmZu8
         CI8/vU3LJDRA9vZIWLvlZcDhosja1MTMPs3zIGUuhDwRnHfCXLeSNhZkDAgR849hkRJL
         IQ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789598519; x=1790203319;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wqgRj8Zu/oLhBcm8V6wCiIRsYY69FuThlNcNP+a4SnE=;
        b=SmsSiU8SmIQgeXB71lRYZ+jvt1U6m0rtT3cw7cNG5SOlb9l4rVk6knQ4o1ZpvIpu3q
         X/rWm+Qa5gHvWwP2ZmBqn0UIV1iU2gTlN/68Zfqa6LMaQXH5XzD9RpV2LRqs4hOBl9Fa
         eM0N3ZGrkMGy4KdVs0udFoCORS9NxD6uiO8LHK1X2H7LIq4xyMe0qgyKn+x/UmKlxof6
         N+2s34pRLnsdhkdGKRoOTB7PJh35KMgoKF/qpLee1Kf4uqsMuUgzrH9w1kEbn+hS+BmB
         hgyX1U1AE59ehF4uXEEeeYUVI30teJcaaJdEtAR1EgAvGpNRCr2afsjoCcuwEIcPI7mQ
         gXWw==
X-Gm-Message-State: AFuF++laD6fXWp8xL3S4sbZ0MuQiD6BKDBEK71j6UTDEOGSTSywLn9k+
	Z6BBoRWZiTZKKvmfYwjNkX2EnjRBmc7PTduEPwm7/AP89WkdXOfilWB7lpqzU1ja
X-Gm-Gg: AYBFou3YVkC9yRgtyGTwa31ePYOZMTBxHm0C7uvFdqkChbCwINOzpK3FStsZuFSUjzN
	+0S/KrSWOGNhyxFJJFTs3slUxsyeltmB5eI8CGKwn4aNF+zKSYAqVJh8/dgxxct9B+l7ABl0JkS
	unbTHF9DOy2o71BXGveTFcjFjmpABMWQSPrFmcLzxnTV24Zr634pI0fwh4+qhZu6CLrq1wEt9IS
	wfD29TMyf1m7jxx5wB3KjeQkr4tI2aJlE9Y7MEk/bP+vlJNTxMSRwqfdieF+QgV7yejWj9WI4LY
	Uzy57ENW78ZJvtUkX138J0oWan36N6pp1YBrig2JCY4FWXH4GQyXtnhDv96gkXSkdSBNWdIeEYN
	KMbnH0zMaXp6SDV0a/KIlLjs4rOfR319aKEm34XcGpnmtqgkkmZ/bhURwMwU40LP37H0kBLIm++
	GzLGuE2+0QjzHqVoPooQCHgpSoFr1FmPxYkxWWuHOwfV31GVKOLvnAZPDhHdEEIVha7v4ssiLjc
	p59pnPErY6Ur7N82WEhxrrCReCX1MJxFP1Eft6XU55nX/g+fx63WlB+usYuEgj3BAy+Mnc5OJYN
	+IMMP9nF+34yeFkoLgpJpix/PBzNWUi5xRCbRcUDxZJz2mD4
X-Received: by 2002:a17:90b:560e:b0:39e:3bd2:8998 with SMTP id 98e67ed59e1d1-39e3bd28b84mr1304054a91.22.1789598519204;
        Wed, 16 Sep 2026 15:41:59 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395caccf1sm8260106c88.2.2026.09.16.15.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 15:41:58 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linuxppc-dev@lists.ozlabs.org (open list:FREESCALE SOC DRIVERS),
	linux-arm-kernel@lists.infradead.org (moderated list:FREESCALE SOC DRIVERS)
Subject: [PATCHv2] dmaengine: bestcomm: use platform machinery to get irq
Date: Wed, 16 Sep 2026 15:41:56 -0700
Message-ID: <20260916224156.276511-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

platform_get_irq() avoids having to explicitly map and dispose of an irq
by having the platform_device machinery take care of it.

This requires replacing the device_node with a platform_device in the
bcom_eng struct so that platform_get_irq() can use it.

Conveniently, this also allows getting rid of of_node_get and
of_node_put as the platform_device machinery also handles that.

Replace the open-coded resource lookup, request_mem_region, ioremap and
the manual iounmap/release_mem_region cleanup in probe/remove with the
managed devm_platform_get_and_ioremap_resource() helper. This removes the
now-unused error-unmap/release paths and simplifies the driver.

Adjust the goto labels in bcom_task_alloc to match what is being freed.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: resend.
 drivers/dma/bestcomm/bestcomm.c            | 47 ++++++++--------------
 include/linux/fsl/bestcomm/bestcomm_priv.h |  2 +-
 2 files changed, 18 insertions(+), 31 deletions(-)

diff --git a/drivers/dma/bestcomm/bestcomm.c b/drivers/dma/bestcomm/bestcomm.c
index 241a91936fe8..1006030ff167 100644
--- a/drivers/dma/bestcomm/bestcomm.c
+++ b/drivers/dma/bestcomm/bestcomm.c
@@ -47,6 +47,7 @@ bcom_task_alloc(int bd_count, int bd_size, int priv_size)
 {
 	int i, tasknum = -1;
 	struct bcom_task *tsk;
+	int irq;
 
 	/* Don't try to do anything if bestcomm init failed */
 	if (!bcom_eng)
@@ -67,30 +68,32 @@ bcom_task_alloc(int bd_count, int bd_size, int priv_size)
 	if (tasknum < 0)
 		return NULL;
 
+	irq = platform_get_irq(bcom_eng->pdev, tasknum);
+	if (irq < 0)
+		goto err1;
+
 	/* Allocate our structure */
 	tsk = kzalloc(sizeof(struct bcom_task) + priv_size, GFP_KERNEL);
 	if (!tsk)
-		goto error;
+		goto err1;
 
 	tsk->tasknum = tasknum;
 	if (priv_size)
 		tsk->priv = (void*)tsk + sizeof(struct bcom_task);
 
 	/* Get IRQ of that task */
-	tsk->irq = irq_of_parse_and_map(bcom_eng->ofnode, tsk->tasknum);
-	if (!tsk->irq)
-		goto error;
+	tsk->irq = irq;
 
 	/* Init the BDs, if needed */
 	if (bd_count) {
 		tsk->cookie = kmalloc_array(bd_count, sizeof(void *),
 					    GFP_KERNEL);
 		if (!tsk->cookie)
-			goto error;
+			goto err2;
 
 		tsk->bd = bcom_sram_alloc(bd_count * bd_size, 4, &tsk->bd_pa);
 		if (!tsk->bd)
-			goto error;
+			goto err3;
 		memset_io(tsk->bd, 0x00, bd_count * bd_size);
 
 		tsk->num_bd = bd_count;
@@ -99,17 +102,12 @@ bcom_task_alloc(int bd_count, int bd_size, int priv_size)
 
 	return tsk;
 
-error:
-	if (tsk) {
-		if (tsk->irq)
-			irq_dispose_mapping(tsk->irq);
-		bcom_sram_free(tsk->bd);
-		kfree(tsk->cookie);
-		kfree(tsk);
-	}
-
+err3:
+	kfree(tsk->cookie);
+err2:
+	kfree(tsk);
+err1:
 	bcom_eng->tdt[tasknum].stop = 0;
-
 	return NULL;
 }
 EXPORT_SYMBOL_GPL(bcom_task_alloc);
@@ -125,7 +123,6 @@ bcom_task_free(struct bcom_task *tsk)
 	bcom_eng->tdt[tsk->tasknum].stop  = 0;
 
 	/* Free everything */
-	irq_dispose_mapping(tsk->irq);
 	bcom_sram_free(tsk->bd);
 	kfree(tsk->cookie);
 	kfree(tsk);
@@ -377,16 +374,12 @@ static int mpc52xx_bcom_probe(struct platform_device *op)
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);
 
-	/* Get the bestcomm node */
-	of_node_get(op->dev.of_node);
-
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
@@ -394,7 +387,7 @@ static int mpc52xx_bcom_probe(struct platform_device *op)
 	if (rv) {
 		printk(KERN_ERR DRIVER_NAME ": "
 			"Error in SRAM init\n");
-		goto error_ofput;
+		return rv;
 	}
 
 	/* Get a clean struct */
@@ -405,8 +398,7 @@ static int mpc52xx_bcom_probe(struct platform_device *op)
 	}
 
 	/* Save the node */
-	bcom_eng->ofnode = op->dev.of_node;
-
+	bcom_eng->pdev = op;
 	bcom_eng->regs = regs;
 	bcom_eng->regs_base = res_bcom->start;
 
@@ -426,8 +418,6 @@ static int mpc52xx_bcom_probe(struct platform_device *op)
 	kfree(bcom_eng);
 	bcom_eng = NULL;
 	bcom_sram_cleanup();
-error_ofput:
-	of_node_put(op->dev.of_node);
 
 	printk(KERN_ERR "DMA: MPC52xx BestComm init failed !\n");
 
@@ -443,9 +433,6 @@ static void mpc52xx_bcom_remove(struct platform_device *op)
 	/* Cleanup SRAM */
 	bcom_sram_cleanup();
 
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

