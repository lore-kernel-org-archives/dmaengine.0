Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781923;
	b=CE0FZUXlGnvKuM/YxA8UGx3GoZful9yZzX9cm2HBdx3NcN1Ktp2Hk0afMSvZWoFOiHr3
	 /2kNldi8GH6PIynnapFwEheBAVqNPbQymnuRN5X/Jn6PAdcNOYbpopxsrX4OJI3jDU5ka
	 qyrcYmyb2ms4DyOz8byBpvJY7il9AHrWSj9WgJaXlkuSSu4kOBam6e6VCXkfGDDqqI2KO
	 qZib+/nKwbiyQEtDxeVGAOS2g2fdSGE137yysqDnb9XzcqWuhRQlD/gzTjwaqvXW2ac+K
	 +dA5RYwKztN37aJlZSFDKvYZXYDdZKbKffCzjPpiO+hA0izxTqLqKy4QUgAmz4mQ/Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781923;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MMT1Uro3tapSUho9zWuNOX0RUA++YjlXxqj9VMmgkN0=;
	b=gaODJIDIHwLEBBOAOXoGK09P9W+zfsrbhPcx9o1D+CNVFwIWxg8M8HWTQq/6vU9YJWxB
	 ZA57FvSViGadYji7kIQMz8zP/Rs0E3y+vK6d4ymewNRz0s0NFNVlDUFVafGctjVGsP6a+
	 129RvDBWd3Li5t/CzX/78Nklt28yWMTEtALCLnQ/nwsX2htJLQKFPrJrwzqMi9MuVhtvI
	 P/vZV/XhmZuU314GT+7mD9X/rLtybDg1Oy5tcKh32CEMu2lLnMyXChc67xXLChGG5VADi
	 1peO+M865A1QvE4SxOokLNL2iFRCryDmleQr9RH/S/L+rMn8aaQqsCzWlcu3lFIiU/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=RpFqkmf4;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126F8606A332
	for <dmaengine@vger.kernel.org>; Fri, 27 Nov 2026 12:18:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 126F8606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=RpFqkmf4
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so77389245e9.3
        for <dmaengine@vger.kernel.org>; Fri, 27 Nov 2026 04:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781921; x=1796386721; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MMT1Uro3tapSUho9zWuNOX0RUA++YjlXxqj9VMmgkN0=;
        b=RpFqkmf4M2C+NBu31LXfv/f/jt89NdzOEOmpOCNKHppLyVhcP806TNwENRTylt0bwh
         mqwIZgMXRhNprJM++AqzJ4Vhb1XPYhExxyGed+t0aw19s2W668wAfwPdl7wY7bR/fvxy
         P3GyAy0JfKEvo8/bkTiCI04+nE6WMMBVbXcCnYRRAiFU0wh2ZItvhMA7IOC9xbuJwUz0
         wdUNYbjn1hNuhkf7QvACblNWtp64iJbQF0ypKVBkOLjwv58rb6rDi6DYXjcTELyaBWGv
         R+96R2rReFhlxXRTKW4mEnSyuXFjTVxygQ867XhLxVfqr+NkW/CWhfetqCPjZnRlxPd+
         yzRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781921; x=1796386721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MMT1Uro3tapSUho9zWuNOX0RUA++YjlXxqj9VMmgkN0=;
        b=zjJ7OFeWMuu2CJJ6n4cvNpx4PDlkg6DXlp+jNXFRVIy+04OE63VtAE4/aCAyCwEmU7
         2FB+ZbBemZ4ULxLjvplaSyzkM8anlLnTUsDHV90OCT+NE4NLKZUQb1wZ1SEG4+8hfcEn
         /7BbPeKPxARWdOWadjMzrqyMfCI5GM6CVldFLjDpDnNf3Hpm8jIeBTkQlD36esA+acGK
         mr5Reg/zQTnXjjzAa6Y80Xzuzhzzj4124gqwm1gGV2VBH4nkibldi+ZoPzNxanWdl6P2
         Mwg0rp2K8NUABBRK147YU4//p5bJEAafTfeGtj8xX6DXnQ59FmH4sYbrpE6JPAFsbdW/
         DOhg==
