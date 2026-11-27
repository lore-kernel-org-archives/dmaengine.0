Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781927;
	b=AWwRkDpbOKE70O79f9pMv35qE/ubHvo2GYJ27F8peyaFw04PUfVttZ85WswYYJMy/CwI
	 E9W+ps0+ElW+kzktM42KMmWqLIigEIORX/EE+ycHB5ZQuX5F/QAW8QVvERLdOtxdX9Qpa
	 moeQ/ujebIC0ek+xo63ba+qacCe0UibLFCaOHSWeM/Fy1Z4mwuz9DyvczN6uQz2eayiwb
	 O5D4nO9yenpsCuiO3kgqCFRlAgTls1+kjcz87ZjS8FyXohQ87ye/qK21zkAu0eAOYor9z
	 0Dbqy35v55YSsgYdKvKv6WC01LbS/jHgtjPgGQBu7V/CN+4BTPma/do77aHH9nLyg+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781927;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CKw4sWprE2Ul+TtVWYzdYET0k07qC46nb2OuMsfTntI=;
	b=QGNQ9zLdzu/T7d7XsY6AagBVEx5ZzNrKA+aHrbp3FZk+1TnJJRz+9Xr6SdhjZJBC5WQD
	 FemVBh6HLB28RDnHofAgUQ5HJkseaHSZ51i9s/5Ksr3pVU62TC934OfmoYMmou9OKdR8t
	 FJaiCdVoEfJbqjiYFPr03mWC5lKh4COHS91kssjNji9N8sAMBO5XNSZZeLfArTPKrVxy5
	 nRYuJ/emqc8kuZdpEb+wHVAKCDuzVk2SsjC26vPAXw74Pp9t2sm99XyTXHeioo5keTLE2
	 8wO5MP7WrZd8Bur1qXQitSDxr4TZESU1Jiw/+vdX08QEx7CtmgjqfW5ICbW6+mHkZUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=gm4YxnjT;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1A2606A69D
	for <dmaengine@vger.kernel.org>; Fri, 27 Nov 2026 12:18:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC1A2606A69D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=gm4YxnjT
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4acb44dcd7bso7233273f8f.0
        for <dmaengine@vger.kernel.org>; Fri, 27 Nov 2026 04:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781925; x=1796386725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CKw4sWprE2Ul+TtVWYzdYET0k07qC46nb2OuMsfTntI=;
        b=gm4YxnjTJo8cvnBF12yR3Ois9lkRxPejDTQhHNxMexm4Ty5zn+7vU5a1wL+3t2B4F9
         aTlXtTNE0AQtCp5S4gHpgS278hDDMIQDtTP2F08ro2/sSw56agYQTISfcjWeZKj3Wsjx
         azeVmSwOu51jzBSRC+5ynKGHwQ1DMU0fC2R95BTKF58SN+vjLmlXvjEYFLvUp+xL4+ON
         gW28DPEOx+RcOP1a/qJYmeR6pacpYSIxy+abEhVBKxpSwZOZz4oAOcfjKTLi17pGESIF
         ZzFvKqIRRuMI1zNrOfu64ZBaKksP2eMBbQ4nTF7Vo1nZAIxXJQwxBNzlz1ZcRLnhK9+B
         +SwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781925; x=1796386725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CKw4sWprE2Ul+TtVWYzdYET0k07qC46nb2OuMsfTntI=;
        b=XXpqbmMMAEhEl5LEiH87UJe+2X8tsEqaNWrE00RJ5vaJsUPgpZ1VB6e1pbJYdZ6/Ll
         5LcQgpqIknktC/zOkGv2vY6/IZ9C5jsylhMX3forseTsrgePD8LTMB3sRl/qtagp3I4r
         9sJ2/mit+zbOCrqCZnmcr4T0TAWWSBlNSL6rBh1ld+Pkxr8qYgV/o4J0AQVmuahvjPEJ
         1aMIlYenHpnX+lhmksczieCo6NWhbwBqHN65Ktl0hDkDDuFFTJCzPNh8plkIbrieyzKo
         VgIMAoi9ZnqNs+eBHguQgSFUAOghla1//Wzf1CFuoBdvwKNFKyHgD5o2LUqfrASLrTGE
         uKQg==
X-Forwarded-Encrypted: i=1; AL+hErHSzXPLlNIPLoIcFqyknSc46zGuUZpzlnOmzDxHPiYN0XrovM987xAnvutXvAz6E74HfG87GCDaN4Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z/T7bjcgD4tAF0BmOlp+ETGw2PsYF2+qjzmjybOy6XprSw7JwA4
	nkzjZQC2IYvYT86nzYqAzyxRNl4DbauWMk+kCaVLY1RqqKPcLwiH69z//fwy0NegXBk=
