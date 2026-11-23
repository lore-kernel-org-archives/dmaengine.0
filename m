Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445617;
	b=aBu1vpdXDBQyqbRsQ4bhL7pfo7BoPYh7xiguCfdaGKRcsnW2oUGygefKxJybsZjo2c4p
	 /edFWI6FD1xYC+W91FgZS6th4J3N0PHHsAYRoaHjtqazCOE2STfItEYYClGkaT8fAtO0+
	 ZOCAHltgG0vK0Ng3GFBXp2FzsQWKzClWLToVI5fN4uGUm/8105zIEQ4mjEc6zdZpnGLWN
	 dsEWk90KbODJSVFjf7PLBxf3DFHlPhSmtxGLuu7j0gcgs9gs75wzvcaJsx65zleK9n3et
	 A0mvfX4qVvb7newsGpNyFnsRQAzz1BauOwxABC9Kt8doJKXtPgUbHnffsT6RyaRvotQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445617;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yjvjix1ikk+CGbe6cYBND0Wj9SQniRLSb3Q1jpj0b98=;
	b=dhm45R4pMkMdi7pai3ZFoZ/IH+epBYrL2SOmSTcSDXXrc4HkbRSInyrALq7vDQcYm0UE
	 c2z1hcP/mF8i4xJCeXoIQ7/xaWumYlyZfaaZdhxUz8rwX+pmvQVmk6W/8S+DNujmwvWIO
	 p1iUagI2Rftj51c1zfh44rycRbj1LLFhOl8/FhWItmbXtblZmJEBxGWqRaxnlSq9Hl6iM
	 lu76cQ+1Gp/gXqILUhgG4zLZjlucUlHL933JN6o60bsyM607afdapkkrg9YlDj/1zTnOa
	 pLTBhJBJ1L0zdyCJLBwGUvuh2RwGH/bOGVML++FD4KgmzkggbGPOb3Z3WnLs4yRvKFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=XkVqsZdM;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000B2606A687
	for <dmaengine@vger.kernel.org>; Mon, 23 Nov 2026 14:53:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 000B2606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=XkVqsZdM
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so2137474f8f.3
        for <dmaengine@vger.kernel.org>; Mon, 23 Nov 2026 06:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445615; x=1796050415; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yjvjix1ikk+CGbe6cYBND0Wj9SQniRLSb3Q1jpj0b98=;
        b=XkVqsZdMeHpiJh4TE4FyZ4rGJAMbAslvY9zSoJ6LUQLDl/U/PQ9u1OeVW3wbxvhHKx
         kX/pztzhUIpaTZ+2DQLK6ZoUnETw3r2gArj5GEP/QBZ+Anj4sjUrLXFNPsf4lshi+/Xe
         AMwL117lSaIfAQwEP8+nmdBnxrkv28a814bMLCFljC6G2qHN/oANg3FumU8aezzJoAvT
         HBW4cMrT6WaUj4FmZNuK2yJjT8JrWlCFFL4Uyohrbj8LUtsO1qbX1YefGEzIuSY3L93f
         b4EP4GNfVWsHiOj7XLdIclXS6HI6RKjgVRYnNtTJ8p9Hb9R4MMYDf0ZlieL4vbdj7rr1
         vcuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445615; x=1796050415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yjvjix1ikk+CGbe6cYBND0Wj9SQniRLSb3Q1jpj0b98=;
        b=LEhyhyOHe9FLj/bfN7L4OxQzAvm4TY29R1KqvRWrs1Okt5M+r4xSAu0T0e+VcSCmay
         l9YVBxg2q4/Ec7IrLxynO24wbHw7BVmRyWE2bv1onHvPLc6avgrT/kpmhkQVGJ+pqnfG
         /IMPbeBH5u57SvUiIwjEJe5ek8u8tUH1/tfkGF1b6tTybP7dM03rP6BJGIZxA0suwtCb
         uMubG2OCGSnagDlJ0KtrKRfE76Nt1zWG6+e6Jr2nGg75N1NM6/S/WSI6FOTAeqI9zQX6
         lAB4JB1Jc6MNzBAYkHvFkfljzf8nrF6FCTRknZdAkb3LdAiP70ygViCTL4zgU8hzOrKJ
         mkKg==
X-Forwarded-Encrypted: i=1; AL+hErGf2egNBNAXVGUdJF+s0eY6hKWo/6JIU50e1S+J+BWeMmRo15xRNLJE2vaqsjlzopIWNantKrQMOv4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9t93Vy4LE/NnJCDxRUKW/TfUVrtBdLyZYCeT1KSzFEmclSXe+H
	xzV2WFuOy9PU6s6vIuADEQzuA41yNqk11mqJaCKm6K/MumcV1nEi/niHdYa/Bh4HjM0=
