Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793610448;
	b=k0Z92qWG++KrDlm3KEK121f9g+THJXUMXj0GQEmsVfmAO4ALAbuXEiuoOW29hpnYFh6V
	 cMq7GOMfgVv0cLKc9klXNK9ez/rT2QR+n6FjzMiA9qkfm08RNSmtB9LWmE/SRupHr9Wt+
	 Gfi6/E8cvkn+I4KRB2ZJrCiGXlfJZcul6ou5OQGWCaBaJK/BMjbvs0KUBLjF9MK4jmw95
	 tjRv4hpsVFK7EOI+PCHgWKpkmQLoNuU2GH/xYuKdv3H6BrpbCmpNL9lu0LAERgealdh1V
	 Bk2md360lVrAYLHpOpG+eCK5VrF9l28/YHrhZ643aI8VtbEy8+ufe0ghA2dgBV5AGTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793610448;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PGQmRA+NM6R3z3S6SDF122Ax3KxFAAMu32wa59gkUrg=;
	b=Eqic38X4uU1QI0xhMSnnos3tZ7YMNgdmuLtWcB/t2M6GtbsoHayc5eW2vp489QegmGke
	 Hu6bwJNBGQS7VSkTjAKkAn0JmZyhtmOUJPS09uqv5UZIvryZ+z+mseM2sk3j7fftQlMRs
	 iW5/jfMEFyTp6x6iHiVjyig+T1hLIsOryjv+ELs6lTsqK+jsAAi5h0wDOk3Jcs5dBBCyY
	 NnESYSoAYkSfkir+hG4m1lcX0Kpi4lzQys06wwXAGcMMgbA4j++1fHrE7Wu1j4+IwzWrK
	 MxJVzm0YFi/z+a6MdeT79/FB+gWNBd8JLc9mEEgyzIBzaPYVgIzpbs4sBtdM44b0sFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TSvdcOs8;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD52606A330
	for <dmaengine@vger.kernel.org>; Mon,  2 Nov 2026 09:07:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FD52606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TSvdcOs8
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so16760675e9.3
        for <dmaengine@vger.kernel.org>; Mon, 02 Nov 2026 01:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793610447; x=1794215247; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PGQmRA+NM6R3z3S6SDF122Ax3KxFAAMu32wa59gkUrg=;
        b=TSvdcOs8oC7SLaIToXTOTMxpIDCiQXEvVCJM5LoU8FF8YeZqnQZboXjz+3+3Hn4ob7
         i8DxK7f1r42SwKcwLppZu8LvufMGrhtMVnojrYDKNBKh23ZkQNqvaUpAE4zrREo6bcts
         QEgf1ExS2gLwP6Z8EdO4PwTlbFDmd7/Jj+kkNFxtCptvD4Ti1nxMXZCujKUzzQRbpyGw
         /bBjYKajpvo3ksWj5u9TPN7p/FLrOu/lQSZbn5OHF+BMOJXKN3Nn08Fl2ffTX4h7T+PW
         TYSa9OI28qBZs5QZJmdPHNZ6xtlRPZdOPVrCPGWjB4qa6jtsZ4jcodNmc1VBHzVH5Kmi
         SIjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793610447; x=1794215247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PGQmRA+NM6R3z3S6SDF122Ax3KxFAAMu32wa59gkUrg=;
        b=pMxpE6/3B1gOIL9gn6ZnriSovfmD3O74FQtamqOm2SE8Lssge0vtszwvkdw7+ecRDk
         F82a5NGkPLT7xYQEDXdfUw9dr6ILtMXu1/167D31tE1vxtWsqXT2glu+0T7k5cK80C6c
         zwSxAG7ku+qntCQLnoA/QR1/b+YDSy/oGCKTktjUZElZCYUJJYLQg2cKnSXzu2jbTCFS
         iMEn96lSnX46ubQ+sQz5Bf1jJgv2O7Joda0ImO76IfsptON5OuWbU7v2+PMytDzv9rWw
         VcRVcS9A5sxWWnAQGHw+LZE8/67IBwU4/QiNGEIG/rnGEXhGtXQwqRnHpe8uczOQr5sC
         PzIg==
