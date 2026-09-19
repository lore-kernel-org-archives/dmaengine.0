Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D4C255F2C
	for <dmaengine@vger.kernel.org>; Sat, 19 Sep 2026 00:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789777177; cv=none; b=UokhpzZyPafWbD/emV0RnnQxsK/NAFNIFNtIBtPP6oiinNyBrkGLX0Ky2sHDphWx0sKbu62RV4jfFgLuYMSv6wz4mqw/1M3C1cP2qXD0CaP6T8csF5zAHOZbyhClevqju84RR+i0weXSUaHqefNFnavmmO4z5EyGe0qnWbavU+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789777177; c=relaxed/simple;
	bh=+jf3SiGVVgPNhWevlqvlngUC3VQElUYBMBqr0YMexYY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jOBKMNDFqCmCRw2eyZgTtLASW8E0ZeWVVMfv0Duyqvo1Q3jzWALcsZwjiK6rvU6sYffZEXTpGiGc/+FbgjMKEdhghxxjlS7vKDoyJ0wfPXUCCD0+4fDGBK7K8kojY6aMGDZyh4uKQyjCc/flhF714TVvSP+rpJQf6hHqVmbEKKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lJzD4O6R; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lJzD4O6R"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-8686f46e4adso1148115b3a.0
        for <dmaengine@vger.kernel.org>; Fri, 18 Sep 2026 17:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789777173; x=1790381973; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MHPfgHpVyaUa15qKDBAtKU0EMneYSzvSUcpDvb8HIw0=;
        b=lJzD4O6RH17XvNDu9mzk6C8TSfJ8Z1CDC3cdZKztkYNzFQ2DV15L1YLJnqm4i5WSCI
         A4mMb6xuVlpCxPyTBOUtsWNo4uVssgeMO7Sh4+NtRgjaXcZD+eJPahTg62CyNaFAKOTW
         sZDrBvdJcdTJJ/4WlFPtQcIJVY7Kr21Hpe0GaEBW5VLlug144aXhtb17/tRiQnKjr575
         m2FCodkMNBs3SbBK7klJ8V9qS0tFUxHmoNz+tSqnWydp21tzR3WwquCStDdFUVCzu+Ur
         0E32CxjDjOlkgjDpPwKC8NqNEaLMokrm3GuRrdCTYA94Sn+KE8Tsq6AYAoaifBFHkQcD
         OUnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789777173; x=1790381973;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MHPfgHpVyaUa15qKDBAtKU0EMneYSzvSUcpDvb8HIw0=;
        b=qgLDkosK+MjPWLCo16g7upbqyZF6rsYuyIN9Lk8N2PU7URMUeov4HOd0AEqsQmFif5
         n00hAhuPOzVDUhAMtkZ9A5Bc8eQR7B1lk6P4Ed5KA5yRp/CX5Ke4AN9rX1nMQGYN6nMc
         ERviH0zSP9tC9kSwsjBM1QAQWc8iMGf+vR5BaqSL3rhZttZqp1Q1/8LQojI7W0bwkODc
         1JCEskjpB+OHzJ6EZQvTeAQ3my2ED3tkomDjPmOOxZg09fn9whmFqyhYLnwFicxFJkIz
         2laNKVzWjdVS2Aaw+hLJqtnFvPWV3IYwbdsbRMUiFxn97rwP0QJfjC8gww4TsJ5TTj+9
         XyqQ==
X-Gm-Message-State: AFuF++lkscak9yR06YjlL4aY0KNqF3DdBMFRLNmUI/16cJI2KJMnfL3G
	TCpU1YsC8zZ2GMLQyj8peXYkE7Mg2w4/pGKl4d4HbETQtwRMCxbokylTDfNwqw==
