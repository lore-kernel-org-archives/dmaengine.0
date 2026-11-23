Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445616;
	b=ATFNRErHZqAKi53BsFP4MOtVBKqbe/RjGtqUFhF/N7G1xcAuSMqnCBbzerjUOKWOIWMm
	 xWJ0ZNY0eIUX5owEi1z//cn23kSY6sIIuXug0ZYNRp0bqaJGFwpDp8sLeV9SifMcyyCbQ
	 p8Plp+44iwhJ8aikUqNWoDT38go6H7S1e2+ar9+97I8tfFisNJE5U5hDKq4ZUlCJ35xOJ
	 5Q0GtIT4ZnFYvSIDvilvPgOjdiUfQ1S74X7qduMYMQskezBBst6H4XjeLCQ52i1tgj1ox
	 TbeBzOiPD09sziLcaXeeJFwQ6O77jjYMfi3NJEGiV02mwow5Dolwzygvi4jKi1UUYjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445616;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GqH39ciBHiVFxAX6NEOYNJ4PuF/NMeDq3R9etuJCU9E=;
	b=RC+i7Ai2sbPClgvI8ELtF3WxvePMwleLGCuwOWnxlzHQdi2G9A5ngcz0oUe8XGl/U6nS
	 FcDLFr/vf/GZwBtyLEgQ3SCon+NDgcrSv7hSW/3fM4tVLpvVJVuPVD30PLYFwYCF8tHmm
	 9N6Ev8uZz1GB1UaaHUbr4u0Z/nD2vSqaxEeMzkx1De5VpY8gGqWTXGTa1oI5FtCdWH7Ey
	 tem4JFTBxpY97MX7kg8J5HRVzXSRyfriUchuWk6FqhmfIlpA6U/VDxZ+/tRgX7w1maMj6
	 JRxRjGqFvAP0i9tbDNn8ac1Gutc2P+q/EA+vVJWNQGKXHoxnhRL/7OuNB6NnqsaSJaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=JrqkCKEn;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E450C606A336
	for <dmaengine@vger.kernel.org>; Mon, 23 Nov 2026 14:53:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E450C606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=JrqkCKEn
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a210470b49so32701505e9.2
        for <dmaengine@vger.kernel.org>; Mon, 23 Nov 2026 06:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445614; x=1796050414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GqH39ciBHiVFxAX6NEOYNJ4PuF/NMeDq3R9etuJCU9E=;
        b=JrqkCKEnkboE7trA1ljoBOwv66EfFsfaLfuzP9kFUJ0a2RWgn9auRAHndx064yI5Lt
         9FyhVR+oejJG+cN5VIb6BVA8f6Q5iObUE1aV/A84O1Oc24+y85FWUpxouczZBz6mlSIH
         lt/ODrBQM98xBeLDzLIn5nLQdq1jjUOsmspX+l7AHGbZ+D8/XSmDsAxBx1nWq2dIJgQU
         MROM3NaWlBGOfgmP+c6ciHbBhNDLIF05q1JNK1ttdYDf/kV+m1xmQj3OH/139UuMDxWB
         2Hk43G9CCHdvSmLSJvipoKPZS2s54W64fpzV5YNd95nVgTQEQjnGwuxFSVhsYyuaV+0x
         GSQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445614; x=1796050414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GqH39ciBHiVFxAX6NEOYNJ4PuF/NMeDq3R9etuJCU9E=;
        b=OrDwHz283YW7ym7w3GXSHFuOrJpyA2XkpPxQS29xKAcd08PCtGnqWHjqa30wclmrjV
         89ZKMn0UWqK3EiUT+oe50K4QPuWV+JTNTNklIAh70VnTWnt/tpdeHz8K2rcyVZuE0/rr
         geSVGhWruDeFfZDwMnsFY7rPco1uiS4QjMgR7H4Ty6jmlzxnm1r6M8wo844Gqe9Yk6LM
         HpxSAnKByySLRQ6awVrnRk+IVswDE3qde0zSm9ER9NklevOxT/cE/K377DXm7dMHXweZ
         sv9bIzLa8qkfLdF5CaqU59FL8MeDfrVKJrZIJxAoRwNFNhe6ZrV+SkNzAg6yC+J6/DAD
         z4qg==
X-Forwarded-Encrypted: i=1; AL+hErGQHslaqqM9Z5B8/s6Og3SuEH/nDdJT/nixKN4Mm+kehNxpM3n8x5ebtutND6KAfLDKTOPYtkkZOiQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+MgG37++AM4P/eJamSVCyWFlC/ZNMJHf3IXR4yA0uOap7UY/5J
	/wdtZqmnwHPJqpb7l2qxAMaIC04QDKk1/y4XlxnPG1eYFRxF37GTWhPh7BnIpOM86LE=
