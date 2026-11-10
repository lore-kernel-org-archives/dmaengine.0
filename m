Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=204.191.154.188
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794331974;
	b=y7G3YuPWypVr9L+xS1sfo9kcl36UJvUjy2HYZ74nXStXI0In1ALn1sHlkquVPRHTzIf6
	 6y+J7qiVaXWYLtsod2njo/8RsAsggszDrwotRZIMXI/55qoYKxINstmYPgC5K2vENbh3A
	 VR3YmZzs+yM749Pv6iUPFZCTXHqBVaZxNtyHXMCqay8qrWFIq7sb3dXpMp0KSExd+7cN6
	 yrLR+NQL6TP8/vL2vxg7rEKM1Tnb/Tz5BHwF4Pv09a02IYvaJ54yk/HIBknOqWQCot/ct
	 n61fhAU1y6OI4xZE5TsOVvjTiaCjIJlfEoU1tfvpxXfdhayXKfclC0aDKtGmgUp+1dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794331974;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-SA-Exim-Connect-IP:X-SA-Exim-Rcpt-To:
	 X-SA-Exim-Mail-From:X-Spam-Checker-Version:X-Spam-Level:X-Spam-Status:
	 Subject:X-SA-Exim-Version:X-SA-Exim-Scanned;
	bh=tY2mUUN+zt3HjzeGLe0fR5EP1Ptlptt69xf7Bh31k4U=;
	b=GxPXQLZ0O07QQbMSECsgyezAfvUoYhnEvOxWFE+39VYBa8dTCJLEKD1r0n4WvQ7onBW1
	 lApep6NRcOy6Srh3fBFj3BDI/xmLFmChdvfN925auHmclrMVl8xrnMLXE+hSRKFpGMemx
	 cJkrcp4XggjQwnPTd8wVPlo94wXV9u0lPsOhhAialuPb0KG40sB2tp3uTPdgm0N6eZKC2
	 b39jQ6LsfqPR96j24r/1LuCKeKBCmP1LmJgVr+bK5f0D+3BBvSyeVD+2yVFdphLVmd2Hi
	 9zNg59v8hHBDMlcMsrK/nMLoBwOa6LPZlsgVUEMGn7JSltYZcXeukAOpkXEENi3c/9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deltatee.com;
	spf=pass smtp.mailfrom=deltatee.com;
	dkim=pass header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=XfezU9hN;
	arc=none smtp.remote-ip=204.191.154.188
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7FF4606A31C;
	Tue, 10 Nov 2026 17:32:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7FF4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=deltatee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deltatee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=XfezU9hN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Cc:To:From:content-disposition;
	bh=tY2mUUN+zt3HjzeGLe0fR5EP1Ptlptt69xf7Bh31k4U=; b=XfezU9hNvzhGWKPy1TaBNwUka3
	SA0BzP+wLX7w51wek4mr8f2Og6G5GzTF53q5NthdSWF8PBF4qYlEqxecUDhLefJdC4ew2hGjZt6qQ
	e+daC8rcJFndsZFbkCpGk2g0WwN3wwny21VFS7Cg5njLMuJyozLxgFl0Ulr5n7yADy2N1XyHUwe6t
	oYletI48ioguKPirH8r1UxBjEtS2Ox615ZszsDh8zkNwhFPNA3lTShy+4krbTq9/rLctMC8Vnptbt
	Y9WW3lOh/6z6pMQ+uMpvGVZzxBAWqbjjOtEFGOIUNvCrkly0IcMrBwNBLl+EGeXsQFi9e5DQ+aSI7
	e/bWKxqQ==;
Received: from donard.priv.deltatee.com ([172.16.1.31])
	by ale.deltatee.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1xQpiF-00000000o1w-1xSN;
	Tue, 10 Nov 2026 11:32:52 -0600
Received: from logang by donard.priv.deltatee.com with local (Exim 4.98.2)
	(envelope-from <logang@deltatee.com>)
	id 1xQph6-00000002cHA-04IV;
	Tue, 10 Nov 2026 11:31:40 -0600
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
Date: Tue, 10 Nov 2026 11:31:36 -0600
Message-ID: <20261110173137.623764-5-logang@deltatee.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261110173137.623764-1-logang@deltatee.com>
References: <20261110173137.623764-1-logang@deltatee.com>
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
Subject: [PATCH v4 4/4] dmaengine: switchtec-dma: add pmon sysfs attributes
X-SA-Exim-Version: 4.2.1 (built Sun, 23 Feb 2025 07:57:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)

Switchtec hardware exposes some performance monitor registers which
can be used to monitor various statistics of the hardware.

Expose these as a "switchtec-pmon" sysfs attribute group, alongside
the "switchtec-config" group added previously.

The various registers are read through a small shared pmon_show()
helper parameterized by a reader function pointer, rather than a
macro, to avoid generating the whole read + rcu_read_lock/unlock +
sysfs_emit sequence per attribute.

Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
---
 drivers/dma/switchtec_dma.c | 273 ++++++++++++++++++++++++++++++++++++
 1 file changed, 273 insertions(+)

