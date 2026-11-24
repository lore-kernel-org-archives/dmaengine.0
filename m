Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795520764;
	b=b/2A1nSYejw0NaT1JJhSC7I8Ar2bWSzg7w7WNWcl43UEC+3rds2oQL1iYgQHjTEWEpB0
	 1ZgeuT/v2YDMrsjHkLLjlgn2OAjpI37h/AdJj5bfysaoCynVYNs36wEPFg9TvVW46KOaU
	 hohCohsvxhPutmI+OfNHZ3Ci0hIMjXugsvqXl+4ql/8NaOsTNgXymxwTUYu2ikZg67pCA
	 zpWGC3hcWxzTH1mDToZxNzU7hpIO+9KtgaOpkRrEwUo9waYeGNupr9HoAl+OsmzRm8FqJ
	 TyDMQOdFN4+zrKP9Dex3OW9SKKYe7Owy7AB096eI1CGFuJmxAQuKtYPB4Xx1gKqqp1Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795520764;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=acZ5G+lisXcEu5RmYGpRLGH9S4UYMk+oTxoL3nhYKoU=;
	b=wLUiNRSm+yvCm/Uqt/lNdROyfCTWvKuvT9kNAZG+eCIX8bgJNvzenFT+qnpCqh0JrHig
	 fLcLPE+bMmdt8KQnPpxCxpNt81P8bUBIDl/yXgk/0owM55IYlhj5IvF9/7OPV90Fja23D
	 r7Dym0flTqYIB+0k39bOTVus+ZjNprYSCxbk/mQhgqVfDB4Gnh1SO8g0wipyLDNGmUWxS
	 A/+NtCQXDvGuG5g2WPHuTv03ozcnZc4UclwALaR4ne1F+VYoK1KEamdd5buqC2RGYtcq0
	 0EQEg+PE5aS5plEumUOCuI8HVtUqCbmiA7ol0xMiqBn6sxncV8alDxQc3lgSiy6R6lQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l3OvRFMt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD1160A2627;
	Tue, 24 Nov 2026 11:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l3OvRFMt
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795520764;
	b=bw9EquyCPM93qX8k2y1x2yxbzWJB3NVOyyM/RIkEXJZDzjToyh/yLxfy6an0Yvkgq61E
	 DhkdS6f09je5uSOCxz45RtQAozP48luP5vehpwtf8wfwNKo8M44Cpjp0TDXzSDln9DPIe
	 0ctCtwQJXuzm+QNjn12zmvkS/7tY6jxyW/+x/zrs6mtLPMWsm5B9Cjr64WfCE78wFqAAZ
	 KFfzm6BJu7f3RSfvNEoS/VyGPihMz81be38VaDq8P/xIvlVUgCHovaT7xmz5DlTk60AYm
	 Cv7vi4tARApPu/S5EE9LnvREFsKABNMeGyz5AFpMagp+wErBRhk0aH/1Xbcgm647XBQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795520764;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=acZ5G+lisXcEu5RmYGpRLGH9S4UYMk+oTxoL3nhYKoU=;
	b=CDb5FSDgcrK5Hfv7wUFdbS7aoBqnCykxMs9mXl78MMKxNRy6dPScHVPMngKV9UAFVnNP
	 +UQ+rM5gU0GhhO2AheQxQ1ZCAc+d0La5JtuGB5q+VOvDJUJ5nwc+P8/t4Dqvet/El6ZOD
	 FLtRpLexRKVg5Uxbfo+ROy05tEMpY8tvyFq5PBQYOeVSDCnmUBJBwenBj9Fed8paDNge+
	 74RpMjv8Pr0QpYWWYoC7V3TGfTpY4ycO7ziKsw12arNNAWza7c+CYKmUoyWqI6AFnmCeN
	 +KYZnwlJNyDrc9vbtTQS987/5PvdUY6mEMvr9pXF4c0oEZD/RBKveuS7iss4sNCLfCg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 99CD51F0156B;
	Tue, 24 Nov 2026 11:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795520764;
	bh=acZ5G+lisXcEu5RmYGpRLGH9S4UYMk+oTxoL3nhYKoU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=l3OvRFMt3SaCC5eU7W6jx8mDQz5Nubkvs9lzxWYZTBtzZjJA7pBZkl5dB0n+4WGGn
	 3Eox9lRDNVVzFE+YZTyKHbAng3RHXuflezh3gvD4B5Kl22S6vF/YA7e0IB7LtcPvN0
	 Ypy8cwifn88vVGFxgI7Pzc83ehUeD3q2mZhSOfofMTGtpqyurj4oTE1X8UtUGQhq/k
	 IeTLuxWWlnoFoCN63ByufjBY3uvTUBlpl1vFhgWeRLVvXpiova0dyw/7krVziQLXkW
	 6FaNs6kYT6R+up6wYMs0VoCj14N1UTOVsPV6OvcCRVSD57wxTIrTp810HC6E9wHGAn
	 +wSuR53pVMvtg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 497A04CA1B;
	Tue, 24 Nov 2026 11:45:28 +0000 (UTC)
