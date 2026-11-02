Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793610450;
	b=JdReIZJJCXrrgch8Sx8muOOR46Zn3mJjWm9fSMglknWXz1r85wAIkXBIr7RbNFay7QWb
	 BvKjmzW3XaHdKuSEM3T9d6JMyRsdyNck0zrJJRIl8KmsnnsFaBwrOAAMh2+W0WZrifTDD
	 O//5vmtj7ASYGEudZsoDhEKONykmD60YGA3O4yFDQIyW/FfPkHpdbK/UjxvRbbOfoNFZu
	 ElkMTU4YOk7UhJ6+2HoulK3Ls5v7Kb/KUFWnZ1RqD8tPtNX+mn4c6NnvpiOs5TPN3YF6e
	 3kICS1GNCkiG7fPqYyDsxjPAObHoHLhwFQuDSEfVYg9HTiouEYr8dUtmzfnr/HisNvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793610450;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=O8CeOuouE1l4YFK8LvbewNNu8BgTQOxG6QIZFhL+bA8=;
	b=1o9w2hauoQxopf2LkYXufzfDPxe+Zb/pgp3vVJl/x5kLqJFYkC32er/zlGEnBxfwuoaH
	 U+62tGG+web+4StRQ+2dFCWWhkjc1XI2OJ5JmKmixXRsPcldB0h/hpvL/7qCUuTsc6sNT
	 ud/ZFEg1CRuzHxToTWoNiWQS4z9KYAdnYnA0qRSqOdTHbRbfhxLyCXGo0VJn9FiCIx44h
	 U8zRafOSNhvkUm6q+pFx0cRMCYpdMvsctYNtygKb/UwCAgs/1948Q7XEPBB9R8xftvHx5
	 axLkM+KsPpIh2Z/BtN1WqdLgjYXfGZFc1t6OpdJhEt4synmJ02mjxzPRVuCoUGM/h6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PjW17MtX;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A545D606A32D
	for <dmaengine@vger.kernel.org>; Mon,  2 Nov 2026 09:07:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A545D606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PjW17MtX
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48c4be28b82so2869193f8f.2
        for <dmaengine@vger.kernel.org>; Mon, 02 Nov 2026 01:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793610448; x=1794215248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O8CeOuouE1l4YFK8LvbewNNu8BgTQOxG6QIZFhL+bA8=;
        b=PjW17MtXpX9lXyVomLePz+Cq7rn3FeUy4u6F5OeDuJ7cuI8iYA5psv0p1cvsdIH7x2
         ddJj6au6GgjFmGozJm4fMXyTuvTgA5g5QBLB2KcITdA9CtLlkfIi9QxmO7fADJUL1Ee3
         jA4jjOgGWI8cm6nLlK6+zmDV4gKJIibs+Blvl0CP/apIr4Vy54cFC89fnlh5McMEwI7p
         f4bvSSxcRzrI633Gwua64FTuEAb0U3nzmPqUAtga3KHhB84DN4mLi/INpMRocvmdeO8U
         f/D1MzXX3XmEMYyWyPMG+pbgI+0tb2gxYOCdplx8P5SRfUGEwU8GeqBs50k72sUUU/rF
         aDwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793610448; x=1794215248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O8CeOuouE1l4YFK8LvbewNNu8BgTQOxG6QIZFhL+bA8=;
        b=X+QkhACKvWuaJ2elpSbHQS3Abo/oZUXm6RG7pMwPInf4TWIiP6Wy63LS2oucCblFbe
         hvcU+Oz/CYGSnPMLlI0ArxxwutVUpKWJuPoLmLkZ9bcA4M+nZZZVyKnaglC+kI5wAzd7
         rFyodoSkGcl+HgxJYq2xSybdzraiIh22MLkMGnxLiNbRsCGTgAn0guh0JyNboHHJdQZF
         8bcCxRkVRFoSTW+W5xMV86K5ntKy8JXxaRWvWDwkbGIHV7+Qp2c/+vDoWMAZC7EbdOHV
         3wUcKc30PsU82lBLtZ6sC81hLC2PGI6YI/duESV1NEjPBMU9EOmqWJT4FRL57m2gXiAI
         +3qA==