X-Gm-Gg: AZFdTZckx/aYgR7MiCFEK8LbAWoGvbkzT4THtLmkQpyMJdncc48J8kWJ1eIKA9LW/1H
	2fqgj187IqQNLOcGAeM8PA+sKdPpw7I2gC6aN5S6B83FbHKZU5Mha4HcdvzDSfm00ogfkarvvRq
	ektRA5z9HwXReVXYKFz1d+IWWhHh9ORBJ5C2kG7K8DFJgQQ9uf2bp1iI3uBUNDMqlU8zRHs/g1F
	msk2BncE4S1eJAIf0Nkg//Y5Hvu5dbeiBjxb0yLXtCebavm0VmH8MW5sKakc/umm5EBB3n8OIYA
	1famjsEbTpt+32oh1z+p4kztokf9L6AY1BuqfhT5dSIZzMVZDbzCdJIvwdLJ1XApDiUcPH/F6yo
	SC63keMQ59h39Xr+DRuQqwdeSnwMJ/YlAc+VkSln/qw4K2ICwr0752HzLN2L61cLQq18NGrAMbC
	1lS71Uy+09gS3TWndyuk33wLTHtmvCflE6dewPUa1/IrMY8MdTx0mSskXLjBuz+ey87dHiQCaQG
	qEO+CXnY5zPf8Ytl/3bLtLaLS0Amr3Y6+U1Alc4WYd3WwPNDiGxA8ItLGjWwX4o+siUQLXGIwuL
	vEbztG+2gWAiQfF4DUqGxcd7x68=
X-Received: by 2002:a05:600c:3b8a:b0:4a3:59c9:a754 with SMTP id 5b1f17b1804b1-4bb8892da25mr240714045e9.22.1795445614229;
        Mon, 23 Nov 2026 06:53:34 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm421402265e9.11.2026.11.23.06.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:53:33 -0800 (PST)
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
Subject: [PATCH v3 01/28] dmaengine: bcm2835: Fix coding style issues and a typo
Date: Mon, 23 Nov 2026 15:56:39 +0100
Message-ID: <20261123145728.29082-2-andrea.porta@suse.com>
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

