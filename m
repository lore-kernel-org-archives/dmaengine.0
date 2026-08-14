Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010038.outbound.protection.outlook.com [52.101.56.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E8C35DA65;
	Fri, 14 Aug 2026 04:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786683402; cv=fail; b=YP6iilyb26UkVpiWhFvD1TR2n/0bYyyeTEBFkog47ZC4aXWpaHF6LAcadnh9J9/dXj9MkADJGGo3aWBfjP1e/Sefr/MRyK1ySQk6vAXvkaCR/DucDtEgUzSD5zXX8zy9snTud1Uer6KRlr6mp3LqB8UPiz5J61YS02NNdBftbzo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786683402; c=relaxed/simple;
	bh=tsJL8Y2ycYmCElfQvicp1NDETIwfrO+JD0T1eE0Aogo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AlqRAlV5U9f0o6RNhy0Bwjq4UGXBVM/Q9LCyR2pW9OiBHNOJt2zkX6IWwNmQ4dCLYZqkKHZX5WwgEiLYphRtHy41zEWJhFwO3SMVDZ9FT9LbYKtknRkXz09UidzcFEwyu4UTebzlE+q6/9JwONJVCDj4fun1ZW1I8Sp8XvtdnLY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=m6mHrvjP; arc=fail smtp.client-ip=52.101.56.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="m6mHrvjP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kwfZM3xCKy6DgCxDOgNf63yeuU9ihjc4RZrdTNu6E/fANvDos9YxWV9Hvd1TVauu40WvD3ur223aLVGbb8khSaGLaqH94wZqeotVJ8OTdGZ+F9wtEXpY+7ZNyUCLwGvehOVZKnvaqM7JgR+z8ZiiHxig+q74Fg0tB1o0Cbcl8ioz5v2b7jfZJttueMzaf4CvI+sYBff8G9RejznYOSIXwzwxicFXD44Xv/z7fDy13/P7CKFouAM+0ihvy9qRtL+0b2ZaZrLEu++zIdB7kl96wDte8VsYNS5x11DkuJxcAKCPnCV2XE1KVKJcpkP+EKixyyAx3T6tJSEejlgSavW/sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jvm1Wke/S0GmURkJ31/52raMZhorVEqB9/iGa0DqSA4=;
 b=W3BnHcTvj7SHWUrtGdr0Iz9zN0gbYNGE9Nqj8lALkB93E5wmZZLFFTGxTVgR6StQwnBmtHiPiLKgvJbCgYdvr/+tEes8XOSS8wXe+VWoFcKYKQnNQpco5X5xYuJpMrGy/MPjMh42R+5pyQ29ipybEIAAIDCrTC3oGcNYfvklJi/WpTrCNs6HXFwODCX+NqEtpW01XOyPXPfm3btjrTN5ytoeCM0zL8tBMf9kPUYmanYS7K2Jwyq6OLqhbhAkDwEGGZ4AFVE2ALWxwzcsgNSOJYsTBz84gE/sxxRLYVCo1YHA/5vv07vk+80o0k0im6ZtgUUNOA473OQNJRLKRylIeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jvm1Wke/S0GmURkJ31/52raMZhorVEqB9/iGa0DqSA4=;
 b=m6mHrvjPVc6LzbCR8oIej/1ElFVE4/aBIoUKvBIwFSQ67neiC0TJsjPMWpyVDrZykmDz2Nw7mCVhWYgoFNFmTJssx0TxB5gIh/aoVHeHrLpeJZbfm+hvpRad4YqXzGVig7gns2dL+JEDi0j2ogqs3wLwrhvcD44pPQ/dpDJwNsQ=
Received: from CH3P220CA0012.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1e8::32)
 by LV3PR12MB9165.namprd12.prod.outlook.com (2603:10b6:408:19f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Fri, 14 Aug
 2026 04:56:36 +0000
Received: from CH3PEPF00000012.namprd21.prod.outlook.com
 (2603:10b6:610:1e8:cafe::67) by CH3P220CA0012.outlook.office365.com
 (2603:10b6:610:1e8::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.16 via Frontend Transport; Fri,
 14 Aug 2026 04:56:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF00000012.mail.protection.outlook.com (10.167.244.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.0 via Frontend Transport; Fri, 14 Aug 2026 04:56:36 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 13 Aug
 2026 23:56:36 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 13 Aug
 2026 23:56:35 -0500
Received: from xhdappanad40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Thu, 13 Aug 2026 23:56:32 -0500
From: Golla Nagendra <nagendra.golla@amd.com>
To: <vkoul@kernel.org>, <Frank.Li@kernel.org>, <michal.simek@amd.com>
CC: <dmaengine@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, <nagendra.golla@amd.com>
Subject: [PATCH V2 4/8] dmaengine: zynqmp_dma: Fix stale kerneldoc comments
Date: Fri, 14 Aug 2026 10:26:12 +0530
Message-ID: <20260814045616.1661199-5-nagendra.golla@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000012:EE_|LV3PR12MB9165:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e0213ab-490c-4f21-adf0-08def9c06b74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|23010399003|376014|36860700016|22082099003|18002099003|56012099006|5023799004|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	S6A8/RjudkN+Wjzp43XglBpDQVTfeooCtoq0FzJfUtnQCkz4Xfb4UgxEajsPnnl2yoM5tnvT8zGa0DVDQ5/ITXefXfOA8Jj2p2NB6l9B/tEtn2VRKgrVLBquApMYjAIH3ewgm/a4vgjM/NkKgx1KmykYwarZaqa3z2gog2ZZLpya72ctIegH3hUfvgYUBk+fQvUPws5wsSmjht8KtBlwNWDK4asPTp7jkJ2VWcoeBX/u4+crE5HrZiuC2G9c4qtbsxMtcq6oRhuIFGXolSETMQTJ1z0xs2lpe0SQvmtM93Jqn9KZLFOa+uxWMkLXEHHdvzuM93SADxiyKd0dPA74g/WhUXAwDOuqnY8oQ0CPf2HZoaiAAIj10JYPxxdgNjLQ78ruen3VG5sFk+4DOfwmMV9Bhhq8tjunuLxk8Z0H83HZvAW8ANhOmd/+pt9ZQAf2cPD3PWc8TcX+DmEnHDC/PhVps/ANRimFPRy9C3FpqPMuCGRg4CVRtoVt6wWIxfiraE/CWfzt8vyfH63xht7Aqq6CaAo7OmCtuFK4vgxxDsH1OKY7/K2xr2otpDCddhdWwvm8OKwlOCpVdP4Lh+n6bEDcq2RnuepvtN+SJuPzZar00Kq4elQz0x84r3YKRmfhf34tWUZ47tgHGLhzxIGT5hFq9GUM50XxcnO8IY5yuaxuIav7pHpZwiYZcwJJBpEkpImys6s2BD18GRjfnlrOCw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(376014)(36860700016)(22082099003)(18002099003)(56012099006)(5023799004)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Rql0xvFaOn4R3rIlpkzqkmE4g2+re6X9VtAd/49E8rzbIDHRP9pjp3uIprjOVs84FxGwrpmsT4XHmm16d04SSd8Emi8IYi5lUyGKg08DMNSzCPHdUPvrkePQAtZUzkVF1ieHL6/yAUrkonLFg0bd4bz58QV1b/bO3hCCWnYMUX05ewpSGEX2ysg6ancswtLsvzHc0m8kIDHEDTx3PsRWLD2X47Do7Z78mrPzzd9eQQIT8xZ3vQq7KUkCNdMfTdMHICqwoKJ25ftECLKAbntJpcSkm20RLk9Rkw57azUGUx8Kw6Hpywe21KrY7qhpGSei2zh415M+nXrjQVNFx56qkv0ZLiUPlA2c1ZAbr/8SNR+ws7T26TOqQWfB1274f9KKjInZTz34WF4sNx39jSFbK7HIM0udEs1VqNLNPLR3OHHZq+QcIVtH4oIcIeurODJy
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 04:56:36.4475
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e0213ab-490c-4f21-adf0-08def9c06b74
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000012.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9165

Correct kerneldoc comments that no longer matched the code.

Signed-off-by: Golla Nagendra <nagendra.golla@amd.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
Changes in V2:
- No Change
---
 drivers/dma/xilinx/zynqmp_dma.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
index 22b517c57003..a2fbefbb43b6 100644
--- a/drivers/dma/xilinx/zynqmp_dma.c
+++ b/drivers/dma/xilinx/zynqmp_dma.c
@@ -208,7 +208,7 @@ struct zynqmp_dma_desc_sw {
  * @irq: Linux IRQ number, or -1 when not registered
  * @is_dmacoherent: Tells whether dma operations are coherent or not
  * @tasklet: Cleanup work after irq
- * @idle : Channel status;
+ * @idle: Channel status
  * @desc_size: Size of the low level descriptor
  * @err: Channel has errors
  * @bus_width: Bus width
@@ -435,7 +435,7 @@ zynqmp_dma_get_descriptor(struct zynqmp_dma_chan *chan)
 }
 
 /**
- * zynqmp_dma_free_descriptor - Issue pending transactions
+ * zynqmp_dma_free_descriptor - Return a descriptor to the free pool
  * @chan: ZynqMP DMA channel pointer
  * @sdesc: Transaction descriptor pointer
  */
@@ -617,7 +617,6 @@ static void zynqmp_dma_start_transfer(struct zynqmp_dma_chan *chan)
 	zynqmp_dma_start(chan);
 }
 
-
 /**
  * zynqmp_dma_chan_desc_cleanup - Cleanup the completed descriptors
  * @chan: ZynqMP DMA channel
@@ -908,7 +907,7 @@ static void zynqmp_dma_chan_remove(struct zynqmp_dma_chan *chan)
  * @zdev: Driver specific device structure
  * @pdev: Pointer to the platform_device structure
  *
- * Return: '0' on success and failure value on error
+ * Return: 0 on success and negative error code on failure
  */
 static int zynqmp_dma_chan_probe(struct zynqmp_dma_device *zdev,
 			   struct platform_device *pdev)
@@ -1042,11 +1041,11 @@ static int __maybe_unused zynqmp_dma_runtime_suspend(struct device *dev)
 }
 
 /**
- * zynqmp_dma_runtime_resume - Runtime suspend method for the driver
+ * zynqmp_dma_runtime_resume - Runtime resume method for the driver
  * @dev:	Address of the device structure
  *
- * Put the driver into low power mode.
- * Return: 0 always
+ * Enable device clocks.
+ * Return: 0 on success and failure value on error
  */
 static int __maybe_unused zynqmp_dma_runtime_resume(struct device *dev)
 {
-- 
2.44.4

