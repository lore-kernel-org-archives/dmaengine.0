Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=204.191.154.188
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793720484;
	b=uizFt3s8kNgBHt+llclgVVmx+4JQmUHr0cqH9HZ+ZY7eOtiYZlhrYTUZu2cYUQjwOsaY
	 4uP3FgFqSwlcbHbnahg/fwZqbWCLyHELd727kL2a8kKjVyHplFO9m1OdoQHd5RS0M2h3L
	 tICTvQYTxJKPH554xQi4CyAWYHhStBPQKnkSXRyTPiLZU3F48BJkL6Xe9W2d0xAZD/+mv
	 2fwe2iaFfbVpzEbWiDL2PQXWHTWQ/71MD/leA/FPlnq2i0lWNe6eqYq8djvu+oNKXzlNQ
	 kEoKOgVwSIy4yAapzcqRy4Fimbd0ShMu9aEPhDugfQE8lT7FlRwptC+UwvFNlmHR1IQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793720484;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-SA-Exim-Connect-IP:X-SA-Exim-Rcpt-To:
	 X-SA-Exim-Mail-From:X-Spam-Checker-Version:X-Spam-Level:X-Spam-Status:
	 Subject:X-SA-Exim-Version:X-SA-Exim-Scanned;
	bh=zX56lkjWsV/6QVP4/lR98gdN+8E734MvtZHw5wL4zq8=;
	b=4QzGau7RCSDLL8JmYzXW/Q5SjcpYBPsDvGohILt5HM19R4Ok/omSg6gkTKIsIBb40Kpf
	 koZVB2boNFdiu4/DukPc1/S5FpcHfipQqP9LZullh2tTaOJUNun1RUlyfucwbleeOZv8f
	 VsoRr27YX5qaCC1wSoXJKhyDcxvy6JBgTjZwxgYulhkC0p57Z5QuvmxLtVAYOGqhuvahO
	 VZA16RhBqvKxmiM01Eh3tOqrOtZRaA1yJQljSfThWCmO9FKByuWZr3y6iIDmLoxQjHOie
	 3hFOiD5qgLhooQQNakVBggoN2PqUV5m5vH+t9k5rmnz6iVddAR44HM0dH1GJv50F8Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deltatee.com;
	spf=pass smtp.mailfrom=deltatee.com;
	dkim=pass header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=nKR7eaW1;
	arc=none smtp.remote-ip=204.191.154.188
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A46606A331;
	Tue,  3 Nov 2026 15:41:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6A46606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=deltatee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deltatee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=nKR7eaW1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Cc:To:From:content-disposition;
	bh=zX56lkjWsV/6QVP4/lR98gdN+8E734MvtZHw5wL4zq8=; b=nKR7eaW1u6Yph77s59EADlF4Q/
	xCBhqJEKzuL0eoftYBiWpRx56CbBW6WaCuKUbh7cmjsrDXcEnFxs5HUPJWGah9FRdmDlJVAqF54vb
	/JEuFY7qKbvU1JUKsaeyV8dkyAxSlVAztyA8bZ9Nyrz24T57Iv6sYuCVuKlt9lF/sh0p4O7Fc42+M
	h9XL7hXpix1aH4nNiWVXD/OlMHRAAB/dYPMJAMvTLIlYlbaLq3zqGXWJMAN83umJtl42hKvUX3VOu
	XBFBIxrUyvaOOy1uCbAUhbVoWkBCOIdnHvlrS30XrozOtbppiEw6QPfLtoD7cose/voxLTBKaLvcf
	27Se0sJg==;
Received: from donard.priv.deltatee.com ([172.16.1.31])
	by ale.deltatee.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1xOGdV-000000091If-3EZd;
	Tue, 03 Nov 2026 09:41:22 -0600
