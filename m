Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445635;
	b=ruHjsHc9O40zKKS38Qi0dt8CZFWM4x8sPhb3ZOb/5oDNQLrZo6I6IKLz2qvPmwFEei6W
	 9+gcHgoOhund6ZlNC0kTPCzYYQ6DwAKnDMLZKlSLzeMLH8FUjutw72ppNPMwV495ZHN8W
	 UgRO6JxgKJ67zn7Qf6VOEsqA7DweI4Fwcjq1sTt3Y3Mo7jcD5xDC9vxZRDDKxeNe+iESt
	 VyidJLLH0MRLgxZ+yoIybEbDQ/Wqg5BdFfocv2qRdy8aNNggmhm+rguYgvpjeyuReTSaW
	 sOp6+jx79/sEXRW/q7dqX0YCBCmETTj5g02Y/84FX6w7qWbO2Hu2UeU0blbnsGRBsWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445635;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Fq6yFeIpFYUq9GidwudNaGDfTK+jNPkZlihcuSaBGS4=;
	b=SwP+3M1/UPpFZ1QHFFGicZK/hTT4ksiBXGao5wNRGfo09ccs4p4nr5JgeCilRGyCvRRC
	 j3MIkAkH6MRSrPr7D424tEySkbzcSWyia8YmHtRagWA9N+SrrLGQ4+qh3nT+bVC8t2wTU
	 ZgwiMIq9zfmEHVD/y0C+0WuMIWVLcis5YBmEqHagfHkwD5uFzk9eQB1NVUSaNa3Vth0CQ
	 oyLS5v3d0hjyKzL3EuzTYytTFajes179fEiqpyBX5splnsYnQA+Oz4f4hWXKMIhmEpNYR
	 0x1y6iSIVzRyXDWM+A7V2yZl0TJp0T3noX/zdZCTSiBQbdF8Q9rQORs3JLKMSIxVKpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=YA2T3ppX;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D1660A5BCE
	for <dmaengine@vger.kernel.org>; Mon, 23 Nov 2026 14:53:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77D1660A5BCE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=YA2T3ppX
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso25197875e9.2
        for <dmaengine@vger.kernel.org>; Mon, 23 Nov 2026 06:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445633; x=1796050433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fq6yFeIpFYUq9GidwudNaGDfTK+jNPkZlihcuSaBGS4=;
        b=YA2T3ppXFNUv5MeozaFJxF0hWIaY5sY/O/Cr5/HXQHSalX+x1VVq0hijpFPhRawDR2
         7UXBlTYZtCU/AdLXl595/7qrnZrVJRORdwtYMrEqONC4kszO873DywoWVzzcjo5P7oq2
         B0NKjvppyszO2YKqPtTSXk2shRHXa2c3JVm8ZcDD/yrO16fR0n5BQqpJNqyaNunGXL8g
         WuAJgECR4uEqAYDGhbU7YA6lrDEok2/Px+pEIQmgvH8ytFsY4GguHZ9v/WPX22c9TJTd
         oVRBwbo2KEkje5Dl4X+X3XQvj4A95M6isfzCMJc94cQmmKe3ZkCmHnCfy5AhaI2oJ/lb
         dVOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445633; x=1796050433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fq6yFeIpFYUq9GidwudNaGDfTK+jNPkZlihcuSaBGS4=;
        b=gDYDp7Mvvx/I0B1Azl5kiaCtUZvAIVs5fz5D/p4w9hn54y0bOQdhAYP2nQXXgP7Rry
         vJqH4vM8wy7ohvlXrFlIesgVdRPrVtZVn1OPFiORCETNDKhMaScp1JC4L+aZSfpYF0H+
         dw9CEGSizfk3Yh414d8QxjXpjfJWZvuqWy1L04suLhSXJ0eEaLI1DVYNNlro5ukpDrUm
         xYcd3WiWDB8E1NgzYJRpixexUK6NO4BFBTb7ryNixhDwCc9kSS7f/wJdmtZJCZ+uo4qO
         pXvm0HZB5xjLpjPxbUi7fdl59elwBQVvRrJDmiUdMrjq0AzbAr0t7s7wN1lrLUOVtz9y
         h7bg==
