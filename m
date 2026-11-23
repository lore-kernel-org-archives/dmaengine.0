Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445631;
	b=cLz8SnObpaUdK3jpLMruEN3gTBcDbZy/8tWdrwA327riovyp7LFoqnjDdeXuTC7QD04U
	 twvEzoArATmoai/e8RQPpQ0P5zCK4ePslq8aMV2pLl2hMue40pyRxyGvCZc85JnxqhncT
	 pYymNuYA8kFdffEVzo80TEebmT5KT6djSC3V0XZsAS73I+KaMPjnWsJgP9Le40ARxw2vi
	 411YuTtN+Ccxx1OmuiPG+Bw9NU9SbdTnpRNFw/gDKgErInBxc7W5JY/6w+K05bKEg79Sp
	 DpF+BlaE6/1KnoQCc0gb5Ltm5c38uNvqLGpXeqilqs9OX2jDHXOGIp+80a4bv7+lpRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445631;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Zvqnrlc7MSEtVSmfRRlydngWRQ+r+L5CkYiMb5jwDlo=;
	b=s2CqMNh7XJfW58ePB165B6t4j3kvn2gq9O2JN+QzZwevf0zFy4pkQcLPQyXxuKDKMxq8
	 Z0nGn15sBrITEyHjTpaKCyiefvxhlyL0Gp0K/3bCBi1evlx/YXSkrDAf2l8E89rGxL0RS
	 z0LOET7d2So69HXRAHKeQmx89wl3vMeOqWYWDhFl/ZQ0+SAUQ4mLc45PpAfa9D7Jlfqrg
	 LIhDzg8fAWLO58igxgN+iwqxQZMn8DEhCDEsk05lxoUwhaxaK+QwfDqZGMloLZ0MR8voJ
	 +iwO11JhKuRNtvH+AOn6DGWUCEJgTh3eKw4703LhFhph/XVENrDjExb8jGZvRJrDafw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=doml4OEl;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8911060A381D
	for <dmaengine@vger.kernel.org>; Mon, 23 Nov 2026 14:53:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8911060A381D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=doml4OEl
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4a42b34e930so2984883f8f.2
        for <dmaengine@vger.kernel.org>; Mon, 23 Nov 2026 06:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445630; x=1796050430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zvqnrlc7MSEtVSmfRRlydngWRQ+r+L5CkYiMb5jwDlo=;
        b=doml4OElPORpXc2qIfAu85R+07zrXEfqpUSHMRiYnf+iTX1cMLpEuriwYq+Q2H68X7
         PC2QOCMsIkSU/dHqfVHpja2SkEdCsftBfz2xwWKXvqrWdVajli3t+7LpNualMFke2s+D
         uHNHN0MRxhLeFM3eAbm9P8TYx3O1sLEdaLws0xmLC00nUK1nv6Yl6ccXJqLPVGyhBL+z
         c/it0xyi8VkKFJPuEmdtO0vq0qvsR5pFlszibB/STIDQdopXznbHkybgBlbUC/TRHnUy
         3n6FEqR61hVkv7W3h1sxmJXxKAWwx94tf+FO6JUrGt4dg8l+RWyNXfjGftan+rJNrGte
         xYQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445630; x=1796050430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zvqnrlc7MSEtVSmfRRlydngWRQ+r+L5CkYiMb5jwDlo=;
        b=Sge7HT2WStLoNEowJeZ6rhdbfXmz6h2fXtsT66Nm1WcA3AhwAxmFXgro4oUbZv6b7S
         /sEvMUQp9FjzsNn+8yrLZkZ5wd0iowOfjGk1O4NVeuaFlgcRnAc4MYM44e+n/nHN9Ntm
         cMeiDdSyLSakp1R4DgrLzUCxcZpWgGubKmkg2lPnHX52mrmpNFURL7Pqe3paaFIIWZJq
         4Vks5sKqfwe5h6gORM9MCcJzobEXfG5hVLC62ern2EDdu7Ahdqjl8alFU48V8cI4Y8At
         Xw1rP8iYOnAs9KAenBtGcgnEVpLNclu/aWOcBW+7NiXniZfvLOi9RnAqy4cS/dyIDR3Q
         oiJA==
X-Forwarded-Encrypted: i=1; AL+hErEqtcY8sC7jxw62gfHbnP/+WEnrdGSJ5AJJzVRgEhONte7kN9H/NxkPvk90ED/TWSXRRb6R4MynCbU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+XAX+jjhvwH69XdVC8NXQMoifmRs19smeQlUDXfVOU6wBafErL
	ha4ClsmwcO81SNYHAJUYxFXpf411Fg51/tz+/OdxMhSqi4f18/jKhW2O8a0Mq2VbCyw=