From: Sai Sree Kartheek Adivi via B4 Relay <devnull+s-adivi.ti.com@kernel.org>
Date: Tue, 24 Nov 2026 17:15:15 +0530
Subject: [PATCH v13 13/20] drivers: soc: ti: k3-ringacc: handle absence of
 tisci
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261124-dma-upstream-v13-v13-13-bd4251fdc6d4@ti.com>
References: <20261124-dma-upstream-v13-v13-0-bd4251fdc6d4@ti.com>
In-Reply-To: <20261124-dma-upstream-v13-v13-0-bd4251fdc6d4@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>, 
 Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 sebin.francis@ti.com, Sai Sree Kartheek Adivi <s-adivi@ti.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795520724; l=11619;
 i=s-adivi@ti.com; s=20261124; h=from:subject:message-id;
 bh=RjpH58LQn/sIqsaO0zS7uBAOD+lV6jEHfbvDLrpoGhM=;
 b=+yqHTDrbmw1uw9Zfodr7aEgsvBQDbIJxb4IP9vIfVjjqabO7DwBdsUr6EFVtneoBLJIt8qqGL
 HznDpNlGsZ2BJXDmHT00QWgty6hLGKaBsde+EUDjJ1Igar3UtxMLDT0
X-Developer-Key: i=s-adivi@ti.com; a=ed25519;
 pk=EtOwVxmXDuYMgw3DqFtPDBpf8ZvbO89w1fJm4w5yPI8=
X-Endpoint-Received: by B4 Relay for s-adivi@ti.com/20261124 with
 auth_id=1627
X-Original-From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
Reply-To: s-adivi@ti.com
Content-Transfer-Encoding: 7bit

From: Sai Sree Kartheek Adivi <s-adivi@ti.com>

Handle absence of tisci with direct register writes. This will support
platforms that do not have tisci firmware like AM62L.

Reviewed-by: Vignesh Raghavendra <vigneshr@ti.com>
Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/soc/ti/k3-ringacc.c       | 209 ++++++++++++++++++++++++++++++++++----
 include/linux/soc/ti/k3-ringacc.h |  18 ++++
 2 files changed, 208 insertions(+), 19 deletions(-)

diff --git a/drivers/soc/ti/k3-ringacc.c b/drivers/soc/ti/k3-ringacc.c
index 8c5f685e10f68..8094bb821f5f9 100644
--- a/drivers/soc/ti/k3-ringacc.c
+++ b/drivers/soc/ti/k3-ringacc.c
@@ -7,6 +7,7 @@
 
 #include <linux/dma-mapping.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
@@ -46,6 +47,53 @@ struct k3_ring_rt_regs {
 	u32	hwindx;
 };
 
