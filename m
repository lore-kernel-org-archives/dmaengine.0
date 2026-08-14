Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010053.outbound.protection.outlook.com [40.93.198.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585F83612EF;
	Fri, 14 Aug 2026 04:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786683400; cv=fail; b=B9sLxhRNVNQUINTZ3RmlXrRa8TRoXRDHu1XxD3cUiqR0GRFaRVY2JzzOmsmAGuZMFDguQrqfaPyTKiZTBEdJSZcuYRr6dvQwevoeWOw6Jz2o5IK4BmOpL3ESM7WDZSqak/1A9STZq0ocY+SU5hVdX8DZnmE8WeBo/RSIWeyrIEs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786683400; c=relaxed/simple;
	bh=LhKmY8uQ9iWRwoEAEsLRgzdDIecSCwWcsDwBA6zY+k0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TYvsfl5z/3krXtslAurSkZKpe7OhaQ8A9LQF/UqqbDOWvv2nudl+gWYzG1qJUnVpIGqC4F/TF9yUh2HN3Lq2yyXPhGM5Y3HuugPM60qlyy9uaco5I8pAvpzfS7cwcXizPKs2Xt4zJGztGN44soTRi8QeescFwVsKwozf/BI7AFM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4BqSdTQQ; arc=fail smtp.client-ip=40.93.198.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4BqSdTQQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t+nyb/9So5PfxWCVYN79I2xgTPU9tAh9oJwYvxQn/96OSGu6DCq1ZdpfunhB/ttqJKy0ethRbs3L+I2YO2IWjOswZpO8df7h+lepOAlBEMKYy8I3ykJepn9X/iJfUlaFlRVE6xVh5H0OYWkjUojH26/6Kuec9aGUcenixFVqAT7mQugEFi69+jNyuAhne0Wf6ClFQVoDag2CPQDRvTcvUQ34N1d9wECZ+RsNud2AT61YdUyESqDejG5yVU9Zhq+JBZi1qC+v/Od6d9OTRhPudOH9mTZ7e/n7SexBwNi0TASMkkqRxerkdYopQok6tA3kYo+NHrEYcE/r5FcbROXi5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FD95NEgSPfRUx4uogB4xp9929ZyFC+gQ+3iUJOuVITY=;
 b=PcUNf554Dkv1M2lZ+x+FrFQ4XMGPSE1snfa6v/whl4lS6uy+fYPJ6sjRe0wZa6eKlWUSOpRpAyuhDy9e78JOKrRr/vzvQKH05TCWQ1A6s2hXNTz8GouoGXCxaWKf/iIT6XfIDibVJNzSVhtQSBr9H21GDnb39FW4qzj59qxOfjlNtJfzBFbnbyS7/hx0KjF2MfX7t3u+RHPMTtw0wXh3Mi8PAlx5Ph7l2fps7a/dOkDrLNDmBJbFa34kMOHmWZn4F+oPWru8wTzy/Ap06+pgLt9xNHEKIqWVpzjjmeId2Wb5mToj6Zedg0ovGe11GQin/euOgX1w/HOH1g0HEo94zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FD95NEgSPfRUx4uogB4xp9929ZyFC+gQ+3iUJOuVITY=;
 b=4BqSdTQQlOR3iIY7LUz2Kfu3iPdTLWEeVj0gutmdQFQrjNZYqEbwgSZ/wOZL8yY2Maw7Ef+7EJvAXKLP73MZ7xhvd481Sg9VQhvgSU3+g6OAefAoZga7iYek/81qeAaFeMPEXG5Uddbpa5EMtr0ht802oHCn4RZyQW4I3trj1Cs=
Received: from BN0PR08CA0012.namprd08.prod.outlook.com (2603:10b6:408:142::34)
 by MW4PR12MB7031.namprd12.prod.outlook.com (2603:10b6:303:1ef::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Fri, 14 Aug
 2026 04:56:35 +0000
Received: from BN2PEPF000044A0.namprd02.prod.outlook.com
 (2603:10b6:408:142:cafe::19) by BN0PR08CA0012.outlook.office365.com
 (2603:10b6:408:142::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.15 via Frontend Transport; Fri,
 14 Aug 2026 04:56:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF000044A0.mail.protection.outlook.com (10.167.243.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Fri, 14 Aug 2026 04:56:34 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 13 Aug
 2026 23:56:33 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 13 Aug
 2026 23:56:32 -0500
Received: from xhdappanad40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Thu, 13 Aug 2026 23:56:30 -0500
From: Golla Nagendra <nagendra.golla@amd.com>
To: <vkoul@kernel.org>, <Frank.Li@kernel.org>, <michal.simek@amd.com>
CC: <dmaengine@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, <nagendra.golla@amd.com>
Subject: [PATCH V2 3/8] dmaengine: zynqmp_dma: Fix chan probe/remove error handling
Date: Fri, 14 Aug 2026 10:26:11 +0530
Message-ID: <20260814045616.1661199-4-nagendra.golla@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260814045616.1661199-1-nagendra.golla@amd.com>
References: <20260814045616.1661199-1-nagendra.golla@amd.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A0:EE_|MW4PR12MB7031:EE_
X-MS-Office365-Filtering-Correlation-Id: d9839df1-9569-4aa1-4456-08def9c06a5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|23010399003|36860700016|376014|6133799003|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	gzS3flSh6v2sWaP/60kzPgNGYoBdWE3XV2ekMUgFpxZpuwGMQ/ohlkt7vA6xU6nN9YGQa9RBbE1WPG376juD+EFfYFMUgcgDH3Pp4A0Qgrs9XKIpea/AiK3ppJ2yoCcSKqyGInVwdTRFp9at+01mojXvo0MFE0SHdyrx+oV0FaCZbQbJj5/T50uyLVGxm1SyYZ6BNdLTyOPviyqhQpU/fiKCK31ZZ2OPjMbNVRPNaj5hyY8PdgntamETUaXlUz9MiWhLRReVSnLC6BLDzFoz6Fae7dyGbBSu3hgqwh7tyfBFSQOUeJi+HU6/mLkHXNCSYosjX4Enq65LkfQET0s1ZyYgNcNNrbM7i3NgzhHVnDzTfL/sLi6SrA2tbovfhX3RIkec0ZDR/5qu9xaR9XGIkXPLkM0FvT8wFXru5jz7mTytQbncfdT2/c5AFGWxjfVRSBkVaMNXPQZ45W/B4LB9vdqzw5TrkrcthZ0fCl5HoMod2VEJDQCWjP2ppqP+eqR1FdybVuKL1PkQvXXaJqK/7aydnajj8grHXHHCTFGDilPndcBmH/EwdU1s7pccjiydU3AJlqcoPNi2XfAvBqyonMyl1DednyKI8WDpDbPHXf3hpmm48FsYErOVsH7M528jUtjK1/dp7PQ4XZVhTNSdKsixbTBnkiP6ebjHIIE2omMLZNNJzMIWfFvQLsupBsuh6bEajc8iToSkE8bxKHLVdg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(36860700016)(376014)(6133799003)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	s7aAN05sJ6u5vew//Ye1uqW+Bv9H80cGi3VWXebBRrqOANO/oC5gAx5Xff174uKQgJ4JEkmrASsbm3+pJLQhMPcbVfPEop/Y1hghXtiZVvi0Lnx+whQ2/L1ugbJjq5rhRMU+9jMD00JC5wWWg4tbHHOIIYlZCbH6kaNDd6vINBL6GFPDmHiGRyoe0BJjHwJ9er6P6vaeJ3kYCTAz3quTDTVbiiJg9y3M5qPePlYwCR/VAuLYeDnLFPtY/pdbQdsxKwPIVaF5MIzOe914U80J2Ibb8yfyZY3d/5EyWuvETN1ZiDztL0hjM8FJ4mVanL4OA+mWzIZhSeUTUjJRpp2VL3zZJYVq5C21WRVT9yyVanHYjk6//EOCKjOZePE98AL7pfWV2Seili6/+FdfrWv2LJyk5GlGAJ7423H7lH1GqyWBOm3rZHDLMsk2eAWqMSNU
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 04:56:34.6232
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9839df1-9569-4aa1-4456-08def9c06a5c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7031

Keep the real platform_get_irq() error by returning ret directly, stage
IRQ setup via a local ret variable, and assign chan->irq only after
devm_request_irq() succeeds.

Initialize chan->irq to -1 and initialize chan->common.device_node
before it may be touched by teardown. In channel remove, free IRQ only
for valid IRQ numbers and delete the channel node only when it is linked.

Register the channel node only after successful IRQ setup. On channel
probe failure in zynqmp_dma_probe(), route cleanup through the existing
free_chan_resources teardown path.

Fixes: b0cc417c1637 ("dmaengine: Add Xilinx zynqmp dma engine driver support")
Signed-off-by: Golla Nagendra <nagendra.golla@amd.com>
---
changes in v2:
- Reworked probe failure cleanup to use the existing free_chan_resources teardown path instead of adding direct tasklet kill in the outer probe failure block
- Kept IRQ/list initialization and channel registration ordering fixes in this patch
---
 drivers/dma/xilinx/zynqmp_dma.c | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
index b7c561280694..22b517c57003 100644
--- a/drivers/dma/xilinx/zynqmp_dma.c
+++ b/drivers/dma/xilinx/zynqmp_dma.c
@@ -205,7 +205,7 @@ struct zynqmp_dma_desc_sw {
  * @desc_pool_p: Physical allocated descriptor base
  * @desc_free_cnt: Descriptor available count
  * @dev: The dma device
- * @irq: Channel IRQ
+ * @irq: Linux IRQ number, or -1 when not registered
  * @is_dmacoherent: Tells whether dma operations are coherent or not
  * @tasklet: Cleanup work after irq
  * @idle : Channel status;
@@ -896,10 +896,11 @@ static void zynqmp_dma_chan_remove(struct zynqmp_dma_chan *chan)
 	if (!chan)
 		return;
 
-	if (chan->irq)
+	if (chan->irq >= 0)
 		devm_free_irq(chan->zdev->dev, chan->irq, chan);
 	tasklet_kill(&chan->tasklet);
-	list_del(&chan->common.device_node);
+	if (!list_empty(&chan->common.device_node))
+		list_del(&chan->common.device_node);
 }
 
 /**
@@ -915,13 +916,14 @@ static int zynqmp_dma_chan_probe(struct zynqmp_dma_device *zdev,
 	struct zynqmp_dma_chan *chan;
 	struct device_node *node = pdev->dev.of_node;
 	const struct zynqmp_dma_config *match_data;
-	int err;
+	int err, ret;
 
 	chan = devm_kzalloc(zdev->dev, sizeof(*chan), GFP_KERNEL);
 	if (!chan)
 		return -ENOMEM;
 	chan->dev = zdev->dev;
 	chan->zdev = zdev;
+	chan->irq = -1;
 
 	chan->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(chan->regs))
@@ -954,22 +956,26 @@ static int zynqmp_dma_chan_probe(struct zynqmp_dma_device *zdev,
 	INIT_LIST_HEAD(&chan->pending_list);
 	INIT_LIST_HEAD(&chan->done_list);
 	INIT_LIST_HEAD(&chan->free_list);
+	INIT_LIST_HEAD(&chan->common.device_node);
 
 	dma_cookie_init(&chan->common);
 	chan->common.device = &zdev->common;
-	list_add_tail(&chan->common.device_node, &zdev->common.channels);
-
 	zynqmp_dma_init(chan);
-	chan->irq = platform_get_irq(pdev, 0);
-	if (chan->irq < 0)
-		return -ENXIO;
-	err = devm_request_irq(&pdev->dev, chan->irq, zynqmp_dma_irq_handler, 0,
+	ret = platform_get_irq(pdev, 0);
+	if (ret < 0)
+		return ret;
+
+	err = devm_request_irq(&pdev->dev, ret, zynqmp_dma_irq_handler, 0,
 			       "zynqmp-dma", chan);
 	if (err)
 		return err;
 
+	chan->irq = ret;
+
 	chan->desc_size = sizeof(struct zynqmp_dma_desc_ll);
 	chan->idle = true;
+	list_add_tail(&chan->common.device_node, &zdev->common.channels);
+
 	return 0;
 }
 
@@ -1134,7 +1140,7 @@ static int zynqmp_dma_probe(struct platform_device *pdev)
 	ret = zynqmp_dma_chan_probe(zdev, pdev);
 	if (ret) {
 		dev_err_probe(&pdev->dev, ret, "Probing channel failed\n");
-		goto err_disable_pm;
+		goto free_chan_resources;
 	}
 
 	p->dst_addr_widths = BIT(zdev->chan->bus_width / 8);
-- 
2.44.4

