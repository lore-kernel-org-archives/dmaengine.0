Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11021140.outbound.protection.outlook.com [52.101.125.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F2B40B37A;
	Thu, 23 Jul 2026 08:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784796130; cv=fail; b=W/wCVaPn2Ud8v3zqPc4+gowz0VdDSn8NJFogpXEk/aWauqNQWznvgPbJXjiT2Ae6bI7se0CnWtef2Ligslb+mgMiL4e+Zb9Urbli3LzcBRS70IBETHa6lw+bUmNo1WS+kgg+kWdUrKx037fzsMqsOR9d+PMw/nrEnG94a2rxzKg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784796130; c=relaxed/simple;
	bh=GEJ+Pb5Oi//uxaoRLqBOW9LPNKDwbFPtVrZfeH1EuKA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DqRUclW9NO4BIm2W+dykFa/hooOp34ccVJy4HJ6bjWGxSfpnNqlYmJn08rkFdMJz10Fszk+Ev1WaP+aNgo5DHrYswTx/v9pPn3xkqwCjHd37mH37kqmEBNHM+sWQxxKRibyP2omCQEEv3YdYBZ7LHsyI1cB3Sfmf9HKSQ5OgC5o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=wTOXDNXh; arc=fail smtp.client-ip=52.101.125.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="wTOXDNXh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dOJ1Bb2vWhQ/8JERxgCzDEVXTZ0Ea6cY9pqN6b/tdB1AT7tP11t1XI+RoCRjA2XyP6AM0/04oSefHtS8WacUCV68be/co4opxvuNEu2Yr7zIi7KNya6Uv4DhXRHSEURP3r5tw2fNdwqZJx2BVHwCL0cRJ6iTeP/YajLAhFzYoGpgsSNETgMjXW/RAbwbpeAEcfN2jKcruv3pgVT7UL76csI/6HhNqrqaShycSfmHFGI1M3YOLi3dLGO4w12+Ne9DH7bG3HQ5waljAcE62eIMv9tuSZDFUsTH5r0Fy7VyR47g/1Ci0e4QejRnj7ESMkQLndQ9eQDViGfkElMx09sbpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pDAj7yVD8vGCNQNYIwXpFi+Ct5kR6HGZ3de64AEj5AA=;
 b=jY6J2zi/IF4DNb9i/2S+sX1Q6VewT1PW0bwu0ZN872zexfpJ19yF8f5F+oDvS320HPfa2V5wEpCrZlEvf0D24u/lvU8x5bjp9pCP7v6ILXeWtXN8ocLRNLKtClgSx001Jrn3yzoTlqXqjEziI1f19GmfXP2m0rp5HW57rNoS+h995/K3Zw0KRAWfbJ9BmsopLSpsbrbxpGA7MbOfp2mFyNOLpBeakANabUpYOdVm3cmabVC9OQdluuwLz14g/kVuiE/MyTEhf100dKSXL9S9hZjYn2a32Y4aLYw+9SfSvmbzVIYGZF6rWavCrYi+/vC9X0N1xBSlNTHmvHWDCy2bjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pDAj7yVD8vGCNQNYIwXpFi+Ct5kR6HGZ3de64AEj5AA=;
 b=wTOXDNXhrGZ/xs2TcrjGRr9fWBa7NcFI1JJ+6ANiXbhkz76yIq5ReL6ED1Q1FfKUFAonA29X5VHk3x3CzyZECxsH5GNV/nbdqaOFw8XGnuYvAF83W0D/ljaubyFX/453CDO5jjSui+bwq8ULUiS2eKoISysf2vZNZhoeNYK899Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYYP286MB1883.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:111::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 08:42:01 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 08:42:01 +0000
From: Koichiro Den <den@valinux.co.jp>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>,
	Kees Cook <kees@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Christoph Hellwig <hch@lst.de>,
	Serge Semin <fancer.lancer@gmail.com>,
	Cai Huoqing <cai.huoqing@linux.dev>,
	Niklas Cassel <cassel@kernel.org>
Cc: Devendra K Verma <devendra.verma@amd.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 06/19] dmaengine: dw-edma: Move callback result helper before LL helpers
Date: Thu, 23 Jul 2026 17:41:37 +0900
Message-ID: <20260723084150.521366-7-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260723084150.521366-1-den@valinux.co.jp>
References: <20260723084150.521366-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0034.jpnprd01.prod.outlook.com
 (2603:1096:405:2bd::19) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYYP286MB1883:EE_
