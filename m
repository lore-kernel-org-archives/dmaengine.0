Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445639;
	b=dxHQPvCC8xO+/9KbqlxQ883P90v1Fu+8hzf2uGmYQZKDI2MT1JQoAP9oMi3Ft4vNhEAM
	 2r3Dz6adTTM7p4MWReV7+DA+Su2YeATksd8JKpaBk27WbF6j68XNJjcRNMTRUPc90NDyx
	 C5w32+Vqv4Ai3BIXTsjWPNgAFBWv0uaGlYy5z2USCh2/n1rMetQjzQbZltOBonHEKGEX1
	 EQOW7JLXzhK7wGwElZmOlItvlP1r7v3FyYd5j0FLCds2xiRolpxMU48wnYNdhhJ+WB16Y
	 J2mq+Wuv9UuYfAAHF8EdotmMOyPEZkMrzTwLQjCietnwupURmElE5nCQ+hExLNRFlNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445639;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=R4tDEGiURQM1Arylz9v3qFzT8K+oOXwhYEhcFQrcNqk=;
	b=OpE1aLxvf7Eo6Vg4yiMTjEfJWVU331hRNNltoBCpGcHV3eZTo1itVSmhDuGNvaurXKO5
	 CfM/EZdBgEzhDyQY2HTPLqROZU6umSLCqcWosgzV4BvLLbaRwwVOIrtcCuEi8v1vz/H7m
	 7ImzUXjb6YrVcJT/gwsaat/FYWGAf/Xacx8rSE9+mjG5grMcZu66FKGFuIXLijUOFgfv3
	 Lt+gQhqWZKQ2V2uw+6Ry3uqqE3k/Qs6jCR5j5yKMaTWm0pnNHNh77g09nIh7No3j4phnX
	 hUh+3J3M7p8B676ADYTPQY/I1g5vjTbrpA/v5bUgDjdPB/6xdDXjV1MtVGOocAvWNfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ZXg8n3IQ;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5072060A6F4E
	for <dmaengine@vger.kernel.org>; Mon, 23 Nov 2026 14:53:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5072060A6F4E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ZXg8n3IQ
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-498f5fa5103so2001092f8f.2
        for <dmaengine@vger.kernel.org>; Mon, 23 Nov 2026 06:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445637; x=1796050437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R4tDEGiURQM1Arylz9v3qFzT8K+oOXwhYEhcFQrcNqk=;
        b=ZXg8n3IQn27O0EAhb1QV0uH9WnWcXpQh9UD9Fvi2XTr2ASnA2yqy5YIIR0EGymdyk9
         g7EAMbPzyM5DOd0ZgSgIkkAED/fKpca6LzxdnKBGE+EMIbOwm7Y8k9L8fpshjuWqU3iR
         hWyi1JtgEKqmmEjZ7T4mZWKTcDiwAjKST/MmKcbhG7GHFy9PUYr3l4I8uu5doG0Rf+8h
         Jv/Ja/9M7YI2u9z1sGUcRe58XaSmCFSWsjkJ8aV5PXNK/ARgkcE8azAKcvlAJdWZtKKo
         3a3x+7CfZ0Cm9jx6aBVsHvAaXnRmugE0fMfySQmQUcyKwaoSaLwmt7mG6/Kzft3ZUXoq
         LEpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445637; x=1796050437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R4tDEGiURQM1Arylz9v3qFzT8K+oOXwhYEhcFQrcNqk=;
        b=qPONRVD2tOPc2Xkd0vxvR8Ulp/EPiUQcaZ58/0TAviZbd1AIqzaP58XXVNNn2VD8BW
         eltkw9OBUHZu7BPDZfAwdXntUsHlnfxJv+b5nZpwM3UcBN5Y0cwdCzSXba5Vje+zY0c/
         zvEIjrDShrgLwixIDMAtvv08/0SLzmLCC/WbeQimIQPDJ7nvfmw/joQ9fWZ62mSSZXFM
         p9LcQ3OXmdTAM25LXQMZVMQaoOaCDZ7j/1rE9LBk7J9CMNIl30qC2K6uCULOXq/cTztf
         Bhtn+N4g/PG1GaK//utWRAz9yj24U9IYFf5WvPKkfPqCTMq87fJBL8HY79cl6Y0CRCNp
         yReA==
X-Forwarded-Encrypted: i=1; AL+hErHD+qrXyGWOBzmdPE0sFG7dsAWWS0EmToFQAJL6OMrJSoYg8cycrfgjiut13VkuRFvMhJhWesWISxo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+C4SwdYo6yG3UiI93fVrUeepnxx/eM2c8WGDQp//Rkyrpj5vcp
	c9LFmZkaKk3p87tvEwYFkx9qqp4/qwrSHF+FX2LRX7Y6zGBdgb30aMj3IduQojwwPJ3fa1PPn/z
	dFr2FxWo=
