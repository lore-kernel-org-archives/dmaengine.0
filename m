Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74CC63F58D6
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 18:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786385497; cv=none; b=OWKzAXmE99lj1sOSssr5kbRcUoLrNQmQjmjSw5cO+c3BqmiMDTUs0SXmc0rPbbDS18LJE8WaOV7bfLVIbZoNSPGpj2c9v+KlIYgUuj1Zv2LXygYoCTig5Merh0bzkEMC3fK3Zi+U6F9bltstroXzxR13JPYQqzD6UVSmTgj+L9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786385497; c=relaxed/simple;
	bh=yNW/T5FeMOjAddNqHQhDND7Stuqs/EAs9+VIYXSqtKY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gLEl4D8jiRFQ5ThMsTF2/eZQ3mXqs42eWl7GOP8GT4NNqQ0mMsaIJxLOuMg90C0jcTa9nqtC/Rfz3ipPb8dQ8zhenRy+PXhhH9keRLoLLO2a2k+POOt/1Q8Il2qLoLg2p9QumOb21MI5j75CdcRVFwsCEq0Zu8sZ1f8mHIeygmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZecYkWU1; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZecYkWU1"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38f620399a0so1708a91.2
        for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 11:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786385496; x=1786990296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZhvQ0nLd8X2lUGK/yPjcMAYgujrbK07Er9DeXa2ehmE=;
        b=ZecYkWU1MxBukIQvCzrv7c+Fc442qKLxNtVvVNzflJVzMj+8Lh+YGRcu/aTk7FjxJK
         JynUCTiqDscc6Nf+GfyTcg1jYAhpDHVy/duYp67gQOMvqNoTJlmdFZGdzU6lf+3nzPFS
         m9wQlAQVZdrTV7oUVaFbjt6j1w2cH7R/sc022TVXDPDXeKO6nTz51ntWLpqunR60vlXA
         lw0DaKmvwdyRmz0xu1Ivzu+Ge7rVc9wkCbQM889CPrdPkJJ4kEW0Vlly74uwP6HhwbBQ
         VD3LNPKIQMtBbqDcDf2iuAJYP8LwgLNEd91LKbXeD9yhtZqX4Y2CUT6INl2sRKdXPEs1
         QgFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786385496; x=1786990296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZhvQ0nLd8X2lUGK/yPjcMAYgujrbK07Er9DeXa2ehmE=;
        b=gFNjoPhEopgqHQc7s+9AV4rDDIkaztzsQKo/tAOc6uZinqnUWcMCKkskCCiMQ4+PcJ
         FAu7X3zzzCSjNM0W+AEVjK5DxGvcqayvsEXpvmgqkpAesxes2VMddDWM2g0xEOa3eVw/
         b/Xrl8d1dDYbwntDoEIzFOtB3GD9Fjqxy2BqvU+EvYNG86fEKleejGWk3hAjrSmUet8H
         exei9kUdnFLfmd8DzKMMs1ZWamC/tkFxRUKviKfBIAivsbocpm3LxtSQ2Ud0083lwDpO
         Gd83cQbZFb3MUwA6iq/Y5jUnduO+NrKGWu1rUxjEGRP5+rZGrla2AjjJYAwOBorsngya
         cIow==
X-Forwarded-Encrypted: i=1; AHgh+RrXF3utEushdGm2qSiUqK+N7i5bPJbWSO+p4fcm0dT1bx+Qo7Y//oUjN2w+5s8+FQpUCC2zqi5PtuE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxE6uum5ZyGQCMCBsSW8oOp/I2Eyewhz83dotd63jVLApqTmviJ
	Jb1JSVbQj34lIE839o+U7WYBU8EETe+PLHbsWp8yNqPY1IXGHzaNa3Va
