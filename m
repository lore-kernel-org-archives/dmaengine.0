Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781930;
	b=Im7y4+9dyO9DM84bbShyRgbU+AWfDrs0KKowkt+n0viNAq6XANPtT0DDDcFgTDUyxWhy
	 h/KDKfbx0KKiqFgLY+M/o0wEr2e8oGQ4dfZaFJ7XWxyUkFIlBOkNAN0VvjPoBdhxGoCEU
	 w9zgz15XIDimg5y0Y6/eGe6X5M7XOe8ZKc6hwMDLuOAUZnZjysO4wqKi6pkj1nH97AkSR
	 ZKZg1NarED5j2ivWwlDpK259WcDbP0hs6D8CCVKe2MQhd/wsZ0rwsBBp8Q/TiQS026gUx
	 gcxkiyKr3qb8CN5KTxGV/TUwfCUpoIg5TygiwWht58r6FirTXbjlSNXe97SCg3h5ArQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781930;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vskOlk6iNdjLrDbrz+V+LdGLIEjB8hQEQkTipBa/9eo=;
	b=yNJM1dFNHTHA5qQlfEFVnAL5NapH25Jt8zV9gQ3b5JDChMlsCdeeNR4qvHC3WA+q67hY
	 rDsKap5UzveSjulGDxpt5C2NsWb/9abWohUkdEPeHeI+LkW9BhPGDXwWcQVjDsnHaDJp4
	 tx8i+KwNo+nHVJfdKg9QO48dDnLwW61wmgM+JasO9FPF89K2kHyj2c2m9w9EDfMiQxbwh
	 vC8fqTzgyWi0twJdRVEq69AiU+jXl8z6nEFe48xL/iver9UuzBfmpbL3qVcUzMxxS3HFB
	 vOUoZoptlASM7ahfHUvyR15eEAW84rntkP09+WtNVnrpXL6p7gcJ/kNnZ37eoJNbjhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=fYf09Nic;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA828606A6B4
	for <dmaengine@vger.kernel.org>; Fri, 27 Nov 2026 12:18:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA828606A6B4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=fYf09Nic
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4a9be758734so5073870f8f.1
        for <dmaengine@vger.kernel.org>; Fri, 27 Nov 2026 04:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781928; x=1796386728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vskOlk6iNdjLrDbrz+V+LdGLIEjB8hQEQkTipBa/9eo=;
        b=fYf09NicfVWgyxF3gWBZIQJ2eF5Nns6NRnHBxU3wviTGwC76zLKdGRuVoY0JA5iDJa
         f+Dqk2xJm2x2Uq4yfYcql2NdrZvn/cTKhJUBBb07krT3zQVSmINGk4pBzbskjeVx/WsW
         vwfj/SmZD4q7RJ10wta50QwifmpDq3ir0UfBsyaXHgTdzW2fAGVlzOoJVz9z/ycMOqKs
         Iv1xC5NEsc3i0eolDIHF5nNs/MOciz3ouL7alROMNSeTPWTyhajZa4gWsHU3rILivl1G
         tNOuWHADcduH5V4QbSoIdES4e2EtnmYF0NPvL7jbJmZNwd/86cU+Xc4z4uP7AALYN9kk
         3ifA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781928; x=1796386728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vskOlk6iNdjLrDbrz+V+LdGLIEjB8hQEQkTipBa/9eo=;
        b=yWpviuc6BVibAWeohbG2Jg/BKJ0l0G1tiHWre23YKHvjkS0bpcgwggZZq3kY/JlkgA
         +UcOoX8hsk45vlW8WYkiW4EkLrIA4hyr5Eqj3YHYJDEWYT/zLnYC7u+73cLy1IShtq1O
         woNy/Jjsg3JWWGsCpmaTcNUHEu63yNLEV0Jqvc0ZNTbsjqKJ7sU76c/9jvYqri3Fv9QA
         X41O/DDSa1T2n40rwkxTWxQU8QKjIofeYXe8S2YxRUcPeQfd11joDzhPHbrBix3MnW8S
         aCZC+ibiOaQbWXAMLH2RAuNSCPU7qv/iDe+8fv41dFjSPX1Mu2yFqIDO69Q9QKcaQeLO
         Jdxw==
X-Forwarded-Encrypted: i=1; AL+hErErIbFwEs+RXei3ykoKGJxxMUg4Kh8uF+3uz6dmfufMU0vZjL5pSxDsxWsQua07qA1r8HxHLwPramI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZFoUSFlHQCIdeDRHfn3A3F/4j03/kQ28Oz80UXRYXQusz3nmS
	Nqa28fFj71tMi4JgfUXupT32GyoIZrqevPuHdbiNJkPpm2u2d4z81gdp9xZ9pChprwM=
