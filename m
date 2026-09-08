Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CC5493626
	for <dmaengine@vger.kernel.org>; Tue,  8 Sep 2026 21:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788903053; cv=none; b=q5+bXoJJ0H7aBPXFhVMWeEVu74CJW0CAtJ0JFjaXGdDbABIqBwL74FXI8l3s0+5NECiBCiTh+giB+RyB7zvh97Mdk6fDKQJ3UREPGXeMmx3fcCRRiBtaOtlDN76hCZgcCVpLpxlEA02/w6i2Q2XlqoFVcB7Q8URin9QhFQXA4cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788903053; c=relaxed/simple;
	bh=Tz1uM6P+y7LhaZdM77x7l8/ad4X1MfOM3q3en/0d7XU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jABb5WQpn0aQKtCQ0sU0+p+07GP9E7n69fzGaVhCuMqlONogNof/DSKc0sNvwi6YMNaV9D6lFQyxf52dHP5DBqvNhYImAIBmlUG1r2mD7wcaNTbbUVg/o7yK1AOuSgLzyp5gbzKHhTxbZN8IaP2g7JtZ/etiNlMZCntnlk+vjUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lde1XU2T; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lde1XU2T"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc1bcdb3c4cso3539231a12.2
        for <dmaengine@vger.kernel.org>; Tue, 08 Sep 2026 14:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788903051; x=1789507851; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ELAKfi+YR1hZspWrc4OqfL/ECj7P8UtZIJYMoMray7g=;
        b=Lde1XU2Tb/YmytoqltqM5FF9IBKexQuGcmQBCIVCXegjaLo6qyPwFP5Pp9C/OSQplL
         lYjaqa4MaW5yMvCUzX/olDERhd0Hdgj4neQojrrERqa1P21e8BLq/S1IFe4mnv3MplHc
         X8VNjrVvaJKMKz4jSzWeNNMhxIK5ePrkOVhK7h/HZr5FWQ7Lse9Ga9MRCSRG+QMtfeba
         qBFA65XzEgWWTz9edS0F9UZDQoyhvskiX++fybMjIAA2WZ1CFCk57/29GKGVxzF2xRXa
         TR++1eU8N1/9P2MwO4IJy1lAGDysBhRxwDCwsMCsokGFUbkwsTAGi3sRQ/v14sxcik0D
         PtUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788903051; x=1789507851;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ELAKfi+YR1hZspWrc4OqfL/ECj7P8UtZIJYMoMray7g=;
        b=VyhHsj5Pf4yITzhkWpcUaj/UgvGsPSU4lSCiKLX/osLTZ7l5oBRVHqJf3cRq+3aFTq
         wT5tXq3pupNQq7RrCNXmO5+8I5ClWTNjTe48jfL6wO6fjmPuIXn41X/Q2KjHHeGVkyx8
         QSMlnBKpU8BIo+e2Fv0ND7Dsc2dI/ChaodVY2OtWsyZSOa+49Lvswk/pq9GBX4Vl6RoZ
         PRdTuuRKWglWfT/wG64lATaoO0rd5p+goLGEfKoO+hE4CulcAWbFwvhGSyCep4aXMhvs
         82ATv1YbxRZiyQwJTrGd1Rn5VpPn8Ac1V72nZS7dp9f/8MRSbwaNt+RDI8mI9BTMREx9
         //dQ==
X-Gm-Message-State: AFuF++kVcj7/1lNQ8asUG+3egwBFTmH5FWF2m0tZpHpET1+fHKa3B6F1
	tuXynug2tInxKNUaFkeFriDEnOvez8lvfqvzMgqxykhvx2hQUSL2o68WqZtP4g==
X-Gm-Gg: AYBFou2FXbqazN46IfSewropwlhNRMzxYJBownUw5Wye3Gf5ZVS52P3NgaHx66SZjAY
	3r5vcyHubXebkgtL8DY0Yni6IoiKwBssPapWVEQ+Iz5qkdoVg/fUdaFj50hWz6Au46QTJ7BkF1R
	yu9hxhUC5MKjWRw7GVnPDuWILSgH1YJ3AVqEeBIFJGDkbuqwalq/+gReEo7WOygQZxNruM63kX3
	y/MEYk9Laq6AsW0u0UnMDzeRY4eqlcYGR5liEMibRWlGxVpFFmtskSE0+9kkR+pvAjNzo9kXL4x
	BYUjwnVUZMYNiGjREXDJV80sPNfgDCjQw+1lYk540aCwdo4VK6GEgr0dHmVV2hJ4igzMOVpcmIC
	76P5TgUtycS0g6tO0xYl9Qh6JujdRenawHktCi33iqrU4UQp0fWsl61LvE4T0ZnY481ZlNtmtCz
	2FbWPIY7NXsC6xsYH5Im0r6XieliSsDxTFU99DE8Eck8JDzGIBCIZhKTqQq75xJ1lrw4rBbp5IT
	ng5RLi1phvklYUGNGJ5BZCyjBgp90odnwpghtHb+EvgTev9O3hb4hZRwgVbjGo6ppA5QNzOCkVZ
	B4m2anq7bM9ILRu8p/ZAQkUOWSYZXiKDWqXVIA==
