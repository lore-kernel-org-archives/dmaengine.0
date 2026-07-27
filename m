Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709E942CAEB
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184290; cv=none; b=ah7s1zyGkxlcu14Srs7CBgX/HFuzIJAHEr4mMjBmDlW3fqTLI+f5pxCZD+cY1tJeE2ASBQmsK0hZtVzyu6kNbFteJj0O8eaJJEIF7ZAEMPx2/kBiJpgaxsHPyDkAAwgFYl0JvNGxcJKi3RwjqEh0pFS70UR3RrBvON5/x8UytKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184290; c=relaxed/simple;
	bh=icfVyDF9BoilFSxgEpIKcsFKPbm6k6jIWjASHyQnqII=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mKSkzizYKNRzpN/e8x56VRxd/Gx71CwftAuKNvzWpiCQp3VwMQWfzEkt8G87Qhkb+hQfMaUIS8l62cuNqnw6OVQewHWr11JM2IxWzhPU4eJ1d0xn0frZFFdDcTCUAOE2SUhRmGM7BRJKOOP8+b7VvCa5lpTR8rAKjNEsO5M+2tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q52yO8+C; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q52yO8+C"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cad8076b01so38742815ad.2
        for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 13:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184288; x=1785789088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0a8MYcKw5JTNHHIrN3K1TaKhBFHL7HNLhSi2FpFsKc0=;
        b=q52yO8+CICP6WqMpb0yM5NYcpcnpflEVRExHaAHkuuCLw5dERFwaE2RWY/XNlF6pCU
         Sd6pE3vUnlrZ37gM4DUq0kU2MtCKfnua0Lsqd3wXWbumgUokr8oxp8ydxKJUhvE6X4tF
         LHKpBj5yDy3zlBJMwWlWVesPXs8mVeajpmzTseKosbP68B5mpxcmzpJ8z3UAq4LXlQE3
         oEEKd1lr0Nt15iwppjXXgeK2CL5LVTArfYQ3Hkqg/qhxQek5s3ktVkxQPcciUI3thheH
         Vzf6GOfvfgiocQtux8v6v7mP7yXLJIcBGwIowOlG8J1YJhSUXoXNGuF4in0hToQwhL16
         cLEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184288; x=1785789088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0a8MYcKw5JTNHHIrN3K1TaKhBFHL7HNLhSi2FpFsKc0=;
        b=LzhczfPLmfYS6ZVMtf7hVQWbYY1lS+g74L2iN8wJj/lRLI7DKDK7gmajCKofG0HC/2
         5YcziPIR87+OAZcC75pdwpV+q92ctrlWL5JXRSg29CQ66lm63+jq4UaZjBLmtNPhyqsN
         NY46ENdsjlhUCbisAbPwWd3lW01ozegyHKkvI/DUIdkROo617YS0YaTKlSAPnV6o3Zm0
         m7F9xWzp/M78/5ah0jriFUyHMEvRQqD1Qx4lU0YyKbsSoYuuFPaSVTxfjRt5r7cprudm
         qLFq4vC/N/MnuXpmCqAc53Rvp4oeoeaxPR3B/ICuxkfcg6wudZ0W4gw8f4Eh/9znSZ2w
         iwBg==
X-Forwarded-Encrypted: i=1; AHgh+RpuTR2dvJ+hAlBu2z4oZd0/gT0FScE3iAy4OyVcSMNIh5tAiWSiRG+gxvSYP8EHoP8nolazzcLUe+Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxY8Ju1hL47YKN7JPqyX0beFzqPmPeY8T8HnNIZLenn/5LITexJ
	uwEMW9f3PfjNgjVUm/b5+k0dZ+byx7Qxz4Eo2tOQqhujlQ2p2WV0KnN6
X-Gm-Gg: AR+sD12RavatVB15hWBjh1n7+xTtWP+cvxcEPq15fSLwLfxUwCmWLrmUtdzsmFTGuTl
	IezE5h35TsY6YxZLrS+AgLROyQPap7FWSTlIs5qk10RKseIa+KRK5dFJrpC8ajm0/W3aHJNizXe
	XNw2gmE93fCsrTOMKq1QoIqGeH0ADMS6i9vm0+GWEm8Gdxa/iPml7ikw/v6Ca79SB/escYj4pxm
	l5/W0EfMk2+wkp5MNsvEErUh/OpZup+ZhMGs2+h8CglTO7VPQCYFS6JVWL6M29jl3zlX0Xlk3OV
	Nu1l9pBCtdtA+6CtSSq+YGx6FfbjM4PWMdA+PsO1bA9nw4JIYdeRuSmi6dgUZ1HJnD+32Bp8eCf
	9aGerLtg13Jbo/zJZ9pRW48igXpuFIT7UVweaEeeerTGEgHScgvWOQOjP0dN7EpkvtRywFGpqhz
	rQCjMw6xah4LOTs1Y=
