Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73ECB3E3151
	for <dmaengine@vger.kernel.org>; Wed,  3 Jun 2026 03:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780456104; cv=none; b=I31nHSlXj6lJ6qqqoy8Cr+FMCDYI3WDzKhD6qTYc+oJgeN9fFVv2c6mNWvjZZN80gmXNWAlIdhg6a6+iEcQc7K6gIa8Ne6Y7rL65vqyEqDP3djBgX1l8/1l/W2KMAtdhkHhPt4/W/+xX1MqspC/0rDbsqkcWkQgzHCs+t0tfxxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780456104; c=relaxed/simple;
	bh=O9qpMQO4gyEQEH9XMabcCwD7cgwVapAp8DL4oHFYuDU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CstaV/MOzrVHfk1Ot5Wxdd4DUOYLXanHpRND73nErJKOho1i5Jv7kRVhjVfKqcOA9/dqFG0LeKbW2cxA6zYzySdukyduKQfvU2OPGyuxKla1DSAjOBUmCmnoBDrfjjy6jmJS78x1iPV4Ig2Wl0WnaJ222aXxEEbRQSQXX778bJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QYxgE5xU; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QYxgE5xU"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-36da151a152so2200230a91.1
        for <dmaengine@vger.kernel.org>; Tue, 02 Jun 2026 20:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780456102; x=1781060902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LZKzG1cjjYqCrg5ftXH0wOdwx3jBheILV4yoP9XwymI=;
        b=QYxgE5xUl5mcE9jXDuNnMYL4wZ3rXTFkuo4GRdwcOQvqT9HTIZMMXQ06k4D/6MZRPX
         Xz/+2hax99ZxH9LW4HeVc7Wb7kB699RcaYyfuHFch/dchz9iPG2c1TXOaZi5hx1WNCYg
         PuMvtdWRvDYtgVkMWAxkPengl73UHBqm9gt7rzMjJ6XTfeHPjRpth2JHDd9S8WmnzoqX
         CQ26Q6PDKRdNIT2KGJhFzm9yJD/YGrQkanKvAQGcDbbFAx1d/FmXlKfkPq8VcrfyKjRa
         NO4snquXlmL6zYdRvXWzTuy/a2GAMrS00xJ7v5LGCvpn73tEl4Slffc9+uK20KLnVL+i
         sZjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780456102; x=1781060902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LZKzG1cjjYqCrg5ftXH0wOdwx3jBheILV4yoP9XwymI=;
        b=L5ZfjdeKCeafyYtcRa4D71mWrMbHnYvuXZAQW+gDMuf3VbjH+bLM6SGpoW/hL5IN8M
         bQTS4dMCnUu1vkS1lE+uoMnfrUhXpKOge+9hp7sNaJWFYezeJ48gqSRhT/gt7uFiWIga
         DC8N83lniaAAAsVMe8WvKnxghaAUcP5ypuYJXnupSAOZpEhs8UU44AfH5t/x0GVLyBNg
         LAorXOZshYV6xy2yZ51CcFCPjuVKw/w7ZwftAB8Q6DiAybUO4pTscxJLadWa1WN32zn8
         XJ9A4dYFwKf/jNaNrzVFb+oe4avjxVjiMc82W2D4AX96BlnfzQOXbetCiacYC6ztA6gL
         5GQg==
X-Gm-Message-State: AOJu0YyOb1nxYJfDk8nbFZ6UgoqRHhq22prSi3c/l5SC8I2xlkhVdHL7
	sCnMUarys/B5tj6+xAizMm2jozTEctJPxLPXn8/1ruosILRAwwuQWQgxAIYfGqBb
