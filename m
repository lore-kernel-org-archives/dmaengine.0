Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445627;
	b=SQWZbG6i2NrgbZt0PxQAoNe+G/3hU3H6yswbkmoq2IdLrZkW2KD+x3qiqUwKYXeSPQaO
	 YfALLVABPoWz1jMCiWqvc8DDLlsQlrO+G03ovjYYtn1p9qHNMZcMhGVs15//TA6CgqLiL
	 9+X0jZixL0/16aNnKkIhM7mJl63Gy462YGfo9nfx60gIhjknTzEjwKvROyd2SS8QqLCB7
	 AvdlkcNafSJpOfzSdCNvvizVeg33c9R379Q9/gUau/536vEfiJMrxJKiL0HjaqZAXfi9a
	 Hs33M4ANIX996ZYwKsNe/Hc76z6k62TfB/Y6UeaT9Byey2mXl7C++6S4pnBMh2K5A+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445627;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AI8HWgrEJm2ajFDDgXXsC9dIqWcTrg87ImDVMUpFPTg=;
	b=dR5t4Hzv8x1Ns9H7O3VM8cS0mEkS+QbGXV4Y550NCIh8M6PfGrLnuTm/VGictPn3I1ES
	 WA+DLWc4NcCYArNzeom4wwbOZ1y7UaeGiYBR6b7oqGxn61HEc3iYWfBHVSTa3ri+WbZd5
	 pqmlac6UWFql1UeLWrbKYAgNbZJM3iD3XbLUy/8Le/0/+LpLlMM6RW4aXtsVG/c+enwu+
	 d/8Rch5zQPA3sEcejdE/abKBQcfAKAdDmhtVVFdKGVoRKt4z3JKwcubE2l68cJEhM+2A1
	 tq3w1YYgtaOdaz7yaiPpkFNFfbnFZElz1WlxizSlsfB/JkTBi6/x1lLxLUMdJTOYQOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=bwxI8bLH;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3774D60A3808
	for <dmaengine@vger.kernel.org>; Mon, 23 Nov 2026 14:53:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3774D60A3808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=bwxI8bLH
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-492690dd5daso2568658f8f.1
        for <dmaengine@vger.kernel.org>; Mon, 23 Nov 2026 06:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445626; x=1796050426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AI8HWgrEJm2ajFDDgXXsC9dIqWcTrg87ImDVMUpFPTg=;
        b=bwxI8bLHOXzCkukkySsdy+BztufD7qqK6tEHG8JJzXYchAYVfWByKO8ouhWKyAETIL
         kG3eNeoL42N8Q+Td7tGYU3LjbMT/uXuqs/QpbNar/ZYAFFPGBwrR1XfCK5clzwD8zCHW
         I1uUP1YrObVUM/AAyySDahq5Y127aNypfaPY8zWYON3jhQ8ZL1r0QDIqKMM1fiLyAfey
         bIlzUjpzaBf3siCaa7kDA8TX7dXruTs59WbQvYUlSE6yFs6ND0Flwc6sR6KGMrlwjMAD
         yFzBttc+Iz4UXKUl/6AM/nKr+a5tk+/5gbjlt/TsYUeNbS9jbe07s0Kxl4cAl3vLtlzw
         rlbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445626; x=1796050426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AI8HWgrEJm2ajFDDgXXsC9dIqWcTrg87ImDVMUpFPTg=;
        b=tJw3pWhzwlDFtq+kl62IHxtvTd3Br6L0bbwLmqN9IbMbdH3ZfrRcyUBOwsQ58GiXUd
         KIPeUKk3xJTok5Ira2edzvTHeJA7ps+kpHkOh/O5qXrYTt5SD1Zqg5Gf4Hi6d0cr8J3H
         y6ajuFxu1G9qDYmM32kHA4WGpjPQnMpNrBlcrH6LMwBeNz3CgF84/1Ph3wfysmFpV+/l
         WbdiGIVRh7VhdFz0VK+YwGyk41S0tvyrDVS4I2Ri340eaDYBAjwuJB0+5ZxV71gIOa1c
         Q33dc5sQR1sw52cm+ig6Z8GLJ+sI/i+WBmKe2n937vC1+AhA0Me18cYvXL0XR2xLoMXb
         sW2A==
X-Forwarded-Encrypted: i=1; AL+hErHXiaWCpstaMwQ2NSWIOyn3/iTGrL5rSu5tAy7tUzOdx94rCnybMeA+uoNqrz4ao4CXWe4PGrFiemA=@vger.kernel.org
X-Gm-Message-State: APuU4Z93JBlCjr7/gbZIHtlud50QKIdJMlr3JwRSkqLIWMg9goEynNd8
	IIbhxHx9HVo00w2OrNHpm5CcT5TjqMZha2nMyG1/3TyW/1Ee/iBvplHMcbCNUZC0A3k=