+#define K3_RINGACC_RT_CFG_REGS_OFS	0x40
+#define K3_DMARING_CFG_ADDR_HI_MASK	GENMASK(3, 0)
+#define K3_DMARING_CFG_ASEL_SHIFT	16
+#define K3_DMARING_CFG_SIZE_MASK	GENMASK(15, 0)
+
+/**
+ * struct k3_ring_cfg_regs - The RA Configuration Registers region
+ *
+ * @ba_lo: Ring Base Address Low Register
+ * @ba_hi: Ring Base Address High Register
+ * @size: Ring Size Register
+ */
+struct k3_ring_cfg_regs {
+	u32	ba_lo;
+	u32	ba_hi;
+	u32	size;
+};
+
+#define K3_RINGACC_RT_INT_REGS_OFS		0x140
+#define K3_RINGACC_RT_INT_ENABLE_SET_COMPLETE	BIT(0)
+#define K3_RINGACC_RT_INT_ENABLE_SET_TR			BIT(2)
+
+/**
+ * struct k3_ring_intr_regs {
+ *
+ * @enable_set: Ring Interrupt Enable Register
+ * @resv_1: Reserved
+ * @clr: Ring Interrupt Clear Register
+ * @resv_2: Reserved
+ * @status_set: Ring Interrupt Status Set Register
+ * @resv_3: Reserved
+ * @status: Ring Interrupt Status Register
+ * @resv_4: Reserved
+ * @status_masked: Ring Interrupt Status Masked Register
+ */
+struct k3_ring_intr_regs {
+	u32	enable_set;
+	u32	resv_1;
+	u32	clr;
+	u32	resv_2;
+	u32	status_set;
+	u32	resv_3;
+	u32	status;
+	u32	resv_4;
+	u32	status_masked;
+};
+
 #define K3_RINGACC_RT_REGS_STEP			0x1000
 #define K3_DMARING_RT_REGS_STEP			0x2000
 #define K3_DMARING_RT_REGS_REVERSE_OFS		0x1000
