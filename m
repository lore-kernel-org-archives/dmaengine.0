Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2FAE486406
	for <dmaengine@vger.kernel.org>; Fri, 11 Sep 2026 22:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789164288; cv=none; b=ttlKDqHSE28BCp0lR6PSU2DZ68GAX9v1cEkVy/BrWMoBvuQQAbhHb07W9Ks4DTi05FEoy9wmZmHZygT23sjCHfAwb3qxzLKewgf836pWe8gltB2zLNzOL/a49pnJ8IYF0vCVBbkrkTU7EIDmJRqvhf7eiUtFRomvMZtjOiNX570=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789164288; c=relaxed/simple;
	bh=3S3J/dSY166r0J4ZKpPkhdswPpVMH2Q7k4E8eREymhU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H/kX4v1YQit14oZQr5+aF2m4rS0WJeZ0gu8AE5XP6F9WRlFAM5gZWPDvtJss8WNcfTk7s+DqHNnum8mAUq/w/VKwQGyhPxpWfr4sxNxJM2ZF+t7O4LA4X1SaWjrSFfSNimy+M5ca0gLjIq3btinHKElNiiQKCpZvbHqsS1nvk7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p/xliQkf; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p/xliQkf"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-398c066106cso207635a91.1
        for <dmaengine@vger.kernel.org>; Fri, 11 Sep 2026 15:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789164281; x=1789769081; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FA7/TxcROHvx3mFEUwRb/G8HDiCsuFllSkpMG3B1Mr0=;
        b=p/xliQkfpeJB/cKQ3FzlS5oKkiNyH6r+PXBIaDM4IQnKXbfvPoWJws/DQDIh2eGXOM
         niv5sbqWzSdAaFBjUSQs1BN10JlQM2AYwH0nIie0VYtK7+pPM4UZ+bX1U8jvSszBPVo3
         DFdlbUlNHW1tnNwEsIv0uOILlq9nd7ifxHtjYTuKE6QGnBF3l/x9WWasJYIIDb4WmLqY
         YcJhQ/SsVJ3EPvr8lQ5bvjiE6LG64V479qALPZaPzAFds2XuHMt2tS+4JZ8oMBEs0LAx
         qkibt44gQ4dAKiKXiKdGP+lgJjkAwhh9AqegpSOFg3WN/s7xr3tf889Yae4EeM77fKp7
         R7GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789164281; x=1789769081;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FA7/TxcROHvx3mFEUwRb/G8HDiCsuFllSkpMG3B1Mr0=;
        b=CuX7gH6w+lqOL0qUCR3cKQRKg7z7QLDmOJi2N1SrxzPk2WQP/FPybFPleLNEES+Zv7
         gOB/VPjkPIMpZ5RnWl0bV6KYuvLXI2Tucno6mbNmgsei8ayLfGVRushySMr4xyla63Cg
         2cGATVbIX8tugwQWm9IXXocvDXU9wFyd0+FWw3M2qlbBLPOJgyonqj7mKEdmc+mwy6GQ
         ktk8x8dzPiHo1qdMk0i4KC3cFYefqiz3gpAfOeekHL5P16bareN26rrAiZWpoFREyDOM
         kQbwv166Qbi20sFm7JEvQ56aYGLml3Ok6ACeVmcaRjkiFPw4a6oLI57SVzvJTVavrb36
         hSlg==
X-Gm-Message-State: AFuF++nbzccCefLj3PpCybLQUzhjU7FkIDa2fAM0Py/2x2rh+lWybQuy
	QpTYhfbLUlrmFtlyOb4wN8o3HkrbeRZdW+bDyGUjUURWAYsE04Am2cbKRZq5EA==
