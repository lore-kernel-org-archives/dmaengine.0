Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=37.205.14.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795195465;
	b=ilG1pE30vyTE3mILzYZ4icy4zgLVqZa/X0I3gC9DAelMCfJHsIlpiP8u6+dagWFqD2Yc
	 qT9KG8nznT1Kugfj2HC/lwJZJduhX+f7mJjFHbnhZr+oD756JHoEz12qsEsMiErWYAd62
	 hqlgfEGWjC6lrrkNFtVwGNKo0Vv/GY7sIaCHbUSURKuIWbX46VbxTCWfxVRHoY51kh26e
	 GVp6wBBe/wJNlh42ognJfzIJijy5VPA67VkjaxTJ04rbQ0UzsFyVeZn2IHQatO1CnbFRE
	 rAiQEgekS1Bu32fTt7Ws5EUwIvZRF4ZxXc0/VZ8KEdjyCBovHWMacWZK+qSXo1ZEB7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795195465;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=fw6HIaLUqYOLkgYhQl2HDTow8Vcw/13Jd4x/Iu29Xgw=;
	b=LZ6/U+IAV5qMDHV+wCWpJT0wOciKkrOtsHWE8U15JPUrz1b5CcN8vsDgGnI+iFcwUitu
	 Md11VM+DOmcKH//s4IafAiaKfYhJ4gGnI/a2yt2pbgokUSLWj7pgW9boxtLV2jR9Eu6vg
	 SNhvuR/d+HO8nFyNqIaf626iXMF8zyCaHlsVSH01FVVLC5C6Xuct56WDzEYX11H0lHi+o
	 0rfnFDG4SyhhrfAPbGQQ555PUBCA6FaqFcKG3JaiZuLPTdF9nMUMJDEfrh8DtcbUwCslO
	 u3JZ25TJX6AyTT3WkWC//AAQMfNasrnBQbgF6ISWzgiTnmuY+6W11OYsuo2q2MTeMqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gpxsee.org;
	spf=pass smtp.mailfrom=gpxsee.org;
	arc=none smtp.remote-ip=37.205.14.76
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C426606A334
	for <dmaengine@vger.kernel.org>; Fri, 20 Nov 2026 17:24:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C426606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gpxsee.org