X-Gm-Gg: AYBFou08/EX6QGjd7l/qjXGv4RK/z84mDVWNb/FRYmD5k09PUeNKewhMA3I/fcWl23U
	jQcRBK9P0+MYkEddhmfZ1jux15ag7XDXbVCXl7xMH1j9GLR4kPbtgbW5/Ay9XCvU7ZV4HLY07pd
	kAPtEk7OjpkTSbrg1QKyNOEzo+NnO/k8oVYEdiS6g8iyk7ATFDXpvm8pR5oowpCxkgZ9ERC63wc
	UGZzU6LNiX7OUHC8mAmHm+OPYngi7nrE6GDUdEvCrrTcg0ZLpH84HpOxVVME7QmV+wIeOKvK7uD
	CPE2yZ7E9c7NrOG9zXl56Ay4vdZlLkY4Csx0alPIXZDMtzEi83gq6DSbyGw/tXQAixNm4j+7WAd
	cJVgumqLxHa9+TfcNRZrhnb020eTME9mG9ZEHG5Kbd5ZTXtmurlqlLPAcKh4OS5Yy0CQ3X1gCUn
	MAJlAOUk97W+N0FWP68Zdzf287p7QN1qKkRFILk+Bnkp43WwIs1lJpPwmwyoFGTyFxRHd3LErJP
	gRCK0uOruS5EgjGf+Ef8YTY3GBPAFRADMJfbfAzD37G2KrexS5hq8rRj2UQ3qjdPGqk8WGdMHmO
	VbWD6ENO8th5THC6bWiXpEFoKY/DBuYmZYuvF6fCCdUnf3XnHkZNXbD5XxM=
X-Received: by 2002:a05:6a00:148f:b0:870:c2db:da2c with SMTP id d2e1a72fcca58-874de2125femr7108980b3a.25.1789777173083;
        Fri, 18 Sep 2026 17:19:33 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a6bec90dsm391673b3a.8.2026.09.18.17.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 17:19:32 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linuxppc-dev@lists.ozlabs.org (open list:FREESCALE SOC DRIVERS),
	linux-arm-kernel@lists.infradead.org (moderated list:FREESCALE SOC DRIVERS)
Subject: [PATCHv4] dmaengine: bestcomm: use platform machinery to get irq
Date: Fri, 18 Sep 2026 17:19:31 -0700
Message-ID: <20260919001931.723402-1-rosenp@gmail.com>
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

Adjust the goto labels in bcom_task_alloc to match what is being freed.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v4: drop whitespace change
 v3: drop stale description
 v2: resend
 drivers/dma/bestcomm/bestcomm.c            | 46 ++++++++--------------
 include/linux/fsl/bestcomm/bestcomm_priv.h |  2 +-
 2 files changed, 18 insertions(+), 30 deletions(-)

diff --git a/drivers/dma/bestcomm/bestcomm.c b/drivers/dma/bestcomm/bestcomm.c
index 241a91936fe8..310792ccd748 100644
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
@@ -99,15 +102,11 @@ bcom_task_alloc(int bd_count, int bd_size, int priv_size)
 
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
 
 	return NULL;
@@ -125,7 +124,6 @@ bcom_task_free(struct bcom_task *tsk)
 	bcom_eng->tdt[tsk->tasknum].stop  = 0;
 
 	/* Free everything */
-	irq_dispose_mapping(tsk->irq);
 	bcom_sram_free(tsk->bd);
 	kfree(tsk->cookie);
 	kfree(tsk);
@@ -377,16 +375,12 @@ static int mpc52xx_bcom_probe(struct platform_device *op)
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
@@ -394,7 +388,7 @@ static int mpc52xx_bcom_probe(struct platform_device *op)
 	if (rv) {
 		printk(KERN_ERR DRIVER_NAME ": "
 			"Error in SRAM init\n");
-		goto error_ofput;
+		return rv;
 	}
 
 	/* Get a clean struct */
@@ -405,8 +399,7 @@ static int mpc52xx_bcom_probe(struct platform_device *op)
 	}
 
 	/* Save the node */
-	bcom_eng->ofnode = op->dev.of_node;
-
+	bcom_eng->pdev = op;
 	bcom_eng->regs = regs;
 	bcom_eng->regs_base = res_bcom->start;
 
@@ -426,8 +419,6 @@ static int mpc52xx_bcom_probe(struct platform_device *op)
 	kfree(bcom_eng);
 	bcom_eng = NULL;
 	bcom_sram_cleanup();
-error_ofput:
-	of_node_put(op->dev.of_node);
 
 	printk(KERN_ERR "DMA: MPC52xx BestComm init failed !\n");
 
@@ -443,9 +434,6 @@ static void mpc52xx_bcom_remove(struct platform_device *op)
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

