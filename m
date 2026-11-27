Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781947;
	b=QRGfVUcX2Lhfb/ZzA6QtK8vyt0XoocpOO+LBr4Bvy+XnvOe0sWTnmKjl/wj4vKxb9OIz
	 xVs0EFdB0EnSB8x59MNs+Y29IyRfkCbRhAaYd0MwneRWZmT0mThhmCTS2KWr7PhqQR5MF
	 LAC3DaFokJzDa68jEUFocm85jusunzOZxtw0UZtxs56UzbvXkMN5GuXzHETql/PK/XeOI
	 EuGI6HcyLeXyOiWo8MuDTXfBE22dCUj8Ok/eMOQ4unLHQh9dJsTnU/3R9iFlui5QUePD8
	 x/N+afz+aiF5UG6QdGAKWFz72u3fmuApzxoTa81wiN9WJgZopyMSZutE5AZrIFoHMxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781947;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=R4tDEGiURQM1Arylz9v3qFzT8K+oOXwhYEhcFQrcNqk=;
	b=zZXgXy/2sAFrPfOhqf1HeXCr6kkUL2Q5PD+wJxUrz1+mhUYkDr75T6zyEhlcA12K6VsL
	 5mhlzoJWDPRDOFr5iF2+AM4q/e3CsaDO0i1wdo8xOoRWtGT+lbH3upPLNprtk1dYw8BNb
	 AOTta4MFhNQM6gyS8E0MS/d1jHQ74TnROw3TKJ8nxJHp/ueHNsU5yQ+J+DNk5o6XPk8SW
	 mAweabOfG3NGDKgZwCTc3TiC8+/k3cfRvvtXr2onDj7exlwnAHQ2mhtIHjDd2qcimXMAr
	 IOhENxOvuElnKZ24EhD5JeqrJBxHfA1f43z3N+GTz/a0ttzJxDxwv0f1SbH4qbl1Ofg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=cK7VwD4l;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF5660A5BE3
	for <dmaengine@vger.kernel.org>; Fri, 27 Nov 2026 12:19:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EF5660A5BE3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=cK7VwD4l
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e09aa5264so4703849f8f.2
        for <dmaengine@vger.kernel.org>; Fri, 27 Nov 2026 04:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781946; x=1796386746; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R4tDEGiURQM1Arylz9v3qFzT8K+oOXwhYEhcFQrcNqk=;
        b=cK7VwD4lhiEURNmrx0uRZYLZwsRUZX9XwpeDLu685DQ/eBv0y4nmUjDgVBok9vrqJ2
         MRZlocRElF4uFOlhpGZfJJxce2M5zbNRfdcwhh7wZDUq553Swtkac8kwNq30pCLl9ecT
         8JGfgoPQZIWpohDlOHOT0Ph7vonifkWou1dg0DiBOO/rohzEnjuy7ynFTXsTELHq2ezB
         J6aG05JPBIVhfXAfcwnBDaT0luBHM5Q0MsN4qZXR3rsnaRq0ycmZqy3mpcd9QuGyH/vC
         AHcgkQ5LHT1bQadT69LdoRYEYXonfOJHMLzfwwjB+UgW4INoXSxIx4IGucob/t6iJibi
         yO8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781946; x=1796386746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R4tDEGiURQM1Arylz9v3qFzT8K+oOXwhYEhcFQrcNqk=;
        b=YurKny3tfAA81+BqMw9y99o2hj/+Q/0ah7CZRYeyY/LgIQVwPN4HOFGjvXcM523Foe
         16FlQH803a9pyqy49kqla8xC9DL9COHCs9Aoss//52wiu6mQlt4Cko2PxQDcmxd2iouT
         Cf9cGs20i017fMC7hOCxCTGd0XmkunKxzzLWeC/9gGhG5abXThmQHjETWITKkLUy2pTM
         35vx8blnGx0FXnj/EqbU2vBuBg/WqJ0a3plz1NVk8r8y1AbH1CbceL33/9h3/Idkf288
         YQsJRuyOVoJ5n8heVmAf8EJchewkRgG61CQnb5h7K1JGqYbJoVJs337NGChsNx9gdxJi
         imYw==
X-Forwarded-Encrypted: i=1; AL+hErHbf7iaAsyMQXBdRofDdu6Drke28sKtvAi6J6AdbwNhrZiOCirn7t0YGeb7CzEGb2yc9hXe3zx4bwg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+i1Ztfdl5SqbXtmLyP3Yay2mkrFD14V1RNQI396X6jvgWwr4lL
	tDzkGQxuARL/dI8hB8K+NAMTEcIwFzsvYklxHmgxLLzkKiDjQNsdXNKSZYL7y9NFFu4=
X-Gm-Gg: AZFdTZe+IcfR7Uyy6OSalOSnE6j8j2OtrvCX7RBpdsUu83Mhy2q2cd5zNwpDzJhzuJR
	HcKMwPmDVYXINv2OwcV1x/auT1FFKU1zhPASctfSvdNdzJaaTL8KkVApBEjR7aAYLL60xucgwJT
	tEyPuFNHK4BVTvMYyuNXhczsAptu4vcCunJfxXYHJ+QckKdSCJu6hGEZIUVbqAG6/vSOmScsNTt
	qx/EvlLjjYYhIMrJCIzSNWLkIPApk/VIBI7RECxDzD62j0CiUjVUH/Yd0/KZz8o+IOzo/k8HrDy
	HV5VD7C0UBMJnqpxd834p48JNkNc1bA7MpBgcPxoR8i35TImpYjuwbkc5+yG+69+9Vv6fv1yLgv
	wq55TQMWVrFFuUgKUfYfnAGu22UHwERgpOM4JwBzzfVZAjMbdMRwzgjFyvr9T+4e2Zxd+/kbdAH
	KtC/PmLpiHTIOG2whSZl2NkrnraXWrdoa8yVjO+UOTJPIjFAOi1x0I+ctoRZSx9JBz2tnY0nyAN
	DJa9cyIrrt+1jrwfuSOmtSls8CUzT3jKQdETcqQDXD1NAO5cpApAkGg7SUYXKZFRUbkYVt+woBO
	UwatICRgdspT9ew6iJLzdDQqzVUm
X-Received: by 2002:a05:6000:2685:b0:4bc:9b4e:62c7 with SMTP id ffacd0b85a97d-4bc9b4e64ccmr8999178f8f.45.1795781945689;
        Fri, 27 Nov 2026 04:19:05 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4bef07f9e0dsm3454109f8f.53.2026.11.27.04.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:19:05 -0800 (PST)
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
Subject: [PATCH v4 17/28] ASoC: bcm2835-i2s: Pass the CPU physical address of the FIFO to the DMA engine
Date: Fri, 27 Nov 2026 13:22:07 +0100
Message-ID: <20261127122236.4976-18-andrea.porta@suse.com>
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

