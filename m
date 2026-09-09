Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22984F7995
	for <dmaengine@vger.kernel.org>; Wed,  9 Sep 2026 23:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788996388; cv=none; b=qeXti0rcFW4ucg6YnsHEOZ9fW0JnKfR6FKOPgS9h/dYwxEVr8ueJ6jLhLydI+IUFMfPsIbVOKYh26c/5bhlihAt1XetVtgg3g0ih8OYjB4/nDDkeWjXMvdMk10Dixk8jIxxW5mBQ5pmUCDU85ezEAHKTSM5WQXsAlqEFQECPpPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788996388; c=relaxed/simple;
	bh=vHVSTh8M1AwQHCmiA5uM6Py6FU6Hze6PbEnwhbzyPnU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SuYuWim0PftpZEzRLG4dh8BtFd0EWXVjjjxJD+nvFGm9txgLZQDvEKOT+E4ogSwOf4XK3lym0KtAdnuRn4O39vBGh/3MOr9RqXJduY4gQvx9qXHfNCcIYbe9zA4w2WJNUlBX4JMDHH8KXd4MxbcnHib6mMq5ytriEDNetDevdu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=osk/E2pk; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="osk/E2pk"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3990fe066ebso5341949a91.1
        for <dmaengine@vger.kernel.org>; Wed, 09 Sep 2026 16:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788996385; x=1789601185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vEIm42tAeXbJp7ay2ok7KmxnSfwEm1dWuxKNMkog/7I=;
        b=osk/E2pkSbfu75txEfoI14yvSTgDXSEeStQs5NSf7dt9XLrkGWuZ2CRu0Bx/Bt4iqX
         ft5z6SoMmdcmA5EPsHLZhpzLmM2frAKes0VrO1XS5UPx/9Do6uU+zd3xCnC/JAy60EzY
         wMqFMp6ko1quMELdyjF9Rnc6dhuP6sVvMS5uyp+tsii7g/GTPgN/aULQCN+FiIbKL0Wh
         H2r8MPqcAU35LlJDyN6fM0UmDdulzmCFvmPBiYSyF1wyjLdjkjt5rvXKm56FXOqQsQvd
         yGGnRkEGxemZUBHjyOryuqdsklrmKP2dBe7eLsbybhPGolEJKYhATbh/w3lUqP0b5+0l
         bxwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788996385; x=1789601185;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vEIm42tAeXbJp7ay2ok7KmxnSfwEm1dWuxKNMkog/7I=;
        b=VXYMCHp8wsWrnBvRvh5H/eixXUUpOpueD+807VpKQXJj9uRt2r0I87ofHMUNvUQGOj
         PfV3Yqa88TbxYbfXMGYfNMBLOCLdaTdlXZvCarsQjCuV+LRcXVbDFEaL6f12o3knt/Dc
         KHlpntQeHEnogiWqozm/WUFK59PNTCd2y/WpEF0N9jF+ko3TqzgP+u+kLA4c2XKplS8J
         IH9tUb1NHNO57lnH3TjBfv44s1dEc3UKTS55qvG5QK6SK/BmBCt+asgl0K7yht58+PLv
         hEMLWIeMnIC5axCBEgcQ2Cnu5GYE0jlbXbAKv6CBODcPWeTIP2wZjVtduZcW/A3Gnvol
         8nkw==
X-Gm-Message-State: AFuF++lLI5NjRIuyxM2L1XjPb7WLrNPnZEAyEYZKSgG1BIi61MonJwoU
	QpYw9LFmmJ2AL+Cq3hCk3OJF7D3jfhB+RB7rwE/lN09b9lx6883BBaqz9sb5mw==
X-Gm-Gg: AYBFou0WTqvJ4vjI+zymJxlyZMnnsw3ExHnuFjyK9fexlfUBiYaK2ak3CCFbTmf6o3C
	Hx7xcuGWTbaSttEhegK1LAnAoAnrX6Pn8r566IDuW/88Q0MHNIVi0Lhi4sEmtRL67v1e0b5ZPYT
	/R7V4dtFTk6xdFFajoF3p3rWT1vIymqrHRxZIiJaLQBsaLh6DUGtbOmRXrvVw0ti9MUl1QelNIk
	c47rd/8iPhhv+AC4Xecn/OPU9W04AGEPFY7xQS7oZfI9eGwXRzrFYw+8Z7RRp7tUTI0P3tyarEU
	g0L1IkIjO87WmRuWzn9QC8QbDc23k6dBVmzGeJp9nL2QDOPfdWmfrDPPKMJrX3YVzLG1dTK3J7K
	e0IVGNpD4obZEir4jNzlvLUfeDoN8ZmTG1DSxeKL8w78QYhNknB9kuJcwouzFW0AJ5Udd3hr5yy
	pPjEgiDtmErxhl6KSh1XnaWjPrujOGSsucqsGafAyV+TpKEVfMbXKJzgpixMvdtQoAGiu3iV5Xw
	vJ87tSLPJEFBNcTCH+Em+VJZc4E612/kDAQViKtRmnabRX9kBgYfcFRIQjgp8HzyiXVDz007X9f
	3cgIL69IgxwP69lf4DxczASXi6KUCeTmZv+5fB/ObCLj5cbZ
X-Received: by 2002:a17:90a:51e6:b0:39b:4877:ae90 with SMTP id 98e67ed59e1d1-39b4877aeb8mr27572602a91.22.1788996385063;
        Wed, 09 Sep 2026 16:26:25 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e8ad192sm442018a91.14.2026.09.09.16.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 16:26:24 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] dmaengine: bestcomm: use devm_platform_get_and_ioremap_resource() to simplify code
Date: Wed,  9 Sep 2026 16:26:23 -0700
Message-ID: <20260909232623.89321-1-rosenp@gmail.com>
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
 v4: fix subject
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