X-Received: by 2002:a17:90b:3804:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-39b25f4397emr47315254a91.0.1788903051414;
        Tue, 08 Sep 2026 14:30:51 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08ca63b3sm34123574a91.11.2026.09.08.14.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 14:30:50 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv3] dmaengine: bestcomm: ioremap early
Date: Tue,  8 Sep 2026 14:30:49 -0700
Message-ID: <20260908213049.592138-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the open-coded resource lookup, request_mem_region, ioremap and
the manual iounmap/release_mem_region cleanup in probe/remove with the
managed devm_platform_get_and_ioremap_resource() helper. This removes the
now-unused error-unmap/release paths and simplifies probing.

Fix a resource size mismatch between allocating and freeing where
request_mem_region() and release_mem_region() hopefully use the same size
but is not guarenteed.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v3: reword again
 v2: remove Sashiko generated description. Reword description.
 drivers/dma/bestcomm/bestcomm.c | 45 ++++++++-------------------------
 1 file changed, 10 insertions(+), 35 deletions(-)

diff --git a/drivers/dma/bestcomm/bestcomm.c b/drivers/dma/bestcomm/bestcomm.c
index 432b43520ddc..44ff4a42376b 100644
--- a/drivers/dma/bestcomm/bestcomm.c
+++ b/drivers/dma/bestcomm/bestcomm.c
@@ -13,7 +13,6 @@
 #include <linux/kernel.h>
 #include <linux/slab.h>
 #include <linux/of.h>
-#include <linux/of_address.h>
 #include <linux/of_irq.h>
 #include <linux/platform_device.h>
 #include <asm/io.h>
@@ -365,13 +364,19 @@ bcom_engine_cleanup(void)
 static int mpc52xx_bcom_probe(struct platform_device *op)
 {
 	struct device_node *ofn_sram;
-	struct resource res_bcom;
+	struct resource *res_bcom;
+	void __iomem *regs;
 
 	int rv;
 
 	/* Inform user we're ok so far */
 	printk(KERN_INFO "DMA: MPC52xx BestComm driver\n");
 
+	/* Get, reserve & map io */
+	regs = devm_platform_get_and_ioremap_resource(op, 0, &res_bcom);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
+
 	/* Get the bestcomm node */
 	of_node_get(op->dev.of_node);
 
@@ -402,35 +407,13 @@ static int mpc52xx_bcom_probe(struct platform_device *op)
 	/* Save the node */
 	bcom_eng->ofnode = op->dev.of_node;
 
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
+	bcom_eng->regs = regs;
+	bcom_eng->regs_base = res_bcom->start;
 
 	/* Now, do the real init */
 	rv = bcom_engine_init();
 	if (rv)
-		goto error_unmap;
+		goto error_sramclean;
 
 	/* Done ! */
 	printk(KERN_INFO "DMA: MPC52xx BestComm engine @%08lx ok !\n",
@@ -439,10 +422,6 @@ static int mpc52xx_bcom_probe(struct platform_device *op)
 	return 0;
 
 	/* Error path */
-error_unmap:
-	iounmap(bcom_eng->regs);
-error_release:
-	release_mem_region(res_bcom.start, sizeof(struct mpc52xx_sdma));
 error_sramclean:
 	kfree(bcom_eng);
 	bcom_sram_cleanup();
@@ -463,10 +442,6 @@ static void mpc52xx_bcom_remove(struct platform_device *op)
 	/* Cleanup SRAM */
 	bcom_sram_cleanup();
 
-	/* Release regs */
-	iounmap(bcom_eng->regs);
-	release_mem_region(bcom_eng->regs_base, sizeof(struct mpc52xx_sdma));
-
 	/* Release the node */
 	of_node_put(bcom_eng->ofnode);
 
-- 
2.55.0