X-Forwarded-Encrypted: i=1; AL+hErEdjxF6r0mgxxh1KLyMqZw7xXUPJF2GXgabnPZ+Gk1G3NzwUn9D0kGPurNKGUQJS1lUzAjVXEgvaiI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jEruB6xLOW9dZNWvgEjLxmYHRHXmpwh7dLImQeuANH26duzYR
	Y/VbuOlm45eTYFy5Y8YpHBRohZXG2G4zW2GoSYa6RqQkVymO1gAKczX78oH/oSTNQlw=
X-Gm-Gg: AZFdTZeI7iSZaGW1fZUyrBZW/eltTfSXjYGGD3nNt8M+ZDm5MfOXMownDv8NIwJvkki
	s+ktQEI01jDmVmYGNRCwzpIcQKGw/Pi/aiuPZzqBWLrjVLG8IQCQX4xursAW4wbwzVcW2AUKznT
	p+p5Nv5C4bBtr1w3w9l1KEJFasirhv8CBUKdUzVWGHlpdPu7VMFxoVgZ43OP1bTMm/SBZET8O+Q
	jq/mAZtczdyY+a4TJeSZaZSesFAakmeHz6D/B0xGMXZprV38yoatAxmUHRkHWHxQAys03tm9T0M
	SXUkHXms5xxgb0zj0qz1iStyiM+WAO78DI+o/jqPiMCL/iP76CsPjodxTThfi6aGJe7ilfdcp9p
	Ovb2vAW5Pzd7eUDWsTWmjl3DcvfTy6plYJ5iawz341qWHQp+BZvDmwDFXL/nPgF5mz2aITecdzc
	Dp8yVyjOKZ9mNpT33jBc5nSgNwVeDjJh4+Pd2Rs17ppQeLmZ68xntrqP9A2L4leo8wfmEmWrDW8
	Z/EpuKEN9xnkIeiBDETcQCU+zOyRu4hRWRZmlhBrjsDOp/Kv5b0MJgyFWFw3g722n9JHwMGwlIH
	ITBifb5JkSUizecGxiEV7AHYjQkE
X-Received: by 2002:a05:600c:5307:b0:4a7:9025:5c3b with SMTP id 5b1f17b1804b1-4bb88921468mr476223795e9.19.1795781921300;
        Fri, 27 Nov 2026 04:18:41 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f148aasm273818895e9.0.2026.11.27.04.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:18:40 -0800 (PST)
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
Subject: [PATCH v4 01/28] dmaengine: bcm2835: Fix coding style issues
Date: Fri, 27 Nov 2026 13:21:51 +0100
Message-ID: <20261127122236.4976-2-andrea.porta@suse.com>
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

Fix the coding style issues reported by checkpatch: use u32 instead of
uint32_t, drop superfluous parentheses and long int, and align the
function arguments. Drop the local variable of bcm2835_dma_start_desc(),
which was only used by a chained assignment.

Also convert the register field macros to FIELD_PREP(), which takes care
of the missing parentheses around their arguments, which could lead to
operator precedence issues.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/dma/bcm2835-dma.c | 85 ++++++++++++++++++++-------------------
 1 file changed, 44 insertions(+), 41 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index 06d830d36882..036a7a1727a5 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -17,6 +17,7 @@
  *	MARVELL MMP Peripheral DMA Driver
  *	Copyright 2012 Marvell International Ltd.
  */
+#include <linux/bitfield.h>
 #include <linux/dmaengine.h>
 #include <linux/dma-mapping.h>
 #include <linux/dmapool.h>
