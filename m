Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11020109.outbound.protection.outlook.com [52.101.228.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3529240B108;
	Thu, 23 Jul 2026 08:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784796130; cv=fail; b=JLBz5rbEk3AXBgJxyJ6C9qa+0r/d609GJ2qsCvau55PdpEG/DT8guI7jDTTDOJg0fF8MAOZNbxXJu5AFn9OW1fqGUU1AqQLqv4ngdRc+X50ndrJ+Ri2CYV3+OICmu3hwNIi/HFVVrZYs+rLqIKL4IFQrZA/0y1ICE8xCVzxs6h0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784796130; c=relaxed/simple;
	bh=7/LI2/EDEvxxxDaZvSUBZ2nnZYQ8v2VCaH2RciAEels=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=E+82DROTAJWTc+tv2csEX48drMf95YO7LG6rzK7t28jjhHn9XcdUYZzsUokhh0yDRmzI7dYB5K8MepYEDsDMdM/bvD3ghPVrYwA8woGT56ecwb6Ok/cgxSIDsVXzPZDTkbUGhrCLFB2cqMZRgaTr2exfBdxK/3XejPoVns0I9h4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=b9NZD/AY; arc=fail smtp.client-ip=52.101.228.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="b9NZD/AY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g9uqCsPqC4z9UPyNLXDHm794mizsfN0p/fF8QNMf2rDiSnGP8M4IKQojNzqqQKDZLHgfoXLUfGKya4CXXnQoYBmPvh2IWwAkT5ae2rVo7p36EjO8beQG3zB3q1WaqUAd2LytkpUTbo5oYbfe/yjf/6nse12fFmXqJdWv6fhzTKbIIJji67Xy2fAZy7BSv8pcTFV2s8I149O/wqya7SJG9JN43ej+xiBTvtv6evNbOfgkzz6RyMXHLYa+zEvJRhs2q0+ne+KB+iZVGYQY/J+0bkS185vV/7/Sc6kqZPs58t/ig7sUv+oY/8eJLizUd1hWtAcsrqWRNoAwbRtVQJrUyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yIy2+R73/EZy1bu2y7tVklK8/Jp3ieXhFKCHl5Zx+hM=;
 b=kfHmEwWl8A4F0OWxv4MXPBq+yoEtrYL/yl9vIlNujw9N3MGY6nmyxDBlDIecbmlI638y/+BJSRhJMolyKG1hhassMrpc+YWTHe35No/NoZStghEdhprylZAp5etwsiBoPl9bogJRa1O1NTufUG75n8w8wHpHogSiBUofmEHFQma4T2t56ggh+JM2sgSHXXr0BSufoGz4yJtrfqCu7rcmaRSqtMDxl4l6m/HC1pq+HdmhD2k89AM4mPFqMd1pZt7TNmMHrRTwix1kux5Vji9NVk92p/2iv2ca1+kgpNYZ6xkTt68gu/h6AemnYi4EWUUyYMckB7MWZPTQf7qwVPRexg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yIy2+R73/EZy1bu2y7tVklK8/Jp3ieXhFKCHl5Zx+hM=;
 b=b9NZD/AYDVi33QG/fGuUqPbf+69ShlKErZxEYb3ypVPu9rs24XagEJAeM0QuvzlDmH/cnjpZQjDMOe/HxBwpAgB5zZt+i/mRsQL42sgQmehi4d0VnKE39my+QTuAhtONg8NIgFp1adeDKdhiJ0IiyXKI1LTr+8hVhgq8X2nmKK0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYYP286MB1883.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:111::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 08:42:00 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 08:42:00 +0000
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
Subject: [PATCH v2 05/19] dmaengine: dw-edma: Add LL interrupt placement policy
Date: Thu, 23 Jul 2026 17:41:36 +0900
Message-ID: <20260723084150.521366-6-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260723084150.521366-1-den@valinux.co.jp>
References: <20260723084150.521366-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P286CA0011.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:26d::11) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYYP286MB1883:EE_
X-MS-Office365-Filtering-Correlation-Id: b8ec5f85-c4f0-43c7-dad7-08dee8964326
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|10070799003|366016|1800799024|921020|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	jzGizV3y4byGRksEET3LSsWX2tuDYng4T8oywt0WhyczMp7nD4bDBj9GxTaY0tPq4VFh+3AfjGitKqpxAfA6HpgpcNTuNsnnXlTWL0RfQVvpdQz6mU8wzloRjXk9pLf+2/HQz6Zc86oi/RVKgmYJtYC7XAstTGoOIwRzEQFuENSD1Nvmddz5APgZO0zK0XDWCODS/NIGcs7/R9yPZ1QEmUfT/WHbKLyxVY09WX9eqs/46y6SMbt4Xe4lXzjxncjpyz9fbdHa2smkLyBCZGd51/kjhYGLkDcD2iYhVR6FgNCH9VqTGkwrQIp4jJXa3wYZplAiY7CA6sA93EYtJpzZUlomfjjk8aMcTZUb8x9A01yXcB+RdsN8zwY3yXeV2UcN28UwggtmAakz6nSiyhMt7Qw71xrCQTHTNaMF1oHxJF84/xy5/vqfDZ1q/xb5knrLXJEKn4lAYkiL25mK2Bw8y6WMeMFU49nmTKd68WoH/XoT7TJrv8voOG/4pop9rkF0oQRS4BOz6U0namueHEQX50IGkBvsWP0TPtNo4A2Y2pDiMHl8zWzYukd0ILFyHnmlkAOD6cfDz9ow5cCFDAuFzJImKgEgexXFim8Py33IMdOLlPGMwpydGgUiW5TQX1jZheYwq6pA3XUKQuFs4Rv4xWan+94O2JWusAF/s8P5u94dIobS5KSuCOc+JNw+1p8q/R0LFhZpuFi+haTMyKG9BQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(10070799003)(366016)(1800799024)(921020)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SHIt/B8E6TlOWmpV+853Zn1XGYPuKkXK/8hb78w38n2fm1/bcbLlF3wqgcoy?=
 =?us-ascii?Q?ptvz+rKt6y78siQDpDFsmAewBtNKGued5oIZ3A/8RtXqaip6vaN96+Cbk/Ji?=
 =?us-ascii?Q?ChOD3aaTruItBrMewu1s86VaRAHR8eOEVFloiX72hZqq8RXc/a8Fz4on1sXK?=
 =?us-ascii?Q?JEYhDojvWB0LLpz6e+zKkhPBNA2az67tp+tjkJiMQErjntlXk+ibkhVQInvc?=
 =?us-ascii?Q?Ii9oyCC9lBQEFq0kURJWJDSYqlgVJ8TnKJkodOpD6s6XJh5P0rC5mSk6sY7i?=
 =?us-ascii?Q?n7rccz2OX52RvWHbTW7stFFrah/Uwj7Xeu9DqTPdEr15zOEUPELsaa0G+AOY?=
 =?us-ascii?Q?Xz4W9Lrlu5zndgRFClOyj0LpJayFUy3+UPFCif9D4OKuHa5bJb9yAWsgMihg?=
 =?us-ascii?Q?4umf/rIzp40sXffWjdKBkNYLD6Aoihi7ia7eNAJM5X+Jbi2t4lWzHSHxENdb?=
 =?us-ascii?Q?VRx3AefmJXUYWn2ND9GqLqHVKAJKfJHieHKgVdC6xTJ0jlPMOfFqMaIa2fSJ?=
 =?us-ascii?Q?z5tiQouyGvXTp2YSy8tp4YuQmqtvpjht4kg0OV/4M0GiTCNsKCA8tiji+5Vc?=
 =?us-ascii?Q?Hz1Serjc2OW3YU1u9T4TayAcdbySNyAHqvcl6fMaEjgQlQtgIDZb/Q679gy4?=
 =?us-ascii?Q?WqE3vu2n/aOXOOUnPCaYBY32lPRsNbS8DJEJaXtdIfhIWe3pzqPZh7JeIYLi?=
 =?us-ascii?Q?4fY+vcmglxJCLrvtNn+7BKMLk3+xqfYqGgRJs+P7kGbYvMSMnmkgIUAIGYoh?=
 =?us-ascii?Q?4rrHlYgiMPMQQvHHKtoGNKeTuyqmv+7THqoWxtZlkOcwPH6sku9tCrxQC7c9?=
 =?us-ascii?Q?B4c6i572g72wSCRb2icygD+OCB15B/U2CBJ/BdnEdw3ihvKkyUozL6vt2yeO?=
 =?us-ascii?Q?CUXwseK+LwujUNkjwgo+wYWkmIKtkYUYINsCN8qslsZRBPm/4XiIKYyzAbkz?=
 =?us-ascii?Q?mKzbqGiOK5bvashFpZfc0XYKVMyksHWF2GD22jwZmmy6LEymGUlbaBoPsDy/?=
 =?us-ascii?Q?h04dgc7D8HCrX00AJFawLTfOi1jYMFS3i+0d5baix+wAbGHTaUGgk+DsDkcq?=
 =?us-ascii?Q?SD+l+AfFc0Oixyo+yqXONwLm6AKgmbI3dxnuz+PYPxn3vfvrzuwe4FKJF3yG?=
 =?us-ascii?Q?PoeeKLfo7al5zXXUaPgpYvATTbcrghUCgSbn3OIl59fuUVFUNX2zXaiVg9Be?=
 =?us-ascii?Q?4YyAS7EaxOWZGKumYCQUPm6nmnjgKSvktcon2Qzw7EcSv5V3GvLfomPGbll3?=
 =?us-ascii?Q?QNpq/Uw9/aJissrGu0WP/WKjLRcsq4hpC7tFN8Di53dmkkQ4AipQ2uD2r2pW?=
 =?us-ascii?Q?5yVlR85mambSp8CJ01UVIA8siM1lEm1BpuZPh7G6iH/HmCYmaey2hYnM5N8m?=
 =?us-ascii?Q?xfoK4pp9Rs/caidS1jamBaKXIC07dNDe3VaG3P7jVqI4x/y+o2MPoUmXnAzt?=
 =?us-ascii?Q?ssA1fzZ9HA+yfwYE+3ZoNGEJiwUi+PsS0vP2+8SBjK2brRHqCqbKrRuDiX1+?=
 =?us-ascii?Q?FiscBniNjWi0fcWap/TJcYXHMAwmOIZBSwEnchc2kh8J689Yym0l9fFWWmHO?=
 =?us-ascii?Q?KaLjn20+48EcCcg37yFwWhOp1owh9CAqocSnTJ5Nd0zqZhZjXCnti3oAm0X3?=
 =?us-ascii?Q?MxR89SHM6uPjd141nh/e2WbA9YnjLb1wWFXDcPni37IzZmMbsUI50i3cfLf5?=
 =?us-ascii?Q?WXJhDiMftFZiqyuVePPTnkmbwNCx8fEN6hPkCAuE8DSOjfzrkLrwII8o8r4j?=
 =?us-ascii?Q?Rwq4O5vuaY7Z/fattAJ2wmDMvdtIn7BT/93fins/BoJinfU713m3?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: b8ec5f85-c4f0-43c7-dad7-08dee8964326
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 08:42:00.3223
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sui7r5k+KVNeFFh65EusIcb5X9V1MKeHokTAkmrmjVZJ4wE3r1RM7e3QldD7BWtBSoMpmJqqIHexQCMqffRgNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB1883

