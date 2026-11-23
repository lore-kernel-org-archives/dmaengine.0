Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445636;
	b=5qknHHFARYBo4AoEiTVxtkNzAfCtztGq3c2vrcQCB+JanWpRDN0a/XyowIhQEkiN5LCy
	 gXhMO1HZYmGGEeGzHSGk1ytb74Ij4FXEnMCNFbJNWww7kpLt9o8dNw/txAgTJ8/6r+bBw
	 ovJ+EpIBYtwAIhWiGudsF6wVgj6xkMOT/JAfr+yZqkZ3tORLsMRQiXIy2Y1vcx0wbBEBT
	 lFFSVGbN/Y/E+3L6ypJfqt2snPe0qccATQtMdU3bNJcFILqjqnzCT6r+Jo6IKuSVJFnF+
	 nUm9obhgk8OHcsYfFoh6kTDquXPmIgL09jCG3D+lfQrTT4ZdngJDJfP2N6hDbyX0nHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445636;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ioy1KdcErYaMkTRDj2OIu5TCOK8ONgfVlgAZynRl4ik=;
	b=Lrb37GBN8JixFLcrIp5egShlMDHOEx3BEMobO0ajfSQZtPngqsoIRFzicYO8YVVZy9DJ
	 P0Zd8g1xL4nhrbeohRz685ZB31CBAriLfHE8qBC5STTpeM9iKtxzpIc/fzVtoD6UyNhsk
	 U1AZ19pz/ug1Az7y+jjIO4dnbsIRTlmUwSATqo235+NnD3ezGPmptgTag96zJhwvvYo8q
	 Urv68RoUg+AcUC4Gis9r8qn2lpXsRJ1l5hkD8fKgnO5saO2E8YD7XFUhH1SP9gTRh7GzZ
	 oNVlXNaMWI5j9do9UIoAw5qa2/lwFJmxjsag7k1YJFNlaH8y0/Q2HN+EhmjeFzqdItg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=T+rMhbB7;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59E3606A68D
	for <dmaengine@vger.kernel.org>; Mon, 23 Nov 2026 14:53:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B59E3606A68D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=T+rMhbB7
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb6057b333so14935195e9.3
        for <dmaengine@vger.kernel.org>; Mon, 23 Nov 2026 06:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445634; x=1796050434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ioy1KdcErYaMkTRDj2OIu5TCOK8ONgfVlgAZynRl4ik=;
        b=T+rMhbB7TsHz+7OuVgqLdkdUzql6ePQMTv9hAreNtGVPXeYIsnoB5Gr5TyXKfHeS4S
         B3/qqkqSpoAGONXDmdtA0om7D09O1tZHHD8cEMpit+yz/GvoJx6W7IZE1LAlIILxmVx/
         stWmq4Gt+61PUmHxzW14rpwXHa/e8m+FlQaMp8hB2xI/UMvgKwuAEbYeiYWmYJkmWMzh
         eo2WmxOfxvHypKgWNGak02yTr+UF+UTc2gfvEyh5OnYozpOjVpghgmo1YjtoYOcgWEvB
         mp3/Dc9egjp51RSPQH88lz6ILTKJWfYM3rVoZsAeAQoihFOOb+mGNwD3U/kHWDCI/sJv
         OhyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445634; x=1796050434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ioy1KdcErYaMkTRDj2OIu5TCOK8ONgfVlgAZynRl4ik=;
        b=IfLixurs/8DizMnwdiyEX9fmkUok6uf7dzK6PPqBlZ9W0etbQdbAp5wMX0vFQpIpTS
         gQBtrjVbGukcWXXihIQ9DO8RLWdnONcBDBLTHTWTXSXwr8enLCpjkUjUCe5fESdRVVEV
         vZQ6WUqJJQmMsem2ZK+Q42WgZgCor4JDNbs6XUMUnfJiybm/h88I+0jiJWl01Lw02g3W
         Q5QChQJrqE2cvr2PJjCX0919R3Yw+LJtO1NixMh0TbzT9Kkt8N5LWQZO2rDQBHJP6nEb
         ry7RqtcOI3HjJ+CvrJeyFRRdUCrMfO3tD707RQ/k+okOFsuuEMXYAYivAPhubTmXPfZf
         8SjA==
