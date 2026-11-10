Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316554;
	b=vQWDjSjV5SvqfVI1CW9URvgRy2p5Nt4/14yUhBiCx+c6rLk9ns12n3b33a8XDXWaspVA
	 LAXKikzvaivpoB5L78Eidh0mEWQLOSrRW47UMPsZ4QgFO84eVn9pqOo70JCCE245tn8n+
	 z8ELkWCmG72QyK6ZxwKqCxQJ1SuoMFaHWP/ouUeCVMhZoBH/KvOWP9jOvjwobcW7j+Ib6
	 LS3JpTwO+x0epVnA7pgANQ9geSyec5E5qzAj8aWHIjyWy3FU7bp1kCQX3fOY2d4noR3re
	 taIsjxshKy8ziVCxfPD4NYCY9jYuKuSwNObvLbAWlAvFo2YxHHcI1FMJ03Nr3cXfC8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316554;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KWMIZLeeMFs1toVNbHnIwaIuja67UMsXw+1FYa/JCeo=;
	b=MLAiqvTnymnUG5B6tvEwB9meFuxoO0N7XWZZaD6zpW+F8yByGY9AtkB9QWIsE50IHX/n
	 vCRU26hmV3vWvEbb8dPqa2sD8qnIrG8JqEPPn36o1DUF5wfvmk+e4h5LUR+lx69Tm7yZr
	 JFt2no9zGmbmeaEtaGHLVokVwEkN5L2KVVyB0gySkwCD7Xb59hUGEQEeWyGzr3Fm6XZ6C
	 yGeLSvlJhb1cn+00gT81JZNymeNr28hQ7P1rgvCW1xzCwEgQzvjFdEpA1NkStvQNzPwY5
	 8k1vyCn4xo1Q2GNWlDrvzCCh5QJarNQ5LkSGXrUyCLcyVHfnWvbDfbPNMXGCptqbm9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KsJ25AXr;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919B360A260F
	for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 13:15:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 919B360A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KsJ25AXr
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cdb2e0062bbso755120a12.1
        for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 05:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316554; x=1794921354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KWMIZLeeMFs1toVNbHnIwaIuja67UMsXw+1FYa/JCeo=;
        b=KsJ25AXrsSWkxSwuJGjB9hHCi5tDaW0AfG9/2gz9Ol7P/hU/030sXpLllJTAt0cLGg
         eBj/8MifwHI2osy9l2IScRiXmFkSdV6a7btdxW/fOVmQj2OFH/Vn4vSKQw8thjobPAIA
         X07cltLw2Q9a+3kGu5dcuJ7JIEXRD25U0BQmE+jAofq9LgOXSHH2Xh1LSO7y9nLWqzm+
         GgFFrXKz2x79rFl0YjcxmtxJg5p3fNaK1rKzYhFl6yqUsomB/NJmrJ63a4W8E4mce2tt
         rxrVYQbeZNMku3I4l4U9LjlLaWltPGCQDbbrJpVhNM4PJp2yygz+Si92seoOYIbOnvPc
         K6Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316554; x=1794921354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KWMIZLeeMFs1toVNbHnIwaIuja67UMsXw+1FYa/JCeo=;
        b=CLcqxCg82gonGNeaDzw8kkJ4R3VN0KLJuNwxuMVnA17wFpx8LEJME7lOoRa0tuFuqA
         c9lET+s2wO3UMbXPtGt+yhHd+VJYWQ9CwS6q+2D9jmc1TFatvb9nMRVsBtDLiZw+M52z
         yA+f51ZeG99hP2C+SXK4dSj3btogpSznl6FWO7qLKQY8zsnV2BMxzJpqy3xxkmXiygEK
         PLqWAfKxj7Z5nafrp01E3MD9aDddf+LLhVz3nZri36pfb85HHf+jleqblXapaLzkzixE
         nNEV8OBa6Klkfq1sfYiZBsuoK/S4bxv+KiMzX3IRfkDyYXOmob1KYGfE/zWLHvcmFrUx
         LT8w==
