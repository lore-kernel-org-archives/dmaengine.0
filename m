Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11020142.outbound.protection.outlook.com [52.101.228.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44B332AABC;
	Fri, 17 Jul 2026 05:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.142
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784264605; cv=fail; b=OQZAhWJW2QJ1Bsfwdw+YwL4fNpX8Zg1we+PG+AE3pqbLfJT82e0fD0ilHu9GTjqJwBBpMXWPYDgCiSqWziVFDGFk3XvOj1f1XCVg0MueEfgHutgWDCQAiBaE5qYe2bIkiB8dgKoveaH1V07h61+aZ5INaHmNDigtrdK52Paqd8w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784264605; c=relaxed/simple;
	bh=J+45n3GcVj0hfWfjsrimti8T2h8WHvE2jQyfrWcIFcg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gLoObK2mwAuULGqy9lgEMPXLW5Rrlmte4DyFsJUCMsoLU5/DrOp2DQY3OzTCUVGK9XnQprXvHGzoJWnDRwvDfvbzcLXYkj1l3SHHm3l6OddsbDiN74dTAXeINp/oSxTxaJGWaXwqI5BSnwlniBdHxFNITj5i5AidhvfaFOiH3ss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=uO2v1dWs; arc=fail smtp.client-ip=52.101.228.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="uO2v1dWs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gNwRj2mt2VeViwphfb8y03WPKfp9focSGxsu17xBDjbOb3RspfwiZikp90omtUcN6WgLTleQ/5cB3CB1InBcBhEvfvirRxBlLJQb3K+maePv3jFfytnO6+IIK7eVOPsFq32Kon31gk/DDVDu11WZcqKoWJtoKYohq1IIN/oSmTdpiK8i19qMhZeC2hKqL3RPyVCE/rsPaamBTbmdxKIzZiroXrxpuHYyMPzJ06Or6CUIu8U3nfIQvEnjrBZfRqVuwA6S4lN7MGaS+FNObHtrJztdg+hnjr7Lk9/zQ6Od4q69Km8IKXRXH3tggF4LZxLsZCmgeRICc8wBtBU/lPyDWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2bHJh5l1umZQLBBq+0UwISiaAYS4M1efqkzx/udIKzE=;
 b=KCp0Guv6f6XpL178z9rw2yLirKSQimsFy+zrmYOWvUAgqSYg9fUdKTWEuLSjLSbf3K4jPYmV1ZJ4CDjJhof2exXdT8ptBg7rjpFa1KWUKa3WdKDWj6iRbbUgslCVHv7/FmNpuGuv8w2t1c4X7S3cw6j3I5ZCe/j6upr/tmHfXOOt7pV+JJH1ORrvqvmFTwwOhv28yELhfz6anfA1vq+fxlBy0Y/kGhgKh0JqlJP1mhlcqlPYTO6hSKFbTDr1B1OP3x7oRwx5AaT2yBKY61PvP7T9CVoUYQbV5R2tUynhFr9ntr61bRh/YDTWm0A5DdTAl5leIhihzKro/W3wIm3zYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2bHJh5l1umZQLBBq+0UwISiaAYS4M1efqkzx/udIKzE=;
 b=uO2v1dWs+UUipz0VWRiXpbet8/15/JQznj635MXSh0Lh4Gk9hX25lTOqETsoRkqsaA73gV64LgSQhr6QTn6aZDgRysMp3E5Kp2DrztkvNprbFFKQ0Tb/d56Jo9ZFsTLk604VAr89TdZcG1H9c+p879Raox7DGThHWBAunf5sa3M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TY4P286MB5635.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:2d0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 05:03:20 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0223.008; Fri, 17 Jul 2026
 05:03:20 +0000
From: Koichiro Den <den@valinux.co.jp>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 06/14] dmaengine: dw-edma-pcie: Track non-LL mode in DMA data
Date: Fri, 17 Jul 2026 14:03:00 +0900
Message-ID: <20260717050308.2144108-7-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260717050308.2144108-1-den@valinux.co.jp>
References: <20260717050308.2144108-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0016.jpnprd01.prod.outlook.com
 (2603:1096:405:2bf::15) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TY4P286MB5635:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e0b7b3e-5443-4771-39f6-08dee3c0b870
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|10070799003|56012099006|3023799007|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	54VEsAwDyNOn9EQ2R3KBEhSY5fXzxby8jvHLUMvTLEw8yZPBYBuzbAzFD+6nTrqoTl/kN01Winv5t+ztzL8Qee5/dkwGOT1STanDqgVqXcO9W13YUViHbmiVBcb+PEMLaecLos6RSgoQD0FOpY6suth8Vubv4dWEUI4vR9ZRMt1isz/pQnILkrCZTO1S+swHXRfa/NDx0TXdqhXKX9BV097PSeberD3HvPa1aq/vGQxDZxqE5+/EJqOP5Mqq6PS2HB4AcxCqZR1ulZJHcaBqq04ZwdxMt2C0yH+SbGt76D8DZqJVeH6ZP7JdXe4wQTqivqEIbd7JsRzjD8mA6OPSjKhitUvscst931/9LqZcMk3TwcUwudCcUK28Zit+KK5ilt742UNQV9/QwMtEuudG7MHdnBLOnhKT59jsRrUXh3TPPdl5oClIXjyJs9IAhFaoYsVcg77yYs3LwD3DzQD5St4jEIQq4yQGK9vd8XkUEZXo/nSnGpYZzTvZiZ4F7d6z72H1Rji3Qi6mymg2eMj6K220dqAqJcbXftznWXofsDLo4I1hRj6MWskBJDsNf2t3Pfnw3NyyxONg0A66wyXMcXiFuKSSc3viKU4bBJMbzCQ2fST8ac0hQeg1g5hZlT1rQp2Z5p93waO99/yBiXx8a7Vr2399Oitc07LJIW72oCc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10070799003)(56012099006)(3023799007)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tY8XketSC8vbeJQlNv6VoZD5bHAmEQy6/MI/Qx87XKCj8A8wl9ng+DufkJrN?=
 =?us-ascii?Q?LhTS3lIPXBpZA+FpSThNLeRfWv/C4sZg0UtLrYm3rrwBX+v6buGelZW2tu1X?=
 =?us-ascii?Q?q+WPGtAUPEWc5jsKxi5rTJTclsIdf6+X/NltgBSzgwarXKoXR56KfyGlauy1?=
 =?us-ascii?Q?9XqrFzO+UTr6TG9nCWhmOPjnN4bKZHWwIpuuJRhOTTyU6q98ZveltpWSLNgt?=
 =?us-ascii?Q?O4Mf/I9a5h85MV/ll+NekLRd5JZemQras6xQCitNRqAstGqgbYtwdbMDbtQV?=
 =?us-ascii?Q?Ht5EvlAjzfBxW94ngaZ8+xRMOW2PGjY4W9Oa2Qs/7vphUwSU8PsU6Pqmw6HB?=
 =?us-ascii?Q?8xjyZ++68yFe5rLkejfIkdSHyJU6Ph1PDXLVUXyd4c6CZhiCWsoj19tm4Fv7?=
 =?us-ascii?Q?JB5N3+W0slnxSPWAqrLkz4lFtxWoWrXI9PX2H3nHqrMnbW+EzhYeeXR86CU+?=
 =?us-ascii?Q?NEimXVpV4BouQTq+EGFo+rf1KdYMoYN8OT23mwwlusRo7NfE+iFvtB0XIQCL?=
 =?us-ascii?Q?zbQ7tC14YOHeL4uKup9VjQK3Zb23441aR8g/xuNcUz0yY8YWwgUE6pWBCC7f?=
 =?us-ascii?Q?heQJi7lkiWjZ9Qd6e9DJ5HYgoqMS6OMHnZ44OokFF6PLkFk3q8fkCvQeUWD/?=
 =?us-ascii?Q?+szf5tUXATH4A1RTbkXcpzCQhz8nRc2DyPOYb4p9hKYr/mHXH90kiK9Gzvpe?=
 =?us-ascii?Q?/oIdLuK96YukqcNVKXG6Ow01sdr48wxieYGC5gCqtCm69dZaugCNkm/sBGpG?=
 =?us-ascii?Q?S7YiCp6aMlPOvgpr9Y0JhrVizKFSUBfCC5sAkWiQQDtf4X/9NQr2U/LJwWCs?=
 =?us-ascii?Q?xfkygUNlh60+E4rb4neK6EBkm2CIbG209WVhsLJ+++YXduKKdGMRxpITxVSc?=
 =?us-ascii?Q?7JIs88vf3FxerY1vm5nbhofPLB1EGcWkYUoVBHp4sJlX+8dPvTy5srJuZ2fO?=
 =?us-ascii?Q?M13zjOtmRsJZziCY4z3ZfMjKZKeKoJxR/RfIMXXG9OM3bMQqjdY9SQZ/nAXb?=
 =?us-ascii?Q?t9NG8TD4iY2NSISnXuD7N6ZtYCeugyF4UqAcEF3BVv67kqwEbAd/XxGjeSKL?=
 =?us-ascii?Q?m8k1ku/dg84JHHWtZDUcAA7hDJIkHO5BYnpUGIQT76QbK2fzG4FXID52D9Mg?=
 =?us-ascii?Q?+2CmVITslmv/aU0yfLE2E3aId9oH6jNfHDIYTkILOVfe9PFxacuK+KFOkggQ?=
 =?us-ascii?Q?5cU5BYMTfD8cxJOzHoW5YqaoRFSgovUxpTcaJrjddZRW80vXhljlhkAzjAlP?=
 =?us-ascii?Q?MwJfJIoufV+jlOIESMDMGrWTQ8JVcbc6B9xC+j8BLUOXQJlH8kPn49Y/ugSn?=
 =?us-ascii?Q?lFgesMYXxkVNcOYHA6Q/ugOZWUW+lJMyZqjIhUsBOrrTdz31fZqCRyMtc77S?=
 =?us-ascii?Q?uO8CIm4mOHER6v7HICSb1+oLPtjAIjl0yqUqyRZcvWWIRsQPwY2/6eC8Pb4S?=
 =?us-ascii?Q?WQ3dQXq0oLqlsWESxd+2RGwUrhA/tAsuRyMGEuIkb4SYQDP1SLW5hLUDBD8u?=
 =?us-ascii?Q?gRr3cbG+Dv5+LGm/218V661I0PzpLbgX8suRLXN28XV0+x+hgF1/L+EDydVe?=
 =?us-ascii?Q?9dnQGjdyOAR2NzcQ/CyW685W8uxchoGSM3L/y7WY0aC38ARS74Ng8e9d666G?=
 =?us-ascii?Q?5KjnYqQbMVfl3J9M+O76EQ5t+7suIkoF6Il4YYLYZEFi27MD+gVfam0dUyhI?=
 =?us-ascii?Q?SE2JY0GnQmgkB8akIw0HCQ4Kt4qL5JvyQTpU6j82cVA0rWW4Jc9naP9MIf1r?=
 =?us-ascii?Q?S8M3x6JW9PdR2VyhLa6cgqpPYadwAIvzQZRFZ8IAQa1guUXKofnm?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e0b7b3e-5443-4771-39f6-08dee3c0b870
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 05:03:20.1719
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E2KA9o1qZlYkf8yDZg9b0WVpHGZiS+KJv5Tf4yHUi4Sru+Tv50BCz/s0QO0e56f6Jvi8WmUf2FEOJQdLMYtH/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4P286MB5635