X-Forwarded-Encrypted: i=1; AL+hErGKg+RITP9zvzRz/A886fPib7mEuuXWvL1iW6J+amGysiNF/99dRzeFZNyLYup101kFzX+3kzKbyjg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+94RNUYmx6VA3uE7prwu9+d7vAGL6bgO/ppew1OrrqovZ8G7Vc
	1HJfRHGEAlEyjw1j5SF7ppQGqNP5iTCjE79cBAW7bt0xN604b1QTAgcdPnhJApO7DIY=
X-Gm-Gg: AZFdTZfAghCgXNwY3gP3zX2VMTTVtPNELlVbWoNvKBL6VTRN3LpzSQlsz+CdPDqgi+0
	nDxsopm/GdCFa+F4k8IXmxnWaB6ctE6J/RQSTP8U1C72LySg60vB5mEAp2XQFeNwy0YeuOQgk4O
	faOxB7ljpir06q6xE3hDdr2FlJ8ddtqJfALvomF1y3UfltMIQgxClwZmCRG2R2LAWUR+wSKGiXs
	mtpcEdUp1emrUbbfJU+XCM6WgUxjfgXZ1ygCe0VDObqjomduyvyBmbRowMOjXUZsEm7O3y/6lAl
	crWDeAbCZaFYi3+9Q5IY6RdWg4Tag/Pb9Xz+te4YfqsIRJy4Bhbk6xislnllmZDoUFnlMl4YYci
	kdldNQw2Ewpo4ACHXOuoHfdaLD3AJjyj+UkNrlLMQrTM8dAgVIQuH7ZEpD3T9HUpwRdeEA1hfAf
	RQO6avLhtRLeckzpLnqH/UI2KSvgEKZY8sRI2joYzxlKKtkP67hTDqwzJnmwA1DE6QzYpxYQ16C
	c62N9RXAUHTcNfO/pdW/UQ77L8Q9aCabfwc29tB7YDUHC0fwMKVwbg1UTjObcSw/p0QZXWDXCR4
	A2WOXvqYjIzRAHpIpZSSmInHER0=
X-Received: by 2002:a05:600c:64c7:b0:4bb:872a:f500 with SMTP id 5b1f17b1804b1-4bb887c2697mr259597265e9.3.1795445634103;
        Mon, 23 Nov 2026 06:53:54 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865a2sm357418155e9.3.2026.11.23.06.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:53:53 -0800 (PST)
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
	Mark Brown <broonie@kernel.org>,
	linux-spi@vger.kernel.org
Subject: [PATCH v3 15/28] spi: bcm2835: Pass the CPU physical address of the FIFO to the DMA engine
Date: Mon, 23 Nov 2026 15:56:53 +0100
Message-ID: <20261123145728.29082-16-andrea.porta@suse.com>
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

The addresses in struct dma_slave_config are CPU physical addresses, and
the DMA controller driver is responsible for translating them into its
own view of the bus. The driver instead reads the untranslated address
out of its reg property, which only happens to be what the BCM2835 DMA
controller expects because the DMA engine driver used the address
verbatim.

Now that the DMA engine driver translates slave addresses itself, use the
CPU physical address of the register resource, which also gets rid of
the open coded parsing of the DT node.

Also zero-initialize the slave configuration: the TX channel only sets
the destination address, while the DMA engine driver now maps every
address that is provided.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/spi/spi-bcm2835.c | 27 ++++++++-------------------
 1 file changed, 8 insertions(+), 19 deletions(-)