X-Forwarded-Encrypted: i=1; AL+hErH9GGuu3wEKhOsZOjZQym9Pw06ZB9LBRcR3RN/rOi0WCfeS9J8PW6KrLXsNuZ72PZgv2yvYkxDaJ+Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/DS+JUtexjzRydiNmplyjWTvQ4zPqYVa+xDnGmMGEKKdagiPVt
	h3anKWmzJDAb+bX/mCOFtKlVOlYeaIWU0YY1Ve6mAvrzAvXQcDoy3y7cnyky4fHog8I=
X-Gm-Gg: AZFdTZfjBiEpfn47YdYa7LOtBLWToiwImaJPQanH2CqD3Cp5sfP3ezWtfJfoNam+X2o
	mZWl4Z600v29P1tgsEaE/U7fk8FkN7XHy024eX94CiQEPoclUXnlRvq7aMkDyp9NMvlkdohzYvt
	HuZ7XxFrRgXti+0yg93Eq2Y1pKYMo6Uw3rL8Z5Pz0NaHJz7+Sg+tLLQOjjpd6Qdbhh6l7eefh4q
	N6Ty3RpwGWJhbj1ds65VSnxnHOAlrywq6Fvs9ArriYyx+E+9gTHYQTFmSohP84zPs36r5a48mhp
	UmdhLoLInAm4ubg5xbSIKYSCB2u6q4Ib1MAhzhH6ORKHov7pm22ArR4a2olKxEtv4Lx+d1GvZwR
	CcJEbU75Z/6Wn2jB7xMc8Yj3ooJfK8E7pHAmlQYVnFkZj/pm8inAzh+fJW5imwB3MIRwbTBj9MV
	Dfnjocvjfj/siydscxizYevi86UgEPbFjiUQyFULv3JtqXpMoR55zbBLz3kAm8tnbdYXEEd6Vk6
	6gvBhWrqbByZ/2HbufeT3RZRvYzqAbF4Hk/dGoHqkNhcPQJ7WQfscT7JPv5Q9kAku+qA7vNEGu2
	XkvsqJIKutrvQB+8E+KohBcFzEk=
X-Received: by 2002:a05:600c:a11:b0:4a2:e0c:2b0a with SMTP id 5b1f17b1804b1-4bb888120famr244703865e9.16.1795445632908;
        Mon, 23 Nov 2026 06:53:52 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853368d3sm362775075e9.1.2026.11.23.06.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:53:52 -0800 (PST)
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
Subject: [PATCH v3 14/28] dmaengine: bcm2835: Use dma_map_resource() to translate slave addresses
Date: Mon, 23 Nov 2026 15:56:52 +0100
Message-ID: <20261123145728.29082-15-andrea.porta@suse.com>
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

Slave addresses in struct dma_slave_config are CPU physical addresses
and it is up to the DMA controller driver to translate them into the
addresses it has to program into the hardware. The BCM2835 DMA driver
instead uses them verbatim, which only works because its clients pass
pre-translated bus addresses read straight from their DT node, bypassing
the bus translations described there.

Translate the addresses with dma_map_resource(), which applies the
dma-ranges of the DMA controller since the conversion of
dma_map_resource() to dma_map_phys() with DMA_ATTR_MMIO, and map them
once in device_config() instead of at every prep call. The mappings are
released when the channel is reconfigured or freed.

Existing device trees only describe the RAM in dma-ranges, so
dma_map_resource() would fail for any peripheral. Detect this case at
probe time, by looking for the controller registers themselves in the
dma-ranges of the closest ancestor bus, and fall back to reverting the
translation given by the ranges property of the parent bus, which is
how the VideoCore bus addresses of the peripherals have been derived so
far. Addresses not covered by those ranges are passed through, so that
clients still providing bus addresses keep working.

