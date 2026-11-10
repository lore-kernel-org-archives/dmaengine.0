Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316631;
	b=s1MPC1XXu+x+nB5aF+F4jaKZvctzaXdXy7iQF+vn8pB2qDpvMnRGOxnH7IGqXKP78Cnt
	 UbbamgQZjnohtpVy1A6HeJGfl8E8VdZRIrztyIJQ55C/rwPJ/A0PkUFUBjdx9Zlyl1JUj
	 oSrXcrfD2wylty4kOt3oMVBI9Wf7IEjwzAgZUdFT7qKJsXg4bWBwSRtCnubRuUKWb41iy
	 ATNhaONNdTH7N44JbOjqgAiI0KHAiaKm4Xt4NnaqbHYRHpCVMlcgpoe50SNRtZh8kj6uN
	 ndcVLNjRERv7L3a/YZOUjNXQ995JqT5freLSQDaSAN/B7pe25q93q9HHnMCd7snlY7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316631;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mQpYBoUkzC/8SCTUHySkHk/Y3ystrO8zczp3tQ3CUnY=;
	b=xUhPB1QvWmgHbh/6zZqYb1JDNSsyI0A5Q1eyRezAuNeXMgDRKlvqqZr8E6fmGJqPi+cL
	 tHFu54VgjoXwptcYlW9bteMrB3xjrZdlEj6nHStmcE46ECT7GNZ9eSYt8iv3FJk0g3j4p
	 +TX7YaTC/CqvZbDESBPx1jvCoHU0RLEzpPH19KNGNfyYI7Nt4JcrcWIIeF3RwF3QCPxNP
	 h08+RWmpLotKfp/JgvCUEVKgXiJNh2vDQbRuyXC2dIHuZvx4qbay+ZXAZGtx4nhDqZVzX
	 h6dUUVb4SA8pH1Rxd1Gl40qSGpNvuB6MuDPNc8hBmnDYxSgYEZi4pW56rYi6uvZzl0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FZAQxtc9;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9439860707A4
	for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 13:17:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9439860707A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FZAQxtc9
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc4aa0246b7so754099a12.3
        for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 05:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316630; x=1794921430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mQpYBoUkzC/8SCTUHySkHk/Y3ystrO8zczp3tQ3CUnY=;
        b=FZAQxtc9vnpznm7RKJSLf+NOe3hcXZrXKDquJl32G8Aic6Hpb5dUVmnTZGQfnfqsQ4
         A5N+Hnk5FgL+P+uIEVGc0fenBNSLPSYsujyjQiRsNJo7eS49QIY7UDsgtC3N9DnZ0WOd
         h1nY3vbDcbPjFLzcBmJr1ybYkHSqy4lHEMhXBe5bg0kiaVCUPzjjfSxunqgtRH72qD4p
         LUrrV13aTnTPF+tAJ1xAlKUbk3gVl64p2Y3hf/vQzd1xtCPIvUToAP7nwpqra0Szst25
         o7Hzps7tsNlXiLQ8OJa3SEFmzYD3jx8l8qphRW5C66FfVcFy/7jlK7Y+TAmXKKUfcK3u
         5h/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316630; x=1794921430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mQpYBoUkzC/8SCTUHySkHk/Y3ystrO8zczp3tQ3CUnY=;
        b=zyvFVwU3VGPYqtknavE5BnL58WsXaHft0NAFbbeVZTAnYtCcK2+oB4fhmSoOaTmHhI
         7HbTFzBNWyoZcm6x6inoibrW0SUdoD586XXNtNPQ2zqRNJiZzAPdi7jyy+ibwrrtJRhh
         QamC7A2HJRxrVnIwMbQyREoLmHKl95WalDKLfU4lEXxcObgktmRqbd4zM3HQAMVpBBZg
         /JQUQFeHGiV67+ITFR7HuZGd86sZomYf/k3gVVFaTwkfnhW8dqDMis8lgI0Ryn/vsOQk
         Ztc2XkHNsL/7cW838q1twyp1236+Cqgc6Az1OnE8SdghmRooJo5Y9C0r7eFJyTobfpv8
         /cBw==
X-Forwarded-Encrypted: i=1; AL+hErGDueyA1dw2mWBuiM2Foq4/gQ5luxOWc2yicS81kbI1bf6yydKOPBfxvcpp164mxnLKBU+kDfUxtT4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/ijsiyWrV6XPcQpIA1KtpabOzNixRAj1xAEDxPOIcsyAYx7mR
	0UjbZP1PiOPeMmir2kLpvZm8ih3g28P+TgLwKgx4LlzOHSJht5+kEMJy
X-Gm-Gg: AYBFou3DfclfuGnn9H9LZsreXvKJTh5kZ034GYxLlaXtLOVJyBwfnTWta9zOX18TOsj
	MlZ+hAVNLBnqeEylONiv0iu8ZnDnAagkuEhPrFzWhXEo2rOPu+nr+3ICR1t4j+jyU4Yini62+Sp
	T/CJFdtYqyKF9q6UztXg/v5Ki2MUQqLs75JRviEEQU5OX6nyFZnzz1t1Cgmm7ejMO7HW8Tz4Bjw
	Q7Ldc0QVKsT170OTnl0vreVIEMvrG9xvK6Vs5qYw2ZxG9zfu2bbjIFlxI5dnBaFN175xwCPnduA
	i6rMm7WS5ixCFCKSPy/FWI78tSq+UScT8YGli404zd5pVRWnh2LA1tEatMVa0pr+2hs/nyXr3RE
	hSwGFaWPSaa8jjqeyLinNt/MtyzPole1zagFW+4CmqZDm35MYf5pPUGOUzhbUZCbEk8ZyKrXGBa
	VyWwmSi8hhQBIunf2Ey2ZdJqvVN6Nkjc7Om6xlkHhROKaU0S3uBsqMNFYkVwJDgSPDY10QV/BIm
	F8csAMsSsfnGan0m3ioTld4krCsMgB4P+vmLRX/iNacdvp9nVrCOHutmxm/ki36t5/Tp5AeTBPJ
	M3OO7q847lYdBIVeIu0nsJxm5KBv1xY=
