Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021140.outbound.protection.outlook.com [40.107.74.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DAD3264E0;
	Fri, 17 Jul 2026 05:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784264614; cv=fail; b=Z9YZKLAnUWQwUb5wWxayxRMDu3MrYeOq5PWCJD4NIokmqRuV/NiKhhPLwRy95P6w6ARKJ5vVLoYdCsJIfzaY8OIqCStttEgMTgU6aM+v+ZshzZ5Y56t8aAqgk3C6hBTuyYjvbx7hNDvuLwy9eGm1YUzT3QxsKE0I380HDBdkLls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784264614; c=relaxed/simple;
	bh=zCuBWNWYbREUdxHFZ2fYGhPxb2l5GSlWunKj63AuCOw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SV5e8OnECDw8VAVllnhHUTzTybTVFjvVmS9d9VBHagWObnAx0TJ4QduQtlqH+I39Grvp6bjdG9GyxJ/PBFd5ZNH+WWVAg6bc8S4Od/X2MisFPWGOZ5uNqYZUoXUfy+7D1omURjN5zjNpQqwn2m4l8r5cLuVElhQwn6ZiCJzKxWI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=oymXdakn; arc=fail smtp.client-ip=40.107.74.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="oymXdakn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gUJYLAmU2B4vhgW5WM2t7hx1RzFbRwHoKv1/eB4+QY/bBhVYQM34dANG+pxiVj3vOQdnyvsbZfPh26P3X5I41hsoSnUgkzWoMPx743quBU/3Zcng6/dvrZDNBBWt2ITVB7+rCZUKgKpiEFZ3rYDiGn9qLlU1YowlonijOnmMmYCDZCcVU2WXNU9SFyEKj/Ktl3TvB0zmT5WxF9qiCO49+2lEDD4C2AOYT0Yimuhz0UPL5hgcJrgxHS9YEXEWHz1SlsyniyFHDFLAMWvN830pUHXtzyTU/kITuQUNpKMDlbadxbh3Y7hTsi7MHLGdWIuZ/6Rjq3NcVbXEplwyl87B/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=beHTmEG7TDc5hGDMXBLh0atGoBh3t6vyAJmpEPn+YtY=;
 b=Sf5K35pHg0AxrNqjVQSuB/u8Xi94kIuxpiyYvclUxKDpeREcpgn/NDDTIVq/zg3JdWJRJPo7xQi8cvgp0kqTjM9EhICcVqcDCgDN5JekusPQxvARFVnvpbvqeSjrgNK/XdKwb8F7QifMxEH+pVlvaQhKITIl9i8RXCXlgsUU08+ZMsxmJPjXNUk0JHSz7JWxDG0lQjDUromkbrHki4WW5Ospem0UaJTRjsMc6nRJhSmgyGxbeF4Sr+O0lDSUNv8F80gcmFOps4mcjX6cPkEyH+mX1KXWSOngrtmnHV2T14Q4Rk6d+a360xMjZQxBcvYigAKvo7N33RT564Wfl3jX6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=beHTmEG7TDc5hGDMXBLh0atGoBh3t6vyAJmpEPn+YtY=;
 b=oymXdaknxw/ieZPM2F7D6kINMXRT/0cW8kmUpyAa3EslVvjyYtKwPWJ6o3ljLkR4G7FC/ntUiBtoRE+AnLocPVPPLHDpnHFFNm2j4Nsdht/C1oNaOEkc0/9k64o+ztib36XNyqr4NepSWfEBdNicTGz4UWasPdGZj4V6pIY9nXc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TY4P286MB6313.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:33a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 05:03:23 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0223.008; Fri, 17 Jul 2026
 05:03:23 +0000
From: Koichiro Den <den@valinux.co.jp>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 09/14] dmaengine: dw-edma-pcie: Add platform ops to match data
Date: Fri, 17 Jul 2026 14:03:03 +0900
Message-ID: <20260717050308.2144108-10-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260717050308.2144108-1-den@valinux.co.jp>
References: <20260717050308.2144108-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0050.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::8) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TY4P286MB6313:EE_
X-MS-Office365-Filtering-Correlation-Id: d5d83d8e-eb89-4e61-350a-08dee3c0ba09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|10070799003|366016|376014|1800799024|10067099003|56012099006|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	6tLg4mzSD7vPSOWIEMbNRXAQZYsKhNM9AfFz6xBYx07b3LfzTJr/76HWHhs3P+nVi9yQ6WexCV25DJsWFJpridmGEqasGG9fTByPOtVNUKr/ueZ26Fr89B98A2B+jBnSB5KrQ2Fq3DV0m7vYWiSkw4DzDJKbQtCykrcDegDGWGaYnRgyo1w/A5vxXkfXPnc4t3tYpB7zV3GpHYmDfUyh/tH2S3+Zh1THEvL/z7/lA1t+3u2Qhx9IWCsbW+waCFAAVxZ87xz1PtEmsBLb9LKyIrGoqn0M8JsU+SOT6oggj0e1OrBEH5PY17nHqW66p7gpaZt0Amg/fFzAZomIBnyfHn6TmPBeKeiz7n7v0iyEwKjykiOLCrqZ+P3B126SS533GZIo8a0De33zpeCejJBarwqWNleDSZYMLp2rsiYCMvmyDROIV4yEK8YS1edMV/3551A0n+4uVXnFii0ejrQy+Kz4ZDtcnawjCYGdFv9lJ8cs7mzoLw+RxPopNYXKPXXO8jw7qg/JQ+PB6AvZg5SrtFiar15duBuE1Mx6L4gaaSdcB7Wqz8wM34MFMKZsqv0mxu9OzyNfVHGRAcQ5q/Vt9BAGZuWU/ZtfbmbxQT4FJFgOI52qdhs4eCeHtTVoK9bjXsnG5y2sXLvu+HwvgMyBhsN4/AE6RenucIymQ+xdWAw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(366016)(376014)(1800799024)(10067099003)(56012099006)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?q4li3OGbACetgFN1avRKz3/JxssZFcG1d/c6FJABmcvxxTk3N4h/tFwK+uan?=
 =?us-ascii?Q?YkoPrRQU4B+sCCvLc0R1cKBpgDgR0M8WkTO+7TzfiGpq1s90Hi5zZiTdjQNp?=
 =?us-ascii?Q?WI8ihLdzr9OKm/UScay/dRGomnbS+Q6vJPHp6I06uT0x+xoop2wLEE1hDMU9?=
 =?us-ascii?Q?766h3MlAxRJhThbEIhR9AjVCYclPRa9Fq7FCLJoadbAL5inLzEiUSqL/fgtM?=
 =?us-ascii?Q?vuy8W0XsdnPt7BxvUYjC9pdnhW8bpVlfR0bSfA9qAjxPQT+FoNuBXsIyLxKT?=
 =?us-ascii?Q?4xrVIfwCmtF1GH3kVuNQQ+qqGioKv4phqoNF2UG3Q0DKA+bRMecEdy1+TudU?=
 =?us-ascii?Q?G5D0B+qSRlFCKVxjTKnuKPQyUDe+n1KNsQ2zpSnP7tUN43tDNOk7eKcrKcKp?=
 =?us-ascii?Q?S3zMprI4Qr4gL0zEasWuuPvP0uV7atIgFTR71Roz353qSKDTTuoxwXlvlsui?=
 =?us-ascii?Q?RDTDct2oe41KwkBu60xDgpnqdkQ1qDJlhF4AeKhVg0NaSH3PrrBRxV4am6+1?=
 =?us-ascii?Q?2xMzwJ6v0EmyRgj1JkzJspPa40vm7/XEalMn5ruMWz66k+hRpkVd87mu6N8n?=
 =?us-ascii?Q?zhNR0OKlu6DCHWziJVGMEh3jCIiLC2LifJnCg5fNR6uZPGOIwBEg624QaBL2?=
 =?us-ascii?Q?UbpE18pxlQZatp+y3hZJVfmvLK47FpAThlNjkUapPfPegtughWt07eYmafU2?=
 =?us-ascii?Q?b/oRSNYslGB/4y6/49+iSECg4FowibdOsJqqdz0o0xrKfelnnfZ+AehXC+9S?=
 =?us-ascii?Q?rlYDhVCnOO++hd2y7NZVis+UZJ6GN0cECQNhXShCxNy77hshmeT4fSVAPbNW?=
 =?us-ascii?Q?rEExvsD0itHwogBePlNXd9Qhe5WFCagxxIV4oGXCgP0GsvnY4qG7tvSijnyF?=
 =?us-ascii?Q?GfMavZCywsMq3EvIVmARwPSx82zz/6is2+Nm/XPCcWAo6XL8UXq/JRDas4KV?=
 =?us-ascii?Q?RpL9SpqCbeXWZvWiqYKEJaiMk+BhAeDbZIJ4GOOK/yG2AqStlvZ4hWsOy2J2?=
 =?us-ascii?Q?2cPYu51WFcQfyioYDFqKm9eCTE3iwyZA0tPnIdChFmUdGwXbDr/LoVw2d0VW?=
 =?us-ascii?Q?IaC2XOV2d3NrsOqUQbeUZ/QAIjN5909/1RUVvSz7s4gYyfsn5TqbVorPJ6ZS?=
 =?us-ascii?Q?anmc3yWannJdM44PMY7U1VdCk0Jbd08MTIX1ylBCNC2FP8U1aAsBccvCw5iw?=
 =?us-ascii?Q?1cb6YEZRAc3VgQW6Ds7L34QTWczjRTGfcleXVRsMb2bfzcASm6SM0FMcyeu4?=
 =?us-ascii?Q?4WQavz5SBcwqet9rETIjG5Y7q7ejtGSn0CniJoKPYO8y2cE749t+konuhzrb?=
 =?us-ascii?Q?TBJ2qZVKfX2ZJxSNGDoP/NFqvVSJFmEd454mm2KyOXD0QjF9jgUaCPR3iNED?=
 =?us-ascii?Q?51A5+H3jQPdKUuaqojswOoBcJu0FBB6KTDvYxhx8Tdh3bYAiLxThQtYCTrXm?=
 =?us-ascii?Q?LC/Z+NAlBc4k7VEjEYqbNmjByjkeiLegLLQyPExTdPi8LiPmATqpKrWC7L6x?=
 =?us-ascii?Q?k8V1XqmEXE49YLiypr/RJS1t7nK3RCn6smNeC9/AbT5RdbV+MJI/UjVHxyN+?=
 =?us-ascii?Q?6rtesN5/X5clBGsKEa/4/GFQQs/WjtrKsfQ8m2PmatKl/BZOaHirKjcXrc4B?=
 =?us-ascii?Q?bWJPA5MCuOIJAQadGXglbY52fk8SM9/d3J2X51eyQLF1pcBriFqxkb+D1YYi?=
 =?us-ascii?Q?317ajChSXjbyL2bVkzp532BypPltZUeVys51dQKAFZE5J3lOIVPQJ7eIficK?=
 =?us-ascii?Q?pwg9aOKhchElwhJg/P2aHeMKpPUUep4F1qthVHhFfmJhZ/hv45W3?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: d5d83d8e-eb89-4e61-350a-08dee3c0ba09
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 05:03:22.8550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HSjtqkLMbKuwPE2f8mkxX4I7tJnihS8V1+G+2MMvGlNEA2ExEDj2PDkj78Sn58RfMu2cxyHUvOaXzgvVBsYcTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4P286MB6313

