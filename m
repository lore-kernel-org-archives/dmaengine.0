Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11020109.outbound.protection.outlook.com [52.101.228.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B639640961C;
	Thu, 23 Jul 2026 08:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784796125; cv=fail; b=QcFqzBI2tP7Q9FerJBbCRhdGTQSlzhKiNrJOjl2J3HE2yrB1HAVlBXjUB/BazqPL1XwBk92oBvBFZUa5brBSdYNn4TgnGNVmyeOJlnMvnF0JGLGINAilJ4ieSIvyWbYL4rB+wFoNMGfAcn+XyB7MejgyOlOqW7LYR8SDi4BHk1g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784796125; c=relaxed/simple;
	bh=EhUJPPeaX4+RtFHul7Mlc6SHSY6LS8yn2bh0SYx5sSY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ByxwceaMQPU8i3hNCkr0SnyQ5O78M1qsUFNkarIlwDVgiep6fTVwGJV6ia8nPWi/Fwn6/GZGrlP6272SmtTWT9ayV2+NEk3Q2AAAnBbUjydmph+mvjqn2u4M0UP/LGKcWZwOx0fIO/jUibw1+r1xFAz7SEJvUeHoW3OfYMnxe2Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=SyfeHiI/; arc=fail smtp.client-ip=52.101.228.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="SyfeHiI/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iv/QHQqgIqwI9YEKdpJNXSyzePaCg0TWfwjRCpmgf0+Z/vW7QDVwjveBc+PTqrIOnrZncqFAO64LwlLqTfFZmoWWX119HKxKe+jwW9J1YJpEnF5S2iUMmRyAjyI5r3FkO3xZQrR0MSiPcytMvjeSK3w5Op+3sO8c8Tl0xSqMzy8bDsCNnTSTm9ardeBSmWSab0ZAdeYm2rUHmMa/ZJFDozqjFO4yeGwiz5o0FafUxEC81Up+tg0RW8OU71+sIub0nBEkmMWbr2H5dUWwQIa5lQH4LpPLLB4f67+mF9aSvKtwzMMS3FGg7rtbpJXGmFQU6nyCcQIVvvRQGgMFthJAiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Brvsl9JFC1EwCnb7vX65jr7E88p7nQ3uGTEyxfnLxRU=;
 b=mwPs1cLM1HOhF0Uqrmprpo8yqkl1k+YPOuK93UTBvLqnCP8eBk97h2d+8p/KTgl6ubDJU1g2WXcFRodRVl9gPxfbtEK08Nk+VZntBEehNc+dysh4p0rvmxuuxiPL9Ks6exRYAVVd1lE8omInbqQr19gr1qX3ctsuMc3p31HyNUeTlv9FzIjnasJswuLoDGopz5yx5dj1m2Vgj+LNP64mXhZmRS4L6LNy5Pb/FG1LPwNp3fFiK3vru5bczzsWpXi0ZfRBfywgHA6EmuKBaL+AoVGPGvDUdGjpPRnsfKLiifec7rVj3rRvr135FH0v+cHKxvs12VNmKTujzsP3TYIVzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Brvsl9JFC1EwCnb7vX65jr7E88p7nQ3uGTEyxfnLxRU=;
 b=SyfeHiI/KwkRY6LYrRTKKKeMbxrUCVLSzjRsFJGsQ4G4kMWMxbaKU0KANVa4o3RJf3lnylBBVQL07TDtjhsRUKvxbryBl5tUifKOc27lggOGl1nn/uKx6BvRvArQTENgcByA864x+ITuwQs66ATsCV8O7FrRX4Sxmk1+QUdv/R0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYYP286MB1883.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:111::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 08:41:57 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 08:41:57 +0000
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
Subject: [PATCH v2 02/19] dmaengine: dw-edma: Add dw_edma_core_ll_clear() to clear LL control-word
Date: Thu, 23 Jul 2026 17:41:33 +0900
Message-ID: <20260723084150.521366-3-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260723084150.521366-1-den@valinux.co.jp>
References: <20260723084150.521366-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P286CA0004.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:26d::12) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYYP286MB1883:EE_
X-MS-Office365-Filtering-Correlation-Id: 23594bfd-b2f1-4978-5f31-08dee8964199
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|10070799003|366016|1800799024|921020|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	BuYFFnPLk6ejpiSgU29H6kiBegI4WjyrLbgUoWxO5vqluVcg/49o21b2gf2q7TvXJiAKOgsqAonqEL8jw55k1TBnkRGaO2fbw0Eh7Sc69BkmjTuH7Kuw+CM0N7i5vVRSVaQYcc/8SEE/KwvzZdRvTkKbxl9h+jUBuU5EIjj991TTlcFES6PrNIZJ+3OW46P+S3sxRQpfNEUQzP/Wqp4BTA+NyuxBwU4okXC4ePVhMNEd6XDN27rhZM7XiidDGKcJQ/GI6ghvk9SwBrmT8Lb/N5h+9Qy5QjfZYa35czXnjZVdDP2kbOzNN4zIEwkM2GrQ+arbrZ0ptnmkaua8K0XCDr8sOErGaT8gY8kp1xy/kTqVv2UZbYJ/R79B5UNwzFi0ZDUcT/bR1DpduOe9K36WImEPxgXntipk/HNu7DEVr8IfGLAFur37dK+X0pRKJO1lGNIa5kv7ZDkm7dGZ0Tskkc5mtcGt9ye3CuFwGCE8s3LADCxd7CXX5QnNJJVpWtrWJ44C2tofcUrEMkAd2tK7tzhHb4fOpYJ02PZzRvgTu3TeaTIidZjGyvwM2rVIKXHGGVrlH0oZTfnLKhXxkFqnWrJuzT/Oakub88V12aXcOKB7L5WCEO6sv+vjUIl++0KXjwYrp1VH0MrfP09nFdRPNDShJF7cASpbrbV9+3suxgAWeu/bwJLVv+0gSfwBQunLsQehU9Xfr4mt8L8HUhuW8w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(10070799003)(366016)(1800799024)(921020)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FW9Jjo4ClzC3b7LAsmahU8KmLdd8IuBlp7SwaP4pqQc4yIS7CdxvWInVVib1?=
 =?us-ascii?Q?E6J3bidWCiqrc0/ltT8Hy4lcNkDcWOORGOhyiuURD6rICxwGk5JlEiQjMvET?=
 =?us-ascii?Q?9odj3XzpgGBepNyAbdOnhPie1jJubD6K9uBiBuhJj5sML7u4o+VR8EHsGW6b?=
 =?us-ascii?Q?D9kt65oom+BveG5jnyTRXJlbBWj3yVzgLs1qVrYpgOImstcNIISFlUD5DiBf?=
 =?us-ascii?Q?PeXYwsj2BW9WEaN1/+f9gVgYZ06j33Ypx0Uw+1xe4gk7D3CuMSVmCo8gw8Qh?=
 =?us-ascii?Q?6/TYxunyebWLzyZ8sEN1S8CFWQ+uT6Jl3hPI/WSY+4RvA48Wza0XQHKPsDmb?=
 =?us-ascii?Q?rJ6OoOOdMck+85/8uEkvKbANEwTtTepsa4LllbvOE7w6pctp+lgP3OntDmPF?=
 =?us-ascii?Q?r/TtB7hFAYeP1/w0IkFpGOSshEnkljIQ/XvGJMRSZbd9sMZSpzcFCNgh0Jgj?=
 =?us-ascii?Q?R2mzyR2D1kIf1CtCSIj/Tq/CxnK7TXuy8o8NlF5KrBbY5M1mvCw43nmG1/iV?=
 =?us-ascii?Q?x4psyUInfMRD/DOsLAWuhjLXb2l81Y2eJil6JO+5igO1dTRufr8bERo1GIdf?=
 =?us-ascii?Q?BpWxohJfOiFTUxHZRChRB+0hOmmzubXr256P/8n7fU1FkNUZiOKJAicHVvOM?=
 =?us-ascii?Q?xNFVIgJzTJMgkHHetQvupntMDk7mk7kWX//YIx857TNQUszp/wGng29XT1wf?=
 =?us-ascii?Q?Q4T3+WE57eg2Q242xGGsfXndQTPjwm8ypf9BRU923GboAta+hMsbDAeLJlJX?=
 =?us-ascii?Q?FC2jIzmdhTrbYiYIIeuV9ltxMRWQlHFIc87MxHhMhxYzfASh/fFZDvibDRuJ?=
 =?us-ascii?Q?+yE3dgROegfsFhpZIBtTnwP8Y65LF0P8TIctbUlzla+YU1C8bG6JWQckNc+I?=
 =?us-ascii?Q?UXQd8z4j2Fr/mZnEJCYPoUlBlPB3fUhvmotG8LKoids2QCj2gU+nOElTv/jW?=
 =?us-ascii?Q?6p7G8pALllUwZu7JpckzRNBFjAZ7asDNZrN9WXdlW1WHHCOgjhphZ+XzjeOK?=
 =?us-ascii?Q?VTc77+9BbCDWRTXiMYxO6qT7GVvNf+6kpJKo0Ux5zCn5DtfRtOm2+zjWMzr2?=
 =?us-ascii?Q?akYDVAs8a6+wEvmDGJSVK9B7hQQPgn5t6WtVmozOuc6SAUx4JrmOgmjxwu8L?=
 =?us-ascii?Q?ZZ8zz95ZHm/dBWEmN2JVDHhsFOXuCWxDw6hkNIpgbVisOoVE5pw4zWtBP4+4?=
 =?us-ascii?Q?hSgF22pUsoK6toIijWUtOk7kRltSTLMw4vINtTmv66mDIa+81gXHdo2DUN10?=
 =?us-ascii?Q?XI2LaNTj7t8cwJksJe21aujf9bqjSwCLqGPtkPgA26F4FZfrD6B2Jwp2uNBm?=
 =?us-ascii?Q?pJkwmoF3qFL687v4Sga0qdch0BbVMQLJSmX0irq4JO+CKBo1C3ZOnOp6W/KM?=
 =?us-ascii?Q?HiWqSwT10HgA7jLLsfI0/tILFiSZ0i9QSUjKbQayvlLrMO40mAiK7XAGqH7t?=
 =?us-ascii?Q?vINBqyi5wxwUS8rJ05eTWBY90yJmf3rP4xAbs8ZuqFMRe572nGslYIezO/Ne?=
 =?us-ascii?Q?1/DwH8ztjaOb/6D5AmGWI7omreaJSwlt0refAb3K0uL4oDaB9AZiaOPKhsye?=
 =?us-ascii?Q?GgqqOYUOoFGU6uG3Bv6OYet8tOi5nSLnhJph+GtsYtUeoY7BCs7sDFr21Bjn?=
 =?us-ascii?Q?J4mRBJwi9wsIn/HnDH/zBUx/jP4oPvMhZiDXzc4JQ6SrprbhVpXNSTZ9ebJx?=
 =?us-ascii?Q?koDy60/m//TFNnxsjtEUUyd7BkplPP0LIRzf5/i/qKNcjazWsoofqfWKvs4x?=
 =?us-ascii?Q?UpXuRTwXIRetn1vFN2RP8eJdJlGNTmMaEwQGO5Y3ru1g2PfAjNdX?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 23594bfd-b2f1-4978-5f31-08dee8964199
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 08:41:57.7252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DUOBSBy4dXHTOl3tbL9mRPXoKNc+W5yg1b1o65Ro/Oz3UrT9Jzx7SYblARYkvHVYVOlgrQjynYzR/RaKcnJvNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB1883