X-MS-Office365-Filtering-Correlation-Id: eef3b7f6-bf5f-4c6d-ed3a-08dee89643a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|10070799003|366016|1800799024|921020|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	uqFeJ87Jpzo78aAJP3Z68LsHnsADyvh4VbiBv8PS7L/j+i99V0xzBO5sLuN/iIp8ZPw2p83cyTzA+QMwBiBl5RQN9jUFrBnDuVPGePg2UqkrZEwJRRCJF5SdtyVLI8xnu3K8QG8egdap6PVZFaYqWEFkmVoiYozcQOLwMNx8i+OQZPXpDRfZA7WzDLZ7zA4WvJDg2PyagWVV+d/hb+W2OmRcahHt7Ho7HbMN8vxw5dpVxfcicnT9SaAik03BJsuNdzGWAjbGcurywCnmZQdQSXJ0iXHSojFJPtkfqYMLe8RBVclDiLmZxKe37sZDS+KW8vIQJnng2rzMDlibkgTvgHr8eGhY+fp0Y7LzC8UENfquY/WwWsq01eo0YGjHtxIky9LJRHGgwSKQs2yW0uMholij5wsasJyn4XAvjBQRHJX5hresQ+9ATumNwiWE0BHGXi/n/UYabAapjljfLnKtMHASL4W+xzEM70gLbHCfZkZe4qmAF7obflsMG1fJ8ExpdPEBQAFZvsetRiRtcYQO6vUl08yATSd7c+ZlOIQRGtA1FYRFzjFFSow+ewlsevgS7kD2tt1bAAN1BKwHfK7Wsd3FUZTfHhD7qbl3hHT3spWWhqjKNiFiKu885wjzJTgwb154yumqlr4uEqxkt0SbCxULkvemmGbodS/N1soVqT85uj/cIIKB0/ngmGrSoY0H6zPg3o63j8sZcAz2lQbMCQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(10070799003)(366016)(1800799024)(921020)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?y6PrSnQ5lvRETjVfqJ/GYxkxp3AW+uVGVBeF1FCjb+hGnnihvi7iUejSH24x?=
 =?us-ascii?Q?WQ1jc+E0ofCaCKXMlGluE17PVXWsCGwFuFDJkLh/MeVq0TIuHNbyX8bnSNY3?=
 =?us-ascii?Q?P2LZYXdL4Kdy+TKV323szlsCF4Eig4YmHYIrbMCOG8LnWbRKaDvv6+5nYk6P?=
 =?us-ascii?Q?dbMyXobjBLIr2qxk06zrA5ZAgo3OPtnD7fbm+yQrduE9w4my4zQfqdYz8wvx?=
 =?us-ascii?Q?0bm9vN0hY0zBgG2re5DJFEpGv9HVPc9F0/J/GO6oNVib/hY+lmK4vESbt08C?=
 =?us-ascii?Q?5ui8SaH/jzNZMiP8YM9kCvvnr9ZoQSFqjM25zLsmFG8TflLcV1H/3zatShH4?=
 =?us-ascii?Q?7BE8D1aMLlgN001xXlxcXCfmXLUG3cbft4jtZouRCqH6KhYj4Zh1gdMoGYqA?=
 =?us-ascii?Q?a5xjj4AGlvbI3DRwNny0KvJIbnnuu1Ao0bAo1xgEANgWnfuoUHqxKlpfdUFr?=
 =?us-ascii?Q?3y9Vyui6N1cxuiX/KBGpJgK3X9B2TI1uqDX5zow5RKD2GfGEq9LRy1d/Xo+V?=
 =?us-ascii?Q?h1M/IHmOUqVSLpml4RREj89OTKhgtxJ3rBriTJh87onKmqlPG20cyis9WS4W?=
 =?us-ascii?Q?/UzVnSoNa5Bn8rpAaHwCD8GDjKrdRVaCflC82HH/f4jPBJAmwcCppRKR3Nci?=
 =?us-ascii?Q?GhryC5k/VSwrRZsKnRSAtI5k8Alg4Oo0wRyiRkUQ0bb3lmDiWVirSgdYbgQR?=
 =?us-ascii?Q?eOZPxeuIdB1fpuHjYvT8aYtBHgeZF45y7HN51JhXnclPDXWLvQtApDKCpqJV?=
 =?us-ascii?Q?Udq5YViA97CMOBBNC4EkHRngVlOvbBuY3hCNHPaeHm4HCAy4O4HJw6dm4KNe?=
 =?us-ascii?Q?qFM1xKSUJenuoAzY1PZ+tnUxkuC/fn397yrfAEQ1KWFrDs+jFpctLzp0fero?=
 =?us-ascii?Q?X1urQwHxikmxNiS/5zuMFp2KJqAoHHasZeMoIxTQMw+BORk69K0ZzGeZ/Xi7?=
 =?us-ascii?Q?V1GUvG+h4kmHFahKohGEoyJfqCqqIO5fjQv/+uD+pbhceqfhNqNSBFqQgPmQ?=
 =?us-ascii?Q?pnYEzXk9L2SO4xtAW3YHPHiU1lBhEPfLITBheEhhbPe/IvCrxizuKzZzfTGM?=
 =?us-ascii?Q?urBZU7qUQI202S1S2qs9rm61DAJTQqLzLaz+pcmnJf9+we3qk9GC3zqjq/Fg?=
 =?us-ascii?Q?8r2LH7UHqBrCUMXKuRhlg3orQaVdmv2/3pwLAcP7qm35E+nI9/QGzHJcnX/m?=
 =?us-ascii?Q?1y170f0pI2aoF2iK+NJENBheFUa2fxJX9BaT10awCiOP7CaVT3PqR0ywpEfI?=
 =?us-ascii?Q?5SmLTgUOQArUIkv+mJfh2u07VpzV4XEfRJOn1N0xcJW16bS2I5Fh7HRL0Lpl?=
 =?us-ascii?Q?dU3H5llOqEs8RiM1cieMJ9alfV5MUaDSkVYVfo4yoqliF0/8Bw2JsJnweHOY?=
 =?us-ascii?Q?J0FGyBDmGpxMojFPrfWaO2NlU/HRGo2bE0bHb8HSK6KFu+9Klo47evBiWWP0?=
 =?us-ascii?Q?iuVUTgAf6H+q2mCkyNrEgHmozDMcTaTPTlv7C/4SqCTS4FB+rg06J92+XoAE?=
 =?us-ascii?Q?nIA+Up6W7swW6/PZFvnIR/QpJJplwBIn9fs7uFJDIQLdhm96inWxjhQ9M78e?=
 =?us-ascii?Q?sRsjjnnCIle4WLXSZZZk8oAb1YYi2jQCfgiNe9FJatFxp9kvbupEKKTQ6R4I?=
 =?us-ascii?Q?o2aKlk/QXgq3CF2HBtgkS2Cwxq5yZqiacM5INBMXLDWpFjZZBTSMzUEAhacb?=
 =?us-ascii?Q?cSMKME8wE/INcElPZgqYqhoSfcm/YEfIMtKgR0HFKxOLpyjv8KaTi64TTX9V?=
 =?us-ascii?Q?wXu3cw3CSaWV8q3QCEFk9ygoLckKZnCm0eeJJGpiILOyP6LVyNlO?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: eef3b7f6-bf5f-4c6d-ed3a-08dee89643a3
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 08:42:01.1630
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZGQLXr7RaKO2gJRrNHz8kCv/4nom0FKUOK2Dirhkhf4KCExqG9e6QVEOaFXEw0vH0jnBMX3DPPK1PT15utqNOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB1883

