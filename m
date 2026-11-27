Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781934;
	b=44tsEgzggQ3CT6tXjEvCXFg+BGsu+4ZYbz6CZsJLnLZf7tL4W84PUS4OtU73l+rQfohL
	 +dNVKXuqI1xFxTusX+lEIqjs4cKnUsLj/7xXF68HT3n10qq1QEyQU2ld1Do7V1jLOdF/N
	 HtUvjCuHbVt34NDfTplFIwWrWnjXI/fZqpXKPAed86ySyMWWTzzFEBW1wh1DgOAfucmDy
	 PXNIuI+05IH6k5XfJe4rbf7bUY9RpEwTLh76WGVdv29iEKnMufvIYeC90i3PKEfkrq9Z9
	 ZU2/z9P/zgAZWE6CNrZNU2BECTtllcamVSfjuP7NaR3k/bOQeeuCp8gDYcqstwC2+0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781934;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tMNGeO93sTxsEO33pmW8bPBo/h98Zw55MeMFxQkFO1s=;
	b=Hb7CKb3LZ3yvGlyKfYE1M5Tzf0UNG0jMoKpgxXgkTODAz6QTKQpub5EM6RkitnxpuQ/P
	 inqjvhB830RaFotPVKWCBEkaZRT3Y/4UPyMrckg4KV4kX6TUeDers38cRXMRmyPXpJIii
	 Bt8MrLZKm/WRjwedWv6ECHpX3360s6r9jJkmb20pa5HtyJ/5aIZlIqZIiC/15YWbgGDW/
	 kSZJqn3HTuHWcU7gnwYKTWPfd1aQxUVmTv3dA2svE1+YxjIPodVesDdCdNr04MAH4Zm7w
	 Zirucl4QYA6sK1mevThqeoXE44KarSdUDnCK59ypM3O9IsY5Y5nZ+K4YVAF13QqCzOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=f7V+6qQp;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D107C60A262E
	for <dmaengine@vger.kernel.org>; Fri, 27 Nov 2026 12:18:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D107C60A262E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=f7V+6qQp
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48dee593f18so7529837f8f.3
        for <dmaengine@vger.kernel.org>; Fri, 27 Nov 2026 04:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781932; x=1796386732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tMNGeO93sTxsEO33pmW8bPBo/h98Zw55MeMFxQkFO1s=;
        b=f7V+6qQp9oKQCCyIIuvhYzNaC0PSDlXmV9Kf87U58Jdd8Tfa3UwNQPJaDGJm55jY2X
         VY/VSZL9DjzgO71JIj+jKNYhtKYMfOTmiRhRLSvTW3Pmy7uiPzz6pOaFfmxELYynSdgd
         s5wquoBzlT+vnNbtdzTC4idxwJddDlexIyKaK+uW/0nMlgN47rIH1AsLXnohCWo7TsdF
         nfqd1KAGtBnCazYGG1sGY733YUGrXpyDrb+B2gQBwZKp7r/CS9hOzdaMAeMIj3ryyzc8
         RSvyb5npBLRcjTdu0wVgp3uliyFCYIJ80rIOKhHMdYzk9NpXFzReqmI16qTSCA67f61h
         Q5Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781932; x=1796386732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tMNGeO93sTxsEO33pmW8bPBo/h98Zw55MeMFxQkFO1s=;
        b=d+D/6m/b6NLy2mA1TRmFg2H6QqKK/An4qLqLfEfen7YkMkkOYY7+GqtRAHWzPiNkuF
         H75+oJOlSL53vECQDEMbAjUMe6YFHj4dVJUaSHYucais7p7vvMs4AdNJtWVcgmwBwr3+
         Ut7xjsmvTgOyql1OnWCEPEWD1XovmAm65W0+rdOkk620GLNK8Z6YpaPqAuYmrOihb8qi
         SDzK4Yj3nZUjzEG+absJ/dAcKd6NNkxGE0mBwFx6u9Yo9HSmElgQcBsT3sYS03lV6vtg
         lHKanWmkbRWk+nzrYR6zqrNcssAgRBZ44ZRENqicEsB4u5Vz3Ut8jnnU+BHcdMIQB8/J
         GT9Q==
