Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445626;
	b=lSs6V8skzo7/KeHtuDtn6e7g859uF4scqOjqcJElUZ707jIUl5gOZidqZEVn9/3HvLzk
	 uTgk/7h+DAJOTFbcjfkjJ/Z2GgIcluk/+bLzPqzPIeooNmlDAPWyGjRss0gJOpBtGGcus
	 DypF5lEzanAaE4/H3lNvtu/q3XJXPSFCw9a4TMrJU1YxBNJmcHytmaVjKqOEI3pPgjP73
	 hQ99qMkBrN9kzZ+f5aXfzC8fZl9zi7JoDFJcogh7sBKlVUdh7SHnbtOCUVUXaMHCISxMO
	 lOJZ11kQkIyNKtA5Un7c4MCIVNs4g0IYz3ZenSKWSS8y0kGqPbes51jpkrnyuaWteTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445626;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UWP/pp1IkbQnXI16iTnJsuqUrrWyENmPbInF4rvzvak=;
	b=Mz1weS3o8IoUum+JFtP0i3Iwvb/CMtK5g3+l9SPwAVkAmtC43dCAxqBiWC4nZh5eAuZj
	 MuO14pCqKOSzBjHeiPiKYLhPT6TSfVKiBo5CIkhUs0tQ4HMBnmujaujkmLqQrusplHokS
	 vxWZ1puVcvdVAGZR8cWFzgHHAkFkV0WeNSs3uEJlJD2mUTNAlTdsycz9goYADbsEzM7dQ
	 oMhdBW8zFhf8+jxH3431lXr+BpV/aWZ/sv0OPnBgCzFEhS1A8gTjq0ngf5AVWgZOgaq2X
	 kVqP4QFMa5qguXZArRn78LwaHRulpolPP05yFUiwscPV59Fi9a93m3iXqnUz3vX5MGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="T/rcodwa";
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61BF60A2630
	for <dmaengine@vger.kernel.org>; Mon, 23 Nov 2026 14:53:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B61BF60A2630
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=T/rcodwa
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso33574065e9.3
        for <dmaengine@vger.kernel.org>; Mon, 23 Nov 2026 06:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445624; x=1796050424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UWP/pp1IkbQnXI16iTnJsuqUrrWyENmPbInF4rvzvak=;
        b=T/rcodwaI+pYX6a9H0SSzhyWNNDRr/NH+uv1nJvb9bdWXPK/kw6TQPItEKQTaSDMos
         8femRe7oAqiaHvnvAgDI/uNgg6K5t3LDifubnNgeuLlgvDhFKaQxbNRZWt1CRf5oun2l
         1cD/y+xY3s+j9WQ+yjgeZKhQqi1WzCGUEaE5vdBYisk5Up9Y+teyxRJOuNF8tK5qLbUE
         e+6Ymz1xRLd4KdPrw/oyMYZhaZ9V+tjHP7LMdwQJvQq1JUnXdfEDXqA/VyT2gCVSssy1
         S0axTP3zjhjmrOUkieYAAZPFiI/Vr1rUsIQDirJu/Ww+/us1auBMk+HR1QWEdXsEf9ai
         C5YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445624; x=1796050424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UWP/pp1IkbQnXI16iTnJsuqUrrWyENmPbInF4rvzvak=;
        b=WPRhSv9WiYA7VZSE6QXAoE5eq8xSjPPjZL/KzU+QvAtfNy428RTsPOhmi70Dm3V1n8
         J3bOzbzDYenn9T6OeCe/7TMkJEt2OCodRnjk4eBg/8dE9DDCUr1uVSWkeDCxvad5o+Y4
         22T/RkUmCAsKqQwqD7Dcm9iroTWvqNJ5ef4V1FaOMzYhX6Pf9nmwOky772BEN49pfH8F
         /c05YZkMVv34Zg7Gv8esIwARRLwTGO86vqkOHQ//uUp7uE84bllivk3ZhrOSstIJyBOd
         rBCSD5509aDJKClNDyxJ5/YEiofeXD95aL6uIAQHK5pIzQNnkqFfG2Ap+JkJnBr8dyQc
         0XNg==
X-Forwarded-Encrypted: i=1; AL+hErF7mflf8neQwNwknq3ukaJbjH/ILooG8L2Ce+WgpwFWiWd2z+Ms9JCxil8Q4BhKm8GL7hqI+b+O1UE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+9qH6e7BpPETFUzRgzgZqiJh1aV32/7s5yyjdRaQ/AZn1Y/Vsi
	xw4mk/13DrY4C9oqFJp09B1dMYI9LbmWN9j5zfZC2ueRG4RTsJ/VFA+mAz15XT3elEo=
X-Gm-Gg: AZFdTZc0jUKvv2Fv7toihytwjmdlh8Me+uZzA4wUIN4vP22i5a2ArtJpQ8oODg6KL8q
	S1kL2QU3FyH/eoPvY7JXkjqqz81AstAZQImvBNq1OeV0GVGxCQg5kfhUlaVDO4McRGLmSNk0sLX
	GdDAJGhrdwaBoXTn9eZeUFaJ/cq1UTwgB+hnERhXX85yf79P5KIpEQEKjDL8NQ/eIqwKfXHaHiR
	uB4MuK0P/mci+lhFc3jNnaC9FQGIsFhYcNMtJawgB9YoSLtfSuEZbN4iQl/pts/AllzIOObETs8
	WMrVu1ibRimTVA9X+tA76lvNCEFB7auTnKxqfTwUC8b4KskJWQ/tg0+3CwjYtpRU3zR3auJzTa4
	pmCpd0xDTm7o7nS0avBNtDQWttfrve47CjsiAnMTx77VblPB2HBgyfO+WEzQ55NctfAjSXgh4cH
	BTldk+ok22TqMubD1BVxcM0iNqWKgQ1TlS12qe6Z4ncAnOjvDMS8jQlX44e0ZB23cL8ORI9wC6g
	GjY6fg+Qyd737EMoJQI2fvrGAqlrJNFxOMFkf0aw1F3UwrVT7E6S9WE+1FcUna5yRKXnyxDCcX7
	7Yy8mwbxbuTLcQ/fJ5hKpiG1aGA=
X-Received: by 2002:a05:600c:1c21:b0:4bb:52bd:a3c7 with SMTP id 5b1f17b1804b1-4bb88804d41mr307783175e9.6.1795445624072;
        Mon, 23 Nov 2026 06:53:44 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm172540125e9.2.2026.11.23.06.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:53:43 -0800 (PST)
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
Subject: [PATCH v3 08/28] dmaengine: bcm2835: move CB info generation into separate function
Date: Mon, 23 Nov 2026 15:56:46 +0100
Message-ID: <20261123145728.29082-9-andrea.porta@suse.com>
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
index 1087157fb242..adf3508246ec 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -226,6 +226,33 @@ static inline struct bcm2835_desc *to_bcm2835_dma_desc(
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
@@ -640,9 +667,7 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_memcpy(
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
@@ -673,8 +698,7 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_slave_sg(
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
 	dma_addr_t src = 0, dst = 0;
-	u32 info = WAIT_RESP(c->dreq) | WIDE_SOURCE(c->dreq) |
-		   WIDE_DEST(c->dreq) | BURST_LENGTH(c->dreq);
+	u32 info = bcm2835_dma_prepare_cb_info(c, direction, false);
 	u32 extra = BCM2835_DMA_INT_EN;
 	size_t frames;
 
@@ -684,19 +708,14 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_slave_sg(
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
@@ -726,8 +745,8 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
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
@@ -758,26 +777,16 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
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

