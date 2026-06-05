Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071313DA7DB
	for <dmaengine@vger.kernel.org>; Fri,  5 Jun 2026 22:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780696927; cv=none; b=qumhnhV8IlUljUHYjL55KxjPsQQ2r28vLujBPIuFTlHLq7O41PhwCxxDT+HH5vnSfNqCCzaNHX/GTmfjyv5IWJM30jHzfXU8eOomh1FZ28B2sbD98Y+qI5KChOaFng/dUKAcKFmh86qk0oI3EhDTX+hpK7lCS53LYQM7IU6OeUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780696927; c=relaxed/simple;
	bh=D9O4y8MzWm3dICcvhBAR8c5YwW29hJVK/MboyWCLTFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rNTorxe2SCMmuTsL2PDdtvlbsr+DSw4nS8oVoQThn17dKox8WgeSEQZJsNCM900QJw3db8+XCNY2gp+RumiANWyDb3OnxBXehi6jCzOysONGi2QLYPaac16AlIbG0N2zKsswwAEVbVWlQe/wK2sJMoUbfDvdaKLb4E8psi4OD8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TTGSIWrv; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TTGSIWrv"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8422f148dfcso1311477b3a.3
        for <dmaengine@vger.kernel.org>; Fri, 05 Jun 2026 15:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780696925; x=1781301725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0c+DTbgBfPPUhSPBSk+riIkjYOZTEz8XaKJeP18mVBg=;
        b=TTGSIWrvCHES/ma7UJoIpncBDI8YCvzFf7rxBMO0bhawTfUow/xtXn+30ik31x/9cB
         96rnWh8kQYUJUXmzDh1kap2zIFDEZ0SLIRqEfwvX5W38Mnw3oCJPRYF82ZXyFv3g6GSz
         dcHiI8zZ1qKI572v2x5twza2M0vRnnAh6Wnhifgq+zx+f+RuS8xFWmQlc2+JgBOdg8m3
         +G1uHC9CNNJupdPp8xt9IENmUQ4Nt0O0EM8I1rgb8brIgl9jK7o/HKhbr0J0mhWF0Wx8
         tAiFDTTzjn/JpXh9p1oypsSZCPhg0spTvvkm82znUL+iH2B3sZxjq6gD/wbfknpEOErk
         kNjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780696925; x=1781301725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0c+DTbgBfPPUhSPBSk+riIkjYOZTEz8XaKJeP18mVBg=;
        b=iqaCz+X3kmk2DOw7gmZsnEgGXzEs2KPnbyaLSyXu9sOOqGQ5ktzxufFxcKBkj4rlRn
         /uRVbzg4VxAdQtJZn22We6X3iD20lcYKZx7GC2/UzowRUl3NKk/lBYszH88ifgg0aULO
         8MkJkR6QyfaokIe3L5MtyQFhv++kVHwLl739dLLyGniZ/A8eeUnPlKNCmCfIMgCO/ueZ
         /dc0dm3hd7KEKhE79akUGmbobZ+G2KzaJuNd5J4YxwScCi2mHfKIkNrbQqhVEhhQhevq
         9oDpPD9Nu0nifxKsWVNnEV5aVfmK/Wp1KaNoPeibUUQIP3DLyOXeoMpOEtR3akKTBgbt
         fYMg==
X-Gm-Message-State: AOJu0YxOZVIvsNpFJk1mUfS2ZArNLpazNHa/RGanCfON4TTmfbrapA5b
	1EGVjIVxXjFFMWPRG8TIemDsIb8dE97OWH3yCocw8KDCZ3vA32vgokqB5gxuPg==
