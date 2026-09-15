Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF4340A927
	for <dmaengine@vger.kernel.org>; Tue, 15 Sep 2026 18:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789495960; cv=none; b=Uv7n1A9U4y8rRZrRZ/44G2CYq68oS8UvOoQ/gUdNSM7MaHTExZoH3h/xkVde48Q7N6bY3kJ/GUcFFAq2PSmx2ySvM/GcFm7CUmwDdnhVpSsujBGBodKBYO+oE+FJhQVZELIpuNHa39ETbI5xboBWCqIchlFTbC23GnECNpj55xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789495960; c=relaxed/simple;
	bh=h784MP3GL66ANK9SwpoPDMFk96LfsbUTuZMSPWcnTck=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=npbVZFw1HmHUNLkOtZm4L3yVkWeEcCtuM6UJT7FzuewMXZJFnXqBb/5tOcHSK8Gta2GLaPPoX3y3lzQ1jvSU4E3HGwa9fjymx7djbazaJCOF9voXSJTX8EikTgvi3cjIhO+Uyzk40WJJzTB06q5B9vaBaqINQTbcJaJ4k02lSdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cURIcHye; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cURIcHye"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfe57a3bso683116d6.1
        for <dmaengine@vger.kernel.org>; Tue, 15 Sep 2026 11:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789495958; x=1790100758; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6fvPaWKuH74Rj66uteSOuQL+AbF/NoYDvfe8MEEc324=;
        b=cURIcHyeNK1GRgwEqc50vW+lkGUm9P32lQhAMw6XirfmUJD3K/w7Hf93Pez+NBmx+3
         S7FY9pLPf2A9LzatZPxtkhjL5aQ+r6bOcAqId8tPrGmEI75Ql7C7my4OQ8UEtNvk9CPn
         D3GV446IYqwhpTslYnooAlEG26T9dR9V79MZjAf4xSFwMiLhOvDDAn5jlKjyw/goRLL5
         /NSrygzb5X/8TnpFmwKRCJ9ZTm4ozItXqMWR0sjNYKUiZGgVmZbPfzhxyqAGMbKSXQ1l
         9SezDuaPbIRt8q3oOL5Sauu+7l/7CahwH3WhrR3cRMiFMIVcpR3/CfG41qmlPWDO+/ta
         Rd+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789495958; x=1790100758;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6fvPaWKuH74Rj66uteSOuQL+AbF/NoYDvfe8MEEc324=;
        b=rCKLlz/aesuLe43Tumuz+R5pfI8zXiliem+v0hucE8Ne/n8cDKhU6qH6JV4mrPAwX8
         725a3zD4BAVjL5N1RWEcUcYws9mNYYzDwqIfey6YDnS4E3Qt2bNvRFKsk06CBhamNVs/
         nKyGrXmBilYOO68McybDntvbsecwvGsLYZLs3G1Wh7zd6KMo/4unPfDjU4Jbk0lHiy1F
         IpX8xfhD0ZcV7KILRHWT/PW2mk3MLDneRUTI3diK1w10F26zoPGDUIHJOo1Wx9l7AvRY
         InB4S5+nw3chmMoRMwflSqrW9oJyBbKZn/aajphBLyFL6AqQ4PGIvZZWYZzDhBn+xwas
         p8Dg==
X-Gm-Message-State: AFuF++ldPyGuAV+MwiOg8FCZxu6kqh3jQeW9hmCz6u8En/1NGhIVoSuL
	zcafHM8GMPpEuJamcFz1S8nB3JjaPYPjA71zUPADWxwbdKA4HQBjQtBX42qkEg==
X-Gm-Gg: AYBFou2a0RPDxkP415DnlGT+eFrcO9L1Ml2d4ndhsTN5jkI9A3L6a8MsmI8FWCWZ3ht
	g95sG9dekNyen7gZ6Fj6c+VExtY5FHjiZRWcJ7iVv2yE1bYe0jFjci/quE1jCAtu+b3T33xpT0D
	hAT+zjIVq60CoH9c7aOLMw1IqoxOOQvKRgfnFo6upIjRfbKX0v9Tu3Cy6rsFu5eOhtYVlEOHWzQ
	LbVLlRZ1Dg/cPrwmOhpEANsxLOZFudDK1vbnlQcSqojUDIYpYgjBOQGIvt+VErr1NV+9FfZYa8o
	dVYt7JdIpJW3O7PmMjCnUpPdYkgybLRnVAQ6pyEoOH60GBKcXExzjOI+1K5aPJPKOupPa0yl6cP
	qmfdXEkJ3Vf7r+buL5ox6wCJJBt68MlkLTnkBnvzwXUSLLSoUXzyDgG2FXeqNO2dXidec//2zwx
	edR3PO1kj3XJDBHSZ2GjHFXmq/FeVkG6fUX+rXYNDtHgqGlov1JmZDhLGidibQQReOxl3OxEgOn
	Hkm5k4F/BJd00xpGtYKpzTS/hH+Z0yuxbJUVhcRpVzgvSWC3MmS82z+cnv+ubqUIqsKgPkXDePE
	UpNWZrQ7th89v4qCrXJ2XpWLYwbYwdWX8w7czesXuBDoSZkm
X-Received: by 2002:a05:6214:2128:b0:911:2a79:cf11 with SMTP id 6a1803df08f44-9123a526c78mr33549316d6.22.1789495957590;
        Tue, 15 Sep 2026 11:12:37 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9123bed6f76sm4250996d6.43.2026.09.15.11.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 11:12:37 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linuxppc-dev@lists.ozlabs.org (open list:FREESCALE SOC DRIVERS),
	linux-arm-kernel@lists.infradead.org (moderated list:FREESCALE SOC DRIVERS)
Subject: [PATCH] dmaengine: bestcomm: use platform machinery to get irq
Date: Tue, 15 Sep 2026 11:12:34 -0700
Message-ID: <20260915181234.9839-1-rosenp@gmail.com>
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

