Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E2535F5F7
	for <dmaengine@vger.kernel.org>; Sun, 23 Aug 2026 05:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787461387; cv=none; b=AhL5DrL8J0wAIVra3jjwRIHaRv58dF/9jilLoYtSTbVOuvdygXkZa7agQO14wsxPfW7nLvVETw2BYCBa80C02+93z4ASY0Z2YpJLaP7HEz87p4e7aZjaqvrjtlXBDJnzQ7rYKwHsiDYBuIaiHkTLVGpJPNd4ujicOWQKjGFG8Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787461387; c=relaxed/simple;
	bh=hAD+G8Mo3UdF052YHyiR11j6lNr/zx7gMxKV+5Xp3yE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZWdusUn2462f05vx5sCBMoiy79m0FpTy80vHaCJQTwR+32YPa9gL0EVRzOZZsBXocqoPCMVyM9wJ8QevBTH6D6qaaHFYbmxzi1QYyVPAIAsVzE61TV1zWApAYiODQM6UXed/j2G1QjxbLaulHrbRVNTrveC1GIysxakxm0QyHXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IMTSgjIW; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IMTSgjIW"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cb5b8572b70so2957757a12.2
        for <dmaengine@vger.kernel.org>; Sat, 22 Aug 2026 22:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787461386; x=1788066186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JA5XMiOxCtI6Cv6cvLy2e2rZtS3fpKUachOjJ9i3SoA=;
        b=IMTSgjIWtEC8dUwd50XAiRmDJBfL0+UpPCJJIs5SqEU6IML/CeuJVrg7AhF1LdgcM7
         Ht3TTMGu1SF//pSY0njiS22exCo68uckKn3TZBFYV0NbPJMS2GD66VccTgFigVDIxyO6
         BMxoYTm3NdnmnvugM3AiHGUt8Mg85F77PTfl2PG6W55OpqreASLq6T7M5tZoihoDaLBO
         a0Wzqdlk2XpaZ4D/UraPRtvrC3GB/Zh0HN9zbaRMf2bRoNICVB2wDRA+UX2dvdL/CQld
         LaTsdYauI0Au6mi6lYVWB7Cnirz1G0QpgiuqJ2KklrzunPTNku0Hcf3ZGE3w+dhNcGeN
         mP1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787461386; x=1788066186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JA5XMiOxCtI6Cv6cvLy2e2rZtS3fpKUachOjJ9i3SoA=;
        b=qD8VVAxjMNfXq/WwkQzAmvH9dDGGdG8CXeH0nVxlImLKEbL822+HOVwjk/tIOswJOx
         TdFI5Pgwm1sI7bFoeRk59Nh4KSj0+3w6pBOpoMLKYpexiPyw+kB+QImhqV6hRekHHlsD
         xMdl/gNfsZV0EhpfpEAwNHDfHpAVILLlALQxfEYVvFH1P3h/aij7nJWzgrL/BSzVd/NX
         SAoTtoIGepYI8ynG5UkDAf7JmnhRD3RuIHP2qAPgoYCyuP/9c9YEIGwwBNL8w8591ARI
         vppewbSKbH4cx8nA8fU01D4euKOCMRTfCqheDzwRXocKPsXwPwq2OyW+3QJPID5Hz78Q
         +yfg==
X-Gm-Message-State: AFuF++kgcnBDXyrm5Pu+vzD7absBnyFWEB34SkP7tV49YAhiV70GjMen
	NlXybT143XhS3yyTrH15UXlyVX8P0DUnJeNbhm6/FlpHUxinMpKZjTF6Ud9nhA==
X-Gm-Gg: AR+sD11SSFI2s9yP3WStpuOfrEKUH4hF8UH84XHXlhsIj3Tl6a7IVxeJQSXzlTftJ3k
	pP7py7eVy+VSLjQj9ut9/PuRUYRn2I8aF2tmCKDX4kMrD52lf9zP3QyQN44uczveQMMhrtRtK+b
	rIn0iVPeawCKR9x2xGdXGDDalCJyjBodKu0S/4RK7rHc0sb8WbQwfkPcq5nnimza1FMyQru//OP
	BY+Lbk8gPWZAeeFvJojQmiAaPIgq+suQMq8Q0xABFLPnkjgjtujuEvJpMqKa/hnrlFejObsW+Ff
	65qQUCMpX1Ylq8l/Sgj9DwFHmCdE5x4yFUcG51dBS2ActHbyOavMXxunkPInWY5h6hWnl5Rzc5Z
	BchA1ooMu2xpHQTNp9AwyEXflrCpYNV64adwtfqQ7lVAh4v5nCw8X+SjExeYQvc2gtDAO8FC4Wo
	9VU2MgXbFs1sV+w3allFg265Pl3VIAs6499cMyvVYfdkoEnbsk6/o4rdaibF/U/EgoF0wgKYft9
	UYckWkVhT76TLfCbPR2jv5vgdNsH+igRAKTTOYFjInuVChCw4Sw14RsE13mgayUaDjK5JhCjU9X
	cXWMvI4C3uGAsRK6H/6d64QsXleUTBS9jXmRqQ==
X-Received: by 2002:a05:6a20:7292:b0:3b4:7e2d:a3c2 with SMTP id adf61e73a8af0-3cd301c72f7mr26440958637.18.1787461385654;
        Sat, 22 Aug 2026 22:03:05 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc199daeccbsm134270a12.7.2026.08.22.22.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 22:03:05 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:MICROCHIP AT91 DMA DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv4] dmaengine: at_hdmac: use devm APIs in at_dma_probe()
