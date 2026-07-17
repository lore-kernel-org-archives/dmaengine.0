Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020109.outbound.protection.outlook.com [52.101.229.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC074375AB8;
	Fri, 17 Jul 2026 05:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784264617; cv=fail; b=Nfagxl9r71SF7f3/WzDAit/t8+9auziUpuMSQodS3M7B5gdBAE49xP+/zKvfTZ5sazNxKwEUKmIhnDAkk/stj5jIUMoY1UABdmBTZHedqazb60/ZjQCG6rAgKXOWLVv84IcenaJe/DDjd0cS9dQyLKCsigbL8/H74L3oOEu2KMY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784264617; c=relaxed/simple;
	bh=qgzI1MvZ2Vh4WDykfhiQ/LtCwvOEPlNuKy30oHu0sqM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hcFNX65SZ+iEhvHZ6pzEAyycAzW/LF8EWZ1MIl5mx0A95S3DPfZ62EaaaKgNAKPhF51yh4pPhyZ1oFabSYk5S7jjsQRY1f9I+ZphWhNeeNs94SF0IQrv8WbFXk8wHbow2w/kRSui+sID9oL0FWrujrBdhO89keyVOuaM9aCK2rs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=uCbPxsit; arc=fail smtp.client-ip=52.101.229.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="uCbPxsit"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ye/DDJxKN74WB1dUn4azFccALDLJCRQjdJMU5MwcEIEjFCVD8Vnt7QLrhswBqZq4qySzqHkVHxqaXKgEonez+0gVI5VPG2suCxDeitGT8b1dmPtS70lbAugjjltsnV8R36MyJ1V1K1RX8rb45htH5RRiDMyL5JavoDDuY899JXionVR3m4U85TlYCmT92qUaer0ydomx6pEsGHS1LadtCWKGfuGBSBvsQfmNV4HPYe4ryn2FLQVsATtGH+JoH6glEeS/khvk9u2roaL7OIETO5CceTbtdThOHM960hFLHFlWbuJDmfmF1YK5SAPYfJsWuIStu5eVURIh+XGHSCnQcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yRF5/zvWdNtDPYBA+iSYisZ21X2Ycx5idGuaytAorQc=;
 b=cDU54P4lDPwPyBj9Oykh5lhGlJqjh5++SRJWFfgcsGWOOWp59UbtvYoCTkknWi68GvlIGKG0JcB6w3EsmBghPKOdi7eOd5dNsB/3EJ5bTaZu27c41kI4Z3/cQFrLtSdp4fy30ktQftpOCnDqlXvBYFq/X039IC5SZ8K9+vgI4KBRkGXh0W8nbcUxmZ7XJI5Q/RnR4/RJv0wQXrYLWyGwCF6HmjIfOjyMoh+viFuthBs/0SGJApiTg36R2z93/xGp+gzY6cUBy2B+btuohYEaafIdGjx4oXULumH59H8S2hvL+ZyzsoUztXBF0q+LBVYHoXGWrv8plGzjnehRd0FnCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yRF5/zvWdNtDPYBA+iSYisZ21X2Ycx5idGuaytAorQc=;
 b=uCbPxsity4N+XgQXLwRnLfF/BhXKOtbixBxoZi3abD0/iz5NhIHeLfeqO5EeFPSrc3CYleRLdNMKKzVIy1QR68pi3FVaxJYYIGahyISRE7Umb4rCow32XsQpEFjdEZsEIcAKepFqR9IXhRALGrlJc9bz21OcFfA38/WtULMpy/s=
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
Subject: [PATCH v5 10/14] dmaengine: dw-edma-pcie: Add register offset match flag
Date: Fri, 17 Jul 2026 14:03:04 +0900
Message-ID: <20260717050308.2144108-11-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260717050308.2144108-1-den@valinux.co.jp>
References: <20260717050308.2144108-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0058.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::9) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TY4P286MB6313:EE_
X-MS-Office365-Filtering-Correlation-Id: fd135f1b-968c-4da5-a057-08dee3c0ba8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|10070799003|366016|376014|1800799024|10067099003|6133799003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	eIcEkUSFr5XiaIzAPgv4Ypx/tUYuk+aJFqUYeYDDyTMDUchvXsRTuZ6Iwtm1kAh7jtMixOKdzjFz46fOfLOq9pnSqj6gCpNQ1BYxzmMA3R7I17mfTbnJtSATo4NwWmduw9DfYATKMoKmtpiVcr7AZWzMkOgu4PS3k6xapFHwEPF5jHqih1jyUBglmU3CG/Z8BfBYgaj/AulTnzmAwhGxgYAsXzPXkRJdxwAHcYlgZzmHs5poQ+/QFLD2LlUTxnQqTGcvjCi0kM4GZiOFv2+KhmxxCAkHOsBXe3oD3jmk3A9Mzy0U6YrwoH00UZiLHR2uUvCeRSRr1p0IDt3IITCGQjh7HxMIwl+Qc/zJH6Yy/3vGQvJxIevIL0AXJv2oUr/y7Szx9SjMTeaTF2L702NET5OEjdTkdY8/43FtYoWJtxbCA/hfMDjMihJ5Wb1kVISe/j9hlyDUgq4NGbwZcne1SUIXwhjHhxe/lAq2Bx/wa4rOExODuN8CtYMphbot9ualI/XLGpKLcKpqJPKr5u+/g4kOcFNT1HRk4WmdOY2XkDlpqQbX67RZRA22S0jJepzxQ7FMh/CHUjUmsK8N3y3nbu4loi+c6PAPSYXHxbDlQ1y/7fgwnqn6vjilbPpWx3EuQzuKIDbllowZ9NcwAKs9FAcuPaSHSnw+P2uERE9fLkI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(366016)(376014)(1800799024)(10067099003)(6133799003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OVaG2F8TTkzvW09KhQkY86mxzSSc4HBkWYdYyrK6ov8vze7Bk2IEbTeqH8Ek?=
 =?us-ascii?Q?WmWbuUZFxggFTBWjeI+UIh8oQtO5IV1WEgAOEK5GsZimVVWwdebYf4cps3rr?=
 =?us-ascii?Q?V2Z59YfXLueWK6/8e2oVuqt8zBdLzDqRgbQWxUzsHPw5R5zQd0W70240toX2?=
 =?us-ascii?Q?ltZPdtY0Q2gYNTypkH50+GemxVUFB4q2oi8SgCtX/wdjtMKYgAlY6RbcI2BJ?=
 =?us-ascii?Q?KEsOO9Yd7b8nwNl4C5SUsC1yLi5CWpH4oTjiP7EzawQxlZ3MxOav8RT+8Obn?=
 =?us-ascii?Q?GZPkadePJ2Q35ri+Vs+nCnt1vvoLG63geotaLNIb+Oem8Szo5V5XGl0GXqcW?=
 =?us-ascii?Q?OsaZh5H0MjnDUSul28Of8ctmqcoEQmdpmZY2qVz97I0ausVeiza1mkkrO5r4?=
 =?us-ascii?Q?x944ibVRVeJ1AgRvGazL2iUVugBXXFVSqdoWTBUGZs5mxEbyjte1DlOKqNuN?=
 =?us-ascii?Q?byPF7jVDGxvuoA2v3krgY9y2EkpAPQxXk6rg4raJ9DwVChSEnTuBMQ4mSKMe?=
 =?us-ascii?Q?+WjuLZ1zwb8uekJkqdaWV9jLlAvTTyTNCeI9aPWTQzDmdNA+pyXhfjyOljdm?=
 =?us-ascii?Q?6KBQ7zuPBidjoGxJRzZPZrgVuemTg8yF76k/DSau20saiMjtgIHX39vIjNN2?=
 =?us-ascii?Q?Z5w2O6wKZdxUqzKCex0y3ULHFiTApmKq/2+ALY7gjt/V/M+aFyB89mJq1CuA?=
 =?us-ascii?Q?EUGvUeZCAIYvJA7RYoaszKeofnkVGYcDV7rPf5w1lF2a2RDKbMEALKaevVhO?=
 =?us-ascii?Q?h0RBIo3aism4qsABH3KynEiPUHO/EOXWrVaKvaPJYaI5GrtvbLy1zp5Ib+09?=
 =?us-ascii?Q?rVgqdJ1HgBvRMyKBtlrIwkHUqouEEb1dENZfGSYCSlRzgUhqSfMnvi0GJ69H?=
 =?us-ascii?Q?4xnuDTPO9WWHaZhfAi1lj0W2K9xIMGrpFO4OH51UlqXmCq/UBz991szpWSVV?=
 =?us-ascii?Q?DSiXrVeSELPyyM+XX/zcCQBT7/lqO5H57kHRdPhsyunghEZ1I/rXa9dwJLpH?=
 =?us-ascii?Q?0gYzEyWIxpfvHnWe24EacQcmxSGG/gjfyV7BZgG8W8b1hbUW8N4HkxGudFt6?=
 =?us-ascii?Q?4ahGhNIkAY26bY8qwEWAU0Fuva5kO6rTvGgVlkBtTG2QFAF171/bZ0jSwTK2?=
 =?us-ascii?Q?UdmnSbGghZgAfvpUqfybT1wzV9vRm6C7L6yheG4kq9kWnNKXt+BakVZU30n8?=
 =?us-ascii?Q?8fEiYl/MwFmX4pt4QsEU4i4VIE7uxP3zyFU8T4G+81jhS/o7lmcYoVZ5V6fP?=
 =?us-ascii?Q?oG0CpHVvNp5MvXiCpLRB4YNJo3cBIVddCu6Cc6NcbBbq1VXfhSjI/SUerzMu?=
 =?us-ascii?Q?pB5bP+F0l01QDDpQKMR8bUMAYdMAfezHUUTuLPEvmAdYz2QVrDInL+uZhA3H?=
 =?us-ascii?Q?nLs8AhGcf7+UEuaxsb9lZfKTpjG8ZL7+TQpFa58bWJMY/9tXOAREgX6txBOU?=
 =?us-ascii?Q?V8evr+DhzndZfJwsGKVj1hPXNUwDZQokorL+6PjdV7WTFg0NUHRA1U44nKSI?=
 =?us-ascii?Q?guey2AEoN1dSRgjcxsVwEe8dYzA/y1IFm+bw+/bO9jy6FulwHgGOWDNDu1Yj?=
 =?us-ascii?Q?K7m02BKsxy1S/F24pFvVt2HQzkCgNmi3X/0ZOSsN3BFDibiLalVCeiSLRqz9?=
 =?us-ascii?Q?k3YihGJAMxrPFEUhae7vrAHR21FLMXpT1r405d2WXhzuu0WKztpY7FhTtXG6?=
 =?us-ascii?Q?q09RJWnH/zwAD1AcwVaemWIMc1rxAKt51338om3nGVERqxFSS5uEtzTB+3jr?=
 =?us-ascii?Q?Qd5fCIRLWsE1WUsN1Xs83dvkpstyVGvrc5fLKPPo3DLwpbbBX5lF?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: fd135f1b-968c-4da5-a057-08dee3c0ba8a
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 05:03:23.6895
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HCpytiBx1XjKm81Cv/JkeawZEljvfV+UlcbJdS72aSim2bxRC0KXIpRpVAETxMODE1CaiHxdy8/YSl8sPaT2Nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4P286MB6313

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
Changes in v5:
  - Fix broken commit message.

 drivers/dma/dw-edma/dw-edma-pcie.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/dma/dw-edma/dw-edma-pcie.c b/drivers/dma/dw-edma/dw-edma-pcie.c
index 531d1227a012..327b59828bfa 100644
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

