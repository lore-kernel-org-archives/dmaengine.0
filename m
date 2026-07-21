Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11021110.outbound.protection.outlook.com [52.101.125.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B3D40862E;
	Tue, 21 Jul 2026 06:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784615325; cv=fail; b=hjYmcMwM1OE4XkLRK75IiuEPt7jxjf3dPXF+vw4QlA8VHREtBIWAsQ3xdD9ghuwyF9sc9Dy2l6hpdhPPc68YsCR1Hb+8iwcdqkA61Y/6CEjx/Y9Jm2eExhqwhgS+fXPy69YN5nh6LDSVMVA8zs5ZkChiZfO75xPpzL9/EV9XC+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784615325; c=relaxed/simple;
	bh=HQOCEfbqCNjrh8aGT6on8vdjqxrkxwYDnih1w+alh00=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HUTpTF0aNx83m5IMZ1p7MnKOT+Qt6l5WB6bgxE1O29YqOSvSjPew3WLEUS7mJFB3AuzMBjlMySbL0wIXSoZnYcX6/leRAlFPl6n7xgGouRfTK2MLpy1f9I/OYAulYiemYzaQBQnHT0bz72jBmMCtcKPlMwDx9iggucH4qpXOgCM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=vQwtpJjM; arc=fail smtp.client-ip=52.101.125.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="vQwtpJjM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m2AZORezwCYcCg9qcUDpnuuTBUTMA9HeLHCa8aJ23iGwHpKmWiVxNU/aUq88fRoq3XyxMZrM03tvfmca+5YfbdxjSSTxMUJRaCYP7MQJty3rHQut7srINj87hxq11sHXXFoOEc4I+mDqUH/GCeNhDW0EjkegRW9BX0G3bFxMuqKlAPH2PTrRmOVDPv1wLSD5Qfr6Q6Cw0AC+dvxQ9X4N2ux7Or8qDbu6H0L9NzcpPWdf7ap+bQhPxqB8tegvOBMgC4DYirRHBC8E4EuocKPWYG0SVzq6eYjqFBnPyM8+ep+TeLaSGwDRya29rUJQ62F7lhyvqJkWIuuc5BWc5yNfqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O4TCTtjuNyWZjYzSpp0Lvd6TfeTzruEc7kuC7TmbqkY=;
 b=nk2xmVluuSel//iHp3q13sHsaI+yd/Fx3mPVw3YwK6adtJDlM09ThAOizCs2RdkJo7lm6iah9XgkUr/d+jG6VVhuMZKv6qOFKsd+YzGiwYBsl3PZgW97KbIIE50h0oVWhTuwfZkF11mRQ9OXi7xWZ8LwzUhMfR3E+xRly6E21IJ6ID0ufaEpy4ObD+MvIZ9XeWcKLZEBd6f+60lqF7RPY32WHuaQLfmQpcLhkfXalGx09NKBuZZ72YIPVBGLXE6iPQJXhXI6Sdzh2y4uxRRvYWCRnjW1mZdFKali8Bh/Z666Dyv6RVG8vSwahaYJrHNVMzSFazrxQyAXG7Z3Kn+7dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O4TCTtjuNyWZjYzSpp0Lvd6TfeTzruEc7kuC7TmbqkY=;
 b=vQwtpJjMvbMKNDDW21SgCxMKOxE2S5eCbZ6PNPZPDhdGbSO0EKv7lHaof/G+vQLsmqp3C6lGC72RmB8Ygd+SPSOFHfP2nmmbb6yluyQSonExgleVSW5nf2wCKEtnNydUveXvoy/RyClvpm2ton+Lt+KmpzRr6G+c0HBXslFlJsc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OS7P286MB6796.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:432::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 06:28:27 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 06:28:27 +0000
From: Koichiro Den <den@valinux.co.jp>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 11/14] dmaengine: dw-edma-pcie: Factor out descriptor block address lookup
Date: Tue, 21 Jul 2026 15:28:12 +0900
Message-ID: <20260721062815.4117887-12-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260721062815.4117887-1-den@valinux.co.jp>
References: <20260721062815.4117887-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0076.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::10) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OS7P286MB6796:EE_
X-MS-Office365-Filtering-Correlation-Id: 86816712-a00c-48c6-5b0d-08dee6f145ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|10070799003|366016|376014|1800799024|3023799007|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	o5cIDRXVDSYguilCuMu6bvceJwxyGdZ0c5MVvU3/5NgtSTfO2ErNmMyOlNxNrOYaGxrnskNJYxjahpPzTmcvQwFTJjXdhXbM3GgGomvYGPoad1yUPe3eVTF5xKmx3ianbhU1gtObROZNYf0MCmyyrlTHjgGxbp57S7zgOQjtonJlTB26RbfrefdaphcZMPCcSAM1ySj09Jx/DbFZmj/cTyZqXqP8NQjJ/k4fKwzMku5GuEhpM5s5w/bndktdCVNuqzNAIujrbxFgdpVqu430omT68nzH08V3Wemtb5x4jAaeTYcigVq81EOoeV8z8izwEP2sBzmj05xMVF+5kg19JRZFnog16NyKTD5E2TbpfMCrNYUPvdF3W5uhjqMs+dCarBHLxbO84YOwpEsHqXwrpYTuu6hoH91Qu7LoYFv8Gy/rTgCVAypuQJshMqiJOHuuambctpjJaAmSWl34QJ3rNcRiWSaZxrvv5kwOCN0R2quxZCJyPq8XGWDKKqdnYXaCpS3T9DkW6JvEWA1Otj0hbK56SbJlA/1x/vPLeNoj2FlnTdhUnQw7+oeN1dsXpiM3XWta2f3MKDkfo2fHCVZxeEsCgChhWTBrVQGmrH7GpsiyX8yKD0GwNSjNgh0GLUhGjTcSxmj7lsW1R8jY4FsfJvNjCo5Q34IEI3/3afXXYPw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(366016)(376014)(1800799024)(3023799007)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PvkLW+0Ij4txjYPLj8nvXJ66k5p7rrWZbPOzanIG6rLGJaImJeuYhypVHPhi?=
 =?us-ascii?Q?ZFdZzuvrPlXWxqEM+uVVJNqicEbtUV0UvOUp0z7WokQZkkWEFgybMnxMdaco?=
 =?us-ascii?Q?EMDdwEnJfp+YDcwzLZr8oTq7itupVYo6Tx1nSA81sar5bIN+os4QVR1uFWOX?=
 =?us-ascii?Q?1xZxJtALsy9Hn5ERzISTvc+ffehQvHyYTjtI0I+iybaH4z76K/JpHEJ3BRqo?=
 =?us-ascii?Q?+810UunfiE22yDk2cZTxBMSZG305oDu0aDPf7cijZrztqfd5N6c3gav7cbO2?=
 =?us-ascii?Q?Rx7TwzAN/jioCmfwAvfQIOL4mnncu8LrnfBblmyfNtL7nYSjo0GmDAbdogFz?=
 =?us-ascii?Q?cgfcMnKitW1bLjRBZemRYRifiaOAdgKqzwWM5p53YOMgAgGC8ilkZRcTcInB?=
 =?us-ascii?Q?YivCrvPEe3eby8UvAZbiLgMHL3X6WcwdPXEm2ee5WnU/CJwbOQh0hdBF2qZS?=
 =?us-ascii?Q?qG696z25ABqtBXhXKfplNaQ1pEjeLOVMnADeFRdk6RYh7y6jAMlIuSpiaoTm?=
 =?us-ascii?Q?tpfFCE382rsYyDb0+8e3QA/WwyaSKQF2JjpW2K3zvuE772v8FIg1MNCmGtQq?=
 =?us-ascii?Q?H6KDJSXlc74sdWB03g1gOXnATpk6ycIZD/PfYmykS/oqmCXNlCgAxCXu5/L7?=
 =?us-ascii?Q?zr+DA+a6nur2fNJpC1iULld11J20wGG1PnmKxlkVOvfDkLhOvZzj+ZgmW3Tj?=
 =?us-ascii?Q?fKVzznoGo6bQnL/E9BpWRgBvs6yisyecXDnfWT6DdmB6jwVGYADx6yPUVp5q?=
 =?us-ascii?Q?1xAdv5s4kF1RtD9isivztq3X1It9DXgv8EMVcDCDxFvftoLt1Dvc/3ncnyks?=
 =?us-ascii?Q?hYiJXMfM1My4hLDe7H4Jp5xGZII2sAyQE+aBel/kKTYcOvYPNwehuRZj1uzN?=
 =?us-ascii?Q?+hZT4zU5t30RnC14WrFYjoYH/KKJKKIq1fHXsvmoYm+VT7PHV2gfEranRrL5?=
 =?us-ascii?Q?eH/T57C3mAAT+W9/BE9RpCNXW0P5L/qvM67nxQOdNq5bBuZszWdrVvgnMf4T?=
 =?us-ascii?Q?PKxs/yQ9hmZFfBRsjVuwAGlIN/V6B/fzLDMt4zE7vbbvVjA4/l5vmNAuLxTY?=
 =?us-ascii?Q?19eaKJQBg1qjsHGrr9riJ7HHjKaAv9t3Ihh7Itf4rkEnbylhr2afW2SlswZQ?=
 =?us-ascii?Q?3WYfiINqIJSmlfl4Uy+luzsCWBu2zannyXMSi89U5CEeak0R6gASCSpAjdlu?=
 =?us-ascii?Q?77WRwC4geP+Vk3CNGFh+45jMPbRXGS2f9SV+wD885jpADoeLn+r3x721OUSl?=
 =?us-ascii?Q?sOZihRlBbdt5/pKj9f0oHYpn0Z7vztjH7v0key6k6BVSo8cW2fGuvOUR2Tus?=
 =?us-ascii?Q?lhntOoCCG0VQYOWSnaacmpiaYlZPR/GbnDXRlinqbVr6aUlVhJb0nfR8crQO?=
 =?us-ascii?Q?cz55pQoG6VSZM7T07G1d5ihaoVE1Ww4ep9bSGBQvN53iHt82seIibwwON6/r?=
 =?us-ascii?Q?ipxxIDz+QvxqRoJvNQ+uq2IRSXCV2JvJWOfsc2C28HZe3IR0RG8B2a7O4QbG?=
 =?us-ascii?Q?OiVEGVwpECK1uNlhW6FwMUAEvvFhRrsc+SRR126F4tukLas7EP5BMYtVu7y9?=
 =?us-ascii?Q?KvLptVALWrrxyK9DHfzdHMyNduPqeyAFDby1lSXiM+X5qhr5HI7INPOadm5s?=
 =?us-ascii?Q?1CeJ8xtY7X2XOJ33fcjYiwwDEATsoQJp/tpkPoD6mklWbpozFdxXzx9Yxd1j?=
 =?us-ascii?Q?2zUNMHTrI5BfbFQlJ7ooZTrwmlpfCslt/sjFoXYjAcVtulQTdBOgPbeipYpW?=
 =?us-ascii?Q?QmIgTQd7V6y2HEPLfvpekygd4sQTvpvItUxupvhNHiRR0haZHymj?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 86816712-a00c-48c6-5b0d-08dee6f145ad
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 06:28:26.4425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6BdgGIwMq9hRWdF3AbuMnx9QN7ZaB1JloWXwB0TAr2ujaeuee9HPVZo2/oOfPJgafy12wLmojA2HNBKSEzl6QA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB6796

Add an optional physical address override to struct dw_edma_block and
use a helper to compute descriptor block addresses.

No functional change intended. Existing Synopsys EDDA and AMD (Xilinx)
MDB/CPM6 block descriptors leave the override unset, so the helper still
returns the same values as before.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v6:
  - No changes.

 drivers/dma/dw-edma/dw-edma-pcie.c | 34 +++++++++++++++++++-----------
 1 file changed, 22 insertions(+), 12 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-pcie.c b/drivers/dma/dw-edma/dw-edma-pcie.c
index 4b2757c1eda2..6da890a4ad28 100644
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

