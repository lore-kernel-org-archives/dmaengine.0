Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11021140.outbound.protection.outlook.com [52.101.125.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E50409E16;
	Thu, 23 Jul 2026 08:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784796136; cv=fail; b=WQrmJgB9vyrsERMONfAQmNWl/7RfR4ZTuf5JDex7vijVRhyVfQvYo81izaNjnGYCcRjVicYuU0+Ggzh3QXhMdkDD1kJ7dleuVhGXKTPqDD7bTYr9SQLtOGr5FjT2coj6bxRkH58AxDQKQeX8SPJVKzcjwunuupUwZWWST3smZCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784796136; c=relaxed/simple;
	bh=hQd4okfUxX+WNzJAZxIH0MwufO8KQTwhvquKSN8nrL0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XULmZimkdpeh7vIkJamVlq+bEiNZq6YoNlIXOfYIgH46DafuxCk4buWPoGtOe5F8BtTfuTmlrnyPUSz0WmtOBw34Fv6BmIpoLW3qzUTLfPrOY5Dq3V2q/c3WrW4BFBc3nhv/ZrvYtgk8TPMDpgQI+xrZ1mHWy0uMYbVpEc9MyrI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=Y+l287Gn; arc=fail smtp.client-ip=52.101.125.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="Y+l287Gn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FEseBB0/BwFrPsauzyXeBdouoMuXLrLdyZiTShkVx5VwjnxqGLERAYA5DMZEIm5HsIuElUghaNQgCoQNAB/ANIukc3TrOwI9S5FFoVATfZx9QlSb/wkxM1Jk5VAO6ZL+O+nxNPZqrmkvdDtTIE/DlPnfMeAM17HbYlDaIFmx7tqYhaXwnWiV1NOzLrLx7qW2jzl5kBfRcU9eeblNS9Gj7YgB3XR36L08APM106nlk3zm7ws4TfwWQFAvzgs/Cn4vEQyT8TyONLwgJMKiUWiyCsJ+DvEtPusdlad1xB5MPsHs7Hu1AQixljZrf9fGfnGP92BhjmECCG8j0wTmvlNK3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IMTdNWfUnKjPmlFjvnsveeTzASt66gZYWxxyfjub1gM=;
 b=SLOQX/g991p/9TUH9tZcwLaQ+MF7ED0oIWfts9D4CShP6Fv8emhILS6krUxcjEKIDvzACQ8xmEtJB0hgdwe+g6VBppN107ps3s3ixXWORsffL3nRhyhon551jlt41UMZU76vacZ/cFUiSRbF6zqym9o0COuv/n4BxfUPX6sJcc879gughd5qyck7yqCWScqdnGydlFpAtFDqQj+y0yBZF/8Byf4CZDtFX3s9UKP7NIBV+aHo01uhFYfF+5eoULXGBWm5qGHRU2gso+Q//6MSBVoPofsNS97fmbsxV/V9mQu/P7GsLl6qCE1+7gmnVmg3Q5hQYbtCyqLEpZUL2LnChg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IMTdNWfUnKjPmlFjvnsveeTzASt66gZYWxxyfjub1gM=;
 b=Y+l287Gn5+wkIBm0XF0ph98MiLkkouOuk2qytEuuYNLasLUievaDFJzpRPG0en9/Mgh74KKHQtWH3CNW7BQysRwIQoktaqx4+nUO6ITtIcK/0kBX0cGYg2AYF6un9kxHU1CGgVzlLL7vkuTRl3Xz31PPvuM3IWwvpT/aUl88ooo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYYP286MB1883.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:111::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 08:42:03 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 08:42:03 +0000
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
Subject: [PATCH v2 09/19] dmaengine: dw-edma: Reclaim issued descriptors from IRQ-paired LL progress
Date: Thu, 23 Jul 2026 17:41:40 +0900
Message-ID: <20260723084150.521366-10-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260723084150.521366-1-den@valinux.co.jp>
References: <20260723084150.521366-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P286CA0121.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37c::10) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYYP286MB1883:EE_
X-MS-Office365-Filtering-Correlation-Id: 41a6e4a6-b9e3-4beb-ab94-08dee896451b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|10070799003|366016|1800799024|921020|6133799003|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	A5TM410SBYII2DLTsQceTQSM945h/BSDEj9zdeCsERLPjq4X2WPoX+2UULSSMH4vyplIAzGfdbr/H+9vKTrCdTmSmtxaN0Z7hv75e4f4sSDqcJMbrQN+DTS0E+nknz37i01GVPQkyuOEToxV5/mXeTft4w1+bUlU+I0XZQk2C0lStoI0VMs8TOhBp43FjTZD/3oBmHiNRwkR/itTWhua/r7HRe5DIVDZ42yycbyr5jR95tgj0q+WOH1Stzl5V+iq3HP+Vm4UlEk8rk2XJmRafKmDqLEGtPfrEGuNyPTn2zSeoY/7kV0dCte7K37spkMalorZWCS7Wv0JAPK38kQ3lR8lmVILhwJ7K1l63256O44DPd/LQprojoMdhoMWKUR2HM4oFUoBMkC7pJguHrU5v9hE5YQ884otRV1bhVlzZqtaSOdNonIuQP8KQV1K0y9DJfSDBhUZBaHKLx04cn9Ld03JmrALIiagGmzaJbNx+GQNcwmfDIsFnibWojDAeB6cbSWAgW5aDWbybmJn0B8yvLehJOkteTdRyR4kjAlNzfW+RQC3gTd30Xg8taP0MUmhD/0FN12PcevYNX7hyyeRQWE080i+nyPVdCVYJvLqgnNfGSImkMl0eulUHroVAyZ+aX7E9rBsfPrB/8e13r6XU+KnwkLTg6TM944nfsJszkWH1I3WfO0RSnEclmqoCFrX+rMGUq7eXfCtq0vjh0zTWQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(10070799003)(366016)(1800799024)(921020)(6133799003)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LAqhOLEG8t8IDnFsl/ukoVO5PN8X9uKmTXxAlS6bp5ijZKY+uq/z+UBnGE/N?=
 =?us-ascii?Q?qcdC8CGivwzSTep9Tt3ujnh5uXqiPUJsSMa6jRsJmvDyEytr6iOPv4JfSFA/?=
 =?us-ascii?Q?gkm8JPm92bXY+7I6o8US7IIQ43LI4THbsoAQB+q/8lsSgWPbJkHR+570/QX4?=
 =?us-ascii?Q?Mk0W8J1m1ZiqGZrpSmgQc0eg6/3KXFFMY64CJ4CsK26ore7RA52C7Py27hhn?=
 =?us-ascii?Q?1jWo+AK17/01yfxfCKgbjku/F/yYDIb8Ut8yhtKBNJ5WMAcVaaOr3pIyMBpi?=
 =?us-ascii?Q?i/Y+0DacVhqRxUhDv1mgL4/kUe1qhIjPY445mFsF0j6iWiw9m1OTU52NkaN8?=
 =?us-ascii?Q?bS6Ss0xZCh7TPx3emg+2LzPG1iZooRvFF72MzxT+u05uq8l87FwcOhd71HyT?=
 =?us-ascii?Q?aFeKshel1ZRhb+oZufizXyBUDsV2DI3lRgEr59QilRXowt9ConqJavN6aOkS?=
 =?us-ascii?Q?xIGa0Oc4ZvtMEEIXIeRYEiQKi7EjWMNAJNrvvvKup62MI1HF+7C+H7rNUQn7?=
 =?us-ascii?Q?955/kUlTup40XGx19PKl29Iwq76c8SuohHAZqV49hM2Idf4F0DeW9/86W80d?=
 =?us-ascii?Q?QBme/rLYw6o5yA1aNxjdwzQ6bdfWjmPPfrWdr0qmlYv1g+uUQuV/fzYI55+S?=
 =?us-ascii?Q?89Dt9eBLDjeC7C1CYjf+h6Ie63AyyB97Uv2AB65pLqz46tqTfQQX7eB1TrVn?=
 =?us-ascii?Q?eJApjBPuwCRjmh5DyODRcNS6yOvDA5PtBPqjb7R3XEHkSJNRdp0QSe9dW1dU?=
 =?us-ascii?Q?nkWvJFZ+mYSknwciLOT1HJSF/4jGMs6tv41BZmPwA+pK7E3Hbi1BczeEoK+Q?=
 =?us-ascii?Q?xendbGsV/nRx0d9D/GbCZ88zMZatD0KRB0OrnmDw5ysBDMHykXTADs7IQbzM?=
 =?us-ascii?Q?h2nOkJ58qiZNXoMrgj8860LPWsm9OFCTOAgLBeKA4zA6AM5K5bo9WFnwZJRr?=
 =?us-ascii?Q?9wJEQS1E8HcINnEFLAO1pd/fHcPUggpWMwlZxDtKuUbDGOlQGTPmj3Sxh7wA?=
 =?us-ascii?Q?ig/InXem9vIfwyK0FeEMAynEFwLO8TuXwM2d2F/7yE/2OiMPDQMAVA/z5MNk?=
 =?us-ascii?Q?+D6VXPxlp6ZJKQRDaKrcE6FketOTUEEi5cWus76DUjgtYFvFi/dU9V8tFaKf?=
 =?us-ascii?Q?ppVXLn2LnK/a6HjDF3CikZYWwwmOVu3DwvSk2M4TNWeSJ7yBSOcHJ9NuYtDL?=
 =?us-ascii?Q?Dc1mqcXPBkmXdWKLMJ0EzkljXFU0tBHqDLbcyTyMzVTSgv0FSF1CyrCXv5Qq?=
 =?us-ascii?Q?pPVlsz33YriiofnKQXsf9I2hv7M4WxcpPTl0Lpis5Q1rWE5XmLmlkHBSNFVE?=
 =?us-ascii?Q?J8Zale72hpzOfQjtfTx/qXLQrF9ckNm6ueg4w8kMwqK36y1SpHXxaZse2eB2?=
 =?us-ascii?Q?8dJT4uNWkfx8NtkxQowkwyDwOGfj22ICGnm1fbxFw3H+PqjTCb1WAmMbpDt+?=
 =?us-ascii?Q?LYXCoBewxbhN8yHtN+EXTtHK/EYFIU6+GqZRN8O64D6dW073HhXoPohITnko?=
 =?us-ascii?Q?nuU8tGNTT9WwgRDnajp9NpEekEldrJ7yryneBgBBzzRnIGjefKg5sI/V4aCw?=
 =?us-ascii?Q?/vhhW29GWd0x16EY1c5cJ3IB1733K2+oVSnt9DeRNaTL4MwHhy0N/6Qvw4oD?=
 =?us-ascii?Q?Xb/aOQn05jtZvuWntBBVsRV7hiBDcHAXI+apiDhtHICwrYP1dqEKJHaRW/vM?=
 =?us-ascii?Q?81emXr6uLOavq9Lj0O6iJO3tCHBfIRKRAfoqGq+CjoyjZqiSIIOv8g2DYpJl?=
 =?us-ascii?Q?S1nH5hFPPaqATEeKsuWfp2PC+jZouLXHT4j4Dn1l2sLe2aRqEITh?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 41a6e4a6-b9e3-4beb-ab94-08dee896451b
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 08:42:03.6181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U4+stkzAU98SLo1D9fIFPAe3o/FacBYQrAe9zYU6ChE8NX5I6gP6NGx8my9vXlwYV1dxSxu4HWAWbh1R9Mvk3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB1883

