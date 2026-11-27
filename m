Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781942;
	b=4lsDZLmsJJhaAs5tpKzvqQUxx3oVWdG9FAmWXeP/PSIQqi81c7S3wRGrhHDNlOba5D/K
	 NbYbOtY2rUePry7ysxeQ72Jy5H+f89Yk56sl2vdafuFwd3UwvSvHaWN49QSLddP2MLOVU
	 67D/j9Nll5kdsS0Q+T6SsRV90z2I/CToXNsE0Jn70E+MuiZ6+ygEOEXMxGFlc31H02nFE
	 sCm01+fuWYUf+1heBXIsCyAOjN4Peu/Vc8NUniAAjp3/En0v03ue4xVlhVzQaM6vTRHXo
	 XFe59OJsm+jRdn36Hh1jTX1+ZFhURWRoHo9MQd0uP8uVvTDi0QE9h3yL1BZ782Yfa3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781942;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lvnO97+HZnLeWD0ptxjSNdkuwUSjxRmnbj0wxFrkJfo=;
	b=mW6qdWdeSoaIfWcjAjitAx0oWJ8n73P4B2AHXmaXYO8Bq6A7rC9hFgRILMBk/j4Hqx2p
	 z4SKLcT8CkuqWfmVC8YtRRyg8Jbzfv0G+kcJCeunIWcwdDGiBXQu9wNhw1Ik1BXsV9nhJ
	 Ubl4n7tUjlPF03MGQHC9TufzMj4gxknlm9BYQNbZszDRsmT/MNz30LvTHLRKe1SWk2bAh
	 31sI14fYLC3RZIg1s5XZ7W/DyyMMIEiWfI2XC1vZ7/d+nG/X3GdNKVLx7PxaBHvMD5J+a
	 rY/6gVqPswROJkBSK8MpIQmWUJBRrJYXI86xft/94LDk5qpzSyvywy/YCaEfOU27LoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=IDYy43L7;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0814B60A382D
	for <dmaengine@vger.kernel.org>; Fri, 27 Nov 2026 12:19:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0814B60A382D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=IDYy43L7
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e09aa5264so4703800f8f.2
        for <dmaengine@vger.kernel.org>; Fri, 27 Nov 2026 04:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781939; x=1796386739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lvnO97+HZnLeWD0ptxjSNdkuwUSjxRmnbj0wxFrkJfo=;
        b=IDYy43L7MY9Eha/YV6QqVXtEzHaXD9T5/nSWEMe1BFYVax/YY48y7AWVyw/ipzJj7b
         GZ875+9uoEpvDd8SWhnGuz663w+OsA9ujN3wfZrl0M4HkJATdrFQoxzXjwsYfVpjb7+H
         CZGBbSa4AuEOaGjxSvBVSte+DMU3QuEEehtVonxoC1miVJJ2/V6KrbsNgf8D2O7ogK55
         MQB26jopNOsNxSEVukqxRFmPxAEZYYuKTm5gQP6A+izIohBxItlNvtN5BQ+QVk2ytaB/
         CCynV7mh/jNoa0LFBF+DHaKEAnDl6fyWIwCOm1Rtp8mRHghikdUrXksPBKsA7/vYr5GE
         6f2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781939; x=1796386739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lvnO97+HZnLeWD0ptxjSNdkuwUSjxRmnbj0wxFrkJfo=;
        b=MYk4ThfoxTk1nZiSJU7BLNAauPbT2ePZi7Ulm1nCR7IVhaZLCYFo9fqAOpkcOrAV9P
         1MPenDP/E/e+sCfiswxWijUX2nmlW3UIIafkZPfw24IdruWMpxOBVqZd8TY7tGsTgkyt
         Jq5u1c3D6GSnE96Hk6jOySpvt0m1QAV243NIg5LkqiaYYMQqQxtORLhM/M2c3Q2TRO/L
         NvYzeepluaj78ee1F5ecdllDUzgrKYYsaYnxm8xUtrAfAl3eYMZD4dB/rRxjEdqEf0q9
         LnQSBMN+5HgQeRsR9J29G8gnvshVV3LpNxdby3CoooYKUMA1tyTLl9CG+y0mG67aHFOo
         uWzw==
X-Forwarded-Encrypted: i=1; AL+hErECpUV0iIRZJxR+DB1kKwj62psOxS0kZmDeI+ftg5qSJmRDRBqdn/bbCIeMcjpWCKpaa3YP5pPr7g4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9zNO2kMx9n3iM2RufgrQLyVUwWj1V6PYW/3SlYuROEHxUFvlo2
	tGECOHdtv/oUtfzZvEuIXluer0wFqz5Kx6vXLuKzjNUbRyO2RpbL7PSRa6lDFR7TNPc=
