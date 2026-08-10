Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17A7386C1E
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 18:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786385487; cv=none; b=JgraGiwHFLFgm1l7S1QjWvPw51nn6vcb8mMoreFttuGHTq7U/8YnNnowGxSEtCTDob1rHa3OF3UKSfURhlkDsO4AL7Ga4sVbtF4Pm8bgvA/klw3R1QyepqFHOrN1sDCz6/30PpKJ4YWw7ozijpD2OKnSHBQeyir8cLPEdRtxJ5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786385487; c=relaxed/simple;
	bh=g3kQp8gGQiIXrYX4sT5ueXQYYRV5nEUtIvP3IlYpajE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sIQisGrizq15BNGmFEG5Kaz5lAKRthFAYPq3lxqYi/q28GeYDoDq+IgD0okO07w4YQP/v2k70uFtCjWQfPL0C9ThnF/LVB277uZTzaWBBlZNQt263/rC0I8KHLcP81gzlaXaL4LdCwonB9ow21wVSSRhJgfmqiaO2ywtScEqL78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TMrFm5ig; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TMrFm5ig"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38e07ebd263so1568793a91.1
        for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 11:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786385486; x=1786990286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L4Ymzks64fAO1V7KVTcq+phPVKZh8xNyMzo6gAaHxVg=;
        b=TMrFm5igAxgUXEyF3crAOJUjARaz4bTWF6sME7E4M5QIWqIgcm+rGYzC1m09vFTDEI
         dS/k5LlMQ1SoNUneKEN09KjHFMUjBieXy/2OrmhdGVC2R+05kvpEzrLYY8WHcjnOyXV2
         EjAgWOB4w8rrvV3tqBXcKUH9KErHX2YLID7y2/WQkMlAP5L30exXvMDvZLF8+k8oudZT
         IkVr6DiO/YcD2mC4USrEKkCcKsJTDkvTQIuEJUccDICb/Iz3PVvkcwN+s9K2xL/8hEyV
         xzOWJ+g5bNMNlxKPh35FnVDRwP6fP5URAI8bcu5NENSNL7DzMIBYY1tDY8NDi92BvI8b
         Prhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786385486; x=1786990286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L4Ymzks64fAO1V7KVTcq+phPVKZh8xNyMzo6gAaHxVg=;
        b=YIrs1myrs0SIb/RClIIQRmH7FMC2+BDtKNMi1XhA06nSmSn9lFn0WDH4HjQ7mT3pgI
         y2qUnESy12ICOkHyK5KpCn3TxMplpIngQckdWXWg1ijlnBaX1D+oAape+/6JP43T4O8o
         iX4Ddvst3hV5KS8GyOYCee6nsPR3fCX4IlE3WbH7ygPujuJFMHYaJSH/Rp2f5ZSCtAje
         9HVEdWy+YUjg9EDaWhe2IUxAQ/p8QXIlw3X0/SawP7Jcc6YPvbrPaVd2kQyPVkomTh2a
         fQEdIvNZb1l9995pQI1TTLgBe/WGtJsisoTxgAcp3OhSUAqWQiEibjhx3oteNg6iTxpG
         eLZw==
X-Forwarded-Encrypted: i=1; AHgh+Rpo5EP+dm7GQ7TtEVruMX90N9l8xvmgZzsvPZ5do9A8xD7cnIQSLSsPNOzRxAyGqIDJooOqsrt7Aro=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlriHanxse2Abor75d4mRPr73JxN7TZWIDRnFuV3eWPlJWzCDu
	l0HZEgOSqMoBCt4jJsLfz/1v0KWY9swcEmoFBgzoi8ypZhz9+Lz1zjkp
X-Gm-Gg: AR+sD11FTfAUn69/7kLBh3NP6Kb81DD0lBYWNvdcrZwAG9TMBPmvwx6AVvhwDrk7OkM
	jv9hDr9zM9aQOQvks00M0Sxcdw8AsrRD6MRECWiKCn2EOntc+m/ZSuBP3DKDQhUlkj1zKEYNL77
	3Ab7RKqZPQEVy4L03Wxs5reMUoZdyPe/ucTxZf8HXdHKMEcni6X2upTU7JErgnjWNjchNJyyD1P
	fYK0rtpZRNXuRxZ1Y10BXBgAxYK6jF9UftIRqp3KpfMzoxZH55YKda/GSo3q8FQO5JrTOi9seIt
	xm7HUpCyTcALps1sBkrvSp8gr3ZDmVNY/8TrKtAIVff8pPY/2t+oFwA2+e0GsIYiT1Tj1NgouVN
	cB89xa961fd9zveyCzZBJfPhT5PvjIWEoV0Yvm0w2ty67qxVcy+GqQ3zNRXhUQuBIOw65dOw7L2
	tjQiC38TNF/tOvOOOZ3DoXIZJ2lAxlPvcNQqxQoJfovqxAjWCh1k5jj3E2SkRo3DM=
