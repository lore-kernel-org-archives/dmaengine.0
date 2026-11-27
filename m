Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781944;
	b=TleCU8keUVqyUs4qw9MVRAuz0DYWi/z7VnMyi4yNqRNWZ/fwQ7bvhHGeM05KGbGhd1g8
	 jGHAbyhmiezEKtZGkA3xGD1zXMh0PhU35qNgwv1TWMz8KlAtPIn/A6mde0sPY0HeGqhTm
	 fN/5KoljqK9ZY1bI1zs9tojTb1lqjG8VNnB8B1hGA+xY2ayk62m7c6HOgTTHNivDQHG0x
	 2jr9WIvJCDbMjfq2o8nOKOpM8nxgVWpPP8apMRgYRHZtMof4Si7hR2ALV+ssvtkKRNbL+
	 4vYErX7s49VHJuH6qMqsNhyw+N5A7AVu0kQhOBYEUzSMXT+faR4c7RgeiUofxX5PBag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781944;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RmpJbhwnEFWZjlqKNmyBtmxBFcAdHEPlgfv0okLJnJg=;
	b=4AeIzu+UaYMax8FERD703MT2X6q1bAgQAkC/lMTNu/E7g2NZFwNJdSHeJlcvSjQeEPkv
	 xdiD7FwXW2yYfmdDg8XacU4rO4dqK2uNHN40BTDKDv2JbiXgVXFZ65rEbC8aovH2z2Mdx
	 vomfjSfKEFat1makZXotBdeUx1wws1GKdDpGjc8yK3FqgH0EJsNQLiaLIpFO8YqMtOYoT
	 ygdio7jdoDzismTaGKfAfhQzAWivLXuGbxazfc35wMtxWVyRu/upuRVpbomG+jUtU2eiU
	 efQUiJiNTvEsedfCyNEhCGzxgliA+dBI7uDwm1Eip/sz+dFD+WpcemFXxAmC9tthsdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=BIrEpNbs;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591DE60A383F
	for <dmaengine@vger.kernel.org>; Fri, 27 Nov 2026 12:19:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 591DE60A383F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=BIrEpNbs
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso57788775e9.2
        for <dmaengine@vger.kernel.org>; Fri, 27 Nov 2026 04:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781941; x=1796386741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RmpJbhwnEFWZjlqKNmyBtmxBFcAdHEPlgfv0okLJnJg=;
        b=BIrEpNbsOMBP7D7wKa8gDdYHmiGIVdtL8/nSbfnZujyvYsjFvVlJ+jm9fTvJYXlE7U
         NO1x0UQb7szo9x1AXdJA90fzYYnvatg5K5DkthGUbkbuBR2AxTllLqf0N3rQh4Kuy8/n
         WRlxLP22qFgnDTBVbM35klPQbGYSw+Vfhy4S63hOIQD5GYhEMUsQetXxHaUb3oNWbMl2
         DnoVgxxtbKnxi1Bm9yQX3uEm6eVPv/yTdivE0/RPz0qXK6DLR8XtdOl0KdfpdwqOye+m
         R0YH/L94Ucdhsmi1PZhHqF+cXXG2CSySMP5qLALCNJyKI1Avde6rROupowFQsF3jpjMU
         F2qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781941; x=1796386741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RmpJbhwnEFWZjlqKNmyBtmxBFcAdHEPlgfv0okLJnJg=;
        b=GzyejcKbG0UyChKTPqaEZOzcbfT2pxMvftXaTNxNJpdNd1npRvFKDYQYJLOB6pDrec
         YhyjcsjMgm7G6sHr8TCgCONGZs4aKaAd+2+XoCTWFMiUsqBMHEdo5z8IMYNtSiXwb575
         TDWTKu7wiSc2CscOkkebvkBG/H+Q3wLtTDcF/7n/Cuy2rPmkb0RkCs9A0fYywkwcvd6P
         bMPyH6rVt9ar6LN/sN8jgRGsG6+NGg+wDwXax8f+DO1K/Lwk6q5cmjHGfizyyA2SP5Zd
         PzBpxoCpNKKDg1qWxkfYBybni15lap0E6wXilAFJ4or/BaaRRqL65sH6kNwf9e/HdXF8
         vx7Q==
X-Forwarded-Encrypted: i=1; AL+hErGY8JsoSDjauaHpYYwb0pjvO0A9B6zzApIRX/6cUqtyqPys+NFMmr54Sy2Gb8BM0+az1YQ5tJ1/jQw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+E/9omU+CZJBbu5UhbXosQZ7LeRpmhZuSmone+BPICrkPpYP98
	eEH7EGnYiUfyhjDEIDEtHGgPcTf/8OgNX/wSi1s6yive++AUqll/7uCxHWbMkmYRkj8=
