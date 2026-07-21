Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11021086.outbound.protection.outlook.com [52.101.125.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308B9408634;
	Tue, 21 Jul 2026 06:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784615333; cv=fail; b=UWTn7LtCVR/Jc7j9KBD194g5VgQaHv3IPn32Gp0ZiDzQdev9RXPf6kUpRWmGfwGzj3UL+OS0a76jhNMLvxbnXqqRqIieKEvDHLrTbDPf891HsKhCh/0wKIfH34DbDG2gb1RyfzQzUhqGoQNaBmnf7FixfOEdq9jg0IK30dxH2fc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784615333; c=relaxed/simple;
	bh=PAt4pfnJcHvT4R+A/ut4rEkAWxYwf3eze2VFw6BPxy0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=U8Z9e/NnhamlWY+W2e9T6RlpPENRWwyPnzDsnvlxa8Zv7BHpD/2ufQFpaZHi/jQ68QzMhx7rsWSYxnygea7yl7E2fJ9oUb2dge7+zDEceedLZlTWhLqRfANyITWyy8gabxiYNAd8avUdXz3qEVWDHHSb+ulf6c+oYnJ3fVks78c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=P2yyDi2/; arc=fail smtp.client-ip=52.101.125.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="P2yyDi2/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wtwgwWG8Ksrpzb70c9IOxbSfJCePs1PVQDDlTtH4SJvK2BDGuo797z3bNzDiiFY2cAqWQ0Ag5YG9LhIMFSaFzT+CB4vUar5h6S4r7D2EVI79Peeewl1BNMGN+lht8XTfCGgZ4Pmdow1gpSyJ6sBWMR3LAszBcDlQLoWhXctzPbkgXU4K4tQDmPeg9c5gBHLfMH1akL73PtunKsZPzpiJeG6pYwgdNUclEYN62M/fW7oleiR9ERv2y1IPnL4NO9n75L9vobVYW0zu4cox8Oh4qVc9i6MZtQbUq58LifLXJcYtjCgN+uqs1Cl+bztHvhQy8A/3As5y6a2Ma+yyUai80g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bwxlqEG+JvJizT8PynzxmLR3OzSqzhFOBNc3N//PYm4=;
 b=ueWOM/0ZS8M1Q6kWTTYdc4vEWGGxzSrULVI5ST6ZmWBNPjcC89wfzsE+9u3IKIHHpu3rt8UZPUJ4VI7pOfDxvmMCQlYNgDDj5jfeibcFXym8ia1cOVvfVZ/e7CtXA1ci16liYtncJoKqwSEblzWOoXTGcfySP8SQgBysmxl3U389FDHvCRgx5w34h6Ro4IZ4+GXO/ArJlVvtyFuBsc/3MkdhIa73pTqNgEk4XdyCAFtOGhKxIeElG/nnG3sF6ffJG+jwLnTm59mnlaeSBOR3/UelrYBM7719QI1rNDPJxsjurWxdqQVQ4qGAeUr+f0yk++vVMldSzuheBPR2PGHH/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bwxlqEG+JvJizT8PynzxmLR3OzSqzhFOBNc3N//PYm4=;
 b=P2yyDi2/H8chDpXzj7/pgcH20lZrMPwtbnRg7McQH4lkA42Me+v63UyX76qsksJ5eX6XHbYMuuPDXYAYtgUjHbus3y89/BmWr3cTiSN3HcwYhvec6gJX0Q62nkiQ4FCHouJbh+s1+iCp/2NqCnC7bmclK++aNYAgbc4TjDFvDh0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OS7P286MB6796.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:432::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 06:28:28 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 06:28:28 +0000
From: Koichiro Den <den@valinux.co.jp>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 14/14] dmaengine: dw-edma: Program endpoint function numbers
Date: Tue, 21 Jul 2026 15:28:15 +0900
Message-ID: <20260721062815.4117887-15-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260721062815.4117887-1-den@valinux.co.jp>
References: <20260721062815.4117887-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P301CA0059.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36a::12) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OS7P286MB6796:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bb9eb1d-474c-4eeb-7da7-08dee6f1470a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|10070799003|366016|376014|1800799024|56012099006|5023799004|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	msBBzdLbjjqb4ENXdzQ7sD6ty8saW5cqhi/bD1BsFKpP2aM9Am/o84CxG+j3Hkx3VnypBz04GDTEXWi6NVG6GTqxsWv2GT4bjiN+zYTD8v8Bn2ibcaqrKLBdCe7tuX95tlg6aaLIPpgOTIGYW9qva60jonaK56r1oddRv3TvkCIQcKiG/f8iCuOJ5MlSZ8KXb1EiN5CCh1v1JWTmrtV0gBzX6z2oRzcsuQlpZNI8SCuVbKbeQgYwwaeP9e4EPewZ0mpVYqCqpaZvpCWLPubvoM/DcoDWt4moBTlBf2L/Lsp/Rv7WBXJoxez3fAkzD/iNt/eeVx3mmWGm2mcLVw3eYfdPs62ze0qOpOi6U5hmMsMTDS066as3emWQok75BBGwJ/TzqGnThnyoqC/GRlAbcSk+pkMWfLz3CzGVqUG9J2Y6nincjnbKFQFTLGDB9K/lkKWI6El6HhkpjmMMmd7G3P48rRezWHZGxb18LhRuKBpIu377pnsQhvWN9P4UAnyviT5MkkKtbdde7BSv2k+i0qHUn4Z//L2fcYagfQ3Vo9jbH19/YlKlCcYZf7PIKmtspReucs8XmEHx2YCkswDM+dGa9WftNBQx9ozBLY+WcDcwd2tHeMfIV1qlcSMQaYCGkZAQ7xzhEgyMX9FmjB+3Gn/iCZfgGXQn2LC9J6HveWY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(366016)(376014)(1800799024)(56012099006)(5023799004)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6ls7oq/TwzVXuDZITHijlhVcVyLtTSAFGM8W+jXnYTTBzFba212PoTLq32Ur?=
 =?us-ascii?Q?tinNS/Ao+i+PP+LSEmuD8albsDNmOWGCWjRZVQJfRn9jcQhiuz1X5sx5gviI?=
 =?us-ascii?Q?Zwh/T5URKj/DzIP/6WAkF9lKvMMQdisCmsgkH5PhJhPbgSk+gf3QcVSWXKAo?=
 =?us-ascii?Q?HaprXibdOrP29DoXFaA4EywgETJvcN+HPFmC5PaGB2FSA6WVxVJ9ZTSmnvoM?=
 =?us-ascii?Q?mEvamcGUAOwkMjZObLynZpRiLYvLsoQOOlN5uHuUZqd5fzIgvv3mU08KoeX3?=
 =?us-ascii?Q?GGtvJqeejJS2P2ZAExeXG7WOA3rdKYtC2GqPxEF4ltL0418hEKUwrJsCyBTX?=
 =?us-ascii?Q?NsarYOppW98Z4KyCZ3MiREm1I48AopsMxkPh98E3uFOCKwItYvj9Z3NyadZz?=
 =?us-ascii?Q?qvSaxEaZd/aL3YcNhxXwS5XOPcl0IGKZnV3p0cbzFl2Qx33HUS2RQ9yo/Rcs?=
 =?us-ascii?Q?8MqY2RaZbEKvXEjOlUBb9kf2CxUk2yCwZDGV4I+ynpEeX1z9rAmz59p+0khf?=
 =?us-ascii?Q?SZTx44JArQUEe6Iuk73ed1D00xazOfyRVjLQxQ8rhk4eHmnBzqiEo9/46B6a?=
 =?us-ascii?Q?1+2XWHgKGiMwWCkbfAp95CPiLmBRz+NoBxC6BGCpGuTI+8G+zvsecFHEuU5t?=
 =?us-ascii?Q?jLtdSyCMMkOI7HTE+Tz4oqB1g+O+oIYLPEP1cgWLIxaW4xyTLYmR9Fmztl1h?=
 =?us-ascii?Q?kkO8iP6tt6WfQo3Jfr5qIefLq4HCeABwENA5zLv4joD2d1njQ5qui2PwCMg4?=
 =?us-ascii?Q?1gmJmtoj3+9VCTUcEU3COtESZAYO50nhwxoOK2PNDw5pOn717ZJCjYctbaPG?=
 =?us-ascii?Q?My7EwJuKf+XKOPAzQ+BxPN2e+OvHypZc8cK8gn8JP7SR5RKYIv9k4wUy4BGF?=
 =?us-ascii?Q?YEvXy0OsTNn17fVjf5M/gjjgNWWm6sr8gR1jD2+KGPr87HxaLLeBlLFJy7iE?=
 =?us-ascii?Q?bO1qEJpycLUPHGAM39HvusFWMq+kDiAlyFyZo1EiQjevljm3autrtn9u+Iwg?=
 =?us-ascii?Q?tB0uJgmXhwVo+BVezzh1l2GN5UOszqPFjaic0x4CZ8NLEToFx2CgTvv560Aa?=
 =?us-ascii?Q?ESYyhAzBat3ASjYh43QziJ87/H2zhm4bwOj/i3pMXj6vlT9KE9+doo9w63Ht?=
 =?us-ascii?Q?gbCt8y99is/gN4q94NDj3fb4fNrO5puSLyyEFRWQheNnh3EDQgJt2vJZ3uWb?=
 =?us-ascii?Q?OArp6RDIbBowuCt47yP9UMbCipKXphV3BhKcLneChefB3A4rXxyoiP6jJDTz?=
 =?us-ascii?Q?Uia29uIInGiOiSuDQLDzJ8k/eY58zL8Jk8GwF9p/VpfpZ+nzpABitAFr2UdU?=
 =?us-ascii?Q?7mHPYsBTdY/ESZp22kTi0Kro2N6poURGvNHTDSmG2UHRR3UWjHI2E5vCqZWJ?=
 =?us-ascii?Q?ZgTH+93yjnMd03D1JlYRTVRAOt79iKoF6Zu925qchK7JJMhnYaL4STmgcDhS?=
 =?us-ascii?Q?iMRObEr0+pP+MsW8E/j/bc7ExXM/JfPynxYVPgymfksqCBLFOVyZCnUPwqFx?=
 =?us-ascii?Q?sBMqVeqDOwBOGCbhH9vY6voIN9DXxud99HdqQ8meyW9w0hvnzE404BU/jS0B?=
 =?us-ascii?Q?j3sh626+xZQ8VP5UhmQgdNkf42+pJM0VYwKXqZm5qzjJ3M9Qv+KhP/3lJiD/?=
 =?us-ascii?Q?+n3C1TwrTNh+zCp+EQWicN8w8whxMf9CqxRgRoQM/fYEhkKYQtvRo+YmrPTD?=
 =?us-ascii?Q?Lh9cY9Mf8T+Ulc/0sGiXYlKCrbRkF3MwybD7FET69IGPjRtMn1R661TxABK+?=
 =?us-ascii?Q?cgBsq9oEApCk/JBPNYYi5OHnbBo4Vng4u19g6gNPMVKnXSKWR2pw?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bb9eb1d-474c-4eeb-7da7-08dee6f1470a
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 06:28:28.7172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QpDuA1Vr63ZQAzgfnJ4kbE1wGECQVlQV7S1rnvQdSxIbQY1H0kMwTpSOaWZO0RW9IuvO/fTpJKiR9lkaXLHRGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB6796

