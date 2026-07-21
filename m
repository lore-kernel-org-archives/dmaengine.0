Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11021110.outbound.protection.outlook.com [52.101.125.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9FF403B00;
	Tue, 21 Jul 2026 06:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784615324; cv=fail; b=CSCEDEeYMqNrScsaPX5dvfIIQPsHSKQwIWzfjcnqSwZ61Eivz+hezwPqNdcoUqtt79VJRkUR4U7kUKzlxuPRFKZ5BlGsDpUeReubEFyhx1ecIXOmJGmRfCteiKsym7sLG5R9g0Uwi4IHg7qSZN09BDaH2cC/XrCT07Nh/X/NQzo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784615324; c=relaxed/simple;
	bh=ytIzmDd0TenLxW2HSDfqZ6kfWqDvMS1kj1HNr9qg79A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DkJDTQ5OMtzI4dQAjdSJjpiMzwvUE71Jx6urBrTA4AcCff6+taWIGOph71Jdczefd7g8gnsaVmmpotz4N8nt7PyRSvkvfaoSJ79dlQVrSoQkbtQXOKeiVxEyD6W26GqQrBFybwCLHigsFbphTfxh7G2b9axN/Sxxd/K2mMOD94o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=ZaW0IjaI; arc=fail smtp.client-ip=52.101.125.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="ZaW0IjaI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MzLBYzks0BD3ombnhJ2fuiMtOQMu3apkVC1iUVMEOfxV5IEKGxK7fKqHZqif7aLix/M7PbXefFuMGJe3Ycj2UIYST5yrdDAjV/L7au5k9j4xCFY/Bgpx8DOZAwG8eXe8tzdwmVVF4LI/vjrBrPmtH8YzPKS+QWkjGUHXPWaQ8ZECK3TksL4gXvAO60DETUrm2Kl84Bd4vkNUDHv2bCzNSxmTXfvZCpGJNDQFMxn58lb1ttm+m1Br/VJ8QE/aXJCOKOk1YYk4jCtpD0aFp4iR9PZkAzWukpTKDKar4AvBXXjdlmRoqa/7Do5AtlMu+O0uUBjFzc+01hA9R59JfYdS3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m8ZhWQFIgE/6KTANBCF3jprWH4bp7ra6hJDiGin1n3s=;
 b=BPJdPY26hmmE8zohrIQ2+YxOx1DN0VmQsoqZDjLt7RRdQOmTSzJTwt2ObMZXdI05cm7uTFCbzO8Es3PULMA8wAoHKslMXUZvJUZc071QgIpHThc04wgiL+YnKXNUxrDwR2pq2g27N+YVNn3LNCBxu5G1JFsc+6qMINt60mDabf3a8atWAEwRwJNfFd2EdNMmRvuQfEqSUqDLK+Yump5V5kc62iSYIddwuV3LVxDrxP0PVsW0f1JbUv3t4H1W9lQpYzghs0P+fyigoOxoIHHgQp2htS8+qmxqHH/CcUgYldd8xjvHdYbGtQMnQbSodvpbLG9HQVjkq0NQMgxXLHSt1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m8ZhWQFIgE/6KTANBCF3jprWH4bp7ra6hJDiGin1n3s=;
 b=ZaW0IjaI5LsKZi3dTn8pZl0Aq/Qt3whhy4lkoo8/cNTiXhy5wBEUrr3MkUHlHpwoNqB35ocjZPUEJbWy7/x4n4sd4PTXrE3I4Y8239JC3956kz3778kzjliw8XZ7hMrOknTCiEoWME8w6z7YhOn3B7o+EUG2w4p3sJ/1vRWBLRU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OS7P286MB6796.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:432::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 06:28:24 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 06:28:24 +0000
From: Koichiro Den <den@valinux.co.jp>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 08/14] dmaengine: dw-edma-pcie: Rename vsec_data to dma_data
Date: Tue, 21 Jul 2026 15:28:09 +0900
Message-ID: <20260721062815.4117887-9-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260721062815.4117887-1-den@valinux.co.jp>
References: <20260721062815.4117887-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY6PR01CA0005.jpnprd01.prod.outlook.com
 (2603:1096:405:3bc::12) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OS7P286MB6796:EE_
