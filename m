Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445642;
	b=mGy0Hpee9gLo/f4HHa6ViOCce96KMabn0vQiOGBOpAgwYZYFweTqaMw8WQZlgnMHcU+Y
	 Qx8JCRm6cQL0EWDjxbM15+YwwpuVgGhzd8w9iz1siM3S317pHJr1us7+IzTMtoSAjLofY
	 H9prO7E9uXXKjiW/J6TLmRUcGQgvCLHYxdhh1r0YBUkrfOqEyZ6vJel13tzFutTKxjXqL
	 WYn6+AXS1c2XOlXpTcBroS+LXmeLtldwPfvrFWJ0bxj0cTAFqj46iDc5LIcvyFiwfAI6O
	 LBJ6XOSGXClwvuundBipoZFu1W45z/opqKOoPYnNP/1fO2caZ0WH6GaYgWLAWZ5ddLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445642;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vzOUbtSU35dr5ut/+N3XiJYlcrwl+j1wK6kXAv2zHH4=;
	b=gZNtZIW1CPzm54sYz+DGLgFTHU/NTLs4e0w+VHrI+MUXLJx7x9t2myZS23pdpKANIxn2
	 TiMaLFpWopg6zmXsSBwoSGx/gGv/OC/YtsvsUBNpfCHElQGIoLkToSPmJeX7rw/D/z/gp
	 Vq0pB+A1VvJszSMMerNgT5xTv1pbGJaH+gkAvLPwq7ETGin5DY4TxrjrYtqZBY93MsV28
	 w6XmRY031aBxM/hAvAvUtNAxlNaFYAC3apX9yFksm5N0iZiMIe+uBrDcdoGKg6wUHRhdE
	 SBvwbBkG03FjmjZKwibS4KiiBXSjkRvzZJPmRRBy8JlB2XYB7SC1cqPMM4QqUmM82hQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ZO2UGZ9X;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2729E606C18D
	for <dmaengine@vger.kernel.org>; Mon, 23 Nov 2026 14:54:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2729E606C18D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ZO2UGZ9X
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so42642275e9.1
        for <dmaengine@vger.kernel.org>; Mon, 23 Nov 2026 06:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445641; x=1796050441; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vzOUbtSU35dr5ut/+N3XiJYlcrwl+j1wK6kXAv2zHH4=;
        b=ZO2UGZ9Xa2vsQ2ekKIPCwaBcIF+RHT6bMOxzQ5EialDdv0au1ncbyg+vPUxl/GdFAN
         AzFg623IGohvqdHgy+wW5LQyBQ5oV41uFakYQtjCgIKasf3XLZDSrSxVn8a3l67r+IDz
         +UY/5K/TO2+n2XJwtVwUOsf/gX903+aMw3CPUCsl1CvpTFDflwby+0fTe3DZnpB2JMYl
         ZXCeAeCpvqoJs2KV9l0IiTRrGpLpx28fL0js+hklj3QZhOT5FTQ/ZVPuIrawurxlTahy
         E0yv+MbBo8LF9OGmHwlk3GduAdFXQZJghd1VfGW1B8R+raMrIV0NJlyM+7AxCA40P1lM
         2Rig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445641; x=1796050441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vzOUbtSU35dr5ut/+N3XiJYlcrwl+j1wK6kXAv2zHH4=;
        b=Ve0FfPWMjdpG5q41Ou79/od4SLRRS9qEhjwwCJL1+G0rk6x7L/M2+DWe7HdIg7uXsy
         us0X/9+YTz28R89KY3IgLBIl0cDy1CMxzdTdqHlFjFnAA9YULZI9tBR4VIhc/+PNVo1d
         gHn0H6FVRDokCLNC6t/GcLmTxg5NYEMoIsdsw6QIHPMxsJKwufGSdrbUBXt57690/Xo5
         D8FsyntT9MRuYWzTkbda9DUtC69bHamHpcKIqW4JICzh9TOddGmRYPjls5zw4/RXCPgq
         rcekn0fswTC/cgmWB7FBj1mbVJAJqJjLPP2fI8M1qw4AxREd8w0d2JmMpL4gtEQ0BtbK
         BtZw==
X-Forwarded-Encrypted: i=1; AL+hErGDRprJBC3Zcqi66DyoBjFBwcxowDeYE2ehe7ybrqT+WKNhSCx3V4GHfTrgMeZ3EiUTWDoPuHQVupA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8bOT9yeXbNO8O4Z6ovbQj0sMCHBjSFwdYQzupyuu6w7mgQgLAj
	lUuJCKFK2lMYMd8cjBZdb1fBsJn3xRNX8im9zbv23cC0O+kl/ve2vXQ86aMCpkJsRRk=
