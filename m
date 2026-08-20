Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020105.outbound.protection.outlook.com [52.101.229.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7378546D091;
	Thu, 20 Aug 2026 17:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787247291; cv=fail; b=tfmLoWhVv0pUQCaBWmQ58qAxjyCfJQ2pBzA0fopxjnaJm80Fu/nsYnBg0fGvLGYK9ve1gFbgHNxDIbzlA0LV/OPMqDWUAtcPtVcHSJQjJ5KQEp9lkP8FioRZdbIRQMwlXJ2dMkPd0BWy0ooWk6tga0HSjzxdpkYi2iRzI9LoQ+o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787247291; c=relaxed/simple;
	bh=Zu6BWp8aV4YcIku8KmpfxkcP+gGQcB37UFBIMvTMyzI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JsmMpZ44rzY3XhhCj6z6Yq4d6AnTnk2+cRQjBCXr2pPvVh7wPegEiVmHmrZhoG5mm97uGgFkbUUQaeO0LSK68bbJABvHepLqwvbzpKaU3+N7Kj8qJbNkDcaFFkXULnfCXYQ9Fn0ue4WhMm5QqpFFcFZiEJBV9yl8yViiLv2hW34=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=AlZvLXqp; arc=fail smtp.client-ip=52.101.229.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="AlZvLXqp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fiT/1nbxFqhs0mZ0XDWUX2PPBwGBj1VVb3L1mywHdvjgc6jrmLbNE5pz7qgC++8yekNLYP8Aa+zAvfE5yTBVnBtnx+HvYMvWta2x5iYGgy1+XyIAe8ie81LDvubybhk183eH5QOjrOhYKtDo3O7sutD+7vV3PMxvcv424hzZFzGEbnAx36FS+fXQrKtAEPePnwA53k+1PUTX4UPVeiX4RbY5u4xMKr+/g8tnc9p/0GCkgc8vDe140cNjN9hSZWQC1DhkP4F2r6qvy+mQfD6spUVR+lk4UyXabTcxYmzmqObAcMb/o1TA1mM13HT5TOhNzzBFtRwff/pMbqOnc3ZO9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pTjjTODRpRsI9h+ROY4KJL6TCN/qascToAqqhL4JrpE=;
 b=jmRFz+Vosa+bjK1NKbWtlDkBWKXSVISbMigtM2UlhcmjETtCn5SAHR6mrygoxuOUdYe7n7ztqVnnbiUA3iW9ERNIYJwgMBcTNX90OEO6OXJhQlMVMC0v0hykVFtlttFxmz8CP2MPLI76QqpfsFrXXsTQ/8zxy0yzktIh6sM5pjZZyvZYD/jVOpwOzwpBfJFLJ20ucsC28xHX6il8ZfQw0uXYEWI2TjdDIk9hsALdhZpqYKHUIfwWT4uQugp7vqjOf3JuMPCDlKCfxpcIEqHteFl3Ygoik3TfIbT1wJkkhkBhGCKOl0OwBCKC12iN4QOqqogDSiTffCyOuXMR5dky2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pTjjTODRpRsI9h+ROY4KJL6TCN/qascToAqqhL4JrpE=;
 b=AlZvLXqpnuTKemoPcQg7gLQjWtJgu7jtnqeFReoXH3w+DhI40oq8JPp9L45W7/ycOU+bpYEOyn7+eLDLkAB8gBoexli67dFzV9QU7YVMGmUlSxuQ70G1ot6fKXTguCdaIrCGn9yu73B7dKt9/AuZhQMIYR21EDoqwDMy9EzJD0w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OS7P286MB7644.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:461::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 17:34:44 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0339.007; Thu, 20 Aug 2026
 17:34:44 +0000
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
Subject: [PATCH v6 01/10] dmaengine: dw-edma: Add dw_edma_core_ll_cur_idx() to get current LL entry index
Date: Fri, 21 Aug 2026 02:34:30 +0900
Message-ID: <20260820173439.2004068-2-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260820173439.2004068-1-den@valinux.co.jp>
References: <20260820173439.2004068-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWP286CA0002.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::17) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OS7P286MB7644:EE_
X-MS-Office365-Filtering-Correlation-Id: e5f0b4a6-850c-40de-1db3-08defee152aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|7416014|376014|23010399003|1800799024|366016|921020|6133799003|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	eEbQ1UZ82eTupsg4Q3GerpPKkhfTaeYcxE2elNUCDORaU3+S0YtWfEaWXZIUcIpLyRuOwxxqIH+Y+BWFwzWFYo/REzFs4dwcmVACjZV8wcODh2XvRWMfAGGSztbcQpShmbY3eZMD4YRIKwsE579/J3qTyWHjy3KgVddKtfogwt4w2cabbG0IR3rCAbpoBbfdMhsZtJfcdRT/+e96tQnB37jNHf9ECos49Qt9Yc9i20RLypZHjU3yjFzWyb8p2wJ7detMwnF/WXBhvViuJsPese8++aFRusqR9tVAuvJs1/m+0E2ndSlDX3coGrNgQxflpEW7dBnOZc4GVtEvdWmg4rhZ6maNscy63r+MyKeTJinyWETgyQGo6sEGifl66hPx+lfPgDCI4T958i1qxL5grU5q60cw4FoGrmV47Lk9jmt2BVM1CnAJQCKUKx3sIR2cbBXi627weaJGsVyQDGfRczjn/PQ7pu4fkeN+3UV9G+UDRz4LhRV5wScOqJhMgc7XTdMtBmuiJvGwqTLEezeGX7482bNulaNFEUYMShL0MPxchlQz1cFJuqTEQOa3opLG6cRvkLozGbeXHoHY6Ig7WMX/byU8/d8oQU2p1kiaSCRa33SC9TQjBZCscot2XcCVt2mP8KuzqLlE8VTkAXZQ/jBguFIy+i2V1bTnymMprdU7c2gxIEeTST9wjBt/ROobvr+miUrlDAruTT77zA8TAg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(23010399003)(1800799024)(366016)(921020)(6133799003)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VpuG0BJcrXZ5os89ROsJQidwUIPA13oAooJCGJQBzXzM98wzL7fUNeWbUnDg?=
 =?us-ascii?Q?PEEjyNTClVXbyB6MU0QGpKXS1S+cy4/NIOeHpr1j+JxJlkQz+xvdx8uoG+z4?=
 =?us-ascii?Q?PT3U8OiL6nZum5A63itXCMPvqwnDCr/9SujZFHNd0PFKo/xJkQfczEEFgPs0?=
 =?us-ascii?Q?jZB0hZqSqc/vJjiSroWzyCHypeF4kaLAusvttcRAtvw7Cn3aM4dHw4jtmYLK?=
 =?us-ascii?Q?6Y/5x5zYU7ItBhR9xCGn6g7stjHAOlLXt3DqZkKAPxl27rxoxqkD27gg/qeg?=
 =?us-ascii?Q?gZjDcE1N2+To0/w/BuXIW0Ej0HimIWd1/BhrS+4+q0729DoEdzUP7Xv12BmP?=
 =?us-ascii?Q?23mK8qujeHSOSe6+braSE6peOmAzSbiqhk2yzGILnViha6R4H99QHNGpXsny?=
 =?us-ascii?Q?9wzhDHQ1KlQPH85YIblGKAEzAQkrBMnwfIbouBcEvbr48kUajLKeBt+AvxPs?=
 =?us-ascii?Q?v03NzGP2MezDEfAGvqfIHswTt0U0xl9tbOSTG+4UMonJLiNks2s3Adt3Nsw7?=
 =?us-ascii?Q?DIyGrTUrMB3F/151hOgn6wzT8nZZGnQ5tamQBBrYLur5rwjqJwql4r02U1e5?=
 =?us-ascii?Q?8QkgkCQXdTRlwIguX20+j1hIk/Nh0RI2ANIfDfmjdZGqyP0mxIu+4FnTJ405?=
 =?us-ascii?Q?01snDX2WX1ZkyFHNJDdMN38kxuHBz5hBecTC7i352/bEBZDZHHEmWpl2aot5?=
 =?us-ascii?Q?+rjxJpi3yCDYbyW9VS2Sy8yQt/G1JHQ9B+2rmLW2/R/6qfZUXJ9d6Kys9ddt?=
 =?us-ascii?Q?XtiQ95eHLVZH12PH3IqaZdkEQUukNFQ8otEv1V9n8HScdUBVnKw/nb49L+5+?=
 =?us-ascii?Q?xSD2CvnbI0l+GuAABfX7+E6oHzbwuSXJlPBQmBlJqDQO9SkAPnZQYyNxLC8b?=
 =?us-ascii?Q?QZAgeo6UtuiVLCXuFFO6ixTsvE7jrgHKtk6DNNmUZYnmm17BHr5y0eDBhSwS?=
 =?us-ascii?Q?WbWklxdSFiNEapZaPvR80hG3zGjRQGOkpWnvCe735a80lADBEOhJpgJLnJ03?=
 =?us-ascii?Q?sSC7rGlU2ypVd4xcTxrUX9yUDjHHChI8lPYd/JC67pEhteL6BGRyHD+BU5wg?=
 =?us-ascii?Q?c7f5sO41L6qf9rfWQFflCO0SiqiYa6vmbFVHQU6JrkxZv3UmEFgWMGMvHLYD?=
 =?us-ascii?Q?n+/JUkSPdjXkKiNPY/iYmT8opz7BU/7bZeJ8TrMPC5EB+BHJwZ32IHkZFS2Y?=
 =?us-ascii?Q?Yd3gI3S03Xg4I0zB2aUChV02AiYPtBNLz0pjP19hOzRDSpADLJsE/+v26ZJd?=
 =?us-ascii?Q?LHMGRKoOsGL9dr99Bt7+RalOpKTo64BW/SCEK00wHWwDeZidEp48f3in5aNP?=
 =?us-ascii?Q?IIw1ALZ+4oYy/b9SngRT89fekwEFHZK4T7JtBMOC5gcP9dGRQBWWFqdZ86rs?=
 =?us-ascii?Q?jezHb+51+Q3w7/8ald5d0sj8zgA24F6Gjqw/3zSOdfHdkoTpcKXwBAzFvzUh?=
 =?us-ascii?Q?vdNY2a3sVTjnCJodSo+TzYDq6e//2eNdXCUsy3QvRv2MxtQZeKq30hNboSm0?=
 =?us-ascii?Q?uFxmeBCtW85FfEZCu8fhYuRzDBhG1u3lZpCpiVneTy22yHZTB5leILdRcp+0?=
 =?us-ascii?Q?NhNFBBFoiYTOjfMWzY1cw+xfJO+mdvVt+WFI7dVJJJuCllTYwUFUCLPvH7e6?=
 =?us-ascii?Q?PWnDIRFZxVeaRqaaTwAbqSqyXnA+R1UemKtjlIWG/diomxlxovmg6uzXGtib?=
 =?us-ascii?Q?d5bwacAaq3WGe6QyCvf8UBoCp7su7/gpl2TNhiIo/V8HPlVfjWc8G2WopIxw?=
 =?us-ascii?Q?YTYCLJ9nvggp8T4K8nDQ8RdGHI3jdeH11qhn1F6yNkHWdFpaRh6n?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: e5f0b4a6-850c-40de-1db3-08defee152aa
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 17:34:44.1683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hVmEaDeS73AhoYzmz5jxofTiHh0q279MhdeFD/OomCjX82MQOlYomaEqNt4jK92w1d6ext0oL/nVE3kwU5xj4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB7644