Fix the coding style issues reported by checkpatch: use u32 instead of
uint32_t, add the missing parentheses around macro arguments, which
could lead to operator precedence issues, drop superfluous parentheses
and long int, and align the function arguments. Also fix a typo in a
comment ('missmatch').

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/dma/bcm2835-dma.c | 83 ++++++++++++++++++++-------------------
 1 file changed, 42 insertions(+), 41 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index 06d830d36882..b19182c6e3df 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -51,13 +51,13 @@ struct bcm2835_dmadev {
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
@@ -116,8 +116,8 @@ struct bcm2835_desc {
 					       * AXI-write to ack
 					       */
 #define BCM2835_DMA_ERR		BIT(8)
-#define BCM2835_DMA_PRIORITY(x) ((x & 15) << 16) /* AXI priority */
-#define BCM2835_DMA_PANIC_PRIORITY(x) ((x & 15) << 20) /* panic priority */
+#define BCM2835_DMA_PRIORITY(x) (((x) & 15) << 16) /* AXI priority */
+#define BCM2835_DMA_PANIC_PRIORITY(x) (((x) & 15) << 20) /* panic priority */
 /* current value of TI.BCM2835_DMA_WAIT_RESP */
 #define BCM2835_DMA_WAIT_FOR_WRITES BIT(28)
 #define BCM2835_DMA_DIS_DEBUG	BIT(29) /* disable debug pause signal */
@@ -136,9 +136,9 @@ struct bcm2835_desc {
 #define BCM2835_DMA_S_WIDTH	BIT(9) /* 128bit writes if set */
 #define BCM2835_DMA_S_DREQ	BIT(10) /* enable SREQ for source */
 #define BCM2835_DMA_S_IGNORE	BIT(11) /* ignore source reads - read 0 */
-#define BCM2835_DMA_BURST_LENGTH(x) ((x & 15) << 12)
-#define BCM2835_DMA_PER_MAP(x)	((x & 31) << 16) /* REQ source */
-#define BCM2835_DMA_WAIT(x)	((x & 31) << 21) /* add DMA-wait cycles */
+#define BCM2835_DMA_BURST_LENGTH(x) (((x) & 15) << 12)
+#define BCM2835_DMA_PER_MAP(x)	(((x) & 31) << 16) /* REQ source */
+#define BCM2835_DMA_WAIT(x)	(((x) & 31) << 21) /* add DMA-wait cycles */
 #define BCM2835_DMA_NO_WIDE_BURSTS BIT(26) /* no 2 beat write bursts */
 
 /* debug register bits */
@@ -214,17 +214,15 @@ static void bcm2835_dma_free_cb_chain(struct bcm2835_desc *desc)
 
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
 
@@ -281,10 +279,13 @@ static void bcm2835_dma_create_cb_set_length(
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
@@ -326,10 +327,10 @@ static struct bcm2835_desc *bcm2835_dma_create_cb_chain(
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
@@ -353,7 +354,7 @@ static struct bcm2835_desc *bcm2835_dma_create_cb_chain(
 	d->cb_list[d->frames - 1].cb->info |= finalextrainfo;
 
 	/* detect a size mismatch */
-	if (buf_len && (d->size != buf_len))
+	if (buf_len && d->size != buf_len)
 		goto error_cb;
 
 	return d;
@@ -393,7 +394,7 @@ static void bcm2835_dma_fill_cb_chain_with_sg(
 static void bcm2835_dma_abort(struct bcm2835_chan *c)
 {
 	void __iomem *chan_base = c->chan_base;
-	long int timeout = 10000;
+	long timeout = 10000;
 
 	/*
 	 * A zero control block address means the channel is idle.
@@ -421,7 +422,6 @@ static void bcm2835_dma_abort(struct bcm2835_chan *c)
 static void bcm2835_dma_start_desc(struct bcm2835_chan *c)
 {
 	struct virt_dma_desc *vd = vchan_next_desc(&c->vc);
-	struct bcm2835_desc *d;
 
 	if (!vd) {
 		c->desc = NULL;
@@ -430,9 +430,9 @@ static void bcm2835_dma_start_desc(struct bcm2835_chan *c)
 
 	list_del(&vd->node);
 
-	c->desc = d = to_bcm2835_dma_desc(&vd->tx);
+	c->desc = to_bcm2835_dma_desc(&vd->tx);
 
-	writel(d->cb_list[0].paddr, c->chan_base + BCM2835_DMA_ADDR);
+	writel(c->desc->cb_list[0].paddr, c->chan_base + BCM2835_DMA_ADDR);
 	writel(BCM2835_DMA_ACTIVE, c->chan_base + BCM2835_DMA_CS);
 }
 
@@ -543,7 +543,8 @@ static size_t bcm2835_dma_desc_size_pos(struct bcm2835_desc *d, dma_addr_t addr)
 }
 
 static enum dma_status bcm2835_dma_tx_status(struct dma_chan *chan,
-	dma_cookie_t cookie, struct dma_tx_state *txstate)
+					     dma_cookie_t cookie,
+					     struct dma_tx_state *txstate)
 {
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct virt_dma_desc *vd;
@@ -843,7 +844,7 @@ static const struct of_device_id bcm2835_dma_of_match[] = {
 MODULE_DEVICE_TABLE(of, bcm2835_dma_of_match);
 
 static struct dma_chan *bcm2835_dma_xlate(struct of_phandle_args *spec,
-					   struct of_dma *ofdma)
+					  struct of_dma *ofdma)
 {
 	struct bcm2835_dmadev *d = ofdma->of_dma_data;
 	struct dma_chan *chan;
@@ -887,7 +888,7 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
 	int i, j;
 	int irq[BCM2835_DMA_MAX_DMA_CHAN_SUPPORTED + 1];
 	int irq_flags;
-	uint32_t chans_available;
+	u32 chans_available;
 	char chan_name[BCM2835_DMA_CHAN_NAME_SIZE];
 
 	if (!pdev->dev.dma_mask)
@@ -946,8 +947,8 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
 
 	/* Request DMA channel mask from device tree */
 	if (of_property_read_u32(pdev->dev.of_node,
-			"brcm,dma-channel-mask",
-			&chans_available)) {
+				 "brcm,dma-channel-mask",
+				 &chans_available)) {
 		dev_err(&pdev->dev, "Failed to get channel mask\n");
 		rc = -EINVAL;
 		goto err_no_dma;
@@ -986,7 +987,7 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
 		/* check if there are other channels that also use this irq */
 		irq_flags = 0;
 		for (j = 0; j <= BCM2835_DMA_MAX_DMA_CHAN_SUPPORTED; j++)
-			if ((i != j) && (irq[j] == irq[i])) {
+			if (i != j && irq[j] == irq[i]) {
 				irq_flags = IRQF_SHARED;
 				break;
 			}
@@ -1001,7 +1002,7 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
 
 	/* Device-tree DMA controller registration */
 	rc = of_dma_controller_register(pdev->dev.of_node,
-			bcm2835_dma_xlate, od);
+					bcm2835_dma_xlate, od);
 	if (rc) {
 		dev_err(&pdev->dev, "Failed to register DMA controller\n");
 		goto err_no_dma;
-- 
2.51.0

