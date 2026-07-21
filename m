Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11021086.outbound.protection.outlook.com [52.101.125.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9F8408636;
	Tue, 21 Jul 2026 06:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784615325; cv=fail; b=jUeE66VGQ5Ism2YXcjdbuewP/gqacQ34kHIUvH2bO4iLCYNcaAYug40sgyFANpcAyuhRvJ6cXAdEKSsli2vJLX4YecR35JIw3qELLiEvNgWvKHVmCwGyJTfiJtI95Couo78pETKd7L+dHpWrwj9qhRr0Pm59yr9BxmFje3/60Zo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784615325; c=relaxed/simple;
	bh=O+sOIj5M6IdKUIvDXamruU2fNdfOTm7vabRNu7DhNUw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=evCYBjdo9ZWIK8JUYWVZLGCv05UJ+TFfKmnN8v50J9G6XTVTBc1twE6IRLo3OvA6Yuhn8SAya1XfxIVNZolGbM0XoXbQCzdFF9uwPdUfPAtKswfw7Mw4NB4eY+XPOnzOrfvd8ySYDvrP0q9ytqQmeT3uFUYipVLlarjHI+J0+KE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=sl5vtH01; arc=fail smtp.client-ip=52.101.125.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="sl5vtH01"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cakrv1VN0lB0LZsGXD/ghO4duuV8PghukxDImQQ/CEo2PefbmxtNNVf2kskxR8SfL7gNcpP2nQS52O2Xv+xy3iiWSSIls6kQ8KS3a06Piswzn38v79Blg/3+CDtx6cYH/zZevh+h+IWr8/bwEl1cfDnDmTQ0LepThO3XX8dqWIsuJLm4nbwXFddXp+6RoZGrGM8MI8NNFWcNXX8UeiftFH/FxP3xnIxsFZiX0vrCFOc/mfkaQDcoGULHeA7Q46i1NAINY/xX755g15CbLcVtc9XiFOG8zOjkD80C2QdOMGx/HjF41WGfYKmt3Zn3UGNVdA48yDYHIwS2hGejt9Vw8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1f+c3l44apF7/RJaX4H8MwRbYZhr3wQe0vcMae0U4Ws=;
 b=dU9UFyI0I7ANfoKvl6Ox1nLZlahQ1EDfaeBfXOhc+vIXtPiM7s4NgQajrB4vjZBwR5/CHHmT9bzdZnBZZeW6W0V1wwEhOp9HEead4WWLN/kEm+P+Kkr7OuVN2ZXQx4UTf0QJFwozulWuWs7MhxkHSK0/rDJdDaw6EJ9QFb0SMfTnUK4ycSknD7K3mdeJU6j9j4X1TOCpPZF7gqoPT1cYJiTfhma1CGv6a8Q4ENtx19u7RvQhsOAwm1vMWlDmWnLnz8yvzY2+0XMcI1j+SxHywIZiCpBTxHLZAsQ87fJHd6zTaGVef4pKZOsvAJdPvXzI4KrePXFUYH8lrrzFMgs1Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1f+c3l44apF7/RJaX4H8MwRbYZhr3wQe0vcMae0U4Ws=;
 b=sl5vtH01norNpDmC3Iodbd3XQp8Hl9rJeOuHYfMEnMOb5lXJ4tJb4AF+E+mND8CLXaEi2eGcwphmESnfmt3VMzla9m9SPjELvbUNiBPof19sva0sV5YgkZoLEgMIrVkPOicwagOicKbCdPvjtzR3dapfZkrSV3x/wLp7qbjsFJE=
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
Subject: [PATCH v6 10/14] dmaengine: dw-edma-pcie: Add register offset match flag
Date: Tue, 21 Jul 2026 15:28:11 +0900
Message-ID: <20260721062815.4117887-11-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260721062815.4117887-1-den@valinux.co.jp>
References: <20260721062815.4117887-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0077.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::19) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OS7P286MB6796:EE_
X-MS-Office365-Filtering-Correlation-Id: c491fecc-8ed3-4987-bbb1-08dee6f1453f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|10070799003|366016|376014|1800799024|56012099006|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	kx5hq1xpQEeuZ3oW58v6OQvqh8ZanghdOQKaTQjCJt8eXgue5+0TkBsaT0Op8dE44KEzVLa4WEXFbi2hpIb4dS1LJQGFuOfrvD7fiK+9YWgdTbOGHGaOqs+zkjqJwf9dyJJ3vYwDLlmPOR5NsEYkW9cJdkX3rsjcU9d406w08uiWSU88ITsNaCz+SKWnGQLz2NEJ8RTm3oiRJP6d/hvbN/QiGmjMf795xuWU/syzlg6brulWdW/O4CgeSdBwILDFTN0tUDE/B8LlVBeg0CBZGL3aPGj7828d/IIDCj/sN7ifWNLStcsBNPYZP1j+NnOreqi7k6WKfVNkDYY6wDeiTuTvdHsWIl9PTqKuk46LAKHsPn1iRiEPj5BqwIpc0X2iY50wPHScGirfEPHRrXCwGaEclTMgyK6gH5xTwx9jhiNTeAotHHI/dglvEN6BbO/37d6zugWYg/vjuwEIi//AxXnScOPCWBK52nQEuVxbQZ5CuUsfjRHyDuCq+IPCpVVw1h2N2OeuNznwY62970etpWnQnmohyG5x41IWqoOPzkl/UWSVIHnBV91silf3YF5EaTU8ZsW6VYwzNQpRF1yb3aM/ymH08yX8ffF2bLS0gelYia5yKbxydTEW2I15DfEsZ3xeSExDOqL9CtwtPG8ABKilJohmOY9ByJvH2/vhVx0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(366016)(376014)(1800799024)(56012099006)(10067099003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8LfYeM8EcnPbe1XqjxR9S7CJ35xkLRCmNIBx3dnEweGkHV5VTXLWFxUVaBp8?=
 =?us-ascii?Q?z/3kDOgofqK3DghEHB8GBWaQB7GZhAiYGoR5J47XKv7JH23IRyQ5J/rR7P2b?=
 =?us-ascii?Q?e7X+MsrM6yqIjoa+oa5GWgUrFiHgLXkitF4ctc5draEMFfgIx2WSMyyaCBq9?=
 =?us-ascii?Q?NzUfgz0cdAH/pbpUMHE4W+V/uTQ5MJ97VRlZF6Z/NUIiR2keelNyrcHM/SKk?=
 =?us-ascii?Q?D6Hg8ON+wq53s1IZfSlN/xCAekExhTq0KiYjY4qhi1PTEWoNQKwErl+WLFDJ?=
 =?us-ascii?Q?LzMk8Lw/RYhXtI6CeuU90NMuZJElZE3/R05ABBKq/Dzv3c+XHU1hY21ZlqSw?=
 =?us-ascii?Q?zYoQ7AYaDJGHnAO+GAT0kDSyeR4kGf/fiFtxnsB0E6ZE45+/Rn3O7Di88u9+?=
 =?us-ascii?Q?sIZ+jAbEq8MA9tRadLNI4teC/qYkqxkN/1EU4zAO4L4nJBoRWc6cKy6yo0UI?=
 =?us-ascii?Q?MpIkqVAZgyQlkj2A9MoQW4SzxH1uQaxod4aCaUkyxeer8Tfiuhf9yEiggZ2s?=
 =?us-ascii?Q?LYJ8IJBUj4z7a6Jj+Cy7sChbesRIjLsk06YGXJyRc8YENQ0BhrvzwkcelKsL?=
 =?us-ascii?Q?4mDITF5LaNTbwix9yAvcdcIvWfVQhpRNf8x0O27q8TCpcSrMmCVhglpuUnZ+?=
 =?us-ascii?Q?6TKzVU9Nwc/SZSNd13CbkykkLGBAXK8wL2KbbwujCQvitLZXk9x+NHub9Vuk?=
 =?us-ascii?Q?rDEgz337gCfm/GXpi2Z3uRTqF/nk6r56mzLqkrix49k13nIeok/LeNOyXJDj?=
 =?us-ascii?Q?cCXb5ahQ+qYstPeL3twmd4vjB4eyOYepJ7P+ycsK80+50+sd9taQ2i6WNPw1?=
 =?us-ascii?Q?yHTu3CnPSQf2vAkHjIvdAuJ1jIySr1jKiPwmmFrLsROO3Q02ZPplH/rC+JU7?=
 =?us-ascii?Q?+dFpGaG1cg5aSVOZ08uDrH6lB7DePus6H5rDGG8xvntPDa9XHv5KcmnJbGR+?=
 =?us-ascii?Q?QXmOr0XGkr2XLjPi2zhUrjFoRNHO1V0/8XVdx0GIHJdBs/fzT0KOY7KCsTpw?=
 =?us-ascii?Q?VfsEQ7xgiVxBN9nh/g3IEgW2glQzbLoN8s/atiiIVx5s2WN6CME46vVwaAs0?=
 =?us-ascii?Q?TcN6/PaUKvrWDKjg+oE1df9cR8X0YWJHgsJhvZ23+B+k2H+2qUICyRvJjDRY?=
 =?us-ascii?Q?CeyPaqO4rooe16xv9iiDeF+N4sXy4s1L5bQLAr6qaVPd6LqQcrTrm9hha8MK?=
 =?us-ascii?Q?0bXhjAaBuiHMjyqxb0xqcKiKHP24ZgPk61AzCRRtLj9PrSPgye0Wfh4yKeCC?=
 =?us-ascii?Q?q1VgugJOfEBk4tsQEJnUMAEwp5vCNwGChyz7D2uzJjhE5KAwvMYqCwmEJ3ep?=
 =?us-ascii?Q?CH1chaJQriH4YveSY4+lR7PJqrXI+pKIzvP1EK0EztiP2Eq+PmIenCf19Uu1?=
 =?us-ascii?Q?wUhgQS4XsBq9oNJZriqsZAI8x/+Ll0B/XdG07cB9Z2/oaGmHYKx0Bs6VP4Um?=
 =?us-ascii?Q?qI4a1PuspsXlOiblh9z8k/FBSpNk70g4FZUs3BAfBJix6/TfcHxbTGkmmXjV?=
 =?us-ascii?Q?yNNjw3Kzpiy0VIv3kzHgL03VEX6Cjd8wK7xdSGKMNNy3PlNDBNY7bOTwBJj3?=
 =?us-ascii?Q?VUsy7qiQfoTfvI6pzyMXXLuHYcOdSe7pGNx1T0NsCv65MHf1TVFuqJ6aSig/?=
 =?us-ascii?Q?mj1ynmk2WJvy0R7Nm69sS/wRmK9dJ6ZLWWze3Wpzkdzoeh473x4guI6qk/XR?=
 =?us-ascii?Q?Q5q2nww48niaQjCNrswe4maK/vUdSUyd9w/W6O31Zch3CBh0uhPwcJW69mD+?=
 =?us-ascii?Q?gK9sFHwgN6nvSoAvuXyTB5NxexrBemk8P0FxGJqlletUljbX3qgl?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: c491fecc-8ed3-4987-bbb1-08dee6f1453f
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 06:28:25.7038
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mBfpUrTcKfzM+M7bOfuNmOZ5YWJRC9uULVUS810PyzGm19tFNfKJ3nGDxTd8X8S/NwcrodOhK+VWi7hk/Egpzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB6796