Move the platform ops pointer into match data. Existing EDDA/MDB/CPM6
matches keep using dw_edma_pcie_plat_ops.

No functional changes intended.

Suggested-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v5:
  - No changes.

 drivers/dma/dw-edma/dw-edma-pcie.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-pcie.c b/drivers/dma/dw-edma/dw-edma-pcie.c
index 46f16d7b6d51..531d1227a012 100644
--- a/drivers/dma/dw-edma/dw-edma-pcie.c
+++ b/drivers/dma/dw-edma/dw-edma-pcie.c
@@ -78,6 +78,7 @@ struct dw_edma_pcie_data {
 
 struct dw_edma_pcie_match_data {
 	const struct dw_edma_pcie_data *data;
+	const struct dw_edma_plat_ops *plat_ops;
 	/*
 	 * Mandatory callback. It may leave @pdata unchanged when the static
 	 * template already describes the device.
@@ -403,7 +404,7 @@ static int dw_edma_pcie_probe(struct pci_dev *pdev,
 	}
 
 	/* Let device-specific discovery override the static template data. */
-	if (!match->parse_caps)
+	if (!match->parse_caps || !match->plat_ops)
 		return -EINVAL;
 
 	err = match->parse_caps(pdev, dma_data);
@@ -454,7 +455,7 @@ static int dw_edma_pcie_probe(struct pci_dev *pdev,
 
 	chip->mf = dma_data->mf;
 	chip->nr_irqs = nr_irqs;
-	chip->ops = &dw_edma_pcie_plat_ops;
+	chip->ops = match->plat_ops;
 	chip->cfg_non_ll = dma_data->cfg_non_ll;
 
 	chip->ll_wr_cnt = dma_data->wr_ch_cnt;
@@ -596,17 +597,20 @@ static void dw_edma_pcie_remove(struct pci_dev *pdev)
 
 static const struct dw_edma_pcie_match_data snps_edda_match_data = {
 	.data = &snps_edda_data,
+	.plat_ops = &dw_edma_pcie_plat_ops,
 	.parse_caps = dw_edma_pcie_parse_synopsys_caps,
 };
 
 static const struct dw_edma_pcie_match_data xilinx_mdb_match_data = {
 	.data = &xilinx_mdb_data,
+	.plat_ops = &dw_edma_pcie_plat_ops,
 	.parse_caps = dw_edma_pcie_parse_xilinx_caps,
 	.flags = DW_EDMA_PCIE_F_DEVMEM_PHYS_OFF,
 };
 
 static const struct dw_edma_pcie_match_data xilinx_cpm6_dma_match_data = {
 	.data = &xilinx_cpm6_dma_data,
+	.plat_ops = &dw_edma_pcie_plat_ops,
 	.parse_caps = dw_edma_pcie_parse_xilinx_caps,
 	.flags = DW_EDMA_PCIE_F_DEVMEM_PHYS_OFF,
 };
-- 
2.51.0

