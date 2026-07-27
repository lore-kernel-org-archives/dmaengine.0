Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E2B42F71B
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184367; cv=none; b=WDeHmxj8K7VNmBTvQT08wXPNAEdejN9LTmf6auHUooYaymwTn1A3DWC+kqbPWCTDfBF9GfkF7/Dk8V4QXXRr3hMqrJAFwpNDjNJBaYBQLd6azPvvhhT9CHOHvMXDH6L+wMVVb5RG/Vy1oLEbD46EOqXiVH3wBWQqxeOLGrxIys0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184367; c=relaxed/simple;
	bh=VFUFpJ/yE12S767fT+znzGViDqnMVnfXKsvCYYCqxWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iC6ZtKsB7WqMgtwfod0T728fJD8k7RRR7xMtspO7RNgRDMur6OBNH6a/nBd999ZcIZUUsDX/3kLDJ9uRtZVLvTqG7MF24BB01sFlI1APLSuIAH7IRVHL0zc+9t5YAqlZhPyJHCPCe54fKX5lk2pHE9lBpgKMcw0+H2dridt/NjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UPOoHe2d; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UPOoHe2d"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ceaf8a1265so38147555ad.2
        for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 13:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184365; x=1785789165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x9DOHXLMhCLFc6gwCX9eKIgno2sve6ghbqP9ZSdXa/M=;
        b=UPOoHe2dzAWWZ0BTY/n0QpXuOTl+WSBCugS5oscsy4OsbZMC/blBViHoWz0gyiVIQt
         NgRqYNZdCj8btjLAYlK6gtoZP+xdzOCeS8aGw+GAoVLVJBXz6rnBfuK6xAktunhbWgyX
         NDXFVRNHYhsdYOEqgSroFbQS1aaDBonkk8KbBydFl7abvekFa9USDq7z9TkgKTeqTSTd
         bbvnCeg4pDvK3OZdpRlq8mCwwAcg7kTt3YGA5Bip/E3EeVw4j/ifL3cZIZI/TNZQaVAo
         ZORX24BxsEhDR/CmygHpPxRf7nlrTvAU4rYAZ/fuDvdkMPxkwbTUr6mAh6LeJfkeqhaf
         AcIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184365; x=1785789165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x9DOHXLMhCLFc6gwCX9eKIgno2sve6ghbqP9ZSdXa/M=;
        b=NaMqVHCtkRQPzoeWOkFaVfOQSP2nHDd7W28kl5xMb52CsrbkR+M9P+UJpj+nN4xuFD
         D4UAOw+lJ7A9+m9AgrONNsAT1ia58gd15qEqL9WyA6wiCZHPXqBNz/Ws6Cmq/AHetkYA
         wvEOl6Jv93OTy1Vrq7iWZaU3tVp9DleRB79V1gFXGFEuZGDmfI7S78TgpsTOm2MaUsXA
         JiO7Ek7a7UWzfOlTjAiWJh7f68oA87eFcLIEZExS9kFZfS1uBRG4e8AfXbgpgI4T4/l7
         XvjhcPOc56eRONKBrxAJRzrj2cjY0ZmdO2Rm+gXmLnryGBDRKGJbT3qK1TN9IlHZxagm
         bR7Q==
X-Forwarded-Encrypted: i=1; AHgh+RovDCxvjB+Gm9mnFRcRg0qow8XY2e3hmJM+mbPttw5pk0ulvIuDj9kxA0/S1/x+ydDomTI++CcS/Ko=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8XgI9OG61f1vdEeSFb69zLtd0Zdq0HhpQSt0mBLm1Gl3bNAfO
	PEmb/h7WvtZwMztN7WAXJoVrg0Sj4yz9i3C+CIsSzmRRbNHlDJit2fLn
X-Gm-Gg: AR+sD12bmVBcmwLY0L4Iba3ADNpeTN+BMVa+MtldMwPYaQ+IJCgBG+zpzF9Jccul4BW
	ieU3iqrzDoYelz6xwL+2vHlBc+DbAAB2nHrQgfpDJ8ZRQQ1sOgfBttr/Fbe1ZjvVgEPFMdg5Hku
	xOXbcww4ISPFKFmEDiWrQjC8/pXrQB676sS0Y/Z61k6Jx89mmGM3yF3BF5FxR/HAybJ3Q4+9+bv
	7+NaAlEVHuEo5eXrQ/Upk5xQqrf8Tflz17M8B1NxpBK9vGkPe8IifeONVzao10+nVqfGN4BxFgc
	eQ2ybCjGeO+itJ50sIxB8J6ORXPO18HQi2tHsqAQVLeeJpiOEKTb26WlThyPjel8ad2ZSILAFfM
	fUN4yRJLOzAox1xCr6RhPPvOKpPCO7i8Shqzb5M1GSxrM+JllucajYaJCXXQq8H/y8rUUh/di3L
	Q9/38j
