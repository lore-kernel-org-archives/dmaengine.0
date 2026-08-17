Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ADEA470453
	for <dmaengine@vger.kernel.org>; Mon, 17 Aug 2026 20:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786997525; cv=none; b=DbuNBzZsXQCqF5EQ7YMwWjed1kcmbXxqkSJG0+J+caqiUvcfqPZg/ikfFo4MxroldlMoDeG9VZr6EW93b9emJFw7WB3KaP6jjTHs5po68lTlcDw0WVPMxVQ3tVJ1kMqxDocTXEHxfnm2wGljfLtMMHyv5vqXc4chjjG905jgcLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786997525; c=relaxed/simple;
	bh=5aHoeHnspGbVCEH0kRDUdJBZzPUztTHeiM1Ps6QIBKk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uRkXPlBVLGlRBL6Bg2JerbB6hK+FFGbx+zGfBujPX/2icSg+sWIXFdoqstjnDmCqYbTtIuE/wdwOkRLmOtycZd7sANlCKrJP0qJxAa0CsEnlTjiQAEZkplzBFs8ID7S/aPrFNNND7ueQZyDUufm9Ifnh2Jx1SWTamWW3hhGxAlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r9elgaQj; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r9elgaQj"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so3049611a91.2
        for <dmaengine@vger.kernel.org>; Mon, 17 Aug 2026 13:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786997523; x=1787602323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RXw3GvcQ0suhRqm3C8ZSkikl01zp6z0tF3rJPTXGM90=;
        b=r9elgaQjSrqKSde4V8TQbsXh7WGbx2b3mObRTrmQpN6ZqXndFhVT+BFMbk+v939mMj
         YYL5QzKsbFwz8iNLpT0hq+4OUtSuGoTNROCNNu6X+rRM8BWjKGViGNTi7KPO99lTqoFP
         wqi6h4DHHWvtvzPyecK7OGEwkUVBtGH6mWX5066nsCJnUljl0Ud1FK6fxI25WelNXbvy
         EHLEl55qDIR4Zw4Eqyi61glbTNQjbl8/Wj/P4G6I14AnomSCMY7goRCgIzlFYl1w2aMT
         P12XP/k0uCH8lLqP3mOFuY/u8Pm5WI7eOVhhn3ut9v+oztIbAuQKAbmTRej53vWWWx6q
         73Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786997523; x=1787602323;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RXw3GvcQ0suhRqm3C8ZSkikl01zp6z0tF3rJPTXGM90=;
        b=UCYpDNFF/6PcQPsZM1U3Rn1eOphfdYVZJZg5mqcOOh5LK77ycZ8xOcEhyFu4ZisBzD
         TbB+zCNCEB2g59DBOSuZQ6WqIgPgYVLXlvE9RRv18AGG16O2BNTRTw1tdWTsnpXWV9qF
         Bx9xhdSrWrFyj+CYG0u1xTF/Qao6Af+D6m2M/bIHvS58wh0rKjAG3akQb7EZJ1xe9I27
         zGxHrR+dKzUbOKaGEZB1aVFAsy4wDdHBRUutW9c3y+Mm4LD7zF0/DAY5AvI/2HLXo/5Y
         KS6tTAzhCtUakFhQMj894ObDRVXP2hr/eIF/xTiUtmm3ExH7a1shtaseNVgypw7n2fjJ
         Hl6g==
X-Gm-Message-State: AOJu0YwrEvEmllkqjr5EGEndVWuio0FWWlMB091b1ZuuAUXTP7DCWvI6
	gTKPbeW/zxTSnGbrmONXj8QEDhqsBY8KqbVnUmBoWk+S7ddGF5COIJxloCqxmg==
X-Gm-Gg: AR+sD13nnuNcRrWmR8krFLQaoSkKCG9WOKITJTHM3SmPpzL86uszm5HF/lsu8gBDhPs
	ZmJDalW3kI+EJm71Q7TDkqjXvGjYacBlgF6Z8znVHYfJ/wnWd39H6XEqWjoWUXfblerKJBs2kSR
	aEuqkV+IK/ErOcOpohuyQd7rW3H0btFiKODwXIzq+UIVOlrlFPu1GazkPGa+9rTBapg8jxDxKsH
	MH8OYJSebEpLkHBgMUpTuyzU9JXbBdrDQ9IRfvDNYMK6VCG2iiebRds1CkBD6L4lxmjZT09T6/h
	A71C4M/2w3R+Xi5xdMa6O7ncsSJzC/m9W6eJJNXJqWULEU+f0Vj4jr9UkrSpEbFwoWc10ev7y/z
	R6D0rTDMSyH1ed/1zFaCBG5528od94+jlYVAE5tZBU/3F+n0HNGXxkGE8zxDFIC4nKbEseSSVTe
	Y2f0kshDiPtQVtb5LJ7awnD73b9Fd5qtx1Lg6YCCEm2TcRrju9u0No9TUiT+nhE1d6juFgBcJSk
	EnGahVzI6T6T2mEL1VZviuWmjI9LShqd9/E2NzSlntL3d9dLof5ggSWjAMnfY5J25u+rw4g2/ZQ
	pZDdGoLAW5FNioNstNhggtc5ombo0EVuhbqo/Q==
X-Received: by 2002:a17:90b:5606:b0:381:25ce:bcc2 with SMTP id 98e67ed59e1d1-3933b78b698mr28362534a91.6.1786997522783;
        Mon, 17 Aug 2026 13:12:02 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39531e84244sm6315796a91.6.2026.08.17.13.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 13:12:01 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:MICROCHIP AT91 DMA DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv3] dmaengine: at_hdmac: use devm APIs in probe()
Date: Mon, 17 Aug 2026 13:12:00 -0700
Message-ID: <20260817201200.10952-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert resource allocation and setup in probe() to use devm-managed APIs.
Simplify the error handling path and removes explicit cleanup code.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
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