X-Forwarded-Encrypted: i=1; AKwUvByK4QyNWeUbiLGBV7M9f/W4VovPhy1G8uU5Y4fWK+nfddF+tQnhf0D2liuVoub6rybgDkAggln5dJo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLXxkMUNopReI5CKTiwcPvYQWoDpus1WiuV5O3HRl29te941YCv
	+kzCOlGmy6PJjcWrxGfpO+q3PW86OGPjWwn7FF8ZUmIeottil3Yn3pxU
X-Gm-Gg: AYBFou2q7Gg0cLMJ9DCrU7rKT4nQNSf5yWudKLrhwLEsdLqmiCcbapmIAcimARS4Yog
	llvO6CYDsC5eJZNsIRjmzlYgLbxo5rjG7WVs+cGyZ6xLtw7Dm42fJ3vI/D/hGyIOO7fBWBhxVV/
	vKgOQKemWDaPf/q0kZBRErIQO3JwdSUxswLqGwrcwwP73yUJJXzLBLjU88CEqALlQu1HyRixDPq
	+QlqsHVyWqkis7LEyJ/3snjdfinNJFp7g5X+XaAWThlMypKKC4TcEmO1zBb9m828Vmo3ENaJ6/J
	/RU7dXVqRBCj9LBD4ocI0g/SZYIUh1B5ARKW6zCIH9zlDr9QCPnTafW5kOnawahOeFEOLPZNigy
	Mlj1jnkz+uAA0OjTJKzVef0nm4ZIomfpnHVcrWkC5SI9IDyHg+wwLDP7Cqx2SZcTC8fkzE4mPLk
	QW8w1bLIQYtLxozwKUpeKWwlHxloPSrYR+92hRN+vKaRAeEKnNdtBzckwtji3CH7B7VMn5SkjPP
	9fF4dFcN2fnPQk8YRj2tMesALXnEFLX/Cus/IQ7zLTl/edhLDQYF0u0R8PVRrwb3MFw+R4E2Bj6
	Jg5uAMJMnqU+kzqxjy15j0mf+yK8dpFSSMNV5MpJgKPk764qb/+NErBQ6wSdd7GIEVVsFhbaGwW
	Gj3rd3wdYpZpquE4MwEiybl5z4tU6WOse1tICMHyIP/kfznrHvl4W3b/MzJzNKTVqfH7pRHT7lm
	03VW36sC1sR3nP+jgNzHjegLw46lGnzm3d0w==
X-Received: by 2002:a05:600c:a4c:b0:4a2:967:dfb8 with SMTP id 5b1f17b1804b1-4ac1765d7d7mr217404855e9.20.1793610446550;
        Mon, 02 Nov 2026 01:07:26 -0800 (PST)
Received: from cypher.home.roving-it.com ([2001:8b0:fb11:0:3889:86e0:d449:e2e1])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm417879945e9.3.2026.11.02.01.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:07:25 -0800 (PST)
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
Subject: [PATCH 4/9] dmaengine: bcm2835: Add BCM2711 40-bit channel support
Date: Mon,  2 Nov 2026 09:06:54 +0000
Message-ID: <20261102090713.896324-5-pbrobinson@gmail.com>
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

BCM2711 channels 11-14 are DMA4 engines with a 40-bit capable register
and control block layout. They see the legacy 0x7c000000 peripheral
window at 0x4_7c000000, so translate client FIFO addresses accordingly.
Add the brcm,bcm2711-dma compatible for covering these channels.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 drivers/dma/bcm2835-dma.c | 278 +++++++++++++++++++++++++++++++++++---
 1 file changed, 256 insertions(+), 22 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index 83ad8815759e8..35f8c47dea89f 100644
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
@@ -40,9 +41,14 @@
 /**
  * struct bcm2835_dma_cfg - SoC specific controller properties
  * @dma_mask: addressing capability of the controller
+ * @chan_40bit_mask: channels implementing the BCM2711 40-bit register layout
+ * @periph_offset: offset at which channels with extended addressing see the
+ *	legacy 0x7c000000 - 0x7fffffff peripheral window
  */
 struct bcm2835_dma_cfg {
 	u64 dma_mask;
+	u32 chan_40bit_mask;
+	u64 periph_offset;
 };
 
 /**
@@ -72,8 +78,25 @@ struct bcm2835_dma_cb {
 	uint32_t pad[2];
 };
 
+/* Control block layout used by BCM2711 40-bit channels */
+struct bcm2711_dma40_cb {
+	u32 ti;
+	u32 src;
+	u32 srci;
+	u32 dst;
+	u32 dsti;
+	u32 len;
+	u32 next_cb;
+	u32 rsvd;
+};
+
+static_assert(sizeof(struct bcm2835_dma_cb) == sizeof(struct bcm2711_dma40_cb));
+
 struct bcm2835_cb_entry {
-	struct bcm2835_dma_cb *cb;
+	union {
+		struct bcm2835_dma_cb *cb;
+		struct bcm2711_dma40_cb *cb40;
+	};
 	dma_addr_t paddr;
 };
 
