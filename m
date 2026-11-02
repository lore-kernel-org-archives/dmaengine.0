Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793610445;
	b=wDjia5Va13EeWFOX4HHxnDubSZG849QLVs4jTF0C6hhgPOIutabwMrn6tNLtXhmHMq0D
	 XuqmRHlxgtIKhS79nuWS4RXQgaQna3rjDNCv8zD4ScPtjwiR0xUaPysQWorA8lyDqxoLS
	 FzuGigRSgjdySPPKG4aoOOutl1MZReUPcawgqn9lKqDoSPsr4KXCOp9IfTjugH8qQEm60
	 FJK37KWUGKiyBZesTqiHNP6rRpQM9KxZmlUI+AjZjWN1D48bWyzz3tiig8tXszpo9n37v
	 7/pS6EmHdym8vvyX8T29/po9nc4LTe3L29RoKHSvPLHioWZOlU9NDns4DQJU7g4L3zQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793610445;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pjQYiZHz51mTKQDhEApm7WTzFAH0CZ0oe9+OyBtnarM=;
	b=t+YO1BbrSSAIU6No9NBXRhoFqgEEDgxZXBaMHr0e5cZrOPzz4JTRyYY3qfsB4OMWlH95
	 YFjKQWPmh4+j1pCjCxnvUs3rd3+Mfe8AvTlCmHdfP+eoaqnts6xoaa0ad15qG5UZDInJj
	 9JurwpGMM6BrZspYulbs2Rmu8zHvWP37U5qDxcg4FGB3ej+7e40FB/O0wvqVQIv9DYlDV
	 B0ZmiGnHhf52v0JLPS/gdSgHmSyUdsKeGM2FAkBwxeAmqzZCCgmYCwrLYaGt4j7DHlZSy
	 OlgsbhkNO9LplFtiKjdwgH6T+Qz1Dw8BrPWc4nAr8DX38ka7CzoCjy+E7DO3+lTDRJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y4kNoyhl;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2797606A324
	for <dmaengine@vger.kernel.org>; Mon,  2 Nov 2026 09:07:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2797606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y4kNoyhl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so28589965e9.3
        for <dmaengine@vger.kernel.org>; Mon, 02 Nov 2026 01:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793610443; x=1794215243; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pjQYiZHz51mTKQDhEApm7WTzFAH0CZ0oe9+OyBtnarM=;
        b=Y4kNoyhlBBoHprvvvloaTmptVS9YhjOHGqYAd87DtXbmHQsnwYxIXX4paoj4huko7E
         e7HdsS3s9VorEU6KnqXt/EY4vChGPAD5h4QHawHUZU0ybqO78v7l7yp68ij3/WGUDFQq
         WDRpB/InsAL3aK3JDrd7s/UGRBKWVW6xcaA7q2VhiZmw5ud4RxxzYxfq4RF32qOYshj+
         b8bZ6idvC9J84AjW0+Wp0Pvbs0ijetXHDfaZ5yHu5s+DElHTVkj+yVkWVrbQj64904kj
         6UZjQUIqCDPPPPNojU+adbyq3N9RRU+Sq1ZszIPTDR2wsYCYVTgN/pzq2Ye4d/N4Pl2m
         +4ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793610443; x=1794215243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pjQYiZHz51mTKQDhEApm7WTzFAH0CZ0oe9+OyBtnarM=;
        b=P0C6T79tbESWrZb26WhGVG0rkDP+pHWOaVmRJZCYkJrbQVa3xNPA5ZWgKArrg7pBRx
         LjyZ+jZJ3mj2s1TqZ+n2wzXrHWeVCTDsEcK9HFVXyyDrrB8gkTIRbzcRIWrrDsFADlM8
         1OMl1by/dCRlxxBirMEiwcvW0knaWcnhS06ZtcUPge/ZEa9H7fa5CE3vx/vYKhrBrHTN
         997vHBX5S539J6YXLEtRnBxvi8iiwKQtDzncEmN7tJMBH3mlz+GGJrQ/UlMHtIlqsIrJ
         Drc3vBwZUIAoUrjZOFlNOXSXvwsLswlSqHh9AMROPBCVZv3IJ8aimgJR3e00JlWI+G1W
         BfzQ==
