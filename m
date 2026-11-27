Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781939;
	b=g4tVGeW2xGIC5rYcOclP0wsem08pHBrgs928KOgWsNQ4b3MbE0+sqxhE22joKL6BQAXi
	 WTWXOIPtmApTw004qrX1dkU3XFxPQofOo9avRd3dzz22bCERgAVoRtkEoKptvUQlGreRP
	 h1BR3h7vIayyLqvtVsMh7Eu1dhPSoi3PDLkspW7w2XaVw5TdLtevUF9ds0MBTKeJu8UnE
	 wlpJMqySlQT2ADrtD96U+OZsageJWp+fRO7vSAE47h6pJANhhPpdVxafG5qUAUsi0QFqA
	 +sQxBHoNHsC9hNX1mXBRrsDS+3WZfiWO9d9nsSIbn6fQugtn5f6HSsQjwKUIjnDSYIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781939;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Mm85sjHJqArC7LWLKyY5r/gaSqHpUQcpDUwxBHHWLZY=;
	b=S3Rslsr2p0hiBWthhAEoTc5sZY5yGEwkHcolT1Q1isx7Q4Iltvx2ahPocHwY1X+80Opc
	 DeuhHNpxevMpqX/L1++cS2PMiIV24vlTkNXkDXFuv+ToxVoEbFImBcHgbzCebxw8aqTLo
	 M3Q094XDTv2U36EFD2Nz8j4BbqLoiw3xkBqEcCrqircCM2AkCek51J9xyL6NCiXfjFqvX
	 5SQEI0qL1KCmQPld0dotw1Tj3UPK/iKJymZqMJNCs0n/AQq0ZkLx5w+2LmNmjwBNgLpuv
	 kfWygLe7pSowEvvV0r1rrygSGvZz95YVryggyhpGNrR8qSNOnAt4jR9QbICQfDKheHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Adj0JvaQ;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639F660A3820
	for <dmaengine@vger.kernel.org>; Fri, 27 Nov 2026 12:18:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 639F660A3820
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Adj0JvaQ
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so65540735e9.3
        for <dmaengine@vger.kernel.org>; Fri, 27 Nov 2026 04:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781938; x=1796386738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mm85sjHJqArC7LWLKyY5r/gaSqHpUQcpDUwxBHHWLZY=;
        b=Adj0JvaQlOLaAR/UbmBa7KcVeM1TW4E6jTunwU1pw1rsdzrzIhG2ddl4/C6zmIGF9F
         B1Dmv5dNPBKVbCmOvPMDreAmBWlqlRM9m/lMWq6N+/YnF/xfrE1+bGA+Yh1B73XRmDXs
         gRqinrv60k3P48m2hLyvIwCOvCnsQOl8GDWOsocUFlAFSNFsYfYE0bMWFF+7aeqqyY9z
         kHxap6ZRYLRumyeBtEZyP2QYZiUN1AhvpKaxFD5ZW8KOQ7pbj1E/ZPaHxQO7e3N77EF8
         tkRfeMxz2FBVOHIWm+R+B9z2Sf0QINv3Tz4pLTbI6xraApggh0lmYLQXIQDQ6VMEXjpG
         Wm8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781938; x=1796386738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mm85sjHJqArC7LWLKyY5r/gaSqHpUQcpDUwxBHHWLZY=;
        b=RqTmoAIg0E3yQ/xgDDTVpnblWWWM0kNP4vCKTcZn6U4dKRhBs81U2baZm55vNPXtCN
         uvZIPsC1JmUSDy7oymHxOJ1X1G1nWHT90w2TJztYgHeCdBZQrLgFsxPJZbGvRcAGq2D9
         tSfXbVUXfeNZ4sn75zaylTypF4DnODk6SILIfMlggP6ZoTZFxixs9tul6kmIw2/4qjzy
         cDACqZ3TdSZsNLH83VSHlkWeTbOaUK27rdoBlKC6gZ94iZZc4efAZAcR5NdQTNOqpa5C
         zRpIHcP3k1DuV6T4//kq9Z2r6ioAllQ+9pJF8/n2AIB7f7n+2tO9SSgJS/NuKHepDuY7
         VPWw==