@@ -92,6 +115,9 @@ struct bcm2835_chan {
 	unsigned int irq_flags;
 
 	bool is_lite_channel;
+	bool is_40bit_channel;
+	bool ext_addr;
+	u64 periph_offset;
 };
 
 struct bcm2835_desc {
@@ -148,7 +174,9 @@ struct bcm2835_desc {
 #define BCM2835_DMA_S_WIDTH	BIT(9) /* 128bit writes if set */
 #define BCM2835_DMA_S_DREQ	BIT(10) /* enable SREQ for source */
 #define BCM2835_DMA_S_IGNORE	BIT(11) /* ignore source reads - read 0 */
+#define BCM2835_DMA_BURST_LENGTH_MASK	GENMASK(15, 12)
 #define BCM2835_DMA_BURST_LENGTH(x) ((x & 15) << 12)
+#define BCM2835_DMA_PER_MAP_MASK	GENMASK(20, 16)
 #define BCM2835_DMA_PER_MAP(x)	((x & 31) << 16) /* REQ source */
 #define BCM2835_DMA_WAIT(x)	((x & 31) << 21) /* add DMA-wait cycles */
 #define BCM2835_DMA_NO_WIDE_BURSTS BIT(26) /* no 2 beat write bursts */
@@ -184,10 +212,65 @@ struct bcm2835_desc {
 #define MAX_DMA_LEN SZ_1G
 #define MAX_LITE_DMA_LEN (SZ_64K - 4)
 
+/* Legacy peripheral bus window used by DMA clients for FIFO addresses */
+#define BCM2835_DMA_PERIPH_BASE		0x7c000000
+#define BCM2835_DMA_PERIPH_END		0x80000000
+
+/* BCM2711 40-bit channel registers */
+#define BCM2711_DMA40_CS	0x00
+#define BCM2711_DMA40_CB	0x04
+#define BCM2711_DMA40_DEBUG	0x0c
+#define BCM2711_DMA40_SRC	0x14
+#define BCM2711_DMA40_SRCI	0x18
+#define BCM2711_DMA40_DEST	0x1c
+#define BCM2711_DMA40_DESTI	0x20
+
+/* BCM2711 40-bit CS bits */
+#define BCM2711_DMA40_ACTIVE		BIT(0)
+#define BCM2711_DMA40_END		BIT(1)
+#define BCM2711_DMA40_INT		BIT(2)
+#define BCM2711_DMA40_DREQ		BIT(3)
+#define BCM2711_DMA40_RD_PAUSED		BIT(4)
+#define BCM2711_DMA40_WR_PAUSED		BIT(5)
+#define BCM2711_DMA40_DREQ_PAUSED	BIT(6)
+#define BCM2711_DMA40_WAITING_FOR_WRITES BIT(7)
+#define BCM2711_DMA40_PROT		GENMASK(9, 8) /* secure, supervisor */
+#define BCM2711_DMA40_ERR		BIT(10)
+#define BCM2711_DMA40_TRANSACTIONS	BIT(25)
+#define BCM2711_DMA40_WAIT_FOR_WRITES	BIT(28)
+#define BCM2711_DMA40_DISDEBUG		BIT(29)
+#define BCM2711_DMA40_ABORT		BIT(30)
+#define BCM2711_DMA40_HALT		BIT(31)
+
+/* BCM2711 40-bit TI bits */
+#define BCM2711_DMA40_INTEN		BIT(0)
+#define BCM2711_DMA40_TDMODE		BIT(1) /* 2D-Mode */
+#define BCM2711_DMA40_WAIT_RESP		BIT(2) /* wait for AXI write ack */
+#define BCM2711_DMA40_WAIT_RD_RESP	BIT(3) /* wait for AXI read to complete */
+#define BCM2711_DMA40_PER_MAP(x)	(((x) & 31) << 9) /* REQ source */
+#define BCM2711_DMA40_S_DREQ		BIT(14)
+#define BCM2711_DMA40_D_DREQ		BIT(15)
+
+/* BCM2711 40-bit SRCI/DESTI bits */
+#define BCM2711_DMA40_ADDR_HI		GENMASK(7, 0)
+#define BCM2711_DMA40_BURST_LEN(x)	(((x) & 15) << 8)
+#define BCM2711_DMA40_INC		BIT(12)
+#define BCM2711_DMA40_SIZE_128		FIELD_PREP_CONST(GENMASK(14, 13), 2)
+#define BCM2711_DMA40_IGNORE		BIT(15)
+
+/* BCM2711 40-bit DEBUG bits */
+#define BCM2711_DMA40_DEBUG_RESET		BIT(23)
+
 static const struct bcm2835_dma_cfg bcm2835_dma_cfg = {
 	.dma_mask = DMA_BIT_MASK(32),
 };
 
+static const struct bcm2835_dma_cfg bcm2711_dma_cfg = {
+	.dma_mask = DMA_BIT_MASK(36),
+	.chan_40bit_mask = GENMASK(14, 11),
+	.periph_offset = 0x400000000ULL,
+};
+
 static inline size_t bcm2835_dma_max_frame_length(struct bcm2835_chan *c)
 {
 	/* lite and normal channels have different max frame length */
@@ -217,28 +300,95 @@ static inline struct bcm2835_desc *to_bcm2835_dma_desc(
 	return container_of(t, struct bcm2835_desc, vd.tx);
 }
 
+/* Translate legacy BCM2835 TI bits into the 40-bit channel TI format */
+static u32 bcm2711_dma40_ti(u32 info)
+{
+	u32 ti = BCM2711_DMA40_PER_MAP(FIELD_GET(BCM2835_DMA_PER_MAP_MASK, info));
+
+	if (info & BCM2835_DMA_INT_EN)
+		ti |= BCM2711_DMA40_INTEN;
+	if (info & BCM2835_DMA_WAIT_RESP)
+		ti |= BCM2711_DMA40_WAIT_RESP;
+	if (info & BCM2835_DMA_S_DREQ)
+		ti |= BCM2711_DMA40_S_DREQ | BCM2711_DMA40_WAIT_RD_RESP;
+	if (info & BCM2835_DMA_D_DREQ)
+		ti |= BCM2711_DMA40_D_DREQ;
+
+	return ti;
+}
+
+static u32 bcm2711_dma40_xi(u32 info, u32 inc, u32 width, u32 ignore)
+{
+	u32 xi = BCM2711_DMA40_BURST_LEN(FIELD_GET(BCM2835_DMA_BURST_LENGTH_MASK,
+						   info));
+
+	if (info & inc)
+		xi |= BCM2711_DMA40_INC;
+	if (info & width)
+		xi |= BCM2711_DMA40_SIZE_128;
+	if (info & ignore)
+		xi |= BCM2711_DMA40_IGNORE;
+
+	return xi;
+}
+
+/* Control block pointers of extended channels are 32 byte units */
+static u32 bcm2835_dma_cb_ptr(struct bcm2835_chan *c, dma_addr_t paddr)
+{
+	return c->ext_addr ? paddr >> 5 : paddr;
+}
+
 static void bcm2835_dma_cb_set_src(struct bcm2835_chan *c,
 				   struct bcm2835_cb_entry *e, dma_addr_t addr)
 {
-	e->cb->src = addr;
+	if (c->is_40bit_channel) {
+		e->cb40->src = lower_32_bits(addr);
+		FIELD_MODIFY(BCM2711_DMA40_ADDR_HI, &e->cb40->srci,
+			     upper_32_bits(addr));
+		return;
+	}
+
+	e->cb->src = lower_32_bits(addr);
 }
 
 static void bcm2835_dma_cb_set_dst(struct bcm2835_chan *c,
 				   struct bcm2835_cb_entry *e, dma_addr_t addr)
 {
-	e->cb->dst = addr;
+	if (c->is_40bit_channel) {
+		e->cb40->dst = lower_32_bits(addr);
+		FIELD_MODIFY(BCM2711_DMA40_ADDR_HI, &e->cb40->dsti,
+			     upper_32_bits(addr));
+		return;
+	}
+
+	e->cb->dst = lower_32_bits(addr);
 }
 
 static void bcm2835_dma_cb_init(struct bcm2835_chan *c,
 				struct bcm2835_cb_entry *e, u32 info,
 				dma_addr_t src, dma_addr_t dst)
 {
-	struct bcm2835_dma_cb *cb = e->cb;
+	if (c->is_40bit_channel) {
+		struct bcm2711_dma40_cb *cb = e->cb40;
+
+		cb->ti = bcm2711_dma40_ti(info);
+		cb->srci = bcm2711_dma40_xi(info, BCM2835_DMA_S_INC,
+					    BCM2835_DMA_S_WIDTH,
+					    BCM2835_DMA_S_IGNORE);
+		cb->dsti = bcm2711_dma40_xi(info, BCM2835_DMA_D_INC,
+					    BCM2835_DMA_D_WIDTH,
+					    BCM2835_DMA_D_IGNORE);
+		cb->len = 0;
+		cb->next_cb = 0;
+		cb->rsvd = 0;
+	} else {
+		struct bcm2835_dma_cb *cb = e->cb;
 
-	cb->info = info;
-	cb->length = 0;
-	cb->stride = 0;
-	cb->next = 0;
+		cb->info = info;
+		cb->length = 0;
+		cb->stride = 0;
+		cb->next = 0;
+	}
 
 	bcm2835_dma_cb_set_src(c, e, src);
 	bcm2835_dma_cb_set_dst(c, e, dst);
@@ -247,26 +397,40 @@ static void bcm2835_dma_cb_init(struct bcm2835_chan *c,
 static u32 bcm2835_dma_cb_get_len(struct bcm2835_chan *c,
 				  struct bcm2835_cb_entry *e)
 {
-	return e->cb->length;
+	return c->is_40bit_channel ? e->cb40->len : e->cb->length;
 }
 
 static void bcm2835_dma_cb_set_len(struct bcm2835_chan *c,
 				   struct bcm2835_cb_entry *e, u32 len)
 {
-	e->cb->length = len;
+	if (c->is_40bit_channel)
+		e->cb40->len = len;
+	else
+		e->cb->length = len;
 }
 
 static void bcm2835_dma_cb_add_info(struct bcm2835_chan *c,
 				    struct bcm2835_cb_entry *e, u32 info)
 {
-	e->cb->info |= info;
+	if (c->is_40bit_channel)
+		e->cb40->ti |= bcm2711_dma40_ti(info);
+	else
+		e->cb->info |= info;
 }
 
 static void bcm2835_dma_cb_set_next(struct bcm2835_chan *c,
 				    struct bcm2835_cb_entry *e,
 				    dma_addr_t next)
 {
-	e->cb->next = next;
+	if (c->is_40bit_channel)
+		e->cb40->next_cb = bcm2835_dma_cb_ptr(c, next);
+	else
+		e->cb->next = bcm2835_dma_cb_ptr(c, next);
+}
+
+static dma_addr_t bcm2711_dma40_addr(u32 lo, u32 xi)
+{
+	return (u64)FIELD_GET(BCM2711_DMA40_ADDR_HI, xi) << 32 | lo;
 }
 
 /* Memory side address of a control block */
@@ -274,6 +438,12 @@ static dma_addr_t bcm2835_dma_cb_mem_addr(struct bcm2835_chan *c,
 					  struct bcm2835_cb_entry *e,
 					  enum dma_transfer_direction dir)
 {
+	if (c->is_40bit_channel) {
+		if (dir == DMA_DEV_TO_MEM)
+			return bcm2711_dma40_addr(e->cb40->dst, e->cb40->dsti);
+		return bcm2711_dma40_addr(e->cb40->src, e->cb40->srci);
+	}
+
 	return dir == DMA_DEV_TO_MEM ? e->cb->dst : e->cb->src;
 }
 
@@ -282,11 +452,32 @@ static dma_addr_t bcm2835_dma_get_pos(struct bcm2835_chan *c,
 {
 	void __iomem *base = c->chan_base;
 
+	if (c->is_40bit_channel) {
+		if (dir == DMA_DEV_TO_MEM)
+			return bcm2711_dma40_addr(readl(base + BCM2711_DMA40_DEST),
+						  readl(base + BCM2711_DMA40_DESTI));
+		return bcm2711_dma40_addr(readl(base + BCM2711_DMA40_SRC),
+					  readl(base + BCM2711_DMA40_SRCI));
+	}
+
 	if (dir == DMA_DEV_TO_MEM)
 		return readl(base + BCM2835_DMA_DEST_AD);
 	return readl(base + BCM2835_DMA_SOURCE_AD);
 }
 
+/*
+ * Clients describe peripheral FIFOs by their legacy bus address. Channels
+ * with extended addressing see that window at a SoC specific offset.
+ */
+static dma_addr_t bcm2835_dma_periph_addr(struct bcm2835_chan *c,
+					  dma_addr_t addr)
+{
+	if (addr >= BCM2835_DMA_PERIPH_BASE && addr < BCM2835_DMA_PERIPH_END)
+		addr += c->periph_offset;
+
+	return addr;
+}
+
 static void bcm2835_dma_free_cb_chain(struct bcm2835_desc *desc)
 {
 	size_t i;
@@ -475,6 +666,27 @@ static void bcm2835_dma_fill_cb_chain_with_sg(
 	}
 }
 
+static void bcm2711_dma40_abort(struct bcm2835_chan *c)
+{
+	void __iomem *chan_base = c->chan_base;
+	long timeout = 10000;
+
+	writel(readl(chan_base + BCM2711_DMA40_CS) & ~BCM2711_DMA40_ACTIVE,
+	       chan_base + BCM2711_DMA40_CS);
+
+	while ((readl(chan_base + BCM2711_DMA40_CS) &
+		BCM2711_DMA40_TRANSACTIONS) && --timeout)
+		cpu_relax();
+
+	if (!timeout)
+		dev_err(c->vc.chan.device->dev,
+			"failed to complete outstanding transactions\n");
+
+	writel(BCM2711_DMA40_PROT, chan_base + BCM2711_DMA40_CS);
+	writel(readl(chan_base + BCM2711_DMA40_DEBUG) | BCM2711_DMA40_DEBUG_RESET,
+	       chan_base + BCM2711_DMA40_DEBUG);
+}
+
 static void bcm2835_dma_abort(struct bcm2835_chan *c)
 {
 	void __iomem *chan_base = c->chan_base;
@@ -483,10 +695,16 @@ static void bcm2835_dma_abort(struct bcm2835_chan *c)
 	/*
 	 * A zero control block address means the channel is idle.
 	 * (The ACTIVE flag in the CS register is not a reliable indicator.)
+	 * The CB register of 40-bit channels is at the same offset.
 	 */
 	if (!readl(chan_base + BCM2835_DMA_ADDR))
 		return;
 
+	if (c->is_40bit_channel) {
+		bcm2711_dma40_abort(c);
+		return;
+	}
+
 	/* Write 0 to the active bit - Pause the DMA */
 	writel(0, chan_base + BCM2835_DMA_CS);
 
@@ -517,8 +735,13 @@ static void bcm2835_dma_start_desc(struct bcm2835_chan *c)
 
 	c->desc = d = to_bcm2835_dma_desc(&vd->tx);
 
-	writel(d->cb_list[0].paddr, c->chan_base + BCM2835_DMA_ADDR);
-	writel(BCM2835_DMA_ACTIVE, c->chan_base + BCM2835_DMA_CS);
+	writel(bcm2835_dma_cb_ptr(c, d->cb_list[0].paddr),
+	       c->chan_base + BCM2835_DMA_ADDR);
+	if (c->is_40bit_channel)
+		writel(BCM2711_DMA40_ACTIVE | BCM2711_DMA40_PROT,
+		       c->chan_base + BCM2711_DMA40_CS);
+	else
+		writel(BCM2835_DMA_ACTIVE, c->chan_base + BCM2835_DMA_CS);
 }
 
 static irqreturn_t bcm2835_dma_callback(int irq, void *data)
@@ -545,8 +768,12 @@ static irqreturn_t bcm2835_dma_callback(int irq, void *data)
 	 * if this IRQ handler is threaded.) If the channel is finished, it
 	 * will remain idle despite the ACTIVE flag being set.
 	 */
-	writel(BCM2835_DMA_INT | BCM2835_DMA_ACTIVE,
-	       c->chan_base + BCM2835_DMA_CS);
+	if (c->is_40bit_channel)
+		writel(BCM2711_DMA40_INT | BCM2711_DMA40_ACTIVE |
+		       BCM2711_DMA40_PROT, c->chan_base + BCM2711_DMA40_CS);
+	else
+		writel(BCM2835_DMA_INT | BCM2835_DMA_ACTIVE,
+		       c->chan_base + BCM2835_DMA_CS);
 
 	d = c->desc;
 
@@ -723,12 +950,12 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_slave_sg(
 	if (direction == DMA_DEV_TO_MEM) {
 		if (c->cfg.src_addr_width != DMA_SLAVE_BUSWIDTH_4_BYTES)
 			return NULL;
-		src = c->cfg.src_addr;
+		src = bcm2835_dma_periph_addr(c, c->cfg.src_addr);
 		info |= BCM2835_DMA_S_DREQ | BCM2835_DMA_D_INC;
 	} else {
 		if (c->cfg.dst_addr_width != DMA_SLAVE_BUSWIDTH_4_BYTES)
 			return NULL;
-		dst = c->cfg.dst_addr;
+		dst = bcm2835_dma_periph_addr(c, c->cfg.dst_addr);
 		info |= BCM2835_DMA_D_DREQ | BCM2835_DMA_S_INC;
 	}
 
@@ -797,13 +1024,13 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
 	if (direction == DMA_DEV_TO_MEM) {
 		if (c->cfg.src_addr_width != DMA_SLAVE_BUSWIDTH_4_BYTES)
 			return NULL;
-		src = c->cfg.src_addr;
+		src = bcm2835_dma_periph_addr(c, c->cfg.src_addr);
 		dst = buf_addr;
 		info |= BCM2835_DMA_S_DREQ | BCM2835_DMA_D_INC;
 	} else {
 		if (c->cfg.dst_addr_width != DMA_SLAVE_BUSWIDTH_4_BYTES)
 			return NULL;
-		dst = c->cfg.dst_addr;
+		dst = bcm2835_dma_periph_addr(c, c->cfg.dst_addr);
 		src = buf_addr;
 		info |= BCM2835_DMA_D_DREQ | BCM2835_DMA_S_INC;
 
@@ -893,11 +1120,17 @@ static int bcm2835_dma_chan_init(struct bcm2835_dmadev *d, int chan_id,
 	c->irq_number = irq;
 	c->irq_flags = irq_flags;
 
+	if (d->cfg->chan_40bit_mask & BIT(chan_id))
+		c->is_40bit_channel = true;
 	/* check in DEBUG register if this is a LITE channel */
-	if (readl(c->chan_base + BCM2835_DMA_DEBUG) &
-		BCM2835_DMA_DEBUG_LITE)
+	else if (readl(c->chan_base + BCM2835_DMA_DEBUG) &
+		 BCM2835_DMA_DEBUG_LITE)
 		c->is_lite_channel = true;
 
+	c->ext_addr = c->is_40bit_channel;
+	if (c->ext_addr)
+		c->periph_offset = d->cfg->periph_offset;
+
 	return 0;
 }
 
@@ -917,6 +1150,7 @@ static void bcm2835_dma_free(struct bcm2835_dmadev *od)
 
 static const struct of_device_id bcm2835_dma_of_match[] = {
 	{ .compatible = "brcm,bcm2835-dma", .data = &bcm2835_dma_cfg },
+	{ .compatible = "brcm,bcm2711-dma", .data = &bcm2711_dma_cfg },
 	{},
 };
 MODULE_DEVICE_TABLE(of, bcm2835_dma_of_match);
-- 
2.56.0