X-Received: by 2002:a17:90b:540b:b0:3b0:db75:4bcf with SMTP id 98e67ed59e1d1-3b166d049famr2592552a91.42.1794316629958;
        Tue, 10 Nov 2026 05:17:09 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:17:09 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>
Subject: [PATCH v4 23/33] dmaengine: timb_dma: route callbacks via channel BH
Date: Tue, 10 Nov 2026 05:13:23 -0800
Message-ID: <e9f90c61446942c160480ee81e220869de918105.1794315350.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794315350.git.allen.lkml@gmail.com>
References: <cover.1794315350.git.allen.lkml@gmail.com>
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Schedule per-channel BH work for completions so callbacks run through
the dma_chan deferral mechanism while keeping the controller tasklet for
IRQ handling.

The controller tasklet recomputes TIMBDMA_IER before the deferred work
has finished the channel, so have the channel BH recompute and rewrite
the mask once the channel state has settled. This keeps the interrupt
enable mask consistent with what the single tasklet used to produce.

Drain the channel BHs in td_remove() and in the probe error path so no
completion work can run after the controller memory is freed.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/timb_dma.c | 41 ++++++++++++++++++++++++++++++++++++-----
 1 file changed, 36 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/timb_dma.c b/drivers/dma/timb_dma.c
index 0acd7a36a3d0..d24508e2a0bb 100644
--- a/drivers/dma/timb_dma.c
+++ b/drivers/dma/timb_dma.c
@@ -433,6 +433,8 @@ static void td_free_chan_resources(struct dma_chan *chan)
 
 	dev_dbg(dmaengine_chan_dev(chan), "%s: Entry\n", __func__);
 
+	dmaengine_kill_bh(&td_chan->chan);
+
 	/* check that all descriptors are free */
 	BUG_ON(!list_empty(&td_chan->active_list));
 	BUG_ON(!list_empty(&td_chan->queue));
@@ -575,17 +577,42 @@ static void td_tasklet(struct tasklet_struct *t)
 	for (i = 0; i < td->dma.chancnt; i++)
 		if (ipr & (1 << i)) {
 			struct timb_dma_chan *td_chan = td->channels + i;
-			spin_lock(&td_chan->lock);
-			__td_finish(td_chan);
-			if (!list_empty(&td_chan->queue))
-				__td_start_next(td_chan);
-			spin_unlock(&td_chan->lock);
+			dmaengine_schedule_bh(&td_chan->chan);
 		}
 
 	ier = __td_ier_mask(td);
 	iowrite32(ier, td->membase + TIMBDMA_IER);
 }
 
+static void timb_dma_chan_bh(struct dma_chan *chan)
+{
+	struct timb_dma_chan *td_chan = container_of(chan, struct timb_dma_chan,
+						     chan);
+	struct timb_dma *td = tdchantotd(td_chan);
+	u32 ier;
+
+	spin_lock(&td_chan->lock);
+	__td_finish(td_chan);
+	if (!list_empty(&td_chan->queue))
+		__td_start_next(td_chan);
+	spin_unlock(&td_chan->lock);
+
+	/*
+	 * The controller tasklet re-armed IER before this channel was
+	 * finished. Recompute it now that the channel state has changed.
+	 */
+	ier = __td_ier_mask(td);
+	iowrite32(ier, td->membase + TIMBDMA_IER);
+}
+
+static void td_kill_chan_bh(struct timb_dma *td, int nr_channels)
+{
+	int i;
+
+	for (i = 0; i < nr_channels; i++)
+		dmaengine_kill_bh(&td->channels[i].chan);
+}
+
 
 static irqreturn_t td_irq(int irq, void *devid)
 {
@@ -692,6 +719,7 @@ static int td_probe(struct platform_device *pdev)
 		INIT_LIST_HEAD(&td_chan->active_list);
 		INIT_LIST_HEAD(&td_chan->queue);
 		INIT_LIST_HEAD(&td_chan->free_list);
+		dmaengine_init_bh(&td_chan->chan, timb_dma_chan_bh);
 
 		td_chan->descs = pchan->descriptors;
 		td_chan->desc_elems = pchan->descriptor_elements;
@@ -724,6 +752,7 @@ static int td_probe(struct platform_device *pdev)
 	free_irq(irq, td);
 err_tasklet_kill:
 	tasklet_kill(&td->tasklet);
+	td_kill_chan_bh(td, pdata->nr_channels);
 	iounmap(td->membase);
 err_free_mem:
 	kfree(td);
@@ -736,6 +765,7 @@ static int td_probe(struct platform_device *pdev)
 
 static void td_remove(struct platform_device *pdev)
 {
+	struct timb_dma_platform_data *pdata = dev_get_platdata(&pdev->dev);
 	struct timb_dma *td = platform_get_drvdata(pdev);
 	struct resource *iomem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	int irq = platform_get_irq(pdev, 0);
@@ -743,6 +773,7 @@ static void td_remove(struct platform_device *pdev)
 	dma_async_device_unregister(&td->dma);
 	free_irq(irq, td);
 	tasklet_kill(&td->tasklet);
+	td_kill_chan_bh(td, pdata->nr_channels);
 	iounmap(td->membase);
 	kfree(td);
 	release_mem_region(iomem->start, resource_size(iomem));
-- 
2.43.0

