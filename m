Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F132A2F5A06
	for <dmaengine@vger.kernel.org>; Sun, 23 Aug 2026 04:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787460544; cv=none; b=Jke0JtMIHM+iLx7GG6mpOnj6HdbuZX25IrQb9iUMJeqlrAb9EPHMLLKHIe+H1ed2WN+WK16gB0/urXxXLJpxhiuzzTYQo+8T+5Tc/5yojV5amsHKdv0S/Flj9ghQBx54JY3WBAjF5LHgAjgnxC93EQ4qC+vLg5oBBGYTOZg9jmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787460544; c=relaxed/simple;
	bh=F+0vuiycaJvFPWmw//1urs2k2rOSC8DbaT8Oh+hH1FM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gNOGhwcs0SrXzVpPBYR6TUbHbl1LJ/3wA18U4JrSIJX18cUnmFGdpcDdcF6o3GVhJahitkEU6L1jdrcSeoyzT+CUK6VK62tmOf+I9LismbEZa+Y6jT1tL659JFeFDEgJ6gRWr7Luxv0gfpr810OSy94aOWwPO9t+5THPo5LzHLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hoO6GZfz; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hoO6GZfz"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38101f85591so2758944a91.1
        for <dmaengine@vger.kernel.org>; Sat, 22 Aug 2026 21:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787460542; x=1788065342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/QF2AuM00HE391Q4c/R+W2Bvyni/B/dT5eEtEIhGwlY=;
        b=hoO6GZfzq9DVod38Lap/G3aY5seiEGu/4cjmrKL1J9Ge3lsk6gCvgB0vLr6YlHPFQR
         XJW/SEDdBAcMjYGSuuvz3ZribBLKeVJLd12bL0fpkpAhG9ZTxlQBj01WNAdf096A3636
         Fk3wAwd4SUD4ojk+Dn1XldXe+hm5LVm9rLQ/SPHDq76ikO7BYQMLXasPXD+O0lqo0SXf
         ni23J61PPLEQIaQC7FVnHdtesyk5CmnwrFjmG5IwKTI0+EXjTi0kVXIlcmMcAriDaOGf
         foj4Cyb089qRRqN+He+rSboWVe/sVDyjIP2lLXuwZAiJZHaEEZwRY/BuHh+71AoBu9w/
         x+sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787460542; x=1788065342;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/QF2AuM00HE391Q4c/R+W2Bvyni/B/dT5eEtEIhGwlY=;
        b=BfBv8QEixjl9csCMcOBd4vIfPl6CHhvXgvHG9H6LpPTWC0RQjO4OFuunmW4gp9GcbU
         ByMhpxCWkqaGQlUM3UazplRhyv7GomZ1BnZLDVyU6XRTTwF/hA8OEjO8hi575FU57Hva
         rbROGGP+MgmUcOHPmaWIy0AAcvJKvoqm7RZW8voB16UzRmnTShPDnJTOb/d7hcj0XyHh
         +bRFy+3IaBaPehOay1J5L9qD5nIU5ANx21dpk8ClCAc4e0gMnmu+cnzlKQR6oZWSPGdg
         yl46bkC1xvAXW7N6nAXeFFroUoO1G/wJ3UVTQwSBfTdlr2ojO5wvq5WlTFvwN8tecFn3
         IlPg==
X-Gm-Message-State: AFuF++mbq0lgXKfKx+++V4+LwlBiKisYO7TLNLuWcPYyDPkovTnckjOf
	aTMbC7+IpMUvJQUiW/dLOW6lOPRefVbqFEJgpLFaGKqdjEaXuqrA9YHuhZwvYA==
X-Gm-Gg: AR+sD10xx/iB4xO6LGO6ynxJOeBMMJZzTlzadDDAbi5NE9a+7DrG0UtYRtfVTVkdpFo
	vPlaCCFkjAy1xSp/+V0V08mFTcasmcQACc8sNCMMgIRETdxty9asCzWTBpHfos86wsE1+7HCNMd
	i1Ba1GU9WPIXVqmuhnXju1QgcQMR+QuPr4Gt8vg34lEumsfkuTDCXxaqvrFaq6E1RhSfGeFldB+
	jpiyr5J6ezw6DJlNtE1nMXrJJ6lMnPhJOptanWETL746aVgY74LGX00dkjw6X1Pp3A4NIOd6QrI
	SNLl23prJSkcmXJfKQRPNVX3/q5KjsqPzwENWexAy/B/cIDZlg9A4tGDFLBpNkjSlQHMdO+d1QR
	FJV/ZyXSNYQucF1Wuage63SJt5hv3lJ+hkdtm5ba0aJvQkJ1rmgLydg9xa+k8ANb1b4St/s8+eR
	mmM+NqEMrgitmlEuuZyEv3xIYf/SO2xXzVR8SCJTqXUqvrkRlPQabc2/p7QlxAqVRZFIRstni66
	PX+BBbhu0VapjWKe7wsNaQEV487LUIfDoE/037axra6YJBciU0ICaiKeKkht0Y0ZvjdLO3LXmZu
	dzhXO6JkTh9IuWDC7T7C4J7RjzEL3imFPdgV9w==
X-Received: by 2002:a17:90b:39a3:b0:384:927f:3db9 with SMTP id 98e67ed59e1d1-395c4bdddaemr12910103a91.1.1787460542163;
        Sat, 22 Aug 2026 21:49:02 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e49d8d26sm4824412a91.10.2026.08.22.21.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 21:49:01 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] dmaengine: bestcomm: ioremap early
Date: Sat, 22 Aug 2026 21:49:00 -0700
Message-ID: <20260823044900.11466-1-rosenp@gmail.com>
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
now-unused error-unmap/release paths and simplifies probing.

This also fixes a resource size mismatch between allocating and freeing.
From sashiko:

>  	release_mem_region(res_bcom.start, sizeof(struct mpc52xx_sdma));

This is a pre-existing issue, but does this mismatch in size during release
cause a permanent resource leak?
The memory region is requested earlier in mpc52xx_bcom_probe() using the
device tree node size:
    if (!request_mem_region(res_bcom.start, resource_size(&res_bcom),
                            DRIVER_NAME)) {
However, the error path above attempts to release the region using a fixed
compile-time size: sizeof(struct mpc52xx_sdma). Since __release_region()
strictly verifies the boundaries of the requested resource, if these sizes
differ, the check fails and the I/O memory region is never freed. Driver
unbinding in mpc52xx_bcom_remove() also uses this same fixed size.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
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