X-Forwarded-Encrypted: i=1; AKwUvBx4aLhNAHxZdSGRp/XRnGqxWLFPw905mPQM08/mbGcdacNb+dfOvp/6+yxV0QQ4bZ5WBNrhzeG7yAI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKWizwzNPIIbDy3kEsgNEMKTMk67NyC/PfsdgU/aANHQEf0LO2H
	a0et9cbY4bSdlBCpNwE99J1yBhyca2xR4/9uMFcgq0DZhv1J7gfGFRUC
X-Gm-Gg: AYBFou3lsgC5uBuXTaTR/tb5RVKhzc2vjRr4pln84wCdfoktldfZ103pL6sdq5J50mx
	lI+P9ejf+lVoJRGHLk5JUNZPPTUtVJvdqpGzLUCKiDmZf6hVZTDeazpKwmSb9o02M/0LuaRxyAf
	1JR3+s+UMgoJhC7dlFG6c7ZOjkHNTu9eH2hPr41hISl0+89rWsY/rTsRgknjs9o6Ggkzs7uDWHX
	a06kMxuvWggb2uh2A24ndIJ5JYY/jtYnFNtjB1ZF5SMfVe6Bzfxj8wW0rGtFD5rnoBbJJc/h9LU
	pqJqOzrY8sBDVKFkR8J2d14MJdsVeuKFpxoypIKCbdjxM1wd6XDwXyM8I1e4lm4KFlblbObLPpL
	6Zf2zkgs+BlbZXj00jD9EiylOyeOpdLrx3/aWHnDbwXkOhvJFZ671x/fvFifJuzVGteNiDsMLJy
	6QqiDSLyXu/KRO4GRssXdIujfsVkDwnvkahpw/WvwU/IXfd6GAtzXEjd3VciTc+A0oaqyBahDqF
	4a4erl4LfPORw7kayONhjdwrXLCR4mJCn5zKOjgesiVUGqfmBn0RME/j+H4rLuEyTFOj6Qsq3ii
	iOgqqSZifHMXWXyXPTIE3XhN+BMCgQk+1rNV0n3mmyjG2Nv7aC2Bhz+7g/fThEswMcjMLfxxdXt
	N2x6I5qTyqVL9yZnlbaHJBdExu8wpAvCTW2dUKyYv+zngrrSeYuDDVCq2GRvQcQKKVt0ug/PDyF
	n7oXS/4WjeB0rY
X-Received: by 2002:a05:600c:3f06:b0:4a1:e672:5721 with SMTP id 5b1f17b1804b1-4ac181e75c2mr220479815e9.13.1793610447989;
        Mon, 02 Nov 2026 01:07:27 -0800 (PST)
Received: from cypher.home.roving-it.com ([2001:8b0:fb11:0:3889:86e0:d449:e2e1])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm417879945e9.3.2026.11.02.01.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:07:27 -0800 (PST)
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
Subject: [PATCH 5/9] dmaengine: bcm2835: Add BCM2712 support
Date: Mon,  2 Nov 2026 09:06:55 +0000
Message-ID: <20261102090713.896324-6-pbrobinson@gmail.com>
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

BCM2712 legacy layout channels carry address bits [39:32] in the
STRIDE field and use 32-byte units for control block pointers.
Channels 6-11 are DMA4 engines. Peripherals are seen at 0x10_7c000000.
Add the brcm,bcm2712-dma compatible with a 40-bit DMA mask.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 drivers/dma/bcm2835-dma.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index 35f8c47dea89f..f06609b04a098 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -44,11 +44,14 @@
  * @chan_40bit_mask: channels implementing the BCM2711 40-bit register layout
  * @periph_offset: offset at which channels with extended addressing see the
  *	legacy 0x7c000000 - 0x7fffffff peripheral window
