Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=37.205.14.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795179236;
	b=K7fTyFpUl2ReKfwRND7c3UxKUwMJjBlysmWXQ7DARcbsCbqbC41alhKMHrOicjD4rl6c
	 OVGGtRV7f2Rbk3HM/SEYLV97fsU1vQkUeVTdAPneI1iUflPf88sf9rzC/hphHWFMcEYKt
	 FnAxdx+2WWArOaU9piIaeft9GPuXQ55XzMj3GbOZEbvXRHtXUhc8o9wbt/EYbvlxOPBmm
	 c9RJN5McJE0K3tqNWcKwF4RRRKfCs3sxv8bSHv7561ez+jJjTHfnc/4RsRXl0EAKj5sWq
	 IkaUrHPQ6fEgD1I7Lr5/lUipBRd27+x4eR/kFoDLKsS+sc2VAakRAAlVh4pomW3gblA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795179236;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=FVNcZFH3sWpGRZ+k3Rd2tVmsx/IUq+wOHkO6uFmzgRE=;
	b=nqKMhIObwAPPNGmjtiUK7Sw/JEGq+X0EIRhbOJVPdZ8LIpzXWxi1lvT//07vbvJnxKTQ
	 +Be0En/fhp/FRufWL/R14A1kB/HFwrNFLV+0QwiuyftaZ9DR07fdm7XlIAyPEIJV5jC3N
	 kuA43+V2wAnTSV6mRvfZ5Elr29N3HbUo5idTy/k+FcNpqURj0nNk+io5I+2uCnXXZ9Xx1
	 JerOOOGfHWWDvfrzNMbbC1poP4V01FA/4IRZuerUQ0HvPfVdUXtM8nDsCJQfilme+7yzC
	 jYMMdaT1vaYhqKQ07F4a++QdB3Suf5X4xoEdzUpu/F1eA1ig7rlxhWcck6F8bMgMwaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gpxsee.org;
	spf=pass smtp.mailfrom=gpxsee.org;
	arc=none smtp.remote-ip=37.205.14.76
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED18860A260D
	for <dmaengine@vger.kernel.org>; Fri, 20 Nov 2026 12:53:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED18860A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gpxsee.org
Received: from localhost (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id DECE2B92A9;
	Fri, 20 Nov 2026 13:53:40 +0100 (CET)
From: tumic@gpxsee.org
To: Lizhi Hou <lizhi.hou@amd.com>,
	Brian Xu <brian.xu@amd.com>,
	Raj Kumar Rampelli <raj.kumar.rampelli@amd.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Michal Simek <michal.simek@amd.com>
Cc: =?UTF-8?q?Martin=20T=C5=AFma?= <martin.tuma@digiteqautomotive.com>,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] dmaengine: xilinx: xdma: Fix broken PM suspend/resume
Date: Fri, 20 Nov 2026 13:52:53 +0100
Message-ID: <20261120125254.8678-1-tumic@gpxsee.org>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Martin Tůma <martin.tuma@digiteqautomotive.com>

Add the missing PM suspend/resume callbacks that properly reconfigure
the XDMA HW on PCIe suspend/resume.

Signed-off-by: Martin Tůma <martin.tuma@digiteqautomotive.com>
---
 drivers/dma/xilinx/xdma.c | 102 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/drivers/dma/xilinx/xdma.c b/drivers/dma/xilinx/xdma.c
index 9d827c9a1267..779a5f4b9db7 100644
--- a/drivers/dma/xilinx/xdma.c
+++ b/drivers/dma/xilinx/xdma.c
@@ -398,6 +398,27 @@ static int xdma_xfer_stop(struct xdma_chan *xchan)
 			    CHAN_CTRL_RUN_STOP);
 }
 