From: Frank Li <Frank.Li@nxp.com>

Add dw_edma_core_ll_cur_idx() to get the current LL entry index and
prepare for dynamic addition of DMA requests while the DMA engine is
running.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Co-developed-by: Koichiro Den <den@valinux.co.jp>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 drivers/dma/dw-edma/dw-edma-core.h    | 10 ++++++++++
 drivers/dma/dw-edma/dw-edma-v0-core.c | 20 ++++++++++++++++++++
 drivers/dma/dw-edma/dw-hdma-v0-core.c | 20 ++++++++++++++++++++
 include/linux/dma/edma.h              |  2 +-
 4 files changed, 51 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
index f6a5ad317567..e50fa7965778 100644
--- a/drivers/dma/dw-edma/dw-edma-core.h
+++ b/drivers/dma/dw-edma/dw-edma-core.h
@@ -138,6 +138,7 @@ struct dw_edma_core_ops {
 	void (*ll_data)(struct dw_edma_chan *chan, struct dw_edma_burst *burst,
 			u32 idx, bool cb, bool irq);
 	void (*ll_link)(struct dw_edma_chan *chan, u32 idx, bool cb, u64 addr);
+	int (*ll_cur_idx)(struct dw_edma_chan *chan);
 	void (*ch_doorbell)(struct dw_edma_chan *chan);
 	void (*ch_enable)(struct dw_edma_chan *chan);
 	void (*ch_config)(struct dw_edma_chan *chan);
@@ -181,6 +182,15 @@ struct dw_edma_chan *dchan2dw_edma_chan(struct dma_chan *dchan)
 	return vc2dw_edma_chan(to_virt_chan(dchan));
 }
 
