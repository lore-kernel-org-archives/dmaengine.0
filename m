Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023120.outbound.protection.outlook.com [52.101.127.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0E23E3142;
	Mon,  7 Sep 2026 03:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788752055; cv=fail; b=QSAMTao843qHudjJHFvcvN92nGlcGYTGbGHTGviwrxBAEMbMj/ptT1sa7ENhStaefVJ1UxWPR12WxA2WKTsW1OtQSLwD97o378LCt+D21znvReiTt0SOb1nQnKqwP/rzGag+32Mw51kTxUMDXjb8XwXAs1nH/wEvJtzpDvqX3wM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788752055; c=relaxed/simple;
	bh=xGPHKspXCWUzuXfEXdNbzf0LSqeAqBhjTjkaf0H/NgE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mKFiY1MEVAy3MVTpB2XR+XjQrLBM8Cx1ujTQ1HNUqN5aQJz/+wzVyrysZh8V4dsiKI4RgODVV+mwytyYSJFD0pcSXH/aW/sM4WtaEpEuWQ4rh+e5UcS/opmV7WmV7C5x2h+5dkL0KqZCXLkJlcetZbzh8JYaGJzAUEAX+IBUung=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.127.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d/9M+b7LW43qbY9b6IB688cQsvtjL0x/uxb7V78Ee8ILmhg5ATuKg129UAnsNjIR6USemLtfKTWqXbjH9/kX5oq+xvwK6lnHWum89hK3KjieoHziOJ7o11rqSiw9YLd8GSxAE1dcnp2aOZLihptc3YKUKTBEtZ7Ww52pY/PS/l3Alx+ArRRTjJroFNCZXWSUJL+gwZJGImAF+wp+D7KqIyJxnuBFxxLLYN9/CeJcnAlZiVrNw78x3g5tk35YEPozJzql+GUKh+AnFswa9XYCFKGucBd1AbgDGkAZhHTZX109+CFkD+RlVe8bR+q2v4V8M4IeBdZWqGzsmpLgN6+uzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=32h7kaFDH9bKyGuq6yDC3cYC1YNKmY64gfPaV2O7y3I=;
 b=WESMkWKRTPpB/xJ0Ijcq9tof5V8T78VyjggzqmNXELfNueEzQYwvGrbDIdFChNHJlOO5QT3EnSixBnX/KjtC06fwnOUM6+QcNIBp5ZKeoQxkQD1k8EiToCCKt22qoxbFMj6WJUWr5H5QOgv8CxEzQhpt9I5HxM0mi0SwwqkBgxKevUo+DhszMT27aspr7XL5c12EV8V8GL+pSODp9k6Uwy5E74NQcXI3/hGlHikWkuqeA2Sp/kKVSvjKFPbHaeVL5fnpKcPuB879WmZIpbQJcLNTD/9JceHKPvtleg3A4tzXIBuwx1c9SOoWaqJezsq3eGegaFzCuWqPDUNisk+G2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYCP301CA0058.JPNP301.PROD.OUTLOOK.COM (2603:1096:400:384::7)
 by SEZPR06MB5810.apcprd06.prod.outlook.com (2603:1096:101:ab::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 03:34:10 +0000
Received: from TY2PEPF0000AB89.apcprd03.prod.outlook.com
 (2603:1096:400:384:cafe::54) by TYCP301CA0058.outlook.office365.com
 (2603:1096:400:384::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Mon, 7
 Sep 2026 03:34:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB89.mail.protection.outlook.com (10.167.253.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Mon, 7 Sep 2026 03:34:08 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 1C5B8409211A;
	Mon,  7 Sep 2026 11:34:07 +0800 (CST)
From: Jelly Jia <Jelly.Jia@cixtech.com>
To: vkoul@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	Frank.Li@kernel.org,
	robin.murphy@arm.com,
	cix-kernel-upstream@cixtech.com,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jelly Jia <Jelly.Jia@cixtech.com>
Subject: [PATCH v1 4/5] dmaengine: cix-sky1-dma350: Add Sky1 integration driver
Date: Mon,  7 Sep 2026 11:34:03 +0800
Message-ID: <20260907033404.596839-5-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907033404.596839-1-Jelly.Jia@cixtech.com>
References: <20260907033404.596839-1-Jelly.Jia@cixtech.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB89:EE_|SEZPR06MB5810:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: cc477239-43a7-49ca-6fb3-08df0c90e108
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|7416014|376014|82310400026|23010399003|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	8PTcHV+CbaZzuyXgco4UwIEHBRj8iBUUm17HqknwTFoz+rZz80HwqEUuyZn3nqYhyzQ7GkYoEMlHDaU1BgkWqXQesHWHTNQaVLs2SL1BkCihPhyUL2duf+SpQgGTjXDYFTA0OPpRUYyWINYbvmyZhs2nku/eP8Dsq3AIX/QGu5WbnS/trI4iFXXRYC/sryYvuBhMq7TzhG8xfJ4oJWUCfkTc04QdYnecp0B33dB68P4/bLzOVQVwbzolg++e/UGWX1DZHWzlzDZ9fMB/7wiAXapUOT2NxNBCQEAB0Tg65Zg2mf+ZfwotEN4WnZgYedkbwKkDVEV+qtXiplI4htwdqf6hLq/MIEVVF+Cn+taoUqIjukIP81tVZDOkhm8D7YIt24OzAkwfJIWDJhi9Q0Vswig5keoomWF28EdZohM9zmaoK64UwfasCWhmgDJQBR7Gd40PruyApe/WuaeLvREx6jB3O17Ob8JajN3yW4CM8y8CPqDzImAwM7l8ldzgFB9pFfpjtMFbJWBQTGJn5j1qRWfarzlhOlql7ACsZlNf/IzRZWpukTqJWoUgpNrRhZkVCrtcNDHEQwYteoV4tjVhA0pwX4uDiGlsJIYmxkcJK5bE1OcbNcAyIv5Oam/iSt7gQnc2dV9bRw0nsgebycSjbVySS5B7ccZqfKsiVqo+Q6xkVhl4i03pXZz/+T8NF3yRVLbemIIj03begAYwbKC7TA==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(7416014)(376014)(82310400026)(23010399003)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	//9KtMRkC2wZBt5lKgryCvjrYaSBj4aKX3O8qXCMUFu1vJn1BOSJ93spRAcUcTvieV0ICVseeJIBndikt6aMvgJ4bOP4Ym9PUulehpkrJaslXZF3dOtxDt+y6ixR5/kok0NVUsGL8D00IjXnOqt01argH826HsrvmvTRAsq1Y0S71uCloDIeLZ9vPDUDv7iej21H0BfYUMrr3nv2EGBYCKRCf8cdBSkKP8mhkMpRolX9Hhk05fCo8SJxDSMYMsEnuxUDQ/JahQLJ8gOm6VOW/GC7G8CagqHw+7nnAnwy+u0UNh1rEmnVEf5UFkHRSdZ6iZWo02iGtii6ROZvGz+CGyTcvZz92SoyVbhuyRNIb78sfBOj0YeBHJGYq9xva7mtGtvWmT5BOGqCOw6zjwWIzUQgQV325lGM34jH9w+xaEMrKpiOwF+4xKJmZ2oDBORY
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 03:34:08.5646
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc477239-43a7-49ca-6fb3-08df0c90e108
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB89.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5810

Add a CIX Sky1 integration driver for Arm DMA-350 instances.

The driver manages clocks, reset, optional interrupt routing, optional
reserved memory attachment, and populates the child Arm DMA-350
controller.

Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
---
 MAINTAINERS                   |   1 +
 drivers/dma/Kconfig           |  15 +++
 drivers/dma/Makefile          |   1 +
 drivers/dma/cix-sky1-dma350.c | 206 ++++++++++++++++++++++++++++++++++
 4 files changed, 223 insertions(+)
 create mode 100644 drivers/dma/cix-sky1-dma350.c

diff --git a/MAINTAINERS b/MAINTAINERS
index feff8f9ecb2b..8d972fe2c994 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2828,6 +2828,7 @@ F:	Documentation/devicetree/bindings/arm/cix.yaml
 F:	Documentation/devicetree/bindings/dma/cix,sky1-dma350.yaml
 F:	Documentation/devicetree/bindings/mailbox/cix,sky1-mbox.yaml
 F:	arch/arm64/boot/dts/cix/
+F:	drivers/dma/cix-sky1-dma350.c
 F:	drivers/mailbox/cix-mailbox.c
 K:	\bcix\b
 
diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
index ae6a682c9f76..51c881dfa6d3 100644
--- a/drivers/dma/Kconfig
+++ b/drivers/dma/Kconfig
@@ -147,6 +147,21 @@ config DMA_BCM2835
 	select DMA_ENGINE
 	select DMA_VIRTUAL_CHANNELS
 
+config CIX_SKY1_DMA350
+	tristate "CIX Sky1 DMA-350 integration support"
+	depends on OF && ARM_DMA350
+	depends on OF_RESERVED_MEM
+	depends on ARCH_CIX || COMPILE_TEST
+	default ARCH_CIX
+	select MFD_SYSCON
+	help
+	  Enable support for the CIX Sky1 integration around Arm
+	  DMA-350 controllers.
+
+	  This driver owns SoC integration resources such as clocks, resets,
+	  reserved memory attachment, and interrupt routing registers, while the
+	  child controller is handled by the generic Arm DMA-350 driver.
+
 config DMA_JZ4780
 	tristate "JZ4780 DMA support"
 	depends on MIPS || COMPILE_TEST
diff --git a/drivers/dma/Makefile b/drivers/dma/Makefile
index 14aa086629d5..a69964251f68 100644
--- a/drivers/dma/Makefile
+++ b/drivers/dma/Makefile
@@ -23,6 +23,7 @@ obj-$(CONFIG_AT_XDMAC) += at_xdmac.o
 obj-$(CONFIG_AXI_DMAC) += dma-axi-dmac.o
 obj-$(CONFIG_BCM_SBA_RAID) += bcm-sba-raid.o
 obj-$(CONFIG_DMA_BCM2835) += bcm2835-dma.o
+obj-$(CONFIG_CIX_SKY1_DMA350) += cix-sky1-dma350.o
 obj-$(CONFIG_DMA_JZ4780) += dma-jz4780.o
 obj-$(CONFIG_DMA_SA11X0) += sa11x0-dma.o
 obj-$(CONFIG_DMA_SUN4I) += sun4i-dma.o
diff --git a/drivers/dma/cix-sky1-dma350.c b/drivers/dma/cix-sky1-dma350.c
new file mode 100644
index 000000000000..5904453f3481
--- /dev/null
+++ b/drivers/dma/cix-sky1-dma350.c
@@ -0,0 +1,206 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * CIX Sky1 DMA-350 integration driver
+ */
+
+#include <linux/clk.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/platform_device.h>
+#include <linux/pm.h>
+#include <linux/regmap.h>
+#include <linux/reset.h>
+
+#define SKY1_DMA350_CRU_DMAC_AP_IRQ	0x54
+#define SKY1_DMA350_IRQ_ROUTE_MASK	0xff
+
+struct cix_sky1_dma350 {
+	struct clk_bulk_data *clks;
+	struct reset_control *reset;
+	struct regmap *irq_router;
+	struct device *rmem_dev;
+	int num_clks;
+};
+
+static int cix_sky1_dma350_route_irqs(struct device *dev)
+{
+	struct cix_sky1_dma350 *data = dev_get_drvdata(dev);
+
+	if (!data->irq_router)
+		return 0;
+
+	return regmap_update_bits(data->irq_router,
+				  SKY1_DMA350_CRU_DMAC_AP_IRQ,
+				  SKY1_DMA350_IRQ_ROUTE_MASK,
+				  SKY1_DMA350_IRQ_ROUTE_MASK);
+}
+
+static int cix_sky1_dma350_enable_resources(struct device *dev)
+{
+	struct cix_sky1_dma350 *data = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_bulk_prepare_enable(data->num_clks, data->clks);
+	if (ret)
+		return ret;
+
+	ret = reset_control_reset(data->reset);
+	if (ret)
+		goto err_disable_clks;
+
+	ret = cix_sky1_dma350_route_irqs(dev);
+	if (ret)
+		goto err_disable_clks;
+
+	return 0;
+
+err_disable_clks:
+	clk_bulk_disable_unprepare(data->num_clks, data->clks);
+	return ret;
+}
+
+static void cix_sky1_dma350_disable_resources(struct device *dev)
+{
+	struct cix_sky1_dma350 *data = dev_get_drvdata(dev);
+
+	reset_control_assert(data->reset);
+	clk_bulk_disable_unprepare(data->num_clks, data->clks);
+}
+
+static int cix_sky1_dma350_attach_reserved_mem(struct device *dev)
+{
+	struct cix_sky1_dma350 *data = dev_get_drvdata(dev);
+	struct platform_device *child_pdev;
+	struct device_node *child_np;
+	int ret;
+
+	if (!of_property_present(dev->of_node, "memory-region"))
+		return 0;
+
+	child_np = of_get_compatible_child(dev->of_node, "arm,dma-350");
+	if (!child_np)
+		return -ENODEV;
+
+	child_pdev = of_find_device_by_node(child_np);
+	of_node_put(child_np);
+	if (!child_pdev)
+		return -EPROBE_DEFER;
+
+	/*
+	 * Reserved memory is attached after the child has probed. This relies
+	 * on arm-dma350 not allocating coherent command buffers in probe;
+	 * those allocations happen per descriptor at prep time.
+	 */
+	ret = of_reserved_mem_device_init_by_idx(&child_pdev->dev,
+						 dev->of_node, 0);
+	if (ret) {
+		put_device(&child_pdev->dev);
+		return ret;
+	}
+
+	data->rmem_dev = &child_pdev->dev;
+
+	return 0;
+}
+
+static void cix_sky1_dma350_release_reserved_mem(struct device *dev)
+{
+	struct cix_sky1_dma350 *data = dev_get_drvdata(dev);
+
+	if (data->rmem_dev) {
+		of_reserved_mem_device_release(data->rmem_dev);
+		put_device(data->rmem_dev);
+		data->rmem_dev = NULL;
+	}
+}
+
+static int cix_sky1_dma350_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct cix_sky1_dma350 *data;
+	int ret;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, data);
+
+	data->num_clks = devm_clk_bulk_get_all(dev, &data->clks);
+	if (data->num_clks < 0)
+		return dev_err_probe(dev, data->num_clks,
+				     "failed to get clocks\n");
+
+	data->reset = devm_reset_control_get_optional_exclusive(dev, NULL);
+	if (IS_ERR(data->reset))
+		return dev_err_probe(dev, PTR_ERR(data->reset),
+				     "failed to get reset\n");
+
+	data->irq_router = syscon_regmap_lookup_by_phandle_optional(dev->of_node,
+								    "cix,irq-router");
+	if (IS_ERR(data->irq_router))
+		return dev_err_probe(dev, PTR_ERR(data->irq_router),
+				     "failed to get IRQ router\n");
+
+	ret = cix_sky1_dma350_enable_resources(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to enable resources\n");
+
+	ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
+	if (ret)
+		goto err_disable_resources;
+
+	ret = cix_sky1_dma350_attach_reserved_mem(dev);
+	if (ret)
+		goto err_depopulate;
+
+	return 0;
+
+err_depopulate:
+	of_platform_depopulate(dev);
+err_disable_resources:
+	cix_sky1_dma350_disable_resources(dev);
+	return dev_err_probe(dev, ret, "failed to initialize child devices\n");
+}
+
+static void cix_sky1_dma350_remove(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+
+	of_platform_depopulate(dev);
+	cix_sky1_dma350_release_reserved_mem(dev);
+	cix_sky1_dma350_disable_resources(dev);
+}
+
+static int __maybe_unused cix_sky1_dma350_resume_noirq(struct device *dev)
+{
+	return cix_sky1_dma350_route_irqs(dev);
+}
+
+static const struct dev_pm_ops cix_sky1_dma350_pm = {
+	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(NULL, cix_sky1_dma350_resume_noirq)
+};
+
+static const struct of_device_id cix_sky1_dma350_of_match[] = {
+	{ .compatible = "cix,sky1-dma350" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, cix_sky1_dma350_of_match);
+
+static struct platform_driver cix_sky1_dma350_driver = {
+	.probe = cix_sky1_dma350_probe,
+	.remove = cix_sky1_dma350_remove,
+	.driver = {
+		.name = "cix-sky1-dma350",
+		.of_match_table = cix_sky1_dma350_of_match,
+		.pm = pm_sleep_ptr(&cix_sky1_dma350_pm),
+	},
+};
+module_platform_driver(cix_sky1_dma350_driver);
+
+MODULE_AUTHOR("Jelly Jia <Jelly.Jia@cixtech.com>");
+MODULE_DESCRIPTION("CIX Sky1 DMA-350 integration driver");
+MODULE_LICENSE("GPL");
-- 
2.54.0

