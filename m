Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445634;
	b=LNM75zKdn6zCnJ4aRk4CSnj2mzPAIrGF+IiZdmpBqVA2WmRPJf/NacNB8pIF24KaAOJR
	 5LSwiukcp3z99z8iIf4iDS+y8UvANXWt8Tx8pIMD3qFn8e5cDoyZA5KkuGs2ClorgAc61
	 6D9s0hlDZa5wzNjHsTN10DefQG9jScnAhKKXpLi6W12gj0BMZCPZxD9p4Xtkwif8HxSoj
	 fCikbJ0YlHYN40nQgi4WXHxnviGd8ztQdWdT4d9mjjKm5K6yoh+leccR9arNxb1aZtzNG
	 PPxeDYC6GSm9XbHj+213c8+CBhqBBKpoXjMSshQEGUtptQZGABoFxyLyVEJcytVyUCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445634;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/uN9CCocTKEokGliyoJcgDLG/c43neFA0CPZx5pFO0M=;
	b=4DJb6yxgQ8/jcWYjv5x2RW+D+UYz1rsLmN2Jux7PMwFIB6HhfbBkq4pckd9+17z0NuCF
	 UHcf7HZMJRUgY8OjyZ8sldAev7kIj5A91vH2My8m6KihK4kV/7LylPKtDxVACfkRR3KXV
	 Jwvb/g0SkXF9sOexRaFjEC7GIhnMKebc+6fhy/yO8zerhCC+p+FXw6qCjH68LE3QPFR2E
	 Aw4me3N8CBHFnvwZnloiF5vIBHh6/wAq8Xhawk7ak7+ChbfzgqpbxdqBjs8NlSNvz6itT
	 curris7HQCLqse4oyO0R+GQZZZr3CUOdtfEgDYE9toc9LIBbu3ql5hLY814/V3PXmNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=HgORK08t;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E5C60A3838
	for <dmaengine@vger.kernel.org>; Mon, 23 Nov 2026 14:53:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10E5C60A3838
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=HgORK08t
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so33193205e9.1
        for <dmaengine@vger.kernel.org>; Mon, 23 Nov 2026 06:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445631; x=1796050431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/uN9CCocTKEokGliyoJcgDLG/c43neFA0CPZx5pFO0M=;
        b=HgORK08tt+DxUG3S7psU5qmDPPdGkc4IuMGvw5t5kvmhcizZwXllI5cpY8lOMkCmW2
         FVxwUGqsqS9bZKy/yVocihk4xNXQ8k5onWVMHfo0F9BxTcCy0YKzA9IOp6n0fcTWh4jN
         0eWCLTh7ampJUP3I6yBn+z3T51F1nGmOytUIDYEdlpTeYZIb5p6lA4JOXTeOHHqhFBwy
         B4GfgLoCBXwPTrUHTafpxbPNDWNUAovJykxEseaZXdn1YTDWTVC7y6W6pne2sx2Rurse
         el2Hrppxf0cMnoJZyw+NM/Um5YjUiAz2CfLlegBM+GtaooPkqGYJZoUglfv602ng+IBq
         FpoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445631; x=1796050431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/uN9CCocTKEokGliyoJcgDLG/c43neFA0CPZx5pFO0M=;
        b=NwoucxXnLnegrcic9xi7eWcAwnWXMhfFyMZg1u+QM3Jfa/VDBaoFREgOdZbUJNos1C
         FBQjjUJByE5sq5TYIps1tihXzb5xU/JNF4tJNIMUKteAJA2yUDvPpQoEHFHqQVfKsnqq
         l98H7MB6DMj52dwj9nojYaPOUzIVyXfrQ4Xco2S+DwcBMCdPGTZu/bLthuNxabKXvE67
         WFWIIH1gn89ZyWo71bR1qlDUHWY+o3602v4ja7DZ/Th3azRShY+vYS+/dsYUYj1F0NrT
         3F49dmiQfDGkr357yKxyIwTg91/+Q7cFOiG3kTP8pLKIoRj96+gyAMM/0HtRuqWARTuE
         8Y6Q==