Move linked-list interrupt placement behind a core callback so eDMA and
HDMA can use different policies.

Keep the eDMA behavior. For HDMA, place watermarks at descriptor ends,
before link entries, and every four entries when a descriptor exceeds the
usable ring capacity or another issued descriptor follows. A later patch
handles these watermarks as progress events.

Four entries is an empirically chosen coalescing interval.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v2:
  - Fix the zero-based interval so the first watermark is on the fourth
    entry, not the fifth.
  - Revise the commit message and source comments.

 drivers/dma/dw-edma/dw-edma-core.c    |  8 +++++++-
 drivers/dma/dw-edma/dw-edma-core.h    |  2 ++
 drivers/dma/dw-edma/dw-edma-v0-core.c | 10 ++++++++++
 drivers/dma/dw-edma/dw-hdma-v0-core.c | 28 +++++++++++++++++++++++++++
 4 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index a9f25a65294e..78d1bb6302fb 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -98,6 +98,12 @@ static u32 dw_edma_core_get_free_num(struct dw_edma_chan *chan)
 		chan->ll_max;
 }
 
+static bool dw_edma_core_enable_ll_irq(struct dw_edma_desc *desc, u32 i,
+				       u32 free)
+{
+	return desc->chan->dw->core->ll_irq(desc, i, free);
+}
+
 static void dw_edma_core_ll_start(struct dw_edma_desc *desc)
 {
 	struct dw_edma_chan *chan = desc->chan;
@@ -120,7 +126,7 @@ static void dw_edma_core_ll_start(struct dw_edma_desc *desc)
 
 		dw_edma_core_ll_data(chan, &desc->burst[i],
 				     chan->ll_head, chan->cb,
-				     i == desc->nburst - 1 || free == 1);
+				     dw_edma_core_enable_ll_irq(desc, i, free));
 
 		chan->ll_head++;
 
diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
index f2c2d5af1fff..8ed37e8a12cb 100644
--- a/drivers/dma/dw-edma/dw-edma-core.h
+++ b/drivers/dma/dw-edma/dw-edma-core.h
@@ -162,6 +162,8 @@ struct dw_edma_core_ops {
 	void (*ll_link)(struct dw_edma_chan *chan, u32 idx, bool cb, u64 addr);
 	void (*ll_clear)(struct dw_edma_chan *chan, u32 idx);
 	int (*ll_cur_idx)(struct dw_edma_chan *chan);
+	/* Called with chan->vc.lock held. */
+	bool (*ll_irq)(struct dw_edma_desc *desc, u32 i, u32 free);
 	void (*ch_doorbell)(struct dw_edma_chan *chan);
 	void (*ch_enable)(struct dw_edma_chan *chan);
 	void (*ch_config)(struct dw_edma_chan *chan);
diff --git a/drivers/dma/dw-edma/dw-edma-v0-core.c b/drivers/dma/dw-edma/dw-edma-v0-core.c
index c31fff095b4f..62141aa32e50 100644
--- a/drivers/dma/dw-edma/dw-edma-v0-core.c
+++ b/drivers/dma/dw-edma/dw-edma-v0-core.c
@@ -649,6 +649,15 @@ static int dw_edma_v0_core_ll_cur_idx(struct dw_edma_chan *chan)
 	return (val - base) / EDMA_LL_SZ;
 }
 