+/*
+ * Return the current LL entry index. A negative value means that the channel
+ * context is not initialized or was lost after a link reset.
+ */
+static inline int dw_edma_core_ll_cur_idx(struct dw_edma_chan *chan)
+{
+	return chan->dw->core->ll_cur_idx(chan);
+}
+
 static inline u64 dw_edma_core_get_ll_paddr(struct dw_edma_chan *chan)
 {
 	if (chan->dir == EDMA_DIR_WRITE)
diff --git a/drivers/dma/dw-edma/dw-edma-v0-core.c b/drivers/dma/dw-edma/dw-edma-v0-core.c
index abc1bd4c0be2..cc8059182940 100644
--- a/drivers/dma/dw-edma/dw-edma-v0-core.c
+++ b/drivers/dma/dw-edma/dw-edma-v0-core.c
@@ -616,6 +616,25 @@ static void dw_edma_v0_core_ch_doorbell(struct dw_edma_chan *chan)
 		  FIELD_PREP(EDMA_V0_DOORBELL_CH_MASK, chan->id));
 }
 
+static int dw_edma_v0_core_ll_cur_idx(struct dw_edma_chan *chan)
+{
+	u32 base, val;
+
+	val = GET_CH_32(chan->dw, chan->dir, chan->id, llp.lsb);
+	base = lower_32_bits(dw_edma_core_get_ll_paddr(chan));
+
+	/*
+	 * LL regions stay within one 4 GiB address window. Reject an all-ones
+	 * MMIO value. If the low word is zero, use the high word to distinguish
+	 * a nonzero boundary address from an unprogrammed all-zero context.
+	 */
+	if (val == U32_MAX ||
+	    (!val && !GET_CH_32(chan->dw, chan->dir, chan->id, llp.msb)))
+		return -EINVAL;
+
+	return (val - base) / EDMA_LL_SZ;
+}
+
 /* eDMA debugfs callbacks */
 static void dw_edma_v0_core_debugfs_on(struct dw_edma *dw)
 {
@@ -650,6 +669,7 @@ static const struct dw_edma_core_ops dw_edma_v0_core = {
 	.handle_int = dw_edma_v0_core_handle_int,
 	.ll_data = dw_edma_v0_core_ll_data,
 	.ll_link = dw_edma_v0_core_ll_link,
+	.ll_cur_idx = dw_edma_v0_core_ll_cur_idx,
 	.ch_doorbell = dw_edma_v0_core_ch_doorbell,
 	.ch_enable = dw_edma_v0_core_ch_enable,
 	.ch_config = dw_edma_v0_core_ch_config,
diff --git a/drivers/dma/dw-edma/dw-hdma-v0-core.c b/drivers/dma/dw-edma/dw-hdma-v0-core.c
index 36ee72efcd31..19da1c8fd615 100644
--- a/drivers/dma/dw-edma/dw-hdma-v0-core.c
+++ b/drivers/dma/dw-edma/dw-hdma-v0-core.c
@@ -384,6 +384,25 @@ static void dw_hdma_v0_core_ch_doorbell(struct dw_edma_chan *chan)
 	SET_CH_32(dw, chan->dir, chan->id, doorbell, HDMA_V0_DOORBELL_START);
 }
 
+static int dw_hdma_v0_core_ll_cur_idx(struct dw_edma_chan *chan)
+{
+	u32 base, val;
+
+	val = GET_CH_32(chan->dw, chan->dir, chan->id, llp.lsb);
+	base = lower_32_bits(dw_edma_core_get_ll_paddr(chan));
+
+	/*
+	 * LL regions stay within one 4 GiB address window. Reject an all-ones
+	 * MMIO value. If the low word is zero, use the high word to distinguish
+	 * a nonzero boundary address from an unprogrammed all-zero context.
+	 */
+	if (val == U32_MAX ||
+	    (!val && !GET_CH_32(chan->dw, chan->dir, chan->id, llp.msb)))
+		return -EINVAL;
+
+	return (val - base) / EDMA_LL_SZ;
+}
+
 /* HDMA debugfs callbacks */
 static void dw_hdma_v0_core_debugfs_on(struct dw_edma *dw)
 {
@@ -406,6 +425,7 @@ static const struct dw_edma_core_ops dw_hdma_v0_core = {
 	.non_ll_start = dw_hdma_v0_core_non_ll_start,
 	.ll_data = dw_hdma_v0_core_ll_data,
 	.ll_link = dw_hdma_v0_core_ll_link,
+	.ll_cur_idx = dw_hdma_v0_core_ll_cur_idx,
 	.ch_doorbell = dw_hdma_v0_core_ch_doorbell,
 	.ch_enable = dw_hdma_v0_core_ch_enable,
 	.ch_config = dw_hdma_v0_core_ch_config,
diff --git a/include/linux/dma/edma.h b/include/linux/dma/edma.h
index 3c8e2ef9dee0..a4e5aab8fddc 100644
--- a/include/linux/dma/edma.h
+++ b/include/linux/dma/edma.h
@@ -130,7 +130,7 @@ struct dw_edma_chip {
 
 	u16			ll_wr_cnt;
 	u16			ll_rd_cnt;
-	/* link list address */
+	/* Linked-list regions must not cross a 4 GiB address boundary. */
 	struct dw_edma_region	ll_region_wr[HDMA_MAX_WR_CH];
 	struct dw_edma_region	ll_region_rd[HDMA_MAX_RD_CH];
 
-- 
2.51.0