X-Forwarded-Encrypted: i=1; AKwUvByNJnewx9f97R9Z6i7zgHqR/gILEVydogfvQd0g5aTnUVQJ6o906WfbzuL/fDU1byPKkp9YDRBhZJ8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKY8WAlzNZAfaSw86MCkKoaTGHNjZewHEvS2a3GE0W2GMBltq0/
	C5L6I8L41joLIIQGDYeAuEb6JWze8BC/HOsCUKFTG5uV5I2jbECtWj3W
X-Gm-Gg: AYBFou3OmdBqT4ldxTv5v5LbItFjXNu3213509tZPRBC2ipzh49Cjen9zs5N+gPYL3O
	+UlpPUkatc4McshUjh0t+8TmxUxAaswo9FM1sm8eUasXBeIcQabbicRkkYJOUI3Snc2+GQuVUsB
	siASuHaz28Iz4zYX2UTg9MXsPV06IqFqyf4ARZxr8whxV2MdRjJTlOTv3WYEbqz0yFtUOtpvJ4L
	0imJwshY4bG/cDsBMYeaLQOSD6KxSiB4S8TlCkhqpaEhtg4wcnlqFEQaLapCzQFJxpb30fWf7eM
	qhXB0ejW/1lrdcumwkHlKtHZ59/Yud1Wi58HlrP5UImB71cW1gJKG7XoG4nBR6VoMkSz4E/+G0x
	e8yF+e+7KcMea4jCWZp7BaGESTS+C2liEjrZA7WWWDlkaeFqun3wzKRgQSBEGN9/5vA9c8iZ80t
	99Y81AcwuI2sgwOf7WKicV/sNpnfanAxlnoZufGaSR3WxQETeoRmLpUT3Gb7RmWvV1rU7foiWNv
	L9sNStDKnw7yUnOsjkszuYZ6nDMJBd6wmM/v+C06Izhyz4D7JdHQWWJE6mkdQo1+WqCWDsT1TVO
	3jG59lmVZPR20UERcmgLGsMYnVOysr2Z1lB1haI+zEm8FJwJfGv5jd/EbkR0L16SUJeg32D6Vt9
	OdZY9/VM+0VJyS2+bVdD4LKPb8KE5C7qLRO4v2kbD0s9DBZq0fML4dtxF4BJJMPWhAnL5uVNyn5
	WdCN4+gHX4lk+L
X-Received: by 2002:a05:600c:a41:b0:4a0:1c0e:b057 with SMTP id 5b1f17b1804b1-4ac150b2136mr201903515e9.4.1793610442989;
        Mon, 02 Nov 2026 01:07:22 -0800 (PST)
Received: from cypher.home.roving-it.com ([2001:8b0:fb11:0:3889:86e0:d449:e2e1])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm417879945e9.3.2026.11.02.01.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:07:22 -0800 (PST)
From: Peter Robinson <pbrobinson@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH 2/9] dmaengine: bcm2835: Refactor control block handling
Date: Mon,  2 Nov 2026 09:06:52 +0000
Message-ID: <20261102090713.896324-3-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102090713.896324-1-pbrobinson@gmail.com>
References: <20261102090713.896324-1-pbrobinson@gmail.com>
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

Access control blocks through small helpers and pass struct
bcm2835_chan to the internal chain builders, and add per-compatible
match data holding the DMA mask. This prepares for channels with a
different control block layout.

No functional change.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 drivers/dma/bcm2835-dma.c | 185 +++++++++++++++++++++++++++-----------
 1 file changed, 134 insertions(+), 51 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index 06d830d368822..96a39eb24559f 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -37,17 +37,27 @@
 #define BCM2835_DMA_MAX_DMA_CHAN_SUPPORTED 14
 #define BCM2835_DMA_CHAN_NAME_SIZE 8
 