X-Forwarded-Encrypted: i=1; AL+hErHegbO6sLmZK+CV7UUNWAFa5hGrsqMuha7V5yHshQZlm/QMlAZWtglcRp0ClHvfLkYBY3Yg95RtPrs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9gxWBmBSqUFKTYm697tcrMJ7/D11hua1i5Ju4A1q25AApYQp2B
	0I+BVl7DqLthEMrJhfzvNO+9rgxCZWgDzVFeg7wsdyrXnPJ1Gb0vsmza2gkrxIMZrlo=
X-Gm-Gg: AZFdTZeesjyfAhJs7ZNE+v69UPr+kYQO/huc1W7Oi301L6ar5gbM3HZnTdcMk8XoYvA
	loAQXIZ5AMRKJ8bFJGLro5/v4UwhuEy9Hts+7X+J1AgkC/oUL5D1DU/fVWJ5fcerzYziK/+q6Zo
	SfFc1dwApViGHAPIj0NO3PvyA72gbTnDaJLTqDuBYuHrnM7KxEzAvDEIgEjTUWfWCR+reDWt7Za
	IECgLUC7cFZyMV4g7Etkfq/m27hw9YXXNa3tgHySo/v+HNTj3x5WlUzpw5g0Agw6M9u4/8mO/bh
	R9YNZtUN84ZdsKi6VEdz6S/hafMdP9uouxJB7wT/EoGm2lPrYWGCjKiYvsyhmoxylpJ//IjNDQ7
	a+sspLdhLA9ZnYPZk7I+umEs7MkDT5o6sMbIffZQuKyhExc+6/qkioJRmuwuHBa/dJszUj4g0lj
	FO0CbxL7gwSemHa2GU2eOdwvWKjK+h6D553QyfypHBRJ/Vni95RLvLq6A1J72utq0kVPhq1l6v8
	k/5vJf+tTJ+gKYTTZ6KxGpjwexYMDbru10xhMxXu9maYcwke/f5xcb98FqFIV8SYZA8RGQ6I08L
	yiuQllVi1FPuyNETnnmnP0v8FW/I
X-Received: by 2002:a05:6000:299c:10b0:4a7:9630:7b5a with SMTP id ffacd0b85a97d-4abb47b2043mr35030668f8f.47.1795781932170;
        Fri, 27 Nov 2026 04:18:52 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110c3csm44903360f8f.36.2026.11.27.04.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:18:51 -0800 (PST)
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
Subject: [PATCH v4 08/28] dmaengine: bcm2835: move CB info generation into separate function
Date: Fri, 27 Nov 2026 13:21:58 +0100
Message-ID: <20261127122236.4976-9-andrea.porta@suse.com>
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

Actually the generation of the Control Block info follows some simple
rules. So handle this with a separate function to avoid open coding
for every DMA operation. Another advantage is that we can easier
introduce other platforms with different info bits.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/dma/bcm2835-dma.c | 53 +++++++++++++++++++++++----------------
 1 file changed, 31 insertions(+), 22 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index d2e000e94347..eb306397b0fa 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -228,6 +228,33 @@ static inline struct bcm2835_desc *to_bcm2835_dma_desc(
 	return container_of(t, struct bcm2835_desc, vd.tx);
 }
 