X-Gm-Gg: AZFdTZcex5pCMbP4nV/bCDbjX1Tw0kY1eiEZ8rS96z9xkBWXrQRj8cNXz5/DC/FiwGT
	4+vucltoFl82HTGzLRUQqn8FYhWxaMJ5pAULsSBygh3N7pis0gzIqYfv9rK1+/ArLUxvKB+yRH6
	ay37z2YmQ2N0s5kcJvmQKLRGCZtC4BtQyHY7Ox+lVc+vvEu7o/jF0GFttCMPX8n+MHyQR1vls4Z
	2w2Ile8DTKlgeyC/3KlNQ7D/t6VGKv+FGhbw9vIcMeSWOY+f5qCelXu4J+PlAxkBuvoWvK3lxBm
	XuehqA7a2iUNA6bnvvoXNXoJWamiIPyfYZjBsTiiyTexqeRzfHzT4YsnLbG79kSCWDUuA937Wo5
	1oTsxn9uypO/T5r63FnOMiuLpOic07Jk+fagNTzzfBpfa1jdFHf0lB+H1KbbOhFi7p6zM/QPRPJ
	PLCCGL1g5pL6r+mL5cpxEbrorFAKhCfGvb5zT9Q5BmHazPn0uGVUKhkR8COZANaj03fDrGvyR/U
	7hSL6lnYGl3Y1Loye3+SHMeHssHDy+NcnP7G4GycBGkJbLIMKXv+MrnU4daQ8DnM6Kjc4TSWaOG
	eE8Rf8VskPdVT5X9kwOs85Fsndna
X-Received: by 2002:a05:600c:a085:b0:4a2:526b:d410 with SMTP id 5b1f17b1804b1-4bb8881092bmr497851795e9.13.1795781939368;
        Fri, 27 Nov 2026 04:18:59 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853368d3sm674672075e9.1.2026.11.27.04.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:18:58 -0800 (PST)
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
Subject: [PATCH v4 13/28] dmaengine: bcm2835: introduce multi platform support
Date: Fri, 27 Nov 2026 13:22:03 +0100
Message-ID: <20261127122236.4976-14-andrea.porta@suse.com>
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
 drivers/dma/bcm2835-dma.c | 338 ++++++++++++++++++++++++++++++--------
 1 file changed, 267 insertions(+), 71 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index 42a7e6eaff9f..44dab42d94c6 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -46,11 +46,17 @@
  * @base: base address of register map
  * @zero_page: bus address of zero page (to detect transactions copying from
  *	zero page and avoid accessing memory if so)