X-Gm-Gg: AZFdTZcUtOyy5yf4ev1e9oSbdQLLogGC1PIJt6hr2mOFozNF6ZC+hVwWm4SW757i6of
	1Dkn+Kj54CTRlGg4f6v83rqe6KQWe7iUsdPYbx68/zs53EltWfyMmCIcwJsT+QFYlU4p916RAA9
	EuGopLHF8/RVriZHjsHqWWK1UojZQ6bmKMqn6ZT0sAMz7+ZcvSkdv+jIt3qycl3/nh7McFnh0wY
	aKrc063SueF1mAkQl3I4Y3k9zOzaEUHHBe4abZqVj5Afr2G1P8+J3K0P4Q356nP2fJb3GlEvTqR
	l+x5gP9oRKpc6itRHOktmyvyn7VuFx4a8hdaCfFca8WcUYJTgZ0lfGaEYE30iuXw6n+N1q3jT5U
	L8pi1xWAEz/oNKPD/CN3J7+/QIvQzJv4HqkqdG8n1w3dLO0B/T7/GVcEU7amWKIsK/hzqweufXi
	Ct2OGhNkRfeeRySvxOUe+pMMoZNeIfmrvciXO4y7HmzGkV8YJ7YUuYGPmKEYRUwwu6xcF0M0cpG
	ufQVt4oEGJLVMVBmY79k/vQYhtB2WIDSiFiopu+dnNZ52676bEE5qEIiWbnXThEVxly/Z4IzyPB
	IIa4N0v0I8XXLKZ4WQuwHZyRuiUx
X-Received: by 2002:a05:600c:a088:b0:4a2:1a:a120 with SMTP id 5b1f17b1804b1-4bb8880ac02mr461075055e9.6.1795781940635;
        Fri, 27 Nov 2026 04:19:00 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f281sm43970612f8f.22.2026.11.27.04.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:19:00 -0800 (PST)
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
Subject: [PATCH v4 14/28] dmaengine: bcm2835: Use dma_map_resource() to translate slave addresses
Date: Fri, 27 Nov 2026 13:22:04 +0100
Message-ID: <20261127122236.4976-15-andrea.porta@suse.com>
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

Slave addresses in struct dma_slave_config are CPU physical addresses
and it is up to the DMA controller driver to translate them into the
addresses it has to program into the hardware. The BCM2835 DMA driver
instead uses them verbatim, which only works because its clients pass
pre-translated bus addresses read straight from their DT node, bypassing
the bus translations described there.

Translate the addresses with dma_map_resource(), which applies the
dma-ranges of the DMA controller since the conversion of
dma_map_resource() to dma_map_phys() with DMA_ATTR_MMIO, and map them
once in device_config() instead of at every prep call. Since the mapping
is done on behalf of the DMA controller, the source FIFO, which the
controller reads, is mapped DMA_TO_DEVICE and the destination FIFO,
which it writes, DMA_FROM_DEVICE. Clients such as the MMC driver
reconfigure the channel before every request, so the translation is kept
as long as the address does not change, and released when it does or
when the channel is freed.

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
 drivers/dma/bcm2835-dma.c | 192 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 187 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index 44dab42d94c6..42ec9be7a8f7 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -31,6 +31,7 @@
 #include <linux/io.h>
 #include <linux/spinlock.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/of_dma.h>
 
 #include <dt-bindings/dma/brcm,bcm2835-dma.h>
@@ -47,12 +48,15 @@
  * @zero_page: bus address of zero page (to detect transactions copying from
  *	zero page and avoid accessing memory if so)
  * @cfg: platform specific description of the DMA channels
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
@@ -74,10 +78,26 @@ struct bcm2835_cb_entry {
 	dma_addr_t paddr;
 };
 