X-Forwarded-Encrypted: i=1; AL+hErGkYsWSJZx9OMuSG+pFU+UxEddwHRLJS7+B1ZbhOKOVXdSPDM3Ppzwf00bREva3KIts4b0jzpS/Y9k=@vger.kernel.org
X-Gm-Message-State: APuU4Z8k8OqBNA6eCHU2y3xQannBy7ylygSyFU+3nsE9E2wo45Y31b6h
	4usQ4A/FVgurz3shdY2wXuYuIIa1KSWwb17A/W9zeUKClee2MVTpcNFogrVFyhlgSq4=
X-Gm-Gg: AZFdTZcn3OA60TDzTVo6WzexaekpESA8t65ZVc2ZsxgqgTmKmZm33jWrqMQVfc0Qcm4
	e1B/FuK3E8h5hlAmrUz6eMUFEa9kLS3Qe2nGhc6GJZZyWK3DEk8XNqwRqqVrRktmVLob/0ad1N1
	dkqottU930hMOUq56qa4rQNi5aWE3ZxGMOqKkIcpinhx6BawYqAM6yMEHUIH+S3zEZtoXwSf12S
	17KmZNf4I23dcrwM29wNYJFW0Zxgc6SP2yDqa7p3/YmXFCaeBMtcTswL1FN174vVjrhQ1Wr86IT
	PbLLGCajnRHNpSsL6Teym5AtvMq3LkKsBL6NUCoXPU1CPVYBoX50Ol9MxFSSqVvpEf0+Fv9xi7l
	cVSB+/e7U0g0LGG/AexUcm9egQH/HNIn49y737IAj45BcvTY7/zBM+GiUjM2E1CwME4aw7pjG9p
	Pbb2+FaondgWcySNSx7ziZY840pgDYhmaL4zwW4V/CzCN4WDndoar1BXDN2x208OuqUSYPRFjJT
	+yG7hRBqb982LV05R5gHIM9YEROj9RmYis9Am7plQzMAzGfi0yGA6lgw+y6lryF3BrUXFzMFEMu
	KYsehU/VY5sdw7AciMclJa3QsrEG
X-Received: by 2002:a05:600c:6708:b0:4ba:7e6:53d6 with SMTP id 5b1f17b1804b1-4bb88940848mr434618965e9.33.1795781937757;
        Fri, 27 Nov 2026 04:18:57 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm566215005e9.0.2026.11.27.04.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:18:57 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Saenz Julienne <nsaenz@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dom Cobley <popcornmix@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH v4 12/28] dmaengine: bcm2835: pass dma_chan to generic functions
Date: Fri, 27 Nov 2026 13:22:02 +0100
Message-ID: <20261127122236.4976-13-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261127122236.4976-1-andrea.porta@suse.com>
References: <20261127122236.4976-1-andrea.porta@suse.com>
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

In preparation to support more platforms pass the dma_chan to the
generic functions. This provides access to the DMA device and possible
platform specific data.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/dma/bcm2835-dma.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index 416d9882aeb2..42a7e6eaff9f 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -305,13 +305,14 @@ static void bcm2835_dma_desc_free(struct virt_dma_desc *vd)
 	bcm2835_dma_free_cb_chain(container_of(vd, struct bcm2835_desc, vd));
 }
 