The dw-edma-pcie driver copies static template data into a mutable
dw_edma_pcie_data instance before applying capability-derived updates.
Keep the derived non-LL mode in that copy as well, instead of only
tracking it in a local variable in dw_edma_pcie_probe().

This prepares for keeping capability parsing behind match data without a
separate non-LL output parameter.

No functional change intended.

Suggested-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v5:
  - No changes.

 drivers/dma/dw-edma/dw-edma-pcie.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-pcie.c b/drivers/dma/dw-edma/dw-edma-pcie.c
index 791c46e8ae4c..16bb938c6e40 100644
--- a/drivers/dma/dw-edma/dw-edma-pcie.c
+++ b/drivers/dma/dw-edma/dw-edma-pcie.c
@@ -73,6 +73,7 @@ struct dw_edma_pcie_data {
 	u16				wr_ch_cnt;
 	u16				rd_ch_cnt;
 	u64				devmem_phys_off;
+	bool				cfg_non_ll;
 };
 
 static const struct dw_edma_pcie_data snps_edda_data = {
@@ -326,7 +327,6 @@ static int dw_edma_pcie_probe(struct pci_dev *pdev,
 	struct dw_edma_chip *chip;
 	int err, nr_irqs;
 	int i, mask;
-	bool non_ll = false;
 
 	if (!pdata)
 		return -ENODEV;
@@ -361,14 +361,14 @@ static int dw_edma_pcie_probe(struct pci_dev *pdev,
 		 * the HDMA IP.
 		 */
 		if (vsec_data->devmem_phys_off == DW_PCIE_XILINX_MDB_INVALID_ADDR)
-			non_ll = true;
+			vsec_data->cfg_non_ll = true;
 
 		/*
 		 * Configure the channel LL and data blocks if number of
 		 * channels enabled in VSEC capability are more than the
 		 * channels configured in xilinx_mdb_data.
 		 */
-		if (!non_ll)
+		if (!vsec_data->cfg_non_ll)
 			dw_edma_set_chan_region_offset(vsec_data, BAR_2, 0,
 						       DW_PCIE_XILINX_MDB_LL_OFF_GAP,
 						       DW_PCIE_XILINX_MDB_LL_SIZE,
@@ -421,7 +421,7 @@ static int dw_edma_pcie_probe(struct pci_dev *pdev,
 	chip->mf = vsec_data->mf;
 	chip->nr_irqs = nr_irqs;
 	chip->ops = &dw_edma_pcie_plat_ops;
-	chip->cfg_non_ll = non_ll;
+	chip->cfg_non_ll = vsec_data->cfg_non_ll;
 
 	chip->ll_wr_cnt = vsec_data->wr_ch_cnt;
 	chip->ll_rd_cnt = vsec_data->rd_ch_cnt;
@@ -430,7 +430,7 @@ static int dw_edma_pcie_probe(struct pci_dev *pdev,
 	if (!chip->reg_base)
 		return -ENOMEM;
 
-	for (i = 0; i < chip->ll_wr_cnt && !non_ll; i++) {
+	for (i = 0; i < chip->ll_wr_cnt && !vsec_data->cfg_non_ll; i++) {
 		struct dw_edma_region *ll_region = &chip->ll_region_wr[i];
 		struct dw_edma_region *dt_region = &chip->dt_region_wr[i];
 		struct dw_edma_block *ll_block = &vsec_data->ll_wr[i];
@@ -457,7 +457,7 @@ static int dw_edma_pcie_probe(struct pci_dev *pdev,
 		dt_region->sz = dt_block->sz;
 	}
 
-	for (i = 0; i < chip->ll_rd_cnt && !non_ll; i++) {
+	for (i = 0; i < chip->ll_rd_cnt && !vsec_data->cfg_non_ll; i++) {
 		struct dw_edma_region *ll_region = &chip->ll_region_rd[i];
 		struct dw_edma_region *dt_region = &chip->dt_region_rd[i];
 		struct dw_edma_block *ll_block = &vsec_data->ll_rd[i];
-- 
2.51.0

