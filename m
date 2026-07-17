Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021140.outbound.protection.outlook.com [40.107.74.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4DC3750AF;
	Fri, 17 Jul 2026 05:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784264622; cv=fail; b=Vdy/xtriBqLqjyKRlCcxNQLSq5mnOr0U6oHH0EOUHfs7FKj5PWCbQsSHHw6XwYkvtorcl1vxDOOXS4zXcwOLpFbxRsX/R0bHeHqQhVQpaDqjTv9UQOQAee7SKU8q2Y+eWzd1mnSvFIwpy9gsJyf0qh60HquGMCp9w89tsTgf6QE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784264622; c=relaxed/simple;
	bh=owv/XFZWqW4UVHzCIEj6MkGm3fL/jO9k73rFEEukeN0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LFX9Qx23+ZsIw+FDCWhPE6Scc3gd2goGbpgcDVyrphZpAOPpuuXw9vf0oKHL8rBHXiKIZA/3Wz4dyro/lqweWTZrzRlrSXbmDiWcbVrVHnTINXOkOig+rjUCMFnOw1gFKvMWlFLVfqsr5LN3CzXzlQB+Fg/37dqRsjBT1OVexSQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=vTtw+QtW; arc=fail smtp.client-ip=40.107.74.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="vTtw+QtW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TKg07UB12nbihp5xxCx5Ho1XpzEJVaMnOaTEQIALqjEhlbwkDu1+kH+bX6cTEV3azl0+CzZ8Mewoi4VB0RiwV5LfRzyKgGHDsUl40LDlQTd2nQy3fFSqGE0eT7Q6Aaycut/bXQQMl8sjOZVFSbaMdnLqXrRkv9Hnn5FhN8xuH7+tJ0IMFtQ2+NFVng9w4+zoxOKQLXCylWto+dteB9O/Zi2AUMNwDRMMvgpPaVVhgJgqIv5lLPdcdlOmUTgw+XatpZ7+7sRdFZ6E2QnP39yGKmLvDXOnBxk28gMJ8s1LoQbpnVTarYwMMFiwQM05iw2MjiEU95PARQ8Gkcvq+eSalw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zQcDlhu1mlkWuXIhvW7859gYpQQYRb+AtcYAopgJC3s=;
 b=t4mNYOOB/BfiOoaEu8Z8QqXWYiiZ//i/ArGIp/WORjt8esVZqvigfrBrzFRi+2Suj5Fqq64sNkfBBeLhw3DJYdCJQg0Tq4Qz0MztHqCqMdbpYsSQAtnXV0qM1zmcPqBntvjqipNQ4TNEv/q26MRek0n+eFIO/9TXkFdeqgjMlzYo4S/pnZROznHw5kEMDxDluIzzaQdLsD0CqSX8hJs1JEJ5rJbCuV+DwgENocUaEAsj4fcEhO5zy4PN4YeGDqg1kESewxL2SnU17KoiLPk0iIOMMqv56F2INISQiQdNi5/LTmHDS8NjF+sRguBo5g1BWytqWcPOsTxgQGcygkuC+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zQcDlhu1mlkWuXIhvW7859gYpQQYRb+AtcYAopgJC3s=;
 b=vTtw+QtW30JwsKtsFSs6uJPYzj3JGowTCGvsMY93UYGPUgOhkjVLwD3phti7RaYanYwNPSXyrHJ6f+CQ4VdXQRRUEFUAnHPckb5KNU5UTKQB4rQTipmtNdSZaYUNQsEd1K6FLZv8TPr/bg6E4r2aEj3wAXpTKZJjKn3ikM+16J8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TY4P286MB6313.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:33a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 05:03:24 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0223.008; Fri, 17 Jul 2026
 05:03:24 +0000
From: Koichiro Den <den@valinux.co.jp>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 11/14] dmaengine: dw-edma-pcie: Factor out descriptor block address lookup
Date: Fri, 17 Jul 2026 14:03:05 +0900
Message-ID: <20260717050308.2144108-12-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260717050308.2144108-1-den@valinux.co.jp>
References: <20260717050308.2144108-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0092.jpnprd01.prod.outlook.com
 (2603:1096:405:37d::17) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TY4P286MB6313:EE_
