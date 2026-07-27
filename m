Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021072.outbound.protection.outlook.com [40.107.74.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2663F6C4F;
	Mon, 27 Jul 2026 17:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785171818; cv=fail; b=iAkbz/YxOnO2K6NDeljew3Jelekb0PEeQDjNdglEzclqWfvXKaaDi0/b3SmGecdUoHXVmtKaNk7LkoKa5QTwEzjCBr2fv1Rw4RbZDVSdZPLLdp3yqKPumiwLJHyumVjX13gLUqlDN4FAIxPdCDoUmuN+Bi5CxCERI2gQ9S7Vy0Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785171818; c=relaxed/simple;
	bh=ZWiN47l7PeW9Qm0+rdJOai8Ytt3ZxtVC+qKiAHFuM9g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uhynZ2pyb22xSbAWXtzRGYwx4pdw8YtCtegnvww2HrGqD7kBrGNrEHoQNVUg1HLUgXuMr5S5hyGyyXVs8xfzNmEec45NQwEXFZDi77WuWqgioNb7KUT9JXbZkcToS/vJ3N7lo4mY7UNN9rwCg7pBviFpCLHyILNJarDBR/O22XE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=f5mFxSzJ; arc=fail smtp.client-ip=40.107.74.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="f5mFxSzJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HsOJ5sVOKa3xTcuG+3Mx3LUEY6inO/b997eCXgAYVORfhnT7ZeqaBH5XGhnC5Q6cGQaxjY7IfL2MyuYgufrnwvbsB71rfTOQjgQLmNNj3qunNxUq/nGkmZFy0kaMiDHFDu6Svzx/8oHh2z+Ks6O8F5lIpsu3jmH62yndjOVXcc+74mKOpZSJIAzbZDr8uHb6LnCtNVWftie9mmJUl7XflAWq1Grw9qjTXr3anwPfB9x7I6kKGqDAT3gTduAf2SaCeI3yBboA/ktQgo8d7DeR+THXOpJoDPBE+yxdwlF4dhY3EKsu5zoewyTeYWl7uHP3FafAs5ooV0pgI3Uaf/EZkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5acNK4yz06d1yz5XLlN8vFJP5yeR9TTIoowGA+Dy8gc=;
 b=Fl/8tgOwGhjd5+Zsf4DEDV8n7VGCS71HrKuLYdb0zE7Wky3qLnjhEd3s7FU1wJFmQX+bamDQGGejtWIMHsdeYnDXmkdA6ZqMZADPq3Qe5TbBnnO9Rp34vKvP6qBu+ZFXZ4/MgLy4wxRytlhw1Qf4omiJSeqg6OH5DTkgqEhPmsNd/jcNeGdrkUWaT7D4k8k2QvMB29+cASw64us44okJY7nRZvptkMIiDfIZCYFLWrwEVd6lIJDSG171twRQFqL5h0Uf7s0DZfJyCLNS1o4ACkYCdi3Mtr6NFHI4CNdQ7l6R5aCg0TmlkZlcwDLC3q+97+a4Czu8m9eapsVEQsOxJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5acNK4yz06d1yz5XLlN8vFJP5yeR9TTIoowGA+Dy8gc=;
 b=f5mFxSzJ5Rc4jxDMNBuMHS89jRER6je14BaLsYFHL5yb7fDNilKMHWYxvWCCxVBk5Ft4dOPImhOqWlB62tw38fAqyZav/UZoVdej/0Npkwc+HA88RSx6EEMVrZMHJEUqU7HD8+uQ466S8J4lW/LMkxLrNNG06uqazQt1my26tjM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYRP286MB4609.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:1a9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Mon, 27 Jul
 2026 17:03:31 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 17:03:31 +0000
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
Subject: [PATCH v3 01/24] dmaengine: dw-edma: Add dw_edma_core_ll_cur_idx() to get current LL entry index
Date: Tue, 28 Jul 2026 02:03:00 +0900
Message-ID: <20260727170323.2321369-2-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260727170323.2321369-1-den@valinux.co.jp>
References: <20260727170323.2321369-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY6P286CA0030.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3b7::6) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYRP286MB4609:EE_
X-MS-Office365-Filtering-Correlation-Id: db855417-a936-4551-231f-08deec00fcc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|376014|23010399003|10070799003|18002099003|22082099003|10067099003|56012099006|921020|6133799003;
X-Microsoft-Antispam-Message-Info:
	qhC+Zm2K4HM5+pBGhxS1Ti9+WxHeawCGhZw04RYCMEUVlxPclyabwlZ587alps7DzXslUrZSQ78ox4loEtBzNXcRLUSTDknbMMqARQ+ChZx5RBWnFlqf+Xx8Z0JEyHaj8sA5JCUXWC1OviASjVRQx8lBHFuvvvBadOOfXpsWKo+Lc646fnnd0ba5buhuwfKYi3GYD+LDPAnliywHyTDKXx2DOm4GR/+lttJe7quwhKp+FR2NI2bphB3OOKgc6kpympI5xrELZL1fhCJppo/LovFlhhNlL8LgQkT91aVDm4O8bD/5jBa9NApZtKx74kh5qKfHwwCxCI1eM6ipV5dZutgRaH3mu5sBaNg0T6o1Fr16pmd7TT9aI3VPy8F3KiV/A/Eqo4gqL0TbB9SeisciPJDtWUAI5miXWW1DjRsaVjCkADXSl+Wv9ZvGOuev6vI5ZAoy/UNUHFZ+mwqs7+OnMBqT4igCGyCoVYZeVDN+uJ4CWxNANnLqjTHZFj/FX6fdG6p+x2BGbRP64AzXTE05cZLKyofQ3pxYQ1Q3W8MLE46fheTW2kRuYVAiLQ2D+94LhiEgt5mNHJEhw6lN62jWoIEoTSDhh+6J8FfAdPjOFYrSZD9vp8Z7zV+DfT2mA/p6f1YcN3UVA40TUBG+RYBqslcUzpGuAMP5bJakQdoyMfSi1YC0LdVaHWfY/u2+0o/Xc7Nl8K4yrD6kBlPMk4SY6Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(23010399003)(10070799003)(18002099003)(22082099003)(10067099003)(56012099006)(921020)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AbHsEV+bou78QPu4VarFTd2Xwi/ak7uGHCko/AUiQs8T9CrcWm1bSlcFEN9w?=
 =?us-ascii?Q?eztZrtKGPcyOEMmwam5tODHgEtY7ywsUIzv6NZ+AInZbdc+BTOCtPgAfQhla?=
 =?us-ascii?Q?5/ZhJqzvg/U/EReakgQkqcyAYy99H9ps4PJ7tS1/DkRKUIuVN6bJDWdD/2at?=
 =?us-ascii?Q?ALoDo7+pC0lhQCHAreIpNgWAHJJhLyGCXQrCU9+am3rMQufOQ71YMe17jDCj?=
 =?us-ascii?Q?ZloNtsV3niIwPL8TFAVhFlrRgo8UmGI7zlfqb8I05YBYswrc2Q/Nam+/YEzo?=
 =?us-ascii?Q?LVfjFBSbhSq0bMfcCNkq36vSOTVNEcXmV8o/Ji5dgtheNWG8KYMql95HU/mO?=
 =?us-ascii?Q?c7XqndNlX3NY0HydJhAK0pkPtSDW0kXuI0PVEbnHT6Fvx/LG6P3bI7WW6J21?=
 =?us-ascii?Q?03Fd9DgHW38ww0vF+Xa6a+X/+hnfn5fFFpUiqj1tNg8Z1NiV1uxG9SWeJ81W?=
 =?us-ascii?Q?6niU+2Q/WpssT37VGwmBiO9g+u8oge81YKnUzIowRA0RXirA5HNSdX7pnKAF?=
 =?us-ascii?Q?q4rh172S7dPinFb+Oaz7pXp/ZGZbbqTZ2ENr706WQQYMxjIILsRSqCP13fiy?=
 =?us-ascii?Q?FF6RhbEi5S6u3cHZ+POI2mEUyT1TIn0tDV1JZB+dvCV3upo0JUcXW8iw/inD?=
 =?us-ascii?Q?cknUbNqx/ikJK8DLQgnXoHAcXjpdHreqYC7wORfkwKBRSiT00iZ0jVl4xA7O?=
 =?us-ascii?Q?G4eJlzlT/nmvSMKwX8rv/iyR0hk9mhugCPcv01kCdXDx/y4vchclqeQP4M8L?=
 =?us-ascii?Q?yGpwMMFR5wFIyZnG2R7U11pQljT5SaeFd6MHfElAUiJ9Rs1XfD1CFYUypKvz?=
 =?us-ascii?Q?+pyELg7Qwph2f+YzQageL9ivrlLZFjp0wJqnVNZQanIvVSMBpMEk+5HxPgis?=
 =?us-ascii?Q?qcFcsqnGnD4WT7znwtJe+FCDgDNywFzAYKDJFX5iudB0YZauTxBxU5LBckCF?=
 =?us-ascii?Q?ymmKXe99wSSilBCW7IWYGxOpDjVHN+/Q7tPd40pXCihC1aQ/tpVwaynylCyk?=
 =?us-ascii?Q?1k85OwaMmm5DoMcrTGJy83JPMJ8uLzRV49QJOVAr2/x3QPahYdrfcpNznCqi?=
 =?us-ascii?Q?4hUk2jauuq71twmLSNUXH67H8PyKJbLefn5fX4xCdBsdgMy9pLLt7r2rQdRI?=
 =?us-ascii?Q?EqqKqGAxIXMbOE8SxX8hN/vWMHuZHV8a7iBQJflTqknu80Xmu8ly4xe/POq6?=
 =?us-ascii?Q?HFuHJxTKMf/F1YyJR9rmj0KlDpPGpDeOgbyuVn7XL3cIe/oHqEh4ZgIJUHsl?=
 =?us-ascii?Q?bOoFZ3p27SSaMXQcNAtyYVsaDX8ODCsZefb9MhfJGs+qi/P5t3gvgm5b8H1e?=
 =?us-ascii?Q?ONEuo2vvp56yyuMBjaK78L+pE+EQoMn3UbRO93ok82H5FPh37lAQJjgfjo3E?=
 =?us-ascii?Q?gHGZIXVYiMiLwQdIKhF7cOi0OCs+UH2bJufjwtnJ0YIjSPseF/0GumfzpGi6?=
 =?us-ascii?Q?Z0uOpPOQ1zl6rRZ3ywFBJu4ULt+xOOcGrA8/rGTalCthA87d9n9NjKSo0+21?=
 =?us-ascii?Q?NgzkT8O0oEq0N6XxT9Pk4qeRBuwYhqvrVeHH2AGyuJ42STNfOCpvYPspyA0/?=
 =?us-ascii?Q?T4jlds6ZA9acg6ehDDvK++5nkgMIyKYIdMrBztXUJ6eDxFQ8QrxcqQWkfXwY?=
 =?us-ascii?Q?GUmS38PV7sps5HWyfxWEXwdU0PxWuU/TSui1rzWzZ0bOUoVeTVdEBIpJNp5X?=
 =?us-ascii?Q?43lO/qOrDxdLd2PVdvpW5ppF654FgSOZZWNP3ra07jy8q0MuthKkbKBzcfaO?=
 =?us-ascii?Q?88HcRF/mvuBPhZkJtn1c8ie/XPZ0WmN3aMUaE66B/Y8INm2Qk+x6?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: db855417-a936-4551-231f-08deec00fcc8
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 17:03:31.8834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s0EDprmG7iESgAzAwNEq3NkD9ybf85FESkeQuey6YoUZgwypv+6N2+CgU+CGmvNtoKgmFU59uThglSGaP7gvKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRP286MB4609