+static bool dw_edma_v0_core_ll_irq(struct dw_edma_desc *desc, u32 i, u32 free)
+{
+	/*
+	 * eDMA reports LL interrupts through DONE. Keep them at
+	 * descriptor ends, plus the last free slot to refill the ring.
+	 */
+	return i == desc->nburst - 1 || free == 1;
+}
+
 /* eDMA debugfs callbacks */
 static void dw_edma_v0_core_debugfs_on(struct dw_edma *dw)
 {
@@ -685,6 +694,7 @@ static const struct dw_edma_core_ops dw_edma_v0_core = {
 	.ll_link = dw_edma_v0_core_ll_link,
 	.ll_clear = dw_edma_v0_core_ll_clear,
 	.ll_cur_idx = dw_edma_v0_core_ll_cur_idx,
+	.ll_irq = dw_edma_v0_core_ll_irq,
 	.ch_doorbell = dw_edma_v0_core_ch_doorbell,
 	.ch_enable = dw_edma_v0_core_ch_enable,
 	.ch_config = dw_edma_v0_core_ch_config,
diff --git a/drivers/dma/dw-edma/dw-hdma-v0-core.c b/drivers/dma/dw-edma/dw-hdma-v0-core.c
index b2d35f0b7b6d..fb651a83f0f3 100644
--- a/drivers/dma/dw-edma/dw-hdma-v0-core.c
+++ b/drivers/dma/dw-edma/dw-hdma-v0-core.c
@@ -13,6 +13,9 @@
 #include "dw-hdma-v0-regs.h"
 #include "dw-hdma-v0-debugfs.h"
 
+/* Empirically chosen watermark interval. */
+#define HDMA_V0_WATERMARK_INTERVAL			4
+
 enum dw_hdma_control {
 	DW_HDMA_V0_CB					= BIT(0),
 	DW_HDMA_V0_TCB					= BIT(1),
@@ -417,6 +420,30 @@ static int dw_hdma_v0_core_ll_cur_idx(struct dw_edma_chan *chan)
 	return (val - base) / EDMA_LL_SZ;
 }
 
+static bool dw_hdma_v0_core_ll_irq(struct dw_edma_desc *desc, u32 i, u32 free)
+{
+	struct dw_edma_chan *chan = desc->chan;
+	bool needs_progress;
+
+	/*
+	 * Always place a watermark at a descriptor end and before the link
+	 * element. The first reports descriptor progress; the second provides
+	 * one progress point per ring lap.
+	 */
+	if (i == desc->nburst - 1 || chan->ll_head == chan->ll_max - 1)
+		return true;
+
+	/*
+	 * Use periodic watermarks when a descriptor exceeds the usable ring or
+	 * when more issued work follows it.
+	 */
+	needs_progress = desc->nburst > chan->ll_max - 1 ||
+			 !list_is_last(&desc->vd.node, &chan->vc.desc_issued);
+
+	return needs_progress &&
+	       (chan->ll_head + 1) % HDMA_V0_WATERMARK_INTERVAL == 0;
+}
+
 /* HDMA debugfs callbacks */
 static void dw_hdma_v0_core_debugfs_on(struct dw_edma *dw)
 {
@@ -441,6 +468,7 @@ static const struct dw_edma_core_ops dw_hdma_v0_core = {
 	.ll_link = dw_hdma_v0_core_ll_link,
 	.ll_clear = dw_hdma_v0_core_ll_clear,
 	.ll_cur_idx = dw_hdma_v0_core_ll_cur_idx,
+	.ll_irq = dw_hdma_v0_core_ll_irq,
 	.ch_doorbell = dw_hdma_v0_core_ch_doorbell,
 	.ch_enable = dw_hdma_v0_core_ch_enable,
 	.ch_config = dw_hdma_v0_core_ch_config,
-- 
2.51.0