@@ -139,6 +187,8 @@ struct k3_ring_state {
  * struct k3_ring - RA Ring descriptor
  *
  * @rt: Ring control/status registers
+ * @cfg: Ring config registers
+ * @intr: Ring interrupt registers
  * @fifos: Ring queues registers
  * @proxy: Ring Proxy Datapath registers
  * @ring_mem_dma: Ring buffer dma address
@@ -158,6 +208,8 @@ struct k3_ring_state {
  */
 struct k3_ring {
 	struct k3_ring_rt_regs __iomem *rt;
+	struct k3_ring_cfg_regs __iomem *cfg;
+	struct k3_ring_intr_regs __iomem *intr;
 	struct k3_ring_fifo_regs __iomem *fifos;
 	struct k3_ringacc_proxy_target_regs  __iomem *proxy;
 	dma_addr_t	ring_mem_dma;
@@ -467,15 +519,49 @@ static void k3_ringacc_ring_reset_sci(struct k3_ring *ring)
 	struct k3_ringacc *ringacc = ring->parent;
 	int ret;
 
-	ring_cfg.nav_id = ringacc->tisci_dev_id;
-	ring_cfg.index = ring->ring_id;
-	ring_cfg.valid_params = TI_SCI_MSG_VALUE_RM_RING_COUNT_VALID;
-	ring_cfg.count = ring->size;
+	/*
+	 * The register-poll path below uses the atomic poll variant because
+	 * this function can be called from atomic context (e.g. K3 UDMA V2's
+	 * autopair-timeout cleanup, which runs under uc->vc.lock, including
+	 * from hardirq context). This is only safe because K3 UDMA V2 never
+	 * sets ringacc->tisci, so this function always takes this branch for
+	 * V2 callers. If V2 ever gains TI SCI firmware-managed ring support,
+	 * the branch below will need an atomic-safe path as well, since a
+	 * TI SCI mailbox RPC cannot be made non-sleeping.
+	 */
+	if (!ringacc->tisci) {
+		u32 reg;
+
+		if (!ring->cfg)
+			return;
+
+		reg = readl(&ring->cfg->size);
+		reg &= ~K3_DMARING_CFG_SIZE_MASK;
+		writel(reg, &ring->cfg->size);
+
+		ret = readl_poll_timeout_atomic(&ring->cfg->size, reg,
+						 !(reg & K3_DMARING_CFG_SIZE_MASK),
+						 1, 100);
+		if (ret) {
+			dev_err(ringacc->dev, "ring %d size clear timeout\n",
+				ring->ring_id);
+			return;
+		}
 
-	ret = ringacc->tisci_ring_ops->set_cfg(ringacc->tisci, &ring_cfg);
-	if (ret)
-		dev_err(ringacc->dev, "TISCI reset ring fail (%d) ring_idx %d\n",
-			ret, ring->ring_id);
+		reg = readl(&ring->cfg->size);
+		reg |= ring->size;
+		writel(reg, &ring->cfg->size);
+	} else {
+		ring_cfg.nav_id = ringacc->tisci_dev_id;
+		ring_cfg.index = ring->ring_id;
+		ring_cfg.valid_params = TI_SCI_MSG_VALUE_RM_RING_COUNT_VALID;
+		ring_cfg.count = ring->size;
+
+		ret = ringacc->tisci_ring_ops->set_cfg(ringacc->tisci, &ring_cfg);
+		if (ret)
+			dev_err(ringacc->dev, "TISCI reset ring fail (%d) ring_idx %d\n",
+				ret, ring->ring_id);
+	}
 }
 
 void k3_ringacc_ring_reset(struct k3_ring *ring)
@@ -501,6 +587,9 @@ static void k3_ringacc_ring_reconfig_qmode_sci(struct k3_ring *ring,
 	ring_cfg.valid_params = TI_SCI_MSG_VALUE_RM_RING_MODE_VALID;
 	ring_cfg.mode = mode;
 
+	if (!ringacc->tisci)
+		return;
+
 	ret = ringacc->tisci_ring_ops->set_cfg(ringacc->tisci, &ring_cfg);
 	if (ret)
 		dev_err(ringacc->dev, "TISCI reconf qmode fail (%d) ring_idx %d\n",
@@ -576,10 +665,40 @@ static void k3_ringacc_ring_free_sci(struct k3_ring *ring)
 	ring_cfg.index = ring->ring_id;
 	ring_cfg.valid_params = TI_SCI_MSG_VALUE_RM_ALL_NO_ORDER;
 
-	ret = ringacc->tisci_ring_ops->set_cfg(ringacc->tisci, &ring_cfg);
-	if (ret)
-		dev_err(ringacc->dev, "TISCI ring free fail (%d) ring_idx %d\n",
-			ret, ring->ring_id);
+	if (!ringacc->tisci) {
+		u32 reg;
+
+		writel(K3_RINGACC_RT_INT_ENABLE_SET_COMPLETE | K3_RINGACC_RT_INT_ENABLE_SET_TR,
+		       &ring->intr->clr);
+
+		reg = readl(&ring->cfg->size);
+		reg &= ~K3_DMARING_CFG_SIZE_MASK;
+		writel(reg, &ring->cfg->size);
+
+		ret = readl_poll_timeout(&ring->cfg->size, reg,
+					  !(reg & K3_DMARING_CFG_SIZE_MASK),
+					  1, 100);
+		if (ret) {
+			dev_err(ringacc->dev, "ring %d size clear timeout\n",
+				ring->ring_id);
+			return;
+		}
+
+		reg = readl(&ring->cfg->size);
+		reg |= ring_cfg.count & K3_DMARING_CFG_SIZE_MASK;
+
+		writel(reg, &ring->cfg->size);
+
+		writel(ring_cfg.addr_lo, &ring->cfg->ba_lo);
+		writel((ring_cfg.addr_hi & K3_DMARING_CFG_ADDR_HI_MASK) +
+				(ring_cfg.asel << K3_DMARING_CFG_ASEL_SHIFT),
+				&ring->cfg->ba_hi);
+	} else {
+		ret = ringacc->tisci_ring_ops->set_cfg(ringacc->tisci, &ring_cfg);
+		if (ret)
+			dev_err(ringacc->dev, "TISCI ring free fail (%d) ring_idx %d\n",
+				ret, ring->ring_id);
+	}
 }
 
 int k3_ringacc_ring_free(struct k3_ring *ring)
@@ -670,15 +789,36 @@ int k3_ringacc_get_ring_irq_num(struct k3_ring *ring)
 }
 EXPORT_SYMBOL_GPL(k3_ringacc_get_ring_irq_num);
 
+u32 k3_ringacc_ring_get_irq_status(struct k3_ring *ring)
+{
+	struct k3_ringacc *ringacc = ring->parent;
+	struct k3_ring *fwd_ring = &ringacc->rings[ring->ring_id];
+
+	if (!fwd_ring->intr)
+		return 0;
+
+	return readl(&fwd_ring->intr->status);
+}
+EXPORT_SYMBOL_GPL(k3_ringacc_ring_get_irq_status);
+
+void k3_ringacc_ring_clear_irq(struct k3_ring *ring, u32 status)
+{
+	struct k3_ringacc *ringacc = ring->parent;
+	struct k3_ring *fwd_ring = &ringacc->rings[ring->ring_id];
+
+	if (!fwd_ring->intr)
+		return;
+
+	writel(status, &fwd_ring->intr->status);
+}
+EXPORT_SYMBOL_GPL(k3_ringacc_ring_clear_irq);
+
 static int k3_ringacc_ring_cfg_sci(struct k3_ring *ring)
 {
 	struct ti_sci_msg_rm_ring_cfg ring_cfg = { 0 };
 	struct k3_ringacc *ringacc = ring->parent;
 	int ret;
 
-	if (!ringacc->tisci)
-		return -EINVAL;
-
 	ring_cfg.nav_id = ringacc->tisci_dev_id;
 	ring_cfg.index = ring->ring_id;
 	ring_cfg.valid_params = TI_SCI_MSG_VALUE_RM_ALL_NO_ORDER;
@@ -689,6 +829,24 @@ static int k3_ringacc_ring_cfg_sci(struct k3_ring *ring)
 	ring_cfg.size = ring->elm_size;
 	ring_cfg.asel = ring->asel;
 
+	if (!ringacc->tisci) {
+		u32 reg;
+
+		writel(ring_cfg.addr_lo, &ring->cfg->ba_lo);
+		writel((ring_cfg.addr_hi & K3_DMARING_CFG_ADDR_HI_MASK) +
+				(ring_cfg.asel << K3_DMARING_CFG_ASEL_SHIFT),
+				&ring->cfg->ba_hi);
+
+		reg = readl(&ring->cfg->size);
+		reg &= ~K3_DMARING_CFG_SIZE_MASK;
+		reg |= ring_cfg.count & K3_DMARING_CFG_SIZE_MASK;
+
+		writel(reg, &ring->cfg->size);
+		writel(K3_RINGACC_RT_INT_ENABLE_SET_COMPLETE | K3_RINGACC_RT_INT_ENABLE_SET_TR,
+		       &ring->intr->enable_set);
+		return 0;
+	}
+
 	ret = ringacc->tisci_ring_ops->set_cfg(ringacc->tisci, &ring_cfg);
 	if (ret)
 		dev_err(ringacc->dev, "TISCI config ring fail (%d) ring_idx %d\n",
@@ -1347,6 +1505,11 @@ static int k3_ringacc_probe_dt(struct k3_ringacc *ringacc)
 		return PTR_ERR(ringacc->rm_gp_range);
 	}
 
+	if (!IS_ENABLED(CONFIG_TI_SCI_INTA_MSI_DOMAIN)) {
+		dev_err(dev, "TI_SCI_INTA_MSI_DOMAIN is required for a DT-probed ringacc with ti,sci\n");
+		return -ENODEV;
+	}
+
 	return ti_sci_inta_msi_domain_alloc_irqs(ringacc->dev,
 						 ringacc->rm_gp_range);
 }
@@ -1481,9 +1644,12 @@ struct k3_ringacc *k3_ringacc_dmarings_init(struct platform_device *pdev,
 
 	mutex_init(&ringacc->req_lock);
 
-	base_rt = devm_platform_ioremap_resource_byname(pdev, "ringrt");
-	if (IS_ERR(base_rt))
-		return ERR_CAST(base_rt);
+	base_rt = data->base_rt;
+	if (!base_rt) {
+		base_rt = devm_platform_ioremap_resource_byname(pdev, "ringrt");
+		if (IS_ERR(base_rt))
+			return ERR_CAST(base_rt);
+	}
 
 	ringacc->rings = devm_kzalloc(dev,
 				      sizeof(*ringacc->rings) *
@@ -1499,6 +1665,10 @@ struct k3_ringacc *k3_ringacc_dmarings_init(struct platform_device *pdev,
 		struct k3_ring *ring = &ringacc->rings[i];
 
 		ring->rt = base_rt + K3_DMARING_RT_REGS_STEP * i;
+		ring->cfg = base_rt + K3_RINGACC_RT_CFG_REGS_OFS +
+			    K3_DMARING_RT_REGS_STEP * i;
+		ring->intr = base_rt + K3_RINGACC_RT_INT_REGS_OFS +
+			     K3_DMARING_RT_REGS_STEP * i;
 		ring->parent = ringacc;
 		ring->ring_id = i;
 		ring->proxy_id = K3_RINGACC_PROXY_NOT_USED;
@@ -1512,7 +1682,8 @@ struct k3_ringacc *k3_ringacc_dmarings_init(struct platform_device *pdev,
 		ring->flags = K3_RING_FLAG_REVERSE;
 	}
 
-	ringacc->tisci_ring_ops = &ringacc->tisci->ops.rm_ring_ops;
+	if (ringacc->tisci)
+		ringacc->tisci_ring_ops = &ringacc->tisci->ops.rm_ring_ops;
 
 	dev_info(dev, "Number of rings: %u\n", ringacc->num_rings);
 
diff --git a/include/linux/soc/ti/k3-ringacc.h b/include/linux/soc/ti/k3-ringacc.h
index 7b7fc237c08f5..2a9b7834bc430 100644
--- a/include/linux/soc/ti/k3-ringacc.h
+++ b/include/linux/soc/ti/k3-ringacc.h
@@ -156,6 +156,23 @@ u32 k3_ringacc_get_ring_id(struct k3_ring *ring);
  */
 int k3_ringacc_get_ring_irq_num(struct k3_ring *ring);
 
+/**
+ * k3_ringacc_ring_get_irq_status - Get the irq status for the ring
+ * @ring: pointer on ring
+ *
+ * Returns the interrupt status
+ */
+u32 k3_ringacc_ring_get_irq_status(struct k3_ring *ring);
+
+/**
+ * k3_ringacc_ring_clear_irq - Clear the given interrupts
+ * @ring: pointer on ring
+ * @status: mask of interrupt status bits to clear
+ *
+ * Clears only the interrupt status bits set in @status on the ring
+ */
+void k3_ringacc_ring_clear_irq(struct k3_ring *ring, u32 status);
+
 /**
  * k3_ringacc_ring_cfg - ring configure
  * @ring: pointer on ring
@@ -263,6 +280,7 @@ struct k3_ringacc_init_data {
 	const struct ti_sci_handle *tisci;
 	u32 tisci_dev_id;
 	u32 num_rings;
+	void __iomem *base_rt;
 };
 
 struct k3_ringacc *k3_ringacc_dmarings_init(struct platform_device *pdev,

-- 
2.55.0


