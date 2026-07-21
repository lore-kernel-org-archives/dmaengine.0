Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11021086.outbound.protection.outlook.com [52.101.125.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D929409136;
	Tue, 21 Jul 2026 06:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784615331; cv=fail; b=hcgrOY///BItj9KQsL3N0VBIj0Z+BBfltYJwJqg86o6awPFHUghY+Vn6uuw2teobVpKeQMXW2YVjt4WMgkagLfKThqjvZeGEhwB79qIzREt7t65ZYoqZaQs1ilriKzeHMzhq4YLNezi4QB2mkwPS8h6THfof01+Bt6O0FFHeFkc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784615331; c=relaxed/simple;
	bh=b3+BLYuuqEc5F7B/Naz5GTjnefhFCK6ghf3c+54mQHo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=P4E52wQBUeB0qs6FiVXaKyfxnajPzeGs3h/RP+mFn9ARkW/GoBhAOJ/hmHOwO+Eqt2AVjL87wdlmK2kbHbQOoMdA+ubuz55broaTZPvHwcwiPszrGjQHg8tTa8LnSXEgD3tcac8+NceWgXNWAIbeBovz0SigoCTR6akwKDxn21k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=Q2leH68j; arc=fail smtp.client-ip=52.101.125.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="Q2leH68j"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p1SNUe3P01AjWTMhkQEDBozigRfueAFl5ty1vOgQ9229CCwSBjqG2Djn3W1zkcT+jXzYrYfOx02ZAMo5NHhW11RD+5w7PPIYiMbXJDEFEqSo05Ag3KpEB4sgbq7xPzp5PrpmqTD0oTRGFttUwsFWjiESEwv4qBM0Ia76ww6NSps3SHA+cCvpFlACaf+lFdsSwrmeZj0ULlTogyR4qWuc1x5ok4hhrrldC0PSaJXUmIXAcG2GQX/HDWkl+sA+hWB4XYqrsdY7T3YBQgNA1VrSaS1B3+gIi+i4UzMeX4TKVaqKv6xq+ZGAIk18r1ooqoe+N4HEPBDzvYy2MDvo5T6vOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9UjtLoBd7k1i2KI/ejZfiXDXnnCO+BwYOqv3Ya4Nipo=;
 b=Q1qCtMlRdtUP4rxFgHzdw5ag4nWGGDriLxM+qvg6H58WuBtmGc4I4WIp79x/kFK7USnx2nXcDWNxxWNP0m5J1TRE+k9cPTkUUQcIFhry790uWDJOIeNKvcYQA88Uohf1ymPzM68QEws0yiAFZ9XS4HFQZKKfBwL3fZbq/UBYCGQGA0eAC/FpABRtbE8tW1bUYwqE60TniUupV3gg7ZS/9Cl+CkDFAHRKG7Irz0NpJG6JWMDekDxW2JdAD4vva33BEmA8q1rq4NDP0RcfO57kYKsJghzLUz4bPqTVdTAUpGxurN7TVIPm5A6dbL6N2F5fn4EfMQzM5CfvE33m6F2DGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9UjtLoBd7k1i2KI/ejZfiXDXnnCO+BwYOqv3Ya4Nipo=;
 b=Q2leH68jHaNrDIUY4tsI5EH3D/2STxr3AVNhFEWXlpuIzoXSqV+rpFpfplvCbPJJUgD+Pg9Zi3HAWMkHFs71vD62Hltmrfv5vbsnPRnlipbWf0iqu0s+VofzO5Yl51PaBS/QFrG4KuxK+kDe09/aSsFs+g65CsuDLA+9P7xSJXU=
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
Subject: [PATCH v6 12/14] dmaengine: dw-edma-pcie: Handle optional data blocks
Date: Tue, 21 Jul 2026 15:28:13 +0900
Message-ID: <20260721062815.4117887-13-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260721062815.4117887-1-den@valinux.co.jp>
References: <20260721062815.4117887-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0342.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::8) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OS7P286MB6796:EE_
X-MS-Office365-Filtering-Correlation-Id: 78364ef4-265c-4f94-74dd-08dee6f1461e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|10070799003|366016|376014|1800799024|3023799007|56012099006|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	WINGOLK+lgWtpAJ0cVYhqEueuL4hi8wev/Yy3t9iz/QqV3wDB6QNeo4KLIt12i1tEIKCp2Ptr7eE18jlQGuFoZd+a9n8WZuieRjD5DcUm+oeg++wGC6KBrDvohfoUZ7gejTzbygAtvWLu+oh2jcA9HpIU75D/ZrQLrmXwvtnxWAeuvbDnU5VwW+0X1CRbQNXN9+eO+I7qJOWfhxZxuJy3A6GD4dGKK76gZL3oJEjpupdRIaM/jIZCA8NicfVNPWPaapQne5hKUY/qzqdrcM0//v80sRh6rG6FK+jq3ChuFPJ5UES8iEB1RK+U2SzQamfoXsz5mRWvhseuL7FNslJAljtELLfUH5VZwNrVNKPTiK7+B7qaL8DbulUOp9n7NvnBybxEXOQTxBJyi8GKc+TjnCXWpBXu5w/bvpLX/T6O4xexuOXEOq18vQQ6ic0oYnTbJ1lKuaEnrf4Gm7379oQ1UZQg5a6m2LuMp3VcsO2PbsAzF809dimHBBVf8BvcPboGihJEvpOXTLZFlLheSfayTJcunmXAQxa3uEdxmq68V8Ebjr5A/q7gsLAyjyyNriq0wRF8b4gJz94Hx0nJmnYbtBxtDhD+ySZjqeRNwI2z5f9bnAXGKOJ4KLgvBHFbj2XRvLeg96LfA6Pp13KWNlskFRcUlWY9GMayEnNeWHVLmo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(366016)(376014)(1800799024)(3023799007)(56012099006)(10067099003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pRf/Ybifd0ejsh40A7NXtehslFpLfZHnsFsCgHW7gQRS2wS8ZIiccpy80EBW?=
 =?us-ascii?Q?zCz+O4Czn7c9HRdPJPVtaePIwzgzigbB3PsQh2k2v5jVi6+PN9rOF/1xH1H9?=
 =?us-ascii?Q?j29+QqBd3OmUC0gX3nORu0rKWd+ambb2MVCuHMO4OcS1MEcJJUdRiFdrukko?=
 =?us-ascii?Q?uIzNECbqVTqhhi/0hftUrco+JE34Y7xgkH9ZlRflYS7FV7gVNI+H/5nsOwFC?=
 =?us-ascii?Q?HRDgNFOk8lsJd74ush1glNwAWjVHf3+bBpZAj+I5R5k/0+lmu5wIHAv8IPva?=
 =?us-ascii?Q?ZmX/pDBue/B8fjQejxjvhEhXKTUFlwumJYRKzASC3yjlLsOm3Rd+mvSrMOtM?=
 =?us-ascii?Q?pWSAy8fUp1ZIl4PxepvRNPiJphtMSNe3Eh5oA50PkGmb9FrDObPWAIvDyJMi?=
 =?us-ascii?Q?AMxAde+sJKHFZklojfDNugKumdZAHA9sOns9NwG6/n1o34N7vNbjWxC7b/bg?=
 =?us-ascii?Q?Ew/llO44GcgRuk3nebJQeveffdi5t6yx6269dNzkm7GNFQ8cM9DL3s5nKCiH?=
 =?us-ascii?Q?5IzUI6eNt43ziW2lVuqxIxK+lkNRmYfB7gE+8w+7ZZOu9JxpfgCGM5y/ksAA?=
 =?us-ascii?Q?DNg4rhbeDs/6Bnm//7S9++hcymF+07Z7i6iovt9IaJb1wIWEdpZRXZhyuxbx?=
 =?us-ascii?Q?WbSsrCGXzypHXsvYAMDbR08dlu4ydUabD91NnUiIpCINq3IyzW4m+Q//7fXf?=
 =?us-ascii?Q?EoT8WZxm451x/dXMAlvPvQZe1ARNtCpMdKEdvCTO0a1FIRysnl6FR5PtbXej?=
 =?us-ascii?Q?joasOqj3uo0CAFea9NCCCs6Qpafi3uDQtFqx0ng1NiHbHmQARvAGzlbGCRcl?=
 =?us-ascii?Q?+4nm+AmeCha9XhDTdf0z3RtYWnCSg64r/A2NZdl6T838w4tmW205BnibSQ2x?=
 =?us-ascii?Q?am4KuzGWj2ekbI6VXJOFU6gBKdVLQ8KvF8hNoAPkS4zi2QL/GCVHjaDpfLaO?=
 =?us-ascii?Q?0jIFUc+mfCiZl4wiBPMVOqfQxxR2IFXYCECTa7AX4kbmuG2RWe1Cu4oyM8OJ?=
 =?us-ascii?Q?jAj3EvG5ozFqow9peWzFhKcsQTkdT2rQnXHxrrbomcLiqa/LP++Mu1BeWvK+?=
 =?us-ascii?Q?JjVlVe2bgy5UFFTU6cCwNcA0zqu9f9J6+ai4H8N7FLrUIBtdko+F/JgljKeX?=
 =?us-ascii?Q?Gk4bXGp4DMt8Rkotrqn70Y7NAlLEPRfBR05NNWBdWoMnukOzlgJOlGCvluO5?=
 =?us-ascii?Q?r7RkODBg+9VzZ3Tn8C+rLlsLiuq2uPjXJarv45fntUrrJ3JbMl8ozW8zmIG+?=
 =?us-ascii?Q?uS4oHu80nOpdv0DsaTkF5bAo0yY/uwHlOgR1rcaPCYN4fWsY5vZUjp6SJu9I?=
 =?us-ascii?Q?zszo3kvEkYF+yxn0VWXSi18yY8cgg/WdXQ5a4G5Lkhf8FU6rF0vy+Yf5aG5p?=
 =?us-ascii?Q?eGKtYQ/rf+hqhdjQkJhmrj6Xr/vzqBdAcnbq1LBbhg2uMLYu1y7eSbXs9tRj?=
 =?us-ascii?Q?DBaavuFjufpxX31HMMnSuVyz5jQLPNvVnVybpzAH/4Y7nkiAge/oa8PY8+b6?=
 =?us-ascii?Q?COeDkQbKS8jX0kGiCrbf8ectyPP84WsWQACaVV2d44vVzp+oLg0dbUZODM+Y?=
 =?us-ascii?Q?sdxAxZjy/B810dLosNyDIMKuktnJCb4LLJ+j9kPq5mGxRKTIohEPhMthuaL+?=
 =?us-ascii?Q?vpxY+srwnUSdMijOQ2bz1XDO9DxA/6rW1YBS+mZVmda8Ii2hS/KAZQ5Cr8Tm?=
 =?us-ascii?Q?bFJ/wyVdcr1wgy+B5P+s0o8OQSQBNqT0okdLgCxU9e6w/K2Rukj+knniyRS5?=
 =?us-ascii?Q?MLSPuJA/BUAXIyg0cJBv/Z0rh/HmXueypla6FRAhUa1WDMGg+2Eq?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 78364ef4-265c-4f94-74dd-08dee6f1461e
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 06:28:27.1762
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UW63Hd3VD4af5lXsR/aSyW8WYlbDn0jjq5ksd7pdyzluDXjg1sKjmH7XVuYrjiG9HE9oh/KA43TAbOHeg96KpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB6796

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
Changes in v6:
  - No changes.

 drivers/dma/dw-edma/dw-edma-pcie.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-pcie.c b/drivers/dma/dw-edma/dw-edma-pcie.c
index 6da890a4ad28..37be455b7b6f 100644
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