X-MS-Office365-Filtering-Correlation-Id: c48dfc4f-c168-4f62-3f31-08dee3c0bb10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|10070799003|366016|376014|1800799024|10067099003|56012099006|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	+AYrf96QQXnv7pWsfPN7BI4RcjcDbvlSFH/IZIPmMuRlWzqnd1GpfJRHeuRgCzvvBGs/1WE8bDksgeKTAsHPOzAytNYLfI3k0hVVcHDGmiU1TXtKfwnE64wIJRkylzPlxWlD2F/PYFb1IehQNsZ5cH7bJpwNtctYX+tWtRlD4u9z141SPX+XF9JgRzKV7BlBjGTIGapZZ1x7HMG2VplJn4PolgCjClkrI5gnGenyTpwkuRq93eXVTqWP52pRpK4ryvfzvM++TeYVvmn21k3BqiKP18bZboLxsuf0HEt1aXS9QEEu/GDjOo5my7prokLbljrivwjFwQb4jLo0XYAW4YYrz2iSJ/4hNZfaP6n65jET+Y8lRgVXGKY1uDno48eVZTS+9BJeXvmVZKn0PObsalPei9dtwu2lHTW75h4vQ+Ky0zdPB5zMS+Tz0nnyBAqeos6hTpq2cIvCd+KnLPz7T+8sCLhVbXlsztr43EdXUOzfpngh3eoGh25WqDl63up411mDm/V5bW9ENnOgZZNBLC1A3owsTTR0Y/wf/sFfO/1rNyHv8U58nY6cF/auSzTdmjc64CQ4/CXJtn+VGLVayVDQKcnpt3+6pnbsCiA/hu83fpqk0fpy5qS9XoKjrqTUEnwvEzbcOvujnU18gzTwZE4xtUXMTvKGEomLzF2G+ls=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(366016)(376014)(1800799024)(10067099003)(56012099006)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qgRi5HAiERCycdXJD8HxdorZsCoQ8yJDWajsaRr8eZare8jeyi7k94OISj2q?=
 =?us-ascii?Q?M8klNqFMdI2X0DiV/mcwTYsCR1wSWnL/xLnjzSf0kA7pVElsrbR36AcwHRGk?=
 =?us-ascii?Q?eWh4k3mIYr8s7n22xHZ3NXXagZ1CuaTDReBAt7HsryFTPiKCL7DW+N0wTx13?=
 =?us-ascii?Q?arb+0X6dFvPEoSgaFE7mF9zE+KtxcxFaGoSL51Vu9eMU+55cbeX3X6uduort?=
 =?us-ascii?Q?4XaX1tfUzmhREVTP9xPZIyJnOiUJ6+QXOP2mE3UNXpbbqI4iLsNUNAS21TMq?=
 =?us-ascii?Q?yV4s34p61VbkjSbu64HEN9o/bxND1A7sEoWqZoOmi5V2MVEF75QH1PP3iDQh?=
 =?us-ascii?Q?5xx9bVp/tcd4Ig0I8jY3HztF8PnK5N8jQh0BIljk0vufb3aQOOGghgJdUTpw?=
 =?us-ascii?Q?pXAJTj495rsrAUn5ZlHujgWUrJI5hNQQ80N/Sj6z297eeU24o7umlUd1+VW7?=
 =?us-ascii?Q?06IybJh56wGm4A2uNQ+MmQrgrGfFGy75ED5Cjg10S8ChZC4Tgvb07Ct/1vQk?=
 =?us-ascii?Q?bc8pgPAzEDqyEY+F1Few4/AHaOSAOrex+m/JfY6HKvttUcmFI4B5wOh7Sjb3?=
 =?us-ascii?Q?aOTJTRsdrJX1tF0JP9fSXWeDO6rhzbTwrh6269AX2xs0EFaypdYb3Zvw2wCy?=
 =?us-ascii?Q?o7eCbPeZ6PBT4+bfyyYdX1Gt+c7vGIyg6yIhZv9Vl9NfMzY4ZB8GfuhtvbP3?=
 =?us-ascii?Q?cL4IYdr6yx4Wgmo1MJ1fo3haOQFgAvu6WFb7YJacEstQwlwJza/ASUFIit8K?=
 =?us-ascii?Q?//t5l7AwDr4OGDjzGNQ7iXVNVT/bMvoZaFBy6M3ULrK3VWolif0dWvp+G0rx?=
 =?us-ascii?Q?pDPeWoGYT7+Chz8fLrjK/MMGGsPzuqAd6OdAKzblbrGW4NXNfYEkm6cJZyOr?=
 =?us-ascii?Q?t2Izxwh+qTTXpKX9DVm98bBaBs61b1Zmta86XS5ThZMIXyYIUN5NiWvfodZy?=
 =?us-ascii?Q?uA+Zh9OHVXH7nN7sFxTs83wG5Y36uun3AWjrCmTdxNj9kLdqd6mXUogFfxrw?=
 =?us-ascii?Q?Fv23NS+MnIeLXsw9TuZQuWPG4/qfDxE68i88QH1ZPGTP0b4na7srJoVGKIIM?=
 =?us-ascii?Q?whrk5l51n/SJgTdktUI7P8T+JM1xzOJK3sYQozKbSAS0HOYSwT6zMo+1XCLp?=
 =?us-ascii?Q?XLZEzqWdUdsqFW1FcvUYODqZ1k+znxEQGaYLD1w0vdEXV/MD+wR1ZDf2IeQ9?=
 =?us-ascii?Q?BoS/BxWz5YXJ35IHLqWborARoNzNdUQR1qwr9b56GR3H9E3L9tAopH5oNw8t?=
 =?us-ascii?Q?FXu4bivNgcXiSfCI6U/Yefe2qiPBHFBFqYVt0NDo+R/AgGnODf32mBVjYk1V?=
 =?us-ascii?Q?C/6vZduHpTSihi2AQzmVHs4ds2VIA84MXu+oVNtTtAnu/kmmDZvH3ONEtpkV?=
 =?us-ascii?Q?kTbbv3UUNHJQpwrLQoMMUhYn1llnDN4NEwh9nyD8flIJLON8eWUhHZf+9DYr?=
 =?us-ascii?Q?T9WUbQ+bdKbNfj+H/bQGLmmpD2wv/zHk2vvj+RtSMq+aFTBmq+Ky++78Wpbd?=
 =?us-ascii?Q?gKWulhCnQEv2Q4CiH7eDFtBL1+iN+RzHoJNBPkAZiVZkzTqGervLLl6qSkjM?=
 =?us-ascii?Q?z4JP3GoRPUrhmsKjZmdS7/ohy25+b1H8qAWRRqEl0Xp3f43m6CoNbb+upT0y?=
 =?us-ascii?Q?3X6nqBDQWeik4K8ML0M/ckSkKjbKy8B6nmkB458oG6zkkAeB0ZIODdvebidS?=
 =?us-ascii?Q?Fg5fI2bhsIGmH4aLTzy0h29Sp1WA3Rk6e4umj66pehEdiXW1UtV0I+n27kWp?=
 =?us-ascii?Q?AdZ7+1KCwMpx/rM3Lvm/S+qcPbxu1yTZyom5+wI5ag1sJo4apU1x?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: c48dfc4f-c168-4f62-3f31-08dee3c0bb10
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 05:03:24.6101
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nGKN6bfqz2QyKYgUyeOfEm/Jxf77x1Y0I+f3eaNMA6tw+EcFW+662TwnZ/kxLoJDreUhsKY0TwJfiuBkunslTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4P286MB6313

