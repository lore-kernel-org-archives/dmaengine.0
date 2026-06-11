Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52A7190473
	for <dmaengine@vger.kernel.org>; Thu, 11 Jun 2026 03:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781150001; cv=none; b=Gxxuo2PWrCmXz2jyrtkKFDIj7LqthtfuvSG6s1jKsBb0nxTiQjzPZ/lU2RtdSgbzXNbRULjDH1mfzJ29WZsP/GqEZQ9IMHLslQ3yuUMRulApfqyS4gqgYzE0r3eAVsP8ORw+90qikDtgQtd9lS1/LiIhw0Sk0CPXtrWGecvDDis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781150001; c=relaxed/simple;
	bh=Gx3zpLu6WtzzCPNIoXGM3SzeP5Zd9wP8Spx+zDr1Wyk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f9DRmYXw5CIkdDq4XgzC+lFbHw8RcTEHRUg7UpIRUKcEzAqeaQ38QtBAMI3ZYrtRz0YC572j7MsToepMPXB0eHKQ30wpmK/KvV0wlYQUEo1T90gIHH0YkXJQAEeVMCdel+9wQOnaQ+dCDPZYzCJqVLzCr/ShEhTo7cCYwLamak4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T4GQlqsX; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T4GQlqsX"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-36b9b15af73so6885945a91.0
        for <dmaengine@vger.kernel.org>; Wed, 10 Jun 2026 20:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781149999; x=1781754799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zh/mpsi9dKYVr7XXt/nowqZiSrF2hHl6kTiAGF+2p2s=;
        b=T4GQlqsXwe4aQLHJWpgha0APTjagO6Ic5eOGn/zXL8/WIftKDaLyR9cndnbKGG5Fxq
         NzEocOkRMFOadm5WjERktEF3RfiiAsBQiHA/v05l8nQt5XCk9ewvFNbFuQ6VBo9lM4rG
         eYB3oNHW4Bl847DBidh2p7Pq7aEp2H9yhrwC+uv3/4/VEmTTyqY647tcG7Sr1rA2TOav
         C3WYiKErMUy4pWSxYolS0vcssYu1HxRhB1rvDIuEyEKTVY+cJHaBkJ0U6wjW2fegTYA7
         9oXJ91/QUw89Sv5WRD90oZaCO8gWFNiHvo24oLtaWORkISP1dusbZFMZ8uGlBqj9kkL1
         ghMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781149999; x=1781754799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zh/mpsi9dKYVr7XXt/nowqZiSrF2hHl6kTiAGF+2p2s=;
        b=dDfMGaISNmmhGo4G9SyKfpzcQTgvnsnDmzCC2fZItRm2o6P93dzUVmspShloNb7nqd
         HK0dQ95iYrVfUTSpv3ibBv4o24Ny/RuTYJssvIzbiecJH9JNroOlezh7SEzyoGxxC5m9
         2+Asj3uzfrSpZg88YSGfB1ZnlT1R/A7EDb3tfI/dG6gWOpRF1un7BiTrTpidwc+Argfy
         mXYtx41cYsR8dzx0VniJ72U/p7qSA5Gy+xw/pvxspTHGBWUra16nbjyMU3wNDk0Edq75
         bxk1kN5oShmBAWjyMIFd5CB3NyMnHkMHB1FLabszhJNdnZlFsmh4O3BqOWJE5YDnR1R7
         n8zQ==
X-Gm-Message-State: AOJu0YwvfmH7k49ptbd4GJjlpqp4fjy8ioGUEwJn/hEYpf+v21W01vmV
	91GS2ftCVCPTdVqM+WkPwDOlNE9S7QTFW+RDhVN9KXHLagWAl5cigg26Zn7Qwg==
X-Gm-Gg: Acq92OGp4VU5/ncQoWAIH/crvf92+Ngi7wNafu51f9QPpwdMTX6IpGJp2+NglmPzQP2
	6fn2b5h4uQQpP6IzNm8YVSU+f6sKM32M+P1xlPmpblsrhfac2+DH5ifvzDU21aWUZWk3KWKgH+y
	dqqFIBKyjmbYUXZ6SPLA1gBLSRUgyr8uoov/EWUezbfSFZSS9f8WgWp58cpOQwyaE1pnwPrOgn5
	8GWvhkEmzm3cewRB5xSPucj/VYyiCajPh867ztGzkwVvZFCMdZ8v6z+4S2g6Qj24+9xtF+0KAMK
	UoWQqbSrJRsNVM3vhgjBt1dpwmCwuPgKI5qrDVpcy/ChTo7VsP2gJVv6OSCYtQkbd6mt9qhTPEn
	8Tmo0sKYfbLcMwocZbnrqzafkAAeFg7R9bqMnsWaEPvmgCVDEDOACuSm+2TrAAmahhl4RyGlwQd
	Q6GD82YUJL925uXLm8kNd0xPhXzi5X3J+f6FqocpSqgBNkJkzs6bbCj66ckIXioLL81A2owW9jQ
	OMBgDMWtoaEtVGIAIK9p4ZvgyKJh0J9DnjhD15Cg8frQw==
X-Received: by 2002:a17:90b:5204:b0:36d:f28b:72e2 with SMTP id 98e67ed59e1d1-3779f092a96mr1323967a91.8.1781149999281;
        Wed, 10 Jun 2026 20:53:19 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-377522a188asm910131a91.3.2026.06.10.20.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 20:53:18 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Zhang Wei <zw@zh-kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	linuxppc-dev@lists.ozlabs.org (open list:FREESCALE DMA DRIVER),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCHv4 11/15] dmaengine: fsldma: convert channel allocation to devm_kzalloc()
Date: Wed, 10 Jun 2026 20:52:41 -0700
Message-ID: <20260611035245.13439-12-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260611035245.13439-1-rosenp@gmail.com>
References: <20260611035245.13439-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert fsl_dma_chan_probe from kzalloc_obj() to devm_kzalloc(), tying
the channel lifetime to the parent DMA device. Remove kfree(chan) in both
the probe error path and the remove function.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/fsldma.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
index e4a3315a7d9d..0df09789187d 100644
--- a/drivers/dma/fsldma.c
+++ b/drivers/dma/fsldma.c
@@ -1114,11 +1114,9 @@ static int fsl_dma_chan_probe(struct fsldma_device *fdev,
 	int err;
 
 	/* alloc channel */
-	chan = kzalloc_obj(*chan);
-	if (!chan) {
-		err = -ENOMEM;
-		goto out_return;
-	}
+	chan = devm_kzalloc(fdev->dev, sizeof(*chan), GFP_KERNEL);
+	if (!chan)
+		return -ENOMEM;
 
 	/* ioremap registers for use */
 	chan->regs = of_iomap(node, 0);
@@ -1200,9 +1198,6 @@ static int fsl_dma_chan_probe(struct fsldma_device *fdev,
 
 out_iounmap_regs:
 	iounmap(chan->regs);
-out_free_chan:
-	kfree(chan);
-out_return:
 	return err;
 }
 
@@ -1215,7 +1210,6 @@ static void fsl_dma_chan_remove(struct fsldma_chan *chan)
 	tasklet_kill(&chan->tasklet);
 	list_del(&chan->common.device_node);
 	iounmap(chan->regs);
-	kfree(chan);
 }
 
 static void fsldma_device_release(struct dma_device *dma_dev);
-- 
2.54.0