Add a core operation for clearing the control word of one linked-list
entry. A later patch uses the operation to invalidate stale CB when
resetting a circular LL ring.

No functional change.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v2:
  - Split the provider operation from "Clear LL data entries on reset".

 drivers/dma/dw-edma/dw-edma-core.h    |  6 ++++++
 drivers/dma/dw-edma/dw-edma-v0-core.c | 16 ++++++++++++++++
 drivers/dma/dw-edma/dw-hdma-v0-core.c | 16 ++++++++++++++++
 3 files changed, 38 insertions(+)

diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
index e50fa7965778..089f913fd247 100644
--- a/drivers/dma/dw-edma/dw-edma-core.h
+++ b/drivers/dma/dw-edma/dw-edma-core.h
@@ -138,6 +138,7 @@ struct dw_edma_core_ops {
 	void (*ll_data)(struct dw_edma_chan *chan, struct dw_edma_burst *burst,
 			u32 idx, bool cb, bool irq);
 	void (*ll_link)(struct dw_edma_chan *chan, u32 idx, bool cb, u64 addr);
+	void (*ll_clear)(struct dw_edma_chan *chan, u32 idx);
 	int (*ll_cur_idx)(struct dw_edma_chan *chan);
 	void (*ch_doorbell)(struct dw_edma_chan *chan);
 	void (*ch_enable)(struct dw_edma_chan *chan);
@@ -255,6 +256,11 @@ dw_edma_core_ll_link(struct dw_edma_chan *chan, u32 idx, bool cb, u64 addr)
 	chan->dw->core->ll_link(chan, idx, cb, addr);
 }
 