X-Gm-Gg: AZFdTZd8wjtLAusd3BW+ixcYAAobTNvZScPxWOGxSXDPVyUS0sOAyklxQNJQGZ2LpQ/
	sAXrkErFKgdqpJ3SGD1eoLTK8icFSHbAZiuY3liV+ikT+xThmLGcFJtYY9aYfAFLcUkOgu/hVJ7
	Sd0VQ6WrC8pddxbs8G2tiF2dfZm+kASz1v5PfJWUEkyta8T48J+RQ+V5JVAvIQr33jKIYcCaRW7
	UWosl+HEQDB7cjp6yHRizAHMz7nIHV3GUcHMf/KeRnM6j9NJp7r+f4laBpTHHkIGmeosTkG81bh
	feF6+RJa9VOwzwqN1Wh2CvzgL8qdvZtbPEA69WCu/PoiAK5uo4cU9pSLqqzu7ABhWPZV50N16cB
	aS3JstWR6JKmu8/Z4J/xNA3853+AWrK+rRLNg79kqtSBi6KMA+JXzZI29lpfjrH6T6IjFMs4J6U
	rgepyaMwh3cjg9bdJNLwbFkoDR43e1SdiycY1LqpitL0iJjHfaiLBKEFP0CTOm72JAvu37BhDfX
	F1UFR15TM8E/zC45AhOHY7Ft1I26fEC6YvciyNNXiDHa3i6JHCgrTCbpCq171MvnkI1k8kqrCCs
	trA6wHHLRx9soettlFPP0LY/608=
X-Received: by 2002:a05:6000:2313:b0:490:50c1:f359 with SMTP id ffacd0b85a97d-4abb4d70071mr25023593f8f.39.1795445629731;
        Mon, 23 Nov 2026 06:53:49 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6ae2dd55sm22090607f8f.30.2026.11.23.06.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:53:49 -0800 (PST)
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
Subject: [PATCH v3 12/28] dmaengine: bcm2835: pass dma_chan to generic functions
Date: Mon, 23 Nov 2026 15:56:50 +0100
Message-ID: <20261123145728.29082-13-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261123145728.29082-1-andrea.porta@suse.com>
References: <20261123145728.29082-1-andrea.porta@suse.com>
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
index 1d322cad4ca3..d048cb00ce5d 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -307,13 +307,14 @@ static void bcm2835_dma_desc_free(struct virt_dma_desc *vd)
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
@@ -423,7 +424,7 @@ static struct bcm2835_desc *bcm2835_dma_create_cb_chain(
 		/* set up length in control_block if requested */
 		if (buf_len) {
 			/* calculate length honoring period_length */
-			if (bcm2835_dma_create_cb_set_length(c, control_block,
+			if (bcm2835_dma_create_cb_set_length(chan, control_block,
 							     len, period_len,
 							     &total_len)) {
 				/* add extrainfo bits in info */
@@ -491,8 +492,9 @@ static void bcm2835_dma_fill_cb_chain_with_sg(
 	}
 }
 
-static void bcm2835_dma_abort(struct bcm2835_chan *c)
+static void bcm2835_dma_abort(struct dma_chan *chan)
 {
+	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	void __iomem *chan_base = c->chan_base;
 	long timeout = 100;
 
@@ -533,8 +535,9 @@ static void bcm2835_dma_abort(struct bcm2835_chan *c)
 	writel(BCM2835_DMA_RESET, chan_base + BCM2835_DMA_CS);
 }
 
-static void bcm2835_dma_start_desc(struct bcm2835_chan *c)
+static void bcm2835_dma_start_desc(struct dma_chan *chan)
 {
+	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct virt_dma_desc *vd = vchan_next_desc(&c->vc);
 
 	if (!vd) {
@@ -553,7 +556,8 @@ static void bcm2835_dma_start_desc(struct bcm2835_chan *c)
 
 static irqreturn_t bcm2835_dma_callback(int irq, void *data)
 {
-	struct bcm2835_chan *c = data;
+	struct dma_chan *chan = data;
+	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
 	unsigned long flags;
 
@@ -587,7 +591,7 @@ static irqreturn_t bcm2835_dma_callback(int irq, void *data)
 			vchan_cyclic_callback(&d->vd);
 		} else if (!readl(c->chan_base + BCM2835_DMA_ADDR)) {
 			vchan_cookie_complete(&c->desc->vd);
-			bcm2835_dma_start_desc(c);
+			bcm2835_dma_start_desc(chan);
 		}
 	}
 
@@ -615,7 +619,7 @@ static int bcm2835_dma_alloc_chan_resources(struct dma_chan *chan)
 	}
 
 	return request_irq(c->irq_number, bcm2835_dma_callback,
-			   c->irq_flags, "DMA IRQ", c);
+			   c->irq_flags, "DMA IRQ", chan);
 }
 
 static void bcm2835_dma_free_chan_resources(struct dma_chan *chan)
@@ -623,7 +627,7 @@ static void bcm2835_dma_free_chan_resources(struct dma_chan *chan)
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 
 	vchan_free_chan_resources(&c->vc);
-	free_irq(c->irq_number, c);
+	free_irq(c->irq_number, chan);
 	dma_pool_destroy(c->cb_pool);
 
 	dev_dbg(c->vc.chan.device->dev, "Freeing DMA channel %u\n", c->ch);
@@ -704,7 +708,7 @@ static void bcm2835_dma_issue_pending(struct dma_chan *chan)
 
 	spin_lock_irqsave(&c->vc.lock, flags);
 	if (vchan_issue_pending(&c->vc) && !c->desc)
-		bcm2835_dma_start_desc(c);
+		bcm2835_dma_start_desc(chan);
 
 	spin_unlock_irqrestore(&c->vc.lock, flags);
 }
@@ -868,7 +872,7 @@ static int bcm2835_dma_terminate_all(struct dma_chan *chan)
 	if (c->desc) {
 		vchan_terminate_vdesc(&c->desc->vd);
 		c->desc = NULL;
-		bcm2835_dma_abort(c);
+		bcm2835_dma_abort(chan);
 	}
 
 	vchan_get_all_descriptors(&c->vc, &head);
-- 
2.51.0