X-Gm-Gg: AZFdTZfdkPryHlieLt4bHjavJMaV/UE+s7NBynp4JzZ0qQGg6Pjk1UQwCae+GSeD1ec
	3i1b9J45uHn+EHqDvglznrNAMRG3gzznovINMC6wM7udeCaDdevdubAaOF2B6VobbcztVoYrsV+
	UlML+9jOH3RaWKGf7Ib7m6TVBwtqF4eIUGKBoV8B7qr5xxzDKthp23ZncnBMcMg3hoPaMpK/xPs
	RlsW0XQrC8Fb3uoloNM7uSAiXSzVvkfMiOxhOUm/kx4vmdONbjowlGH8zi0KntC1qTmehr2CylX
	pws7CHRPISv3OcbfGiKJWyZVO/ZdodZT/EqgtwAUiBVLEiBqZeBKHzU426n4czFegVlDFiYLB8K
	B5Ruu2zLtjSas+Y4I8CO8yMVrRW/9RSwSKlPeczJOIE/IH5FSO4lHVI6iA6cDYmVrN7IHisGTBr
	1sglFSV6LMbGntCFV60X362CUFRvwlxg59CfcajvpHWhIvjmQgQDqmGN4UTT5HymRDMgfUseKoi
	8fED/MX/DXp0OCZln9ZAO8WZZgFWcAhGXtGiQe1GCpmRaD0oufsKuE465+YTbOW46djNfbEtU8V
	cLkUy7RrqhFyZ7mG/fskZdODPswE
X-Received: by 2002:a05:6000:310a:b0:491:286f:8e63 with SMTP id ffacd0b85a97d-4abaf7401fdmr52410705f8f.14.1795781928055;
        Fri, 27 Nov 2026 04:18:48 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b5f6sm44157829f8f.34.2026.11.27.04.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:18:47 -0800 (PST)
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
Subject: [PATCH v4 05/28] dmaengine: bcm2835: Support dma flags for multi-beat burst
Date: Fri, 27 Nov 2026 13:21:55 +0100
Message-ID: <20261127122236.4976-6-andrea.porta@suse.com>
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

From: Dom Cobley <popcornmix@gmail.com>

Use bit 30 of the dreq value to enable multi-beat bursts on a channel.
This improves DMA performance and is required for HDMI audio.

Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/dma/bcm2835-dma.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index 7bd1fbb2c36d..d65a93be5fa1 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -165,6 +165,8 @@ struct bcm2835_desc {
 			BCM2835_DMA_S_WIDTH : 0)
 #define WIDE_DEST(x) (((x) & BCM2835_DMA_FLAG_WIDE_DEST) ? \
 		      BCM2835_DMA_D_WIDTH : 0)
+#define BURST_LENGTH(x) (((x) & BCM2835_DMA_FLAG_BURST) ? \
+			 BCM2835_DMA_BURST_LENGTH(3) : 0)
 
 /* debug register bits */
 #define BCM2835_DMA_DEBUG_LAST_NOT_SET_ERR	BIT(0)
@@ -630,7 +632,8 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_memcpy(
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
 	u32 info = BCM2835_DMA_D_INC | BCM2835_DMA_S_INC |
-		   WAIT_RESP(c->dreq) | WIDE_SOURCE(c->dreq) | WIDE_DEST(c->dreq);
+		   WAIT_RESP(c->dreq) | WIDE_SOURCE(c->dreq) |
+		   WIDE_DEST(c->dreq) | BURST_LENGTH(c->dreq);
 	u32 extra = BCM2835_DMA_INT_EN;
 	size_t max_len = bcm2835_dma_max_frame_length(c);
 	size_t frames;
@@ -661,8 +664,8 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_slave_sg(
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
 	dma_addr_t src = 0, dst = 0;
-	u32 info = WAIT_RESP(c->dreq) |
-		   WIDE_SOURCE(c->dreq) | WIDE_DEST(c->dreq);
+	u32 info = WAIT_RESP(c->dreq) | WIDE_SOURCE(c->dreq) |
+		   WIDE_DEST(c->dreq) | BURST_LENGTH(c->dreq);
 	u32 extra = BCM2835_DMA_INT_EN;
 	size_t frames;
 
@@ -714,7 +717,8 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 	struct bcm2835_desc *d;
 	dma_addr_t src, dst;
-	u32 info = WAIT_RESP(c->dreq) | WIDE_SOURCE(c->dreq) | WIDE_DEST(c->dreq);
+	u32 info = WAIT_RESP(c->dreq) | WIDE_SOURCE(c->dreq) |
+		   WIDE_DEST(c->dreq) | BURST_LENGTH(c->dreq);
 	u32 extra = 0;
 	size_t max_len = bcm2835_dma_max_frame_length(c);
 	size_t frames;
-- 
2.51.0

