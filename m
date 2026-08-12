Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021092.outbound.protection.outlook.com [40.107.74.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED2647ACD3;
	Wed, 12 Aug 2026 15:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786550276; cv=fail; b=JC/j7aRaL/UMvN7zAcWv/mCCiIPpGTKpC17ptihu80SvqHjcQZmsRenxzDulOvwQGkZddEqOWqKWA4nnorWd6YlUFVfkza81pnKGHEZnHJC/3N40L7nheoniy5JOt3o8jLswksdyO1vfcZMmY7SGNbiP/wWOe87CKhXZn034qNY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786550276; c=relaxed/simple;
	bh=qBEp0d/wkGX8sdXGz1MhtNets/tVO6xJPQali+LukXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cbqAeDmaihUYcQ07c7kfsOoZvY3PD4D8mGiYS0Xrvu9DOK09MZO25bq7+f1HhLrjf12A6X8MUKDx2zd2JkIUPpZpT+UtVgSQaGClcp+caRfOOpFh1DMSBxgbUl9tV9XL6bw7WtevZLMcM73raTvNaqS9hS3OxmpOwF5aXmSkHtY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=HlxzTMlo; arc=fail smtp.client-ip=40.107.74.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="HlxzTMlo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JIeyr4cgO60RHjbksqgrWV44RcP2XxxiUwlxaUxNtOpztw41xs8CSOhAQ8xVK7Cl6XiwafGa121kNiXcSAJziM6Uc9jI++NRj/9r6bMN7vIdaOev5m/ET56R35zbe2JZDYKkAZvsPWeJnevzcpNR7BbIO1441sFAQpZ3lG6wJ/pOqQyHU7VJNrPR0fkJGya9y/avzKHHjsjwG5BztZ48SRhNSlgzj9X28qWXMQFMLVE6s2klr/XfxpvRy6i+rfOTDK/YXLHxltbIDFvzLAOlBpVAuH1SQaRBzyBCxWaA0RJCcCETP40oCVhhwI0TamQVFiHAIqbLUanUQd17jPpW2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U2xvVOegUqhRTV/rmKVgc3QzF4fpAXJ1v10a5a+yNUs=;
 b=A70GMcMgiaHydwWY3Zigfy1EIemQmcM3Q09xd7xh4FRqot7mqskYbsMEWC0QdaMVfG8DGd+M1DQbUr12HatF2HhSLLIrfq3gtvtHimw9rAMCJcQyGco7zn+VVDDe2VY962EegOhvmhmV8zcHwZhOS7UnzKe7Aw9x7SWV2CFflqVfqRRsyplisAmZRtsSRyRHKXW8gIuCzMyR+tqQS0WojIB6IBLZ5LShWCin2XWpvWIUQzknA9e9PSmWBZLEkCKR3ge3MDM2x+zONPdc1n5XxMaHQ2/VX0Y88y7XQQXVDVcwgXLqCIxN5K98S00IncxrT8DgmX08wd43MXjjrrNOug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U2xvVOegUqhRTV/rmKVgc3QzF4fpAXJ1v10a5a+yNUs=;
 b=HlxzTMloa7MtRFfah6QpN2ZdZttvqYuOGuMUipuxIIZpRC3qbhGoWEImwOUgBoHZjWhe2nwISQCAap8aswL3MhK8h80U70cJKcLlLQ3cUkJ/aU99/hjPBzFaqW4j0wt1p/4J922dM8DxMoXNotKi3NNPHswyqzCTaxfrKH+FMS8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TY4P286MB7069.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:343::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Wed, 12 Aug
 2026 15:57:40 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0292.024; Wed, 12 Aug 2026
 15:57:40 +0000
From: Koichiro Den <den@valinux.co.jp>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
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
Subject: [PATCH v5 18/24] dmaengine: dw-edma: Make the LL ring reset a full channel resync
Date: Thu, 13 Aug 2026 00:57:15 +0900
Message-ID: <20260812155721.2807506-19-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260812155721.2807506-1-den@valinux.co.jp>
References: <20260812155721.2807506-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P301CA0024.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2b1::11) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TY4P286MB7069:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e4fd8c0-32f0-4146-0cef-08def88a7013
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|23010399003|7416014|18002099003|22082099003|56012099006|10067099003|921020;
X-Microsoft-Antispam-Message-Info:
	p0BMcxQKQU1uEPDq23/wwvSX7GYDiutm91nCq/VsV/ckunzEO1DExx/g3TrdOk5Y9GSulCjKN0ot73w2q5iKASbUeDhGtjAi6Cw/XXMKiN6kdQwVkg36eSBvfp/D/7MtfZdf8ykY06NbKuK21iEECybNlxn7SJkHB9XLp+adih//Zat9/nm1O/K2HlZM82oiQDEVwjgWR0KZW64pLjn1Ut3bWFwfNjtR/CpBhWHGzAvE7VaPEQyEIBGBdW7vKJvFsxtp8oYAGj9GhBHgGe8JPmTw0UQ4SyRIHya5qTnNY4IOpHEFviHXwl4KykUcejjWWh2hfV3ILSDUCFR/Jxvv3yQ6MLfTp6aQKmJKJRhZPazEYWucgf93a8bR7mjVCL3axkNGCagbdXt4I3VF16VF13kPOZxnjRFcNCR2sM6xL4mzPwu9RISqFYbIleoawr5tvOLKx8lw954fIsOzep5ne7vEWdj6FLJip4sT/mGGPr+LAhE0DczITHqCuvmmdryz4RIftnoG2Yd5nLHDhd5m9fuGvoVvjw/I2TE7vR6ECRgsHmsdPyamjkfLzSK43Rn0CS2Go4AaVw4G1lVAhK5f2hV50mqEQZmhCNrnV1kl1QCfyF2skKp/nDqfpywTF6xAKR2j73lrRE4O67F16f6jBlJHD/QqzxBoufwMsbPcXwtQPZ+UBC8NOVZOUGL9a5xWmYkiVQj2n7uGGwY2EZF0ew==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(23010399003)(7416014)(18002099003)(22082099003)(56012099006)(10067099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VKFoA0UPJL1tm1AsSCYLlDHBh+2ouLquP1einChRAEPPeClCaIxI8Fbq1Y9f?=
 =?us-ascii?Q?h0o+3X6Iepipvi1vKXYV+B5ZwXE9iV88yl3cCmZWVdYoj49zUKzjL+LY9y4a?=
 =?us-ascii?Q?nQ0eEmaKF9CPYjg6NYRB25G9GyhVip3KcKLErpiu2DxEu0EqUNBN4O1mLbjE?=
 =?us-ascii?Q?Fy4k0B2pKFSO/r9IuS1USRNnNphBoSGNU0uTBnbaIALiAL7SiSv5VkTkbYe8?=
 =?us-ascii?Q?vnSGonGACIsm/g7ubC4Yk9e/jpzNVEych3PjYtLfSxmm7wp4FZW4ZT5egQIh?=
 =?us-ascii?Q?55/qV+ug4XQdHa+X69D/JIRHpGW39tGbkpdtBhCraysjskcO3W4LUeuDPTPv?=
 =?us-ascii?Q?mlAGjZNfyIYmnRuLJQhTJDq75h/TdS3nGSoytPHTb3i8mSQT3T7tGhRrGzVR?=
 =?us-ascii?Q?9JTrI0RppIXmKOho70kxA8F5Q2f7+YMHCm5PJArneFqvlS1NbrQhPnkn3j5J?=
 =?us-ascii?Q?T0gax4ALq0omFUck5XaOIFORouDnNVYFP2XT7NrSNesP6zlS10xj7N2rXtYg?=
 =?us-ascii?Q?Gd2ksmKpPgnufAMLFXMkmamwtIe4+HbRSF/v0bAy1fNZR3LrNF48T9gG1WFK?=
 =?us-ascii?Q?7q/IenKLL9bsaAPoZh/v8/DVozyn0QnlsBipGPH81LQc9xqRLK0eUjL6VcgU?=
 =?us-ascii?Q?3rDAnBHUDUPa879Wf0qgqL3N5OYz2ufrL8rM8HBWfd+kGe7CJFM0zfdYFfiu?=
 =?us-ascii?Q?Hzo6aH7+6XefLeF4U1GsZkLCF+OcB+RdT1LyygAbCw0ad9OiakPLucG86Dnd?=
 =?us-ascii?Q?P1qKQ838QFPIXI4n6nyThMJvpdgVf8JxxzyJ54SbCMWkNHNCeg5odE9y/LbJ?=
 =?us-ascii?Q?lHTzrBnK7/h5QX2ZXCmIV+jh6OyGK85XIiKBvUjiKn7F5DRFde5gxJOE6LvM?=
 =?us-ascii?Q?FH5MoPL1O1ieBFAaEilvZjWS4W8LZ7d9oQK2gMmtCnmyRGL8QyXXltnrO5Cw?=
 =?us-ascii?Q?FiIsh3OE5bxmGK9vyPZsK4B7ddmH3cp9uQEXnP1XMwYvqVriDKITSG+pSLf/?=
 =?us-ascii?Q?7F6KifYAxo3Nfe07P+dE0s2miSrGqHuHPJrPFz2M62ewIrOZEFY4cY+L83XP?=
 =?us-ascii?Q?V1zMXOtFVB3mCKCHTZN7xbRyD/MOdtEBwRp3xIC6qf5s+YDh3049RSlEx1cm?=
 =?us-ascii?Q?v7XIo98a2+WAagtSSaGr1VXFKhgY/WyMUSZSGRd9Jv0RXVudA4ppyfhOe/P0?=
 =?us-ascii?Q?tZz9X7F3HUpOP9TB5vmY/qxyHUsyILQ4plPdrdDk7WZ5NCBPOcL6laXICiPB?=
 =?us-ascii?Q?vSzSrP4BRIp/NrPbr7aDL6s8nnafDTis8bxUBbgqfShk0EMNlqP7DHDXoAwi?=
 =?us-ascii?Q?WwW1efr7i5nHaF6jK+X/GQEXYT+EnEUNXxgoPO04g2utkcGunMfioKdOQUQ2?=
 =?us-ascii?Q?J/dh/aPepFOZRb+kVDrcA5SVDYfsUgYCBeYnNx722ODRh7joHQUw5WftnTy4?=
 =?us-ascii?Q?a7BKTqvj1O8kUHrKRVZWvjdL3UGcMFF7/Jh2BvqsaFF/hUCULV6jm8Zy4k21?=
 =?us-ascii?Q?pAPBuKqPKIMnIMA6pGzdo9Y4JOiC2/X7xjGaBmmErbhTsDMjvAnLntPDxo7I?=
 =?us-ascii?Q?gqFxI1oASsvSZ71C5NIJ+oaRz/Otj7dSZc74cM+XOyV/jDU2tiNGB4g352GF?=
 =?us-ascii?Q?jjnE/21y+ut2BXtpnG5yV1VMKC5LVPEGEt5ha7nopB6D58ZhGEMDaAZBtH66?=
 =?us-ascii?Q?19emaP0s78CgVt/n362Jr3bhhmxp4qo/jF/ffrZXtGi03Lt7Ed3GbwgX1GpF?=
 =?us-ascii?Q?8UsqDYwYDf8M3lTbU1grN9M1XzfTr5jgigislg5Oq4xYmH8xFLDv?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e4fd8c0-32f0-4146-0cef-08def88a7013
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 15:57:40.3152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7VjkW7o7Oh0O0+jQUmbjPIkSiFJP3kCqIAXbio4nu2AyK0olUDVmop7Cdp7kuqOgvqXtMuFXPlZoQxgiDSytyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4P286MB7069