X-Gm-Gg: AZFdTZdwm3KrEYYyDeVc2brfuPKd5/iQoVqHe1b2zzzHELdRyWaMUSCQawKnSwGA2n+
	W3fDP1JxycdweicIhFhMvwAntanTILHKHlUds8SIufDaBmZUkrIgSFqI375NEjFGMG6Wex+yBz0
	OAhMyuyUJf+DIBoO3cjGYWXTI7k1mV+qPYToGzYKfLnyaj6X8X0+ecHdfeZpMWh571CsFUs/GC+
	b4JDIeBMQS8DBF+GhdNOtV4/JKLNqFkzVHoVoAO2IqGCRxd/qerKzx1Vh7vqk4tFT5HqRxihX4L
	DDif4JU7/xsM/5AMk2p0Rezu9FpY/+hbsF0OS4WpAdkUTHH2vaF6e+QQAwU5CCOgZe2LAXtFIQf
	mS+A0SlAePsFNxiu5047atQrlnQkwPCkS0PJfsN7WtH+k+yM+6TEshEYrCRTehb/M8mMYx8uRK4
	1e/eHYUfmCI0+BoDfowX5RMCZQNcG6bOQUnec1Tz5CD8b0ymz7sZLFJ+KgJ6ECSvSHNuArG/e8A
	Wo5cNu1qtElpPsoPsxSz+O3VTabhMkdUlEHMEcmBgHdCmnziGODf204cg7hVh9nWO6LiZMi7hm5
	Ddi6TCKp5d2gZd1FfJRCwy/AkqQ=
X-Received: by 2002:a05:600c:8210:b0:4a2:1a:a116 with SMTP id 5b1f17b1804b1-4bb887865b5mr238459695e9.0.1795445640550;
        Mon, 23 Nov 2026 06:54:00 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a3a3dsm340094145e9.10.2026.11.23.06.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:54:00 -0800 (PST)
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
Subject: [PATCH v3 20/28] dmaengine: bcm2835: Support channel subsets in a controller instance
Date: Mon, 23 Nov 2026 15:56:58 +0100
Message-ID: <20261123145728.29082-21-andrea.porta@suse.com>
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

On BCM2711 the last four channels of the DMA block use a different, 40-bit
programming model, and are going to be described by a separate DT node
whose reg property only covers those channels. The driver however
assumes that the register range always starts with channel 0.

Derive the index of the first channel from the physical address of the
register range, which is possible since the DMA block is 4 KiB aligned,
and only consider the channels covered by it. Channel numbers, and thus
the dma-channel-mask and interrupt-names properties, keep referring to
the whole DMA block.

Also describe in the platform data which channels of the block use its
programming model, and ignore the other ones: some device trees, e.g. the
downstream BCM2712 one, describe channels with different programming
models using the same compatible, and driving them with the wrong one
could corrupt memory.

While at it, initialize all the entries of the IRQ array, as the
detection of shared interrupts looks at all of them, and report the
number of channels actually initialized.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/dma/bcm2835-dma.c | 58 +++++++++++++++++++++++++++++++++------
 1 file changed, 49 insertions(+), 9 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index 3ff30c41dc63..0ea903274286 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -42,6 +42,7 @@
  * struct bcm2835_dmadev - BCM2835 DMA controller
  * @ddev: DMA device
  * @base: base address of register map
+ * @chan_start: index of the first channel in the register map
  * @zero_page: bus address of zero page (to detect transactions copying from
  *	zero page and avoid accessing memory if so)
  * @cfg: platform specific description of the DMA channels
