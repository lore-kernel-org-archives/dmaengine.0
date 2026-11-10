Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316626;
	b=Xe0NDpdKis3ffD9AKJPEHfUQGjWaUCMN0fVpJtQD/qUY06HsGaMOJjRC1WL7EeE+rbYk
	 p3N0DujBOaRv3iBE5u/9s9aaGo1QsPxxKQaTgpI4EI2/yb0nydbpBVdo0LEA4wkrgpzWP
	 6Sa7RZhT8DVqItX6fUv553PCzTLX8oSV0msb8kTm1gS8nqbbv3HurWmPlE3rG0nZqmlH5
	 mmCFJtzpSBnUlmU4Oy6iobv7houWlQZBYsYyhSx9dq1GBQbdaG1G2/IPj9ks3vRjCC/T9
	 rgjtaNsx8KGiHw7tbeadHAT4ZeH83/o+ppik4dpGNEx9x3eXqxWx8MhTkHBj8uz6bsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316626;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UDGEeIGl4cmMHqxG8jYaVJEd+wCk+Kc7q5Dy4Q/P2n8=;
	b=Wyms70W/n3apFH2wcFbAfoB9KmK0nXt3S6FfUyTsS+kDsjg26patlsHe9mdEOOhjnzoI
	 TXDDCG+1yKc7BQhCdhgxXd+4KWBrA7/S3afeGh/lU79AizAG1bRbtItNQjGre2H+oRWBq
	 xTcKZ6xQIzv14k8Q7BteiRtJmfDokBNO9wNeD0IRYcGfelqspNUWr/JdKVfprn6ho0PXh
	 v6LWostU83HTNW9BhYKtyyCYpRrk8JZzIgw34P+FZwajwEax4j1XU+QsaJ5KJ4aTUK5qu
	 95JJ5HIcFakUw7cBLCAshNx6VwgOuM78lY4me800DQSbp48wfJSSB5shjB/W23jGU9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GeLyIY68;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A3C6070781
	for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 13:17:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9A3C6070781
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GeLyIY68
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b10ca4e3f9so1122570a91.0
        for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 05:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316625; x=1794921425; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UDGEeIGl4cmMHqxG8jYaVJEd+wCk+Kc7q5Dy4Q/P2n8=;
        b=GeLyIY680n5wyd98VzItZSPFhXMUnGdWCfjgn9tcV8+ZVZN2feBGHT4rWqw2+lDauf
         ZL7oxHXE4Eh0PxkKpunqWsKm/HAdD91k/0O1/rC9mV8jrWuuPnIrd2+Hl2k55lgAWGB8
         kDTNa4ADeevKTdVnzSb1cPtYe4niHx4+CMZL1h248GWMj+++xDeEPxWDipBdYsmnP+b5
         JHt3CF8hg6Wuvo+02hjmcuXHEfFDzIVW2Zai4DDFNOHYH6Y9qiqIJsQMpVvbjIX0rqxn
         q05i25zyVgPvlQlas7WXwtDvcCBKZzrpwWDvKifvlIV13KK4vlXXSvqyiHgSsPLCCZpA
         9scA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316625; x=1794921425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UDGEeIGl4cmMHqxG8jYaVJEd+wCk+Kc7q5Dy4Q/P2n8=;
        b=qwV29l0h36M3z0W0oyedGy9KD8cw6esojRKnyMtrLZp8ILqfaobbyfV0karSj9QyDw
         zVAKyktn7dZpOuMzURHYwx+1o6vMDLb81qh8TiLyx+tpGmWx1PmwQNrz/fCgiPxJlGIx
         lJ9zD1MjNlMUT/8gk7+QY1Gz3APR8ki2khaANJhL8Sd6xm/L3mCw1zTMQ9evnWPs4vdk
         K3N3rLwYjVSwY9Somcm8jKue1tpNC5y1kJkb0+SoHaCmnzJfpuEffXvS1qWIa7OusKH0
         c9n6Xr4ucw956Pwxkkq6AfVPQ4ipEfVnhV3C4BRBCCTVjTCa83fWwdieSdb4LM26dqn4
         mh5Q==
X-Forwarded-Encrypted: i=1; AL+hErHNvuQP1rLx2eIKCaft35nQz8v5Onbtv3dCuyzitdfaSyMSbp+YJCn4V+t1brKn7TgxN3d9FozP2QQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9GIFUih3vzZ2RvyVMBwm5JDV1j2eOOsTCcl1BylNjlDn/ScH0
	pIRiEAYBO0qunYyhp44CottSrhDUWN34/z1ROxFkcUvGheCuUaHqOiyc
X-Gm-Gg: AYBFou1gRAp1dO6JHJvYN2fQzqMLT4GckWHhj+MiIPnZ6tKz+xy/+67UH0iJ4HhJ65z
	ZFd1Jjerwr3UQsvwFdTtNNSG940iHV7sFpnXJGzGc8L0XXwHg1hYkmuHwDLcHV+Du9PLqnPATNG
	POcThKsdBB/2+bLslt0/FpAl5QNixjaQtk4Z8+6yAVf0vvj1/rU59oj2uYShKH5tLmFLVoz9OW0
	BJmTTjammGr3M8f4upYjIRaNvEvmeasXB+fWAKD2wwnYjF6qHShNDFf7RYLXR+DtoN7UGDt8ngr
	MSDw2iA3yu7qiqMUSpeoNQ9qUlVNGiMoO1WytanHaumSZFnHLRavv+PNdCkj1O3UIyr9iBO/a3T
	k2c5POs1bFiX+Gq1Ve5rdzCRvVZxWHuVzUg+FjE7joOGXtKipmFl1vTOtkuD3dHXrxvd9n/PGiW
	0/Y/GZgPa5pfbAittla94Ec7yNjLmqIIBm9vxAQjRE9j5pcbhc2N8h7v4KdU+nKqfybW0qe49M8
	3ghZ3hgs6hhNLVcEu8QRMG7nvVdGg3gAVqgkC3xlQvC0/UUPVZiz3KU3cjnK/CUnRkO5R6BnzRY
	kS1ijwTw3FsyCcN4/5nVUSx1Y0sCP04=
