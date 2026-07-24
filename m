Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314053C2796
	for <dmaengine@vger.kernel.org>; Fri, 24 Jul 2026 22:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784933846; cv=none; b=seTlurrUATNEqjrS90pGaUvwViFJxSfKfsc7ksXaX5iZv6XHo8uBX4yq/FoiExy/bPdbCOR5Sg2ZZYI1vASrUCoNXqdLclNCSNRrZOOVAfi8QDHH/F5bHfDn3+fC3ulIBx9j1A7TWRmz1LaytMW314h3gC1xYSH6YeueRm2RvKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784933846; c=relaxed/simple;
	bh=TElq1Kki924a5CaW1J7lYnAjY2sRtqH1W1lXcKZ5DuU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d200gPlUdMi2e7+XWhknEauFgrUXPBIq86QoUm/VLBMCdihFGyO2DQU4FGJ2d72UFccIqy3BxICCMuXncY4Rnokkao7DLxKwCK95mxllRX6PSckWZDha/EcmtQe1w8/4MA2Y/PaGRNnH5qrUU9r8uDyxi2v6hj2+jS1V5DzxCJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o8qXsI1f; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o8qXsI1f"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38125cebfdaso1242221a91.1
        for <dmaengine@vger.kernel.org>; Fri, 24 Jul 2026 15:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784933843; x=1785538643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DudDQKCoIhab8frMhgA6W9h7XpPyKDOhbOMYUMP2BNI=;
        b=o8qXsI1fWXVnXRhKbdgWC1utsOEYyYZvSHJ+jB3XWNMepl3LqxDnemku+XWnVCVhgn
         vJ77HeXV/fe7qdOgMj85yuFaQ3kDXBBELzhQ7MwCn+7ZEE6InLCVidFBIqYWhcaFBG9M
         fb7JdntUptBHn2rOFeGYpPiXX/P3w7omusBEkK4DW6otM4P8gYmipQq5N1ZWqctbAo9w
         FNykvmXRmiW7GHB7Vo9mhl3B0tvuSIwXb6JkTS0Oq29VxnhktluFQ0IEYIlFYq7SklAS
         m547CMNmcrCciYOIoGtuFEaiddScIa+qKZaGBM2VCzaaveKFRoy4ITeTSdtgP9Nyu6Dp
         YZwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784933843; x=1785538643;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DudDQKCoIhab8frMhgA6W9h7XpPyKDOhbOMYUMP2BNI=;
        b=Dbz11O6JlPAVZH139rIzfzFeoYk4nKjFdFdxROLTjyNyTYCWmKPVQRQVr7Ok24Tf28
         VrERqR32R7AxA0dXYND42+pD0t1Hvw7gebDbzqQ0kAWRL8JKtQFX1Ov4Xm3qD8jnbgha
         gLX8EHPaukg84lKRe7JtTfEAOfR9Ii5DjYMmYw5OZbSi+QVtrgMxPzpIC8e5lyRY8pTA
         Y1BHZV133rVbrJDhVciQyAFLLwHq8YChTfANSSC+EK9XEa7OA8tav3Kaz7hdjDzLgnsr
         UM04piGmoE4r4E0AMxsprfC2vVywiJVk9b5ZVs0MOTjwSJyziIiysFonovtFIU8gyVRR
         eZ9A==
X-Gm-Message-State: AOJu0YyEAmNveG7q7o3Lnwi4Q/qjsRxwq76r/BBI1mu4Lpr6y8tfT0M3
	ZXGNuKWoMne7zwptFI5dHD24JmyCCRfar8WZmFCNWcuQbkF17cxbs4ciH7USWA==
X-Gm-Gg: AR+sD10XIE2JRNHxQRiylN2g3eO1G7hm/37N3Moh8ic0jsN1byJvJ1pNEoyJtYU+WHZ
	VzXk4xCSytEFbWmpmLtKOQWIFu6F2saO+oe2RoEvR8ey2PfuFobvhdpLrh7IPZlNrzV6timh/J9
	eE8Cxcrlb094xbdXIlRZ/yzLYUgULtUlPhmr2hieivQ5O6s2oFN0Z7h1IWXu6y2NYA97pmmOafQ
	xEqE3wwyxipEiiYiS6JspNh8geg7jYXIvm9RpAUgm6m65KRx7sCR6tt/2LVc2xo3mblnWaoHHuk
	Y8+AHrRuq6GinS9XgRrrHoHRunO/1uUZrzbgNGt/5ubt6hsN++6RXpMcYnC0XoUGJti7eVCSx7R
	0VAjsj3svMUHsFgi62jyT2Ubl24q0/aWfwGO++OjZulRqn6p0wozwmh7Z5LLOnT29JMG6iov65G
	nVqOe4o+iylVBYpByZB9CW7wmwx8h7CXA7yQFHMf4Im7NVN7CwDvqhYP0uGeue6dMOpIUw1UMKO
	SY0Vhyg1vI3XkmIZ29CPPWvthD+N6q9Ok3qzbkWGH9c2MwvrNXPNXcATdrx4LsuQw==
X-Received: by 2002:a17:90b:1f85:b0:387:e0db:3fae with SMTP id 98e67ed59e1d1-38f298bc8e2mr342043a91.39.1784933842946;
        Fri, 24 Jul 2026 15:57:22 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f292d1d75sm119239a91.5.2026.07.24.15.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 15:57:22 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:MICROCHIP AT91 DMA DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] dmaengine: at_hdmac: use more devm in _probe
Date: Fri, 24 Jul 2026 15:57:20 -0700
Message-ID: <20260724225720.43410-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As devm is already used in _probe, complete the conversion so that
everything unwinds in proper order.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: remove list_del
 drivers/dma/at_hdmac.c | 50 ++++++++++--------------------------------
 1 file changed, 11 insertions(+), 39 deletions(-)

diff --git a/drivers/dma/at_hdmac.c b/drivers/dma/at_hdmac.c
index e5b30a57c477..f16cf29ca548 100644
--- a/drivers/dma/at_hdmac.c
+++ b/drivers/dma/at_hdmac.c
@@ -1980,40 +1980,34 @@ static int __init at_dma_probe(struct platform_device *pdev)
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
@@ -2080,10 +2074,10 @@ static int __init at_dma_probe(struct platform_device *pdev)
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
@@ -2092,27 +2086,15 @@ static int __init at_dma_probe(struct platform_device *pdev)
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
@@ -2121,22 +2103,12 @@ static void at_dma_remove(struct platform_device *pdev)
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