diff --git a/drivers/spi/spi-bcm2835.c b/drivers/spi/spi-bcm2835.c
index cc5748973281..c40157e4516a 100644
--- a/drivers/spi/spi-bcm2835.c
+++ b/drivers/spi/spi-bcm2835.c
@@ -24,7 +24,6 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_address.h>
 #include <linux/platform_device.h>
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/machine.h> /* FIXME: using GPIO lookup tables */
@@ -888,23 +887,12 @@ static void bcm2835_dma_release(struct spi_controller *ctlr,
 }
 
 static int bcm2835_dma_init(struct spi_controller *ctlr, struct device *dev,
-			    struct bcm2835_spi *bs)
+			    struct bcm2835_spi *bs, phys_addr_t phys_base)
 {
-	struct dma_slave_config slave_config;
+	struct dma_slave_config slave_config = {};
 	struct device *tx_dma_dev;
-	const __be32 *addr;
-	dma_addr_t dma_reg_base;
 	int ret;
 
-	/* base address in dma-space */
-	addr = of_get_address(ctlr->dev.of_node, 0, NULL, NULL);
-	if (!addr) {
-		dev_err(dev, "could not get DMA-register address - not using dma mode\n");
-		/* Fall back to interrupt mode */
-		return 0;
-	}
-	dma_reg_base = be32_to_cpup(addr);
-
 	/* get tx/rx dma */
 	ctlr->dma_tx = dma_request_chan(dev, "tx");
 	if (IS_ERR(ctlr->dma_tx)) {
@@ -926,7 +914,7 @@ static int bcm2835_dma_init(struct spi_controller *ctlr, struct device *dev,
 	 * or, in case of an RX-only transfer, cyclically copies from the zero
 	 * page to the FIFO using a preallocated, reusable descriptor.
 	 */
-	slave_config.dst_addr = (u32)(dma_reg_base + BCM2835_SPI_FIFO);
+	slave_config.dst_addr = phys_base + BCM2835_SPI_FIFO;
 	slave_config.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
 
 	ret = dmaengine_slave_config(ctlr->dma_tx, &slave_config);
@@ -967,9 +955,9 @@ static int bcm2835_dma_init(struct spi_controller *ctlr, struct device *dev,
 	 * RX FIFO or, in case of a TX-only transfer, cyclically writes a
 	 * precalculated value to the CS register to clear the RX FIFO.
 	 */
-	slave_config.src_addr = (u32)(dma_reg_base + BCM2835_SPI_FIFO);
+	slave_config.src_addr = phys_base + BCM2835_SPI_FIFO;
 	slave_config.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
-	slave_config.dst_addr = (u32)(dma_reg_base + BCM2835_SPI_CS);
+	slave_config.dst_addr = phys_base + BCM2835_SPI_CS;
 	slave_config.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
 
 	ret = dmaengine_slave_config(ctlr->dma_rx, &slave_config);
@@ -1355,6 +1343,7 @@ static int bcm2835_spi_probe(struct platform_device *pdev)
 {
 	struct spi_controller *ctlr;
 	struct bcm2835_spi *bs;
+	struct resource *res;
 	int err;
 
 	ctlr = devm_spi_alloc_host(&pdev->dev, sizeof(*bs));
@@ -1377,7 +1366,7 @@ static int bcm2835_spi_probe(struct platform_device *pdev)
 	bs = spi_controller_get_devdata(ctlr);
 	bs->ctlr = ctlr;
 
-	bs->regs = devm_platform_ioremap_resource(pdev, 0);
+	bs->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(bs->regs))
 		return PTR_ERR(bs->regs);
 
@@ -1394,7 +1383,7 @@ static int bcm2835_spi_probe(struct platform_device *pdev)
 
 	bs->clk_hz = clk_get_rate(bs->clk);
 
-	err = bcm2835_dma_init(ctlr, &pdev->dev, bs);
+	err = bcm2835_dma_init(ctlr, &pdev->dev, bs, res->start);
 	if (err)
 		return err;
 
-- 
2.51.0