+ * @cfg: platform specific description of the DMA channels
  */
 struct bcm2835_dmadev {
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
@@ -64,7 +70,7 @@ struct bcm2835_dma_cb {
 };
 
 struct bcm2835_cb_entry {
-	struct bcm2835_dma_cb *cb;
+	struct bcm_dma_cb *cb;
 	dma_addr_t paddr;
 };
 
@@ -85,6 +91,59 @@ struct bcm2835_chan {
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
@@ -217,6 +276,13 @@ static inline struct bcm2835_dmadev *to_bcm2835_dma_dev(struct dma_device *d)
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
@@ -289,6 +355,109 @@ static inline bool need_dst_incr(enum dma_transfer_direction direction)
 	return direction == DMA_MEM_TO_MEM || direction == DMA_DEV_TO_MEM;
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
@@ -306,16 +475,19 @@ static void bcm2835_dma_desc_free(struct virt_dma_desc *vd)
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
@@ -330,14 +502,14 @@ static bool bcm2835_dma_create_cb_set_length(struct dma_chan *chan,
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
@@ -369,15 +541,14 @@ static struct bcm2835_desc *bcm2835_dma_create_cb_chain(
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
@@ -413,12 +584,8 @@ static struct bcm2835_desc *bcm2835_dma_create_cb_chain(
 
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
@@ -426,31 +593,33 @@ static struct bcm2835_desc *bcm2835_dma_create_cb_chain(
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
@@ -470,6 +639,7 @@ static void bcm2835_dma_fill_cb_chain_with_sg(
 	struct scatterlist *sgl,
 	unsigned int sg_len)
 {
+	const struct bcm2835_dma_cfg *cfg = to_bcm2835_cfg(chan->device);
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	size_t len, max_len;
 	unsigned int i;
@@ -480,29 +650,21 @@ static void bcm2835_dma_fill_cb_chain_with_sg(
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
 	long timeout = 10000;
 
-	/*
-	 * A zero control block address means the channel is idle.
-	 * (The ACTIVE flag in the CS register is not a reliable indicator.)
-	 */
-	if (!readl(chan_base + BCM2835_DMA_ADDR))
-		return;
-
 	/* Write 0 to the active bit - Pause the DMA */
 	writel(0, chan_base + BCM2835_DMA_CS);
 
@@ -519,8 +681,24 @@ static void bcm2835_dma_abort(struct dma_chan *chan)
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
 
@@ -533,14 +711,15 @@ static void bcm2835_dma_start_desc(struct dma_chan *chan)
 
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
@@ -548,9 +727,9 @@ static irqreturn_t bcm2835_dma_callback(int irq, void *data)
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
 
@@ -563,9 +742,7 @@ static irqreturn_t bcm2835_dma_callback(int irq, void *data)
 	 * if this IRQ handler is threaded.) If the channel is finished, it
 	 * will remain idle despite the ACTIVE flag being set.
 	 */
-	writel(BCM2835_DMA_INT | BCM2835_DMA_ACTIVE |
-	       BCM2835_DMA_CS_FLAGS(c->dreq),
-	       c->chan_base + BCM2835_DMA_CS);
+	writel(cfg->int_mask | cfg->active_mask | cfg->cs_flags(c), c->chan_base + cfg->cs_reg);
 
 	d = c->desc;
 
@@ -573,7 +750,7 @@ static irqreturn_t bcm2835_dma_callback(int irq, void *data)
 		if (d->cyclic) {
 			/* call the cyclic callback */
 			vchan_cyclic_callback(&d->vd);
-		} else if (!readl(c->chan_base + BCM2835_DMA_ADDR)) {
+		} else if (!readl(c->chan_base + cfg->cb_reg)) {
 			vchan_cookie_complete(&c->desc->vd);
 			bcm2835_dma_start_desc(chan);
 		}
@@ -596,7 +773,7 @@ static int bcm2835_dma_alloc_chan_resources(struct dma_chan *chan)
 	 * (32 byte) aligned address (BCM2835 ARM Peripherals, sec. 4.2.1.1).
 	 */
 	c->cb_pool = dma_pool_create(dev_name(dev), dev,
-				     sizeof(struct bcm2835_dma_cb), 32, 0);
+				     sizeof(struct bcm_dma_cb), 32, 0);
 	if (!c->cb_pool) {
 		dev_err(dev, "unable to allocate descriptor pool\n");
 		return -ENOMEM;
@@ -625,20 +802,16 @@ static size_t bcm2835_dma_desc_size(struct bcm2835_desc *d)
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
@@ -653,6 +826,7 @@ static enum dma_status bcm2835_dma_tx_status(struct dma_chan *chan,
 					     dma_cookie_t cookie,
 					     struct dma_tx_state *txstate)
 {
+	const struct bcm2835_dma_cfg *cfg = to_bcm2835_cfg(chan->device);
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct virt_dma_desc *vd;
 	enum dma_status ret;
@@ -671,14 +845,8 @@ static enum dma_status bcm2835_dma_tx_status(struct dma_chan *chan,
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
@@ -773,6 +941,7 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
 	size_t period_len, enum dma_transfer_direction direction,
 	unsigned long flags)
 {
+	const struct bcm2835_dma_cfg *cfg = to_bcm2835_cfg(chan->device);
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
 	dma_addr_t src, dst;
@@ -832,7 +1001,8 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
 		return NULL;
 
 	/* wrap around into a loop */
-	d->cb_list[d->frames - 1].cb->next = d->cb_list[0].paddr;
+	cfg->cb_set_next(d->cb_list[d->frames - 1].cb,
+			 cfg->to_cb_addr(d->cb_list[0].paddr));
 
 	return vchan_tx_prep(&c->vc, &d->vd, flags);
 }
@@ -893,10 +1063,7 @@ static int bcm2835_dma_chan_init(struct bcm2835_dmadev *d, int chan_id,
 	c->irq_number = irq;
 	c->irq_flags = irq_flags;
 
-	/* check in DEBUG register if this is a LITE channel */
-	if (readl(c->chan_base + BCM2835_DMA_DEBUG) &
-		BCM2835_DMA_DEBUG_LITE)
-		c->is_lite_channel = true;
+	d->cfg->chan_plat_init(c);
 
 	return 0;
 }
@@ -915,8 +1082,32 @@ static void bcm2835_dma_free(struct bcm2835_dmadev *od)
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
@@ -947,7 +1138,7 @@ static int bcm2835_dma_suspend_late(struct device *dev)
 		void __iomem *chan_base = c->chan_base;
 
 		/* Check if DMA channel is busy */
-		if (readl(chan_base + BCM2835_DMA_ADDR))
+		if (readl(chan_base + od->cfg->cb_reg))
 			return -EBUSY;
 	}
 
@@ -982,6 +1173,11 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
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