X-Received: by 2002:a17:90b:1812:b0:3ad:3e8:12 with SMTP id 98e67ed59e1d1-3b166d1e0eamr2281998a91.48.1794316625094;
        Tue, 10 Nov 2026 05:17:05 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:17:04 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Golla Nagendra <nagendra.golla@amd.com>,
	Abin Joseph <abin.joseph@amd.com>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	Kees Cook <kees@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 21/33] dmaengine: zynqmp-dma: switch completion tasklet to dmaengine BH
Date: Tue, 10 Nov 2026 05:13:21 -0800
Message-ID: <6b2f74549b23746ca0bdb99d7ae77181071c4f21.1794315350.git.allen.lkml@gmail.com>
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
 drivers/dma/xilinx/zynqmp_dma.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
index bc85dca47412..aca32eb175bc 100644
--- a/drivers/dma/xilinx/zynqmp_dma.c
+++ b/drivers/dma/xilinx/zynqmp_dma.c
@@ -205,7 +205,6 @@ struct zynqmp_dma_desc_sw {
  * @dev: The dma device
  * @irq: Linux IRQ number, or -1 when not registered
  * @is_dmacoherent: Tells whether dma operations are coherent or not
- * @tasklet: Cleanup work after irq
  * @idle: Channel status
  * @desc_size: Size of the low level descriptor
  * @err: Channel has errors
@@ -230,7 +229,6 @@ struct zynqmp_dma_chan {
 	struct device *dev;
 	int irq;
 	bool is_dmacoherent;
-	struct tasklet_struct tasklet;
 	bool idle;
 	size_t desc_size;
 	bool err;
@@ -743,7 +741,7 @@ static irqreturn_t zynqmp_dma_irq_handler(int irq, void *data)
 
 	writel(isr, chan->regs + ZYNQMP_DMA_ISR);
 	if (status & ZYNQMP_DMA_INT_DONE) {
-		tasklet_schedule(&chan->tasklet);
+		dmaengine_schedule_bh(&chan->common);
 		ret = IRQ_HANDLED;
 	}
 
@@ -752,7 +750,7 @@ static irqreturn_t zynqmp_dma_irq_handler(int irq, void *data)
 
 	if (status & ZYNQMP_DMA_INT_ERR) {
 		chan->err = true;
-		tasklet_schedule(&chan->tasklet);
+		dmaengine_schedule_bh(&chan->common);
 		dev_err(chan->dev, "Channel %p has errors\n", chan);
 		ret = IRQ_HANDLED;
 	}
@@ -768,11 +766,12 @@ static irqreturn_t zynqmp_dma_irq_handler(int irq, void *data)
 
 /**
  * zynqmp_dma_do_tasklet - Schedule completion tasklet
- * @t: Pointer to the ZynqMP DMA channel structure
+ * @c: Pointer to the ZynqMP DMA channel structure
  */
-static void zynqmp_dma_do_tasklet(struct tasklet_struct *t)
+static void zynqmp_dma_do_tasklet(struct dma_chan *c)
 {
-	struct zynqmp_dma_chan *chan = from_tasklet(chan, t, tasklet);
+	struct zynqmp_dma_chan *chan = container_of(c,
+			struct zynqmp_dma_chan, common);
 	u32 count;
 	unsigned long irqflags;
 
@@ -823,7 +822,7 @@ static void zynqmp_dma_synchronize(struct dma_chan *dchan)
 {
 	struct zynqmp_dma_chan *chan = to_chan(dchan);
 
-	tasklet_kill(&chan->tasklet);
+	dmaengine_kill_bh(&chan->common);
 }
 
 /**
@@ -899,7 +898,7 @@ static void zynqmp_dma_chan_remove(struct zynqmp_dma_chan *chan)
 
 	if (chan->irq >= 0)
 		devm_free_irq(chan->zdev->dev, chan->irq, chan);
-	tasklet_kill(&chan->tasklet);
+	dmaengine_kill_bh(&chan->common);
 	if (!list_empty(&chan->common.device_node))
 		list_del(&chan->common.device_node);
 }
@@ -951,7 +950,7 @@ static int zynqmp_dma_chan_probe(struct zynqmp_dma_device *zdev,
 
 	chan->is_dmacoherent = of_dma_is_coherent(node);
 	zdev->chan = chan;
-	tasklet_setup(&chan->tasklet, zynqmp_dma_do_tasklet);
+	dmaengine_init_bh(&chan->common, zynqmp_dma_do_tasklet);
 	spin_lock_init(&chan->lock);
 	INIT_LIST_HEAD(&chan->active_list);
 	INIT_LIST_HEAD(&chan->pending_list);
-- 
2.43.0