X-Forwarded-Encrypted: i=1; AL+hErE3C9uPoYpDDH+5eeKY+yrEISyPo301gnnxBWm9DbHkIBI3dGhbyIFnqPA4JValYkcYfviQQ0juzDI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8uBmias841dKMCcPeVvyX9Se0FnIouhGi25NiSCRIhReWzmvVJ
	8OiiF23DxjTjwUcZzcU7TByvJmHOg+tH1r2Wd0p4R0ZpydxmAUDB1EiaRcekJMn+qw0=
X-Gm-Gg: AZFdTZdo4sPWZLCsPfeeISEQqOHl22nJ2Br/Y7dhEse6N/AFxieBb6XnmdzHk4+idIl
	SFMnt6aNjZvsJBl2AcHFzL5275qs3f3J7azkLtq8B+b9MMD9E+pDFTLnyf+2MZ/46bxX7P6AF4V
	VfEw6n477vm+X5pA2u0K+a/bAaVBgZCxn7MlR1O6ngQ7cjIg/RR3YWjWtaJVB9zfvk4zu+UE3WX
	62hV1K6ATYM6S5HCA0MCJ4eDkHRBh9SRa5mmPglAuxx5bAVkE/CfNDjp2f8OvQ2nSQ9W8viV/qX
	R0ffEfBDvIIYJLx07lLwLYdt20UtzDs02F2Rjk4zinChlqSe9nXdd8Q5bRzINZPRo9/DXyG7AfZ
	BWXw54bQ75IF5NJvGoYK5dlECneAy594pKoUPzy2QVHcKEjXa2ZWqvaOe/BwvKWxFJgDCsbpIxT
	VLTSSy/1EG1pU6xLbOBhnwDSQW+mziSquZe9lK51sMr5eGeZbbRXqrKDdkl/+vVlMLLmkWqnBRn
	/VoEjMfk9Svh8ulWNOo+P3/mgMsABqCnylZBpMNrT/lk5LyrXnbrEYo/UD1TmiVmMS7v0BOD0g5
	mmLxxR3UV87tkvwjebMSMt4nzwE=
X-Received: by 2002:a05:600d:600b:b0:4a2:18c4:61a5 with SMTP id 5b1f17b1804b1-4bb887fb6e7mr246727955e9.6.1795445631196;
        Mon, 23 Nov 2026 06:53:51 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853b2437sm528796555e9.13.2026.11.23.06.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:53:50 -0800 (PST)
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
Subject: [PATCH v3 13/28] dmaengine: bcm2835: introduce multi platform support
Date: Mon, 23 Nov 2026 15:56:51 +0100
Message-ID: <20261123145728.29082-14-andrea.porta@suse.com>
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

This finally moves all platform specific stuff into a separate structure,
which is initialized on the OF compatible during probing. Since the DMA
control block is different on the BCM2711 platform, we introduce a common
control block to reserve the necessary space and adequate methods for
access.

