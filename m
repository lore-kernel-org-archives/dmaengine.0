Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793610447;
	b=I8vNnQO1P1zCfH7ZqEbF56Mlkm8nJGkLHQzbIrY3RAuHzwCeG7pV0hk60rKuZhO+zBhR
	 SRibQC5+TgF5biqTqazw9PSCdlPDL/E3yYsmKth8MOnh1ZKaDXtq6tegYN9y62woovUFX
	 qJmCHpStc0jQaHg6Zt+btBsRN3dMEss2zGomOFD2BNrKF/Gf9STaSKtK7oVWXe+H1qBOh
	 Y/fF10U2rI5h9my9c+wnNrlFDCnpot5U7Jt+G/UcOBO1O260PRoSqD8KzEYt0ErBhnAz7
	 o5uhpzIxxhzsc3aTJBiIH3LwGqk7pdOofzYPfvaSe0NpOD42SNYpeJuvfa0iXXKWwgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793610447;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1yQ/0rpQtSurqJ4HUZaAl4IafV/ZYawzEihcKyUkvxo=;
	b=SesnPJ3hl3JgPmOth3Nr+LFY0dC28wJKdKCFO0EttjCkgWDTHF7SK/QxqB+dRyQDAqYb
	 EDcg3V4iTT6uekPdhW9XUdXVc6T5JHX9Fn3Pl1Gm1rUmsBEJ20hOLmy2FcTweQh8tza7s
	 j09emgVQIDJjAsT7Vvx2KaNXY29VpuW+M8OL+Z3smDbTb0p96+7XZPAE9zmq5s6U6yv9n
	 DFMOjCttF33xOaACJ+1o4GwIfPEh0SzmrSJj6yYt8YOqPE6EbZ12eWeeb2kIz8nSQwAov
	 O22O2UH3jBRkSaURhoyhvIXVd+/g1XaS9Te/3HbypjtIbBNKsoQMZxxDk4D0LMkg4Ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OpAjkPq8;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17D7606A324
	for <dmaengine@vger.kernel.org>; Mon,  2 Nov 2026 09:07:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D17D7606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OpAjkPq8
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a5720b0a57so19541285e9.0
        for <dmaengine@vger.kernel.org>; Mon, 02 Nov 2026 01:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793610445; x=1794215245; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1yQ/0rpQtSurqJ4HUZaAl4IafV/ZYawzEihcKyUkvxo=;
        b=OpAjkPq8iyJrW8vtJAuO7A/HcV+EGH8FjtsXU3xOec7LJjcMoza14buGfqHj3MPmSO
         ocsI6SKk8Aw8g2jNF+oJnx5eLOkw4qJVVArMXSj5vZbjBHN1HgL+vfqU72j23cfguSS1
         +0rRhc0mwWFsLU7lBw3i5S+TNfJUp/Hv0DQM+PYIBDkWjLm81ueifW/EPNQ9EJEIMWkk
         uegGQaTAp4Q606+oItrGmol+GnRfb2CgjCDMtSUD+N3JcjSyqbFPL3IGzWUmRfeGTcvb
         OxytMio8bkdz38t1w930WHrtvDDOr+MsGiCjjaSX3oqlkqu70Mj+CgeJekl64lccr4rs
         nTjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793610445; x=1794215245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1yQ/0rpQtSurqJ4HUZaAl4IafV/ZYawzEihcKyUkvxo=;
        b=W4PmVA2Ll7r74TSjLP0uDc9aV3uFnjuofwALmAQEUDnW7dLAEfQIyJnCMhtsETHCh3
         U0umBvk36iaINJdhI1S+S7A347n94uruOzFkQacFertfB6G2g1f5vHMohp4A3VV2q8A3
         JMOa3W4X5WCrI7HEUqGx383sMZ5xqYK7nwulZ+EcuiD7x/FG9XIhLKk10euBQYqfAOKH
         59tJHl5ux3s5v97359edVTQOq9caEVjG2dvEf3rwjo2TcvQ7/dlaOCWnN5G73pDQXCT1
         Y2Lscqn9roRMruv8BVP3lpElcFlphW1kIs8jeE6bDhHtp6Ok+xYiMQACWXN4NYzupvwS
         AO+g==