Dynamic append can put entries from several descriptors in the ring.
Track the consumed boundary in ll_done, reuse consumed entries, and
complete descriptors in issued order. Keep one data entry free so a
physical index is unambiguous within the active producer window.

Sample DMA_LLP in the hard IRQ under vc.lock after clearing status, then
normalize it to the exclusive boundary used by ll_done. A deferred read
could attach progress to the wrong interrupt.

A stopped sample points to the next entry. Keep a running sample one
entry behind because legacy eDMA fetch can advance DMA_LLP before payload
completion. The following HDMA watermark patch uses the same conservative
boundary. Handle EDMA_REQ_STOP and EDMA_REQ_PAUSE even if progress empties
the issued list.

Suggested-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v2:
  - Replace ll_end completion accounting with ll_done progress tracking.
  - Sample and normalize DMA_LLP in the hard IRQ; v1 read it from deferred
    consumers.
  - Use the raw next-entry boundary for stopped samples and keep running
    samples one entry behind it.
  - Handle STOP and PAUSE after progress empties the issued list.

Frank, dw_edma_ll_clean_pending() is based on the idea in your RFT,
although the implementation has changed substantially. Please let me
know if you would prefer different attribution other than Suggested-by.

 drivers/dma/dw-edma/dw-edma-core.c    | 248 ++++++++++++++++++++++----
 drivers/dma/dw-edma/dw-edma-core.h    |  32 ++--
 drivers/dma/dw-edma/dw-edma-v0-core.c |  10 +-
 drivers/dma/dw-edma/dw-hdma-v0-core.c |   4 +-
 4 files changed, 250 insertions(+), 44 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index e88bfb417ad4..44a0ff906f2f 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -51,13 +51,6 @@ dw_edma_alloc_desc(struct dw_edma_chan *chan, size_t nburst)
 {
 	struct dw_edma_desc *desc;
 
-	/*
-	 * For now, a descriptor that does not fit would stall the channel
-	 * forever: reject it up front.
-	 */
-	if (!chan->non_ll && nburst > chan->ll_max - 1)
-		return NULL;
-
 	desc = kzalloc_flex(*desc, burst, nburst, GFP_NOWAIT);
 	if (unlikely(!desc))
 		return NULL;
@@ -73,6 +66,12 @@ static void vchan_free_desc(struct virt_dma_desc *vdesc)
 	kfree(vd2dw_edma_desc(vdesc));
 }
 