Received: from logang by donard.priv.deltatee.com with local (Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1xOGca-00000001vZi-2HCO;
	Tue, 03 Nov 2026 09:40:24 -0600
From: Logan Gunthorpe <logang@deltatee.com>
To: dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.li@nxp.com>,
	Christoph Hellwig <hch@infradead.org>,
	Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
	Dave Jiang <dave.jiang@intel.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Kelvin Cao <kelvin.cao@microchip.com>,
	Logan Gunthorpe <logang@deltatee.com>
Date: Tue,  3 Nov 2026 09:40:20 -0600
Message-ID: <20261103154022.459620-4-logang@deltatee.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261103154022.459620-1-logang@deltatee.com>
References: <20261103154022.459620-1-logang@deltatee.com>
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
X-SA-Exim-Connect-IP: 172.16.1.31
X-SA-Exim-Rcpt-To: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, vkoul@kernel.org, Frank.li@nxp.com, hch@infradead.org, christophe.jaillet@wanadoo.fr, dave.jiang@intel.com, linux@weissschuh.net, kelvin.cao@microchip.com, logang@deltatee.com
X-SA-Exim-Mail-From: logang@deltatee.com
X-Spam-Level: 
Subject: [PATCH v3 3/4] dmaengine: switchtec-dma: add config sysfs attributes
X-SA-Exim-Version: 4.2.1 (built Sun, 23 Feb 2025 07:57:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)

Add sysfs configuration options for switchtec-dma channels, using
dma_device.chan_groups the same way the ioatdma conversion does:
attach a "switchtec-config" attribute group directly to the channel's
existing struct device, with each show()/store() recovering the
struct dma_chan via the dmaengine_chan_from_dev CLASS.

The read-modify-write of the shared perf_cfg register is protected by
hw_ctrl_lock, and writes are rejected with -EBUSY while the channel is
allocated to a client (hw_cfg_locked), instead of a TOCTOU-prone
chan->client_count check.

Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
---
 drivers/dma/switchtec_dma.c | 179 ++++++++++++++++++++++++++++++++++++
 1 file changed, 179 insertions(+)

diff --git a/drivers/dma/switchtec_dma.c b/drivers/dma/switchtec_dma.c
index a386c3a284e6..1ebe17095c61 100644
--- a/drivers/dma/switchtec_dma.c
+++ b/drivers/dma/switchtec_dma.c
@@ -132,6 +132,11 @@ struct switchtec_dma_chan {
 
 	/* Serialize hardware control register access */
 	spinlock_t hw_ctrl_lock;
+	/*
+	 * Set while the channel is allocated to a client; blocks sysfs
+	 * hw config changes
+	 */
+	bool hw_cfg_locked;
 
 	struct tasklet_struct desc_task;
 
@@ -1029,6 +1034,10 @@ static int switchtec_dma_alloc_chan_resources(struct dma_chan *chan)
 	dev_dbg(dmaengine_chan_dev(chan), "MRRS:        0x%x\n",
 		FIELD_GET(PERF_MRRS_MASK, perf_cfg));
 
+	spin_lock(&swdma_chan->hw_ctrl_lock);
+	swdma_chan->hw_cfg_locked = true;
+	spin_unlock(&swdma_chan->hw_ctrl_lock);
+
 	return SWITCHTEC_DMA_SQ_SIZE;
 
 err_ring_inactive:
@@ -1046,11 +1055,180 @@ static int switchtec_dma_alloc_chan_resources(struct dma_chan *chan)
 	return rc;
 }
 
+static __always_inline ssize_t perf_cfg_show(struct device *dev, char *page,
+					     unsigned int mask)
+{
+	struct switchtec_dma_chan *swdma_chan;
+	struct chan_fw_regs __iomem *chan_fw;
+	u32 perf_cfg;
+	int value;
+
+	CLASS(dmaengine_chan_from_dev, c)(dev);
+
+	if (!c)
+		return -ENODEV;
+
+	swdma_chan = container_of(c, struct switchtec_dma_chan, dma_chan);
+	chan_fw = swdma_chan->mmio_chan_fw;
+
+	rcu_read_lock();
+	if (!rcu_dereference(swdma_chan->swdma_dev->pdev)) {
+		rcu_read_unlock();
+		return -ENODEV;
+	}
+
+	perf_cfg = readl(&chan_fw->perf_cfg);
+	value = field_get(mask, perf_cfg);
+
+	rcu_read_unlock();
+	return sysfs_emit(page, "0x%x\n", value);
+}
+
+static __always_inline ssize_t perf_cfg_store(struct device *dev,
+					      const char *page, size_t count,
+					      unsigned int mask)
+{
+	struct switchtec_dma_chan *swdma_chan;
+	struct chan_fw_regs __iomem *chan_fw;
+	ssize_t ret = count;
+	u32 perf_cfg;
+	int value;
+
+	CLASS(dmaengine_chan_from_dev, c)(dev);
+
+	if (!c)
+		return -ENODEV;
+
+	swdma_chan = container_of(c, struct switchtec_dma_chan, dma_chan);
+	chan_fw = swdma_chan->mmio_chan_fw;
+
+	if (kstrtoint(page, 0, &value) < 0)
+		return -EINVAL;
+
+	if (value < 0 || value > field_max(mask))
+		return -EINVAL;
+
+	rcu_read_lock();
+	if (!rcu_dereference(swdma_chan->swdma_dev->pdev)) {
+		ret = -ENODEV;
+		goto err_unlock;
+	}
+
+	spin_lock(&swdma_chan->hw_ctrl_lock);
+	if (swdma_chan->hw_cfg_locked) {
+		spin_unlock(&swdma_chan->hw_ctrl_lock);
+		ret = -EBUSY;
+		goto err_unlock;
+	}
+
+	perf_cfg = readl(&chan_fw->perf_cfg);
+	perf_cfg = (perf_cfg & ~mask) | field_prep(mask, value);
+	writel(perf_cfg, &chan_fw->perf_cfg);
+	spin_unlock(&swdma_chan->hw_ctrl_lock);
+
+err_unlock:
+	rcu_read_unlock();
+	return ret;
+}
+
+static ssize_t burst_scale_show(struct device *dev,
+				struct device_attribute *attr, char *page)
+{
+	return perf_cfg_show(dev, page, PERF_BURST_SCALE_MASK);
+}
+
+static ssize_t burst_scale_store(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *page, size_t count)
+{
+	return perf_cfg_store(dev, page, count, PERF_BURST_SCALE_MASK);
+}
+static DEVICE_ATTR_RW(burst_scale);
+
+static ssize_t mrrs_show(struct device *dev,
+			 struct device_attribute *attr, char *page)
+{
+	return perf_cfg_show(dev, page, PERF_MRRS_MASK);
+}
+
+static ssize_t mrrs_store(struct device *dev,
+			  struct device_attribute *attr,
+			  const char *page, size_t count)
+{
+	return perf_cfg_store(dev, page, count, PERF_MRRS_MASK);
+}
+static DEVICE_ATTR_RW(mrrs);
+
+static ssize_t interval_show(struct device *dev,
+			     struct device_attribute *attr, char *page)
+{
+	return perf_cfg_show(dev, page, PERF_INTERVAL_MASK);
+}
+
+static ssize_t interval_store(struct device *dev,
+			      struct device_attribute *attr,
+			      const char *page, size_t count)
+{
+	return perf_cfg_store(dev, page, count, PERF_INTERVAL_MASK);
+}
+static DEVICE_ATTR_RW(interval);
+
+static ssize_t burst_size_show(struct device *dev,
+			       struct device_attribute *attr, char *page)
+{
+	return perf_cfg_show(dev, page, PERF_BURST_SIZE_MASK);
+}
+
+static ssize_t burst_size_store(struct device *dev,
+				struct device_attribute *attr,
+				const char *page, size_t count)
+{
+	return perf_cfg_store(dev, page, count, PERF_BURST_SIZE_MASK);
+}
+static DEVICE_ATTR_RW(burst_size);
+
+static ssize_t arb_weight_show(struct device *dev,
+			       struct device_attribute *attr, char *page)
+{
+	return perf_cfg_show(dev, page, PERF_ARB_WEIGHT_MASK);
+}
+
+static ssize_t arb_weight_store(struct device *dev,
+				struct device_attribute *attr,
+				const char *page, size_t count)
+{
+	return perf_cfg_store(dev, page, count, PERF_ARB_WEIGHT_MASK);
+}
+static DEVICE_ATTR_RW(arb_weight);
+
+static struct attribute *switchtec_config_attrs[] = {
+	&dev_attr_burst_scale.attr,
+	&dev_attr_mrrs.attr,
+	&dev_attr_interval.attr,
+	&dev_attr_burst_size.attr,
+	&dev_attr_arb_weight.attr,
+	NULL,
+};
+
+static const struct attribute_group switchtec_config_group = {
+	.name = "switchtec-config",
+	.attrs = switchtec_config_attrs,
+};
+
+static const struct attribute_group *switchtec_groups[] = {
+	&switchtec_config_group,
+	NULL,
+};
+
 static void switchtec_dma_free_chan_resources(struct dma_chan *chan)
 {
 	struct switchtec_dma_chan *swdma_chan =
 		container_of(chan, struct switchtec_dma_chan, dma_chan);
 
+	spin_lock(&swdma_chan->hw_ctrl_lock);
+	swdma_chan->hw_cfg_locked = false;
+	spin_unlock(&swdma_chan->hw_ctrl_lock);
+
 	spin_lock_bh(&swdma_chan->submit_lock);
 	swdma_chan->ring_active = false;
 	spin_unlock_bh(&swdma_chan->submit_lock);
@@ -1313,6 +1491,7 @@ static int switchtec_dma_create(struct pci_dev *pdev)
 	dma->device_terminate_all = switchtec_dma_terminate_all;
 	dma->device_synchronize = switchtec_dma_synchronize;
 	dma->device_release = switchtec_dma_release;
+	dma->chan_groups = switchtec_groups;
 
 	rc = dma_async_device_register(dma);
 	if (rc) {
-- 
2.47.3