X-Received: by 2002:a17:903:2412:b0:2cf:b23d:79c with SMTP id d9443c01a7336-2d00f4445e5mr6461445ad.43.1785184365226;
        Mon, 27 Jul 2026 13:32:45 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde59b768sm41551805ad.4.2026.07.27.13.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:32:40 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>
Subject: [PATCH v2 24/64] dmaengine: txx9dmac: route callbacks via channel BH
Date: Mon, 27 Jul 2026 13:28:52 -0700
Message-ID: <8c967b8a3cdc82ba43494ac218ca7c0ae2450993.1785183549.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com> <cover.1785183549.git.allen.lkml@gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the per-channel BH helpers for descriptor completion handling and
schedule per-channel work from both channel and controller IRQ paths.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/txx9dmac.c | 12 ++++++------
 drivers/dma/txx9dmac.h |  1 -
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/txx9dmac.c b/drivers/dma/txx9dmac.c
index 05622b68a936..6269baa28c51 100644
--- a/drivers/dma/txx9dmac.c
+++ b/drivers/dma/txx9dmac.c
@@ -601,13 +601,13 @@ static void txx9dmac_scan_descriptors(struct txx9dmac_chan *dc)
 	}
 }
 
-static void txx9dmac_chan_tasklet(struct tasklet_struct *t)
+static void txx9dmac_chan_tasklet(struct dma_chan *chan)
 {
 	int irq;
 	u32 csr;
 	struct txx9dmac_chan *dc;
 
-	dc = from_tasklet(dc, t, tasklet);
+	dc = container_of(chan, struct txx9dmac_chan, chan);
 	csr = channel_readl(dc, CSR);
 	dev_vdbg(chan2dev(&dc->chan), "tasklet: status=%x\n", csr);
 
@@ -628,7 +628,7 @@ static irqreturn_t txx9dmac_chan_interrupt(int irq, void *dev_id)
 	dev_vdbg(chan2dev(&dc->chan), "interrupt: status=%#x\n",
 			channel_readl(dc, CSR));
 
-	tasklet_schedule(&dc->tasklet);
+	dma_chan_schedule_bh(&dc->chan);
 	/*
 	 * Just disable the interrupts. We'll turn them back on in the
 	 * softirq handler.
@@ -659,7 +659,7 @@ static void txx9dmac_tasklet(struct tasklet_struct *t)
 			spin_lock(&dc->lock);
 			if (csr & (TXX9_DMA_CSR_ABCHC | TXX9_DMA_CSR_NCHNC |
 				   TXX9_DMA_CSR_NTRNFC))
-				txx9dmac_scan_descriptors(dc);
+				dma_chan_schedule_bh(&dc->chan);
 			spin_unlock(&dc->lock);
 		}
 	}
@@ -1113,7 +1113,7 @@ static int __init txx9dmac_chan_probe(struct platform_device *pdev)
 		irq = platform_get_irq(pdev, 0);
 		if (irq < 0)
 			return irq;
-		tasklet_setup(&dc->tasklet, txx9dmac_chan_tasklet);
+		dma_chan_init_bh(&dc->chan, txx9dmac_chan_tasklet);
 		dc->irq = irq;
 		err = devm_request_irq(&pdev->dev, dc->irq,
 			txx9dmac_chan_interrupt, 0, dev_name(&pdev->dev), dc);
@@ -1159,7 +1159,7 @@ static void txx9dmac_chan_remove(struct platform_device *pdev)
 	dma_async_device_unregister(&dc->dma);
 	if (dc->irq >= 0) {
 		devm_free_irq(&pdev->dev, dc->irq, dc);
-		tasklet_kill(&dc->tasklet);
+		dma_chan_kill_bh(&dc->chan);
 	}
 	dc->ddev->chan[pdev->id % TXX9_DMA_MAX_NR_CHANNELS] = NULL;
 }
diff --git a/drivers/dma/txx9dmac.h b/drivers/dma/txx9dmac.h
index aa53eafb1519..f2abedb73d49 100644
--- a/drivers/dma/txx9dmac.h
+++ b/drivers/dma/txx9dmac.h
@@ -162,7 +162,6 @@ struct txx9dmac_chan {
 	struct dma_device	dma;
 	struct txx9dmac_dev	*ddev;
 	void __iomem		*ch_regs;
-	struct tasklet_struct	tasklet;
 	int			irq;
 	u32			ccr;
 
-- 
2.43.0

