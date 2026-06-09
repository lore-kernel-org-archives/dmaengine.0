Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6F63DCDBB
	for <dmaengine@vger.kernel.org>; Tue,  9 Jun 2026 22:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781043608; cv=none; b=r8ztLYYS6I08Y6f7lX9uPsaDFMbpNh8cnJlqLkEV7UUwFU7zL67Ws86V6mT4zli7w1jVFC8ehfWCPgmSHbk81250nHRWSNKUWfurPlUQPyFlExSfUS++fp1Pb1nJZ0LgN5U+KFL1V+9R244W7vehRn+wSyKFJ6rC6I4CpewJAXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781043608; c=relaxed/simple;
	bh=Gx3zpLu6WtzzCPNIoXGM3SzeP5Zd9wP8Spx+zDr1Wyk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aKU8xDhts9wv6UJl9YMRavjtYL9Onunn0HQ7jA9v0L12/xBntBe4k+wCXy7e5LrNbY63wAr4VFzvhNv465+kkqSa/NH6D4J4hbS+JKlbKUqfgMlubYnkJ8rh3u/XR7w2JPtoFzHj/+dTf0gxiYctM/2uN767wfMGQa9ZGGAkbyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p9XUDu7t; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p9XUDu7t"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c859a374903so2118454a12.3
        for <dmaengine@vger.kernel.org>; Tue, 09 Jun 2026 15:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781043606; x=1781648406; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zh/mpsi9dKYVr7XXt/nowqZiSrF2hHl6kTiAGF+2p2s=;
        b=p9XUDu7tZqH1SFO18nFvVn/zVt3wuAkoAJ5pD7J074xRuiAcxv1ZIH9uZiubJ/UHN4
         NQp5H6p7Cd+Wl/LP+3KwzmIJ82DIcm8dY1dTd7IMzXEHOTkFNs8/NjUIVO1oOLTnwPVG
         i7Tme2Njf/nNNwTvqCXAUxLF/3l3NuY6xnGAAh7fqs52sBRbOQ19bqotsFpdeV9xK0N7
         bVprdL9edA1zVrX5ymlk+b4UjdXyQyW+f6XlgslqPXHinJcogIX9EkAS4TcYZhoUxXjc
         3EB/Q6aVhaJ0EFuRokZraNMaAk2iWmyGAqVD/NK+U+uV3PGsODiUEE0po9bHEvGTsm5G
         aaVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781043606; x=1781648406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zh/mpsi9dKYVr7XXt/nowqZiSrF2hHl6kTiAGF+2p2s=;
        b=gx4ph3vpIPXrgfKpCoVjBlHn7GHo6dXYOD+ChKnk7/YOJ6nqma6agnyD1mexays7aW
         +7KBKxwsmjgQEfeX+eC+gj7ZmGdXcy3e5AB8hO7mMiED4cdSSdC1zvVvx5HKrg43f64m
         8wr3v1OyYLhXBmi9HiEbF13LJyaMfHdcnu2hcEwDCxp3I64hHw+WhTTMDT/E1xRTSudG
         jHl9wN+r/4H+9CjAHYWKi1dTer6kZzeEOHWXB2j+YWLI9eCbcPkIxK+LKecpXsSK/D1n
         QCjB9Vk/GWQgVTOLccIxqZPQRXMkxymd782tAlLH6cJuRG9a74kqiDfjg8WsXL4RFOR5
         lXjQ==
X-Gm-Message-State: AOJu0Yz0zxnlBb+lOdyXZmZETNpbfs46ym9uGsqa3tVZ+ebfxoOJiVlp
	eG2ILor0u0qOmBopaDXpdY4UsdykIp8ZTRCpT3wpnXWiUBv+ylC/kRTPnrUfkUta
X-Gm-Gg: Acq92OHs0qkw5K/oqLPdLxlaaAdGmuHjJgPqa3dpVOpJOo73msZ/HCBbrlZ6aiXU+he
	EfwBCQNMQFGjYWNJ8oaT2xoP0/Qat0TXQ41EcjyJWkbAsPeIk7n8+Nmc+BrraGFdRMLYMY0uWZa
	6dkQa2HGEDyumYZzPC6/jhK4Vm+xZvE/GaqyP3YTc81j/BL3/F+04szfRmsesxnASufAJX+92+b
	+OvHgVALh35mwRgJ/msQIJ1JxOQDmNj7Kr/cU139g7kwn9tBknYvAD5iONne4COVHcgJq6p11Oi
	rO0im0YpelQwOODb0tkEJX5DUKkXeXGp+M/aJc2n0GSz/jB7SoxxLhROEzff0lYmRD7LFz9/6Sl
	4r+5c7UU1VtA2eNL0xiwNMSERFyfHf81ipLMMY0xW1Fw84YziaW3OnTOn2i7yX/7jXV4vSsdVyG
	foL3o3UY65DcaAXxByw9HE6TLsqRYvjM73K9d+SL7WbhMyS/Tj7lM40J0/PdxH5RNFHGGy6bA5A
	aOURCX6O16eXSA/0C7FzMxOBZ5PLRW4cYJOzDDwK5dLcg==
X-Received: by 2002:a05:6a21:350f:b0:398:9379:d04d with SMTP id adf61e73a8af0-3b53be59e67mr4919030637.24.1781043606091;
        Tue, 09 Jun 2026 15:20:06 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df04ff24sm19661834a12.14.2026.06.09.15.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 15:20:05 -0700 (PDT)
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
Subject: [PATCHv3 11/15] dmaengine: fsldma: convert channel allocation to devm_kzalloc()
Date: Tue,  9 Jun 2026 15:19:22 -0700
Message-ID: <20260609221926.35538-12-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609221926.35538-1-rosenp@gmail.com>
References: <20260609221926.35538-1-rosenp@gmail.com>
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

