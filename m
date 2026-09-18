Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A1333508E
	for <dmaengine@vger.kernel.org>; Fri, 18 Sep 2026 00:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789690733; cv=none; b=B775UCTEmOHs0fVQC+nweNTD9UZ+n+57YsKdlU7oKFQWECXGjyUUSYA3jfBKmNmgcl/1n/Oll9LksWtxQD+IKxpYHI80h9LJkOUEiBifLQqwgZvrVif0sSGUuCVtl+6d3b6CwlzeIjfMlA5UCBHpKXf9RtOfSGvDCMOhFUnIJRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789690733; c=relaxed/simple;
	bh=Y1uP2/lYugyfCN+2I4UkWTh4Usx2avGiTdd9cnbd6Dk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o2LPoZsmPXBSLCc+x5j+jZLVmuMwIX7AWI+kKdA/LLAEiCWnOa8AHBcaQ1vQpagTzbhcN9AVop06TRMCJlcJh6HGnQ2/oARxSdVXRVyZJGg93kvAu51jCaAxc3gXG/On/bCiG0PP9NhDVxkQ7OwGWqLrmcRBTeToZFX25InkG/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S2Kpa/9U; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S2Kpa/9U"
Received: by mail-pz2-f40.google.com with SMTP id 41be03b00d2f7-cc515bef69dso60666a12.2
        for <dmaengine@vger.kernel.org>; Thu, 17 Sep 2026 17:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789690720; x=1790295520; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ze9VNiKl6gpQF1dbQkXgpHisrGJOTGys22qHllYAsvk=;
        b=S2Kpa/9U8Mb6TaXMvb73pFErYSPdcgvTRhWYJJR9Oyinil8e64WnVfZhIkNQHnCozK
         9uFjQzf4DKTXrr3HaR3F8ZTXyqAHqJxRgGhHndm1sNdvW8pcxX3kUY/tDGoeS9CmOJuB
         yK5BHoMxpwcm+S65QcZD2Cu3rKKQlfDmWpvtXsq915MT0/57Wn3giyhPWoQBBy4r7/yz
         ANxxGwrCdXj5TfVhP84qR6N4oPTcWlA2xPd3Q8rOT9cXvgSw5Ey4OVehdWLtlg9z/0li
         yjeKx/vEqXgj1Cj86xOWajdEGMnTbJBAxNes2aoHZEwfqip3To4tPSlxCsXsGpmsj/64
         dZxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789690720; x=1790295520;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ze9VNiKl6gpQF1dbQkXgpHisrGJOTGys22qHllYAsvk=;
        b=gFB/YVXpVwB4HdN5Q0S5wXUk/1pBuarrpMVudIUuzDN4vdy3U8U4UnLjNG1QjU7zcS
         IczYr0JYBZH8xZLwWTmInhBObGHiMQIKeATZvUB9BxdiN/LstX2JMs9tAc2pGZMXkCVn
         JL+YYIMGyLsG3omV3YERvEBQJj6TxuFCHzk7rAUTZ9oeVDIml0PPMi4T4hgDF0yhOU+D
         lDohueUhgnCKP3Wm7riZGBFMkE5NgCWk3mEA9swiHbVcKHmiBm8i8KKZCiL+hj6Wbcuv
         uwiVdQiulGVfBeWIte6nLgKXvt80WI/37u4+JzHZNqX9Kfk+A9lr4zGrPZS0eQK2EYF9
         zu3g==
X-Gm-Message-State: AFuF++lUPUux7WjFhpYFSrzglC1y4ZcdGUo2NylcHwFe4F9rFIqW0sZ/
	A/LWxTNdgcOYDKtPmtUY51yE6PfSfu6ggrqwUDcblqqGgNBDfhKjw4cXbo7M/g==
X-Gm-Gg: AYBFou0zgn41n1fSZ3qsNBYMvsVgoO1jhqzMN5THYeUQz9Mg42EaucdxYN6O5q1eiRS
	hU+BR9lva8KiuZaP1Vxn+S+t4A+XRxyUbCa+vHXvrV5CMavYuK3hbaRq8izk7WJ4kEoydACR698
	LFop6TrWoidqGg5EqILp9awYMlp67wIIrtwZAnL90nqvxmluNI7FrxkvWllIY8UB7LG0mrQ/MtF
	iZZwvgYC6roBMH/YgDt9CVtlEh8ar0/jcbizlHLI7kdFKt0w/Ef0cA31223KiKJEkrXZxCh3cPH
	IfT3We4usy9FVDwwm52Pj5MFR70LFWrYQee4dYzE9hB/XCDakY5iRl/UnUdzDcCXIWMrnfD+DeK
	6dX8OG76coVjdl9FNfW+7JHTy1o8PwumOxueRn+J5R3RukZctq3s3g0QGPoxZw1kot19qUIlhcs
	spQ+XIDeFAGEjcz2LuOUHFVVkNGFaxU3bL666Oh6eD7aTz7i9RtOC75SWT37pbZkbcxVIMNpZy+
	Uy9IKTZfnBbFBr+cA4zMxYQscwC9DcGfXPK2SR8XqJqYDP9H4rAg/BkOFD6/zQhg/bfPXggWRwB
	S4Z0cCZ4LDEW3ZQWblm/nZrEZGEL3uVo2rRf7cG7y4JclTVk
X-Received: by 2002:a17:90b:2886:b0:39e:25c2:b9e0 with SMTP id 98e67ed59e1d1-39e54d564ccmr1600831a91.25.1789690719570;
        Thu, 17 Sep 2026 17:18:39 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e55a0e7e2sm337468a91.4.2026.09.17.17.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 17:18:37 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linuxppc-dev@lists.ozlabs.org (open list:FREESCALE SOC DRIVERS),
	linux-arm-kernel@lists.infradead.org (moderated list:FREESCALE SOC DRIVERS)
Subject: [PATCHv3] dmaengine: bestcomm: use platform machinery to get irq
Date: Thu, 17 Sep 2026 17:18:35 -0700
Message-ID: <20260918001835.154305-1-rosenp@gmail.com>
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
 v3: drop stale description
 v2: resend
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

