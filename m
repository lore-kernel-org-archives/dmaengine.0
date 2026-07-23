Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2220030C37C
	for <dmaengine@vger.kernel.org>; Thu, 23 Jul 2026 05:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784783256; cv=none; b=nKm4TBno1QZm+whddUHwUHNewVO0uOw/811qD1O552zN3xHa3cEe82/BTdp03MAfQ9MRYzLHS7yF6W3kEk670i+irZE4etBB3u6ctDRNBLvMUQeOMaZjPOBdyG69IdiR/Z3Shw6TRgU/NRcG/HgxZ2K6V1UTC/QjChva/J/vq6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784783256; c=relaxed/simple;
	bh=0ct5qBNzZlj1YvmNbMAPQp4oV2Yi3iJWR+0NsTusnd4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IguXetMEiRjSiflZIZ7JJVr24LZeDnHmHykNqSbBONsQ8u1Glvuep6HcfjEbkabjF02mGj/VkRH4LXiKRmsKTgF576kVqQICh9DnVVk8n4TFtz7POhtg62hNtS7+M84HfC8ktTURum4C9Pc7+c+UKqEuUWiQuF4GTX9qgiPTVRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AdUIuI5P; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AdUIuI5P"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cbb8b54fcf8so227540a12.0
        for <dmaengine@vger.kernel.org>; Wed, 22 Jul 2026 22:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784783254; x=1785388054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2mn31q9tQU1OehKqhUUtfCvCnBZjiisREJ8x835WzvQ=;
        b=AdUIuI5PV2hdSDuBfbQnG6/axBFFBu8bF48kU/Hw/quvW30KjS9G+UIc21hqZCq4Hy
         X546+72vtuuPHvjnNdm5EzYGadl0fDluEtPbcKTICoCuqmpXUnB754CMSt/iybQ2+mkt
         LU24FRP2j/+De8K8pRvNolHZgdqRJri4WfkL0eAwhnypnjFb9JKDcqp64td0vZN9Ybke
         a7RfA47zYuBDX+TxCRq44U36c50k7Q0XZtPSB52wQoKwjwLW2GYjMWWmCHxPnpKy376K
         JPCVjbzZraIUydI5eBPnFLXhsxzf/AO6IdIwe+snQbmoDiPL6rqhQ7UAP4YJftHa8E84
         mfeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784783254; x=1785388054;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2mn31q9tQU1OehKqhUUtfCvCnBZjiisREJ8x835WzvQ=;
        b=dx/nj2oKTmnT1xchj6SygLQkv1+B8a0zv9UbnYOEJgOr/nsw9madQk3JWGsvTdsxph
         jLFIARQoc+5Etconxpcalj5JUnt+p8107OaQ60NIrFx/4t7K81v5dZcDSRPJDjhkOAeb
         vk+D4EjKKIlomVSQQ0EGv2mLPTz29XcQpWzIC6D2UwwNcHsvR6IHm8c5rr5iiny7Le+C
         MN0vDgDahHqlxChmVo27/TP+2xpGYAklt/SwlKy4H6F+K2UImG62mGbwRZAlUliGgvfB
         L2AhGv0QEefFnl3Kpuqzs2xxjosAu/FvcH1rWdk3DcreFs04h5nC0fJkLY7IGMtAfx/c
         UNHA==
X-Gm-Message-State: AOJu0YyWJO9YyFsjUiU81U1+wUty18o5/bbvdruV2hc6Imxi3eunOjbq
	SwmwkItw7g+rzTYF8kSK7L+vsjfk0EycB28L3xhhJgJryUY4q3GjxrDf3EhW6A==
X-Gm-Gg: AR+sD135AwQ65JIDwv3vRfPQe1BFM5EaoxDixj64+jUMUP0H9vISWs4ykJySjdqd0zn
	TFvnWo5eyxYxGCJSvQw3AjwO7rjBpaZeqaIT0+761Voi6eVxMld57q72WZ4SM0I1qcF8BC06Fq2
	l0HjqNZKsaJw3dJ8ta+s4CBfUY3/fD5WH0F/dDMLedaUKzuXQ8DtM6hzWiZ/KbBnh97ONSl3+lY
	DALaFXPDk8r90EVtYbmaXuS1r/KXr9nA45Pd1ETjMkvU+pkcSjRN205YiLSKxBs8NH63i1eq5DI
	DiHEtSmrXd2yG21cUV5Zb0TfUkXnAhMh1I28O79PY9afU9HTbmXUXn8NMEAZgST16TtW1Y6WfTB
	5/eDB6OOFO4h83a6pvB+PF0EX5rNg0QRdIwQsxd4SVnV4YEI7WRUKXuHvPKIT0gOK3aHKxQ910H
	gDay6fYeBDwKAmhdG0ApLa0IOS+YBKjc7XE10x9zAz9yR5eKL1UADHJOPWZAWmvnjVqmAUThi8k
	CQUzd2MqgCE5sOc332FYImyQ4ejmwIStHG400zkLD9TPRRR5jHIpN+msJQNmeIXrQ==
X-Received: by 2002:a05:6a21:6f12:b0:3b4:5c70:ca3e with SMTP id adf61e73a8af0-3c44b01327emr1596136637.25.1784783254443;
        Wed, 22 Jul 2026 22:07:34 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f02e454sm2100411a12.0.2026.07.22.22.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 22:07:33 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:MICROCHIP AT91 DMA DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] dmaengine: at_hdmac: use more devm in _probe
Date: Wed, 22 Jul 2026 22:07:32 -0700
Message-ID: <20260723050732.290935-1-rosenp@gmail.com>
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
 drivers/dma/at_hdmac.c | 49 ++++++++++--------------------------------
 1 file changed, 11 insertions(+), 38 deletions(-)

diff --git a/drivers/dma/at_hdmac.c b/drivers/dma/at_hdmac.c
index e5b30a57c477..25d846ed7a7b 100644
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
@@ -2121,13 +2103,6 @@ static void at_dma_remove(struct platform_device *pdev)
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
@@ -2135,8 +2110,6 @@ static void at_dma_remove(struct platform_device *pdev)
 		atc_disable_chan_irq(atdma, chan->chan_id);
 		list_del(&chan->device_node);
 	}
-
-	clk_disable_unprepare(atdma->clk);
 }
 
 static void at_dma_shutdown(struct platform_device *pdev)
-- 
2.55.0