+/**
+ * xdma_reconfig_channels - Reconfigure DMA channels
+ * @xdev: DMA device pointer
+ * @chans: channels configuration
+ */
+static int xdma_reconfig_channels(struct xdma_device *xdev,
+				  struct xdma_chan *chans,
+				  u32 chan_num)
+{
+	int i, ret;
+
+	for (i = 0; i < chan_num; i++) {
+		/* init channel hardware */
+		ret = xdma_channel_init(&(chans[i]));
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 /**
  * xdma_alloc_channels - Detect and allocate DMA channels
  * @xdev: DMA device pointer
@@ -1018,6 +1039,45 @@ static int xdma_set_vector_reg(struct xdma_device *xdev, u32 vec_tbl_start,
 	return 0;
 }
 
+/**
+ * xdma_irq_reconfig - Reconfigure IRQs
+ * @xdev: DMA device pointer
+ */
+static int xdma_irq_reconfig(struct xdma_device *xdev)
+{
+	u32 user_irq_start;
+	int ret;
+
+	/* config hardware IRQ registers */
+	ret = xdma_set_vector_reg(xdev, XDMA_IRQ_CHAN_VEC_NUM, 0,
+				  XDMA_CHAN_NUM(xdev));
+	if (ret) {
+		xdma_err(xdev, "failed to set channel vectors: %d", ret);
+		return ret;
+	}
+
+	/* config user IRQ registers if needed */
+	user_irq_start = XDMA_CHAN_NUM(xdev);
+	if (xdev->irq_num > user_irq_start) {
+		ret = xdma_set_vector_reg(xdev, XDMA_IRQ_USER_VEC_NUM,
+					  user_irq_start,
+					  xdev->irq_num - user_irq_start);
+		if (ret) {
+			xdma_err(xdev, "failed to set user vectors: %d", ret);
+			return ret;
+		}
+	}
+
+	/* enable interrupt */
+	ret = regmap_write(xdev->rmap, XDMA_IRQ_CHAN_INT_EN_W1S, ~0);
+	if (ret) {
+		xdma_err(xdev, "failed to enable interrupt: %d", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 /**
  * xdma_irq_init - initialize IRQs
  * @xdev: DMA device pointer
@@ -1297,15 +1357,57 @@ static int xdma_probe(struct platform_device *pdev)
 	return ret;
 }
 
+/**
+ * xdma_suspend - PM suspend callback
+ * @dev: XDMA device pointer
+ */
+static int xdma_suspend(struct device *dev)
+{
+	struct xdma_device *xdev = dev_get_drvdata(dev);
+
+	regmap_write(xdev->rmap, XDMA_IRQ_CHAN_INT_EN_W1C, ~0);
+
+	return 0;
+}
+
+/**
+ * xdma_resume - PM resume callback
+ * @dev: XDMA device pointer
+ */
+static int xdma_resume(struct device *dev)
+{
+	struct xdma_device *xdev = dev_get_drvdata(dev);
+	int ret;
+
+	ret = xdma_reconfig_channels(xdev, xdev->h2c_chans, xdev->h2c_chan_num);
+	if (ret) {
+		xdma_err(xdev, "H2C channels reconfiguration failed: %d", ret);
+		return ret;
+	}
+
+	ret = xdma_reconfig_channels(xdev, xdev->c2h_chans, xdev->c2h_chan_num);
+	if (ret) {
+		xdma_err(xdev, "C2H channels reconfiguration failed: %d", ret);
+		return ret;
+	}
+
+	return xdma_irq_reconfig(xdev);
+}
+
 static const struct platform_device_id xdma_id_table[] = {
 	{ "xdma", 0},
 	{ },
 };
 MODULE_DEVICE_TABLE(platform, xdma_id_table);
 
+static const struct dev_pm_ops xdma_dev_pm_ops = {
+	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(xdma_suspend, xdma_resume)
+};
+
 static struct platform_driver xdma_driver = {
 	.driver		= {
 		.name = "xdma",
+		.pm = &xdma_dev_pm_ops,
 	},
 	.id_table	= xdma_id_table,
 	.probe		= xdma_probe,

base-commit: 65e4fd942f72a9dba0e4e257290c4fa1aa756854
-- 
2.56.1