X-Gm-Gg: Acq92OEP2RP9aS+N5wJMuoTjuC5uK0dUoI93/JCf8UcY7P+O8uWtmdcx2Uen5X3kOwd
	UP41vOaLiroaDr+TzuRnd4MRQon9AJTvqXUzh/TLhBe6Q4HKGuMYtFWf/DY27BBVwjAv31I/vyw
	lhZZaCEbohdgav4h3HHKtJzE0zGl6dYIF+R2y69Z5SMY1jiLZzpEhZiZuCrjGBaYcVs0VuukQRg
	3cmBqhxrPXUsCvjFtCfpo4FBRDyog/H70vGnHIuTGb/Iz44d6ExRAJmli2/ndSe3aKaf/7NyVdO
	yTpxYFSR+HqCVWA4IEmYJTuM3TbnFlLLuCiK37dXdOve/hIsri193/mMN/UA+o5KEaYDHE9Zv48
	/ilVs04tc0xDqcTU/pMMk8ztIasx7/hYkx9r+rCExpaELEoVPQPQgyYtwRJENi79EbOotQsMjKO
	2Q3Ht3DXCb4z/guygQTGT3HfdpSKI+Ey6u0EtGJpcF3x9vogu1cIbZwEuhuZEVMhzpKxHqS0G1u
	YlGq+QSM6qn5TEWgx8JY44WcJb+IFKbyH7C66YDuNnE0A==
X-Received: by 2002:a05:6a00:66c1:b0:842:6004:3fb9 with SMTP id d2e1a72fcca58-842b0f52ecemr4959351b3a.25.1780696925057;
        Fri, 05 Jun 2026 15:02:05 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842824a1cb4sm12518883b3a.26.2026.06.05.15.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 15:02:04 -0700 (PDT)
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
Subject: [PATCH 07/10] dmaengine: fsldma: convert channel ioremap to devm_of_iomap
Date: Fri,  5 Jun 2026 15:01:31 -0700
Message-ID: <20260605220134.43295-8-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260605220134.43295-1-rosenp@gmail.com>
References: <20260605220134.43295-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace of_iomap with devm_of_iomap for per-channel register
mappings. This eliminates the iounmap calls in both the probe
error path and fsl_dma_chan_remove, and simplifies the error
handling by returning directly on failure.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/fsldma.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
index ee6e595c2972..0d73ce3dbfe6 100644
--- a/drivers/dma/fsldma.c
+++ b/drivers/dma/fsldma.c
@@ -1108,7 +1108,6 @@ static int fsl_dma_chan_probe(struct fsldma_device *fdev,
 {
 	struct fsldma_chan *chan;
 	struct resource res;
-	int err;
 
 	/* alloc channel */
 	chan = devm_kzalloc(fdev->dev, sizeof(*chan), GFP_KERNEL);
@@ -1116,17 +1115,16 @@ static int fsl_dma_chan_probe(struct fsldma_device *fdev,
 		return -ENOMEM;
 
 	/* ioremap registers for use */
-	chan->regs = of_iomap(node, 0);
-	if (!chan->regs) {
+	chan->regs = devm_of_iomap(fdev->dev, node, 0, NULL);
+	if (IS_ERR(chan->regs)) {
 		dev_err(fdev->dev, "unable to ioremap registers\n");
-		err = -ENOMEM;
-		goto out_free_chan;
+		return PTR_ERR(chan->regs);
 	}
 
-	err = of_address_to_resource(node, 0, &res);
+	int err = of_address_to_resource(node, 0, &res);
 	if (err) {
 		dev_err(fdev->dev, "unable to find 'reg' property\n");
-		goto out_iounmap_regs;
+		return err;
 	}
 
 	chan->feature = feature;
@@ -1145,8 +1143,7 @@ static int fsl_dma_chan_probe(struct fsldma_device *fdev,
 		   ((res.start - 0x200) & 0xfff) >> 7;
 	if (chan->id >= FSL_DMA_MAX_CHANS_PER_DEVICE) {
 		dev_err(fdev->dev, "too many channels for device\n");
-		err = -EINVAL;
-		goto out_iounmap_regs;
+		return -EINVAL;
 	}
 
 	fdev->chan[chan->id] = chan;
@@ -1192,17 +1189,12 @@ static int fsl_dma_chan_probe(struct fsldma_device *fdev,
 		 chan->irq ? chan->irq : fdev->irq);
 
 	return 0;
-
-out_iounmap_regs:
-	iounmap(chan->regs);
-	return err;
 }
 
 static void fsl_dma_chan_remove(struct fsldma_chan *chan)
 {
 	tasklet_kill(&chan->tasklet);
 	list_del(&chan->common.device_node);
-	iounmap(chan->regs);
 }
 
 static int fsldma_of_probe(struct platform_device *op)
-- 
2.54.0

