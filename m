Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561AD3CB544;
	Mon, 27 Jul 2026 19:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=204.191.154.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785178966; cv=none; b=OVto/lDToVFvyWSsbwloHidzNl4Q//fvCMJ1hFNtCGPjgQThTj8/n0K/P/jMaDnXN7dHNTLIvg/nr0zaSzWbjP2fCuapni1AUNefBdbHF4h6eqT8q6CumuR2/UsmA4yWQkuXfHOxSwn7yUimD0hbG1oktveHiYAlMgt1IFT5eCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785178966; c=relaxed/simple;
	bh=5RIOHuifJgu0QgWino+4hYwnu4Pb/ljgMBl72QYGNdE=;
	h=From:To:Cc:Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Subject; b=G8tQB4MNLEEsN5zAtwIBerrIRhugQVg76jMCWW2SdhFyO941sRpwzP6tdEMJnfeMwWYP7Wd4jYJ1lrqDLqqYk5Pc17/9WLxFdtuXGjpBYt4BWspgAf+7TrhndalTTCQGkI9LPCgCo66r4xRfoPqfSBOwCqcB8/7M3xEsnWUooj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=deltatee.com; spf=pass smtp.mailfrom=deltatee.com; dkim=pass (2048-bit key) header.d=deltatee.com header.i=@deltatee.com header.b=ZXBluO2M; arc=none smtp.client-ip=204.191.154.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=deltatee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deltatee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deltatee.com header.i=@deltatee.com header.b="ZXBluO2M"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Cc:To:From:content-disposition;
	bh=m0jJJiNtUIIVHIqWOqHXFjTl2+zTSUEADXrWZ2jtafw=; b=ZXBluO2MaePgJEBx/+fLACmXyF
	S1OMCxlsM6LeC7CtEG+NxVFpkn+b3HKSkNB1+py50xx0aPWXeQxEryRhTsr6t0x9WUcQk4YbMMZeO
	0PvJopB5rRMvfnYWPpGQ/HYmNWFKFMlNLVcgKxkBtjI/V0M0nXadnrBqDfpz+o6BMnx2AZUAR57im
	DQ30u/7kWmMhl/8iLzmPm6NHYzUqsV46RTsdNhIk3aTs42A6KwxTKYAWYQ0xsSUQtK9tzivRHo0r9
	xMMEG5OVGKoGhOXICZx6Cy1kKBDucNhjgACRgs+Dbv82QhGv2YtGpHYLpf3CIdC9nCXtmeLooUNuj
	xf0LyIIQ==;
Received: from cgy1-donard.priv.deltatee.com ([172.16.1.31])
	by ale.deltatee.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <gunthorp@deltatee.com>)
	id 1woQb5-000000005VB-3YXX;
	Mon, 27 Jul 2026 13:02:44 -0600
Received: from gunthorp by cgy1-donard.priv.deltatee.com with local (Exim 4.98.2)
	(envelope-from <gunthorp@deltatee.com>)
	id 1woQNc-000000003Ib-0VrJ;
	Mon, 27 Jul 2026 12:48:48 -0600
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
Date: Mon, 27 Jul 2026 12:48:44 -0600
Message-ID: <20260727184844.12647-5-logang@deltatee.com>
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
Subject: [PATCH v2 4/4] dmaengine: switchtec-dma: add pmon sysfs attributes
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
index d74eb48e8eca..e0976aa74068 100644
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
@@ -1216,8 +1223,274 @@ static const struct attribute_group switchtec_config_group = {
 	.attrs = switchtec_config_attrs,
 };
 
+static ssize_t pmon_show(struct device *dev, char *page,
+			 u64 (*reader)(struct chan_fw_regs __iomem *chan_fw))
+{
+	struct switchtec_dma_chan *swdma_chan;
+	u64 val;
+
+	CLASS(dma_chan_from_dev, c)(dev);
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
+	CLASS(dma_chan_from_dev, c)(dev);
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

