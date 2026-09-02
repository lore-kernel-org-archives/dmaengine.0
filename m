Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C0F4AD4AE
	for <dmaengine@vger.kernel.org>; Wed,  2 Sep 2026 21:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788385584; cv=none; b=FKXKiTKusdyRJ17Q5vmsntP0oLYygB14ttef5S/2QG0quZ5VWMqPl7SkDl3o4O8U/F2X+ze/jKYkQ+HTY9jkBunCH61lsTpzMt4n4eKL11w3YaHxZuQSPdAT7nY3bQ5aE+k5iyG+MVhRTUqJ4wKZ4lwcUwK6P0nhU7DCmJ6i3Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788385584; c=relaxed/simple;
	bh=5JwzSsfz0aQCzNb5RvVhNxFL9Ur0OR3IWCI47dZbe4U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BJYYLClFSUxNWj/tbPbwlrytZDG23A4pE1hiIgCoKmIAAKBcuJH+Y5y+HEPixSsJLatNmQgAcnxXlMbNpnJswTlpD4vd/f2EPmAOXkSic5A6+r+E32l93edW+uah/WeIbnIFKZbur/OqanqsV/5SCWTToSNlLZhF/q2O2xTNyg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KwmbJp+I; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KwmbJp+I"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cc891373e0so16821945ad.2
        for <dmaengine@vger.kernel.org>; Wed, 02 Sep 2026 14:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788385574; x=1788990374; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n7K3SDtPyUG4Mgptm2ekLrg2N2MmRQSuElIMP3BqTu0=;
        b=KwmbJp+IX76yHoV8z38i+7ItXdZONlyEPeVdaZ1SIF1bxuehNgOub3+4fR/Xamk+lL
         sZyALfCNheStCfA56LV04rg535WXYNI8YBgIkZST/Sp02AZOylS+AWI7KM5va2V526Pe
         vN9IX0CJ+qGmVlvIbaskthWmfZnONga3tziQ2hiXH9GuKD53cOQnBR1y/BhaB/oTVwq2
         C3EAcpjiL/CB8K5iBfLr+w++bP/z1yTBJlt8NsPK0hzpWpDeaYHXOo+7mYOjiWCq6M8r
         HJq3/9FzrSqa9fVDNF8B4tfXH44r0hZ3ttCzTM5kYfR3utKIPuTGUFl2ghXW95tdEsA4
         Bkww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788385574; x=1788990374;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n7K3SDtPyUG4Mgptm2ekLrg2N2MmRQSuElIMP3BqTu0=;
        b=aMegI2sl2RybVrjgwU/LXEJpaNDI/gIS9Cer84ElCJ51t1LpKmU6bIZj7o4zpmBhE4
         YTYA7y2U+jEfKAi8QlNQwvrpqMgtah+y9Zf6QHiNZoPz15GjFLNgfU9UEHgJHN+DQWCw
         yLVJFEJSXW2LAjywI8o9S6V6u4fJqHSAvIzXvM6NAHRbUR6+eLxp9s6n7GoW/Srb+vow
         tiArorIheykJFdUzVjqd8p1BZsKGzoHILr/FsC2ZVaPwMoHfgKUU5ySgCwyiOv2cr0e4
         zoGqm4TIMQSA2JZ0PlTCRcQ9YxjFSFgejf1WMQZwGn9AZsszYw8mDVawebZyo01YzBeT
         94zg==
X-Gm-Message-State: AFuF++mI20AknFw5DL213Z00SrFBBYEWIZ0pzz6Fja1dMi2aULjPfNM1
	y+IhEPIx1l+QOh0PiGlwyAcfJvZszhP8PyTdDRXG1NJRpVba8fPpwjj0yqYvCA==
X-Gm-Gg: AYBFou2DXkdboaCHRaU151lDEX3agGwJ5m+hLQa5FAkCwvyMx+HApGUGcLklq3rwv8n
	Di2/W7KQmTXQ4ms2+Q+SP7iMf2+iDc33RS2j1oxrH83PfDlUcHxSWtrT96f/udq4aut/AXznve7
	JQSu3d6lNsB2e/B91zmqsn6uwvf7ndXJTMe6D3ix/PlesGtHRUqBIRkZXsaVczaDzSAu9uU/Agy
	mZyQNZ1nmErfW8ATFevBhB+9LqtnRYx6aCgZwPfl7Bp10T1mBKnF+7/XyV8OFZy+2fViO3ETCHp
	OebPcaeeIe5zGO/aiZPmHWaRV8YRXz7gUD0gCw6JzUmmwVBDalp0mdnfkrFyRBte5EyVJOW6DMe
	jhCmLaxvg/ACO0cjoWyEaEVCAX2h2cFWwkqilP/ghW+P1GU3xGNTNnhitP/oq6gYQdml/zmuMr9
	fISpITyKwiROYNvPDM//Ewj45nvaOTgwZ2FGVncaCPGYcVyuhUKY61Tdl/z+OvWVsHHA06MxZZO
	wugBSuxn2dgdfe11KxG9pxIC8wXBoI7miiEWOmG7C1VhGPpOCr6J0GlqCXM2Hg65IO+qtyS1VA8
	tINLdVQFQDQPgvFElq0gE8scl9eJuLQoluVTOw==
X-Received: by 2002:a17:903:1a2e:b0:2d9:438e:b70d with SMTP id d9443c01a7336-2daec5f3489mr109411475ad.1.1788385574314;
        Wed, 02 Sep 2026 14:46:14 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dafec3becesm919285ad.58.2026.09.02.14.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 14:46:13 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] dmaengine: bestcomm: ioremap early
Date: Wed,  2 Sep 2026 14:46:12 -0700
Message-ID: <20260902214612.311207-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ioremap early as devm_platform_get_and_ioremap_resource() only needs a
platform_device pointer. Also avoid doing work before alllocating the main
 struct.

Replace the open-coded resource lookup, request_mem_region, ioremap and
the manual iounmap/release_mem_region cleanup in probe/remove with the
managed devm_platform_get_and_ioremap_resource() helper. This removes the
now-unused error-unmap/release paths and simplifies probing.

This also fixes a resource size mismatch between allocating and freeing
where request_mem_region() and release_mem_region() hopefully use the
same size but is not guarenteed.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
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