Add a match-data flag for devices whose DMA register block starts at an
offset inside the mapped BAR. Existing Synopsys EDDA and AMD (Xilinx)
MDB/CPM6 matches keep using the BAR mapping base directly.

The offsets handled here come from static, trusted match data. Later
metadata-derived offsets are validated when the endpoint DMA metadata
path parses them at that trust boundary.

No functional change intended.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v6:
  - No changes.

 drivers/dma/dw-edma/dw-edma-pcie.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/dma/dw-edma/dw-edma-pcie.c b/drivers/dma/dw-edma/dw-edma-pcie.c
index 99ddb6e6da34..4b2757c1eda2 100644
--- a/drivers/dma/dw-edma/dw-edma-pcie.c
+++ b/drivers/dma/dw-edma/dw-edma-pcie.c
@@ -89,6 +89,7 @@ struct dw_edma_pcie_match_data {
 };
 
 #define DW_EDMA_PCIE_F_DEVMEM_PHYS_OFF	BIT(0)
+#define DW_EDMA_PCIE_F_REG_OFFSET	BIT(1)
 
 static const struct dw_edma_pcie_data snps_edda_data = {
 	/* eDMA registers location */
@@ -464,6 +465,8 @@ static int dw_edma_pcie_probe(struct pci_dev *pdev,
 	chip->reg_base = pcim_iomap_table(pdev)[dma_data->rg.bar];
 	if (!chip->reg_base)
 		return -ENOMEM;
+	if (match->flags & DW_EDMA_PCIE_F_REG_OFFSET)
+		chip->reg_base += dma_data->rg.off;
 
 	for (i = 0; i < chip->ll_wr_cnt && !dma_data->cfg_non_ll; i++) {
 		struct dw_edma_region *ll_region = &chip->ll_region_wr[i];
-- 
2.51.0