+static void dw_edma_ll_irq_idx_discard(struct dw_edma_chan *chan)
+{
+	chan->ll_irq_idx = -1;
+	chan->ll_irq_stopped = false;
+}
+
 static void dw_hdma_set_callback_result(struct virt_dma_desc *vd,
 					enum dmaengine_tx_result result)
 {
@@ -103,7 +102,8 @@ static void dw_edma_core_reset_ll(struct dw_edma_chan *chan)
 	u32 i;
 
 	chan->ll_head = 0;
-	chan->ll_end = 0;
+	chan->ll_done = 0;
+	dw_edma_ll_irq_idx_discard(chan);
 	/* Drop stale CB bits before reusing the circular LL ring. */
 	for (i = 0; i < chan->ll_max; i++)
 		dw_edma_core_ll_clear(chan, i);
@@ -116,11 +116,26 @@ static void dw_edma_core_reset_ll(struct dw_edma_chan *chan)
 	chan->ll_valid = true;
 }
 
+static u32 dw_edma_core_get_ll_dist(struct dw_edma_chan *chan, u32 from, u32 to)
+{
+	return (to + chan->ll_max - from) % chan->ll_max;
+}
+
+static u32 dw_edma_core_get_used_num(struct dw_edma_chan *chan)
+{
+	return dw_edma_core_get_ll_dist(chan, chan->ll_done, chan->ll_head);
+}
+
 static u32 dw_edma_core_get_free_num(struct dw_edma_chan *chan)
 {
-	/* Keep one data entry free so equal indices mean an empty ring. */
-	return (chan->ll_end + chan->ll_max - 1 - chan->ll_head) %
-		chan->ll_max;
+	/*
+	 * Measure occupancy from ll_done: entries consumed by the
+	 * hardware can be reused even if the descriptor that owns them has not
+	 * completed yet; this lets descriptors larger than the ring move forward.
+	 *
+	 * Keep one data entry free so equal indices mean an empty ring.
+	 */
+	return chan->ll_max - 1 - dw_edma_core_get_used_num(chan);
 }
 
 static bool dw_edma_core_enable_ll_irq(struct dw_edma_desc *desc, u32 i,
@@ -129,9 +144,51 @@ static bool dw_edma_core_enable_ll_irq(struct dw_edma_desc *desc, u32 i,
 	return desc->chan->dw->core->ll_irq(desc, i, free);
 }
 
+static bool dw_edma_ll_advance(struct dw_edma_chan *chan, int idx, u32 *old_done)
+{
+	u32 done;
+
+	if (idx < 0 || (u32)idx >= chan->ll_max)
+		return false;
+
+	done = dw_edma_core_get_ll_dist(chan, chan->ll_done, idx);
+	if (!done || done > dw_edma_core_get_used_num(chan))
+		return false;
+
+	*old_done = chan->ll_done;
+	chan->ll_done = idx;
+
+	return true;
+}
+
 static bool dw_edma_ll_pending(struct dw_edma_chan *chan)
 {
-	return chan->ll_head != chan->ll_end;
+	return dw_edma_core_get_used_num(chan);
+}
+
+static u32 dw_edma_core_ch_transfer_size(struct dw_edma_chan *chan)
+{
+	if (!chan->dw->core->ch_transfer_size)
+		return U32_MAX;
+
+	return chan->dw->core->ch_transfer_size(chan);
+}
+
+static bool dw_edma_ll_irq_is_stopped(struct dw_edma_chan *chan, bool stopped)
+{
+	if (stopped)
+		return true;
+
+	/*
+	 * Native HDMA reports STOP separately. The legacy interrupt interface
+	 * uses DONE for both progress and stop, so confirm a stopped boundary
+	 * with channel status and transfer size.
+	 */
+	if (!chan->dw->core->ch_transfer_size)
+		return false;
+
+	return dw_edma_core_ch_status(chan) == DMA_COMPLETE &&
+	       dw_edma_core_ch_transfer_size(chan) == 0;
 }
 
 static void dw_edma_core_ll_start(struct dw_edma_desc *desc)
@@ -166,7 +223,6 @@ static void dw_edma_core_ll_start(struct dw_edma_desc *desc)
 		}
 	}
 