+static u32 bcm2835_dma_prepare_cb_info(struct bcm2835_chan *c,
+				       enum dma_transfer_direction direction,
+				       bool zero_page)
+{
+	u32 result = WAIT_RESP(c->dreq) | WIDE_SOURCE(c->dreq) |
+		     WIDE_DEST(c->dreq) | BURST_LENGTH(c->dreq);
+
+	if (direction == DMA_MEM_TO_MEM)
+		return result | BCM2835_DMA_D_INC | BCM2835_DMA_S_INC;
+
+	/* Setup DREQ channel */
+	if (c->dreq != 0)
+		result |= BCM2835_DMA_PER_MAP(c->dreq);
+
+	if (direction == DMA_DEV_TO_MEM) {
+		result |= BCM2835_DMA_S_DREQ | BCM2835_DMA_D_INC;
+	} else {
+		result |= BCM2835_DMA_D_DREQ | BCM2835_DMA_S_INC;
+
+		/* non-lite channels can write zeroes w/o accessing memory */
+		if (zero_page && !c->is_lite_channel)
+			result |= BCM2835_DMA_S_IGNORE;
+	}
+
+	return result;
+}
+
 static void bcm2835_dma_free_cb_chain(struct bcm2835_desc *desc)
 {
 	size_t i;
@@ -631,9 +658,7 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_memcpy(
 {
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
-	u32 info = BCM2835_DMA_D_INC | BCM2835_DMA_S_INC |
-		   WAIT_RESP(c->dreq) | WIDE_SOURCE(c->dreq) |
-		   WIDE_DEST(c->dreq) | BURST_LENGTH(c->dreq);
+	u32 info = bcm2835_dma_prepare_cb_info(c, DMA_MEM_TO_MEM, false);
 	u32 extra = BCM2835_DMA_INT_EN;
 	size_t max_len = bcm2835_dma_max_frame_length(c);
 	size_t frames;
@@ -664,8 +689,7 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_slave_sg(
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
 	dma_addr_t src = 0, dst = 0;
-	u32 info = WAIT_RESP(c->dreq) | WIDE_SOURCE(c->dreq) |
-		   WIDE_DEST(c->dreq) | BURST_LENGTH(c->dreq);
+	u32 info = bcm2835_dma_prepare_cb_info(c, direction, false);
 	u32 extra = BCM2835_DMA_INT_EN;
 	size_t frames;
 
@@ -675,19 +699,14 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_slave_sg(
 		return NULL;
 	}
 
-	if (c->dreq != 0)
-		info |= BCM2835_DMA_PER_MAP(c->dreq);
-
 	if (direction == DMA_DEV_TO_MEM) {
 		if (c->cfg.src_addr_width != DMA_SLAVE_BUSWIDTH_4_BYTES)
 			return NULL;
 		src = c->cfg.src_addr;
-		info |= BCM2835_DMA_S_DREQ | BCM2835_DMA_D_INC;
 	} else {
 		if (c->cfg.dst_addr_width != DMA_SLAVE_BUSWIDTH_4_BYTES)
 			return NULL;
 		dst = c->cfg.dst_addr;
-		info |= BCM2835_DMA_D_DREQ | BCM2835_DMA_S_INC;
 	}
 
 	/* count frames in sg list */
@@ -717,8 +736,8 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
 	dma_addr_t src, dst;
-	u32 info = WAIT_RESP(c->dreq) | WIDE_SOURCE(c->dreq) |
-		   WIDE_DEST(c->dreq) | BURST_LENGTH(c->dreq);
+	u32 info = bcm2835_dma_prepare_cb_info(c, direction,
+					       buf_addr == od->zero_page);
 	u32 extra = 0;
 	size_t max_len = bcm2835_dma_max_frame_length(c);
 	size_t frames;
@@ -749,26 +768,16 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
 			      "%s: buffer_length (%zd) is not a multiple of period_len (%zd)\n",
 			      __func__, buf_len, period_len);
 
-	/* Setup DREQ channel */
-	if (c->dreq != 0)
-		info |= BCM2835_DMA_PER_MAP(c->dreq);
-
 	if (direction == DMA_DEV_TO_MEM) {
 		if (c->cfg.src_addr_width != DMA_SLAVE_BUSWIDTH_4_BYTES)
 			return NULL;
 		src = c->cfg.src_addr;
 		dst = buf_addr;
-		info |= BCM2835_DMA_S_DREQ | BCM2835_DMA_D_INC;
 	} else {
 		if (c->cfg.dst_addr_width != DMA_SLAVE_BUSWIDTH_4_BYTES)
 			return NULL;
 		dst = c->cfg.dst_addr;
 		src = buf_addr;
-		info |= BCM2835_DMA_D_DREQ | BCM2835_DMA_S_INC;
-
-		/* non-lite channels can write zeroes w/o accessing memory */
-		if (buf_addr == od->zero_page && !c->is_lite_channel)
-			info |= BCM2835_DMA_S_IGNORE;
 	}
 
 	/* calculate number of frames */
-- 
2.51.0