X-Gm-Gg: AR+sD12GKUT32IfD/dKigueP0tGTMswiAJW6ooONF2Ht2iLu8TNtxjWes7byhOTcX+R
	41bkGBREHT6utnTtw0QqpWP4uJednrsJ1xPE76iAPuCCJxaM/TIqcS/X5KboHN9VN0LnGWwruEG
	6o7Gc7DW8bExW128kR3i3p1RyftKAB9JZttEkFP//ReN+UU+Zra01lfkInpdMI9gyliHCCzUmXO
	J/1h7aGXsOMyU2eEOSwnIvQBCzJMf4L5DFdbvugmTIQ6Jt2/8mHpb+0VYW+LXtICsCtMarIwd2E
	E4Vnu/JvEPUrIYJfRokocuDfC5kpulDgIai8do64Y7A4JV+cfC0Bd8cRURirRy8LxicHLiUrs85
	ow2pxII1OdTYMnFgQP/ZEwcOiJ+9tMUYEO+iCh66MXhckMToBCGwTNzH78aZ/xtMFsBC7mkJfyg
	XDeIhMMbA6XMsetdhahAItPaH4CryGbzxc7t5oBinyY5/KTFd4DGaSpH5Ien0Ql5oz/8I+WQA41
	g==
X-Received: by 2002:a17:90b:1811:b0:38e:c7b0:84ad with SMTP id 98e67ed59e1d1-3903bb0ab77mr40673994a91.0.1786385495692;
        Mon, 10 Aug 2026 11:11:35 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fa9:fa00:b1a9:6513:83c6:1d23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d53b873asm472795a91.17.2026.08.10.11.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 11:11:35 -0700 (PDT)
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
Subject: [PATCH v3 08/34] dmaengine: imx-dma: flip per-chan tasklet to dmaengine BH
Date: Mon, 10 Aug 2026 11:09:09 -0700
Message-ID: <787938bdaef4c3530b4bf0296386a33928b877f0.1786384168.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1786384168.git.allen.lkml@gmail.com>
References: <cover.1785183549.git.allen.lkml@gmail.com> <cover.1786384168.git.allen.lkml@gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the per-channel tasklet with the shared dmaengine BH helper.
The handler continues to run in softirq context while dmaengine owns
the common scheduling and teardown mechanism.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/imx-dma.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/dma/imx-dma.c b/drivers/dma/imx-dma.c
index 81c6276436f8..308fe407fe16 100644
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
+	dmaengine_schedule_bh(&imxdmac->chan);
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
+		dmaengine_schedule_bh(&imxdma->channel[i].chan);
 
 		dev_warn(imxdma->dev,
 			 "DMA timeout on channel %d -%s%s%s%s\n", i,
@@ -448,8 +447,8 @@ static void dma_irq_handle_channel(struct imxdma_channel *imxdmac)
 			imx_dmav1_writel(imxdma, tmp, DMA_CCR(chno));
 
 			if (imxdma_chan_is_doing_cyclic(imxdmac))
-				/* Tasklet progression */
-				tasklet_schedule(&imxdmac->dma_tasklet);
+				/* BH progression */
+				dmaengine_schedule_bh(&imxdmac->chan);
 
 			return;
 		}
@@ -462,8 +461,8 @@ static void dma_irq_handle_channel(struct imxdma_channel *imxdmac)
 
 out:
 	imx_dmav1_writel(imxdma, 0, DMA_CCR(chno));
-	/* Tasklet irq */
-	tasklet_schedule(&imxdmac->dma_tasklet);
+	/* Schedule the IRQ BH */
+	dmaengine_schedule_bh(&imxdmac->chan);
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
+		dmaengine_init_bh(&imxdmac->chan, imxdma_tasklet);
 		imxdmac->chan.device = &imxdma->dma_device;
 		dma_cookie_init(&imxdmac->chan);
 		imxdmac->channel = i;
@@ -1211,7 +1211,7 @@ static void imxdma_free_irq(struct platform_device *pdev, struct imxdma_engine *
 		if (!is_imx1_dma(imxdma))
 			disable_irq(imxdmac->irq);
 
-		tasklet_kill(&imxdmac->dma_tasklet);
+		dmaengine_kill_bh(&imxdmac->chan);
 	}
 }
 
-- 
2.43.0

