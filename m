Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11021110.outbound.protection.outlook.com [52.101.125.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99FD40862E;
	Tue, 21 Jul 2026 06:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784615317; cv=fail; b=ggjDB5BZWDgZQrlfEPuQtbJ2XAz7zsPIeI5YqsUna5oa7hOD7a5oXfe7sDg17Z1alDKRi2H5xRtTWYBVDaPFg/GzzkDRUbBq+suiJ8v9BZKxivSk9Z3Q+/7vcJp4Op0LyQCzzY6zZZ+Q+gqvbLNDL2zBXnnt1QOJLYbHJ9sZuSs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784615317; c=relaxed/simple;
	bh=pX8Z2P4gdvcENudjHzOwOmYNW5KPwOPK4i+LF/c0G88=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YnPm33tBLfvi4zfLMZz4GYq0CKpLFvhxM+tfor0/4lk1TI+iW/qYkCX/uGNAeq/z8hBihf+qp8DWdlNcazo5UEpBTlbVkwlKBKpUvBt+AnBuuTF6ZRCDixyn7QiFZzKpi4LFuv7adWRTvV59LZ/AcpxT2y9qBGuRIJ/zhYWCjdA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=Zn7hs/+G; arc=fail smtp.client-ip=52.101.125.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="Zn7hs/+G"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rM7miwp/cVt1cGG9XXVWrvNkyOyMN01SV3Hs2IRE0QNb2SKFjtfvmxFWSyyf9HtfGTsXg4581DJQ4I1iQvFblcQARIefeQmvSOqWoweFBkQ/0bqNqZJb4uNpQSVKcp6TU5uhVBw2gauDf56lOLqzqMqk4YT5/w4yPkyyOuzQ2CvhNQIzREq0BFQT22+0rWgqPZuDdS4m+DlXgZQHSeP4i34UuBc8hDAkpZ/uoLyGL1oboxPHFE+PAM02buXLCCwVrr2Ok+Y04aRuU0ruY5/DCSfKHBhlj+e0M5TsmzmtxgtmSRdAdv76v7/WKCMXX4Jhg1+5Ox3tqBuQmVM10MG/WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pQ/tY2TPjgRIY35vWAfjO6lsYGtZpTRLZjkVQ/dYuug=;
 b=GuSvkC2L4dGWl2+4WJVnWsSMY8QlYbps/M4u5HnCUkjWekTB4dIeq6TuzHqPO9MaPOj0D9oOKjGX6gZyam5rnVmOBPN9Oe1ZirkpCCDbfXd97ocD+9gwyQAHOWvmbJiWI0stK6Q99XiFfvacO5e5lRPLsMVmF+IrspCf6HFSjM7gMRGPNa0nVjwVF4Vu14KbjEOtB43CGSShGnNTS8VSVd9mW4fGhy2n9cyG+tuD/JayJlnyT2PtNsx+htnU2LjUoo/JqzOt7+d/WNy5UxPJL9ipFT5PkTSIxCDPi6DXg3uEm1y5o/gI1IFqVPYe/0JtjgVa+11+oscbMt43i0ok1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pQ/tY2TPjgRIY35vWAfjO6lsYGtZpTRLZjkVQ/dYuug=;
 b=Zn7hs/+G+7N5YAYsdbcpHAyV/uL4CbpSTwQ/I8e0WnF3DGkvq61+Unoexaz0smkIX7thyvRSoTmg6/hb3CL03J/ynnjO+pDEy9aR4xtGO45n21TBe9YTVQ5b4NNSTKW9Y4h40TGVSpeu0+sKl7JLJ8R4rnIHeoQj6afGeu3DUq0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OS7P286MB6796.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:432::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 06:28:22 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 06:28:22 +0000
From: Koichiro Den <den@valinux.co.jp>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 06/14] dmaengine: dw-edma-pcie: Track non-LL mode in DMA data
Date: Tue, 21 Jul 2026 15:28:07 +0900
Message-ID: <20260721062815.4117887-7-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260721062815.4117887-1-den@valinux.co.jp>
References: <20260721062815.4117887-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0052.jpnprd01.prod.outlook.com
 (2603:1096:405:372::10) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OS7P286MB6796:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bac46b0-826a-4b42-3bb4-08dee6f1435a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|10070799003|366016|376014|1800799024|3023799007|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	LpThc9609bSOSF4E9dpHRZJhLDhdtqnzx4CvxUMRB2ThTzI2lT46Gt8v1HBTAFwCp4K4shFn+PSaMoApx6F9GV281whw2kHelOf4k3NJFbyp66DopNxj4ZHqlRElUzj4pbE75E4+M5q4xfA9DpsR/mWU6NvzSEspXFqBeK4R+TjFVoFdnw06VErLEraonPT9+chfdF5n1qdhxKVlBue9jg63hDKlBuE8pDVHK9Ir/uFdzTwQGVDD1mFb+3lpFwbXBPMqWsLEIu7kPgzNY05bSv8ISFqrm6ChGQw2Ansrb+qsRucpao24UlR6c/bl02mdXqZ0vWOd5JsKypMGIhsfnNrv/7x+AhzrNS5mRR/dgilw+QGbqEa/pakpY4KMHZcB+hRlEVxst1YRvKTluOQAJh2NLTliHV9IzpPymsAGn4js8qNn4rh+5piFtSk0xe/6rm7jI4WyhSbl0jLNbdqrP9tj/7mGa7+33gkub2L7tUhmtok5HthUyXiRmXvrcq5t0DtZ5uhRgi7M/242BprhhaqT12MustA7AwLotg9GmSUJ+IWSYZQ5++bR06A3xhGuNn7Hjhj7+QOwAmC9JiQsE7g+96BnNleXRUlqx+Q937tbp+V3iad5zniQBosly++Qe5Ywt4YWlL+xH75ybC+SqB8BGmsr7eFNEanHIV+tVDU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(366016)(376014)(1800799024)(3023799007)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6Hcqw/UTWWfJgc2YmWEsjmYglb5gwf7f/SfJ9hJ2oZ8BapQ3M1mmsR5jofII?=
 =?us-ascii?Q?sdGfuyFkCN8kl6lGXT1DC68ISPmjAl7AZsJey1kRx9+vXoaXywhTR/ccKapv?=
 =?us-ascii?Q?prMLbTMGWFuWtSi1u0N9/fH+ZLsUSiIhU2HOV0arZ0tKkhzwmnhYx9mieddm?=
 =?us-ascii?Q?uq/Y7YQ3Eiu/bkVnklkBIJ2osfEr2Lf7612BkoUp4SJxi3kHqCTVoQIswVUv?=
 =?us-ascii?Q?LrxTTU+NlY1omVAJkRYB/b85+pI0LPsyALteobXmn3Jco8SY86ZH+5BCJZzR?=
 =?us-ascii?Q?2RbPoFN4dTho+xwfedRlzrw0z3eFKAMfgOisJwQkZDz0SfTFKSvN3JrxuNpE?=
 =?us-ascii?Q?3b8R18i661ODbtiUAzMAsJ0D/U4+OVZ25AhW1sd94MgWQ1LmzCAdxPmChc7U?=
 =?us-ascii?Q?h4zRWXdvmxcYKgjNeQWRkH8Ab30gvSinplLcQ/OLcCrXeNDpR1bQHlrjYiDF?=
 =?us-ascii?Q?xWzZV3IBVYNEfzEfbTptcWNjQ8NWaXHfEqQRJo0QUawfBvoJLTaqi4SOt0H9?=
 =?us-ascii?Q?8G8nob2ssnUHjL/yW4ldz01PnmXonjICiur8d/gnxbERE6QabUhNlfmYoncj?=
 =?us-ascii?Q?A+jc9EVqJwVBZ9TFsdyQWaYZf7Q7Dq/tsX59KjMbNmYDKUpZg76Iu224FVEu?=
 =?us-ascii?Q?82wRyGdHCrIx99IZ1lM3eOcAg7F5iTfpvP3Z3UhAf0p42w4hqLh0XDFs5OYf?=
 =?us-ascii?Q?W3Ke4fLcYQ8ZOy1K0zI0q5aWfBHZuFSoEJ95ebQo2YUvrZ/eaX35t2iZ36Dv?=
 =?us-ascii?Q?qG0DnaaiueEp/jBmVK+kE4yTUPJeuZIU0+RBCiDgzihZ+YULopOVCKA71P4O?=
 =?us-ascii?Q?d8w+hKd3jBed8PEo7eHW2mNCf+nPmSCmP8EuGnJ6IyJd9vY1x8LQrJE/ZnbX?=
 =?us-ascii?Q?SwdjBIicCWWcmlw3ILVnD3Sk2+zClqYxqzr/XfKRf+bceO2B+hovaGNa7NWF?=
 =?us-ascii?Q?mSWH2evf3q3QTrBtybiO3WYgKc7m76Yjy0MsHiWgsTtgWqyU19bncO9itDr8?=
 =?us-ascii?Q?YHZlWAKH3ezr02dUeF7GQMwQPDnGQ/BoQLKexlFKZRzGBZAqfkqs/+YrKrWc?=
 =?us-ascii?Q?qoPhmr/rXadlz3JgwgwLJsBbS49V+MZK6EuWt56mcwMS2Z3G0lc9rLxJtgUc?=
 =?us-ascii?Q?sQtvHVc0DyYSZByROTGMjs0CNTs5sdg3B7wGTBSEErVpaxQFpPRDFzoEbMyh?=
 =?us-ascii?Q?PlULtBCgShmbsbmysjBqFr2+0S9lPeczL8TTrUVhzQjrumrNZ9r2H0phVfdy?=
 =?us-ascii?Q?hjDhTtaBzzoxeuPZs6S5hGLuo01oldjO50BDEoAhwfAZCgfucQiO5LKwEGG7?=
 =?us-ascii?Q?/CVwrEtE6Oytk7FRnLpH0dhOY8rUBYnbg7fcd0I+RyoRkeUQtmJizd4eQC8S?=
 =?us-ascii?Q?t0TYUY9HL3XWykNyWdYT1y7xyBN2sQGCoSd5aUokKVV2Ds7fLoI79cOWwYHR?=
 =?us-ascii?Q?iUOhknqiuiDJktZjUgHm9qyU24RM+ozwkIg8ydsXWs7F5P7QbZaow/5FNmBI?=
 =?us-ascii?Q?mYXaoZFL8l7COloAslk+vfzqdWEMiZhc40WQm9Pq8Jn48yiv1Hlg18j+qmHL?=
 =?us-ascii?Q?4/S9l+mmg0cYwiSBNwBpKvULbyRC/B2GH+RjNRAbuTdp/Y5LoZ7lL9ddFlvD?=
 =?us-ascii?Q?Bl3DL6oKLwHO2cQeXiI8umsfvdojUqBlKAi4cVpxuM+gbuvi2gMMQrufVTME?=
 =?us-ascii?Q?ZhYrCagjxgXrIHLf2wx78iudm7NK9baHM5ja2xsC2emx6Lp/aJ/nFKJMp6rv?=
 =?us-ascii?Q?jpHsl9rfQ+vTbNKY9X5uF3yFGtmNyGgp+oLn34tvUPRAmU9xQnAt?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bac46b0-826a-4b42-3bb4-08dee6f1435a
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 06:28:22.5370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: slzAVmg64SQC5jxbedaN8bZ5+ZB1I9WgsPhq9DgKYKxhJsXlyMFhisGjS55eYhCFD+AVscDBtwvUf4jwypA48A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB6796

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
Changes in v6:
  - No changes.

 drivers/dma/dw-edma/dw-edma-pcie.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-pcie.c b/drivers/dma/dw-edma/dw-edma-pcie.c
index db7f1ea35bf3..9b3d3df2ffcd 100644
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

