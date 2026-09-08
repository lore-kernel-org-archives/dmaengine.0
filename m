Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67CCA484236
	for <dmaengine@vger.kernel.org>; Tue,  8 Sep 2026 21:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788902771; cv=none; b=pULBltQhQTzuF1pL8eAU7BKkeJDVXGA0GvEDlLcymhp6FM7WLR++mSf96Ug28YWt6yqZTVdRNtzaY7jFzyZjGrAaugH3dFGqIK4sQQzhA4Gdg/IaAUC4j1gOI3T/NifVqBbxl0tD5Mqp/wt0KomXN7HsGHQ8bcL10ANYAKRwxe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788902771; c=relaxed/simple;
	bh=qyn0WpBG9QU6QYmxMj4iS4kAntpbN2q9wDmeElZcpKU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iB4vkiC+MSBViZ+SxdNOXMhfpTxJxRKAjsSA+AWaIz21w53yIDKapb8R8lGPk4WVcxrmtZzPx1oiIsgBl0vLY96M9a4pQX/YuyRTAWelseMHucrLguHtgzi5Y66EF1yewQvl1mZwC4xX1dIXveZHQDAFReKBrKf4Ltbt5fvKsxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qR18Tn7L; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qR18Tn7L"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cebad4adso345923a12.1
        for <dmaengine@vger.kernel.org>; Tue, 08 Sep 2026 14:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788902770; x=1789507570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rFbylBrZDIAgIOQuj/sws9qSGB10wS55ldz6AYSO0mU=;
        b=qR18Tn7LA2/7Je//faL+GvGfPYXY9Vf8GbZMWbnRTMKuJJWdi22VZk2mbh/Qoup9De
         cp69cNoaGwR54JbVka5qhv7WBap6Xtg5DrICw5RwXVLrJ6oIkUVbZOLgBc0tUztA1v/Q
         rfK/1mvq3Yizs39ymCluurotQpboYmkoFr9oHMmFL5Lmyh2B8kAlSx/y4aHFqgxcachY
         g5yFCJOWuo/0Gy1kiBFeXVOJfUydhsg4gslrZxsV44M2jikdZc+nQaO+vDyx6w2RQrVM
         ejoA5i1bS6OnGn3byvF7zO70E20g1jnPATa3+9FXEMWeUgcrGky80CQT7tiBapQ75bcm
         GzPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788902770; x=1789507570;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rFbylBrZDIAgIOQuj/sws9qSGB10wS55ldz6AYSO0mU=;
        b=Y0aYk35BCvxDqTtP0K2wgIUOrB5awgDqqxS88RxfLiPyTheRABSv/C6CN7VRaGI+Ia
         5YyggjKyMjfMumYZ6fWZedRW2yTcEeEKct8aEqhuF+fcrBof5xtK7WsUGTNxhad/w5UQ
         MSEOXRcH0RZA1OpDL0Z6QJk0iPHU4UOGHqT3j5QeWPcMCly4DprvD4qIgqJOd2kTylL0
         hyxYKC3N5y4lMlumWq5KVF177c+TxffJLGz1bIyw8xczLGwmX8+Jeb9TUduTteFQTPBm
         kyGbgr/bRGTmvheJ0HLkWYqug/aePFi6eL6foCbs0iEp/K/014Lvpwt6KVxzAhUE0HM6
         1dWA==
X-Gm-Message-State: AFuF++m7+yo/Yf/vtFt16PlHopGqxD6syA6iLBUMyC1WxtRo4EtCINKu
	2ZEjVMKbLTesWHjebAzjPyRRgMHtF5zUrU9a2xSPfgVuL8hfd0LbTaSiS6/Odw==
X-Gm-Gg: AYBFou1oclantMTIeNaUYhf4s0vP349m/OZIIsOnB4tORtm9SBADZSjk7pJEvxri9HV
	ZMdXpbCdmabZdJi8odRvbl2j1IZ8achPaofFHddQZ6Qqwne8NR4iUNkyyhAeW8pY11WbTJGLhyK
	sTzTBF17TiDTxn+drrEbVfjlVaZ+6H/Zh3yJUhVSCDYDc+9Z1t6W9lrQNmqJufBayVrS/gn0vec
	TqDLk0UljPxMtjbXdYgfCTFQFyF/gpnfSZuu8g6AVsRdeGGwmdv9espf1jngkbyJOeUyny67rPV
	BY9GRNwiTd00YhoerGb2nXjv5CBgRy/hCYCyz7cYjfxs6vozbG71O1HGZ6YtdVzhmSYRzgfVCgF
	BAGREcen8vnbK/gS6C6ilqtqLEzROD3M+1O2tgLLp5cGiedQd6e4Kj54b5DAh86fH4vAW3cbxth
	FMBww+BuJVD1PACnUk141ljDHpv1HEwOAKmoDnPLAbTBW2JXqkPedGnwHEKiH0kZ70F2hS4xUwz
	SqCzvjkfOLffi9cPY+vnB3o+zZnCle+x+40AwO9SViy+g6H72/U4sF2pmEveiCpu3tF+t9YYmZl
	V7fBRcIi+Pw1dTm/Ic7IjDEvTUe9+Btew5yW4QLo60TCSOYA
X-Received: by 2002:a05:6a20:9187:b0:3d3:adad:f177 with SMTP id adf61e73a8af0-3dabb2ec0famr2238273637.25.1788902769542;
        Tue, 08 Sep 2026 14:26:09 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4640bc66bsm4782413a12.10.2026.09.08.14.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 14:26:08 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:MICROCHIP AT91 DMA DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] dmaengine: at_hdmac: use devm_clk_get_enabled()
Date: Tue,  8 Sep 2026 14:26:07 -0700
Message-ID: <20260908212607.590224-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the devm_clk_get() + clk_prepare_enable() pair with
devm_clk_get_enabled(), which handles enable/disable and the
unprepare on driver detach automatically.  This lets us drop the
err_irq cleanup label and the clk_disable_unprepare() calls in
probe error paths and at_dma_remove().

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/at_hdmac.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/dma/at_hdmac.c b/drivers/dma/at_hdmac.c
index f4d0c72787d1..cae26ea890fa 100644
--- a/drivers/dma/at_hdmac.c
+++ b/drivers/dma/at_hdmac.c
@@ -1994,20 +1994,16 @@ static int __init at_dma_probe(struct platform_device *pdev)
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
 
 	err = request_irq(irq, at_dma_interrupt, 0, "at_hdmac", atdma);
 	if (err)
-		goto err_irq;
+		return err;
 
 	platform_set_drvdata(pdev, atdma);
 
@@ -2126,8 +2122,6 @@ static int __init at_dma_probe(struct platform_device *pdev)
 	dma_pool_destroy(atdma->lli_pool);
 err_desc_pool_create:
 	free_irq(irq, atdma);
-err_irq:
-	clk_disable_unprepare(atdma->clk);
 	return err;
 }
 
@@ -2145,8 +2139,6 @@ static void at_dma_remove(struct platform_device *pdev)
 	at_dma_cleanup_channels(atdma);
 	dma_pool_destroy(atdma->memset_pool);
 	dma_pool_destroy(atdma->lli_pool);
-
-	clk_disable_unprepare(atdma->clk);
 }
 
 static void at_dma_shutdown(struct platform_device *pdev)
-- 
2.55.0