X-Gm-Gg: AZFdTZe2Pp0RqYoT4b1eR/ZYUM3lX+rBTWEolObz3YH20Ghqo++Xk560erlSNFq2ivG
	CLKTF4ICuugkmZ4l/+X7MZ+lDFgOHFhfrgq+0zd8TdHuMEJx6cFco+/1nG/+TMd4LQFMJGGRQZf
	N3FWHeX9dwg304DB1JLEbJ8DJLsTUKFr+oLsUWraD46djhniJvZg74HSpD52dma7NcDdirrjmrA
	vCaeT5PBc2vuzBwbmxmVVYAAjtKBOVLRkIb1YBrdGt/Rq6szo5gGDkoGcqJg19gi1mgU2+/uMqJ
	FgtG34XZI9n2rIE1uEjcRfNNcTDz8KFylUqDVOIhCUgqCF1H3qo9lC0ykVm42Hl8hU3lVplGq3F
	6My56/aXfEqeyeRz21m5OcH3RSL0JrSvqWA/HpAlGcJxPy9yHk9AHDxqdNNdNqJ5tKmultD7sVe
	VJIqydp2nr801W+l+bODl/vA6HBj1UtBhett32QiwNiGztr2NUDKCSxTQz/001hfy+XuNq6wjiG
	UoVpyH/Dr2z3tCJ8HSH9u2+izj5QbUUAjISoCIggwfO/Uzc/WnfNCwtXJdsR7nzOTvWWFacjWCI
	SS18M/aYCRYbXSAl4rxWPYfrn6cwkSW1nRjU6fI39I/+A90M
X-Received: by 2002:a05:6000:2210:b0:48d:facb:5937 with SMTP id ffacd0b85a97d-4abab5ea340mr24200572f8f.7.1795445625624;
        Mon, 23 Nov 2026 06:53:45 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c4353d6sm21988037f8f.56.2026.11.23.06.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:53:44 -0800 (PST)
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
Subject: [PATCH v3 09/28] dmaengine: bcm2835: move CB final extra info generation into function
Date: Mon, 23 Nov 2026 15:56:47 +0100
Message-ID: <20261123145728.29082-10-andrea.porta@suse.com>
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

Similar to the info generation, generate the final extra info with a
separate function. This is necessary to introduce other platforms
with different info bits.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/dma/bcm2835-dma.c | 31 +++++++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index adf3508246ec..77b3e2f58ac5 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -253,6 +253,26 @@ static u32 bcm2835_dma_prepare_cb_info(struct bcm2835_chan *c,
 	return result;
 }
 
+static u32 bcm2835_dma_prepare_cb_extra(struct bcm2835_chan *c,
+					enum dma_transfer_direction direction,
+					bool cyclic, bool final,
+					unsigned long flags)
+{
+	u32 result = 0;
+
+	if (cyclic) {
+		if (flags & DMA_PREP_INTERRUPT)
+			result |= BCM2835_DMA_INT_EN;
+	} else {
+		if (!final)
+			return 0;
+
+		result |= BCM2835_DMA_INT_EN;
+	}
+
+	return result;
+}
+
 static void bcm2835_dma_free_cb_chain(struct bcm2835_desc *desc)
 {
 	size_t i;
@@ -668,7 +688,8 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_memcpy(
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
 	u32 info = bcm2835_dma_prepare_cb_info(c, DMA_MEM_TO_MEM, false);
-	u32 extra = BCM2835_DMA_INT_EN;
+	u32 extra = bcm2835_dma_prepare_cb_extra(c, DMA_MEM_TO_MEM, false,
+						 true, 0);
 	size_t max_len = bcm2835_dma_max_frame_length(c);
 	size_t frames;
 
@@ -699,7 +720,7 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_slave_sg(
 	struct bcm2835_desc *d;
 	dma_addr_t src = 0, dst = 0;
 	u32 info = bcm2835_dma_prepare_cb_info(c, direction, false);
-	u32 extra = BCM2835_DMA_INT_EN;
+	u32 extra = bcm2835_dma_prepare_cb_extra(c, direction, false, true, 0);
 	size_t frames;
 
 	if (!is_slave_direction(direction)) {
@@ -747,7 +768,7 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
 	dma_addr_t src, dst;
 	u32 info = bcm2835_dma_prepare_cb_info(c, direction,
 					       buf_addr == od->zero_page);
-	u32 extra = 0;
+	u32 extra = bcm2835_dma_prepare_cb_extra(c, direction, true, true, 0);
 	size_t max_len = bcm2835_dma_max_frame_length(c);
 	size_t frames;
 
@@ -763,9 +784,7 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
 		return NULL;
 	}
 
-	if (flags & DMA_PREP_INTERRUPT)
-		extra |= BCM2835_DMA_INT_EN;
-	else
+	if (!(flags & DMA_PREP_INTERRUPT))
 		period_len = buf_len;
 
 	/*
-- 
2.51.0

