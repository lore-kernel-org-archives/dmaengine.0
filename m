Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=37.205.14.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795190388;
	b=JM3tBfo87fllW6sRFSHf0bP6jcjoZIY0j5f2PJQhW0GlfutASCazh0vpjLJc/hcmlZta
	 M90KzWQKIAgLqS7fmf/V7okoZ/UX+BiSRPtayL3GdSbdgZ9MMxqrDB1N236iBBPf3+T9Q
	 ifsyodN+bPzg7prlBs3hyOj/8K9qMFu93axt8kujKhmKdDQ3yYeoXnFk9QT9y7KDBPWnF
	 gJnKbXTcQZecefd+UGgQfuak+G0yQAqJpwGxLfND5Z/raE46PzkDehVaCpwP0cOzWrzPk
	 DYncDZ7acRlL4eNNyLn+c2aFFuAq3rezlcNesoIubeHncXPKLvax23LY3mu/0PEXWgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190388;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=5amxxkWZu2fGCtqq582emH0FMPYZaZc+suM06ZaTiL0=;
	b=A6VsO6vZrtWEqldYhYAhQ9/CmfUyYydMueovcTMy5alb86A4gFKb7QXHOG7h8Dfd1iNY
	 tJM0RNQhPryFmCMhrzaLlhgyy31JDlDZrMMPn/jGRm78QGS47+v7tox9L3dGCa8ZWJno2
	 4SLt+uiUmcKO8hYuMrW0j0oe08Gb7chDn+upZjPABw+ERCJs67q2yE5NWvWf15qRQXGFK
	 3siaMhFxI/ePnpkXYQryEWBeSxnt5LWYKcZBFSS8rnLRcMiErw6JirkmomCT0QeSdu4Xe
	 zX4V1slln0u26mGaqBlyZHTA1A7Ao7whuX0IICEBKOfjMDZVACWUJPZzxGt7qow/YKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gpxsee.org;
	spf=pass smtp.mailfrom=gpxsee.org;
	arc=none smtp.remote-ip=37.205.14.76
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A878606A320
	for <dmaengine@vger.kernel.org>; Fri, 20 Nov 2026 15:59:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A878606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gpxsee.org
Received: from localhost (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id 5D3A7B931F;
	Fri, 20 Nov 2026 16:59:41 +0100 (CET)
From: tumic@gpxsee.org
To: Lizhi Hou <lizhi.hou@amd.com>,
	Brian Xu <brian.xu@amd.com>,
	Raj Kumar Rampelli <raj.kumar.rampelli@amd.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Michal Simek <michal.simek@amd.com>
Cc: dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	=?UTF-8?q?Martin=20T=C5=AFma?= <martin.tuma@digiteqautomotive.com>
Subject: [PATCH v2 1/1] dmaengine: xilinx: xdma: Fix broken PM suspend/resume
Date: Fri, 20 Nov 2026 16:59:24 +0100
Message-ID: <20261120155924.5785-2-tumic@gpxsee.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120155924.5785-1-tumic@gpxsee.org>
References: <20261120155924.5785-1-tumic@gpxsee.org>
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
 drivers/dma/xilinx/xdma.c | 121 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 121 insertions(+)

diff --git a/drivers/dma/xilinx/xdma.c b/drivers/dma/xilinx/xdma.c
index 9d827c9a1267..fa006c9bae23 100644
--- a/drivers/dma/xilinx/xdma.c
+++ b/drivers/dma/xilinx/xdma.c
@@ -123,6 +123,7 @@ struct xdma_desc {
  * @irq_start: Start IRQ assigned to device
  * @irq_num: Number of IRQ assigned to device
  * @status: Initialization status
+ * @pm_usr_irq: User IRQ vector storage for PM suspend/resume
  */
 struct xdma_device {
 	struct platform_device	*pdev;
@@ -135,6 +136,7 @@ struct xdma_device {
 	u32			irq_start;
 	u32			irq_num;
 	u32			status;
+	u32			pm_usr_irq;
 };
 
 #define xdma_err(xdev, fmt, args...)					\
@@ -398,6 +400,28 @@ static int xdma_xfer_stop(struct xdma_chan *xchan)
 			    CHAN_CTRL_RUN_STOP);
 }
 
+/**
+ * xdma_reconfig_channels - Reconfigure DMA channels
+ * @xdev: DMA device pointer
+ * @chans: channels configuration
+ * @chan_num: number of channels
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
@@ -1018,6 +1042,53 @@ static int xdma_set_vector_reg(struct xdma_device *xdev, u32 vec_tbl_start,
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
+	/* reconfigure hardware IRQ registers */
+	ret = xdma_set_vector_reg(xdev, XDMA_IRQ_CHAN_VEC_NUM, 0,
+				  XDMA_CHAN_NUM(xdev));
+	if (ret) {
+		xdma_err(xdev, "failed to reset channel vectors: %d", ret);
+		return ret;
+	}
+
+	/* reconfigure user IRQ registers if needed */
+	user_irq_start = XDMA_CHAN_NUM(xdev);
+	if (xdev->irq_num > user_irq_start) {
+		ret = xdma_set_vector_reg(xdev, XDMA_IRQ_USER_VEC_NUM,
+					  user_irq_start,
+					  xdev->irq_num - user_irq_start);
+		if (ret) {
+			xdma_err(xdev, "failed to reset user vectors: %d", ret);
+			return ret;
+		}
+	}
+
+	/* reenable channels interrupts */
+	ret = regmap_write(xdev->rmap, XDMA_IRQ_CHAN_INT_EN_W1S, ~0);
+	if (ret) {
+		xdma_err(xdev, "failed to reenable channel IRQs: %d", ret);
+		return ret;
+	}
+
+	/* reenable user interrupts */
+	ret = regmap_write(xdev->rmap, XDMA_IRQ_USER_INT_EN_W1S,
+			   xdev->pm_usr_irq);
+	if (ret) {
+		xdma_err(xdev, "failed to reenable user IRQs: %d", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 /**
  * xdma_irq_init - initialize IRQs
  * @xdev: DMA device pointer
@@ -1297,15 +1368,65 @@ static int xdma_probe(struct platform_device *pdev)
 	return ret;
 }
 
+/**
+ * xdma_suspend - PM suspend callback
+ * @dev: XDMA device pointer
+ */
+static int xdma_suspend(struct device *dev)
+{
+	struct xdma_device *xdev = dev_get_drvdata(dev);
+	int ret;
+
+	ret = regmap_read(xdev->rmap, XDMA_IRQ_USER_INT_EN,
+			  &xdev->pm_usr_irq);
+	if (ret) {
+		xdma_err(xdev, "User IRQ vector backup failed: %d", ret);
+		return ret;
+	}
+
+	ret = regmap_write(xdev->rmap, XDMA_IRQ_CHAN_INT_EN_W1C, ~0);
+	if (ret)
+		xdma_err(xdev, "DMA channels IRQ disable failed: %d", ret);
+
+	return ret;
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
 
+static DEFINE_NOIRQ_DEV_PM_OPS(xdma_dev_pm_ops, xdma_suspend, xdma_resume);
+
 static struct platform_driver xdma_driver = {
 	.driver		= {
 		.name = "xdma",
+		.pm = pm_sleep_ptr(&xdma_dev_pm_ops),
 	},
 	.id_table	= xdma_id_table,
 	.probe		= xdma_probe,
-- 
2.56.1