+static inline void dw_edma_core_ll_clear(struct dw_edma_chan *chan, u32 idx)
+{
+	chan->dw->core->ll_clear(chan, idx);
+}
+
 static inline void dw_edma_core_ch_doorbell(struct dw_edma_chan *chan)
 {
 	chan->dw->core->ch_doorbell(chan);
diff --git a/drivers/dma/dw-edma/dw-edma-v0-core.c b/drivers/dma/dw-edma/dw-edma-v0-core.c
index ba84811234e1..c31fff095b4f 100644
--- a/drivers/dma/dw-edma/dw-edma-v0-core.c
+++ b/drivers/dma/dw-edma/dw-edma-v0-core.c
@@ -605,6 +605,21 @@ dw_edma_v0_core_ll_link(struct dw_edma_chan *chan, u32 idx, bool cb, u64 addr)
 	dw_edma_v0_write_ll_link(chan, idx, control, addr);
 }
 
+static void dw_edma_v0_core_ll_clear(struct dw_edma_chan *chan, u32 idx)
+{
+	ptrdiff_t ofs = idx * sizeof(struct dw_edma_v0_lli);
+
+	if (chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL) {
+		struct dw_edma_v0_lli *lli = chan->ll_region.vaddr.mem + ofs;
+
+		lli->control = 0;
+	} else {
+		struct dw_edma_v0_lli __iomem *lli = chan->ll_region.vaddr.io + ofs;
+
+		writel(0, &lli->control);
+	}
+}
+
 static void dw_edma_v0_core_ch_doorbell(struct dw_edma_chan *chan)
 {
 	struct dw_edma *dw = chan->dw;
@@ -668,6 +683,7 @@ static const struct dw_edma_core_ops dw_edma_v0_core = {
 	.handle_int = dw_edma_v0_core_handle_int,
 	.ll_data = dw_edma_v0_core_ll_data,
 	.ll_link = dw_edma_v0_core_ll_link,
+	.ll_clear = dw_edma_v0_core_ll_clear,
 	.ll_cur_idx = dw_edma_v0_core_ll_cur_idx,
 	.ch_doorbell = dw_edma_v0_core_ch_doorbell,
 	.ch_enable = dw_edma_v0_core_ch_enable,
diff --git a/drivers/dma/dw-edma/dw-hdma-v0-core.c b/drivers/dma/dw-edma/dw-hdma-v0-core.c
index 2fc7f8e85b43..b2d35f0b7b6d 100644
--- a/drivers/dma/dw-edma/dw-hdma-v0-core.c
+++ b/drivers/dma/dw-edma/dw-hdma-v0-core.c
@@ -374,6 +374,21 @@ dw_hdma_v0_core_ll_link(struct dw_edma_chan *chan, u32 idx, bool cb, u64 addr)
 	dw_hdma_v0_write_ll_link(chan, idx, control, addr);
 }
 
+static void dw_hdma_v0_core_ll_clear(struct dw_edma_chan *chan, u32 idx)
+{
+	ptrdiff_t ofs = idx * sizeof(struct dw_hdma_v0_lli);
+
+	if (chan->dw->chip->flags & DW_EDMA_CHIP_LOCAL) {
+		struct dw_hdma_v0_lli *lli = chan->ll_region.vaddr.mem + ofs;
+
+		lli->control = 0;
+	} else {
+		struct dw_hdma_v0_lli __iomem *lli = chan->ll_region.vaddr.io + ofs;
+
+		writel(0, &lli->control);
+	}
+}
+
 static void dw_hdma_v0_core_ch_doorbell(struct dw_edma_chan *chan)
 {
 	struct dw_edma *dw = chan->dw;
@@ -424,6 +439,7 @@ static const struct dw_edma_core_ops dw_hdma_v0_core = {
 	.non_ll_start = dw_hdma_v0_core_non_ll_start,
 	.ll_data = dw_hdma_v0_core_ll_data,
 	.ll_link = dw_hdma_v0_core_ll_link,
+	.ll_clear = dw_hdma_v0_core_ll_clear,
 	.ll_cur_idx = dw_hdma_v0_core_ll_cur_idx,
 	.ch_doorbell = dw_hdma_v0_core_ch_doorbell,
 	.ch_enable = dw_hdma_v0_core_ch_enable,
-- 
2.51.0