Add an optional physical address override to struct dw_edma_block and
use a helper to compute descriptor block addresses.

No functional change intended. Existing Synopsys EDDA and AMD (Xilinx)
MDB/CPM6 block descriptors leave the override unset, so the helper still
returns the same values as before.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v5:
  - No changes.

 drivers/dma/dw-edma/dw-edma-pcie.c | 34 +++++++++++++++++++-----------
 1 file changed, 22 insertions(+), 12 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-pcie.c b/drivers/dma/dw-edma/dw-edma-pcie.c
index 327b59828bfa..a5d65cc9706c 100644
--- a/drivers/dma/dw-edma/dw-edma-pcie.c
+++ b/drivers/dma/dw-edma/dw-edma-pcie.c
@@ -55,6 +55,8 @@
 struct dw_edma_block {
 	enum pci_barno			bar;
 	off_t				off;
+	u64				paddr;
+	bool				paddr_valid;
 	size_t				sz;
 };
 
@@ -375,6 +377,18 @@ static u64 dw_edma_get_phys_addr(struct pci_dev *pdev,
 	return pci_bus_address(pdev, bar);
 }
 
+static u64 dw_edma_get_block_addr(struct pci_dev *pdev,
+				  const struct dw_edma_pcie_match_data *match,
+				  struct dw_edma_pcie_data *pdata,
+				  const struct dw_edma_block *block)
+{
+	if (block->paddr_valid)
+		return block->paddr;
+
+	return dw_edma_get_phys_addr(pdev, match, pdata, block->bar) +
+	       block->off;
+}
+
 static int dw_edma_pcie_probe(struct pci_dev *pdev,
 			      const struct pci_device_id *pid)
 {
@@ -479,9 +493,8 @@ static int dw_edma_pcie_probe(struct pci_dev *pdev,
 			return -ENOMEM;
 
 		ll_region->vaddr.io += ll_block->off;
-		ll_region->paddr = dw_edma_get_phys_addr(pdev, match,
-							 dma_data, ll_block->bar);
-		ll_region->paddr += ll_block->off;
+		ll_region->paddr = dw_edma_get_block_addr(pdev, match, dma_data,
+							  ll_block);
 		ll_region->sz = ll_block->sz;
 
 		dt_region->vaddr.io = pcim_iomap_table(pdev)[dt_block->bar];
@@ -489,9 +502,8 @@ static int dw_edma_pcie_probe(struct pci_dev *pdev,
 			return -ENOMEM;
 
 		dt_region->vaddr.io += dt_block->off;
-		dt_region->paddr = dw_edma_get_phys_addr(pdev, match,
-							 dma_data, dt_block->bar);
-		dt_region->paddr += dt_block->off;
+		dt_region->paddr = dw_edma_get_block_addr(pdev, match, dma_data,
+							  dt_block);
 		dt_region->sz = dt_block->sz;
 	}
 
@@ -506,9 +518,8 @@ static int dw_edma_pcie_probe(struct pci_dev *pdev,
 			return -ENOMEM;
 
 		ll_region->vaddr.io += ll_block->off;
-		ll_region->paddr = dw_edma_get_phys_addr(pdev, match,
-							 dma_data, ll_block->bar);
-		ll_region->paddr += ll_block->off;
+		ll_region->paddr = dw_edma_get_block_addr(pdev, match, dma_data,
+							  ll_block);
 		ll_region->sz = ll_block->sz;
 
 		dt_region->vaddr.io = pcim_iomap_table(pdev)[dt_block->bar];
@@ -516,9 +527,8 @@ static int dw_edma_pcie_probe(struct pci_dev *pdev,
 			return -ENOMEM;
 
 		dt_region->vaddr.io += dt_block->off;
-		dt_region->paddr = dw_edma_get_phys_addr(pdev, match,
-							 dma_data, dt_block->bar);
-		dt_region->paddr += dt_block->off;
+		dt_region->paddr = dw_edma_get_block_addr(pdev, match, dma_data,
+							  dt_block);
 		dt_region->sz = dt_block->sz;
 	}
 
-- 
2.51.0

