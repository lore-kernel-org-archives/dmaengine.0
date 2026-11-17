Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.84
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794908627;
	b=Hhs4qpOwNr2zUJ//i6P/YhX+38vOS77DcmaiykCMmL3bcFTs6fJ/AUz09GMV6EcRgrJx
	 RafwumbcHwn+vYARyj9PzDPv3W8m7D8SUcutso3jSeYs8vVJfePxof9zRD219CAAFU4pB
	 Vwi6I2TlFPkQxTmzRjayrJ5bpjs2QhD/4tYrpSH9wQifhetva9AeN1VkSGr8e+EKtzgYR
	 XnRiB12AYh3Q4qVcvTuQ2R5qKZbV9pMv8ym0vH0vaY9blBBL4QqSLb0E6ISPPRwR5hcIh
	 hp3m20BWMQbtz+G9ej4kyIS0DZ8BL5acq4TPGZR1FLnsy1+zRBDXIAHZEu020o+d3kQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908627;
	h=DMARC-Filter:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:Content-Type:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=CYZRM522jsotT+mYGbZi/HF1GOonj0Msu3pPKcHltIQ=;
	b=D7JHrZ2f82DnqlfpGLHN4dMGU2J0crVHmDTd8hpf8YruanpMGzM48/GAuPLuF5Y+M1ib
	 s6PoJlyQPuBIBw3OBxAlcvSrH09rf9xZKQnpF/mgsOTBJWXSQA/jGoJiIHbKv/ySI8RZR
	 b4pNSFaFtEk/G0hwsFVIfjlkEHH8ErGSEqimopAZLreP991X3HjTpZ5yOpMy5TAODr1JE
	 ptYZg3LZ+Mem6Oz9x6myYCEGnDndqQeoBYAqVEePYRuaQD+/zHlFX7Mm390WvQaIQgNvN
	 9YCp+tPi0bJMp2pVmjeud0J+9ZcB8FzkHju1TmIIn4ReKnBUZCYOVKRPcz5kjdP8AHA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.84
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022084.outbound.protection.outlook.com [52.101.126.84])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794D360A3801;
	Tue, 17 Nov 2026 09:43:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 794D360A3801
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GJyHjbbOp9y/5E5wf3P4luw2P2vRuCNGf7mzyfX51O6fcrkVls0jsckLe3yxOp5kg8tExKVcncdXyFHJa/qOq3vcfeCdEGKQ4Th/wwwozWPcy+ssEV5V7p91rdl7j6LIj3rS8AmlJ66wtLmxT1WFI/URkRrWo9Pkm06I9EYnFAlwkkqBShRL2B44Vz9o0nFylk2nM7FNLxMzKTv86qSD2kLLtOnKwGcPRenyqwbfcL/Te1igkH1dEcKYC4sGaLwAkvtbj10/ptRV72SLhRScjZqiVT2hTCGRStOVjHLgRvKSC3Wg8vuvxbpR3uuktM32VtXka88c9z2KLiBK/8xkyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CYZRM522jsotT+mYGbZi/HF1GOonj0Msu3pPKcHltIQ=;
 b=ZUp38fb3MCYb86I3kM6/HrRF0U/IZuR1xZoCR/oOI/TnD3GIey+akN5+DckpxYYpKJ/qRccUJJSUHzllL89Cxn6RoAbhNsNVrwQpn1A7Kku6yWLDiLU21uMjUVh7DDZrNyIeDBL4n/UwDXmCq5Jwi/x98vn3QnRho03eMJSKNCNyJqescoPGCRbKfeXCy6ytkF3hF1Lk2BrrB7SX7ywauXGnS7TePvBWwqzZCFQQescaQ/L/z7Djy/MCff3gsbzp0cuz4ZdhrFPFsfXSZzOKXXDbmRqKZudVwEWlHv22eovJo/x87EN1HN6YIexn+NlPjJkl/U42NP/1UvoUvpZD4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TY4P286CA0034.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:2b2::13)
 by TY1PPFB8C1195D3.apcprd06.prod.outlook.com (2603:1096:408::922) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.7; Tue, 17 Nov
 2026 09:43:44 +0000