Received: from localhost (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id D55BFC04E2;
	Fri, 20 Nov 2026 18:24:21 +0100 (CET)
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
Subject: [PATCH v3 1/1] dmaengine: xilinx: xdma: Fix broken PM suspend/resume
Date: Fri, 20 Nov 2026 18:23:56 +0100
Message-ID: <20261120172356.5858-2-tumic@gpxsee.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120172356.5858-1-tumic@gpxsee.org>
References: <20261120172356.5858-1-tumic@gpxsee.org>
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
 drivers/dma/xilinx/xdma.c | 147 ++++++++++++++++++++++++++++++++------
 1 file changed, 124 insertions(+), 23 deletions(-)

diff --git a/drivers/dma/xilinx/xdma.c b/drivers/dma/xilinx/xdma.c
index 9d827c9a1267..d6772b38d8f7 100644
--- a/drivers/dma/xilinx/xdma.c
+++ b/drivers/dma/xilinx/xdma.c
@@ -123,6 +123,7 @@ struct xdma_desc {
  * @irq_start: Start IRQ assigned to device
  * @irq_num: Number of IRQ assigned to device
  * @status: Initialization status
+ * @usr_irq_mask: User IRQ mask for PM suspend/resume
  */
 struct xdma_device {
 	struct platform_device	*pdev;
@@ -135,6 +136,7 @@ struct xdma_device {
 	u32			irq_start;
 	u32			irq_num;
 	u32			status;
+	u32			usr_irq_mask;
 };
 
 #define xdma_err(xdev, fmt, args...)					\
@@ -398,6 +400,27 @@ static int xdma_xfer_stop(struct xdma_chan *xchan)
 			    CHAN_CTRL_RUN_STOP);
 }
 
+/**
+ * xdma_reconfig_channels - Reconfigure DMA channels
+ * @xdev: DMA device pointer
+ * @chans: channels configuration
+ * @chan_num: number of channels
+ */
+static int xdma_reconfig_channels(struct xdma_chan *chans,
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
@@ -1018,6 +1041,55 @@ static int xdma_set_vector_reg(struct xdma_device *xdev, u32 vec_tbl_start,
 	return 0;
 }
 
+/**
+ * xdma_irq_config - Configure IRQs
+ * @xdev: DMA device pointer
+ */
+static int xdma_irq_config(struct xdma_device *xdev)
+{
+	u32 user_irq_start;
+	int ret;
+
+	/* configure hardware IRQ registers */
+	ret = xdma_set_vector_reg(xdev, XDMA_IRQ_CHAN_VEC_NUM, 0,
+				  XDMA_CHAN_NUM(xdev));
+	if (ret) {
+		xdma_err(xdev, "failed to set channel vectors: %d", ret);
+		return ret;
+	}
+
+	/* configure user IRQ registers if needed */
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
+	/* enable channels interrupts */
+	ret = regmap_write(xdev->rmap, XDMA_IRQ_CHAN_INT_EN_W1S, ~0);
+	if (ret) {
+		xdma_err(xdev, "failed to enable channel IRQs: %d", ret);
+		return ret;
+	}
+
+	/* enable user interrupts if needed */
+	if (xdev->irq_num > user_irq_start) {
+		ret = regmap_write(xdev->rmap, XDMA_IRQ_USER_INT_EN_W1S,
+				   xdev->usr_irq_mask);
+		if (ret) {
+			xdma_err(xdev, "failed to enable user IRQs: %d", ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
 /**
  * xdma_irq_init - initialize IRQs
  * @xdev: DMA device pointer
@@ -1025,7 +1097,6 @@ static int xdma_set_vector_reg(struct xdma_device *xdev, u32 vec_tbl_start,
 static int xdma_irq_init(struct xdma_device *xdev)
 {
 	u32 irq = xdev->irq_start;
-	u32 user_irq_start;
 	int i, j, ret;
 
 	/* return failure if there are not enough IRQs */
@@ -1060,28 +1131,8 @@ static int xdma_irq_init(struct xdma_device *xdev)
 		irq++;
 	}
 
-	/* config hardware IRQ registers */
-	ret = xdma_set_vector_reg(xdev, XDMA_IRQ_CHAN_VEC_NUM, 0,
-				  XDMA_CHAN_NUM(xdev));
-	if (ret) {
-		xdma_err(xdev, "failed to set channel vectors: %d", ret);
-		goto failed_init_c2h;
-	}
-
-	/* config user IRQ registers if needed */
-	user_irq_start = XDMA_CHAN_NUM(xdev);
-	if (xdev->irq_num > user_irq_start) {
-		ret = xdma_set_vector_reg(xdev, XDMA_IRQ_USER_VEC_NUM,
-					  user_irq_start,
-					  xdev->irq_num - user_irq_start);
-		if (ret) {
-			xdma_err(xdev, "failed to set user vectors: %d", ret);
-			goto failed_init_c2h;
-		}
-	}
-
-	/* enable interrupt */
-	ret = regmap_write(xdev->rmap, XDMA_IRQ_CHAN_INT_EN_W1S, ~0);
+	/* configure all HW IRQ registers */
+	ret = xdma_irq_config(xdev);
 	if (ret)
 		goto failed_init_c2h;
 
@@ -1297,15 +1348,65 @@ static int xdma_probe(struct platform_device *pdev)
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
+			  &xdev->usr_irq_mask);
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
+	ret = xdma_reconfig_channels(xdev->h2c_chans, xdev->h2c_chan_num);
+	if (ret) {
+		xdma_err(xdev, "H2C channels reconfiguration failed: %d", ret);
+		return ret;
+	}
+
+	ret = xdma_reconfig_channels(xdev->c2h_chans, xdev->c2h_chan_num);
+	if (ret) {
+		xdma_err(xdev, "C2H channels reconfiguration failed: %d", ret);
+		return ret;
+	}
+
+	return xdma_irq_config(xdev);
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

