Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020112.outbound.protection.outlook.com [52.101.229.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A026B3002C8;
	Wed, 12 Aug 2026 15:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786550252; cv=fail; b=j2jLRp8Zm0nuhZvHVV1ueK1iwbbifhsRX36FpfrjraWa5zYWzB9vnc5LQRO19IkGl+fwKqCvPhtcp+PvBwhysCxOYDkUwN0/4htvYurq2dRAhNK9R+DgJxSobs3Iz2poGlogRoa4SYR8MkEc9l/7+9CaA0TahDafmuNiFbXSYf8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786550252; c=relaxed/simple;
	bh=4EvJO7PYu90QVmc80jjL+A6MWWAtwReJdIbPx4u/zpA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aRIMKDDYKcthA0zlfvS0brXw/KArKg54F3Cib4pwkz/B0vuIGWeYPlFzcFl0RoMo0raC6ciYTRQMDtC3uCnN6pk+exV0YPxsRfryqGVpjnFF28MoG6in7H817j5of94FQDwr/tcU+RwkkTpM87jgwdjNSr1TdUBnp7RRUiYVJAA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=hkskB0Se; arc=fail smtp.client-ip=52.101.229.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="hkskB0Se"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bxuUDkXTR/+NPgMUGRtKqEopwbXCrUGu4LvWSyVZLHtWPLC1uraSDl6JyEYy7CGOS7+x3AVIlZN8WOcGKqi8r2cmLh0qOqS8vv8fSR+p/3l+piARvS+0cB7Hdnhp92Vz4IgUA74mUzER/F3bzpcGOX6ZvKpABb6/Oh+XZWYxfzdsGj1VYpV0wMf56n4hFIvnvryNFJjHh9rI69wJAiP49GGa+vm7sVuWhcRAr//e41ntTmrXdzS9Slv0YSjwykyyhkDLtDk4SeuUU4eZ+vFsbiicwPSo40UMcQfGAfkD1lf5ZFrFlCyvMcgbAQlE7pXUAJ7RflWUOnvwZtNqqBhDcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N56QZWCdFxARArrJHmKUqw0An/HbFxiNWvpcQ3aXTnE=;
 b=FsziXVu92/vg/beIEtua0chvFsvvIrOSXT5kW1oTJfaHMXa9clfuTXpE8kWjp8z3nmCk/WoReqFTFodVWbBhEx2MNe4Jaj8dUIH0fzU21XldZ3OBWB6+gTZNkhgSW7u8Drsnmu2EFz+ysRifz89AwgOM64k1AhqBlmqYbON7t22jjpmNHL8Iv6WFW3Jsk8RnWGtLBVshiKigp2t0fz2Ue8HlUl7PNlMtdZxwO8Kolg2XEoKc1RP/CvX8IS7tsa3HVxZGMyWpfW5ejtp1jxHmBcPyxrfpIgO+6c1hvRYRGEnouQ1nzs3WDIYdnJaGVQiocW+dvnETjW93Qt5VCChWYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N56QZWCdFxARArrJHmKUqw0An/HbFxiNWvpcQ3aXTnE=;
 b=hkskB0SeHynMm3oa6ahODeURCKa3/2Jc2U7zPyeQNniiCap5ZD8PfSv964shuUfYpJPUgErlOvqqmscR20AOiy/DZsMo1CdPYE7b00FXVZGhNCA2EvMH7FpMLlUmyXpx6wVmAuLxpup+Mk8h5+5i0C1/DozSQIIjD58JEH9Pn54=
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
Subject: [PATCH v5 01/24] dmaengine: dw-edma: Add dw_edma_core_ll_cur_idx() to get current LL entry index
Date: Thu, 13 Aug 2026 00:56:58 +0900
Message-ID: <20260812155721.2807506-2-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260812155721.2807506-1-den@valinux.co.jp>
References: <20260812155721.2807506-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P286CA0102.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:380::16) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OS7P286MB7115:EE_
X-MS-Office365-Filtering-Correlation-Id: 5179e920-178b-4a2b-2ce1-08def88a6833
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|23010399003|10070799003|18002099003|22082099003|56012099006|6133799003|10067099003|921020;
X-Microsoft-Antispam-Message-Info:
	WQsKBwaW/OW46xoi126RGyhlYxn7SIYmnBmfogs2oTsqKlZzKoxsPIf3v+8Uy4oPgTZonc41GAXBhkvCEw+3p8fmp8ZMFAtgeWh63x25cWzpKIZ6ZvGqdWRqMIRI3jgLUVfPvczFoVQdU1atgIJXkt16SMhHnJ0PDyltSTwJODoI/E+IA398LdkpED4ZmSZVqlj8+QJnXg9LNn/NvZfH8+KpQ2PkMXJsiMQFm2EBz28gjMm4rmVa1tgGrFjDiiU/3mOT38thU04WnzBbK5dVtmvT0fBDKx90S07WFX7YubT0zp1o7EEB/ofHmkt7xyXbhhhheAlbbCcaiBmdwAdsvY7oE3lpQOkxVtl36BG/CTwauBy8/NtTLk507VQHL90hj5hDfuO9D30j/uIq83MvNobpPpToGys1UGIPEJRQTOZUchvfxgv1HhC5EmuDWF4Ms6a8BxvBscKs061VrpwvYMtuPpJxyj4KW53uP/wpXWZU1ggp2Fo3V3r6PkdHnI9sDv4dYJ+q7r66gW8tGxzgaPJQFAKc4qbBYCNoLkjDp9DEQ3dRRpfRPAxL4ezsY4QEV9GeNHmsL7GqVOKBF/xm46/UBHaAWQdjIbJvZtl6pmu5lV3LgTuy/1zmXJTFP781jxFzwczvG5xdQQHQzzWcgqdfgEpkMuqQvVEKJ5aKouHEEISdWMd0zXHU5lMk4ySFqgcXVSfypoZ4wmyeUnHU7A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(23010399003)(10070799003)(18002099003)(22082099003)(56012099006)(6133799003)(10067099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3M1dsZJLG53H/HoIZQogPXLf0pgYx4wXnPc1oRGmh/VMRQGSjHWersC9XY2I?=
 =?us-ascii?Q?3zgBdyCXZ99MmVP87UEZnqjItDSnjq5Odu2NN6XXGDqrcslCc4AV1GFov/9P?=
 =?us-ascii?Q?OSQw10d4fJKEWD3dKRFL72vYPWrKbsQURyEtH6pm5EQfitnB3FAMoQPDCJw0?=
 =?us-ascii?Q?jJKnBICQusEsD6lnri8jWDlMU9FNlmt1TnKU6HNmpe9nDCAmEHe17kNmYF3t?=
 =?us-ascii?Q?IQ2xogbiwcj3FW3tI++0r4+Sms5KS+u1zCeAnkDEp+3kRa0C5NNxzx31TuKz?=
 =?us-ascii?Q?O5zg1xh74x7BgttsMeoWJ9dGRyMRks9DFrw1P5Z1g3uBdb3mug8nfNvNo76b?=
 =?us-ascii?Q?x9GAj5+84Rd07Nupw+YfV0WxdESweuxuv9SUmFsWLSTYc8+21LYAWYKVNnHk?=
 =?us-ascii?Q?jH84Y369n0q+isyQIDEBrm1HvxKruaBPe6So5DLSVAGdBGFlM+cKxFK29JXg?=
 =?us-ascii?Q?Ot/N27wDXRJTOwXbP0bsn9IxE6skE5Ayne9/ehKyAuxIX10JydlE9wVk9FAG?=
 =?us-ascii?Q?Ku5EX05CaPsZbDrvOyN0w7112n1tkzFssj87ZbGh823hacBROheze9plyWOt?=
 =?us-ascii?Q?Qf/NFr+TIjGYTzn4Rw9lNpE/LyjUs9Jv0UWii+OviioRk9zbtOu4FxgnroyG?=
 =?us-ascii?Q?v2PagRLBxKe+oioGtX2ctu4uVujZnzfFwaMXLIruWUMDzlTWAMjzqgSILS8U?=
 =?us-ascii?Q?xwrulaHG0wEM4drDuEppHsNXLNUAtIDYH3YD7bQBhkaBPV2bN+u4frLw/F2S?=
 =?us-ascii?Q?o2Vw3e2sfmCtFeHzvZBBHyrvo6/aHMTzwHrxEVGY6RO2ArZmThJhBn541y8D?=
 =?us-ascii?Q?O8FB2YN2K1ZxL6W9/AuJXbVwjidTGt1VGQyzu95AejsPd9cBC08+tAUNNXy0?=
 =?us-ascii?Q?e/spC5iR6xfUFZIHCXSFDJkUVMwb2rPO9h9RY7U1vZP+1nUlHO0RiQfHUoI+?=
 =?us-ascii?Q?UB9m6SsuxLItBgbH6O1pMK4OKTJ/kiW+ZjsTXBgqd5Wu/S9azJTU8ZYLFjKr?=
 =?us-ascii?Q?ZxzkAz2hIZDmDKdv8YhydeOBIyc7ghQjdbT5paYZLjacj1AaHYp7UEaFOsES?=
 =?us-ascii?Q?dEdhiNZhucOIOO0rskQlTLse/q/0C8AC3wVSUuHoSarXIg5QvNCgXkHMUTvi?=
 =?us-ascii?Q?pFyZhXt98svmgwd0CC9fI0yUQcdsiLq0SPtAvlN8tRJHMq9s9OX1m5Rb7BY8?=
 =?us-ascii?Q?dnlYBVV9V3GqVTjw2USKWOnwTnoeqlJmE3mJEaa05UJfv8CP5g57HtwNFipi?=
 =?us-ascii?Q?w54b8ROOJKWOxVjG70r/8maoGPf16LVfCiub4tU9sMj6K5vFk3QFwiDfiLfY?=
 =?us-ascii?Q?7FpsoTkkkoSucf8O1//I+i3ECZ+9DCi30lZ04pqgDgaCqMKJHICZDh3aEkjz?=
 =?us-ascii?Q?VtHZ1QrDMlbQSEhOH8Nd1xgXJ9e3620ZRtlJKV1ieq3jMVgFZenE4ZYvDm/J?=
 =?us-ascii?Q?yfAGg2xp963Qb7FjNJ7gP4qRJkvqAwf15j3iXOv3r5jUAOjqFw5VACa2GJSO?=
 =?us-ascii?Q?MVyEwb/b0HmRk/DT8kYu33tpmLuqABYlPm215phF+sca1oFe163SzBp+OOdP?=
 =?us-ascii?Q?X/mP35K1tRZw9WGE2X6/W/lbl3hhWgwq5GVrErQ4ReQKkfWrL0Rr/f1EoEnm?=
 =?us-ascii?Q?QK81bK76n7ChYAX916USM8eP1sWrr7xVWtYUBwp5iwg4K3FK8+E+KjBYPBaR?=
 =?us-ascii?Q?RioeaJTj5Ql96rJV5+a0eAWSwc86jD85k0CyQyHnYLoeJbB8qmTR1vwkG14D?=
 =?us-ascii?Q?3lxzfVOxpuPkICcmKGgsFgz0OSPM/3yFvFmhij2Z811KP8UbKbbo?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 5179e920-178b-4a2b-2ce1-08def88a6833
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 15:57:27.1096
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MfHCabYO6o0vJ7lNRVF1euD4fWom9R5jmipYw8yrc42HPGxikbsD46SfQPD0EUVIUUZqP6uGNOtF2tSC8bDzCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB7115

From: Frank Li <Frank.Li@nxp.com>

Add dw_edma_core_ll_cur_idx() to get the current LL entry index and
prepare for dynamic addition of DMA requests while the DMA engine is
running.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Co-developed-by: Koichiro Den <den@valinux.co.jp>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v5:
  - Reject an all-ones DMA_LLP value before converting it to an LL
    index. (Sashiko)

@Frank, I kept your R-b tag since the v5 change is only a small validation
check. Please let me know if you prefer me to drop it.

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