Received: from TY2PEPF0000AB88.apcprd03.prod.outlook.com
 (2603:1096:405:2b2:cafe::3) by TY4P286CA0034.outlook.office365.com
 (2603:1096:405:2b2::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Tue,
 17 Nov 2026 09:43:44 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB88.mail.protection.outlook.com (10.167.253.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 09:43:44 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 7375F40920EB;
	Tue, 17 Nov 2026 17:43:38 +0800 (CST)
From: Jelly Jia <Jelly.Jia@cixtech.com>
To: vkoul@kernel.org,
	Frank.Li@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robin.murphy@arm.com
Cc: devicetree@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jelly.Jia@cixtech.com
Subject: [PATCH v7 07/10] dmaengine: arm-dma350: Track descriptor byte lengths explicitly
Date: Tue, 17 Nov 2026 17:43:32 +0800
Message-ID: <20261117094335.1393735-8-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261117094335.1393735-1-Jelly.Jia@cixtech.com>
References: <20261117094335.1393735-1-Jelly.Jia@cixtech.com>
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB88:EE_|TY1PPFB8C1195D3:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4f0b8b3b-d62b-43ed-db57-08df448f454d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|7416014|376014|1800799024|82310400026|23010399003|261022105027099003|261026130827099003|56012099006|261021123027099003|261021121427099003|10067099003|261021130227099003|261021133027099003|261021135927099003|261102123227099003|261026140227099003|261009223027099003|261026121527099003|261022075727099003|261022113327099003|261026135527099003|261022115727099003|261028144727099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	osignJsEbbxtuB8s1+2aC0f2WoDseOWTlao7ePAlmCNjU/jyBuQY8oFnSnPdV6Mag2ZxM7ZRMiIPq8r+ODXYSZ1pYkiFLQB4MRjfOgeJR/Gx7l8neLWVGjFQoqcTWaHeqSlZ7lcGNwOLYN8cmrqbMFAO+4KX/ym+DmYKF4WM6FNZH8Xz8SQwCXTdPHNQ3SW9jPHktml7129US7cw+pCE66/DGwsFqKiKfJJzGwmc5vPifO3X8hFZxcWTzIepificWLk4dEyKRimqoJ6W6yunpFpwLcwtEhTmZzt+fj0QT2K061iFAqXut4L1LqNrUUvGN3KA7O1K84EvvvI9LgMrJQP2/4k3Cg6U/Ded6R8gv4to/JoMdkTi3+0v1cav3E5sPQWfMgR2WhRKyTscmSoxDtLAB8KJAm/cDFzPxOnOnc27o5sX5AMlhxNd7d2Wp6ZkhJeh6wrkv/kxsEFCldqoB0s1TkbUm+G9MhLMosMz9AHLhIepL3rGw4znE5GP9GqR958pdkUwnaVC0wi0tp7OMkWV4FLfjSncilHnDvByQqNFUYCAYS893EOzZDZJVIFODQTbVK3NzVpEiaNQapsRK00BVa5crVJvkfSO9a5lh7nlza34HN6lGHZXl/z0/Zbv1CZEIYtslcUDiQcFD6KeuH4/OFtEAXbPigV13CUELoJsZlOvbHaWz0/wBnFVG5mw1p6rr49cHwHovPmXMm9BhQ==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(1800799024)(82310400026)(23010399003)(261022105027099003)(261026130827099003)(56012099006)(261021123027099003)(261021121427099003)(10067099003)(261021130227099003)(261021133027099003)(261021135927099003)(261102123227099003)(261026140227099003)(261009223027099003)(261026121527099003)(261022075727099003)(261022113327099003)(261026135527099003)(261022115727099003)(261028144727099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5CpbyMqPcfcTecdvFGYCD+cfpy0BfurY99StJbBOqcNsoo7yDk5QkmoTyQkFVDH3YXcdpsrAZd+/NaktrP/ifF5qFQASIj+6R4NJR8zHvJ4F+AU8FQbAx7vSSzku0vCv32d39le3xNLYPZj2pRWsEmq09GcTeF8Ev5s0Nc2+AAMOHzUXi7yh2bAeVQXIBiJ9WiT3wIpYbNaFNHTsvlQ2p4JQ9/bkF5Mg4ZUwRDQmQjdfBvzflf3I36Pd9mdAwOP2RroijkvpBlVrn/CgH+QZSvrOrE3tkZTELk91FRq0YFpNAvaKaB5nXlgyMUw3KFNTiUv+Iwrxl9qR2UXzg4g5KiWGAdJU/ud3YpFAqYnxWL8Nl0fji8XEdqDrgkfmR88G90OZ0fof/h3xwz9DVnVaD4wQx9LNOEzsYSOsUF8JI3yxr7syppuOk9Vl4LLMV3aJ
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 09:43:44.1593
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f0b8b3b-d62b-43ed-db57-08df448f454d
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB88.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PPFB8C1195D3

Keep the total transfer length in the descriptor instead of deriving it
from memcpy/memset-specific size fields. This allows the queued-status and
start paths to report the total length for linked peripheral work.

Use local size fields when constructing existing memcpy/memset commands.
Keep these CPU-consumed command words and their MMIO loader in CPU byte
order; little-endian pool storage is introduced with peripheral support.

Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
---
 drivers/dma/arm-dma350.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/dma/arm-dma350.c b/drivers/dma/arm-dma350.c
index bf87460c1c20..465a8b9b722a 100644
--- a/drivers/dma/arm-dma350.c
+++ b/drivers/dma/arm-dma350.c
@@ -178,8 +178,7 @@ enum ch_cfg_memattr {
 struct d350_desc {
 	struct virt_dma_desc vd;
 	u32 command[16];
-	u16 xsize;
-	u16 xsizehi;
+	size_t bytes;
 	u8 tsz;
 };
 
@@ -224,15 +223,18 @@ static struct dma_async_tx_descriptor *d350_prep_memcpy(struct dma_chan *chan,
 {
 	struct d350_chan *dch = to_d350_chan(chan);
 	struct d350_desc *desc;
+	u16 xsize;
+	u16 xsizehi;
 	u32 *cmd;
 
 	desc = kzalloc_obj(*desc, GFP_NOWAIT);
 	if (!desc)
 		return NULL;
 
+	desc->bytes = len;
 	desc->tsz = __ffs(len | dest | src | (1 << dch->tsz));
-	desc->xsize = lower_16_bits(len >> desc->tsz);
-	desc->xsizehi = upper_16_bits(len >> desc->tsz);
+	xsize = lower_16_bits(len >> desc->tsz);
+	xsizehi = upper_16_bits(len >> desc->tsz);
 
 	cmd = desc->command;
 	cmd[0] = LINK_CTRL | LINK_SRCADDR | LINK_SRCADDRHI | LINK_DESADDR |
@@ -247,8 +249,8 @@ static struct dma_async_tx_descriptor *d350_prep_memcpy(struct dma_chan *chan,
 	cmd[3] = upper_32_bits(src);
 	cmd[4] = lower_32_bits(dest);
 	cmd[5] = upper_32_bits(dest);
-	cmd[6] = FIELD_PREP(CH_XY_SRC, desc->xsize) | FIELD_PREP(CH_XY_DES, desc->xsize);
-	cmd[7] = FIELD_PREP(CH_XY_SRC, desc->xsizehi) | FIELD_PREP(CH_XY_DES, desc->xsizehi);
+	cmd[6] = FIELD_PREP(CH_XY_SRC, xsize) | FIELD_PREP(CH_XY_DES, xsize);
+	cmd[7] = FIELD_PREP(CH_XY_SRC, xsizehi) | FIELD_PREP(CH_XY_DES, xsizehi);
 	cmd[8] = dch->coherent ? TRANSCFG_WB : TRANSCFG_NC;
 	cmd[9] = dch->coherent ? TRANSCFG_WB : TRANSCFG_NC;
 	cmd[10] = FIELD_PREP(CH_XY_SRC, 1) | FIELD_PREP(CH_XY_DES, 1);
@@ -262,15 +264,18 @@ static struct dma_async_tx_descriptor *d350_prep_memset(struct dma_chan *chan,
 {
 	struct d350_chan *dch = to_d350_chan(chan);
 	struct d350_desc *desc;
+	u16 xsize;
+	u16 xsizehi;
 	u32 *cmd;
 
 	desc = kzalloc_obj(*desc, GFP_NOWAIT);
 	if (!desc)
 		return NULL;
 
+	desc->bytes = len;
 	desc->tsz = __ffs(len | dest | (1 << dch->tsz));
-	desc->xsize = lower_16_bits(len >> desc->tsz);
-	desc->xsizehi = upper_16_bits(len >> desc->tsz);
+	xsize = lower_16_bits(len >> desc->tsz);
+	xsizehi = upper_16_bits(len >> desc->tsz);
 
 	cmd = desc->command;
 	cmd[0] = LINK_CTRL | LINK_DESADDR | LINK_DESADDRHI |
@@ -283,8 +288,8 @@ static struct dma_async_tx_descriptor *d350_prep_memset(struct dma_chan *chan,
 
 	cmd[2] = lower_32_bits(dest);
 	cmd[3] = upper_32_bits(dest);
-	cmd[4] = FIELD_PREP(CH_XY_DES, desc->xsize);
-	cmd[5] = FIELD_PREP(CH_XY_DES, desc->xsizehi);
+	cmd[4] = FIELD_PREP(CH_XY_DES, xsize);
+	cmd[5] = FIELD_PREP(CH_XY_DES, xsizehi);
 	cmd[6] = dch->coherent ? TRANSCFG_WB : TRANSCFG_NC;
 	cmd[7] = FIELD_PREP(CH_XY_DES, 1);
 	cmd[8] = (u8)value * 0x01010101;
@@ -387,7 +392,7 @@ static void d350_synchronize(struct dma_chan *chan)
 
 static u32 d350_desc_bytes(struct d350_desc *desc)
 {
-	return ((u32)desc->xsizehi << 16 | desc->xsize) << desc->tsz;
+	return desc->bytes;
 }
 
 static struct virt_dma_desc *d350_find_queued_desc(struct d350_chan *dch,
-- 
2.54.0