The eDMA/HDMA transfers the driver issues carry a requester function
number in their TLPs, but nothing ever programs it: eDMA v0 leaves the
FUNC_NUM field of the channel control word zero and HDMA leaves the
per-channel func_num register at its reset value, so every transfer is
attributed to function 0. That is invisible in single-function setups,
but once the DMA block serves a non-zero endpoint function, its
requests must carry that function's number for the host to attribute
and translate them correctly.

Record the function number in the chip data (PCI_FUNC() of the probing
device for dw-edma-pcie) and program it per channel.

Endpoint-local chip instances keep func_no at 0, so transfers issued by
the endpoint-side driver remain PF0-attributed. Delegated channels are
programmed by the host-side dw-edma-pcie instance when it takes over the
channel, using that instance's PCI_FUNC().

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v6:
  - No changes.

 drivers/dma/dw-edma/dw-edma-core.c    |  1 +
 drivers/dma/dw-edma/dw-edma-core.h    |  1 +
 drivers/dma/dw-edma/dw-edma-pcie.c    |  1 +
 drivers/dma/dw-edma/dw-edma-v0-core.c | 10 +++++++++-
 drivers/dma/dw-edma/dw-hdma-v0-core.c |  3 +++
 drivers/dma/dw-edma/dw-hdma-v0-regs.h |  1 +
 include/linux/dma/edma.h              |  2 ++
 7 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index 1a5853531ed9..455c4cb5ee49 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -931,6 +931,7 @@ static int dw_edma_channel_setup(struct dw_edma *dw, u32 wr_alloc, u32 rd_alloc)
 		chan = &dw->chan[i];
 
 		chan->dw = dw;