Reset currently clears the ring but leaves issued descriptors unchanged.
A descriptor with published entries is then stranded because LL progress
can no longer account for those entries.

Cancel any pending stopped-tail recheck before replacing the ring state.
Keep descriptors with no outstanding published entries so their
unpublished work can use the fresh ring. Abort descriptors with
outstanding entries because their consumption is unknown and replay is
unsafe.

Since resync can complete and remove descriptors, reset the ring before
looking up the next issued descriptor.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v5:
  - No changes.

 drivers/dma/dw-edma/dw-edma-core.c | 32 ++++++++++++++++++++++++------
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index dffe3f8b8c20..eb0fc73a4f47 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -212,10 +212,29 @@ static void dw_hdma_set_callback_result(struct virt_dma_desc *vd,
 
 static void dw_edma_core_reset_ll(struct dw_edma_chan *chan)
 {
+	struct virt_dma_desc *vd, *tmp;
 	u32 i;
 
 	dw_edma_ll_recheck_cancel(chan);
 
+	/*
+	 * Software cannot tell which published entries completed before the
+	 * reset. Replaying one could duplicate a transfer after its target
+	 * changed ownership, while keeping descriptors with uncertain entries
+	 * would block later in-order completions. Abort descriptors with published
+	 * entries; untouched descriptors remain available for republishing.
+	 */
+	list_for_each_entry_safe(vd, tmp, &chan->vc.desc_issued, node) {
+		struct dw_edma_desc *desc = vd2dw_edma_desc(vd);
+
+		if (desc->start_burst == desc->done_burst)
+			continue;
+
+		dw_hdma_set_callback_result(vd, DMA_TRANS_ABORTED);
+		list_del(&vd->node);
+		vchan_cookie_complete(vd);
+	}
+
 	chan->ll_head = 0;
 	chan->ll_done = 0;
 	/* Drop stale CB bits before reusing the circular LL ring. */
@@ -363,6 +382,13 @@ static int dw_edma_start_transfer(struct dw_edma_chan *chan)
 	struct dw_edma_desc *desc;
 	struct virt_dma_desc *vd;
 
+	if (!chan->non_ll) {
+		if (dw_edma_abort_is_pending(chan))
+			return 0;
+		if (!chan->ll_valid)
+			dw_edma_core_reset_ll(chan);
+	}
+
 	vd = vchan_next_desc(&chan->vc);
 	if (!vd)
 		return 0;
@@ -381,12 +407,6 @@ static int dw_edma_start_transfer(struct dw_edma_chan *chan)
 		return 1;
 	}
 
-	if (dw_edma_abort_is_pending(chan))
-		return 0;
-
-	if (!chan->ll_valid)
-		dw_edma_core_reset_ll(chan);
-
 	dw_edma_core_start(desc);
 
 	return 1;
-- 
2.51.0