@@ -51,6 +52,7 @@
 struct bcm2835_dmadev {
 	struct dma_device ddev;
 	void __iomem *base;
+	unsigned int chan_start;
 	dma_addr_t zero_page;
 	const struct bcm2835_dma_cfg *cfg;
 	bool map_resource;
@@ -127,6 +129,7 @@ struct bcm2835_chan {
  * @abort: stop and reset a channel
  * @legacy_bus_addr: translate a slave address for device trees which do not
  *	describe the peripheral window in dma-ranges
+ * @chan_mask: channels of the DMA block using this programming model
  */
 struct bcm2835_dma_cfg {
 	u32 cs_reg;
@@ -161,6 +164,7 @@ struct bcm2835_dma_cfg {
 	void (*abort)(struct bcm2835_chan *c);
 
 	u64 (*legacy_bus_addr)(struct device *dev, phys_addr_t phys);
+	u32 chan_mask;
 };
 
 struct bcm2835_desc {
@@ -271,7 +275,8 @@ struct bcm2835_desc {
 #define BCM2835_DMA_DATA_TYPE_S128	16
 
 /* Valid only for channels 0 - 14, 15 has its own base address */
-#define BCM2835_DMA_CHAN(n)	((n) << 8) /* Base address */
+#define BCM2835_DMA_CHAN_SIZE	0x100
+#define BCM2835_DMA_CHAN(n)	((n) * BCM2835_DMA_CHAN_SIZE) /* Base address */
 #define BCM2835_DMA_CHANIO(base, n) ((base) + BCM2835_DMA_CHAN(n))
 
 /* the max dma length for different channels */
@@ -1189,7 +1194,7 @@ static int bcm2835_dma_chan_init(struct bcm2835_dmadev *d, int chan_id,
 	c->vc.desc_free = bcm2835_dma_desc_free;
 	vchan_init(&c->vc, &d->ddev);
 
-	c->chan_base = BCM2835_DMA_CHANIO(d->base, chan_id);
+	c->chan_base = BCM2835_DMA_CHANIO(d->base, chan_id - d->chan_start);
 	c->ch = chan_id;
 	c->irq_number = irq;
 	c->irq_flags = irq_flags;
@@ -1237,6 +1242,7 @@ static const struct bcm2835_dma_cfg bcm2835_data = {
 	.abort = bcm2835_dma_abort_chan,
 
 	.legacy_bus_addr = bcm2835_dma_legacy_bus_addr,
+	.chan_mask = GENMASK(BCM2835_DMA_MAX_DMA_CHAN_SUPPORTED, 0),
 };
 
 static const struct of_device_id bcm2835_dma_of_match[] = {
@@ -1335,6 +1341,7 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
 	int irq_flags;
 	u32 chans_available;
 	char chan_name[BCM2835_DMA_CHAN_NAME_SIZE];
+	int chan_count, chan_start, chan_end;
 
 	if (!pdev->dev.dma_mask)
 		pdev->dev.dma_mask = &pdev->dev.coherent_dma_mask;
@@ -1360,7 +1367,19 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
+	/*
+	 * The channels of a DMA block can be split across multiple instances,
+	 * e.g. because they have a different programming model. The block
+	 * itself is 4 KiB aligned, so the position of the first channel of
+	 * this instance can be derived from the physical register address.
+	 */
+	chan_start = (res->start / BCM2835_DMA_CHAN_SIZE) & 0xf;
+	chan_count = resource_size(res) / BCM2835_DMA_CHAN_SIZE;
+	chan_end = min(chan_start + chan_count,
+		       BCM2835_DMA_MAX_DMA_CHAN_SUPPORTED + 1);
+
 	od->base = base;
+	od->chan_start = chan_start;
 
 	od->map_resource = bcm2835_dma_mmio_in_dma_ranges(&pdev->dev,
 							  res->start);
@@ -1417,13 +1436,30 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
 		dev_warn(&pdev->dev, "Please update DT blob\n");
 	}
 
+	/*
+	 * Never drive channels with a different programming model, which
+	 * some device trees put in the same node.
+	 */
+	if (chans_available & ~od->cfg->chan_mask) {
+		dev_warn(&pdev->dev, "ignoring unsupported channels %#x\n",
+			 chans_available & ~od->cfg->chan_mask);
+		chans_available &= od->cfg->chan_mask;
+		if (!chans_available) {
+			rc = -ENODEV;
+			goto err_no_dma;
+		}
+	}
+
+	for (i = 0; i <= BCM2835_DMA_MAX_DMA_CHAN_SUPPORTED; i++)
+		irq[i] = -1;
+
 	/* get irqs for each channel that we support */
-	for (i = 0; i <= BCM2835_DMA_MAX_DMA_CHAN_SUPPORTED; i++) {
+	for (i = chan_start; i < chan_end; i++) {
+		int index = i - chan_start;
+
 		/* skip masked out channels */
-		if (!(chans_available & (1 << i))) {
-			irq[i] = -1;
+		if (!(chans_available & (1 << i)))
 			continue;
-		}
 
 		/* get the named irq */
 		snprintf(chan_name, sizeof(chan_name), "dma%i", i);
@@ -1438,11 +1474,13 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
 		 * in case of channel >= 11
 		 * use the 11th interrupt and that is shared
 		 */
-		irq[i] = platform_get_irq(pdev, i < 11 ? i : 11);
+		irq[i] = platform_get_irq(pdev, index < 11 ? index : 11);
 	}
 
+	chan_count = 0;
+
 	/* get irqs for each channel */
-	for (i = 0; i <= BCM2835_DMA_MAX_DMA_CHAN_SUPPORTED; i++) {
+	for (i = chan_start; i < chan_end; i++) {
 		/* skip channels without irq */
 		if (irq[i] < 0)
 			continue;
@@ -1459,9 +1497,11 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
 		rc = bcm2835_dma_chan_init(od, i, irq[i], irq_flags);
 		if (rc)
 			goto err_no_dma;
+
+		chan_count++;
 	}
 
-	dev_dbg(&pdev->dev, "Initialized %i DMA channels\n", i);
+	dev_dbg(&pdev->dev, "Initialized %i DMA channels\n", chan_count);
 
 	/* Device-tree DMA controller registration */
 	rc = of_dma_controller_register(pdev->dev.of_node,
-- 
2.51.0