@@ -51,13 +52,13 @@ struct bcm2835_dmadev {
 };
 
 struct bcm2835_dma_cb {
-	uint32_t info;
-	uint32_t src;
-	uint32_t dst;
-	uint32_t length;
-	uint32_t stride;
-	uint32_t next;
-	uint32_t pad[2];
+	u32 info;
+	u32 src;
+	u32 dst;
+	u32 length;
+	u32 stride;
+	u32 next;
+	u32 pad[2];
 };
 
 struct bcm2835_cb_entry {
@@ -116,8 +117,8 @@ struct bcm2835_desc {
 					       * AXI-write to ack
 					       */
 #define BCM2835_DMA_ERR		BIT(8)
-#define BCM2835_DMA_PRIORITY(x) ((x & 15) << 16) /* AXI priority */
-#define BCM2835_DMA_PANIC_PRIORITY(x) ((x & 15) << 20) /* panic priority */
+#define BCM2835_DMA_PRIORITY(x) FIELD_PREP(GENMASK(19, 16), x) /* AXI priority */
+#define BCM2835_DMA_PANIC_PRIORITY(x) FIELD_PREP(GENMASK(23, 20), x) /* panic priority */
 /* current value of TI.BCM2835_DMA_WAIT_RESP */
 #define BCM2835_DMA_WAIT_FOR_WRITES BIT(28)
 #define BCM2835_DMA_DIS_DEBUG	BIT(29) /* disable debug pause signal */
@@ -136,9 +137,10 @@ struct bcm2835_desc {
 #define BCM2835_DMA_S_WIDTH	BIT(9) /* 128bit writes if set */
 #define BCM2835_DMA_S_DREQ	BIT(10) /* enable SREQ for source */
 #define BCM2835_DMA_S_IGNORE	BIT(11) /* ignore source reads - read 0 */
-#define BCM2835_DMA_BURST_LENGTH(x) ((x & 15) << 12)
-#define BCM2835_DMA_PER_MAP(x)	((x & 31) << 16) /* REQ source */
-#define BCM2835_DMA_WAIT(x)	((x & 31) << 21) /* add DMA-wait cycles */
+#define BCM2835_DMA_BURST_LENGTH_MASK GENMASK(15, 12)
+#define BCM2835_DMA_BURST_LENGTH(x) FIELD_PREP(BCM2835_DMA_BURST_LENGTH_MASK, x)
+#define BCM2835_DMA_PER_MAP(x)	FIELD_PREP(GENMASK(20, 16), x) /* REQ source */
+#define BCM2835_DMA_WAIT(x)	FIELD_PREP(GENMASK(25, 21), x) /* add DMA-wait cycles */
 #define BCM2835_DMA_NO_WIDE_BURSTS BIT(26) /* no 2 beat write bursts */
 
 /* debug register bits */
@@ -214,17 +216,15 @@ static void bcm2835_dma_free_cb_chain(struct bcm2835_desc *desc)
 
 static void bcm2835_dma_desc_free(struct virt_dma_desc *vd)
 {
-	bcm2835_dma_free_cb_chain(
-		container_of(vd, struct bcm2835_desc, vd));
+	bcm2835_dma_free_cb_chain(container_of(vd, struct bcm2835_desc, vd));
 }
 
-static void bcm2835_dma_create_cb_set_length(
-	struct bcm2835_chan *chan,
-	struct bcm2835_dma_cb *control_block,
-	size_t len,
-	size_t period_len,
-	size_t *total_len,
-	u32 finalextrainfo)
+static void bcm2835_dma_create_cb_set_length(struct bcm2835_chan *chan,
+					     struct bcm2835_dma_cb *control_block,
+					     size_t len,
+					     size_t period_len,
+					     size_t *total_len,
+					     u32 finalextrainfo)
 {
 	size_t max_len = bcm2835_dma_max_frame_length(chan);
 
@@ -281,10 +281,13 @@ static void bcm2835_dma_create_cb_set_length(
  * @gfp:            the GFP flag to use for allocation
  */
 static struct bcm2835_desc *bcm2835_dma_create_cb_chain(
-	struct dma_chan *chan, enum dma_transfer_direction direction,
-	bool cyclic, u32 info, u32 finalextrainfo, size_t frames,
-	dma_addr_t src, dma_addr_t dst, size_t buf_len,
-	size_t period_len, gfp_t gfp)
+					struct dma_chan *chan,
+					enum dma_transfer_direction direction,
+					bool cyclic, u32 info,
+					u32 finalextrainfo,
+					size_t frames, dma_addr_t src,
+					dma_addr_t dst, size_t buf_len,
+					size_t period_len, gfp_t gfp)
 {
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	size_t len = buf_len, total_len;
@@ -326,10 +329,10 @@ static struct bcm2835_desc *bcm2835_dma_create_cb_chain(
 		/* set up length in control_block if requested */
 		if (buf_len) {
 			/* calculate length honoring period_length */
-			bcm2835_dma_create_cb_set_length(
-				c, control_block,
-				len, period_len, &total_len,
-				cyclic ? finalextrainfo : 0);
+			bcm2835_dma_create_cb_set_length(c, control_block,
+							 len, period_len,
+							 &total_len,
+							 cyclic ? finalextrainfo : 0);
 
 			/* calculate new remaining length */
 			len -= control_block->length;
@@ -353,7 +356,7 @@ static struct bcm2835_desc *bcm2835_dma_create_cb_chain(
 	d->cb_list[d->frames - 1].cb->info |= finalextrainfo;
 
 	/* detect a size mismatch */
-	if (buf_len && (d->size != buf_len))
+	if (buf_len && d->size != buf_len)
 		goto error_cb;
 
 	return d;
@@ -393,7 +396,7 @@ static void bcm2835_dma_fill_cb_chain_with_sg(
 static void bcm2835_dma_abort(struct bcm2835_chan *c)
 {
 	void __iomem *chan_base = c->chan_base;
-	long int timeout = 10000;
+	long timeout = 10000;
 
 	/*
 	 * A zero control block address means the channel is idle.
@@ -421,7 +424,6 @@ static void bcm2835_dma_abort(struct bcm2835_chan *c)
 static void bcm2835_dma_start_desc(struct bcm2835_chan *c)
 {
 	struct virt_dma_desc *vd = vchan_next_desc(&c->vc);
-	struct bcm2835_desc *d;
 
 	if (!vd) {
 		c->desc = NULL;
@@ -430,9 +432,9 @@ static void bcm2835_dma_start_desc(struct bcm2835_chan *c)
 
 	list_del(&vd->node);
 
-	c->desc = d = to_bcm2835_dma_desc(&vd->tx);
+	c->desc = to_bcm2835_dma_desc(&vd->tx);
 
-	writel(d->cb_list[0].paddr, c->chan_base + BCM2835_DMA_ADDR);
+	writel(c->desc->cb_list[0].paddr, c->chan_base + BCM2835_DMA_ADDR);
 	writel(BCM2835_DMA_ACTIVE, c->chan_base + BCM2835_DMA_CS);
 }
 
@@ -543,7 +545,8 @@ static size_t bcm2835_dma_desc_size_pos(struct bcm2835_desc *d, dma_addr_t addr)
 }
 
 static enum dma_status bcm2835_dma_tx_status(struct dma_chan *chan,
-	dma_cookie_t cookie, struct dma_tx_state *txstate)
+					     dma_cookie_t cookie,
+					     struct dma_tx_state *txstate)
 {
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct virt_dma_desc *vd;
@@ -843,7 +846,7 @@ static const struct of_device_id bcm2835_dma_of_match[] = {
 MODULE_DEVICE_TABLE(of, bcm2835_dma_of_match);
 
 static struct dma_chan *bcm2835_dma_xlate(struct of_phandle_args *spec,
-					   struct of_dma *ofdma)
+					  struct of_dma *ofdma)
 {
 	struct bcm2835_dmadev *d = ofdma->of_dma_data;
 	struct dma_chan *chan;
@@ -887,7 +890,7 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
 	int i, j;
 	int irq[BCM2835_DMA_MAX_DMA_CHAN_SUPPORTED + 1];
 	int irq_flags;
-	uint32_t chans_available;
+	u32 chans_available;
 	char chan_name[BCM2835_DMA_CHAN_NAME_SIZE];
 
 	if (!pdev->dev.dma_mask)
@@ -946,8 +949,8 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
 
 	/* Request DMA channel mask from device tree */
 	if (of_property_read_u32(pdev->dev.of_node,
-			"brcm,dma-channel-mask",
-			&chans_available)) {
+				 "brcm,dma-channel-mask",
+				 &chans_available)) {
 		dev_err(&pdev->dev, "Failed to get channel mask\n");
 		rc = -EINVAL;
 		goto err_no_dma;
@@ -986,7 +989,7 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
 		/* check if there are other channels that also use this irq */
 		irq_flags = 0;
 		for (j = 0; j <= BCM2835_DMA_MAX_DMA_CHAN_SUPPORTED; j++)
-			if ((i != j) && (irq[j] == irq[i])) {
+			if (i != j && irq[j] == irq[i]) {
 				irq_flags = IRQF_SHARED;
 				break;
 			}
@@ -1001,7 +1004,7 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
 
 	/* Device-tree DMA controller registration */
 	rc = of_dma_controller_register(pdev->dev.of_node,
-			bcm2835_dma_xlate, od);
+					bcm2835_dma_xlate, od);
 	if (rc) {
 		dev_err(&pdev->dev, "Failed to register DMA controller\n");
 		goto err_no_dma;
-- 
2.51.0