X-MS-Office365-Filtering-Correlation-Id: 54f6d55a-6490-480e-bd44-08dee6f14446
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|10070799003|366016|376014|1800799024|3023799007|56012099006|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	w3Zak2DqRyPlAFbvCujA99AkGBy5wWrJ2/ThI9U3H2DJ7rMguwstyPK3S02NBBeY0IJGKYDv5SQNapoLpWXSV+BV6rQA4QBJW+jxZlq8zzq3SAxZhix0sduh4j5U4KqlVauVkMw1/wPCs02ued98TEnuE10/EL0125ffMPLin19AOXhVZ1XvYxK8302lx2Z4KgSw+XzYDKDuiY8W3SjYUZZ3NKb+FR0riBviQljYGDvbz0im9P0eMx83w2IUrxDlvTO3PGS5dURVlYB/jjicpfO8uJkNAnLyWB7uLXEoXMS8kWaoTHnljbbW3UtAjSOJ8APyYfxxRNn+bEvqkC5ddYBycgoysbwywT6FgrjbTEj91XOtzs9Ga0FOkN3koYtjqkp44O9dUrD2psuHW6qkAPdCg95lEGsEHazzAfKYqgqZVOKB3IzBHKqOC9IHUlZUn5SDrkjgADfhlMphdtZNa46IdLbDuXNeI52w97LcKQ25Q8mScIjGZyVG7GUaPyr2vPbUK6iPQBs9dfpNpNndgXNTBBEt4FiCTXl5AkP/UiUVJnSz5S7SbOYFNZvftkS4p5BwN6qazmx8uBfVPXiSdplbns9HUtwQRtrNr9N8S8CuBW4c36K1QFwROqqoUw2HdKgNuNyy5m7Ufz7ttcJkilaWhEF5L/eG2tbH8lyIpIA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(366016)(376014)(1800799024)(3023799007)(56012099006)(10067099003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7/Xc5BRX+NSI5dRsVrEVVoke3g0QpNw1u2O4htOHgOavRhg3E0x8AFWm+9MX?=
 =?us-ascii?Q?iaGdTBNWDo5EQkKwoUwEDpsm3dN0heWBgwuh8bc8tAjAH56kPpknXZPPGAid?=
 =?us-ascii?Q?MLs7jYbZIIxEWT0/Bx6o8QgVXDdhmI7VSJg3+dNLuyqGTLKvpY5lvdN93HWF?=
 =?us-ascii?Q?oqVEjLm6s/a8o8D6yd27gTzJWC9h0Gxl1fF8c4S3Rsr7rhrSyVo+Bd+9qewK?=
 =?us-ascii?Q?8CMQnyBbAj9/48PCp/Q45GVLPcGan81pvKRyyOEQwnZ/qDCyOAJAvroNxJYz?=
 =?us-ascii?Q?4G5dCL9EIC4FmsPi459A30zkvmrV7O2hGTxZmYoXEIYdZoAlls7Fy29YVW82?=
 =?us-ascii?Q?pNNd3UIZhjfAT89epVZzGawQnbpn5ct9DYWwD9XAXIrRHtH0Wttxery3jZt3?=
 =?us-ascii?Q?wgXpAzpmTZF3NvmkATedD4ecupKv4075MFHpepHDxORV02zr27lTLa3WBsie?=
 =?us-ascii?Q?JIouvMZjN/s78GnYHe+OcpQ7acalwYWrtGInXmMktc/4qHZtH6S/AnbapHML?=
 =?us-ascii?Q?WvpA3tziV6h3/fHj2eC1KFYTxfWTTOe2YAuLAa/S6IUdvqpf7DKs3U7vinsJ?=
 =?us-ascii?Q?ph3ZH51zaMZTn1trV+rPWQ6fO2Li38VjpaKtFqBE833MhU+4O3Ch6PiqOHnQ?=
 =?us-ascii?Q?BsBzv3RRkp0AHdQ8Shl/8BdJ6DmqwVKKdVo5DXtymazDcKMafvypK8ib0yS0?=
 =?us-ascii?Q?YPkgasmZC0JCiDI8spKvysKI1f+ormuTDoPrQaEUunluGRPaAIhuJB2wQqrE?=
 =?us-ascii?Q?Dige8yPsuFqk7S4sFKTOrY1iqj7KqhfA69W8WBmioQR6R3/YuWshBcf/cdsl?=
 =?us-ascii?Q?Mg1nBZQWGyEsyhFX0SDmkC2QHkIMujoey3r/y3RedoP4TiBrkGO21B7ou4K8?=
 =?us-ascii?Q?xOkV+cPcgkUNw+Jc0pLqArlBH4+fSG6Es47yBV3yII5+PF+4EKZOys1Opveq?=
 =?us-ascii?Q?biUrVDujVBU2CZUKJVZE0KYpE0IH4Bv+gGyStpDzZfW45y3qELhRLCrcOOCs?=
 =?us-ascii?Q?aZCFpxRbwscH7+jMHeideCzZDsJ7buCPndJP0iVY4OUyZ/jGZCBB0iggbHwk?=
 =?us-ascii?Q?w00Zxqb5CFNelkQyprNzY0uPwuwkKSGVU9HZPi6zsNWQa0YLKRiTa7A0cZPm?=
 =?us-ascii?Q?Xk5ydJA8dVPdzpJQevKVnPKVcT2Ajay4HR62qLMyCyec5liW1xbgX+P3ceNd?=
 =?us-ascii?Q?iwj8KnN4bPmK6qZQVG+DgMExKmeQ+vLAVdaAduxNpFdQWWuLrY7zuFtNhpJz?=
 =?us-ascii?Q?0lVZWEh5ALEP3+QInYqdn8H8FayYu6ZIpm6bKzPEP8fBPQoEwH9iq/qIQ92x?=
 =?us-ascii?Q?Sk0Zye5qluWKJ/L4lFZXma8yaTr+MSKcHwqPjLhCu544Vf3ChwmFeWU3sTmy?=
 =?us-ascii?Q?EMNMBEPkMsH+Tzzc8UrAL+Ca6/R1fip9e9rz8HA4FxMgqGzTX2rYxZNmBA9g?=
 =?us-ascii?Q?ZtZ33oVN90FruNJ+o3PrHjEkwkrskx7mplX3YP1RvtZ/tvhHiU/cTbrXPVtM?=
 =?us-ascii?Q?gNXAT6c1VxPX+WknQzXwNW4GvrJJzWqPYZLE3+Ii85yRzgkNfxhCc/RmHpgt?=
 =?us-ascii?Q?FVY/NOY5xY5QmonNeT7mlY/Y0mtdHUCyAPm4yQF4bLe1A6wwfDuYygjGxDUl?=
 =?us-ascii?Q?/RivIFN51YQ2H4UGb1fRMFQP9OusHIQDdXkoQtvQ2SxnHRlMskvuElFbjTj/?=
 =?us-ascii?Q?r3FrWNfNuwim+NuPGIG3FrFkSupnWNUwmZnrvYhNgTcRsR7tFoyC15s3mY3l?=
 =?us-ascii?Q?M0Xub6sgbuYgiOTQ0x6WHbQR9io2ZaPTux4CnrQDzxKM6CUBc0ls?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 54f6d55a-6490-480e-bd44-08dee6f14446
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 06:28:24.0854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SgiDSa/t4Z4CbEykP5jbd4yltb5r4TM8IH+URpUGK4Ai3D9XE63PwNOkmADEQykgWKuw/PpQQKc7nvm/COaPfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB6796

dw_edma_pcie_probe() now obtains DMA layout data through device-specific
capability callbacks, not only from PCIe Vendor-Specific Extended
Capabilities. Rename the local data copy from vsec_data to dma_data
before adding endpoint DMA BAR metadata discovery, which does not rely
on VSEC.

No functional change intended.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v6:
  - No changes.

 drivers/dma/dw-edma/dw-edma-pcie.c | 74 +++++++++++++++---------------
 1 file changed, 36 insertions(+), 38 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-pcie.c b/drivers/dma/dw-edma/dw-edma-pcie.c
index 50d2a53f798d..f79597a7ccf9 100644
--- a/drivers/dma/dw-edma/dw-edma-pcie.c
+++ b/drivers/dma/dw-edma/dw-edma-pcie.c
@@ -390,9 +390,9 @@ static int dw_edma_pcie_probe(struct pci_dev *pdev,
 	if (!pdata)
 		return -ENODEV;
 
-	struct dw_edma_pcie_data *vsec_data __free(kfree) =
-		kmalloc_obj(*vsec_data);
-	if (!vsec_data)
+	struct dw_edma_pcie_data *dma_data __free(kfree) =
+		kmemdup(pdata, sizeof(*dma_data), GFP_KERNEL);
+	if (!dma_data)
 		return -ENOMEM;
 
 	/* Enable PCI device */
@@ -402,25 +402,23 @@ static int dw_edma_pcie_probe(struct pci_dev *pdev,
 		return err;
 	}
 
-	memcpy(vsec_data, pdata, sizeof(struct dw_edma_pcie_data));
-
 	/* Let device-specific discovery override the static template data. */
 	if (!match->parse_caps)
 		return -EINVAL;
 
-	err = match->parse_caps(pdev, vsec_data);
+	err = match->parse_caps(pdev, dma_data);
 	if (err)
 		return err;
 
 	/* Mapping PCI BAR regions */
-	mask = BIT(vsec_data->rg.bar);
-	for (i = 0; i < vsec_data->wr_ch_cnt; i++) {
-		mask |= BIT(vsec_data->ll_wr[i].bar);
-		mask |= BIT(vsec_data->dt_wr[i].bar);
+	mask = BIT(dma_data->rg.bar);
+	for (i = 0; i < dma_data->wr_ch_cnt; i++) {
+		mask |= BIT(dma_data->ll_wr[i].bar);
+		mask |= BIT(dma_data->dt_wr[i].bar);
 	}
-	for (i = 0; i < vsec_data->rd_ch_cnt; i++) {
-		mask |= BIT(vsec_data->ll_rd[i].bar);
-		mask |= BIT(vsec_data->dt_rd[i].bar);
+	for (i = 0; i < dma_data->rd_ch_cnt; i++) {
+		mask |= BIT(dma_data->ll_rd[i].bar);
+		mask |= BIT(dma_data->dt_rd[i].bar);
 	}
 	err = pcim_iomap_regions(pdev, mask, pci_name(pdev));
 	if (err) {
@@ -443,7 +441,7 @@ static int dw_edma_pcie_probe(struct pci_dev *pdev,
 		return -ENOMEM;
 
 	/* IRQs allocation */
-	nr_irqs = pci_alloc_irq_vectors(pdev, 1, vsec_data->irqs,
+	nr_irqs = pci_alloc_irq_vectors(pdev, 1, dma_data->irqs,
 					PCI_IRQ_MSI | PCI_IRQ_MSIX);
 	if (nr_irqs < 1) {
 		pci_err(pdev, "fail to alloc IRQ vector (number of IRQs=%u)\n",
@@ -454,23 +452,23 @@ static int dw_edma_pcie_probe(struct pci_dev *pdev,
 	/* Data structure initialization */
 	chip->dev = dev;
 
-	chip->mf = vsec_data->mf;
+	chip->mf = dma_data->mf;
 	chip->nr_irqs = nr_irqs;
 	chip->ops = &dw_edma_pcie_plat_ops;
-	chip->cfg_non_ll = vsec_data->cfg_non_ll;
+	chip->cfg_non_ll = dma_data->cfg_non_ll;
 
-	chip->ll_wr_cnt = vsec_data->wr_ch_cnt;
-	chip->ll_rd_cnt = vsec_data->rd_ch_cnt;
+	chip->ll_wr_cnt = dma_data->wr_ch_cnt;
+	chip->ll_rd_cnt = dma_data->rd_ch_cnt;
 
-	chip->reg_base = pcim_iomap_table(pdev)[vsec_data->rg.bar];
+	chip->reg_base = pcim_iomap_table(pdev)[dma_data->rg.bar];
 	if (!chip->reg_base)
 		return -ENOMEM;
 
-	for (i = 0; i < chip->ll_wr_cnt && !vsec_data->cfg_non_ll; i++) {
+	for (i = 0; i < chip->ll_wr_cnt && !dma_data->cfg_non_ll; i++) {
 		struct dw_edma_region *ll_region = &chip->ll_region_wr[i];
 		struct dw_edma_region *dt_region = &chip->dt_region_wr[i];
-		struct dw_edma_block *ll_block = &vsec_data->ll_wr[i];
-		struct dw_edma_block *dt_block = &vsec_data->dt_wr[i];
+		struct dw_edma_block *ll_block = &dma_data->ll_wr[i];
+		struct dw_edma_block *dt_block = &dma_data->dt_wr[i];
 
 		ll_region->vaddr.io = pcim_iomap_table(pdev)[ll_block->bar];
 		if (!ll_region->vaddr.io)
@@ -478,7 +476,7 @@ static int dw_edma_pcie_probe(struct pci_dev *pdev,
 
 		ll_region->vaddr.io += ll_block->off;
 		ll_region->paddr = dw_edma_get_phys_addr(pdev, match,
-							 vsec_data, ll_block->bar);
+							 dma_data, ll_block->bar);
 		ll_region->paddr += ll_block->off;
 		ll_region->sz = ll_block->sz;
 
@@ -488,16 +486,16 @@ static int dw_edma_pcie_probe(struct pci_dev *pdev,
 
 		dt_region->vaddr.io += dt_block->off;
 		dt_region->paddr = dw_edma_get_phys_addr(pdev, match,
-							 vsec_data, dt_block->bar);
+							 dma_data, dt_block->bar);
 		dt_region->paddr += dt_block->off;
 		dt_region->sz = dt_block->sz;
 	}
 
-	for (i = 0; i < chip->ll_rd_cnt && !vsec_data->cfg_non_ll; i++) {
+	for (i = 0; i < chip->ll_rd_cnt && !dma_data->cfg_non_ll; i++) {
 		struct dw_edma_region *ll_region = &chip->ll_region_rd[i];
 		struct dw_edma_region *dt_region = &chip->dt_region_rd[i];
-		struct dw_edma_block *ll_block = &vsec_data->ll_rd[i];
-		struct dw_edma_block *dt_block = &vsec_data->dt_rd[i];
+		struct dw_edma_block *ll_block = &dma_data->ll_rd[i];
+		struct dw_edma_block *dt_block = &dma_data->dt_rd[i];
 
 		ll_region->vaddr.io = pcim_iomap_table(pdev)[ll_block->bar];
 		if (!ll_region->vaddr.io)
@@ -505,7 +503,7 @@ static int dw_edma_pcie_probe(struct pci_dev *pdev,
 
 		ll_region->vaddr.io += ll_block->off;
 		ll_region->paddr = dw_edma_get_phys_addr(pdev, match,
-							 vsec_data, ll_block->bar);
+							 dma_data, ll_block->bar);
 		ll_region->paddr += ll_block->off;
 		ll_region->sz = ll_block->sz;
 
@@ -515,7 +513,7 @@ static int dw_edma_pcie_probe(struct pci_dev *pdev,
 
 		dt_region->vaddr.io += dt_block->off;
 		dt_region->paddr = dw_edma_get_phys_addr(pdev, match,
-							 vsec_data, dt_block->bar);
+							 dma_data, dt_block->bar);
 		dt_region->paddr += dt_block->off;
 		dt_region->sz = dt_block->sz;
 	}
@@ -533,31 +531,31 @@ static int dw_edma_pcie_probe(struct pci_dev *pdev,
 		pci_dbg(pdev, "Version:\tUnknown (0x%x)\n", chip->mf);
 
 	pci_dbg(pdev, "Registers:\tBAR=%u, off=0x%.8lx, sz=0x%zx bytes, addr(v=%p)\n",
-		vsec_data->rg.bar, vsec_data->rg.off, vsec_data->rg.sz,
+		dma_data->rg.bar, dma_data->rg.off, dma_data->rg.sz,
 		chip->reg_base);
 
 
 	for (i = 0; i < chip->ll_wr_cnt; i++) {
 		pci_dbg(pdev, "L. List:\tWRITE CH%.2u, BAR=%u, off=0x%.8lx, sz=0x%zx bytes, addr(v=%p, p=%pa)\n",
-			i, vsec_data->ll_wr[i].bar,
-			vsec_data->ll_wr[i].off, chip->ll_region_wr[i].sz,
+			i, dma_data->ll_wr[i].bar,
+			dma_data->ll_wr[i].off, chip->ll_region_wr[i].sz,
 			chip->ll_region_wr[i].vaddr.io, &chip->ll_region_wr[i].paddr);
 
 		pci_dbg(pdev, "Data:\tWRITE CH%.2u, BAR=%u, off=0x%.8lx, sz=0x%zx bytes, addr(v=%p, p=%pa)\n",
-			i, vsec_data->dt_wr[i].bar,
-			vsec_data->dt_wr[i].off, chip->dt_region_wr[i].sz,
+			i, dma_data->dt_wr[i].bar,
+			dma_data->dt_wr[i].off, chip->dt_region_wr[i].sz,
 			chip->dt_region_wr[i].vaddr.io, &chip->dt_region_wr[i].paddr);
 	}
 
 	for (i = 0; i < chip->ll_rd_cnt; i++) {
 		pci_dbg(pdev, "L. List:\tREAD CH%.2u, BAR=%u, off=0x%.8lx, sz=0x%zx bytes, addr(v=%p, p=%pa)\n",
-			i, vsec_data->ll_rd[i].bar,
-			vsec_data->ll_rd[i].off, chip->ll_region_rd[i].sz,
+			i, dma_data->ll_rd[i].bar,
+			dma_data->ll_rd[i].off, chip->ll_region_rd[i].sz,
 			chip->ll_region_rd[i].vaddr.io, &chip->ll_region_rd[i].paddr);
 
 		pci_dbg(pdev, "Data:\tREAD CH%.2u, BAR=%u, off=0x%.8lx, sz=0x%zx bytes, addr(v=%p, p=%pa)\n",
-			i, vsec_data->dt_rd[i].bar,
-			vsec_data->dt_rd[i].off, chip->dt_region_rd[i].sz,
+			i, dma_data->dt_rd[i].bar,
+			dma_data->dt_rd[i].off, chip->dt_region_rd[i].sz,
 			chip->dt_region_rd[i].vaddr.io, &chip->dt_region_rd[i].paddr);
 	}
 
-- 
2.51.0