+/**
+ * struct bcm2835_dma_cfg - SoC specific controller properties
+ * @dma_mask: addressing capability of the controller
+ */
+struct bcm2835_dma_cfg {
+	u64 dma_mask;
+};
+
 /**
  * struct bcm2835_dmadev - BCM2835 DMA controller
  * @ddev: DMA device
  * @base: base address of register map
  * @zero_page: bus address of zero page (to detect transactions copying from
  *	zero page and avoid accessing memory if so)
+ * @cfg: SoC specific controller properties
  */
 struct bcm2835_dmadev {
 	struct dma_device ddev;
 	void __iomem *base;
 	dma_addr_t zero_page;
+	const struct bcm2835_dma_cfg *cfg;
 };
 
 struct bcm2835_dma_cb {
@@ -172,6 +182,10 @@ struct bcm2835_desc {
 #define MAX_DMA_LEN SZ_1G
 #define MAX_LITE_DMA_LEN (SZ_64K - 4)
 
+static const struct bcm2835_dma_cfg bcm2835_dma_cfg = {
+	.dma_mask = DMA_BIT_MASK(32),
+};
+
 static inline size_t bcm2835_dma_max_frame_length(struct bcm2835_chan *c)
 {
 	/* lite and normal channels have different max frame length */
@@ -201,6 +215,76 @@ static inline struct bcm2835_desc *to_bcm2835_dma_desc(
 	return container_of(t, struct bcm2835_desc, vd.tx);
 }
 
+static void bcm2835_dma_cb_set_src(struct bcm2835_chan *c,
+				   struct bcm2835_cb_entry *e, dma_addr_t addr)
+{
+	e->cb->src = addr;
+}
+
+static void bcm2835_dma_cb_set_dst(struct bcm2835_chan *c,
+				   struct bcm2835_cb_entry *e, dma_addr_t addr)
+{
+	e->cb->dst = addr;
+}
+
+static void bcm2835_dma_cb_init(struct bcm2835_chan *c,
+				struct bcm2835_cb_entry *e, u32 info,
+				dma_addr_t src, dma_addr_t dst)
+{
+	struct bcm2835_dma_cb *cb = e->cb;
+
+	cb->info = info;
+	cb->length = 0;
+	cb->stride = 0;
+	cb->next = 0;
+
+	bcm2835_dma_cb_set_src(c, e, src);
+	bcm2835_dma_cb_set_dst(c, e, dst);
+}
+
+static u32 bcm2835_dma_cb_get_len(struct bcm2835_chan *c,
+				  struct bcm2835_cb_entry *e)
+{
+	return e->cb->length;
+}
+
+static void bcm2835_dma_cb_set_len(struct bcm2835_chan *c,
+				   struct bcm2835_cb_entry *e, u32 len)
+{
+	e->cb->length = len;
+}
+
+static void bcm2835_dma_cb_add_info(struct bcm2835_chan *c,
+				    struct bcm2835_cb_entry *e, u32 info)
+{
+	e->cb->info |= info;
+}
+
+static void bcm2835_dma_cb_set_next(struct bcm2835_chan *c,
+				    struct bcm2835_cb_entry *e,
+				    dma_addr_t next)
+{
+	e->cb->next = next;
+}
+
+/* Memory side address of a control block */
+static dma_addr_t bcm2835_dma_cb_mem_addr(struct bcm2835_chan *c,
+					  struct bcm2835_cb_entry *e,
+					  enum dma_transfer_direction dir)
+{
+	return dir == DMA_DEV_TO_MEM ? e->cb->dst : e->cb->src;
+}
+
+static dma_addr_t bcm2835_dma_get_pos(struct bcm2835_chan *c,
+				      enum dma_transfer_direction dir)
+{
+	void __iomem *base = c->chan_base;
+
+	if (dir == DMA_DEV_TO_MEM)
+		return readl(base + BCM2835_DMA_DEST_AD);
+	return readl(base + BCM2835_DMA_SOURCE_AD);
+}
+
 static void bcm2835_dma_free_cb_chain(struct bcm2835_desc *desc)
 {
 	size_t i;
@@ -220,16 +304,18 @@ static void bcm2835_dma_desc_free(struct virt_dma_desc *vd)
 
 static void bcm2835_dma_create_cb_set_length(
 	struct bcm2835_chan *chan,
-	struct bcm2835_dma_cb *control_block,
+	struct bcm2835_cb_entry *cb_entry,
 	size_t len,
 	size_t period_len,
 	size_t *total_len,
 	u32 finalextrainfo)
 {
 	size_t max_len = bcm2835_dma_max_frame_length(chan);
+	u32 cb_len;
 
 	/* set the length taking lite-channel limitations into account */
-	control_block->length = min_t(u32, len, max_len);
+	cb_len = min_t(u32, len, max_len);
+	bcm2835_dma_cb_set_len(chan, cb_entry, cb_len);
 
 	/* finished if we have no period_length */
 	if (!period_len)
@@ -244,26 +330,26 @@ static void bcm2835_dma_create_cb_set_length(
 	 */
 
 	/* have we filled in period_length yet? */
-	if (*total_len + control_block->length < period_len) {
+	if (*total_len + cb_len < period_len) {
 		/* update number of bytes in this period so far */
-		*total_len += control_block->length;
+		*total_len += cb_len;
 		return;
 	}
 
 	/* calculate the length that remains to reach period_length */
-	control_block->length = period_len - *total_len;
+	bcm2835_dma_cb_set_len(chan, cb_entry, period_len - *total_len);
 
 	/* reset total_length for next period */
 	*total_len = 0;
 
 	/* add extrainfo bits in info */
-	control_block->info |= finalextrainfo;
+	bcm2835_dma_cb_add_info(chan, cb_entry, finalextrainfo);
 }
 
 /**
  * bcm2835_dma_create_cb_chain - create a control block and fills data in
  *
- * @chan:           the @dma_chan for which we run this
+ * @c:              the channel for which we run this
  * @direction:      the direction in which we transfer
  * @cyclic:         it is a cyclic transfer
  * @info:           the default info bits to apply per controlblock
@@ -281,17 +367,16 @@ static void bcm2835_dma_create_cb_set_length(
  * @gfp:            the GFP flag to use for allocation
  */
 static struct bcm2835_desc *bcm2835_dma_create_cb_chain(
-	struct dma_chan *chan, enum dma_transfer_direction direction,
+	struct bcm2835_chan *c, enum dma_transfer_direction direction,
 	bool cyclic, u32 info, u32 finalextrainfo, size_t frames,
 	dma_addr_t src, dma_addr_t dst, size_t buf_len,
 	size_t period_len, gfp_t gfp)
 {
-	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	size_t len = buf_len, total_len;
 	size_t frame;
 	struct bcm2835_desc *d;
 	struct bcm2835_cb_entry *cb_entry;
-	struct bcm2835_dma_cb *control_block;
+	u32 cb_len;
 
 	if (!frames)
 		return NULL;
@@ -317,40 +402,38 @@ static struct bcm2835_desc *bcm2835_dma_create_cb_chain(
 			goto error_cb;
 
 		/* fill in the control block */
-		control_block = cb_entry->cb;
-		control_block->info = info;
-		control_block->src = src;
-		control_block->dst = dst;
-		control_block->stride = 0;
-		control_block->next = 0;
+		bcm2835_dma_cb_init(c, cb_entry, info, src, dst);
+
 		/* set up length in control_block if requested */
 		if (buf_len) {
 			/* calculate length honoring period_length */
 			bcm2835_dma_create_cb_set_length(
-				c, control_block,
+				c, cb_entry,
 				len, period_len, &total_len,
 				cyclic ? finalextrainfo : 0);
-
-			/* calculate new remaining length */
-			len -= control_block->length;
 		}
+		cb_len = bcm2835_dma_cb_get_len(c, cb_entry);
+
+		/* calculate new remaining length */
+		len -= cb_len;
 
 		/* link this the last controlblock */
 		if (frame)
-			d->cb_list[frame - 1].cb->next = cb_entry->paddr;
+			bcm2835_dma_cb_set_next(c, &d->cb_list[frame - 1],
+						cb_entry->paddr);
 
 		/* update src and dst and length */
 		if (src && (info & BCM2835_DMA_S_INC))
-			src += control_block->length;
+			src += cb_len;
 		if (dst && (info & BCM2835_DMA_D_INC))
-			dst += control_block->length;
+			dst += cb_len;
 
 		/* Length of total transfer */
-		d->size += control_block->length;
+		d->size += cb_len;
 	}
 
 	/* the last frame requires extra flags */
-	d->cb_list[d->frames - 1].cb->info |= finalextrainfo;
+	bcm2835_dma_cb_add_info(c, &d->cb_list[d->frames - 1], finalextrainfo);
 
 	/* detect a size mismatch */
 	if (buf_len && (d->size != buf_len))
@@ -364,14 +447,13 @@ static struct bcm2835_desc *bcm2835_dma_create_cb_chain(
 }
 
 static void bcm2835_dma_fill_cb_chain_with_sg(
-	struct dma_chan *chan,
+	struct bcm2835_chan *c,
 	enum dma_transfer_direction direction,
 	struct bcm2835_cb_entry *cb,
 	struct scatterlist *sgl,
 	unsigned int sg_len)
 {
-	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
-	size_t len, max_len;
+	size_t len, max_len, cb_len;
 	unsigned int i;
 	dma_addr_t addr;
 	struct scatterlist *sgent;
@@ -380,12 +462,13 @@ static void bcm2835_dma_fill_cb_chain_with_sg(
 	for_each_sg(sgl, sgent, sg_len, i) {
 		for (addr = sg_dma_address(sgent), len = sg_dma_len(sgent);
 		     len > 0;
-		     addr += cb->cb->length, len -= cb->cb->length, cb++) {
+		     addr += cb_len, len -= cb_len, cb++) {
 			if (direction == DMA_DEV_TO_MEM)
-				cb->cb->dst = addr;
+				bcm2835_dma_cb_set_dst(c, cb, addr);
 			else
-				cb->cb->src = addr;
-			cb->cb->length = min(len, max_len);
+				bcm2835_dma_cb_set_src(c, cb, addr);
+			cb_len = min(len, max_len);
+			bcm2835_dma_cb_set_len(c, cb, cb_len);
 		}
 	}
 }
@@ -524,14 +607,9 @@ static size_t bcm2835_dma_desc_size_pos(struct bcm2835_desc *d, dma_addr_t addr)
 	size_t size;
 
 	for (size = i = 0; i < d->frames; i++) {
-		struct bcm2835_dma_cb *control_block = d->cb_list[i].cb;
-		size_t this_size = control_block->length;
-		dma_addr_t dma;
-
-		if (d->dir == DMA_DEV_TO_MEM)
-			dma = control_block->dst;
-		else
-			dma = control_block->src;
+		struct bcm2835_cb_entry *e = &d->cb_list[i];
+		size_t this_size = bcm2835_dma_cb_get_len(d->c, e);
+		dma_addr_t dma = bcm2835_dma_cb_mem_addr(d->c, e, d->dir);
 
 		if (size)
 			size += this_size;
@@ -563,10 +641,8 @@ static enum dma_status bcm2835_dma_tx_status(struct dma_chan *chan,
 		struct bcm2835_desc *d = c->desc;
 		dma_addr_t pos;
 
-		if (d->dir == DMA_MEM_TO_DEV)
-			pos = readl(c->chan_base + BCM2835_DMA_SOURCE_AD);
-		else if (d->dir == DMA_DEV_TO_MEM)
-			pos = readl(c->chan_base + BCM2835_DMA_DEST_AD);
+		if (is_slave_direction(d->dir))
+			pos = bcm2835_dma_get_pos(c, d->dir);
 		else
 			pos = 0;
 
@@ -611,7 +687,7 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_memcpy(
 	frames = bcm2835_dma_frames_for_length(len, max_len);
 
 	/* allocate the CB chain - this also fills in the pointers */
-	d = bcm2835_dma_create_cb_chain(chan, DMA_MEM_TO_MEM, false,
+	d = bcm2835_dma_create_cb_chain(c, DMA_MEM_TO_MEM, false,
 					info, extra, frames,
 					src, dst, len, 0, GFP_KERNEL);
 	if (!d)
@@ -658,7 +734,7 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_slave_sg(
 	frames = sg_nents_for_dma(sgl, sg_len, bcm2835_dma_max_frame_length(c));
 
 	/* allocate the CB chain */
-	d = bcm2835_dma_create_cb_chain(chan, direction, false,
+	d = bcm2835_dma_create_cb_chain(c, direction, false,
 					info, extra,
 					frames, src, dst, 0, 0,
 					GFP_NOWAIT);
@@ -666,7 +742,7 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_slave_sg(
 		return NULL;
 
 	/* fill in frames with scatterlist pointers */
-	bcm2835_dma_fill_cb_chain_with_sg(chan, direction, d->cb_list,
+	bcm2835_dma_fill_cb_chain_with_sg(c, direction, d->cb_list,
 					  sgl, sg_len);
 
 	return vchan_tx_prep(&c->vc, &d->vd, flags);
@@ -745,7 +821,7 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
 	 * note that we need to use GFP_NOWAIT, as the ALSA i2s dmaengine
 	 * implementation calls prep_dma_cyclic with interrupts disabled.
 	 */
-	d = bcm2835_dma_create_cb_chain(chan, direction, true,
+	d = bcm2835_dma_create_cb_chain(c, direction, true,
 					info, extra,
 					frames, src, dst, buf_len,
 					period_len, GFP_NOWAIT);
@@ -753,7 +829,8 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
 		return NULL;
 
 	/* wrap around into a loop */
-	d->cb_list[d->frames - 1].cb->next = d->cb_list[0].paddr;
+	bcm2835_dma_cb_set_next(c, &d->cb_list[d->frames - 1],
+				d->cb_list[0].paddr);
 
 	return vchan_tx_prep(&c->vc, &d->vd, flags);
 }
@@ -837,7 +914,7 @@ static void bcm2835_dma_free(struct bcm2835_dmadev *od)
 }
 
 static const struct of_device_id bcm2835_dma_of_match[] = {
-	{ .compatible = "brcm,bcm2835-dma", },
+	{ .compatible = "brcm,bcm2835-dma", .data = &bcm2835_dma_cfg },
 	{},
 };
 MODULE_DEVICE_TABLE(of, bcm2835_dma_of_match);
@@ -881,6 +958,7 @@ static const struct dev_pm_ops bcm2835_dma_pm_ops = {
 
 static int bcm2835_dma_probe(struct platform_device *pdev)
 {
+	const struct bcm2835_dma_cfg *cfg;
 	struct bcm2835_dmadev *od;
 	void __iomem *base;
 	int rc;
@@ -890,10 +968,14 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
 	uint32_t chans_available;
 	char chan_name[BCM2835_DMA_CHAN_NAME_SIZE];
 
+	cfg = of_device_get_match_data(&pdev->dev);
+	if (!cfg)
+		return -EINVAL;
+
 	if (!pdev->dev.dma_mask)
 		pdev->dev.dma_mask = &pdev->dev.coherent_dma_mask;
 
-	rc = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
+	rc = dma_set_mask_and_coherent(&pdev->dev, cfg->dma_mask);
 	if (rc) {
 		dev_err(&pdev->dev, "Unable to set DMA mask\n");
 		return rc;
@@ -910,6 +992,7 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
 		return PTR_ERR(base);
 
 	od->base = base;
+	od->cfg = cfg;
 
 	dma_cap_set(DMA_SLAVE, od->ddev.cap_mask);
 	dma_cap_set(DMA_PRIVATE, od->ddev.cap_mask);
-- 
2.56.0