-	desc->done_burst = desc->start_burst;
 	desc->start_burst = i;
 }
 
@@ -235,6 +291,110 @@ static void dw_edma_terminate_all_descs(struct dw_edma_chan *chan)
 	dw_edma_terminate_vdesc_list(&chan->vc.desc_submitted);
 }
 
+/* Must be called with vc.lock held. */
+static void dw_edma_ll_clean_pending(struct dw_edma_chan *chan, u32 old_done)
+{
+	struct virt_dma_desc *vd, *_vd;
+	u32 done = dw_edma_core_get_ll_dist(chan, old_done, chan->ll_done);
+
+	list_for_each_entry_safe(vd, _vd, &chan->vc.desc_issued, node) {
+		struct dw_edma_desc *desc = vd2dw_edma_desc(vd);
+		u32 consumed, started;
+
+		if (!done)
+			break;
+
+		/*
+		 * start_burst is the append boundary. done_burst is the
+		 * hardware-consumed boundary reported through LL progress.
+		 */
+		started = desc->start_burst - desc->done_burst;
+		if (!started)
+			break;
+
+		consumed = min(done, started);
+		desc->done_burst += consumed;
+		done -= consumed;
+
+		/*
+		 * Descriptors are appended in list order, so later descriptors
+		 * cannot be complete if this one has not been fully consumed.
+		 */
+		if (desc->done_burst != desc->nburst)
+			break;
+
+		/* Hardware has consumed this descriptor's LL entries. */
+		dw_hdma_set_callback_result(vd, DMA_TRANS_NOERROR);
+		list_del(&vd->node);
+		vchan_cookie_complete(vd);
+	}
+}
+
+/* Must be called with vc.lock held. */
+static int dw_edma_ll_recycle_idx(struct dw_edma_chan *chan, int idx,
+				  bool stopped)
+{
+	if (idx < 0 || (u32)idx > chan->ll_max)
+		return -EINVAL;
+
+	/*
+	 * Convert the raw LLP index to the exclusive boundary used by ll_done.
+	 * For both eDMA and HDMA, once the engine has stopped, LLP points to
+	 * the next element. ll_max is the link element, hence the following
+	 * data boundary is 0.
+	 */
+	if (stopped)
+		return idx == chan->ll_max ? 0 : idx;
+
+	/*
+	 * Moving a running index one entry back cannot represent index 0
+	 * without wrapping it to ll_max - 1. That could falsely consume a full
+	 * producer window, so wait for another sample or STOP.
+	 */
+	if (!idx)
+		return -EINVAL;
+
+	/*
+	 * A running eDMA LLP can move ahead of payload completion, so keep the
+	 * boundary one entry behind it.
+	 *
+	 * DWC PCIe Controller Databook 6.10a-lca06, Section 7.2.1, Table 7-3
+	 * describes an HDMA watermark LLP as an inclusive LLE recycling
+	 * boundary, which would normally translate to idx + 1. During testing
+	 * on a DWC HDMA 6.30a integration, using that boundary for DMAengine
+	 * completion let clients release DMA mappings while hardware still
+	 * accessed them, causing IOMMU faults. Keep the boundary one entry
+	 * behind the raw LLP for HDMA as well. Stopped samples continue to use
+	 * the next-entry boundary above.
+	 */
+	return idx == chan->ll_max ? chan->ll_max - 1 : idx - 1;
+}
+
+/*
+ * Must be called with vc.lock held. Consume a recorded LL progress
+ * boundary, if any. Advance ll_done and complete descriptors covered by
+ * the newly consumed range. Return true if ll_done advanced.
+ */
+static bool dw_edma_ll_consume_progress(struct dw_edma_chan *chan)
+{
+	int idx = chan->ll_irq_idx;
+	u32 old_done;
+
+	/* No progress sample is pending. */
+	if (idx < 0)
+		return false;
+
+	dw_edma_ll_irq_idx_discard(chan);
+
+	/* Ignore duplicate or stale progress. */
+	if (!dw_edma_ll_advance(chan, idx, &old_done))
+		return false;
+
+	dw_edma_ll_clean_pending(chan, old_done);
+
+	return true;
+}
+
 /* Must be called with vc.lock held. */
 static void dw_edma_core_ch_maybe_doorbell(struct dw_edma_chan *chan)
 {
@@ -424,6 +584,8 @@ static void dw_edma_device_issue_pending(struct dma_chan *dchan)
 	if (chan->configured && vchan_issue_pending(&chan->vc) &&
 	    chan->request == EDMA_REQ_NONE &&
 	    chan->status == EDMA_ST_IDLE) {
+		if (!chan->non_ll && !dw_edma_ll_pending(chan))
+			dw_edma_ll_irq_idx_discard(chan);
 		chan->status = EDMA_ST_BUSY;
 		dw_edma_start_transfer(chan);
 		dw_edma_core_ch_maybe_doorbell(chan);
@@ -697,6 +859,7 @@ static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
 	struct dw_edma_desc *desc;
 	struct virt_dma_desc *vd;
 	unsigned long flags;
+	bool active;
 
 	spin_lock_irqsave(&chan->vc.lock, flags);
 	if (chan->status == EDMA_ST_PAUSE) {
@@ -704,20 +867,21 @@ static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
 		return;
 	}
 
+	if (!chan->non_ll)
+		dw_edma_ll_consume_progress(chan);
+
 	switch (chan->request) {
 	case EDMA_REQ_NONE:
 	case EDMA_REQ_PAUSE:
 		vd = vchan_next_desc(&chan->vc);
-		if (!vd)
-			break;
-
-		desc = vd2dw_edma_desc(vd);
-		if (desc->start_burst >= desc->nburst) {
-			dw_hdma_set_callback_result(vd, DMA_TRANS_NOERROR);
-			list_del(&vd->node);
-			vchan_cookie_complete(vd);
-			if (!chan->non_ll)
-				chan->ll_end = chan->ll_head;
+		if (vd && chan->non_ll) {
+			desc = vd2dw_edma_desc(vd);
+			if (desc->start_burst >= desc->nburst) {
+				dw_hdma_set_callback_result(vd,
+							    DMA_TRANS_NOERROR);
+				list_del(&vd->node);
+				vchan_cookie_complete(vd);
+			}
 		}
 
 		if (chan->request == EDMA_REQ_PAUSE) {
@@ -726,14 +890,15 @@ static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
 			break;
 		}
 
-		chan->status = dw_edma_start_transfer(chan) ? EDMA_ST_BUSY : EDMA_ST_IDLE;
+		active = false;
+		if (vd)
+			active = dw_edma_start_transfer(chan);
+		if (!chan->non_ll)
+			active = dw_edma_ll_pending(chan);
+		chan->status = active ? EDMA_ST_BUSY : EDMA_ST_IDLE;
 		break;
 
 	case EDMA_REQ_STOP:
-		vd = vchan_next_desc(&chan->vc);
-		if (!vd)
-			break;
-
 		dw_edma_terminate_all_descs(chan);
 		chan->request = EDMA_REQ_NONE;
 		chan->status = EDMA_ST_IDLE;
@@ -789,12 +954,34 @@ static void dw_edma_queue_irq_work(struct dw_edma_chan *chan,
 	queue_work(chan->dw->wq, &chan->irq_work);
 }
 
-static void dw_edma_done_interrupt_deferred(struct dw_edma_chan *chan)
+static void dw_edma_record_irq_idx(struct dw_edma_chan *chan, bool stopped)
+{
+	int idx;
+
+	guard(spinlock_irqsave)(&chan->vc.lock);
+
+	if (!chan->non_ll) {
+		idx = dw_edma_core_ll_cur_idx(chan);
+		if (idx >= 0) {
+			stopped = dw_edma_ll_irq_is_stopped(chan, stopped);
+			idx = dw_edma_ll_recycle_idx(chan, idx, stopped);
+			if (idx >= 0) {
+				chan->ll_irq_idx = idx;
+				chan->ll_irq_stopped = stopped;
+			}
+		}
+	}
+}
+
+static void dw_edma_done_interrupt_deferred(struct dw_edma_chan *chan,
+					    bool stopped)
 {
+	dw_edma_record_irq_idx(chan, stopped);
 	dw_edma_queue_irq_work(chan, DW_EDMA_IRQ_DONE);
 }
 
-static void dw_edma_abort_interrupt_deferred(struct dw_edma_chan *chan)
+static void dw_edma_abort_interrupt_deferred(struct dw_edma_chan *chan,
+					     bool stopped)
 {
 	dw_edma_queue_irq_work(chan, DW_EDMA_IRQ_ABORT);
 }
@@ -1033,6 +1220,7 @@ static int dw_edma_channel_setup(struct dw_edma *dw, u32 wr_alloc, u32 rd_alloc)
 		chan->request = EDMA_REQ_NONE;
 		chan->status = EDMA_ST_IDLE;
 		chan->irq_mode = dw_edma_get_default_irq_mode(chan);
+		dw_edma_ll_irq_idx_discard(chan);
 		INIT_WORK(&chan->irq_work, dw_edma_irq_work);
 		atomic_set(&chan->irq_pending, 0);
 
diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
index 8ed37e8a12cb..90dcbe415f57 100644
--- a/drivers/dma/dw-edma/dw-edma-core.h
+++ b/drivers/dma/dw-edma/dw-edma-core.h
@@ -72,24 +72,35 @@ struct dw_edma_chan {
 	u8				func_no;
 
 	/*
-	 * New LL entries are appended at ll_head. Entries between ll_end
-	 * and ll_head, modulo the LL ring, are owned by DMA; the rest are
-	 * owned by software.
+	 * New LL entries are appended at ll_head. Entries between ll_done and
+	 * ll_head, modulo the LL ring, are owned by DMA; the rest are available
+	 * to software.
 	 *
 	 *   software-owned      DMA-owned       software-owned
 	 * +---------------+-------------------+---------------+
 	 * ^               ^                   ^
-	 * 0             ll_end              ll_head
+	 * 0            ll_done             ll_head
 	 *
-	 * The link entry points back to the region start. ll_head == ll_end
-	 * means all entries are software-owned and previous DMA work is
-	 * done.
+	 * The link entry points back to the region start. No DMA-owned entries
+	 * remain once ll_done catches up with ll_head.
 	 *
 	 * Software always keeps at least one free entry, so the ring is
-	 * never completely DMA-owned.
+	 * never completely DMA-owned. That keeps a hardware-reported physical
+	 * LL index unique within the current ll_done..ll_head producer window.
 	 */
 	u32				ll_head;
-	u32				ll_end;
+	u32				ll_done;
+
+	/*
+	 * LL progress boundary sampled by the hard IRQ handler after clearing
+	 * the DONE/watermark status it accompanies. It is normalized to the
+	 * exclusive convention used by ll_done. The sample and all later
+	 * accesses are serialized by vc.lock; -1 means consumed or invalid.
+	 * ll_irq_stopped records whether the same event found the channel
+	 * stopped.
+	 */
+	int				ll_irq_idx;
+	bool				ll_irq_stopped;
 
 	u32				ll_max;		/* Data entries */
 	struct dw_edma_region		ll_region;	/* Linked list */
@@ -146,7 +157,7 @@ struct dw_edma {
 	const struct dw_edma_core_ops	*core;
 };
 
-typedef void (*dw_edma_handler_t)(struct dw_edma_chan *);
+typedef void (*dw_edma_handler_t)(struct dw_edma_chan *, bool);
 
 struct dw_edma_core_ops {
 	void (*off)(struct dw_edma *dw);
@@ -154,6 +165,7 @@ struct dw_edma_core_ops {
 	int (*ch_quiesce)(struct dw_edma_chan *chan);
 	u16 (*ch_count)(struct dw_edma *dw, enum dw_edma_dir dir);
 	enum dma_status (*ch_status)(struct dw_edma_chan *chan);
+	u32 (*ch_transfer_size)(struct dw_edma_chan *chan);
 	irqreturn_t (*handle_int)(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
 				  dw_edma_handler_t done, dw_edma_handler_t abort);
 	void (*non_ll_start)(struct dw_edma_chan *chan, struct dw_edma_burst *child);
diff --git a/drivers/dma/dw-edma/dw-edma-v0-core.c b/drivers/dma/dw-edma/dw-edma-v0-core.c
index 62141aa32e50..3b69fa26bf1c 100644
--- a/drivers/dma/dw-edma/dw-edma-v0-core.c
+++ b/drivers/dma/dw-edma/dw-edma-v0-core.c
@@ -318,6 +318,11 @@ static enum dma_status dw_edma_v0_core_ch_status(struct dw_edma_chan *chan)
 		return DMA_ERROR;
 }
 
+static u32 dw_edma_v0_core_ch_transfer_size(struct dw_edma_chan *chan)
+{
+	return GET_CH_32(chan->dw, chan->dir, chan->id, transfer_size);
+}
+
 static void dw_edma_v0_core_clear_done_int(struct dw_edma_chan *chan)
 {
 	struct dw_edma *dw = chan->dw;
@@ -375,7 +380,7 @@ dw_edma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
 			continue;
 
 		dw_edma_v0_core_clear_done_int(chan);
-		done(chan);
+		done(chan, false);
 
 		ret = IRQ_HANDLED;
 	}
@@ -389,7 +394,7 @@ dw_edma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
 			continue;
 
 		dw_edma_v0_core_clear_abort_int(chan);
-		abort(chan);
+		abort(chan, false);
 
 		ret = IRQ_HANDLED;
 	}
@@ -689,6 +694,7 @@ static const struct dw_edma_core_ops dw_edma_v0_core = {
 	.ch_quiesce = dw_edma_v0_core_ch_quiesce,
 	.ch_count = dw_edma_v0_core_ch_count,
 	.ch_status = dw_edma_v0_core_ch_status,
+	.ch_transfer_size = dw_edma_v0_core_ch_transfer_size,
 	.handle_int = dw_edma_v0_core_handle_int,
 	.ll_data = dw_edma_v0_core_ll_data,
 	.ll_link = dw_edma_v0_core_ll_link,
diff --git a/drivers/dma/dw-edma/dw-hdma-v0-core.c b/drivers/dma/dw-edma/dw-hdma-v0-core.c
index fb651a83f0f3..4440e3ebaeac 100644
--- a/drivers/dma/dw-edma/dw-hdma-v0-core.c
+++ b/drivers/dma/dw-edma/dw-hdma-v0-core.c
@@ -203,14 +203,14 @@ dw_hdma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
 		val = dw_hdma_v0_core_status_int(chan);
 		if (FIELD_GET(HDMA_V0_STOP_INT_MASK, val)) {
 			dw_hdma_v0_core_clear_done_int(chan);
-			done(chan);
+			done(chan, true);
 
 			ret = IRQ_HANDLED;
 		}
 
 		if (FIELD_GET(HDMA_V0_ABORT_INT_MASK, val)) {
 			dw_hdma_v0_core_clear_abort_int(chan);
-			abort(chan);
+			abort(chan, false);
 
 			ret = IRQ_HANDLED;
 		}
-- 
2.51.0