X-Received: by 2002:a17:90b:2b8e:b0:38e:2e86:ed02 with SMTP id 98e67ed59e1d1-3909d8c5a4emr31571301a91.14.1786385485962;
        Mon, 10 Aug 2026 11:11:25 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fa9:fa00:b1a9:6513:83c6:1d23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d53b873asm472795a91.17.2026.08.10.11.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 11:11:24 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>
Subject: [PATCH v3 05/34] dmaengine: ep93xx: hook callbacks via dmaengine BH
Date: Mon, 10 Aug 2026 11:09:06 -0700
Message-ID: <69b17379bf3c78b6af96dbe3b76940520d491417.1786384168.git.allen.lkml@gmail.com>
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
 drivers/dma/ep93xx_dma.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/ep93xx_dma.c b/drivers/dma/ep93xx_dma.c
index 311e55a97ba9..d79e278fb7ba 100644
--- a/drivers/dma/ep93xx_dma.c
+++ b/drivers/dma/ep93xx_dma.c
@@ -167,7 +167,6 @@ struct ep93xx_dma_chan_cfg {
  * @dma_cfg: channel number, direction
  * @irq: interrupt number of the channel
  * @clk: clock used by this channel
- * @tasklet: channel specific tasklet used for callbacks
  * @lock: lock protecting the fields following
  * @flags: flags for the channel
  * @buffer: which buffer to use next (0/1)
@@ -196,7 +195,6 @@ struct ep93xx_dma_chan {
 	struct ep93xx_dma_chan_cfg	dma_cfg;
 	int				irq;
 	struct clk			*clk;
-	struct tasklet_struct		tasklet;
 	/* protects the fields following */
 	spinlock_t			lock;
 	unsigned long			flags;
@@ -801,9 +799,9 @@ static void ep93xx_dma_advance_work(struct ep93xx_dma_chan *edmac)
 	spin_unlock_irqrestore(&edmac->lock, flags);
 }
 
-static void ep93xx_dma_tasklet(struct tasklet_struct *t)
+static void ep93xx_dma_tasklet(struct dma_chan *chan)
 {
-	struct ep93xx_dma_chan *edmac = from_tasklet(edmac, t, tasklet);
+	struct ep93xx_dma_chan *edmac = to_ep93xx_dma_chan(chan);
 	struct ep93xx_dma_desc *desc, *d;
 	struct dmaengine_desc_callback cb;
 	LIST_HEAD(list);
@@ -858,12 +856,12 @@ static irqreturn_t ep93xx_dma_interrupt(int irq, void *dev_id)
 	switch (edmac->edma->hw_interrupt(edmac)) {
 	case INTERRUPT_DONE:
 		desc->complete = true;
-		tasklet_schedule(&edmac->tasklet);
+		dmaengine_schedule_bh(&edmac->chan);
 		break;
 
 	case INTERRUPT_NEXT_BUFFER:
 		if (test_bit(EP93XX_DMA_IS_CYCLIC, &edmac->flags))
-			tasklet_schedule(&edmac->tasklet);
+			dmaengine_schedule_bh(&edmac->chan);
 		break;
 
 	default:
@@ -1420,7 +1418,7 @@ static struct ep93xx_dma_engine *ep93xx_dma_of_probe(struct platform_device *pde
 		INIT_LIST_HEAD(&edmac->active);
 		INIT_LIST_HEAD(&edmac->queue);
 		INIT_LIST_HEAD(&edmac->free_list);
-		tasklet_setup(&edmac->tasklet, ep93xx_dma_tasklet);
+		dmaengine_init_bh(&edmac->chan, ep93xx_dma_tasklet);
 
 		list_add_tail(&edmac->chan.device_node,
 			      &dma_dev->channels);
-- 
2.43.0

