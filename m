Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021110.outbound.protection.outlook.com [40.107.74.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A268142CB1A;
	Mon, 27 Jul 2026 17:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785171834; cv=fail; b=X4EdnpF4xU9c4E9t7ZJGCuvu9w/QcrVsUiugcFSn1cIXOl7ybfa5zNRV3FLS48Z5RQjjo9UGSzgG4krW/LgMG9Wd8+fUrZSC5n3PerlpiqUVfiJXUnvM/k1bQEwLOB4TxHnakxWuT/lyWCbkP0fLMlz9HceEHQwDL1aX8qgoq08=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785171834; c=relaxed/simple;
	bh=UJ335Y4aACQRxxwf3Ej+hahfAmnCxJqpEdHNJ60WzzU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qlxqY70WSXBy2NO5cQ4wcffau/ppq+4+kHzx8syY7vaOv4twfFD2s6ViH/zlRnlHGS7I7hyvmLln+VvptFj+XMnhhufe2QIMR37Ax5eFzby7M+7fkZkCxsvEc0SHCK3XTFEkkHDD7d2pvvJPizlzcDZUV0LGE6UFcTiAH7sEdHg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=qgbuiMkI; arc=fail smtp.client-ip=40.107.74.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="qgbuiMkI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rzO83Fk8J2unQhk1QHycDqdKoAW8l7XQGZVf27C/4EqRtr5j3lI/bN1YKJt5NWbXgn3ORQI2DKBLCGomqnfcv8FX0z6LyuN2gMKy6fgV/HIbBlTNxJ+XchvRUTPBQL5lrfhw+66B/7WxZhHTY3F2O/yl8rVl5xlQ6+/2aMReHSqynndLUHU5j3pCGzgL6noX8FeZ8GWe0iPUZ/CpYz4E2Sp22MXaiuR1/bpJ2hy6EmWyfQzfKPAPM5w8CWmknvvqYjg+BoOjICFvh1QLkJ/+SnJduOR6BY4wjx26Zd5XD+t55tgJMG/uF9WsKfpv6v+fmIy67JLve5LuaPQNCEIj/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=txdF+kkZPZZDMPl2nnrTTvxlOo70VkyYpMUb/TCMnts=;
 b=fqgBo4F2aYX8X5J9Gaz7SDcFtUC0aRCsUkmi4ZTFRmx1sDuWXe/luegsZUYWUeon+OzEtmmaJPXYXiEGvWOZLREPQfzHedxeWChWvdAAMlGZdo7lXKbat3FC3AEs3aW58fCIzjLFJoOicP2sd5NESW9YifRq6JYvy1TqOCjnUjc/SNUPd/DVUv2hO538/rebkSVMwltW8pCLuBz6BBZ088A4QCA+PZPkh76fNX8Ogd6xSv8I0UvrASqOwD4XUQy0+PfxsCQbcguToNA8bLoppZGZ8VnqXiE+dtzzmbxpajM4VzcPHZVm4AwFew9GlzTGbBbN9C6fAepzJ8f+4PiysA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=txdF+kkZPZZDMPl2nnrTTvxlOo70VkyYpMUb/TCMnts=;
 b=qgbuiMkIIg9n0tbWFhw4zlw00R8Wqerb9szVvWkthFYvwJsY1LnxDDlROqlf1p3nSTwCtE7arcbQbxFa4ds0A/YsqWNVreAj7Hq/AonMhAl+jNqytD42GaQIl/fnHLD89M75RHdQNdDlstPy3cFBTaCkOOD1/bgoMcFI1v9+PpI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TY7P286MB6515.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:31d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 17:03:46 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 17:03:46 +0000
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
Subject: [PATCH v3 18/24] dmaengine: dw-edma: Make the LL ring reset a full channel resync
Date: Tue, 28 Jul 2026 02:03:17 +0900
Message-ID: <20260727170323.2321369-19-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260727170323.2321369-1-den@valinux.co.jp>
References: <20260727170323.2321369-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0293.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::11) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TY7P286MB6515:EE_
X-MS-Office365-Filtering-Correlation-Id: 05ba5b51-d17e-4c22-da4b-08deec010551
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|10070799003|7416014|376014|921020|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	CFrAtKS47sugqg2BGfDbtDv3GwuFW5DMae0SbKqkIzc1i+5sUgTEbilqmkuDkOy90Vxvv/gW5si5y49L7OE79JOyLEcxYXOVFX2tUFdzCMaE1TZcHj0TKVjLax/HhLqeAlQQou8GkNAwAVpN4hN4GnSvPYQaEGylF6UJT45ORN1hXK4r9LtS22ItQcRDs/gE+RKDc53HCse964iO/zrwUpEEYU7/j4M71hESTHdojbNG/pDLWxb+MHKqhXGTYl27AaxO6A8ZPlh4ZpszxzaPLFM+vlfm2gLkK3Hs4fECou5PsnepMYtHzXpLLw0W9kWuqEYpRNE14qjdD3oQriktpJzNVK7ge+ZC723X7U7hcVVvzVTrxSQFUe3dsijUIAJCmWhf010Me+n8aLwQzMnAteJ4QyqyfxaQ7K7hn9IWJgqJQipAEpctFoIOP4XwQ5uCU1kXHmdmtTDFu3GwI7m80uSzSj3xGDUHiuzt7LEzjdgTb6qGLh30KJGph7Ppy4LnTWEGK06f8c16S2ETuyIhOXKvrus+gNM16mUsZg67ySwQMmGlAK94y8cNbCBCid11/fUzyK6cUJVu5bFUIZxmesguJ+IoxJNosHhrsf2za1TqHG3Oj8jq2M7A1IRgzBxTEJuT6i67PvvLatwGwBf9ufAmVjCSxDhvxqIRscSoP/ycZykQsy7xP8ZC4BpCbWfid6MP3UvRCc3Jm5tu6kDLUw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(10070799003)(7416014)(376014)(921020)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VM5OQkrG9jqY8GD1B1S1El+4utm9UytYpPjq3dcUnz63BbTK7RxQJ12QtRZ+?=
 =?us-ascii?Q?rvw5uT3tVlFW2y4HatREXwhb8ZS2TshBz4IYb0pd2xYAUAA6Pnb97VC4xeRN?=
 =?us-ascii?Q?HgNSlrHT6cBnRO+gJT8KEgGWgVJwdl0o1Ve7seTA7D0MsY6vXgPR+j2kgCa4?=
 =?us-ascii?Q?NB8oP98+r2M0epMnYyJqQ9IiLGt/4Aq8kQigD7EICbdoW+6pKbvdRF/hXkXB?=
 =?us-ascii?Q?0HndER7unKWnvsOUFOFBfkMGtwwWfU1iX0tzXinR+UgXApnsWupdwb1j7uJ1?=
 =?us-ascii?Q?wSRryloVyhhRUh8R3OPY5HaChPRFnPy8yE9UNpK5sYn3hCc9BEjJTuvABwfq?=
 =?us-ascii?Q?Md5xVxndb7SeXr3Be1rD/7ivKB/MAx6kdnUXhe5I5N1hZfBiNNpct5ytuZbG?=
 =?us-ascii?Q?ZxcEDXdD1Gcn+amBA/ZI5oSIDFF5uiub0clFz/7F1dGPnsETHVJT398n7fIt?=
 =?us-ascii?Q?bca4qTEu4vFczTrixPuHm8emV7B6AAc7qR5QGCFlZ7UKLge0vrwVGsR7kCHS?=
 =?us-ascii?Q?dVLGQ+OZNtTwyIlHiaME4rLDSWxiq+mlZyF3Syr7em9b0Ef0JradkGF13t12?=
 =?us-ascii?Q?N9Rhhkt98Z2VXetKMZvepK8oWITXFau0rX8FFgDsZ5KBEe/KX67JqDKzrwqL?=
 =?us-ascii?Q?2Coe6DPEC6g8Q6dE0lUmI9uY0jLEyl6h+PCi+rZ7+fhkL2/sC67bFynLkEla?=
 =?us-ascii?Q?mIlUCjzSvAgG4PM69tQ+Q8KqZRk8+PssM7zk1Xl+9nl/aHWmwVKrVXfd5mH8?=
 =?us-ascii?Q?TOzpNhtHHwZ9ybbhz3JUmF7deAAxg4CSlLigTPYwpp9Mgc1mh00o2ojfegL6?=
 =?us-ascii?Q?b6JMYAbDffY3NoRD2sGZV/IpQ8+h4s4/eac0n1l6SxTq26DsAH4LAzkCrnUD?=
 =?us-ascii?Q?4j8loIWA5uaoHqZqZT0un2WXMDlHTld51vZ3TSko4IcxZlKbgN7/GTAkMtWZ?=
 =?us-ascii?Q?2SG7yo1HKIecWQgENbkZgmANNAoPbkvSSgKlJKbxM563F1+yEXTIRr86NOMs?=
 =?us-ascii?Q?WTNb7UZuR2C4QWREtRCotjpiSBjW1aaItDyehm4kuncW7E/KTIiHu0AG9BwE?=
 =?us-ascii?Q?ck/jjHfj5iKpiSyyZ8yW73ViCvcso5DA8BKQd9/dwRB/AYHxf/IMQMLMawKh?=
 =?us-ascii?Q?v1kBOuA2ohgvMzP50iajszCXHumjHXe4dc6uOf3rS222E4dy+cYdzrLo9YX1?=
 =?us-ascii?Q?N8uOo24uvuKQilKSFC33tfAw6CutXpUMtH6/J2MFQMSpWPnKlwPGwVUbanj3?=
 =?us-ascii?Q?EBTkgwV7woBmYvDsUB9UrRoyH/hqaT+BpPvoKYGyPLpmOQ/xklcsAATFc732?=
 =?us-ascii?Q?meP9IT3zOuEQA3wFNvAck4PXBugLXtBmDGl2RRNAgC1l440TOXFi2QEX0xB9?=
 =?us-ascii?Q?5KCHbekqytb36o+gaDcL5Vh2QUGHtLKZ7P3eSEYeY3yc8Njm4yBZcVeHINAU?=
 =?us-ascii?Q?/QZSq9QK8FXg2h6SyxYxpGagvwwGw6ui2010PF/gmW13dJmeNE+xl6JaDniS?=
 =?us-ascii?Q?PQNNWtpy8gtZxGwu+HVLD5jLxDxuRLGP3G6/LinhuWUFNULriwH3nfy9M9rX?=
 =?us-ascii?Q?jDj2loP8+Z6X9o0JjYUs8XdvPfYCzibivJ5Pxyq8avU9m2v28Z/EkOmq0o5d?=
 =?us-ascii?Q?hUF4p70s09j2vjn5AUY39TRpsYhbje1Z1o2Fxqi2kDHTIYuR7QBPxKayrqtg?=
 =?us-ascii?Q?cnZnaiPf0nbXOOaqCBqakjUS8/s1E1DjsOwCIMjysUjh12c5upauR1m6gGIF?=
 =?us-ascii?Q?FZQH1aMdEOkdbAz/SE3keRQI9+VfBzbXMPBHjYGXV1fRyZpunFuh?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 05ba5b51-d17e-4c22-da4b-08deec010551
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 17:03:46.2118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yGtAHPtUzV0JDu8p9LlGUmJdB5lnqw8UxA8SECAmmhW7MKbCsyVhhrA+xe2LsyZCLopXthtoWDk0vGwMa3AKIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7P286MB6515

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
Changes in v3:
  - Reset before looking up the next issued descriptor. (Sashiko)
  - Cancel any pending stopped-tail recheck before replacing the ring
    state. (Sashiko)

 drivers/dma/dw-edma/dw-edma-core.c | 32 ++++++++++++++++++++++++------
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index fc8bea495aac..0c30c0f51fea 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -213,10 +213,29 @@ static void dw_hdma_set_callback_result(struct virt_dma_desc *vd,
 
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
@@ -364,6 +383,13 @@ static int dw_edma_start_transfer(struct dw_edma_chan *chan)
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
@@ -382,12 +408,6 @@ static int dw_edma_start_transfer(struct dw_edma_chan *chan)
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