X-Gm-Gg: Acq92OEYDTtrhmDloVHgwP4B5Q0v03XXuvHkzfxO9QSnvJwX0LGT2l3M9Kkr+5GEfvV
	n8k042ESndTbQZSLNgHwXiNgR+ynrmGAs51LRHsAVM1iiRbKiwSyr0DeIBNwfVwfUAhyXO8Csfn
	ofINhDHUjBCYIPY2722uRkMrk/BdOr4vQk7tiNhV0gC0jwAF+1E66/t28dmtKk05GrdP8DB1Itb
	yWw2cJNam+wMRNOWQJKcKr1NlvZvSZQOLbOplE4riuGBlEx1yW37moRtV5t2eMohemGmvzKp0tC
	8ZvYL1+VYETj+OLwWPzSXI9d59ODNxfDxzdirftJJOyssBDlsQcuocw1iOdiYxy+fvLHHmX8KnT
	CUbI244VWXimVh2pkiXZ/OCy+OaWntRPZNoFvQ9c44Hw1zOttWGjZvgl/bfBQUbSOotU/noR/BH
	q20COxfnvuNfh1gi6mxGc1WGzTpYNyuSqSy0ZPrgYGgM7KAm0jY9H2mK6qU3Fo537f5/kndpC1j
	d9WXGK8z/8CqsQiJHnfHKqarag3GFBKX3oYCbg+HN6pMg==
X-Received: by 2002:a17:90b:38ce:b0:36c:e254:4d5 with SMTP id 98e67ed59e1d1-36e306482e3mr1303320a91.4.1780456101691;
        Tue, 02 Jun 2026 20:08:21 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36e0a186741sm1247102a91.8.2026.06.02.20.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 20:08:20 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <rmk+kernel@arm.linux.org.uk>,
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be|_ptr)?\b)
Subject: [PATCHv3 5/8] dmaengine: ti: omap-dma: disable IRQs on probe failure
Date: Tue,  2 Jun 2026 20:07:51 -0700
Message-ID: <20260603030754.288757-6-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260603030754.288757-1-rosenp@gmail.com>
References: <20260603030754.288757-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The probe failure paths after IRQ setup free channel state while
hardware interrupts can still be enabled. A concurrent interrupt can
then walk lch_map[] and access channel memory that teardown is
releasing.

Disable IRQENABLE_L1 and clear irq_enable_mask under irq_lock before
teardown, then read IRQENABLE_L1 back to flush the posted write. Guard
the L1 accesses for legacy platforms where that register is not
mapped.

Fixes: 7bedaa553760 ("dmaengine: add OMAP DMA engine driver")
Cc: stable@vger.kernel.org
Assisted-by: Codex:GPT-5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/ti/omap-dma.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/dma/ti/omap-dma.c b/drivers/dma/ti/omap-dma.c
index cef4e3a38b04..61a935660341 100644
--- a/drivers/dma/ti/omap-dma.c
+++ b/drivers/dma/ti/omap-dma.c
@@ -1811,6 +1811,13 @@ static int omap_dma_probe(struct platform_device *pdev)
 	if (rc) {
 		pr_warn("OMAP-DMA: failed to register slave DMA engine device: %d\n",
 			rc);
+		if (!omap_dma_legacy(od)) {
+			spin_lock_irq(&od->irq_lock);
+			od->irq_enable_mask = 0;
+			omap_dma_glbl_write(od, IRQENABLE_L1, 0);
+			spin_unlock_irq(&od->irq_lock);
+			omap_dma_glbl_read(od, IRQENABLE_L1);
+		}
 		if (od->ll123_supported)
 			dma_pool_destroy(od->desc_pool);
 		omap_dma_free(od);
@@ -1828,6 +1835,13 @@ static int omap_dma_probe(struct platform_device *pdev)
 		if (rc) {
 			pr_warn("OMAP-DMA: failed to register DMA controller\n");
 			dma_async_device_unregister(&od->ddev);
+			if (!omap_dma_legacy(od)) {
+				spin_lock_irq(&od->irq_lock);
+				od->irq_enable_mask = 0;
+				omap_dma_glbl_write(od, IRQENABLE_L1, 0);
+				spin_unlock_irq(&od->irq_lock);
+				omap_dma_glbl_read(od, IRQENABLE_L1);
+			}
 			if (od->ll123_supported)
 				dma_pool_destroy(od->desc_pool);
 			omap_dma_free(od);
-- 
2.54.0

