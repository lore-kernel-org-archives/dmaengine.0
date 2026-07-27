Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699373C416B;
	Mon, 27 Jul 2026 19:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=204.191.154.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785178966; cv=none; b=oKLBNEjgdfdZXdKWPid+rTPP6ryEcDTYXyGQr9oR5J2d6NnVxw4Z5dFNzU8o28veDuhzt+D983z2fNsg+HWW/dEFCKmvztP14zMED+ybRjj3gls10VN+BXayDYxmECP29miKEWfqpFdPg7GF8XiS/IgqVnvCoZ9gAmUpULrxHcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785178966; c=relaxed/simple;
	bh=ux1wrEeENtQIQfRTrOkYCQTUpDwFTLyIHCNs8uh6GwA=;
	h=From:To:Cc:Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Subject; b=a1q/kD8Xngn0DYLqIKRpZGvCbOFzmJ4FM2zxQrDInfzFgeGSGJ5cGWFHZCT/DLEQyn//cEXCP8y6UqMPfDs+eGjsRU7HzApMnQrd4flRFab7UxylDz/qVZOusQsInQ0xZXsyzf1asmaDMl1z+huRdDb8/GQKF7tVr1MeXtQqkv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=deltatee.com; spf=pass smtp.mailfrom=deltatee.com; dkim=pass (2048-bit key) header.d=deltatee.com header.i=@deltatee.com header.b=KamUqb9H; arc=none smtp.client-ip=204.191.154.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=deltatee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deltatee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deltatee.com header.i=@deltatee.com header.b="KamUqb9H"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Cc:To:From:content-disposition;
	bh=q6u1E70/IUHfiDg6JMS6MggoSXG7DBidiuWtCrPUpa8=; b=KamUqb9HUvgMMgGOG1goUzC/xr
	UpJRKBUxkKiDcRu8oC5vHrdD4+t6xPygcdJ2g+byKrURN5fpL2WeFkRGB9yGXaQJq9Pm9fz8Ebvon
	9tJ5n3CGp6IFOxIZ7d7wVHDe6w1GKZ1l9IqFauX2s8iWVJsa99ETC/k6BL6/LG+fKmkCQFj9X9uuh
	ihhjSYMpswWVUJZAsoHLBSxroX31UopJn+0LgWpfk7bx4wKgM/a2TpgJzk+3mHTwD0e8/qJ0oRmcQ
	8LvmEk1Si8ONdhyrAqFDf9Sxrj0j6dsup58Z2cscdYlgy8wFcb9y1mE2l4u6mYLjHYhAmr6bcrS0b
	tNJ67jkg==;
Received: from cgy1-donard.priv.deltatee.com ([172.16.1.31])
	by ale.deltatee.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <gunthorp@deltatee.com>)
	id 1woQb4-000000005VB-3chZ;
	Mon, 27 Jul 2026 13:02:43 -0600
Received: from gunthorp by cgy1-donard.priv.deltatee.com with local (Exim 4.98.2)
	(envelope-from <gunthorp@deltatee.com>)
	id 1woQNb-000000003IW-3u97;
	Mon, 27 Jul 2026 12:48:47 -0600
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
Date: Mon, 27 Jul 2026 12:48:43 -0600
Message-ID: <20260727184844.12647-4-logang@deltatee.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260727184844.12647-1-logang@deltatee.com>
References: <20260727184844.12647-1-logang@deltatee.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 172.16.1.31
X-SA-Exim-Rcpt-To: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, vkoul@kernel.org, Frank.li@nxp.com, hch@infradead.org, christophe.jaillet@wanadoo.fr, dave.jiang@intel.com, linux@weissschuh.net, kelvin.cao@microchip.com, logang@deltatee.com
X-SA-Exim-Mail-From: gunthorp@deltatee.com
X-Spam-Level: 
Subject: [PATCH v2 3/4] dmaengine: switchtec-dma: add config sysfs attributes
X-SA-Exim-Version: 4.2.1 (built Sun, 23 Feb 2025 07:57:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)

Add sysfs configuration options for switchtec-dma channels, using
dma_device.chan_groups the same way the ioatdma conversion does:
attach a "switchtec-config" attribute group directly to the channel's
existing struct device, with each show()/store() recovering the
struct dma_chan via the dma_chan_from_dev CLASS.

The read-modify-write of the shared perf_cfg register is protected by
hw_ctrl_lock, and writes are rejected with -EBUSY while the channel is
allocated to a client (hw_cfg_locked), instead of a TOCTOU-prone
chan->client_count check.

Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
---
 drivers/dma/switchtec_dma.c | 179 ++++++++++++++++++++++++++++++++++++
 1 file changed, 179 insertions(+)

diff --git a/drivers/dma/switchtec_dma.c b/drivers/dma/switchtec_dma.c
index d73506b5cabc..d74eb48e8eca 100644
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
 	dev_dbg(&chan->dev->device, "MRRS:        0x%x\n",
 		FIELD_GET(PERF_MRRS_MASK, perf_cfg));
 
+	spin_lock(&swdma_chan->hw_ctrl_lock);
+	swdma_chan->hw_cfg_locked = true;
+	spin_unlock(&swdma_chan->hw_ctrl_lock);
+
 	return SWITCHTEC_DMA_SQ_SIZE;
 
 err_ring_inactive:
@@ -1047,11 +1056,180 @@ static int switchtec_dma_alloc_chan_resources(struct dma_chan *chan)
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
+	CLASS(dma_chan_from_dev, c)(dev);
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
+	CLASS(dma_chan_from_dev, c)(dev);
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
@@ -1318,6 +1496,7 @@ static int switchtec_dma_create(struct pci_dev *pdev)
 	dma->device_terminate_all = switchtec_dma_terminate_all;
 	dma->device_synchronize = switchtec_dma_synchronize;
 	dma->device_release = switchtec_dma_release;
+	dma->chan_groups = switchtec_groups;
 
 	rc = dma_async_device_register(dma);
 	if (rc) {
-- 
2.47.3