X-Gm-Gg: AZFdTZeMo173uXlzqqj+7TbjicVfLOjdIjKIPdWDql4uCQn+dFXp7Nnz/yTqR81lxIU
	0xtWzuPugPQ2RP2E2HNvcJoXe6kSoVJ9uvrj7/CjC+kYRSOW5y1NInuVOqTo/utTL/HRHMfVc0T
	xqNXuj0o2vsNZjxH1rDFaew9TiJV5gmmoNvRHEnrSe1vUGKlISuCyfWrS6gH/n1SJpImBWhWJcj
	fMykzLDR3oY7//YQAgqqEjr6XdJxhFP7kIRk8LwMHHveJ3gJB9qEjLG4jKJjqWxP/jsfPKHSm9a
	Fs8zbw3niEzZfjzxWnWYVZudSlLXeYb6K4I1xJxKRsPQ2dSjkVlTVt5DQ/KgbBOwk54ru7KL1Ll
	DrPO+Y7ueH7bxGR4eSH4BH9hDzTKYUvzLvNbK/ImzQtgLsIVS141GyvyiJF3ETobF8jwr2K4RdT
	aNtmLpMImV3kr7NpM9NKLVvESMalAmXFDaB52vlsAg5/vGGT8Ts0+c65h6BmftSsBRdc6/ijnWp
	65X8Frr5GNLczOjZvlbUPq2lagFnCwF3aMq6Jl0K6NFkDyp0OvKvJrvpqFEJuYLn/zdEBoBzBr8
	C2OjQAx3kGGZLkKunD2jXDZ8/JlF3s3RUW372lTLyGRuvrJj
X-Received: by 2002:a5d:5d82:0:b0:4ac:7595:6f68 with SMTP id ffacd0b85a97d-4ac75957253mr19069216f8f.36.1795445636715;
        Mon, 23 Nov 2026 06:53:56 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf6804sm22292067f8f.10.2026.11.23.06.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:53:56 -0800 (PST)
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
	Andrea della Porta <andrea.porta@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: [PATCH v3 17/28] ASoC: bcm2835-i2s: Pass the CPU physical address of the FIFO to the DMA engine
Date: Mon, 23 Nov 2026 15:56:55 +0100
Message-ID: <20261123145728.29082-18-andrea.porta@suse.com>
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

The address of the DMA slave is handed to the DMA engine through the
dma_slave_config, where it is meant to be a CPU physical address that
the DMA controller driver translates into its own view of the bus. The
driver instead reads the untranslated address out of its reg property,
which only happens to be what the BCM2835 DMA controller expects because
the DMA engine driver used the address verbatim.

Now that the DMA engine driver translates slave addresses itself, use the
CPU physical address of the register resource, which also gets rid of
the open coded parsing of the DT node.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 sound/soc/bcm/bcm2835-i2s.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/sound/soc/bcm/bcm2835-i2s.c b/sound/soc/bcm/bcm2835-i2s.c
index 208977828254..ad95412cc8b5 100644
--- a/sound/soc/bcm/bcm2835-i2s.c
+++ b/sound/soc/bcm/bcm2835-i2s.c
@@ -30,7 +30,6 @@
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/module.h>
-#include <linux/of_address.h>
 #include <linux/slab.h>
 
 #include <sound/core.h>
@@ -843,8 +842,7 @@ static int bcm2835_i2s_probe(struct platform_device *pdev)
 	struct bcm2835_i2s_dev *dev;
 	int ret;
 	void __iomem *base;
-	const __be32 *addr;
-	dma_addr_t dma_base;
+	struct resource *res;
 
 	dev = devm_kzalloc(&pdev->dev, sizeof(*dev),
 			   GFP_KERNEL);
@@ -859,7 +857,7 @@ static int bcm2835_i2s_probe(struct platform_device *pdev)
 				     "could not get clk\n");
 
 	/* Request ioarea */
-	base = devm_platform_ioremap_resource(pdev, 0);
+	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
@@ -868,19 +866,12 @@ static int bcm2835_i2s_probe(struct platform_device *pdev)
 	if (IS_ERR(dev->i2s_regmap))
 		return PTR_ERR(dev->i2s_regmap);
 
-	/* Set the DMA address - we have to parse DT ourselves */
-	addr = of_get_address(pdev->dev.of_node, 0, NULL, NULL);
-	if (!addr) {
-		dev_err(&pdev->dev, "could not get DMA-register address\n");
-		return -EINVAL;
-	}
-	dma_base = be32_to_cpup(addr);
-
+	/* Set the DMA address, the DMA engine translates it */
 	dev->dma_data[SNDRV_PCM_STREAM_PLAYBACK].addr =
-		dma_base + BCM2835_I2S_FIFO_A_REG;
+		res->start + BCM2835_I2S_FIFO_A_REG;
 
 	dev->dma_data[SNDRV_PCM_STREAM_CAPTURE].addr =
-		dma_base + BCM2835_I2S_FIFO_A_REG;
+		res->start + BCM2835_I2S_FIFO_A_REG;
 
 	/* Set the bus width */
 	dev->dma_data[SNDRV_PCM_STREAM_PLAYBACK].addr_width =
-- 
2.51.0