X-Forwarded-Encrypted: i=1; AKwUvBwXS1v3efktgvLspfPpLcwn9JTXwgfEIy7jjzb5uI4/lZki6mmu4rzyK0xsIwS1Co1YFR3RTIsvWGQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJFGdY9eVQ3QGtf9NmCCjH8pdzrdzXiLQjjChTP5TXybT7Picwz
	FMHXN85me0MaCIHjzsOGFx717kbPz6IleHtj7QMgvAY2JDfqyqi5V0f1
X-Gm-Gg: AYBFou02xMbS2Rg/MlfzeDsRlgzfYs+ZLCLKVfY+UcPn0Tv4fGbUQyZwfMtgI3b3FIc
	B8olE/JH5KQle5jcsfAY18uXY6RUr+rJsZ15UApfBThLKqUx0pD2U6zHvZifFRXYPIiu7bOCSAE
	tzyZpA037E8zKTs3DBRXE/yErAOXOo17E2eQ/icW1EgZo8Q+XmOh9NmVI3fHIYPl05RbYTGNGlN
	5KqINc740v6DLFNSv6WS4akMVpenYw5tXIP1r/CWFugbi8oljamIcCBx0Az6xtEhzv25DV4OhHZ
	r/oVt4j2j0Ln0yjaaV5rbFcn7HanOZnLf19GKyV/ESxuKzTCjFSdfSfxKjNnoVlxsVW7XgpCgnJ
	gZq8mldhxL+hf/oaFB/US38U9VKgH7+Fnft8oAWuVdN8gDFm3IvWfOw9QBLNW/lEG46sN82TU0B
	ABRb7iwWZHagyKAmMVelcM9kFAsxDE3Rz8xmDfqaZ7mduyxHeEiKsZ3Bsrs5JF0AdK1QV4YR/7K
	hbMikfhZqtTdOETy6lB2oDtxsgQQzq3pWHJlInOjbjYGXU7Tl31q41zGzFWF7ShUuWOA7aB/dSB
	YXQTakf/P+qs0PbAxWX/GjvlOATRC22hn3dx2xrQgEF4J1hgYFni9n2WpsdTBdBVlPTgggsbad9
	T8AhqDNku40fzufCUnLrW0q+FM+Idlrvb1vFirxTGhnVnGInVGAu8LAd1H8hdzKkWQhfR7XjYUg
	9Irfa6YC+/udF0
X-Received: by 2002:a05:600c:c87:b0:4a1:efbe:529c with SMTP id 5b1f17b1804b1-4ac17567fe1mr224765855e9.12.1793610445186;
        Mon, 02 Nov 2026 01:07:25 -0800 (PST)
Received: from cypher.home.roving-it.com ([2001:8b0:fb11:0:3889:86e0:d449:e2e1])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm417879945e9.3.2026.11.02.01.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:07:24 -0800 (PST)
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
Subject: [PATCH 3/9] dmaengine: bcm2835: Support controllers split across several nodes
Date: Mon,  2 Nov 2026 09:06:53 +0000
Message-ID: <20261102090713.896324-4-pbrobinson@gmail.com>
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

Derive the index of the first channel from the register resource and
only probe the channels it covers, so a controller can be described by
several nodes. Initialise all IRQ slots, as the shared IRQ check scans
the whole array.