X-Gm-Gg: AZFdTZeSydFVAQ3zUeo5P7QxTonQmHGtCNhPFcvkoyFcL0xHrqawYgnxSDb0GFE88RU
	nyvQa057ZUja9L76TUUdZyWZwh8R7reFhVsyfpQHifomuTK6EHEBTp65X4ocpeDLC7KNFHeafMu
	2w1UvcT99XUx74ChTjQsI+T0uRkzcdZBX5+4w8T/Wkvwmo9vthhroXNAHxLsGsL6RBNblwfifKh
	PCnvTTIx2av8gBazezXOM7zIhF8dWRxMDkSIuV8QfVD3SrUkI56RXM5CskogHFVEcCY2q28mZXJ
	Y2gXGjzmtNXeZFPG8ErtTFdhSrJio955HxLRU9NpeJUbYs8afKZCSm6iRqVdNKa+WAgHgxYSTH1
	BsJQpYeEWbISm6r6LT+3dkV9GX5ddfKZ5E4p08qt6fPS+XCdOnNW9C5GP9nv8TMhNuYxgEMn2pj
	umA/8Mb5kBIyc1dYNVjAMzwr7RUouFtPxTTWn6dxvmPC21omSvAPJuW1j057j+QnXvl7/5Yko9l
	NJNQOt3b9Ir6TAqX4hQn/sc5poLrrc9SERTSXztOeggsmB7CqiUCPE7mdYWZUZJOmA0X058G22C
	n+R9Bkfy2nm/oh6c+iYXzcWKZrLS
X-Received: by 2002:a05:600c:1911:b0:4a1:7c56:d4e2 with SMTP id 5b1f17b1804b1-4bb8880cf84mr498430495e9.16.1795781925146;
        Fri, 27 Nov 2026 04:18:45 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b2c5sm673667305e9.5.2026.11.27.04.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:18:44 -0800 (PST)
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
Subject: [PATCH v4 03/28] dmaengine: bcm2835: Add support for per-channel flags
Date: Fri, 27 Nov 2026 13:21:53 +0100
Message-ID: <20261127122236.4976-4-andrea.porta@suse.com>
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

From: Phil Elwell <phil@raspberrypi.org>

Add the ability to interpret the high bits of the dreq specifier as
flags to be included in the DMA_CS register: the AXI priority and panic
priority (used e.g. by the HDMI audio channels to keep the MAI FIFO fed),
the wait for outstanding writes before signalling completion and the
DISDEBUG flag. The original motivation for this change was the ability
to set the DISDEBUG flag for SD card transfers to avoid corruption when
using the VPU debugger.

The flags occupy the same bits as the corresponding fields of the CS
register, so they only need to be masked.

Since the flags now affect every transfer issued on the channel, clear
the dreq when the channel is released, so that a later user requesting
the channel by capability (e.g. for memcpy) does not inherit the flags
of the previous DT client.

Signed-off-by: Phil Elwell <phil@raspberrypi.org>
Co-developed-by: Andrea della Porta <andrea.porta@suse.com>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/dma/bcm2835-dma.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index 036a7a1727a5..5a9854a3c08e 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -33,6 +33,8 @@
 #include <linux/of.h>
 #include <linux/of_dma.h>
 
+#include <dt-bindings/dma/brcm,bcm2835-dma.h>
+
 #include "virt-dma.h"
 
 #define BCM2835_DMA_MAX_DMA_CHAN_SUPPORTED 14
@@ -143,6 +145,15 @@ struct bcm2835_desc {
 #define BCM2835_DMA_WAIT(x)	FIELD_PREP(GENMASK(25, 21), x) /* add DMA-wait cycles */
 #define BCM2835_DMA_NO_WIDE_BURSTS BIT(26) /* no 2 beat write bursts */
 
+/*
+ * Flags of the DMA specifier to be set in the CS register, they have the
+ * same layout as the corresponding CS register fields.
+ */
+#define BCM2835_DMA_CS_FLAGS(x) ((x) & (BCM2835_DMA_FLAG_PRIORITY(15) | \
+				      BCM2835_DMA_FLAG_PANIC_PRIORITY(15) | \
+				      BCM2835_DMA_FLAG_WAIT_FOR_WRITES | \
+				      BCM2835_DMA_FLAG_DIS_DEBUG))
+
 /* debug register bits */
 #define BCM2835_DMA_DEBUG_LAST_NOT_SET_ERR	BIT(0)
 #define BCM2835_DMA_DEBUG_FIFO_ERR		BIT(1)
@@ -435,7 +446,8 @@ static void bcm2835_dma_start_desc(struct bcm2835_chan *c)
 	c->desc = to_bcm2835_dma_desc(&vd->tx);
 
 	writel(c->desc->cb_list[0].paddr, c->chan_base + BCM2835_DMA_ADDR);
-	writel(BCM2835_DMA_ACTIVE, c->chan_base + BCM2835_DMA_CS);
+	writel(BCM2835_DMA_ACTIVE | BCM2835_DMA_CS_FLAGS(c->dreq),
+	       c->chan_base + BCM2835_DMA_CS);
 }
 
 static irqreturn_t bcm2835_dma_callback(int irq, void *data)
@@ -462,7 +474,8 @@ static irqreturn_t bcm2835_dma_callback(int irq, void *data)
 	 * if this IRQ handler is threaded.) If the channel is finished, it
 	 * will remain idle despite the ACTIVE flag being set.
 	 */
-	writel(BCM2835_DMA_INT | BCM2835_DMA_ACTIVE,
+	writel(BCM2835_DMA_INT | BCM2835_DMA_ACTIVE |
+	       BCM2835_DMA_CS_FLAGS(c->dreq),
 	       c->chan_base + BCM2835_DMA_CS);
 
 	d = c->desc;
@@ -512,6 +525,9 @@ static void bcm2835_dma_free_chan_resources(struct dma_chan *chan)
 	free_irq(c->irq_number, c);
 	dma_pool_destroy(c->cb_pool);
 
+	/* do not leak the flags of a DT client to the next user */
+	c->dreq = 0;
+
 	dev_dbg(c->vc.chan.device->dev, "Freeing DMA channel %u\n", c->ch);
 }
 
-- 
2.51.0