X-Gm-Gg: AYBFou2cShKxvFpn6VhmuZDwIEn4/j1+yyHnl3cJ2PG54hv3VyOAeRtBeUEBmOYca3m
	7Xxn3GSTjKkOes70sCZmtUxlCt6ua9KmCnDALDl6sYe1iMd9GngHazziNNaP6J3S46Tz1PsivXE
	esvHJY1OX4z4ePAHoYsPJ6L3437GSX0x9byh5dbq+D84m+D86JQclJKV7tx/XU/WKrKvkh1+myk
	xK/8m2maYBgqlDYE54Mh1X93i4VwN//Wt5smUXuwQJwLN8T9fAYljQd+AOdvopsIgfxgaqR2Nml
	3Nugi+hoYIgjBz/R9wKTKpvb3nMEYf0/VqqwUc0R0Hb1MN4NGitCAQjg3/HlhOW9uedQM8qFKw7
	qLQCtNfH+0ipf9JSk59XiaLDwN7WcaCt+hyN11RgalkxP8wRBwgvlcvj5DjaXLGkxF6axUMVH1m
	oPPCo1KBDhFdMSXSLV+2owmsjLIMSdbHTkw3xMeL0azBBmAfQENWTYM0KLeAkheNTgmzvjTlBuv
	1gGneQF3wF3IpdU7cU40KkoaYKW9sNAU/yF5BhBCvYjinesJB2xPrZ03gmYmmodobP+0F8J5aKS
	yIm/ig/u/Ivgxt6kx/Qw+Kn3M6VvzPVy2VNGgzny9puqP6er
X-Received: by 2002:a17:90b:4fc9:b0:37f:e326:6557 with SMTP id 98e67ed59e1d1-39d9bbfc338mr10845124a91.4.1789164281193;
        Fri, 11 Sep 2026 15:04:41 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d994cc978sm6554980a91.9.2026.09.11.15.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:04:40 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Zhang Wei <zw@zh-kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linuxppc-dev@lists.ozlabs.org (open list:FREESCALE DMA DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv3] dmaengine: fsldma: convert to platform_get_irq_optional()
Date: Fri, 11 Sep 2026 15:04:39 -0700
Message-ID: <20260911220439.177474-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the per-controller irq_of_parse_and_map() call with
platform_get_irq_optional(). The controller IRQ is optional when absent
and the driver falls back to per-channel IRQs. The corresponding
irq_dispose_mapping() calls in the probe error path and remove function
are removed.

Moved before anything else in order to handle -EPROBE_DEFER and to avoid
doing extra work. Simplifies the if statements as well.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v3: fix build error from the move
 v2: move to the front of probe.
 drivers/dma/fsldma.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
index fb19c60540be..6db2c4d284c9 100644
--- a/drivers/dma/fsldma.c
+++ b/drivers/dma/fsldma.c
@@ -1224,8 +1224,13 @@ static int fsldma_of_probe(struct platform_device *op)
 	struct fsldma_device *fdev;
 	struct device_node *child;
 	unsigned int i;
+	int irq;
 	int err;
 
+	irq = platform_get_irq_optional(op, 0);
+	if (irq == -EPROBE_DEFER)
+		return irq;
+
 	fdev = kzalloc_obj(*fdev);
 	if (!fdev) {
 		err = -ENOMEM;
@@ -1246,7 +1251,9 @@ static int fsldma_of_probe(struct platform_device *op)
 	}
 
 	/* map the channel IRQ if it exists, but don't hookup the handler yet */
-	fdev->irq = irq_of_parse_and_map(op->dev.of_node, 0);
+	fdev->irq = irq;
+	if (fdev->irq < 0)
+		fdev->irq = 0;
 
 	dma_cap_set(DMA_MEMCPY, fdev->common.cap_mask);
 	dma_cap_set(DMA_SLAVE, fdev->common.cap_mask);
@@ -1308,7 +1315,6 @@ static int fsldma_of_probe(struct platform_device *op)
 		if (fdev->chan[i])
 			fsl_dma_chan_remove(fdev->chan[i]);
 	}
-	irq_dispose_mapping(fdev->irq);
 	iounmap(fdev->regs);
 out_free:
 	kfree(fdev);
@@ -1330,7 +1336,6 @@ static void fsldma_of_remove(struct platform_device *op)
 		if (fdev->chan[i])
 			fsl_dma_chan_remove(fdev->chan[i]);
 	}
-	irq_dispose_mapping(fdev->irq);
 
 	iounmap(fdev->regs);
 	kfree(fdev);
-- 
2.55.0