diff --git a/drivers/dma/switchtec_dma.c b/drivers/dma/switchtec_dma.c
index 1ebe17095c61..774b418330ed 100644
--- a/drivers/dma/switchtec_dma.c
+++ b/drivers/dma/switchtec_dma.c
@@ -12,6 +12,7 @@
 #include <linux/pci.h>
 #include <linux/delay.h>
 #include <linux/iopoll.h>
+#include <linux/io-64-nonatomic-lo-hi.h>
 
 #include "dmaengine.h"
 
@@ -91,6 +92,12 @@ struct chan_hw_regs {
 #define SE_BUF_LEN_MASK		GENMASK_U32(20, 12)
 #define SE_THRESH_MASK		GENMASK_U32(31, 23)
 
+#define SWITCHTEC_LAT_SE_FETCH   BIT(0)
+#define SWITCHTEC_LAT_VDM        BIT(1)
+#define SWITCHTEC_LAT_RD_IMM     BIT(2)
+#define SWITCHTEC_LAT_FW_NP      BIT(3)
+#define SWITCHTEC_LAT_SE_PROCESS BIT(4)
+
 #define SWITCHTEC_CHAN_ENABLE	BIT(1)
 
 struct chan_fw_regs {
@@ -1215,8 +1222,274 @@ static const struct attribute_group switchtec_config_group = {
 	.attrs = switchtec_config_attrs,
 };
 
+static ssize_t pmon_show(struct device *dev, char *page,
+			 u64 (*reader)(struct chan_fw_regs __iomem *chan_fw))
+{
+	struct switchtec_dma_chan *swdma_chan;
+	u64 val;
+
+	CLASS(dmaengine_chan_from_dev, c)(dev);
+
+	if (!c)
+		return -ENODEV;
+
+	swdma_chan = container_of(c, struct switchtec_dma_chan, dma_chan);
+
+	rcu_read_lock();
+	if (!rcu_dereference(swdma_chan->swdma_dev->pdev)) {
+		rcu_read_unlock();
+		return -ENODEV;
+	}
+
+	val = reader(swdma_chan->mmio_chan_fw);
+	rcu_read_unlock();
+
+	return sysfs_emit(page, "0x%llx\n", val);
+}
+
+static u64 read_se_count(struct chan_fw_regs __iomem *chan_fw)
+{
+	return lo_hi_readq(&chan_fw->perf_fetched_se_cnt_lo);
+}
+
+static ssize_t se_count_show(struct device *dev,
+			     struct device_attribute *attr, char *page)
+{
+	return pmon_show(dev, page, read_se_count);
+}
+static DEVICE_ATTR_RO(se_count);
+
+static u64 read_byte_count(struct chan_fw_regs __iomem *chan_fw)
+{
+	return lo_hi_readq(&chan_fw->perf_byte_cnt_lo);
+}
+
+static ssize_t byte_count_show(struct device *dev,
+			       struct device_attribute *attr, char *page)
+{
+	return pmon_show(dev, page, read_byte_count);
+}
+static DEVICE_ATTR_RO(byte_count);
+
+static u64 read_se_pending(struct chan_fw_regs __iomem *chan_fw)
+{
+	return readw(&chan_fw->perf_se_pending);
+}
+
+static ssize_t se_pending_show(struct device *dev,
+			       struct device_attribute *attr, char *page)
+{
+	return pmon_show(dev, page, read_se_pending);
+}
+static DEVICE_ATTR_RO(se_pending);
+
+static u64 read_se_buf_empty(struct chan_fw_regs __iomem *chan_fw)
+{
+	return readw(&chan_fw->perf_se_buf_empty);
+}
+
+static ssize_t se_buf_empty_show(struct device *dev,
+				 struct device_attribute *attr, char *page)
+{
+	return pmon_show(dev, page, read_se_buf_empty);
+}
+static DEVICE_ATTR_RO(se_buf_empty);
+
+static u64 read_chan_idle(struct chan_fw_regs __iomem *chan_fw)
+{
+	return readl(&chan_fw->perf_chan_idle);
+}
+
+static ssize_t chan_idle_show(struct device *dev,
+			      struct device_attribute *attr, char *page)
+{
+	return pmon_show(dev, page, read_chan_idle);
+}
+static DEVICE_ATTR_RO(chan_idle);
+
+static u64 read_latency_max(struct chan_fw_regs __iomem *chan_fw)
+{
+	return readl(&chan_fw->perf_lat_max);
+}
+
+static ssize_t latency_max_show(struct device *dev,
+				struct device_attribute *attr, char *page)
+{
+	return pmon_show(dev, page, read_latency_max);
+}
+static DEVICE_ATTR_RO(latency_max);
+
+static u64 read_latency_min(struct chan_fw_regs __iomem *chan_fw)
+{
+	return readl(&chan_fw->perf_lat_min);
+}
+
+static ssize_t latency_min_show(struct device *dev,
+				struct device_attribute *attr, char *page)
+{
+	return pmon_show(dev, page, read_latency_min);
+}
+static DEVICE_ATTR_RO(latency_min);
+
+static u64 read_latency_last(struct chan_fw_regs __iomem *chan_fw)
+{
+	return readl(&chan_fw->perf_lat_last);
+}
+
+static ssize_t latency_last_show(struct device *dev,
+				 struct device_attribute *attr, char *page)
+{
+	return pmon_show(dev, page, read_latency_last);
+}
+static DEVICE_ATTR_RO(latency_last);
+
+static ssize_t latency_selector_show(struct device *dev,
+				     struct device_attribute *attr, char *page)
+{
+	struct switchtec_dma_chan *swdma_chan;
+	struct chan_fw_regs __iomem *chan_fw;
+	u32 lat = 0;
+	int len;
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
+	lat = readl(&chan_fw->perf_latency_selector);
+	rcu_read_unlock();
+
+	len = sysfs_emit(page,
+			 "To select a latency type, write the type number\n");
+	len += sysfs_emit_at(page, len, "(1 ~ 5) to latency_selector\n\n");
+
+	len += sysfs_emit_at(page, len, "Latency Types:\n");
+	len += sysfs_emit_at(page, len, "(1) SE Fetch latency");
+	if (lat & SWITCHTEC_LAT_SE_FETCH)
+		len += sysfs_emit_at(page, len, " (*)\n");
+	else
+		len += sysfs_emit_at(page, len, "\n");
+
+	len += sysfs_emit_at(page, len, "(2) VDM latency");
+	if (lat & SWITCHTEC_LAT_VDM)
+		len += sysfs_emit_at(page, len, " (*)\n");
+	else
+		len += sysfs_emit_at(page, len, "\n");
+
+	len += sysfs_emit_at(page, len, "(3) Read Immediate latency");
+	if (lat & SWITCHTEC_LAT_RD_IMM)
+		len += sysfs_emit_at(page, len, " (*)\n");
+	else
+		len += sysfs_emit_at(page, len, "\n");
+
+	len += sysfs_emit_at(page, len, "(4) SE Processing latency");
+	if (lat & SWITCHTEC_LAT_SE_PROCESS)
+		len += sysfs_emit_at(page, len, " (*)\n");
+	else
+		len += sysfs_emit_at(page, len, "\n");
+
+	len += sysfs_emit_at(page, len, "(5) FW NP TLP latency");
+	if (lat & SWITCHTEC_LAT_FW_NP)
+		len += sysfs_emit_at(page, len, " (*)\n");
+	else
+		len += sysfs_emit_at(page, len, "\n");
+
+	return len;
+}
+
+static ssize_t latency_selector_store(struct device *dev,
+				      struct device_attribute *attr,
+				      const char *page, size_t count)
+{
+	struct switchtec_dma_chan *swdma_chan;
+	struct chan_fw_regs __iomem *chan_fw;
+	ssize_t ret = count;
+	int lat_type;
+
+	CLASS(dmaengine_chan_from_dev, c)(dev);
+
+	if (!c)
+		return -ENODEV;
+
+	swdma_chan = container_of(c, struct switchtec_dma_chan, dma_chan);
+	chan_fw = swdma_chan->mmio_chan_fw;
+
+	if (kstrtoint(page, 0, &lat_type) < 0)
+		return -EINVAL;
+
+	switch (lat_type) {
+	case 1:
+		lat_type = SWITCHTEC_LAT_SE_FETCH;
+		break;
+	case 2:
+		lat_type = SWITCHTEC_LAT_VDM;
+		break;
+	case 3:
+		lat_type = SWITCHTEC_LAT_RD_IMM;
+		break;
+	case 4:
+		lat_type = SWITCHTEC_LAT_SE_PROCESS;
+		break;
+	case 5:
+		lat_type = SWITCHTEC_LAT_FW_NP;
+		break;
+	default:
+		return -EINVAL;
+	}
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
+	writel(lat_type, &chan_fw->perf_latency_selector);
+	spin_unlock(&swdma_chan->hw_ctrl_lock);
+
+err_unlock:
+	rcu_read_unlock();
+
+	return ret;
+}
+static DEVICE_ATTR_RW(latency_selector);
+
+static struct attribute *switchtec_pmon_attrs[] = {
+	&dev_attr_se_count.attr,
+	&dev_attr_byte_count.attr,
+	&dev_attr_se_pending.attr,
+	&dev_attr_se_buf_empty.attr,
+	&dev_attr_chan_idle.attr,
+	&dev_attr_latency_max.attr,
+	&dev_attr_latency_min.attr,
+	&dev_attr_latency_last.attr,
+	&dev_attr_latency_selector.attr,
+	NULL,
+};
+
+static const struct attribute_group switchtec_pmon_group = {
+	.name = "switchtec-pmon",
+	.attrs = switchtec_pmon_attrs,
+};
+
 static const struct attribute_group *switchtec_groups[] = {
 	&switchtec_config_group,
+	&switchtec_pmon_group,
 	NULL,
 };
 
-- 
2.47.3