+		chan->func_no = chip->func_no;
 
 		if (i < dw->wr_ch_cnt) {
 			chan->id = i;
diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
index bd3d532ebc89..f6a5ad317567 100644
--- a/drivers/dma/dw-edma/dw-edma-core.h
+++ b/drivers/dma/dw-edma/dw-edma-core.h
@@ -70,6 +70,7 @@ struct dw_edma_chan {
 	struct dw_edma			*dw;
 	int				id;
 	enum dw_edma_dir		dir;
+	u8				func_no;
 
 	u32				ll_max;
 	struct dw_edma_region		ll_region;	/* Linked list */
diff --git a/drivers/dma/dw-edma/dw-edma-pcie.c b/drivers/dma/dw-edma/dw-edma-pcie.c
index 64f2a80072bc..9f237ba916de 100644
--- a/drivers/dma/dw-edma/dw-edma-pcie.c
+++ b/drivers/dma/dw-edma/dw-edma-pcie.c
@@ -473,6 +473,7 @@ static int dw_edma_pcie_probe(struct pci_dev *pdev,
 
 	chip->mf = dma_data->mf;
 	chip->flags = match->chip_flags;
+	chip->func_no = PCI_FUNC(pdev->devfn);
 	chip->nr_irqs = nr_irqs;
 	chip->ops = match->plat_ops;
 	chip->cfg_non_ll = dma_data->cfg_non_ll;
diff --git a/drivers/dma/dw-edma/dw-edma-v0-core.c b/drivers/dma/dw-edma/dw-edma-v0-core.c
index 13e69ce6c41d..abc1bd4c0be2 100644
--- a/drivers/dma/dw-edma/dw-edma-v0-core.c
+++ b/drivers/dma/dw-edma/dw-edma-v0-core.c
@@ -26,6 +26,8 @@ enum dw_edma_control {
 	DW_EDMA_V0_LLE					= BIT(9),
 };
 
+#define EDMA_V0_FUNC_NUM_MASK				GENMASK(16, 12)
+
 static inline struct dw_edma_v0_regs __iomem *__dw_regs(struct dw_edma *dw)
 {
 	return dw->chip->reg_base;
@@ -160,6 +162,11 @@ static inline u32 readl_ch(struct dw_edma *dw, enum dw_edma_dir dir, u16 ch,
 #define GET_CH_32(dw, dir, ch, name) \
 	readl_ch(dw, dir, ch, &(__dw_ch_regs(dw, dir, ch)->name))
 
+static u32 dw_edma_v0_func_num(struct dw_edma_chan *chan)
+{
+	return FIELD_PREP(EDMA_V0_FUNC_NUM_MASK, chan->func_no);
+}
+
 /* eDMA management callbacks */
 static void dw_edma_v0_core_ch_power(struct dw_edma *dw,
 				     enum dw_edma_dir dir, u16 id, bool enable)
@@ -463,7 +470,8 @@ static void dw_edma_v0_core_ch_enable(struct dw_edma_chan *chan)
 
 	/* Channel control */
 	SET_CH_32(dw, chan->dir, chan->id, ch_control1,
-		  (DW_EDMA_V0_CCS | DW_EDMA_V0_LLE));
+		  DW_EDMA_V0_CCS | DW_EDMA_V0_LLE |
+		  dw_edma_v0_func_num(chan));
 	/* Linked list */
 	/* llp is not aligned on 64bit -> keep 32bit accesses */
 	SET_CH_32(dw, chan->dir, chan->id, llp.lsb,
diff --git a/drivers/dma/dw-edma/dw-hdma-v0-core.c b/drivers/dma/dw-edma/dw-hdma-v0-core.c
index 8d20bb028b52..36ee72efcd31 100644
--- a/drivers/dma/dw-edma/dw-hdma-v0-core.c
+++ b/drivers/dma/dw-edma/dw-hdma-v0-core.c
@@ -345,6 +345,9 @@ static void dw_hdma_v0_core_ch_config(struct dw_edma_chan *chan)
 	SET_CH_32(dw, chan->dir, chan->id, msi_abort.msb, chan->msi.address_hi);
 	/* config MSI data */
 	SET_CH_32(dw, chan->dir, chan->id, msi_msgdata, chan->msi.data);
+	/* Configure the requester function number used by outbound TLPs. */
+	SET_CH_32(dw, chan->dir, chan->id, func_num,
+		  FIELD_PREP(HDMA_V0_FUNC_NUM_PF_MASK, chan->func_no));
 }
 
 static void
diff --git a/drivers/dma/dw-edma/dw-hdma-v0-regs.h b/drivers/dma/dw-edma/dw-hdma-v0-regs.h
index 48e40efceb2e..2124c162a62f 100644
--- a/drivers/dma/dw-edma/dw-hdma-v0-regs.h
+++ b/drivers/dma/dw-edma/dw-hdma-v0-regs.h
@@ -24,6 +24,7 @@
 #define HDMA_V0_CONSUMER_CYCLE_BIT		BIT(0)
 #define HDMA_V0_DOORBELL_START			BIT(0)
 #define HDMA_V0_CH_STATUS_MASK			GENMASK(1, 0)
+#define HDMA_V0_FUNC_NUM_PF_MASK		GENMASK(7, 0)
 
 struct dw_hdma_v0_ch_regs {
 	u32 ch_en;				/* 0x0000 */
diff --git a/include/linux/dma/edma.h b/include/linux/dma/edma.h
index 2ce9d2d49aef..3c8e2ef9dee0 100644
--- a/include/linux/dma/edma.h
+++ b/include/linux/dma/edma.h
@@ -117,6 +117,7 @@ enum dw_edma_ch_irq_mode {
  * @db_irq:		 Virtual IRQ dedicated to interrupt emulation
  * @db_offset:		 Offset from DMA register base
  * @mf:			 DMA register map format
+ * @func_no:		 PCI endpoint function number used by DMA TLPs
  * @dw:			 struct dw_edma that is filled by dw_edma_probe()
  */
 struct dw_edma_chip {
@@ -142,6 +143,7 @@ struct dw_edma_chip {
 	resource_size_t		db_offset;
 
 	enum dw_edma_map_format	mf;
+	u8			func_no;
 
 	struct dw_edma		*dw;
 	bool			cfg_non_ll;
-- 
2.51.0