Existing device trees start at channel 0 and are unaffected.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 drivers/dma/bcm2835-dma.c | 34 +++++++++++++++++++++++-----------
 1 file changed, 23 insertions(+), 11 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index 96a39eb24559f..83ad8815759e8 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -52,12 +52,14 @@ struct bcm2835_dma_cfg {
  * @zero_page: bus address of zero page (to detect transactions copying from
  *	zero page and avoid accessing memory if so)
  * @cfg: SoC specific controller properties
+ * @first_chan: hardware index of the first channel covered by @base
  */
 struct bcm2835_dmadev {
 	struct dma_device ddev;
 	void __iomem *base;
 	dma_addr_t zero_page;
 	const struct bcm2835_dma_cfg *cfg;
+	unsigned int first_chan;
 };
 
 struct bcm2835_dma_cb {
@@ -175,8 +177,8 @@ struct bcm2835_desc {
 #define BCM2835_DMA_DATA_TYPE_S128	16
 
 /* Valid only for channels 0 - 14, 15 has its own base address */
-#define BCM2835_DMA_CHAN(n)	((n) << 8) /* Base address */
-#define BCM2835_DMA_CHANIO(base, n) ((base) + BCM2835_DMA_CHAN(n))
+#define BCM2835_DMA_CHAN_SIZE	0x100
+#define BCM2835_DMA_CHAN(n)	((n) * BCM2835_DMA_CHAN_SIZE) /* Base address */
 
 /* the max dma length for different channels */
 #define MAX_DMA_LEN SZ_1G
@@ -886,7 +888,7 @@ static int bcm2835_dma_chan_init(struct bcm2835_dmadev *d, int chan_id,
 	c->vc.desc_free = bcm2835_dma_desc_free;
 	vchan_init(&c->vc, &d->ddev);
 
-	c->chan_base = BCM2835_DMA_CHANIO(d->base, chan_id);
+	c->chan_base = d->base + BCM2835_DMA_CHAN(chan_id - d->first_chan);
 	c->ch = chan_id;
 	c->irq_number = irq;
 	c->irq_flags = irq_flags;
@@ -960,6 +962,7 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
 {
 	const struct bcm2835_dma_cfg *cfg;
 	struct bcm2835_dmadev *od;
+	struct resource *res;
 	void __iomem *base;
 	int rc;
 	int i, j;
@@ -967,6 +970,7 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
 	int irq_flags;
 	uint32_t chans_available;
 	char chan_name[BCM2835_DMA_CHAN_NAME_SIZE];
+	unsigned int chan_start, chan_end;
 
 	cfg = of_device_get_match_data(&pdev->dev);
 	if (!cfg)
@@ -987,12 +991,18 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
 
 	dma_set_max_seg_size(&pdev->dev, 0x3FFFFFFF);
 
-	base = devm_platform_ioremap_resource(pdev, 0);
+	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
+	chan_start = (res->start / BCM2835_DMA_CHAN_SIZE) & 0xf;
+	chan_end = min_t(unsigned int,
+			 chan_start + resource_size(res) / BCM2835_DMA_CHAN_SIZE,
+			 BCM2835_DMA_MAX_DMA_CHAN_SUPPORTED + 1);
+
 	od->base = base;
 	od->cfg = cfg;
+	od->first_chan = chan_start;
 
 	dma_cap_set(DMA_SLAVE, od->ddev.cap_mask);
 	dma_cap_set(DMA_PRIVATE, od->ddev.cap_mask);
@@ -1037,12 +1047,13 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
 	}
 
 	/* get irqs for each channel that we support */
-	for (i = 0; i <= BCM2835_DMA_MAX_DMA_CHAN_SUPPORTED; i++) {
+	for (i = 0; i <= BCM2835_DMA_MAX_DMA_CHAN_SUPPORTED; i++)
+		irq[i] = -1;
+
+	for (i = chan_start; i < chan_end; i++) {
 		/* skip masked out channels */
-		if (!(chans_available & (1 << i))) {
-			irq[i] = -1;
+		if (!(chans_available & (1 << i)))
 			continue;
-		}
 
 		/* get the named irq */
 		snprintf(chan_name, sizeof(chan_name), "dma%i", i);
@@ -1057,11 +1068,11 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
 		 * in case of channel >= 11
 		 * use the 11th interrupt and that is shared
 		 */
-		irq[i] = platform_get_irq(pdev, i < 11 ? i : 11);
+		irq[i] = platform_get_irq(pdev, min(i - chan_start, 11U));
 	}
 
 	/* get irqs for each channel */
-	for (i = 0; i <= BCM2835_DMA_MAX_DMA_CHAN_SUPPORTED; i++) {
+	for (i = chan_start; i < chan_end; i++) {
 		/* skip channels without irq */
 		if (irq[i] < 0)
 			continue;
@@ -1080,7 +1091,8 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
 			goto err_no_dma;
 	}
 
-	dev_dbg(&pdev->dev, "Initialized %i DMA channels\n", i);
+	dev_dbg(&pdev->dev, "Initialized DMA channels %u-%u\n", chan_start,
+		chan_end - 1);
 
 	/* Device-tree DMA controller registration */
 	rc = of_dma_controller_register(pdev->dev.of_node,
-- 
2.56.0