+/**
+ * struct bcm2835_slave_addr - bus address of a slave FIFO
+ * @phys: CPU physical address provided by the client
+ * @addr: address as seen by the DMA controller
+ * @size: size of the mapping
+ * @mapped: @addr has been obtained from dma_map_resource()
+ */
+struct bcm2835_slave_addr {
+	phys_addr_t phys;
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
@@ -110,6 +130,8 @@ struct bcm2835_chan {
  * @read_addr: read the current memory side address of a channel
  * @cs_flags: per-channel flags for the CS register
  * @abort: stop and reset a channel
+ * @legacy_bus_addr: translate a slave address for device trees which do not
+ *	describe the peripheral window in dma-ranges
  */
 struct bcm2835_dma_cfg {
 	u32 cs_reg;
@@ -142,6 +164,8 @@ struct bcm2835_dma_cfg {
 				enum dma_transfer_direction direction);
 	u32 (*cs_flags)(struct bcm2835_chan *c);
 	void (*abort)(struct bcm2835_chan *c);
+
+	u64 (*legacy_bus_addr)(struct device *dev, phys_addr_t phys);
 };
 
 struct bcm2835_desc {
@@ -783,11 +807,35 @@ static int bcm2835_dma_alloc_chan_resources(struct dma_chan *chan)
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
+/*
+ * The slave FIFOs are mapped for the DMA controller, which reads from the
+ * source FIFO (DMA_TO_DEVICE) and writes to the destination one
+ * (DMA_FROM_DEVICE).
+ */
+static void bcm2835_dma_unmap_slave_addrs(struct dma_chan *chan)
+{
+	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
+
+	bcm2835_dma_unmap_slave_addr(chan, &c->slave_src, DMA_TO_DEVICE);
+	bcm2835_dma_unmap_slave_addr(chan, &c->slave_dst, DMA_FROM_DEVICE);
+}
+
 static void bcm2835_dma_free_chan_resources(struct dma_chan *chan)
 {
 	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
 
 	vchan_free_chan_resources(&c->vc);
+	bcm2835_dma_unmap_slave_addrs(chan);
 	free_irq(c->irq_number, chan);
 	dma_pool_destroy(c->cb_pool);
 
@@ -913,11 +961,11 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_slave_sg(
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
@@ -975,12 +1023,12 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
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
 
@@ -1007,10 +1055,93 @@ static struct dma_async_tx_descriptor *bcm2835_dma_prep_dma_cyclic(
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
+	/*
+	 * Clients may reconfigure the channel before every transfer (e.g. the
+	 * MMC driver, which alternates between the configurations of the two
+	 * directions on a single channel, leaving the address of the unused
+	 * direction at 0): keep the current translation if the address did
+	 * not change, or if no address is given for this direction.
+	 */
+	if (!phys || (phys == sa->phys && size == sa->size))
+		return 0;
+
+	bcm2835_dma_unmap_slave_addr(chan, sa, dir);
+
+	if (!od->map_resource) {
+		sa->addr = od->cfg->legacy_bus_addr(dev, phys);
+	} else {
+		sa->addr = dma_map_resource(dev, phys, size, dir, 0);
+		if (dma_mapping_error(dev, sa->addr)) {
+			dev_err(dev, "failed to map slave address %pa\n", &phys);
+			sa->addr = 0;
+			return -EINVAL;
+		}
+
+		sa->mapped = true;
+	}
+
+	sa->phys = phys;
+	sa->size = size;
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
+	ret = bcm2835_dma_map_slave_addr(chan, &c->slave_src, cfg->src_addr,
+					 cfg->src_addr_width, DMA_TO_DEVICE);
+	if (ret)
+		return ret;
+
+	ret = bcm2835_dma_map_slave_addr(chan, &c->slave_dst, cfg->dst_addr,
+					 cfg->dst_addr_width, DMA_FROM_DEVICE);
+	if (ret)
+		return ret;
 
 	c->cfg = *cfg;
 
@@ -1104,6 +1235,8 @@ static const struct bcm2835_dma_cfg bcm2835_data = {
 	.read_addr = bcm2835_dma_read_addr,
 	.cs_flags = bcm2835_dma_cs_flags,
 	.abort = bcm2835_dma_abort_chan,
+
+	.legacy_bus_addr = bcm2835_dma_legacy_bus_addr,
 };
 
 static const struct of_device_id bcm2835_dma_of_match[] = {
@@ -1145,6 +1278,48 @@ static int bcm2835_dma_suspend_late(struct device *dev)
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
@@ -1152,6 +1327,7 @@ static const struct dev_pm_ops bcm2835_dma_pm_ops = {
 static int bcm2835_dma_probe(struct platform_device *pdev)
 {
 	struct bcm2835_dmadev *od;
+	struct resource *res;
 	void __iomem *base;
 	int rc;
 	int i, j;
@@ -1180,12 +1356,18 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
 
 	dma_set_max_seg_size(&pdev->dev, 0x3FFFFFFF);
 
-	base = devm_platform_ioremap_resource(pdev, 0);
+	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
 	od->base = base;
 
+	od->map_resource = bcm2835_dma_mmio_in_dma_ranges(&pdev->dev,
+							  res->start);
+	if (!od->map_resource)
+		dev_dbg(&pdev->dev,
+			"peripheral window not in dma-ranges, using the bus ranges\n");
+
 	dma_cap_set(DMA_SLAVE, od->ddev.cap_mask);
 	dma_cap_set(DMA_PRIVATE, od->ddev.cap_mask);
 	dma_cap_set(DMA_CYCLIC, od->ddev.cap_mask);
-- 
2.51.0