From: Frank Li <Frank.Li@nxp.com>

Move dw_hdma_set_callback_result() next to the descriptor helpers so
linked-list completion and reset code can use it without a forward
declaration.

No functional change.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Based on Frank's original submission:
https://lore.kernel.org/dmaengine/20260109-edma_dymatic-v1-2-9a98c9c98536@nxp.com/

Changes in v2:
  - Move the helper before the LL helpers so later patches do not need
    another relocation.

 drivers/dma/dw-edma/dw-edma-core.c | 50 +++++++++++++++---------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index 78d1bb6302fb..29f78405e9fb 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -73,6 +73,31 @@ static void vchan_free_desc(struct virt_dma_desc *vdesc)
 	kfree(vd2dw_edma_desc(vdesc));
 }
 
+static void dw_hdma_set_callback_result(struct virt_dma_desc *vd,
+					enum dmaengine_tx_result result)
+{
+	u32 residue = 0;
+	struct dw_edma_desc *desc;
+	struct dmaengine_result *res;
+
+	if (!vd->tx.callback_result)
+		return;
+
+	desc = vd2dw_edma_desc(vd);
+	if (desc) {
+		residue = desc->alloc_sz;
+
+		if (result == DMA_TRANS_NOERROR)
+			residue -= desc->burst[desc->start_burst - 1].xfer_sz;
+		else if (desc->done_burst)
+			residue -= desc->burst[desc->done_burst - 1].xfer_sz;
+	}
+
+	res = &vd->tx_result;
+	res->result = result;
+	res->residue = residue;
+}
+
 static void dw_edma_core_reset_ll(struct dw_edma_chan *chan)
 {
 	u32 i;
@@ -645,31 +670,6 @@ dw_edma_device_prep_interleaved_dma(struct dma_chan *dchan,
 	return dw_edma_device_transfer(&xfer, dw_edma_device_get_config(dchan, NULL));
 }
 
-static void dw_hdma_set_callback_result(struct virt_dma_desc *vd,
-					enum dmaengine_tx_result result)
-{
-	u32 residue = 0;
-	struct dw_edma_desc *desc;
-	struct dmaengine_result *res;
-
-	if (!vd->tx.callback_result)
-		return;
-
-	desc = vd2dw_edma_desc(vd);
-	if (desc) {
-		residue = desc->alloc_sz;
-
-		if (result == DMA_TRANS_NOERROR)
-			residue -= desc->burst[desc->start_burst - 1].xfer_sz;
-		else if (desc->done_burst)
-			residue -= desc->burst[desc->done_burst - 1].xfer_sz;
-	}
-
-	res = &vd->tx_result;
-	res->result = result;
-	res->residue = residue;
-}
-
 static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
 {
 	struct dw_edma_desc *desc;
-- 
2.51.0

