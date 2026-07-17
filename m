Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020109.outbound.protection.outlook.com [52.101.229.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A29377000;
	Fri, 17 Jul 2026 05:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784264624; cv=fail; b=udrTB+LyHiddBKCu6T6LdKpFHLMNgI4E+azBy8eyUY0MD2SOHR/l9Prv/sDV0Hv6e++hCIekagmlDmaxf8Abxed6vlzvaE9L4SjV9eiOV2pzt1HyXECZJCQjXa70cF9TpSAwttur0wQgymp1CmOUu06icfSoR+cdJ6RI14FeNIk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784264624; c=relaxed/simple;
	bh=+aKfuugYCCzrlF6KtwTOsKvztL/15yv/3l9b2/kT5ek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VlxvXq2ijNZV4jPX/FyjgkisreeV9Y6T3Uj+iMlgJvFRTdA0apNWPIZ1t61rXwv96wMKhpphrB+mJ20FJ8kiySioOopFlafFVgOhDrtZ8mdHiv68LsZi4w71Cjc+/XWx8+2i1c8caXe48sTKCfVPLNS7gJKe8iDy1i4xl4+Kt+Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=mZf8xuLe; arc=fail smtp.client-ip=52.101.229.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="mZf8xuLe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nsng6G5hzWGPwIVmHT6kh/OHs4gaXe95fXLSMkFMt6dCEitxOxVNXkRF29LtJqcWHoC1C82+RfqPnSIa87fEUKXXEQnDLekOwSIipd4JbjD2ATcXlxSCocvGpBgFhhdrf88Q3IhMEmwdmHPs5sRULL9TNtudFHM+VbmtRSd7zz6ddXZ5ZA8a/zOVEEmjx1qejpHVbLjCAOVbNTEZTpBRT+NO7nzXldaCDh2sESXPRVHmXgFoxRObAea7yZGfNY+50UL90odn/ohsDHMwaT2Qqx6eo6mrMrmNmI1wJk80wWMPda0o6eyWSJigTRFzzjZqze9zxTf/SWnPDehPH+724g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XNBSEkweaoA/K+rbZBs9psUiCbtAb1DAxraHH4SX+g8=;
 b=CFA+KmEfZQKh1ktYIwYhZZyMN9S82E0uqfVEHiWEF/k71awRgMgg0siifGaRg3WcccdJtKcLSTZj7OOLESozHDKi0y3avOZ28Izgqk0dK9pXRUouyZdz6dXVLm4a5EBxw6qyKL0R4WGjAOMgDd2o/Ds5gcE6SbhP1MSX0fYPGBoriv580cKIX0xSwrA8GCWK8mNe2YWHsHZQEdq9UNQR+F1HCrddc9O2hDAyTAudQPDoMcVnRNTqaFLonL+xrsEGkWrRl1QJF/IaGq7FU8ajvlAyidatWpwoOVAPqGf/bPQ60AL1/tZVQFJzRl5dv8xciM2MelzrHyMeMTfj8nzYfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XNBSEkweaoA/K+rbZBs9psUiCbtAb1DAxraHH4SX+g8=;
 b=mZf8xuLe0H+9wg2pxG+qRCwuzcmNPcCkBosbd1w57oKzJ8dbnM5z3uapLcKayOK09EPQ2Asp0Cg4tOgEJni4qrL3pFNtga+ZDZFofIldmsUPFSuQz5KakOxHXoJoSl/AUGyue6lsZQQcAdnhctarMAUKz5MGtGJ5HU92eSmZY8A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TY4P286MB6313.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:33a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 05:03:25 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0223.008; Fri, 17 Jul 2026
 05:03:25 +0000
From: Koichiro Den <den@valinux.co.jp>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 12/14] dmaengine: dw-edma-pcie: Handle optional data blocks
Date: Fri, 17 Jul 2026 14:03:06 +0900
Message-ID: <20260717050308.2144108-13-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260717050308.2144108-1-den@valinux.co.jp>
References: <20260717050308.2144108-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0327.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::20) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TY4P286MB6313:EE_
X-MS-Office365-Filtering-Correlation-Id: c63bacf2-a0bb-4b32-f38d-08dee3c0bb98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|10070799003|366016|376014|1800799024|10067099003|6133799003|56012099006|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	MaHxDZSOgrdLLFnPwdYlsnTllAymIBak1cme8DQtTgU8oQer2oD0p87Z2vjHfAndL4AvyRVFyk4v6I74LuqYCn17a4st7jA93fqSM1vq+flEEm53qOurZkItJdsv1HDLRMxq7Ekfbnka8M9GLKDTSELeVVWuBPPIfnXDAWfXvN0JM8DHhXHhggXr7t9nzixnN7Y9laQ43MFcBLFSJGIIC9KJeM3ffqWolE4NRoaSmQocBYOYiMzK63zzvGl8ERETBgpnCHlK7umVNh28kH8jRHYFRLqsRm/2zbeLNcQOud0jjXEla+sO894sv4G6lVHFsOOBWOSzstnmDAXCQJsFYEB8Q14BQfSXv3cD6d1hbjMu53sTwD+oTGNSZr4Ie3SuJtvROVkdoex0+GZ7P21VJwkQ2AsN8rHPijsOfB87aJIoVLtUD5T66J6cZ87KAe8Hw4voI5N7Y4ocrQAUUu3n8dXJeg6SUcurrsEmAnUjAdmH8R92tLqKSTYUxZRP/TPXZKOpDxooqtVLBJyVdbmuD3Gp7KXYjr4W2mzkEnsLWInA/YZaicIJinDleEPtYlK18IHqfZMtu9xkLS1fyDT27t5g/wRhUMFXCxwVrgcC32vRm1JP272rRubBqs+QbDKOrinCdFWtXmdD6oMPX/R3KhHEuBeS9yXPDosUo7BfjPs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(366016)(376014)(1800799024)(10067099003)(6133799003)(56012099006)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TIG5UsGj4Zl73zjGUtdJzsqechn/nXNO5NiOwwmDZuWGHOPrl05bGwJM5LLE?=
 =?us-ascii?Q?odU3GALmCDR8yPX3LEBPrljcUnSfFWYMYpx2J0Maz5Z3p2N+PhwNs0iBXjOV?=
 =?us-ascii?Q?pFE7yfR79ieKhriS0dtzeEbhPb4stULXJDCRIXReY+mHdY3073hjHiC+GvmR?=
 =?us-ascii?Q?DKRtxByuj0RYJA4SVH6HWx/IQpnZuqWCQEAM8ILP83jd4gESZLUAR5NkkOgE?=
 =?us-ascii?Q?EjQtFeAUeBXAl+vUZvJT3lX3IO/Iga2JhBtfTHpNUf9GQWZDPYmojGy21pF4?=
 =?us-ascii?Q?7MpL5PyFSXVq9DZKnYX4HPHmR9jdz777gLAo9WrmNX/+DNBkSV6Zgh/rrU7i?=
 =?us-ascii?Q?/HQGW4DETRY5Jl3mxDRor/iBnLjOngoetzGGmDTjULIUZzIinKwZETZPCqjA?=
 =?us-ascii?Q?ULj0KOvxcOiUq1lej2w/zWUehN5KEPQtLDqDi3PbpidxIsN4dfgHO0urc9Gb?=
 =?us-ascii?Q?CG9NXGQbqc9ZNL99dYTyzVtp/jhxkuh89EfOZjiZa1ybFrykXEujjJOQwGz3?=
 =?us-ascii?Q?6RMUqOFMbP6QqYY1Dw0JQoFKdUokJ93mubLgjlh75r1XbIHfJ09EJbhyBD9Q?=
 =?us-ascii?Q?7mhLEnEeNSVd3PlgNJFfM3FZqVGP0kWyav3PkCsNLv6IrWLO8Lxe8+k0uE63?=
 =?us-ascii?Q?Ily8lzVXoD5LmUGdUF1KfWVIwAUhhHPpRvCYwTBs3LPsL/FoQQ4JoHFi7exw?=
 =?us-ascii?Q?R5UBWf6Vdvhs0iPnHxxImK5kQHf5HTM8zE9vCgzilKDpNQNJUvxn6FHgDAE0?=
 =?us-ascii?Q?wZ4KY1UcHfIcjr09pjs2oNZHc1UrMOmPNyyNcYM57+i14rHlxZvRi4AZCg2q?=
 =?us-ascii?Q?SP+LwCHI84yuF1lF6U36yhgWMYEbXrLcqNFJDC8/vi0IvcxE2LcMd9eupdyJ?=
 =?us-ascii?Q?PjdYnu3nXoBMBkhe6l55wj7VQZbq+OZ20s6Ddyu5AyfR4tfyx9d5aeZMtHIT?=
 =?us-ascii?Q?3kVfnGg4mG2ohASU3nSHD+B9P1/enPd6k4g2JgfXB0sMH87/ot7hfPwY4Qow?=
 =?us-ascii?Q?UYJirpIbo7PZy7Cre+uN31J25jEEKrbqrzvbmPgV1TMW9oDJG6S51FWZr7mk?=
 =?us-ascii?Q?k73zjSwef2BdSEiiycFEzYT2W3OryH7b+lxBWFqrIDxvGoM4CIf+E3HIjkWF?=
 =?us-ascii?Q?5F4IzorjUcDhWAHa95YuW7P1i2WUZfpHvUtW+nYOVT1kFbiZYvcO1qvhXa3F?=
 =?us-ascii?Q?lD/ah+WjJwEWZKSXVuA/sBI+ZlUVPlDfJlrSWsBil0WLMWF2BtkhXl8MCAVR?=
 =?us-ascii?Q?d+048bA4hYQcWvBKIkTcIU41WIsuOPF4onBub/svz+CL05WBKAF1gZ7IqOm4?=
 =?us-ascii?Q?wrd7M+oOS9GliVhP8RYiAzLZIie8UdlxJol45f2BJ7t4SsNdX0L9vGbke+uI?=
 =?us-ascii?Q?LDuFb02Zfhuyg6wawxb3zBaRxDBRlXcb/2I0vSl1RIzKNeg3VHhw9WCTNMFQ?=
 =?us-ascii?Q?BGSVR1FbIegwxXi+sRe9F6CFeVMd4kNVlRJZxCZX9Uk9BgjUDfFNbi499VTE?=
 =?us-ascii?Q?k+k57M8QkymavoqjOce/pKZV/40n/AtOhvwxcTJGOKiJq0EpLcVnaK1nrqGN?=
 =?us-ascii?Q?c6BY1TpdDKmJrgnVJ0PGFbx0k/LLdMQW+fiGhgJDNlQlsSPYcevwUcSMhZH3?=
 =?us-ascii?Q?TSULzXMSRIfT5O9LS7WIS9hbNDae0Y/kGj1MKD6zfVH8aH7SrpJlVzTMT4Vx?=
 =?us-ascii?Q?LNCO6K88Hcbx6l/if+OOPTHrlJL3erPXuP061WjsC85gu3XbPXu3uAhC5jMI?=
 =?us-ascii?Q?E8wUSA+DEPdSphdeQePLRnkAd7oIv2wUcS6BcevUzaUtGIGIVdRZ?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: c63bacf2-a0bb-4b32-f38d-08dee3c0bb98
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 05:03:25.5361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TA95i8BEIkoOhfe5byTred5gjUE/1OMHedQbcOVhv3tU43Y0nPiaTt6NcqCCBJCg1Y1QDmtjoqg/kq2WUvam+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4P286MB6313