The abort sequence is completely different on the 40-bit channels, so
make it a platform callback instead of trying to describe it through
register offsets and bit masks.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/dma/bcm2835-dma.c | 337 ++++++++++++++++++++++++++++++--------
 1 file changed, 266 insertions(+), 71 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index d048cb00ce5d..f8b2202096d6 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -48,6 +48,11 @@ struct bcm2835_dmadev {
 	struct dma_device ddev;
 	void __iomem *base;
 	dma_addr_t zero_page;
+	const struct bcm2835_dma_cfg *cfg;
+};
+
+struct bcm_dma_cb {
+	u32 rsvd[8];
 };
 
 struct bcm2835_dma_cb {
@@ -61,7 +66,7 @@ struct bcm2835_dma_cb {
 };
 
 struct bcm2835_cb_entry {
-	struct bcm2835_dma_cb *cb;
+	struct bcm_dma_cb *cb;
 	dma_addr_t paddr;
 };
 
@@ -82,6 +87,59 @@ struct bcm2835_chan {
 	bool is_lite_channel;
 };
 
+/**
+ * struct bcm2835_dma_cfg - platform specific description of the DMA channels
+ * @cs_reg: offset of the control and status register
+ * @cb_reg: offset of the control block address register
+ * @int_mask: interrupt status bit in the CS register
+ * @active_mask: channel active bit in the CS register
+ * @cb_get_length: get the transfer length of a control block
+ * @cb_get_addr: get the memory side address of a control block
+ * @cb_init: initialize a control block
+ * @cb_set_src: set the source address of a control block
+ * @cb_set_dst: set the destination address of a control block
+ * @cb_set_next: link a control block to the next one
+ * @cb_set_length: set the transfer length of a control block
+ * @cb_append_extra: add the interrupt and completion bits to a control block
+ * @to_cb_addr: convert a control block bus address to its register format
+ * @chan_plat_init: platform specific channel initialization
+ * @read_addr: read the current memory side address of a channel
+ * @cs_flags: per-channel flags for the CS register
+ * @abort: stop and reset a channel
+ */
+struct bcm2835_dma_cfg {
+	u32 cs_reg;
+	u32 cb_reg;
+
+	u32 int_mask;
+	u32 active_mask;
+
+	u32 (*cb_get_length)(void *data);
+	dma_addr_t (*cb_get_addr)(void *data, enum dma_transfer_direction);
+
+	void (*cb_init)(void *data, struct bcm2835_chan *c,
+			enum dma_transfer_direction direction, dma_addr_t src,
+			dma_addr_t dst, bool zero_page);
+	void (*cb_set_src)(void *data, enum dma_transfer_direction direction,
+			   dma_addr_t src);
+	void (*cb_set_dst)(void *data, enum dma_transfer_direction direction,
+			   dma_addr_t dst);
+	void (*cb_set_next)(void *data, u32 next);
+	void (*cb_set_length)(void *data, u32 length);
+	void (*cb_append_extra)(void *data,
+				struct bcm2835_chan *c,
+				enum dma_transfer_direction direction,
+				bool cyclic, bool final, unsigned long flags);
+
+	u32 (*to_cb_addr)(dma_addr_t addr);
+
+	void (*chan_plat_init)(struct bcm2835_chan *c);
+	dma_addr_t (*read_addr)(struct bcm2835_chan *c,
+				enum dma_transfer_direction direction);
+	u32 (*cs_flags)(struct bcm2835_chan *c);
+	void (*abort)(struct bcm2835_chan *c);
+};
+
 struct bcm2835_desc {
 	struct bcm2835_chan *c;
 	struct virt_dma_desc vd;
@@ -215,6 +273,13 @@ static inline struct bcm2835_dmadev *to_bcm2835_dma_dev(struct dma_device *d)
 	return container_of(d, struct bcm2835_dmadev, ddev);
 }
 
+static inline const struct bcm2835_dma_cfg *to_bcm2835_cfg(struct dma_device *d)
+{
+	struct bcm2835_dmadev *od = container_of(d, struct bcm2835_dmadev, ddev);
+
+	return od->cfg;
+}
+
 static inline struct bcm2835_chan *to_bcm2835_dma_chan(struct dma_chan *c)
 {
 	return container_of(c, struct bcm2835_chan, vc.chan);
@@ -291,6 +356,109 @@ static inline bool need_dst_incr(enum dma_transfer_direction direction)
 	return false;
 }
 
+static inline u32 bcm2835_dma_cb_get_length(void *data)
+{
+	struct bcm2835_dma_cb *cb = data;
+
+	return cb->length;
+}
+
+static inline dma_addr_t
+bcm2835_dma_cb_get_addr(void *data, enum dma_transfer_direction direction)
+{
+	struct bcm2835_dma_cb *cb = data;
+
+	if (direction == DMA_DEV_TO_MEM)
+		return cb->dst;
+
+	return cb->src;
+}
+
+static inline void
+bcm2835_dma_cb_init(void *data, struct bcm2835_chan *c,
+		    enum dma_transfer_direction direction, dma_addr_t src,
+		    dma_addr_t dst, bool zero_page)
+{
+	struct bcm2835_dma_cb *cb = data;
+
+	cb->info = bcm2835_dma_prepare_cb_info(c, direction, zero_page);
+	cb->src = src;
+	cb->dst = dst;
+	cb->stride = 0;
+	cb->next = 0;
+}
+
+static inline void
+bcm2835_dma_cb_set_src(void *data, enum dma_transfer_direction direction,
+		       dma_addr_t src)
+{
+	struct bcm2835_dma_cb *cb = data;
+
+	cb->src = src;
+}
+
+static inline void
+bcm2835_dma_cb_set_dst(void *data, enum dma_transfer_direction direction,
+		       dma_addr_t dst)
+{
+	struct bcm2835_dma_cb *cb = data;
+
+	cb->dst = dst;
+}
+
+static inline void bcm2835_dma_cb_set_next(void *data, u32 next)
+{
+	struct bcm2835_dma_cb *cb = data;
+
+	cb->next = next;
+}
+
+static inline void bcm2835_dma_cb_set_length(void *data, u32 length)
+{
+	struct bcm2835_dma_cb *cb = data;
+
+	cb->length = length;
+}
+
+static inline void
+bcm2835_dma_cb_append_extra(void *data, struct bcm2835_chan *c,
+			    enum dma_transfer_direction direction,
+			    bool cyclic, bool final, unsigned long flags)
+{
+	struct bcm2835_dma_cb *cb = data;
+
+	cb->info |= bcm2835_dma_prepare_cb_extra(c, direction, cyclic, final,
+						 flags);
+}
+
+static inline u32 bcm2835_dma_to_cb_addr(dma_addr_t addr)
+{
+	return addr;
+}
+
+static void bcm2835_dma_chan_plat_init(struct bcm2835_chan *c)
+{
+	/* check in DEBUG register if this is a LITE channel */
+	if (readl(c->chan_base + BCM2835_DMA_DEBUG) & BCM2835_DMA_DEBUG_LITE)
+		c->is_lite_channel = true;
+}
+
+static dma_addr_t bcm2835_dma_read_addr(struct bcm2835_chan *c,
+					enum dma_transfer_direction direction)
+{
+	if (direction == DMA_MEM_TO_DEV)
+		return readl(c->chan_base + BCM2835_DMA_SOURCE_AD);
+	else if (direction == DMA_DEV_TO_MEM)
+		return readl(c->chan_base + BCM2835_DMA_DEST_AD);
+
+	return 0;
+}
+
+static u32 bcm2835_dma_cs_flags(struct bcm2835_chan *c)
+{
+	return BCM2835_DMA_CS_FLAGS(c->dreq);
+}
+
 static void bcm2835_dma_free_cb_chain(struct bcm2835_desc *desc)
 {
 	size_t i;
@@ -308,16 +476,19 @@ static void bcm2835_dma_desc_free(struct virt_dma_desc *vd)
 }
 
 static bool bcm2835_dma_create_cb_set_length(struct dma_chan *chan,
-					     struct bcm2835_dma_cb *control_block,
+					     void *data,
 					     size_t len,
 					     size_t period_len,
 					     size_t *total_len)
 {
+	const struct bcm2835_dma_cfg *cfg = to_bcm2835_cfg(chan->device);
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	size_t max_len = bcm2835_dma_max_frame_length(c);
 
 	/* set the length taking lite-channel limitations into account */
-	control_block->length = min_t(u32, len, max_len);
+	u32 length = min_t(u32, len, max_len);
+
+	cfg->cb_set_length(data, length);
 
 	/* finished if we have no period_length */
 	if (!period_len)
@@ -332,14 +503,14 @@ static bool bcm2835_dma_create_cb_set_length(struct dma_chan *chan,
 	 */
 
 	/* have we filled in period_length yet? */
-	if (*total_len + control_block->length < period_len) {
+	if (*total_len + length < period_len) {
 		/* update number of bytes in this period so far */
-		*total_len += control_block->length;
+		*total_len += length;
 		return false;
 	}
 
 	/* calculate the length that remains to reach period_length */
-	control_block->length = period_len - *total_len;
+	cfg->cb_set_length(data, period_len - *total_len);
 
 	/* reset total_length for next period */
 	*total_len = 0;
@@ -371,15 +542,14 @@ static struct bcm2835_desc *bcm2835_dma_create_cb_chain(
 					size_t buf_len, size_t period_len,
 					gfp_t gfp, unsigned long flags)
 {
+	const struct bcm2835_dma_cfg *cfg = to_bcm2835_cfg(chan->device);
 	struct bcm2835_dmadev *od = to_bcm2835_dma_dev(chan->device);
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	size_t len = buf_len, total_len;
 	size_t frame;
 	struct bcm2835_desc *d;
 	struct bcm2835_cb_entry *cb_entry;
-	struct bcm2835_dma_cb *control_block;
-	u32 extrainfo = bcm2835_dma_prepare_cb_extra(c, direction, cyclic,
-						     false, flags);
+	struct bcm_dma_cb *control_block;
 	bool zero_page = false;
 
 	if (!frames)
@@ -415,12 +585,8 @@ static struct bcm2835_desc *bcm2835_dma_create_cb_chain(
 
 		/* fill in the control block */
 		control_block = cb_entry->cb;
-		control_block->info = bcm2835_dma_prepare_cb_info(c, direction,
-								  zero_page);
-		control_block->src = src;
-		control_block->dst = dst;
-		control_block->stride = 0;
-		control_block->next = 0;
+		cfg->cb_init(control_block, c, direction, src, dst, zero_page);
+
 		/* set up length in control_block if requested */
 		if (buf_len) {
 			/* calculate length honoring period_length */
@@ -428,31 +594,33 @@ static struct bcm2835_desc *bcm2835_dma_create_cb_chain(
 							     len, period_len,
 							     &total_len)) {
 				/* add extrainfo bits in info */
-				control_block->info |= extrainfo;
+				cfg->cb_append_extra(control_block, c,
+						     direction, cyclic,
+						     false, flags);
 			}
 
 			/* calculate new remaining length */
-			len -= control_block->length;
+			len -= cfg->cb_get_length(control_block);
 		}
 
 		/* link this the last controlblock */
 		if (frame)
-			d->cb_list[frame - 1].cb->next = cb_entry->paddr;
+			cfg->cb_set_next(d->cb_list[frame - 1].cb,
+					 cfg->to_cb_addr(cb_entry->paddr));
 
 		/* update src and dst and length */
 		if (src && need_src_incr(direction))
-			src += control_block->length;
+			src += cfg->cb_get_length(control_block);
 		if (dst && need_dst_incr(direction))
-			dst += control_block->length;
+			dst += cfg->cb_get_length(control_block);
 
 		/* Length of total transfer */
-		d->size += control_block->length;
+		d->size += cfg->cb_get_length(control_block);
 	}
 
 	/* the last frame requires extra flags */
-	extrainfo = bcm2835_dma_prepare_cb_extra(c, direction, cyclic, true,
-						 flags);
-	d->cb_list[d->frames - 1].cb->info |= extrainfo;
+	cfg->cb_append_extra(d->cb_list[d->frames - 1].cb, c, direction, cyclic,
+			     true, flags);
 
 	/* detect a size mismatch */
 	if (buf_len && d->size != buf_len)
@@ -472,6 +640,7 @@ static void bcm2835_dma_fill_cb_chain_with_sg(
 	struct scatterlist *sgl,
 	unsigned int sg_len)
 {
+	const struct bcm2835_dma_cfg *cfg = to_bcm2835_cfg(chan->device);
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	size_t len, max_len;
 	unsigned int i;
@@ -482,29 +651,21 @@ static void bcm2835_dma_fill_cb_chain_with_sg(
 	for_each_sg(sgl, sgent, sg_len, i) {
 		for (addr = sg_dma_address(sgent), len = sg_dma_len(sgent);
 		     len > 0;
-		     addr += cb->cb->length, len -= cb->cb->length, cb++) {
+		     addr += cfg->cb_get_length(cb->cb), len -= cfg->cb_get_length(cb->cb), cb++) {
 			if (direction == DMA_DEV_TO_MEM)
-				cb->cb->dst = addr;
+				cfg->cb_set_dst(cb->cb, direction, addr);
 			else
-				cb->cb->src = addr;
-			cb->cb->length = min(len, max_len);
+				cfg->cb_set_src(cb->cb, direction, addr);
+			cfg->cb_set_length(cb->cb, min(len, max_len));
 		}
 	}
 }
 
-static void bcm2835_dma_abort(struct dma_chan *chan)
+static void bcm2835_dma_abort_chan(struct bcm2835_chan *c)
 {
-	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	void __iomem *chan_base = c->chan_base;
 	long timeout = 100;
 
-	/*
-	 * A zero control block address means the channel is idle.
-	 * (The ACTIVE flag in the CS register is not a reliable indicator.)
-	 */
-	if (!readl(chan_base + BCM2835_DMA_ADDR))
-		return;
-
 	/* We need to clear the next DMA block pending */
 	writel(0, chan_base + BCM2835_DMA_NEXTCB);
 
@@ -535,8 +696,24 @@ static void bcm2835_dma_abort(struct dma_chan *chan)
 	writel(BCM2835_DMA_RESET, chan_base + BCM2835_DMA_CS);
 }
 
+static void bcm2835_dma_abort(struct dma_chan *chan)
+{
+	const struct bcm2835_dma_cfg *cfg = to_bcm2835_cfg(chan->device);
+	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
+
+	/*
+	 * A zero control block address means the channel is idle.
+	 * (The ACTIVE flag in the CS register is not a reliable indicator.)
+	 */
+	if (!readl(c->chan_base + cfg->cb_reg))
+		return;
+
+	cfg->abort(c);
+}
+
 static void bcm2835_dma_start_desc(struct dma_chan *chan)
 {
+	const struct bcm2835_dma_cfg *cfg = to_bcm2835_cfg(chan->device);
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct virt_dma_desc *vd = vchan_next_desc(&c->vc);
 
@@ -549,14 +726,15 @@ static void bcm2835_dma_start_desc(struct dma_chan *chan)
 
 	c->desc = to_bcm2835_dma_desc(&vd->tx);
 
-	writel(c->desc->cb_list[0].paddr, c->chan_base + BCM2835_DMA_ADDR);
-	writel(BCM2835_DMA_ACTIVE | BCM2835_DMA_CS_FLAGS(c->dreq),
-	       c->chan_base + BCM2835_DMA_CS);
+	writel(cfg->to_cb_addr(c->desc->cb_list[0].paddr), c->chan_base + cfg->cb_reg);
+	writel(cfg->active_mask | cfg->cs_flags(c),
+	       c->chan_base + cfg->cs_reg);
 }
 
 static irqreturn_t bcm2835_dma_callback(int irq, void *data)
 {
 	struct dma_chan *chan = data;
+	const struct bcm2835_dma_cfg *cfg = to_bcm2835_cfg(chan->device);
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
 	unsigned long flags;
@@ -564,9 +742,9 @@ static irqreturn_t bcm2835_dma_callback(int irq, void *data)
 	/* check the shared interrupt */
 	if (c->irq_flags & IRQF_SHARED) {
 		/* check if the interrupt is enabled */
-		flags = readl(c->chan_base + BCM2835_DMA_CS);
+		flags = readl(c->chan_base + cfg->cs_reg);
 		/* if not set then we are not the reason for the irq */
-		if (!(flags & BCM2835_DMA_INT))
+		if (!(flags & cfg->int_mask))
 			return IRQ_NONE;
 	}
 
@@ -579,9 +757,7 @@ static irqreturn_t bcm2835_dma_callback(int irq, void *data)
 	 * if this IRQ handler is threaded.) If the channel is finished, it
 	 * will remain idle despite the ACTIVE flag being set.
 	 */
-	writel(BCM2835_DMA_INT | BCM2835_DMA_ACTIVE |
-	       BCM2835_DMA_CS_FLAGS(c->dreq),
-	       c->chan_base + BCM2835_DMA_CS);
+	writel(cfg->int_mask | cfg->active_mask | cfg->cs_flags(c), c->chan_base + cfg->cs_reg);
 
 	d = c->desc;
 
@@ -589,7 +765,7 @@ static irqreturn_t bcm2835_dma_callback(int irq, void *data)
 		if (d->cyclic) {
 			/* call the cyclic callback */
 			vchan_cyclic_callback(&d->vd);
-		} else if (!readl(c->chan_base + BCM2835_DMA_ADDR)) {
+		} else if (!readl(c->chan_base + cfg->cb_reg)) {
 			vchan_cookie_complete(&c->desc->vd);
 			bcm2835_dma_start_desc(chan);
 		}
@@ -612,7 +788,7 @@ static int bcm2835_dma_alloc_chan_resources(struct dma_chan *chan)
 	 * (32 byte) aligned address (BCM2835 ARM Peripherals, sec. 4.2.1.1).
 	 */
 	c->cb_pool = dma_pool_create(dev_name(dev), dev,
-				     sizeof(struct bcm2835_dma_cb), 32, 0);
+				     sizeof(struct bcm_dma_cb), 32, 0);
 	if (!c->cb_pool) {
 		dev_err(dev, "unable to allocate descriptor pool\n");
 		return -ENOMEM;
@@ -638,20 +814,16 @@ static size_t bcm2835_dma_desc_size(struct bcm2835_desc *d)
 	return d->size;
 }
 
-static size_t bcm2835_dma_desc_size_pos(struct bcm2835_desc *d, dma_addr_t addr)
+static size_t bcm2835_dma_desc_size_pos(const struct bcm2835_dma_cfg *cfg,
+					struct bcm2835_desc *d, dma_addr_t addr)
 {
 	unsigned int i;
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
+		struct bcm_dma_cb *control_block = d->cb_list[i].cb;
+		size_t this_size = cfg->cb_get_length(control_block);
+		dma_addr_t dma = cfg->cb_get_addr(control_block, d->dir);
 
 		if (size)
 			size += this_size;
@@ -666,6 +838,7 @@ static enum dma_status bcm2835_dma_tx_status(struct dma_chan *chan,
 					     dma_cookie_t cookie,
 					     struct dma_tx_state *txstate)
 {
+	const struct bcm2835_dma_cfg *cfg = to_bcm2835_cfg(chan->device);
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct virt_dma_desc *vd;
 	enum dma_status ret;
@@ -684,14 +857,8 @@ static enum dma_status bcm2835_dma_tx_status(struct dma_chan *chan,
 		struct bcm2835_desc *d = c->desc;
 		dma_addr_t pos;
 
-		if (d->dir == DMA_MEM_TO_DEV)
-			pos = readl(c->chan_base + BCM2835_DMA_SOURCE_AD);
-		else if (d->dir == DMA_DEV_TO_MEM)
-			pos = readl(c->chan_base + BCM2835_DMA_DEST_AD);
-		else
-			pos = 0;
-
-		txstate->residue = bcm2835_dma_desc_size_pos(d, pos);
+		pos = cfg->read_addr(c, d->dir);
+		txstate->residue = bcm2835_dma_desc_size_pos(cfg, d, pos);
 	} else {
 		txstate->residue = 0;
 	}
@@ -786,6 +953,7 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
 	size_t period_len, enum dma_transfer_direction direction,
 	unsigned long flags)
 {
+	const struct bcm2835_dma_cfg *cfg = to_bcm2835_cfg(chan->device);
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
 	dma_addr_t src, dst;
@@ -845,7 +1013,8 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
 		return NULL;
 
 	/* wrap around into a loop */
-	d->cb_list[d->frames - 1].cb->next = d->cb_list[0].paddr;
+	cfg->cb_set_next(d->cb_list[d->frames - 1].cb,
+			 cfg->to_cb_addr(d->cb_list[0].paddr));
 
 	return vchan_tx_prep(&c->vc, &d->vd, flags);
 }
@@ -906,10 +1075,7 @@ static int bcm2835_dma_chan_init(struct bcm2835_dmadev *d, int chan_id,
 	c->irq_number = irq;
 	c->irq_flags = irq_flags;
 
-	/* check in DEBUG register if this is a LITE channel */
-	if (readl(c->chan_base + BCM2835_DMA_DEBUG) &
-		BCM2835_DMA_DEBUG_LITE)
-		c->is_lite_channel = true;
+	d->cfg->chan_plat_init(c);
 
 	return 0;
 }
@@ -928,8 +1094,32 @@ static void bcm2835_dma_free(struct bcm2835_dmadev *od)
 			     DMA_TO_DEVICE, DMA_ATTR_SKIP_CPU_SYNC);
 }
 
+static const struct bcm2835_dma_cfg bcm2835_data = {
+	.cs_reg = BCM2835_DMA_CS,
+	.cb_reg = BCM2835_DMA_ADDR,
+
+	.int_mask = BCM2835_DMA_INT,
+	.active_mask = BCM2835_DMA_ACTIVE,
+
+	.cb_get_length = bcm2835_dma_cb_get_length,
+	.cb_get_addr = bcm2835_dma_cb_get_addr,
+	.cb_init = bcm2835_dma_cb_init,
+	.cb_set_src = bcm2835_dma_cb_set_src,
+	.cb_set_dst = bcm2835_dma_cb_set_dst,
+	.cb_set_next = bcm2835_dma_cb_set_next,
+	.cb_set_length = bcm2835_dma_cb_set_length,
+	.cb_append_extra = bcm2835_dma_cb_append_extra,
+
+	.to_cb_addr = bcm2835_dma_to_cb_addr,
+
+	.chan_plat_init = bcm2835_dma_chan_plat_init,
+	.read_addr = bcm2835_dma_read_addr,
+	.cs_flags = bcm2835_dma_cs_flags,
+	.abort = bcm2835_dma_abort_chan,
+};
+
 static const struct of_device_id bcm2835_dma_of_match[] = {
-	{ .compatible = "brcm,bcm2835-dma", },
+	{ .compatible = "brcm,bcm2835-dma", .data = &bcm2835_data },
 	{},
 };
 MODULE_DEVICE_TABLE(of, bcm2835_dma_of_match);
@@ -960,7 +1150,7 @@ static int bcm2835_dma_suspend_late(struct device *dev)
 		void __iomem *chan_base = c->chan_base;
 
 		/* Check if DMA channel is busy */
-		if (readl(chan_base + BCM2835_DMA_ADDR))
+		if (readl(chan_base + od->cfg->cb_reg))
 			return -EBUSY;
 	}
 
@@ -995,6 +1185,11 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
 	if (!od)
 		return -ENOMEM;
 
+	od->cfg = device_get_match_data(&pdev->dev);
+	if (!od->cfg)
+		return dev_err_probe(&pdev->dev, -EINVAL,
+				     "Failed to match compatible string\n");
+
 	dma_set_max_seg_size(&pdev->dev, 0x3FFFFFFF);
 
 	base = devm_platform_ioremap_resource(pdev, 0);
-- 
2.51.0