Date: Sat, 22 Aug 2026 22:03:03 -0700
Message-ID: <20260823050303.17725-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert resource allocation and setup in probe() to use devm-managed APIs.
Simplify the error handling path and remove explicit cleanup code.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 v4: adjust subject and description again
 v3: fix subject and description
 v2: remove list_del
 drivers/dma/at_hdmac.c | 50 ++++++++++--------------------------------
 1 file changed, 11 insertions(+), 39 deletions(-)

diff --git a/drivers/dma/at_hdmac.c b/drivers/dma/at_hdmac.c
index 971f8bc9ec48..49a85ac66e83 100644
--- a/drivers/dma/at_hdmac.c
+++ b/drivers/dma/at_hdmac.c
@@ -1986,40 +1986,34 @@ static int __init at_dma_probe(struct platform_device *pdev)
 	atdma->dma_device.cap_mask = plat_dat->cap_mask;
 	atdma->all_chan_mask = (1 << plat_dat->nr_channels) - 1;
 
-	atdma->clk = devm_clk_get(&pdev->dev, "dma_clk");
+	atdma->clk = devm_clk_get_enabled(&pdev->dev, "dma_clk");
 	if (IS_ERR(atdma->clk))
 		return PTR_ERR(atdma->clk);
 
-	err = clk_prepare_enable(atdma->clk);
-	if (err)
-		return err;
-
 	/* force dma off, just in case */
 	at_dma_off(atdma);
 
-	err = request_irq(irq, at_dma_interrupt, 0, "at_hdmac", atdma);
+	err = devm_request_irq(&pdev->dev, irq, at_dma_interrupt, 0, "at_hdmac", atdma);
 	if (err)
-		goto err_irq;
+		return err;
 
 	platform_set_drvdata(pdev, atdma);
 
 	/* create a pool of consistent memory blocks for hardware descriptors */
-	atdma->lli_pool = dma_pool_create("at_hdmac_lli_pool",
+	atdma->lli_pool = dmam_pool_create("at_hdmac_lli_pool",
 					  &pdev->dev, sizeof(struct at_lli),
 					  4 /* word alignment */, 0);
 	if (!atdma->lli_pool) {
 		dev_err(&pdev->dev, "Unable to allocate DMA LLI descriptor pool\n");
-		err = -ENOMEM;
-		goto err_desc_pool_create;
+		return -ENOMEM;
 	}
 
 	/* create a pool of consistent memory blocks for memset blocks */
-	atdma->memset_pool = dma_pool_create("at_hdmac_memset_pool",
+	atdma->memset_pool = dmam_pool_create("at_hdmac_memset_pool",
 					     &pdev->dev, sizeof(int), 4, 0);
 	if (!atdma->memset_pool) {
 		dev_err(&pdev->dev, "No memory for memset dma pool\n");
-		err = -ENOMEM;
-		goto err_memset_pool_create;
+		return -ENOMEM;
 	}
 
 	/* clear any pending interrupt */
@@ -2086,10 +2080,10 @@ static int __init at_dma_probe(struct platform_device *pdev)
 	  dma_has_cap(DMA_SLAVE, atdma->dma_device.cap_mask)  ? "slave " : "",
 	  plat_dat->nr_channels);
 
-	err = dma_async_device_register(&atdma->dma_device);
+	err = dmaenginem_async_device_register(&atdma->dma_device);
 	if (err) {
 		dev_err(&pdev->dev, "Unable to register: %d.\n", err);
-		goto err_dma_async_device_register;
+		return err;
 	}
 
 	/*
@@ -2098,27 +2092,15 @@ static int __init at_dma_probe(struct platform_device *pdev)
 	 * dma_request_channel().
 	 */
 	if (pdev->dev.of_node) {
-		err = of_dma_controller_register(pdev->dev.of_node,
+		err = devm_of_dma_controller_register(&pdev->dev, pdev->dev.of_node,
 						 at_dma_xlate, atdma);
 		if (err) {
 			dev_err(&pdev->dev, "could not register of_dma_controller\n");
-			goto err_of_dma_controller_register;
+			return err;
 		}
 	}
 
 	return 0;
-
-err_of_dma_controller_register:
-	dma_async_device_unregister(&atdma->dma_device);
-err_dma_async_device_register:
-	dma_pool_destroy(atdma->memset_pool);
-err_memset_pool_create:
-	dma_pool_destroy(atdma->lli_pool);
-err_desc_pool_create:
-	free_irq(platform_get_irq(pdev, 0), atdma);
-err_irq:
-	clk_disable_unprepare(atdma->clk);
-	return err;
 }
 
 static void at_dma_remove(struct platform_device *pdev)
@@ -2127,22 +2109,12 @@ static void at_dma_remove(struct platform_device *pdev)
 	struct dma_chan		*chan, *_chan;
 
 	at_dma_off(atdma);
-	if (pdev->dev.of_node)
-		of_dma_controller_free(pdev->dev.of_node);
-	dma_async_device_unregister(&atdma->dma_device);
-
-	dma_pool_destroy(atdma->memset_pool);
-	dma_pool_destroy(atdma->lli_pool);
-	free_irq(platform_get_irq(pdev, 0), atdma);
 
 	list_for_each_entry_safe(chan, _chan, &atdma->dma_device.channels,
 			device_node) {
 		/* Disable interrupts */
 		atc_disable_chan_irq(atdma, chan->chan_id);
-		list_del(&chan->device_node);
 	}
-
-	clk_disable_unprepare(atdma->clk);
 }
 
 static void at_dma_shutdown(struct platform_device *pdev)
-- 
2.55.0