Skip data block BAR mapping and debug output when a channel has no data
block size. This lets future providers describe channels that only need
descriptor memory exposed.

No functional change intended for existing Synopsys EDDA and
AMD (Xilinx) MDB/CPM6 devices. Their static channel descriptions still
provide data block sizes where data block windows are used. A zero-sized
data block now means "not present" for future metadata providers.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v5:
  - No changes.

 drivers/dma/dw-edma/dw-edma-pcie.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-pcie.c b/drivers/dma/dw-edma/dw-edma-pcie.c
index a5d65cc9706c..8c4d1359a545 100644
--- a/drivers/dma/dw-edma/dw-edma-pcie.c
+++ b/drivers/dma/dw-edma/dw-edma-pcie.c
@@ -430,11 +430,13 @@ static int dw_edma_pcie_probe(struct pci_dev *pdev,
 	mask = BIT(dma_data->rg.bar);
 	for (i = 0; i < dma_data->wr_ch_cnt; i++) {
 		mask |= BIT(dma_data->ll_wr[i].bar);
-		mask |= BIT(dma_data->dt_wr[i].bar);
+		if (dma_data->dt_wr[i].sz)
+			mask |= BIT(dma_data->dt_wr[i].bar);
 	}
 	for (i = 0; i < dma_data->rd_ch_cnt; i++) {
 		mask |= BIT(dma_data->ll_rd[i].bar);
-		mask |= BIT(dma_data->dt_rd[i].bar);
+		if (dma_data->dt_rd[i].sz)
+			mask |= BIT(dma_data->dt_rd[i].bar);
 	}
 	err = pcim_iomap_regions(pdev, mask, pci_name(pdev));
 	if (err) {
@@ -497,6 +499,9 @@ static int dw_edma_pcie_probe(struct pci_dev *pdev,
 							  ll_block);
 		ll_region->sz = ll_block->sz;
 
+		if (!dt_block->sz)
+			continue;
+
 		dt_region->vaddr.io = pcim_iomap_table(pdev)[dt_block->bar];
 		if (!dt_region->vaddr.io)
 			return -ENOMEM;
@@ -522,6 +527,9 @@ static int dw_edma_pcie_probe(struct pci_dev *pdev,
 							  ll_block);
 		ll_region->sz = ll_block->sz;
 
+		if (!dt_block->sz)
+			continue;
+
 		dt_region->vaddr.io = pcim_iomap_table(pdev)[dt_block->bar];
 		if (!dt_region->vaddr.io)
 			return -ENOMEM;
@@ -555,10 +563,14 @@ static int dw_edma_pcie_probe(struct pci_dev *pdev,
 			dma_data->ll_wr[i].off, chip->ll_region_wr[i].sz,
 			chip->ll_region_wr[i].vaddr.io, &chip->ll_region_wr[i].paddr);
 
+		if (!dma_data->dt_wr[i].sz)
+			continue;
+
 		pci_dbg(pdev, "Data:\tWRITE CH%.2u, BAR=%u, off=0x%.8lx, sz=0x%zx bytes, addr(v=%p, p=%pa)\n",
 			i, dma_data->dt_wr[i].bar,
 			dma_data->dt_wr[i].off, chip->dt_region_wr[i].sz,
-			chip->dt_region_wr[i].vaddr.io, &chip->dt_region_wr[i].paddr);
+			chip->dt_region_wr[i].vaddr.io,
+			&chip->dt_region_wr[i].paddr);
 	}
 
 	for (i = 0; i < chip->ll_rd_cnt; i++) {
@@ -567,10 +579,14 @@ static int dw_edma_pcie_probe(struct pci_dev *pdev,
 			dma_data->ll_rd[i].off, chip->ll_region_rd[i].sz,
 			chip->ll_region_rd[i].vaddr.io, &chip->ll_region_rd[i].paddr);
 
+		if (!dma_data->dt_rd[i].sz)
+			continue;
+
 		pci_dbg(pdev, "Data:\tREAD CH%.2u, BAR=%u, off=0x%.8lx, sz=0x%zx bytes, addr(v=%p, p=%pa)\n",
 			i, dma_data->dt_rd[i].bar,
 			dma_data->dt_rd[i].off, chip->dt_region_rd[i].sz,
-			chip->dt_region_rd[i].vaddr.io, &chip->dt_region_rd[i].paddr);
+			chip->dt_region_rd[i].vaddr.io,
+			&chip->dt_region_rd[i].paddr);
 	}
 
 	pci_dbg(pdev, "Nr. IRQs:\t%u\n", chip->nr_irqs);
-- 
2.51.0