From: Frank Li <Frank.Li@nxp.com>

Add dw_edma_core_ll_cur_idx() to get the current LL entry index and
prepare for dynamic addition of DMA requests while the DMA engine is
running.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Co-developed-by: Koichiro Den <den@valinux.co.jp>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v3:
  - No changes.

 drivers/dma/dw-edma/dw-edma-core.h    | 10 ++++++++++
 drivers/dma/dw-edma/dw-edma-v0-core.c | 19 +++++++++++++++++++
 drivers/dma/dw-edma/dw-hdma-v0-core.c | 19 +++++++++++++++++++
 3 files changed, 48 insertions(+)

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
index abc1bd4c0be2..ba84811234e1 100644
--- a/drivers/dma/dw-edma/dw-edma-v0-core.c
+++ b/drivers/dma/dw-edma/dw-edma-v0-core.c
@@ -616,6 +616,24 @@ static void dw_edma_v0_core_ch_doorbell(struct dw_edma_chan *chan)
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
+	 * An all-zero pointer means that the channel context is unavailable,
+	 * so an LL region starting at DMA address zero is not supported.
+	 */
+	if (!val && !GET_CH_32(chan->dw, chan->dir, chan->id, llp.msb))
+		return -EINVAL;
+
+	/* u32 subtraction handles a low-word wrap at a 4 GiB boundary. */
+	return (val - base) / EDMA_LL_SZ;
+}
+
 /* eDMA debugfs callbacks */
 static void dw_edma_v0_core_debugfs_on(struct dw_edma *dw)
 {
@@ -650,6 +668,7 @@ static const struct dw_edma_core_ops dw_edma_v0_core = {
 	.handle_int = dw_edma_v0_core_handle_int,
 	.ll_data = dw_edma_v0_core_ll_data,
 	.ll_link = dw_edma_v0_core_ll_link,
+	.ll_cur_idx = dw_edma_v0_core_ll_cur_idx,
 	.ch_doorbell = dw_edma_v0_core_ch_doorbell,
 	.ch_enable = dw_edma_v0_core_ch_enable,
 	.ch_config = dw_edma_v0_core_ch_config,
diff --git a/drivers/dma/dw-edma/dw-hdma-v0-core.c b/drivers/dma/dw-edma/dw-hdma-v0-core.c
index 36ee72efcd31..2fc7f8e85b43 100644
--- a/drivers/dma/dw-edma/dw-hdma-v0-core.c
+++ b/drivers/dma/dw-edma/dw-hdma-v0-core.c
@@ -384,6 +384,24 @@ static void dw_hdma_v0_core_ch_doorbell(struct dw_edma_chan *chan)
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
+	 * An all-zero pointer means that the channel context is unavailable,
+	 * so an LL region starting at DMA address zero is not supported.
+	 */
+	if (!val && !GET_CH_32(chan->dw, chan->dir, chan->id, llp.msb))
+		return -EINVAL;
+
+	/* u32 subtraction handles a low-word wrap at a 4 GiB boundary. */
+	return (val - base) / EDMA_LL_SZ;
+}
+
 /* HDMA debugfs callbacks */
 static void dw_hdma_v0_core_debugfs_on(struct dw_edma *dw)
 {
@@ -406,6 +424,7 @@ static const struct dw_edma_core_ops dw_hdma_v0_core = {
 	.non_ll_start = dw_hdma_v0_core_non_ll_start,
 	.ll_data = dw_hdma_v0_core_ll_data,
 	.ll_link = dw_hdma_v0_core_ll_link,
+	.ll_cur_idx = dw_hdma_v0_core_ll_cur_idx,
 	.ch_doorbell = dw_hdma_v0_core_ch_doorbell,
 	.ch_enable = dw_hdma_v0_core_ch_enable,
 	.ch_config = dw_hdma_v0_core_ch_config,
-- 
2.51.0