X-Gm-Gg: AZFdTZePhOA7YigxiqzJPfnRripzNUN5h8jB5f9cqyYUYG5dVVDh+8FEN7jeXNKzne6
	PHs1EIjGqLSvlGE3chXQEDiKW8Ct4cu0ZiiHhAOgybJnIHFQzJhxKl7F+dzpFeMbk7y1Y87bu3r
	6RkZNJPeC+yWTp0Vi1jyJqnMq7VdQQQZK6vpA8ZzmPqGvp0eIpjwjrIx7LR36F+ny30jLDiN086
	T1e+Hbup7xNvJU0szYbP+P7wyYBGD9xx2qTG0f961HOAJNJ71I4ijd3LGl5pbwBRaxu7QHevBaX
	6UgbXS6DdzEl36dV2SbHrs9DFAaxrp1P/FwpoHbVB4RBOQN85EZsjxzH4J9UJJnEpNYL995MAwU
	ehrp4YUFnIDm6NcVauuplW7RivDvEDTSVObjMqLCo9h9EvN8Fnp0ybr34MJEHLzrdZkeajzVfQI
	dCzo8rpU56qj+/AqTKYeSMLsnqt+j0mc7qbADBCwzmCGM2Dm7TV0c9lM0IUJq+3QsDN6FwaSWxe
	8Gr/moi+nG1byXnchNcbk70XO/z6IlWJmOoD8i3DmWIosmoqhbBNQDpVCtt9kQNVgZO5BMOqZ1O
	3fe9fK8HmrVvVVU4+yqNcUGFfVg=
X-Received: by 2002:a5d:64c9:0:b0:488:88ec:59c3 with SMTP id ffacd0b85a97d-4abb0f3c071mr24213933f8f.14.1795445615277;
        Mon, 23 Nov 2026 06:53:35 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c248b75sm23180331f8f.54.2026.11.23.06.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:53:35 -0800 (PST)
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
Subject: [PATCH v3 02/28] dmaengine: bcm2835: Add support for per-channel flags
Date: Mon, 23 Nov 2026 15:56:40 +0100
Message-ID: <20261123145728.29082-3-andrea.porta@suse.com>
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

From: Phil Elwell <phil@raspberrypi.org>

Add the ability to interpret the high bits of the dreq specifier as
flags to be included in the DMA_CS register. The motivation for this
change is the ability to set the DISDEBUG flag for SD card transfers
to avoid corruption when using the VPU debugger.

Signed-off-by: Phil Elwell <phil@raspberrypi.org>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/dma/bcm2835-dma.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index b19182c6e3df..690f5ba1c439 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -137,6 +137,10 @@ struct bcm2835_desc {
 #define BCM2835_DMA_S_DREQ	BIT(10) /* enable SREQ for source */
 #define BCM2835_DMA_S_IGNORE	BIT(11) /* ignore source reads - read 0 */
 #define BCM2835_DMA_BURST_LENGTH(x) (((x) & 15) << 12)
+#define BCM2835_DMA_CS_FLAGS(x) ((x) & (BCM2835_DMA_PRIORITY(15) | \
+				      BCM2835_DMA_PANIC_PRIORITY(15) | \
+				      BCM2835_DMA_WAIT_FOR_WRITES | \
+				      BCM2835_DMA_DIS_DEBUG))
 #define BCM2835_DMA_PER_MAP(x)	(((x) & 31) << 16) /* REQ source */
 #define BCM2835_DMA_WAIT(x)	(((x) & 31) << 21) /* add DMA-wait cycles */
 #define BCM2835_DMA_NO_WIDE_BURSTS BIT(26) /* no 2 beat write bursts */
@@ -433,7 +437,8 @@ static void bcm2835_dma_start_desc(struct bcm2835_chan *c)
 	c->desc = to_bcm2835_dma_desc(&vd->tx);
 
 	writel(c->desc->cb_list[0].paddr, c->chan_base + BCM2835_DMA_ADDR);
-	writel(BCM2835_DMA_ACTIVE, c->chan_base + BCM2835_DMA_CS);
+	writel(BCM2835_DMA_ACTIVE | BCM2835_DMA_CS_FLAGS(c->dreq),
+	       c->chan_base + BCM2835_DMA_CS);
 }
 
 static irqreturn_t bcm2835_dma_callback(int irq, void *data)
@@ -460,7 +465,8 @@ static irqreturn_t bcm2835_dma_callback(int irq, void *data)
 	 * if this IRQ handler is threaded.) If the channel is finished, it
 	 * will remain idle despite the ACTIVE flag being set.
 	 */
-	writel(BCM2835_DMA_INT | BCM2835_DMA_ACTIVE,
+	writel(BCM2835_DMA_INT | BCM2835_DMA_ACTIVE |
+	       BCM2835_DMA_CS_FLAGS(c->dreq),
 	       c->chan_base + BCM2835_DMA_CS);
 
 	d = c->desc;
-- 
2.51.0