-static bool bcm2835_dma_create_cb_set_length(struct bcm2835_chan *chan,
+static bool bcm2835_dma_create_cb_set_length(struct dma_chan *chan,
 					     struct bcm2835_dma_cb *control_block,
 					     size_t len,
 					     size_t period_len,
 					     size_t *total_len)
 {
-	size_t max_len = bcm2835_dma_max_frame_length(chan);
+	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
+	size_t max_len = bcm2835_dma_max_frame_length(c);
 
 	/* set the length taking lite-channel limitations into account */
 	control_block->length = min_t(u32, len, max_len);
@@ -421,7 +422,7 @@ static struct bcm2835_desc *bcm2835_dma_create_cb_chain(
 		/* set up length in control_block if requested */
 		if (buf_len) {
 			/* calculate length honoring period_length */
-			if (bcm2835_dma_create_cb_set_length(c, control_block,
+			if (bcm2835_dma_create_cb_set_length(chan, control_block,
 							     len, period_len,
 							     &total_len)) {
 				/* add extrainfo bits in info */
@@ -489,8 +490,9 @@ static void bcm2835_dma_fill_cb_chain_with_sg(
 	}
 }
 
-static void bcm2835_dma_abort(struct bcm2835_chan *c)
+static void bcm2835_dma_abort(struct dma_chan *chan)
 {
+	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	void __iomem *chan_base = c->chan_base;
 	long timeout = 10000;
 
@@ -517,8 +519,9 @@ static void bcm2835_dma_abort(struct bcm2835_chan *c)
 	writel(BCM2835_DMA_RESET, chan_base + BCM2835_DMA_CS);
 }
 
-static void bcm2835_dma_start_desc(struct bcm2835_chan *c)
+static void bcm2835_dma_start_desc(struct dma_chan *chan)
 {
+	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct virt_dma_desc *vd = vchan_next_desc(&c->vc);
 
 	if (!vd) {
@@ -537,7 +540,8 @@ static void bcm2835_dma_start_desc(struct bcm2835_chan *c)
 
 static irqreturn_t bcm2835_dma_callback(int irq, void *data)
 {
-	struct bcm2835_chan *c = data;
+	struct dma_chan *chan = data;
+	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
 	unsigned long flags;
 
@@ -571,7 +575,7 @@ static irqreturn_t bcm2835_dma_callback(int irq, void *data)
 			vchan_cyclic_callback(&d->vd);
 		} else if (!readl(c->chan_base + BCM2835_DMA_ADDR)) {
 			vchan_cookie_complete(&c->desc->vd);
-			bcm2835_dma_start_desc(c);
+			bcm2835_dma_start_desc(chan);
 		}
 	}
 
@@ -599,7 +603,7 @@ static int bcm2835_dma_alloc_chan_resources(struct dma_chan *chan)
 	}
 
 	return request_irq(c->irq_number, bcm2835_dma_callback,
-			   c->irq_flags, "DMA IRQ", c);
+			   c->irq_flags, "DMA IRQ", chan);
 }
 
 static void bcm2835_dma_free_chan_resources(struct dma_chan *chan)
@@ -607,7 +611,7 @@ static void bcm2835_dma_free_chan_resources(struct dma_chan *chan)
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 
 	vchan_free_chan_resources(&c->vc);
-	free_irq(c->irq_number, c);
+	free_irq(c->irq_number, chan);
 	dma_pool_destroy(c->cb_pool);
 
 	/* do not leak the flags of a DT client to the next user */
@@ -691,7 +695,7 @@ static void bcm2835_dma_issue_pending(struct dma_chan *chan)
 
 	spin_lock_irqsave(&c->vc.lock, flags);
 	if (vchan_issue_pending(&c->vc) && !c->desc)
-		bcm2835_dma_start_desc(c);
+		bcm2835_dma_start_desc(chan);
 
 	spin_unlock_irqrestore(&c->vc.lock, flags);
 }
@@ -855,7 +859,7 @@ static int bcm2835_dma_terminate_all(struct dma_chan *chan)
 	if (c->desc) {
 		vchan_terminate_vdesc(&c->desc->vd);
 		c->desc = NULL;
-		bcm2835_dma_abort(c);
+		bcm2835_dma_abort(chan);
 	}
 
 	vchan_get_all_descriptors(&c->vc, &head);
-- 
2.51.0

