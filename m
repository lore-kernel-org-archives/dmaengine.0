Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020119.outbound.protection.outlook.com [52.101.229.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A995743637C;
	Wed, 12 Aug 2026 15:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786550255; cv=fail; b=kWF8O8IsphyC//T0L84NdNe9+RIc2ihnPsF2du9STdyvcuQYK05ZnN8n8gnAe1Xq19DtP/BsjtSZXpc/hWzwllbLzQ5cYNWX/SRk6v6cPawie84HfNTFcC7xub33nXI95MBy8I9PjX+Sy31qhK0osnVse1vCjxwo+iakAHXl2PI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786550255; c=relaxed/simple;
	bh=GslbdYxP0s9xx0WG4fv6FcvT7dzHRwxtTAl51n9r4f4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=b4+UF7Wrrt4B+sIdJwwjGVJhuNpXXT0NZaqU1b2Yz6biJwjiBMT4yenlbvmXZFkrbbu77vYEnbpNT8OnrjYuwcvVnjdcoK2sgNvz/C9AvdBsPjb2ytrdRLRpZCQc77jz4ighdM1T+GFn1ApjVBXaIks5CgVrW+zj56TyspLkrxg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=FNXv2eOA; arc=fail smtp.client-ip=52.101.229.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="FNXv2eOA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pt6HFB3X/jvK3720eTHkA/NFNbBCA5U7N0eTHZAgPeqRDlVUdq2c+U8witzY6FsmcSHBLAW12BVUiuWiMNiGCaMTfwpKB3noNmnD0hm5E43WJ9kWNS0js/MDSNJILcwwVOm5wT35idz+LAjFc9hdhmBCaqIRNoNrF4W1DknTx5oHFVoL2kD/84ro1fxqOSTCav0UjZjGeFgQtmOOU+7FEKOmjkwS13Azr1ipCztz/D/DUqTTY2xguSQGVq6RL9+wEnII+YpIBWeu40wP0zXdJ3hkWKGkoSmd9gqCgWDjyo4r4jSmXOaH+aopxzxGijf1J4UsdVCb0AgVnp65Dzw0Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QOV6a6QQoqKG34gqy9uvJO8zPzsBjLbUk1ONw63w9ds=;
 b=NrYEnS+8bAGA+vo/ijBIT37JaT1jGuCyMXwmW3ylVVeFrF3iQ7nAHk8OWyNr2z+VehPf5Vci/S/VV262FNgrj5bCqY0ajmMshqULsoVd5QPYXzEZ5uj+acrCuc/HLB1ixgNhsAZJDdGVYJibyVeiPOvZH5KOrty9Oi4PWHyc39HzhFpaBBRgY+BtSv0SlFDawOZv4DncoiaZ33I6Ffmki2QYCDv52Gmaw0Gpxfync+QC5wN0GMDOgUDqSgGeD7qX7/dH6ldlY9yA5YzFLx1qeYCpoHlpvf5m+J62QnQ2ydi5TaWvwc0WYYkDe93BZD7pHbFh9j1wA6PcdbgkxGCdKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QOV6a6QQoqKG34gqy9uvJO8zPzsBjLbUk1ONw63w9ds=;
 b=FNXv2eOA9muDS9u1DTjoFzC8pcEg08sZYYdbxOAsvNVuQKzHcehJQ6iZNuW2G8qpb4hd3CDxjlSWoOUVawLR9c+bHIwXADDO+JGpoO0dCWgYM6gK99McYCzpVo2WnPWvp3LXWIOglqvBXHXobxrnzSCJ9R8osXnubt+8RSqQU64=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OS7P286MB7115.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:42f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Wed, 12 Aug
 2026 15:57:27 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0292.024; Wed, 12 Aug 2026
 15:57:27 +0000
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
Subject: [PATCH v5 02/24] dmaengine: dw-edma: Add dw_edma_core_ll_clear() to clear LL control-word
Date: Thu, 13 Aug 2026 00:56:59 +0900
Message-ID: <20260812155721.2807506-3-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260812155721.2807506-1-den@valinux.co.jp>
References: <20260812155721.2807506-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0003.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::10) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OS7P286MB7115:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cb9e6fc-fb5a-4efc-44e7-08def88a68ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|23010399003|10070799003|18002099003|22082099003|56012099006|10067099003|921020;
X-Microsoft-Antispam-Message-Info:
	j64c8KZx8tb9lEBw3wLG8HV+GpC4Ww8aiqSc5UJPgGghnESY9LtkaRbdsI87HBMdoxbud2y+h/LoPFchTzTOebtyiq+bVpFNqVJIl9/AKV/AyZ/NxAG7+GGgf22s0ZlyZn/59nKacpSx2RweMGitesPerFQc7mltqmGpCmalnuDIzB2AptnBlHhgJatABOqgfqr50PJpJht1zDOGnzO1C9dhCsCKyj5D8UdxMiY6KXrdL6pAhYVasDpxHqnZhq4prH9INJmY52ol39pwgSgkhTSDJpgGPiToS0lZI23qIth8P4Ks3rUFUmCQBfTdO4OlyYe8vJfPxCsQyN2e58sNm/NU0nJg2LrRMurGxNIxQq8NhyKfqaSN4CHFpIt7rBOOu35CpInRv3CbbC578xvymxBlgXHojIkB3uM6xLt9NNu2sPTFVW/4/OjNnJGC7QaQOWEOGkRFJDJcVAVo5p7zBXmJIjVRTlNAytqK1I6DM0aqolE2pOlpoqiixR2M6HYqoCbv6ZSJ7WJEk62dWAEKG7TOLYdZWe/8Fnj68Cfjjxvgn4FBJrLKfUrnE/foJ3atufLcM/2/B0AVh5wGO4/TBpSodeGEpr4dtuUFJgUv5QPZ4w2dbdQjO9vWCI6PfVftxBFwutcO5Wx9R8OW9teh0xuhzRBpFhNz6ZY8FmFy8mut3Lj8ARuduMsRThy+QUS2r7lc8tMMbsM2mZGT3TnkZw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(23010399003)(10070799003)(18002099003)(22082099003)(56012099006)(10067099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ubFnlGklSmiqWQ+zVrvhZHUcaEpIapdnfD19Obf4qdB0U38I5zr3epOqIA38?=
 =?us-ascii?Q?fK2ltvPo/sBOr4JsUa5CgkwsO/tCCxClw5RriUFmXkk7VACqXavaRB2Bwuxq?=
 =?us-ascii?Q?b26zz2y0IBxOtP+fSKxDZhJKT7ilKH6mbJNzFio59pRGQvfNbHwRD626aFcS?=
 =?us-ascii?Q?iJ7yrNLX70CiUt4HLNMus8BqlktWn9LmYsa/nWpMo7/3E8YYGTZlks//2aYj?=
 =?us-ascii?Q?nZK/pnMR4f01LB0xatGchI700oyqEWlW4bDg0FX8UqckKXC8qFsEL9ioHf+7?=
 =?us-ascii?Q?ob8ddnqcnjyWslpoUka9NQqyXDU+VHsE5KL8+cwfkYXGHkOrFPSYsa9xN9t1?=
 =?us-ascii?Q?aJbV9udk/qLL8rtcUmSOBqwiMxeXIuMIrIeg0wDU430SgEE50VQ0R/ZtoCK1?=
 =?us-ascii?Q?XZfDZL0NN6KkWx4E2kGnumbFsNpwvJQw9KcVF1as09s/BaEF3Pmw5oqXWVwY?=
 =?us-ascii?Q?oUQdhyKh5YJbQ+aP+3FSECCo53tNuA8pwWsb61t6GXwR5iqFHW+0GMy6afpQ?=
 =?us-ascii?Q?40QTyYp5VmTCCuF2dON0sB7cGy1NSKBtZWeHR1epAooqhIjyoxOYMlxfIC/z?=
 =?us-ascii?Q?e8PZGP3au+EPetrF/P56ugtCRj+iBbqwAQkbJo/Iy2HpARefA+ntCOjPJFEL?=
 =?us-ascii?Q?tE+I2Nj9TZJNIhwDAmvCGIFqO8cuhdOafSrsHJTNtMEk3KUec3fn90xgZyiG?=
 =?us-ascii?Q?XwyiEIsA+TqSfuaBQp1/TQDqe7g2W/eZZEUZsKTwzXx/RjrGHN2H1aJsdWF5?=
 =?us-ascii?Q?XFT0q9ur26H1E4dRHrfM6APYzzsLFFmgJidd9RIXfVgBAg52yKIY7oFnBz0C?=
 =?us-ascii?Q?sm9CpYJ8AS+aQGXst37+7fe8TMKI5VFTElOogl9TH2RkW9V1pqfDTmObESip?=
 =?us-ascii?Q?GSUbAeRKwI8w2EEp9eMId17gd1z4dmK0FFHoi8EmL2na5GgMN7a/PN3y4jgA?=
 =?us-ascii?Q?zwhV2QCOIjF61m1VDzs++ROfc7PsCXG1pEMwmESO4kAYBEIzWmnX1let6/2Y?=
 =?us-ascii?Q?LlrE/foN+yF1uXeAHSrYPkQywdCCJRZY5FQvHoTNWfqK60zCmhsIS+3OmDfp?=
 =?us-ascii?Q?ngprDHSUwP3xl6KguPxeRT8A/lb/T0e9Pra4AOOlGPpyJE4KwzUrfq93ITCo?=
 =?us-ascii?Q?dQoT0CWHJRWeNin0dyaB3PwKwjJPOEfMIeRQqQQMBwFH4G9O9/3wYTaKtwYa?=
 =?us-ascii?Q?/y+37dyXVy/G0auCt3OUmz0uiZWHfPrhMNewiDZW6n++IZt4ykRD3nsfTgR7?=
 =?us-ascii?Q?DVoJLvpnh6bzHvxZwcVECcKDBGkMd6V7yQvcvV2R0Oq7AVKGtAmVBOZSoVGw?=
 =?us-ascii?Q?1oSBBVIpyeLebN3nXcQQw7MwHnCzq2CKhHswHc8PL9PXTJOg9/I6IwW7bGe8?=
 =?us-ascii?Q?okGDSDBhpSLWh36b8e1d6hdFepjlsq/jeRH+lwCBfqz8CDG3t8yE8BhLrz2y?=
 =?us-ascii?Q?Nc9eeEsFGHJQGKNxK4CliGPMTShKWyNFIyb7oO39uUaA2NxjVU8AR5y1iDUP?=
 =?us-ascii?Q?AuH66Hv9QDi96xXy3+lrboA0t+U2C50wA+Z1YTqEh4LVLTnvHTyUmKCH2Nbs?=
 =?us-ascii?Q?LCmH4uFjgW1m6aOjGZToCFtdFCG2k9FXAvyGcuWwFoW+XCbX1el+gfXRI6Ir?=
 =?us-ascii?Q?0enoV1Z/oEr3wmoOIhJSjSNY9D6OaUE+fZMYblfIw8JxIohCbfYeazsMU57I?=
 =?us-ascii?Q?JF7BvRa8bjMiTMZVmlmpwniEDqX6HXAVKh6Iys5cs5FcRwQG7v00cT+z8mlK?=
 =?us-ascii?Q?oe6lBHVTHYHu+JnlH6k8kMNyAFB1wYuTCN92iS2KT5Qpy4RWu93D?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cb9e6fc-fb5a-4efc-44e7-08def88a68ab
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 15:57:27.8930
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sT6VBTdEY4dZhMXU6ONe3ssJkC+TK2lNC7wLDx3sBz0f53utgmdBihEFHDw/giSWgDoIj9jolbrAbmcv2SLuOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB7115

Add a core operation for clearing the control word of one linked-list
entry. A later patch uses the operation to invalidate stale CB when
resetting a circular LL ring.

No functional change.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v5:
  - No changes.

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
index cc8059182940..bb86d2f60ab5 100644
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
@@ -669,6 +684,7 @@ static const struct dw_edma_core_ops dw_edma_v0_core = {
 	.handle_int = dw_edma_v0_core_handle_int,
 	.ll_data = dw_edma_v0_core_ll_data,
 	.ll_link = dw_edma_v0_core_ll_link,
+	.ll_clear = dw_edma_v0_core_ll_clear,
 	.ll_cur_idx = dw_edma_v0_core_ll_cur_idx,
 	.ch_doorbell = dw_edma_v0_core_ch_doorbell,
 	.ch_enable = dw_edma_v0_core_ch_enable,
diff --git a/drivers/dma/dw-edma/dw-hdma-v0-core.c b/drivers/dma/dw-edma/dw-hdma-v0-core.c
index 19da1c8fd615..47d7a01658eb 100644
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
@@ -425,6 +440,7 @@ static const struct dw_edma_core_ops dw_hdma_v0_core = {
 	.non_ll_start = dw_hdma_v0_core_non_ll_start,
 	.ll_data = dw_hdma_v0_core_ll_data,
 	.ll_link = dw_hdma_v0_core_ll_link,
+	.ll_clear = dw_hdma_v0_core_ll_clear,
 	.ll_cur_idx = dw_hdma_v0_core_ll_cur_idx,
 	.ch_doorbell = dw_hdma_v0_core_ch_doorbell,
 	.ch_enable = dw_hdma_v0_core_ch_enable,
-- 
2.51.0