+ * @ext_addr: legacy layout channels carry address bits [39:32] in the STRIDE
+ *	field and control block pointers are stored right-shifted by 5
  */
 struct bcm2835_dma_cfg {
 	u64 dma_mask;
 	u32 chan_40bit_mask;
 	u64 periph_offset;
+	bool ext_addr;
 };
 
 /**
@@ -212,6 +215,10 @@ struct bcm2835_desc {
 #define MAX_DMA_LEN SZ_1G
 #define MAX_LITE_DMA_LEN (SZ_64K - 4)
 
+/* BCM2712 legacy layout channels: address bits [39:32] in the STRIDE field */
+#define BCM2712_DMA_STRIDE_SRC_HI	GENMASK(7, 0)
+#define BCM2712_DMA_STRIDE_DST_HI	GENMASK(15, 8)
+
 /* Legacy peripheral bus window used by DMA clients for FIFO addresses */
 #define BCM2835_DMA_PERIPH_BASE		0x7c000000
 #define BCM2835_DMA_PERIPH_END		0x80000000
@@ -271,6 +278,13 @@ static const struct bcm2835_dma_cfg bcm2711_dma_cfg = {
 	.periph_offset = 0x400000000ULL,
 };
 
+static const struct bcm2835_dma_cfg bcm2712_dma_cfg = {
+	.dma_mask = DMA_BIT_MASK(40),
+	.chan_40bit_mask = GENMASK(11, 6),
+	.periph_offset = 0x1000000000ULL,
+	.ext_addr = true,
+};
+
 static inline size_t bcm2835_dma_max_frame_length(struct bcm2835_chan *c)
 {
 	/* lite and normal channels have different max frame length */
@@ -349,6 +363,9 @@ static void bcm2835_dma_cb_set_src(struct bcm2835_chan *c,
 	}
 
 	e->cb->src = lower_32_bits(addr);
+	if (c->ext_addr)
+		FIELD_MODIFY(BCM2712_DMA_STRIDE_SRC_HI, &e->cb->stride,
+			     upper_32_bits(addr));
 }
 
 static void bcm2835_dma_cb_set_dst(struct bcm2835_chan *c,
@@ -362,6 +379,9 @@ static void bcm2835_dma_cb_set_dst(struct bcm2835_chan *c,
 	}
 
 	e->cb->dst = lower_32_bits(addr);
+	if (c->ext_addr)
+		FIELD_MODIFY(BCM2712_DMA_STRIDE_DST_HI, &e->cb->stride,
+			     upper_32_bits(addr));
 }
 
 static void bcm2835_dma_cb_init(struct bcm2835_chan *c,
@@ -1127,7 +1147,7 @@ static int bcm2835_dma_chan_init(struct bcm2835_dmadev *d, int chan_id,
 		 BCM2835_DMA_DEBUG_LITE)
 		c->is_lite_channel = true;
 
-	c->ext_addr = c->is_40bit_channel;
+	c->ext_addr = c->is_40bit_channel || d->cfg->ext_addr;
 	if (c->ext_addr)
 		c->periph_offset = d->cfg->periph_offset;
 
@@ -1151,6 +1171,7 @@ static void bcm2835_dma_free(struct bcm2835_dmadev *od)
 static const struct of_device_id bcm2835_dma_of_match[] = {
 	{ .compatible = "brcm,bcm2835-dma", .data = &bcm2835_dma_cfg },
 	{ .compatible = "brcm,bcm2711-dma", .data = &bcm2711_dma_cfg },
+	{ .compatible = "brcm,bcm2712-dma", .data = &bcm2712_dma_cfg },
 	{},
 };
 MODULE_DEVICE_TABLE(of, bcm2835_dma_of_match);
-- 
2.56.0

