Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445622;
	b=TkiVItMmBtgsykw/XuL5Eq+7wpUdB/eBIxb9AneQRw8oMDR470NJkaAr7ZE/HnAuE2gh
	 fFkxihGeTEtlZP9aBj9uT9RE/v07zk9lddYIMdX+cKbmynqRGGLHNge4BdyCXACQhHpwv
	 OUmUEWuauHg4C898qDAEvKi6UzOWvCHT0rzk+9ISoeu9wd/rUt6X2RRU+Gx0gKrZHfND6
	 ecH2+qEik/kM4WYAlDhbxaTynMfmCDzvek9v2EMcD+pA6d8fPcSIZ+iPJMSoxfo46qP1F
	 92FAvAcLESVX/fm14RUcxcnIsDQcueqYB6BeYEEKRXXRZPIPtD/GMxQAZOcsaeDZxoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445622;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GrSoWjeoZdpdA2pLivwg9kOVjevNBkSDdhik7u3RWso=;
	b=E+8s9rbbzmFp6qZbZCQUz37aNSAI5Q+iq2X/HxyQgWABZ8HBgyKlMC6L6TOJA8f2Vbbw
	 y7PzAHFF37id+ne2abW4+9em190/Mq4gYvYoOPVlI2jCP8EJUuGnSBgDsB+ck1T9q0sG1
	 2IYJTCV6LYIRtQ2wxiwzHhScby+qO2EiCLoclJr5a7YVUlNYdzGtFgX9Q8LOtSEJIpdH7
	 vkFBSZ9Z7JMeZ/hd/iW9xDk1gX1ajTvR8E28u+Zq5Aw+YV/hZQMj/lWPEZooa4zM0uWtt
	 rQ7/deNqjKE+1+dK7fJO8uei+g7P3O/ThG2/jxoOsvdjkIscIzAiKVh5HxRZszLtKVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=I7xfCsQW;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75087606A6BF
	for <dmaengine@vger.kernel.org>; Mon, 23 Nov 2026 14:53:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75087606A6BF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=I7xfCsQW
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so28454705e9.1
        for <dmaengine@vger.kernel.org>; Mon, 23 Nov 2026 06:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445620; x=1796050420; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GrSoWjeoZdpdA2pLivwg9kOVjevNBkSDdhik7u3RWso=;
        b=I7xfCsQWNGM6/3t3IFhuPig70szmaXPdWqHR4ICLd5EYf27TdS6LYX/3vN9VvL4QJq
         QqTt1vGn6XcO09FmNlVlM2JCkUMdRmbbccEZWIv3QW4PiQGOOfvsBC4Huh69PxiFsupZ
         iZvTlMvf53aouuFalLnWFe/2YWUwgPceGlafMd40ug/87CsMK3ysW12IfI5f44asr9iJ
         hqxhK/ff/NNMlFEJeuoN9quCJHovzK0Z4WISwy2gAHdxvXzPHFnZFdqz3/V7QbKFu/k+
         Tf4rGrfYp39AS7LxGmcc10xDf7/4WKW8h4xzNtxR1VD6M+konYD4HrgUbmpRBmnjyHTB
         4Krw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445620; x=1796050420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GrSoWjeoZdpdA2pLivwg9kOVjevNBkSDdhik7u3RWso=;
        b=yXFoGGLMQjZnpR1ZW8i9Y+WixjsaBuCDAOuGjWGYCXuS4vBErCY+3yCyvYJYTcmrZu
         OpWXLIbjHUfeJefp/lQYxyFou/0yDEiECIPiDhydbWEAUiCp8Uf2OVe8wDk8L+U/VDOc
         GjJ3qnTKbIKqNm/xwXoOB7vhacSJRctpwa9iA/Xa46jPN+GF9wcN5P28HmWEknXw2n7F
         4Q+6m1trgbxRhZ/OJdTMEszKhYzpZPjcBuvoOfSNqFdXX2s5oOIJOpcgcJJZo6HI7z0u
         uhEXQqspFX3qZVJ7gbESfLd1hLMG8tsh5XLvsPFQqd04C/ZlFY6gl+ezAzwRvH0uPzUr
         u9iA==
X-Forwarded-Encrypted: i=1; AL+hErE4n0vWqdg9wNHpM8w0mDgCPGoiidRXKmqkZajlvHRmiqQo+tcWlUGsNZ/9WD9Gp8bi3Wj98ylTG7Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/VM3YkYlh9lMk4WNL+8k+MxtAwLr+0RKROcI0/za5M7FkI6CD
	qtWx7fFLAxuJ/7we41bmNRvuwX9hWN1oBNXB2AjvwCzSmBJfPaL5rTifPFC0dv+HLYU=