The fallback translation is a platform callback, as different kinds of
channels see the peripherals at different addresses; implement the one
of the legacy channels.

Link: https://lore.kernel.org/linux-arm-kernel/ee19a95d-fe1e-4f3f-bc81-bdef38475469@arm.com/
Link: https://lore.kernel.org/all/CAPY8ntByJYzSv0kTAc1kY0Dp=vwrzcA0oWiPpyg7x7_BQwGSnA@mail.gmail.com/
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/dma/bcm2835-dma.c | 180 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 175 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index f8b2202096d6..3ff30c41dc63 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -30,6 +30,7 @@
 #include <linux/io.h>
 #include <linux/spinlock.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/of_dma.h>
 
 #include "virt-dma.h"
@@ -43,12 +44,16 @@
  * @base: base address of register map
  * @zero_page: bus address of zero page (to detect transactions copying from
  *	zero page and avoid accessing memory if so)
+ * @cfg: platform specific description of the DMA channels
+ * @map_resource: the peripheral window is described by dma-ranges, so slave
+ *	addresses can be translated with dma_map_resource()
  */
 struct bcm2835_dmadev {
 	struct dma_device ddev;
 	void __iomem *base;
 	dma_addr_t zero_page;
 	const struct bcm2835_dma_cfg *cfg;
+	bool map_resource;
 };
 
 struct bcm_dma_cb {
@@ -70,10 +75,24 @@ struct bcm2835_cb_entry {
 	dma_addr_t paddr;
 };
 
+/**
+ * struct bcm2835_slave_addr - bus address of a slave FIFO
+ * @addr: address as seen by the DMA controller
+ * @size: size of the mapping
+ * @mapped: @addr has been obtained from dma_map_resource()
+ */
+struct bcm2835_slave_addr {
+	dma_addr_t addr;
+	size_t size;
+	bool mapped;
+};
+
 struct bcm2835_chan {
 	struct virt_dma_chan vc;
 
 	struct dma_slave_config	cfg;
+	struct bcm2835_slave_addr slave_src;
+	struct bcm2835_slave_addr slave_dst;
 	unsigned int dreq;
 
 	int ch;
@@ -106,6 +125,8 @@ struct bcm2835_chan {
  * @read_addr: read the current memory side address of a channel
  * @cs_flags: per-channel flags for the CS register
  * @abort: stop and reset a channel
+ * @legacy_bus_addr: translate a slave address for device trees which do not
+ *	describe the peripheral window in dma-ranges
  */
 struct bcm2835_dma_cfg {
 	u32 cs_reg;
@@ -138,6 +159,8 @@ struct bcm2835_dma_cfg {
 				enum dma_transfer_direction direction);
 	u32 (*cs_flags)(struct bcm2835_chan *c);
 	void (*abort)(struct bcm2835_chan *c);
+
+	u64 (*legacy_bus_addr)(struct device *dev, phys_addr_t phys);
 };
 
 struct bcm2835_desc {
@@ -798,11 +821,30 @@ static int bcm2835_dma_alloc_chan_resources(struct dma_chan *chan)
 			   c->irq_flags, "DMA IRQ", chan);
 }
 
+static void bcm2835_dma_unmap_slave_addr(struct dma_chan *chan,
+					 struct bcm2835_slave_addr *sa,
+					 enum dma_data_direction dir)
+{
+	if (sa->mapped)
+		dma_unmap_resource(chan->device->dev, sa->addr, sa->size, dir, 0);
+
+	memset(sa, 0, sizeof(*sa));
+}
+
+static void bcm2835_dma_unmap_slave_addrs(struct dma_chan *chan)
+{
+	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
+
+	bcm2835_dma_unmap_slave_addr(chan, &c->slave_src, DMA_FROM_DEVICE);
+	bcm2835_dma_unmap_slave_addr(chan, &c->slave_dst, DMA_TO_DEVICE);
+}
+
 static void bcm2835_dma_free_chan_resources(struct dma_chan *chan)
 {
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 
 	vchan_free_chan_resources(&c->vc);
+	bcm2835_dma_unmap_slave_addrs(chan);
 	free_irq(c->irq_number, chan);
 	dma_pool_destroy(c->cb_pool);
 
@@ -925,11 +967,11 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_slave_sg(
 	if (direction == DMA_DEV_TO_MEM) {
 		if (c->cfg.src_addr_width != DMA_SLAVE_BUSWIDTH_4_BYTES)
 			return NULL;
-		src = c->cfg.src_addr;
+		src = c->slave_src.addr;
 	} else {
 		if (c->cfg.dst_addr_width != DMA_SLAVE_BUSWIDTH_4_BYTES)
 			return NULL;
-		dst = c->cfg.dst_addr;
+		dst = c->slave_dst.addr;
 	}
 
 	/* count frames in sg list */
@@ -987,12 +1029,12 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
 	if (direction == DMA_DEV_TO_MEM) {
 		if (c->cfg.src_addr_width != DMA_SLAVE_BUSWIDTH_4_BYTES)
 			return NULL;
-		src = c->cfg.src_addr;
+		src = c->slave_src.addr;
 		dst = buf_addr;
 	} else {
 		if (c->cfg.dst_addr_width != DMA_SLAVE_BUSWIDTH_4_BYTES)
 			return NULL;
-		dst = c->cfg.dst_addr;
+		dst = c->slave_dst.addr;
 		src = buf_addr;
 	}
 
@@ -1019,10 +1061,87 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
 	return vchan_tx_prep(&c->vc, &d->vd, flags);
 }
 
+/*
+ * Device trees which do not describe the peripheral window in dma-ranges
+ * are handled by assuming that the legacy DMA channels see the peripherals
+ * at the same address as the bus they sit on, i.e. by reverting the
+ * translation described by the ranges property of the parent bus. This is
+ * how the VideoCore bus addresses have always been derived. Addresses which
+ * are not CPU physical addresses of that bus are passed through unchanged,
+ * as legacy clients used to provide bus addresses.
+ */
+static u64 bcm2835_dma_legacy_bus_addr(struct device *dev, phys_addr_t phys)
+{
+	struct device_node *bus = of_get_parent(dev->of_node);
+	struct of_range_parser parser;
+	struct of_range range;
+	u64 addr = phys;
+
+	if (bus && !of_range_parser_init(&parser, bus)) {
+		for_each_of_range(&parser, &range) {
+			if (phys >= range.cpu_addr &&
+			    phys - range.cpu_addr < range.size) {
+				addr = range.bus_addr + (phys - range.cpu_addr);
+				break;
+			}
+		}
+	}
+
+	of_node_put(bus);
+
+	return addr;
+}
+
+static int bcm2835_dma_map_slave_addr(struct dma_chan *chan,
+				      struct bcm2835_slave_addr *sa,
+				      phys_addr_t phys,
+				      enum dma_slave_buswidth width,
+				      enum dma_data_direction dir)
+{
+	struct bcm2835_dmadev *od = to_bcm2835_dma_dev(chan->device);
+	struct device *dev = chan->device->dev;
+	size_t size = width ? width : DMA_SLAVE_BUSWIDTH_4_BYTES;
+
+	if (!phys)
+		return 0;
+
+	if (!od->map_resource) {
+		sa->addr = od->cfg->legacy_bus_addr(dev, phys);
+		return 0;
+	}
+
+	sa->addr = dma_map_resource(dev, phys, size, dir, 0);
+	if (dma_mapping_error(dev, sa->addr)) {
+		dev_err(dev, "failed to map slave address %pa\n", &phys);
+		sa->addr = 0;
+		return -EINVAL;
+	}
+
+	sa->size = size;
+	sa->mapped = true;
+
+	return 0;
+}
+
 static int bcm2835_dma_slave_config(struct dma_chan *chan,
 				    struct dma_slave_config *cfg)
 {
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
+	int ret;
+
+	bcm2835_dma_unmap_slave_addrs(chan);
+
+	ret = bcm2835_dma_map_slave_addr(chan, &c->slave_src, cfg->src_addr,
+					 cfg->src_addr_width, DMA_FROM_DEVICE);
+	if (ret)
+		return ret;
+
+	ret = bcm2835_dma_map_slave_addr(chan, &c->slave_dst, cfg->dst_addr,
+					 cfg->dst_addr_width, DMA_TO_DEVICE);
+	if (ret) {
+		bcm2835_dma_unmap_slave_addrs(chan);
+		return ret;
+	}
 
 	c->cfg = *cfg;
 
@@ -1116,6 +1235,8 @@ static const struct bcm2835_dma_cfg bcm2835_data = {
 	.read_addr = bcm2835_dma_read_addr,
 	.cs_flags = bcm2835_dma_cs_flags,
 	.abort = bcm2835_dma_abort_chan,
+
+	.legacy_bus_addr = bcm2835_dma_legacy_bus_addr,
 };
 
 static const struct of_device_id bcm2835_dma_of_match[] = {
@@ -1157,6 +1278,48 @@ static int bcm2835_dma_suspend_late(struct device *dev)
 	return 0;
 }
 
+/*
+ * The DMA controller registers sit in the same peripheral window as the
+ * FIFOs of its clients, so the window is described by dma-ranges if and
+ * only if the controller registers are.
+ */
+static bool bcm2835_dma_mmio_in_dma_ranges(struct device *dev,
+					   phys_addr_t mmio)
+{
+	struct of_range_parser parser;
+	struct of_range range;
+	struct device_node *np;
+	bool found = false;
+
+	for (np = of_get_parent(dev->of_node); np; np = of_get_next_parent(np))
+		if (of_property_present(np, "dma-ranges"))
+			break;
+
+	/*
+	 * Without any dma-ranges the translation is unknown: the peripherals
+	 * are not at their CPU physical address on any of these SoCs.
+	 */
+	if (!np)
+		return false;
+
+	if (!of_pci_dma_range_parser_init(&parser, np)) {
+		/* An empty dma-ranges describes a 1:1 translation too */
+		found = !of_range_count(&parser);
+
+		for_each_of_range(&parser, &range) {
+			if (mmio >= range.cpu_addr &&
+			    mmio - range.cpu_addr < range.size) {
+				found = true;
+				break;
+			}
+		}
+	}
+
+	of_node_put(np);
+
+	return found;
+}
+
 static const struct dev_pm_ops bcm2835_dma_pm_ops = {
 	LATE_SYSTEM_SLEEP_PM_OPS(bcm2835_dma_suspend_late, NULL)
 };
@@ -1164,6 +1327,7 @@ static const struct dev_pm_ops bcm2835_dma_pm_ops = {
 static int bcm2835_dma_probe(struct platform_device *pdev)
 {
 	struct bcm2835_dmadev *od;
+	struct resource *res;
 	void __iomem *base;
 	int rc;
 	int i, j;
@@ -1192,12 +1356,18 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
 
 	dma_set_max_seg_size(&pdev->dev, 0x3FFFFFFF);
 
-	base = devm_platform_ioremap_resource(pdev, 0);
+	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
 	od->base = base;
 
+	od->map_resource = bcm2835_dma_mmio_in_dma_ranges(&pdev->dev,
+							  res->start);
+	if (!od->map_resource)
+		dev_info(&pdev->dev,
+			 "peripheral window missing in dma-ranges, please update DT blob\n");
+
 	dma_cap_set(DMA_SLAVE, od->ddev.cap_mask);
 	dma_cap_set(DMA_PRIVATE, od->ddev.cap_mask);
 	dma_cap_set(DMA_CYCLIC, od->ddev.cap_mask);
-- 
2.51.0