X-Forwarded-Encrypted: i=1; AL+hErFmgh1tDTktKh3ARCmb/yzAqxip9UKx9JIVMYryw7ritbsswX/5edlOMAMBx95FkFXf9ZpP5/xsuBg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WpBfnMG5wq3of/XlbGXQALwlf7i56xGIxlzLVljRsyN12BG1s
	11lgzXmx9ZCjHiXkR5HVsAKDrkaoEXu38yv4ZX3lJjFrOAHVMPAIx92p
X-Gm-Gg: AYBFou0kGNOpJHILDkXLzImPd8dlf3QdVLRGwpNgMeLxL4pX3G9tGn+UozkSnEsxSFa
	0wYj87wNY0Zwc2EMXQLdNnzIej+fzVrvHg26qCYMY0rIG+kNUBT15rUsPlzrb9vCx4Rf8RxyEM0
	w6/5k1wu0KPSNMvJzJPveYf2BBqYWxUOWRnzXCJS8czqtdPTM3WZjV6hO5Pu9rbcI6pLK+TmNkA
	BoUGDICfT6z+5W59/nqZCBXNO5H70WQKI3gH+5pqvMD+rV3RWTrB03sbmHeZdTabVyvCk+RiDqq
	1FTQUvkyQvvMLtWl2f2eazkoTBlY89eK3I8rfyQuuofe2kxXQeKgtb/mt+0k8Ef4MO8l8MGhuLp
	nkdIQsqioEWKj8oCuYsUsZ1Qbf7qo+HJkqTVHHHAlbLPULkmXqBLHD2HFk43hWkX4dDGlrNM2rc
	YjBGiK26K9ltGoPUFyqfCLw9cGSgI4xnFNQPCE2Hc48qRVVcvBlxpPq+5I4OHrq6JfHVa/IRlHf
	9S2QI/NMfZ4UGEnmeDeltJAvSMEhz3LWY8BtJk5bMHebm7RETwKfLZKCmQSMGsMOPvtWXO8ruUz
	DteeLc6psEnFywNUuYmBBV606fz9GwAm
X-Received: by 2002:a17:90a:e7d2:b0:3ab:c80:9365 with SMTP id 98e67ed59e1d1-3b166d11497mr2661682a91.42.1794316553404;
        Tue, 10 Nov 2026 05:15:53 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:15:53 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>
Subject: [PATCH v4 05/33] dmaengine: ep93xx: hook callbacks via dmaengine BH
Date: Tue, 10 Nov 2026 05:13:05 -0800
Message-ID: <b5d5937dc553fed9b30127ce3ce898b89cddea02.1794315350.git.allen.lkml@gmail.com>
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

Replace the per-channel tasklet with the shared dmaengine BH helper.
The handler continues to run in softirq context while dmaengine owns
the common scheduling and teardown mechanism.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/dma/ep93xx_dma.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/ep93xx_dma.c b/drivers/dma/ep93xx_dma.c
index 8a0b66a7d886..b073d9164e83 100644
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
@@ -796,9 +794,9 @@ static void ep93xx_dma_advance_work(struct ep93xx_dma_chan *edmac)
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
@@ -853,12 +851,12 @@ static irqreturn_t ep93xx_dma_interrupt(int irq, void *dev_id)
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
@@ -1414,7 +1412,7 @@ static struct ep93xx_dma_engine *ep93xx_dma_of_probe(struct platform_device *pde
 		INIT_LIST_HEAD(&edmac->active);
 		INIT_LIST_HEAD(&edmac->queue);
 		INIT_LIST_HEAD(&edmac->free_list);
-		tasklet_setup(&edmac->tasklet, ep93xx_dma_tasklet);
+		dmaengine_init_bh(&edmac->chan, ep93xx_dma_tasklet);
 
 		list_add_tail(&edmac->chan.device_node,
 			      &dma_dev->channels);
-- 
2.43.0