X-Gm-Gg: AZFdTZcr9bKs5WuxtbbYgJWDdwoAaCM8RNx/OWmeoGwhT5oMXEwN9a7ZkPZ8mcUoRDV
	7VB+zEIFFeY9bPikoAFDcofD00EhaUsp2RnuOz+qfOeMniYLOryrJ4DXd2t9bxggv8yD9+CaglJ
	sV6J8c/H5hfA5nvNrZ+jcC+8Fttc3VPvkOk6bUgSl4yWjsK+PxgTj6NAaE1R0uT1sfmajh3g86p
	v2EIl67fr0qGyonj2sXs0eSTz9GFQgLl2odYWPpYoddfijCFCzBGzgLT3BbWhP0L+qX/CUjmOFo
	eeqwLrNvAn8cNZJisg3Fh0dLNY2LqsYNEsvZnAnZTfH8dWQrLuxrDmkuSyBlJHXJt9cnfSB2LMY
	lc/yNeuqc9nMQvZnnexapEFyXH428JEwyTA00tkA/DmCuvJQC7gU2kLVuox5w5lryFaHwci94tk
	h71UleA/8eniJdytWiN3U1qfkfGgEBpbcPnvGq5Lg4Nll6GQparWC48Q0LYLAmHpNoadFfaswp9
	RVK+yzmiCpYoKrtsuDf0BMRSHWUNS2Q7VQgD/yaLxxXbMWwcBiAGyoLx0L10Bw7kEca/aiSF3py
	5HberkkSwSYWHM7lqJ5PxEqs6Kk=
X-Received: by 2002:a05:600c:3e1a:b0:4bb:6814:7391 with SMTP id 5b1f17b1804b1-4bb8881921cmr233321345e9.25.1795445619780;
        Mon, 23 Nov 2026 06:53:39 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm663224295e9.4.2026.11.23.06.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:53:39 -0800 (PST)
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
Subject: [PATCH v3 05/28] dmaengine: bcm2835: Fixes for dma_abort
Date: Mon, 23 Nov 2026 15:56:43 +0100
Message-ID: <20261123145728.29082-6-andrea.porta@suse.com>
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

From: Dom Cobley <popcornmix@gmail.com>

There is a problem with the current abort scheme
when dma is blocked on a DREQ which prevents halting.

This is triggered by SPI driver which aborts dma
in this state and so leads to a halt timeout.

We attempt to abort the channel, which will work
if there is no blocked DREQ.

It it times out, we can assume there is no AXI
transfer in progress and reset anyway.

The length of the timeout is observed at ~20us.

Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/dma/bcm2835-dma.c | 32 +++++++++++++++++++++++---------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index 063e1b2aabe3..51e3a40dbaec 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -419,7 +419,7 @@ static void bcm2835_dma_fill_cb_chain_with_sg(
 static void bcm2835_dma_abort(struct bcm2835_chan *c)
 {
 	void __iomem *chan_base = c->chan_base;
-	long timeout = 10000;
+	long timeout = 100;
 
 	/*
 	 * A zero control block address means the channel is idle.
@@ -428,19 +428,33 @@ static void bcm2835_dma_abort(struct bcm2835_chan *c)
 	if (!readl(chan_base + BCM2835_DMA_ADDR))
 		return;
 
-	/* Write 0 to the active bit - Pause the DMA */
-	writel(0, chan_base + BCM2835_DMA_CS);
+	/* We need to clear the next DMA block pending */
+	writel(0, chan_base + BCM2835_DMA_NEXTCB);
+
+	/* Abort the DMA, which needs to be enabled to complete */
+	writel(readl(chan_base + BCM2835_DMA_CS) | BCM2835_DMA_ABORT | BCM2835_DMA_ACTIVE,
+	       chan_base + BCM2835_DMA_CS);
 
-	/* Wait for any current AXI transfer to complete */
-	while ((readl(chan_base + BCM2835_DMA_CS) &
-		BCM2835_DMA_WAITING_FOR_WRITES) && --timeout)
+	/* wait for DMA to be aborted */
+	while ((readl(chan_base + BCM2835_DMA_CS) & BCM2835_DMA_ABORT) && --timeout)
 		cpu_relax();
 
-	/* Peripheral might be stuck and fail to signal AXI write responses */
-	if (!timeout)
+	/* Write 0 to the active bit - Pause the DMA */
+	writel(readl(chan_base + BCM2835_DMA_CS) & ~BCM2835_DMA_ACTIVE,
+	       chan_base + BCM2835_DMA_CS);
+
+	/*
+	 * Peripheral might be stuck and fail to complete
+	 * This is expected when dreqs are enabled but not asserted
+	 * so only report error in non dreq case
+	 */
+	if (!timeout && !(readl(chan_base + BCM2835_DMA_TI) &
+	   (BCM2835_DMA_S_DREQ | BCM2835_DMA_D_DREQ)))
 		dev_err(c->vc.chan.device->dev,
-			"failed to complete outstanding writes\n");
+			"failed to complete pause on dma %d (CS:%08x)\n", c->ch,
+			readl(chan_base + BCM2835_DMA_CS));
 
+	/* Set CS back to default state and reset the DMA */
 	writel(BCM2835_DMA_RESET, chan_base + BCM2835_DMA_CS);
 }
 
-- 
2.51.0