X-Received: by 2002:a17:902:e843:b0:2cf:dc6f:cc42 with SMTP id d9443c01a7336-2d00f5da251mr7142445ad.46.1785184287499;
        Mon, 27 Jul 2026 13:31:27 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde59b768sm41551805ad.4.2026.07.27.13.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:31:23 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 08/64] dmaengine: imx-dma: flip per-chan tasklet to dma_chan BH
Date: Mon, 27 Jul 2026 13:28:36 -0700
Message-ID: <fbe4067de02f050d3b2f958b3a04dcef0549b6f6.1785183549.git.allen.lkml@gmail.com>
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

Replace the per-channel tasklet with the shared dma_chan BH helper.
The handler continues to run in softirq context while dmaengine owns
the common scheduling and teardown mechanism.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/imx-dma.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/dma/imx-dma.c b/drivers/dma/imx-dma.c
index 81c6276436f8..3ff0bfbfa5ff 100644
--- a/drivers/dma/imx-dma.c
+++ b/drivers/dma/imx-dma.c
@@ -145,7 +145,6 @@ struct imxdma_channel {
 	struct imxdma_engine		*imxdma;
 	unsigned int			channel;
 
-	struct tasklet_struct		dma_tasklet;
 	struct list_head		ld_free;
 	struct list_head		ld_queue;
 	struct list_head		ld_active;
@@ -344,8 +343,8 @@ static void imxdma_watchdog(struct timer_list *t)
 
 	imx_dmav1_writel(imxdma, 0, DMA_CCR(channel));
 
-	/* Tasklet watchdog error handler */
-	tasklet_schedule(&imxdmac->dma_tasklet);
+	/* BH watchdog error handler */
+	dma_chan_schedule_bh(&imxdmac->chan);
 	dev_dbg(imxdma->dev, "channel %d: watchdog timeout!\n",
 		imxdmac->channel);
 }
@@ -390,8 +389,8 @@ static irqreturn_t imxdma_err_handler(int irq, void *dev_id)
 			imx_dmav1_writel(imxdma, 1 << i, DMA_DBOSR);
 			errcode |= IMX_DMA_ERR_BUFFER;
 		}
-		/* Tasklet error handler */
-		tasklet_schedule(&imxdma->channel[i].dma_tasklet);
+		/* BH error handler */
+		dma_chan_schedule_bh(&imxdma->channel[i].chan);
 
 		dev_warn(imxdma->dev,
 			 "DMA timeout on channel %d -%s%s%s%s\n", i,
@@ -448,8 +447,8 @@ static void dma_irq_handle_channel(struct imxdma_channel *imxdmac)
 			imx_dmav1_writel(imxdma, tmp, DMA_CCR(chno));
 
 			if (imxdma_chan_is_doing_cyclic(imxdmac))
-				/* Tasklet progression */
-				tasklet_schedule(&imxdmac->dma_tasklet);
+				/* BH progression */
+				dma_chan_schedule_bh(&imxdmac->chan);
 
 			return;
 		}
@@ -462,8 +461,8 @@ static void dma_irq_handle_channel(struct imxdma_channel *imxdmac)
 
 out:
 	imx_dmav1_writel(imxdma, 0, DMA_CCR(chno));
-	/* Tasklet irq */
-	tasklet_schedule(&imxdmac->dma_tasklet);
+	/* Schedule the IRQ BH */
+	dma_chan_schedule_bh(&imxdmac->chan);
 }
 
 static irqreturn_t dma_irq_handler(int irq, void *dev_id)
@@ -592,9 +591,10 @@ static int imxdma_xfer_desc(struct imxdma_desc *d)
 	return 0;
 }
 
-static void imxdma_tasklet(struct tasklet_struct *t)
+static void imxdma_tasklet(struct dma_chan *chan)
 {
-	struct imxdma_channel *imxdmac = from_tasklet(imxdmac, t, dma_tasklet);
+	struct imxdma_channel *imxdmac = container_of(chan, struct imxdma_channel,
+						      chan);
 	struct imxdma_engine *imxdma = imxdmac->imxdma;
 	struct imxdma_desc *desc, *next_desc;
 	unsigned long flags;
@@ -1142,7 +1142,7 @@ static int __init imxdma_probe(struct platform_device *pdev)
 		INIT_LIST_HEAD(&imxdmac->ld_free);
 		INIT_LIST_HEAD(&imxdmac->ld_active);
 
-		tasklet_setup(&imxdmac->dma_tasklet, imxdma_tasklet);
+		dma_chan_init_bh(&imxdmac->chan, imxdma_tasklet);
 		imxdmac->chan.device = &imxdma->dma_device;
 		dma_cookie_init(&imxdmac->chan);
 		imxdmac->channel = i;
@@ -1211,7 +1211,7 @@ static void imxdma_free_irq(struct platform_device *pdev, struct imxdma_engine *
 		if (!is_imx1_dma(imxdma))
 			disable_irq(imxdmac->irq);
 
-		tasklet_kill(&imxdmac->dma_tasklet);
+		dma_chan_kill_bh(&imxdmac->chan);
 	}
 }
 
-- 
2.43.0

