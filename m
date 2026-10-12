Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022139.outbound.protection.outlook.com [52.101.126.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2006944F546;
	Mon, 12 Oct 2026 08:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791794525; cv=fail; b=ci9RyVJpuqspGLk/UCcODpJKKTEIRjBcfqvF44NThiioqpf2WtxLFBzCzQHT807WQ9wHswzHg5CyLPBSUlTUUOa9fEcvYf5lYTwDPZnWOBATxkoYd5z42UprLO8jX+l7f6Xy0fVMhaLtGwz88hqAeweJUtYFfj4AE2JINpwabXU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791794525; c=relaxed/simple;
	bh=jeYZg6fYkoNlVjkesoZerxRD92gTs+mIKcd9DnP7WK8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gDyn1UNii9BcySWkd52AsN7XAIkz00P4lzLB5Vn/1XHgkl84YyIsBK4Y2xAoSepbbIi2b0HE7FnE2pqvxQp/3YoDqjtqXBqHLi96SysWSZJ+jt7pjC+lOp9ve80s3b05sJAZ2qhNZyObksshy/pen3EYtjeHNPAxCsIk2uD5tb4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.126.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qYaqdERGLMQyu5rre6b5DX2mb/NVtfVOqKPHvkd8ZtKbp9Zaig2UiRFefM/QPSMufvDDHfO7/oz9tvRbcbH/6l68lnligD4C0o3J5uf7wfzTKigLc1+1he0VGYoh5kQGcQRSidd8enzHJ4lvIzptm+SbVoS1vufP5KBNnemoz3F459c4H1iK6ck9nXASnmkf9kD4J3TyzSJaQhVrWUA4VdGVUSwUKzUkzAk3D5ktgKBWsWlifb0T8ZuutVNmD+mQ6/GXJ6qJYW3HAlIY1DKWsDCo+8h4FCWkFWkDAZC+XOrRiK1U1IqAFfNQnOy5BFgAEsDHTjId1Nq5eYpJdZmT3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c+2AYfY5786NYA3+kTy9fqJHr1BbdGes8nvS15ATHUk=;
 b=BAfk7lCVIcvEEi3RNyTZI1nR7oz78Tb8Pi6qz1vVywPqBMxCG1C0fXUor5VLrsFsFvdLZZEEjroTiQ/puGndGcVdfLkLvcrQ5ehXjG3W/B1NWdW6Lu8UnS64CgYt5p65VrI+fCU4Jm4W3Rtx82102I+Lj/rty1T1sdr2vy76vox0S8Suv2IY11j9JcK8EOY7CL1OSC4dZd9CfHyB1vGh3Auv3q28UOClDkz2ixHcly6X/8HeuW9VsezN5+Sj2h8AJUcYJ3ljdHhBYQXZdYNUmUu1A5eHwl/AQMuVvTZ2AxrFCcRnECYDdaJWUUmD5EYzNDgGU6XxA6s03FQBadFGpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI1PR02CA0002.apcprd02.prod.outlook.com (2603:1096:4:1f7::16)
 by SEYPR06MB6662.apcprd06.prod.outlook.com (2603:1096:101:176::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 08:42:00 +0000
Received: from SG1PEPF000082E8.apcprd02.prod.outlook.com
 (2603:1096:4:1f7:cafe::13) by SI1PR02CA0002.outlook.office365.com
 (2603:1096:4:1f7::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Mon, 12
 Oct 2026 08:42:00 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E8.mail.protection.outlook.com (10.167.240.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 12 Oct 2026 08:41:59 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 1E92940920F6;
	Mon, 12 Oct 2026 16:41:58 +0800 (CST)
From: Jelly Jia <Jelly.Jia@cixtech.com>
To: vkoul@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robin.murphy@arm.com
Cc: devicetree@vger.kernel.org,
	Frank.Li@kernel.org,
	cix-kernel-upstream@cixtech.com,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jelly.Jia@cixtech.com
Subject: [PATCH v3 5/6] dmaengine: arm-dma350: Support integration clocks, resets and reserved memory
Date: Mon, 12 Oct 2026 16:41:54 +0800
Message-ID: <20261012084155.2547480-6-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261012084155.2547480-1-Jelly.Jia@cixtech.com>
References: <20261012084155.2547480-1-Jelly.Jia@cixtech.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E8:EE_|SEYPR06MB6662:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f70b6205-10e5-4787-c856-08df283caebb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|376014|1800799024|7416014|6133799003|18002099003|22082099003|10067099003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	CSQ9mU8flix9eDW5UftT/JTIsqSnGvcE2YsMuDOFMzYSzObc3GCm75zYL9GDe6CkXoh1fihfSC/LsDkWxYppV9CJyvO0NiBK0DkRVezrWorYOxOmN9jCq0M2MyHMbkWjVF4HsWDQuds8WFVKUEUIDE0hCrFqC1/Z0hqD+U4VafoYOxDXwaLyVIxQ3Z41aRCWUK1pgxznWIXio5DQmpHtRKVXS9i5nK3RYheqyJXHAJwE06CZ/bPesVHLTSluqMs1Sdn2WOs2ViK9GnqzYLr7PFwRCg+7fv7hq6pY+c4+j7LkBzToXTcSP+WgUAXZN3EIWfwVL82h+h69gXIpAn404S/S8nYoajs5MCLXIZImQ5HTXXJXPXnF3avn3+wOvvkcsco0WcDyxC/WgHNk5LzDERc/4J1gOf8ZdEvIOpOhCu+QEq2tL8xjX44OZWK+naO659+cGSV7KeIu8KKhdfUxLAyI/pORrUXG6w4+yrXDj1oZnGMSCyCZ1s7tlxxW7HQs4LvZH2+JSzM/5uMkkk/SQWtv+Yv13rxSqJC6V/kt4wQ18GtcWjk6osdS+tEwj5UtMTrVlK+UARGdwye+dyYPrqxWWrn+SwkSPIYkse+gzN8lRHwF/oNz7wX241zkR7ZIOJ9J7HmsOjzi0aYVIi10IcErtL0FPTlFrs3Ee7jipFFzz8nbZguaQHLFwJ671giFVIX/oGrl1bnuM2BAA1MUJw==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(376014)(1800799024)(7416014)(6133799003)(18002099003)(22082099003)(10067099003)(261009223027099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nxBnHm/jVIaeWOF0WWFEsT4y2WvPdp27ZLKLhtYeruVTlw9dhx5S/AORNkX3h8Anbob23AS7tNBnNFbsvAmqBNJhXVQSf7nARouf39k9egQtpy12eC0ZX2RQZEniQhtNU4XZ/a23J8gXpFgwr0/j3jXNA0RqKH7z+BunX1DGCs80rgV+VFqqQpDjbGTR2EDMymEHrKSI2FB/jQKnmIX10ol3s0MqTHUpYBa9c/h5cIiPEEPhowGpqB/J01YG0CEQFN8dIMnessVBoosb5K2nnCtYcHfDcEBoAMeoAGawBt9lb2y5B1RvRIGxyC+qmayUHqpOuzm4yD6khuJbOlaeCHPZn8XqEh0Xg+0akilLt/mlHGkYYga+nTFkU7ti3DX7Ei5qcil7rQsl3WNwkgU/GXhuIzDq2BD22WeatruE/IUWxjt4lIvct3yAT+HdBszs
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 08:41:59.9827
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f70b6205-10e5-4787-c856-08df283caebb
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG1PEPF000082E8.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6662

SoC integrations of the DMA-350 gate the controller with a clock and may
hold it in reset until the driver brings it up, and a DMA master which
cannot reach all of system memory may have a reserved memory region
attached to it. Bring the controller up with these resources: enable
the clock, release the reset, and attach the reserved memory region when
the device tree provides one.

The integration is described entirely by the device tree; the driver
contains no SoC-specific code.

v2 -> v3:
- The patch no longer carries CIX Sky1 match data, the interrupt router
  handling or the system resume hook: the Sky1 interrupt gate is set up
  by the boot firmware and is not configured by Linux.
- of_reserved_mem_device_release() is now also called when the DMA
  device or the OF DMA controller registration fails.

Assisted-by: LLM checkpatch sparse dt_binding_check dtbs_check
Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
---
 drivers/dma/arm-dma350.c | 35 +++++++++++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/arm-dma350.c b/drivers/dma/arm-dma350.c
index 79bd6a04ea0c..d811a0dc9fe9 100644
--- a/drivers/dma/arm-dma350.c
+++ b/drivers/dma/arm-dma350.c
@@ -4,14 +4,17 @@
 
 #include <linux/bitfield.h>
 #include <linux/bitops.h>
+#include <linux/clk.h>
 #include <linux/dmaengine.h>
 #include <linux/dma-mapping.h>
 #include <linux/io.h>
 #include <linux/of.h>
 #include <linux/of_dma.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/module.h>
 #include <linux/overflow.h>
 #include <linux/platform_device.h>
+#include <linux/reset.h>
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
 
@@ -1139,12 +1142,28 @@ static void d350_free_chan_resources(struct dma_chan *chan)
 static int d350_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	struct reset_control *reset;
+	struct clk *clk;
 	struct d350 *dmac;
 	void __iomem *base;
 	u32 reg;
 	int ret, nchan, dw, aw, r, p;
 	bool coherent, memset;
 
+	clk = devm_clk_get_optional_enabled(dev, NULL);
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk),
+				     "failed to enable clock\n");
+
+	reset = devm_reset_control_get_optional_exclusive(dev, NULL);
+	if (IS_ERR(reset))
+		return dev_err_probe(dev, PTR_ERR(reset),
+				     "failed to get reset\n");
+
+	ret = reset_control_reset(reset);
+	if (ret)
+		return ret;
+
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
@@ -1251,15 +1270,26 @@ static int d350_probe(struct platform_device *pdev)
 		dmac->dma.device_prep_dma_memset = d350_prep_memset;
 	}
 
+	if (of_property_present(dev->of_node, "memory-region")) {
+		ret = of_reserved_mem_device_init(dev);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "failed to attach reserved memory\n");
+	}
+
 	platform_set_drvdata(pdev, dmac);
 
 	ret = dma_async_device_register(&dmac->dma);
-	if (ret)
-		return dev_err_probe(dev, ret, "Failed to register DMA device\n");
+	if (ret) {
+		of_reserved_mem_device_release(dev);
+		return dev_err_probe(dev, ret,
+				     "Failed to register DMA device\n");
+	}
 
 	ret = of_dma_controller_register(dev->of_node, d350_of_xlate, dmac);
 	if (ret) {
 		dma_async_device_unregister(&dmac->dma);
+		of_reserved_mem_device_release(dev);
 		return dev_err_probe(dev, ret,
 				     "Failed to register OF DMA controller\n");
 	}
@@ -1273,6 +1303,7 @@ static void d350_remove(struct platform_device *pdev)
 
 	of_dma_controller_free(pdev->dev.of_node);
 	dma_async_device_unregister(&dmac->dma);
+	of_reserved_mem_device_release(&pdev->dev);
 }
 
 static const struct of_device_id d350_of_match[] __maybe_unused = {
-- 
2.54.0

