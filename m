Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021094.outbound.protection.outlook.com [40.107.74.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27FA9483BFE;
	Wed, 29 Jul 2026 14:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785335449; cv=fail; b=N6/W4ix6dRcZJaZt9+zeSsg9uQSPkQoAS2fiEZ6NXpLpZ0HTTFyZhUUCn9+bAx2zTXQ3k993q9OewFPrIjqJRm9UQ1T7vT9BXBeVgBBcb1HWIPp5NQavjgrQNcAtvUkHEdsp0Bo+607KZKAHT4opp4M3q4CE+cX7r9jGgAEY59M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785335449; c=relaxed/simple;
	bh=UaW4nxNyNwymn9ApGorjQYUw64k1iUshF2180I+5MEE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TCa3ghGDYOPJ8gc8hRypSztXjtVt3IL72Y+L/D5a23pU4c+cwMOIlVjCBVr75aX4ThAA/5poDmi9ckMvCCSR4/oUAM30NFzahqlWYn8OyHbFMd3Mkb/s+kaBL4p1ZjLN0m6vCTgI3Gurb3IgaBwJZbdwZClruI6P+Gvi03nG+dI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=jWb1MfIK; arc=fail smtp.client-ip=40.107.74.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="jWb1MfIK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iv+rrZKyW5ISxafWp/VMys6G1VXi7OYRRhOLlmbl9Ykex6u2M1/P/kisJEI6VedeMsqKgTYR5DsaULDI8kX/5OAkNc8rK39ZCi8AQYanzM/VNJl9Q4s7T0R/JpXeKHMcjxvpaSh7eRzMf0wObi2G4ibtNajaLyKWfyYBPtG0xj/ubyo4XVNOMemt+SJkPeDQxTcTJfK9KN5hNnKfA4LiZeBenHcKCrjGdNdHvihhipM8D1oBtcLxNuPZaxVJhzm2rhthbDt0XZ6URodCsEFiTCeMEmi/VMDc6mUBnDQ9sDHN8uOGW8DMRvLOc5GyB3/Ej3Zsah3j0CLvXDPEaAbrQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=heikii7MHSyQIh9P5cOU1Mzr1KBiMkQrWDdcxE5LZTk=;
 b=w41W3KAcYaA23nEIuKy0t+hHBFwZdb9LlKOAhkS8wXv+6VbE1uO1ONbbjCCZa4SDnPborMDvr6QvURzu5pG7B1e1nAx7+4VRdHSXLwtWwWi9+ElTy7zxyEkAGSd3ZTkjtTwxP1I4tg3zk/3TNw34p/A+5tXCPWmlbYnSGeuZis5HZBsfeNiRUxmerLBcygVW6tLbpFXXd44YKROo24GvUQiBajKmDn+EDjj97qMazkB3Z1wlx8Q/junFPsKXWa9Cep67/WoRO8EjuEErIGYKcpJrJkX/VHzaGhMBXcBhQjlIwN9Ix1aIWXWB1gbDrRWyCWpqJ7LNWT5eMrcWDxaE1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=heikii7MHSyQIh9P5cOU1Mzr1KBiMkQrWDdcxE5LZTk=;
 b=jWb1MfIKqDpd5p6I2+Nw4TFJJqcg1V9h1biMamavf/Dii7UfbwtEKTFF6usgUgVruTr7WNFwXDCyQgEjYtTvD338Y2h+8V5aC9C7R+BOXn6QZ6JMiQ6JzqVkFFsSdkIQBt0p8RvuwNQ+DSMFIkaxg2e7dlm6VEVVxwW0xvMAIaU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYRP286MB5289.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:112::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 14:30:42 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 14:30:42 +0000
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
Subject: [PATCH v4 01/24] dmaengine: dw-edma: Add dw_edma_core_ll_cur_idx() to get current LL entry index
Date: Wed, 29 Jul 2026 23:30:13 +0900
Message-ID: <20260729143036.3087722-2-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260729143036.3087722-1-den@valinux.co.jp>
References: <20260729143036.3087722-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P301CA0102.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37b::12) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYRP286MB5289:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e94f9bd-71c6-4c04-af83-08deed7df823
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|7416014|366016|1800799024|23010399003|921020|18002099003|6133799003|56012099006|10067099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	fV/OsvpIzfpQWPaYUYulScHkJ+1s5sKr6UAxZKfWaMstBSDbDsXJaSzyoHeQ82FkJAHWY1Bvlql7mbcbzIYlSVzFfqu3+REDUzjmrFMjWX2rww1bfi/O7EEXOjkZsjW2luR6zoI2zMOZoAWL1E8x5AcABdzHTBOHB9SzmetYi3geUsJj+ptNdEBlPuDqHrq71lnsNSTr/tpSn7O5d06if9d4As/mztCy8T/0e6g7tsTmNs2UnYccdxGyW3rfzxxXqCIGUJ3lhq/D0aPqdxjZHhRuw0TYuEjhjka29SEUwxBN9kwnW2y3X7Qd4FV9GYKU0iNCRhJAu/4OD99sV1tjKt/kuPobzOwhSgNMzhtNhxm4Q7q8oLmoTLKEJhkeNZ4eR3z3UdqvYMIdT3tWvdeRlnyElOFaf+vXRl99m0CCLIO4n4ZEpPTjeN1m8OWUXdtM7LQxF6jYvV+IFXjBq9l4ovesXnREYc4mNzCWy5E8w+y8Rx0z6KzL0ETxMH/RfjRtZwgjLWrtfDdGPs2tIPCcfkIcRwYxPzKymddav5ihRQM4yzycWxVFrQsRluPGY1Z11b9z9Em/f4xp4bKsXdKSxOYlfD8Md+G3F1tmB41f4abYdItxHzGdHMcRvSPB+RmPPSF172xJSmcwVqkHdC6a2GZMYTs9rbW/NhbgyNx54k758L/NsK0wRE0MdIMliOXgGXkLwPWBWxVz2qnrv4lODg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(7416014)(366016)(1800799024)(23010399003)(921020)(18002099003)(6133799003)(56012099006)(10067099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?y2kex52zIvDhS5+uph2JmYZCijSh21HtHsnn7fdwWMcjHEAnLg8qJ+bBFpVE?=
 =?us-ascii?Q?ki8sg0BTclpaUqSlSF9zo16UGqqvactVptBubQ/wGGkeFmzOr/IlWaVnY4CL?=
 =?us-ascii?Q?9nUh4BECgCY6JUe19qTg+ucTOcMy/UQkiXVjH4i4Q9TFwbhUJPpk94FlXaCY?=
 =?us-ascii?Q?D4QDgtWEmQTt37nj9QsH+B9htfGztiyKS/XzPP/Q50JGTOuvWrLhLfpSpGj7?=
 =?us-ascii?Q?eQWh3KGSP7t7Pcegm9hYw3kcNY+ErJNrq3a34cCgbjmhZi8rpVciHDOSxiom?=
 =?us-ascii?Q?6VhKlxL06GX3HTdBRiofPbNtxJxDrav40pnNY10kCaiRT808sab+Icr5IYkJ?=
 =?us-ascii?Q?K7bH/wZoNIBLgeABdRx2WXUuZsSYESVsXQgmzFJHWPOUFmT+P6Upn8xCPoDh?=
 =?us-ascii?Q?wg2yqsB5Dwd+CPmCPOyRv13G2Xl60PBE2fn7Wp4TMzCW65mKVaSIPg61nQXC?=
 =?us-ascii?Q?dK0q2UIuORoFwceTf/6EXOxJ10EJ4lO6Bcq9m4zLpCEN4C6iBG4wEqbknY/a?=
 =?us-ascii?Q?UW64QC/IV7wE+8SVg9Iv9BmjXaJjLK94oep9l2oGzKZ+Vl2gIeWW3EJpvUm6?=
 =?us-ascii?Q?QCmiuC5VBj8bWAKXd9dBXkCsOoLER+e2AD/MrtgmCN/fbkgcsXGsO9NU8fsm?=
 =?us-ascii?Q?irDDkBLQIqiwsrMfnWTczGhPKAOJb0VBhJLdiLRB00EiQz32iTz6Xra1spd6?=
 =?us-ascii?Q?mmAkXQk57QnUF14WCZ1ivUuiWFAy8iagZcrl7HK4Ea2D+OwD5BBYjlMUa6GQ?=
 =?us-ascii?Q?lI5wVMWbQKkwjqw/VDV+4nwi1vhyvgNS64C5YZehAmhCu3ugs+IRxaIfZIFw?=
 =?us-ascii?Q?Nb6KGYT6kfngYRCDmpxydyhdr/r+EPQueqX6T1+8Mqv9q8+aLTHG4MfvHW6n?=
 =?us-ascii?Q?QBH1OSVES/BBLUuNVUNYwtjRP1ARbPYJOK/HD0bqqbGuOkYJ80X8ncRiQOQX?=
 =?us-ascii?Q?S08f7ndOMkiE5oberzZQ657IoJC7/fy592nFV+nbChXjp/oOHEdgJAdevBAh?=
 =?us-ascii?Q?D4wD0UXOwT9GZ1Jb0oBeL09zdiB+7XDghyPRJ8QVTQyEhQy+Vsra54FAsnS/?=
 =?us-ascii?Q?et7RN8NNCW5UgoV189mqMilz12ifLJ8D5krjszSq9ZcDSj+VSTdbjNjoDBwI?=
 =?us-ascii?Q?t2YyROXz6zRPBqTY6uxx9u9SrTfnCDwbhb2oL42UT0aO/4yR4o3eX6ypWhgK?=
 =?us-ascii?Q?u4RZ2lkOzQIHgoAVRbxRHkMhzWAGC0ztqtLnkngH7HAqj3X5fBUpgfm8EXzA?=
 =?us-ascii?Q?hqrCfXufgYHTgU4yKxf2oK2uFd8Q+rPeA+uW/q43FEOKbINgacHkrZiVeMI8?=
 =?us-ascii?Q?t82emmDjdNDQwL1JEHOEPEfVlZoKkQKrs/ZGPbvgbvwdLIeSDWdq9U0RzJcJ?=
 =?us-ascii?Q?dqxPitC9rQ/q2IImjADBoCy3fN6TO75bfWUI/oUxX/pREODP5PW4En1fBpoF?=
 =?us-ascii?Q?7XaZK2YIb1Hb2rbaoiozzVUmYz0PFaarBO3azPh7BjXkPBnTAaN0tYd+QUO5?=
 =?us-ascii?Q?RXXPYYsNLtXwg7zYEP3zEdQ5fZirrm4QgHk99hmW8eF//t3FiQycgOT07OOp?=
 =?us-ascii?Q?CUDWXI8eCsBN+VrtQ55/uULM9uOKjLEfspx6mJHrnO7aY9z2zjh3VD8OSX/v?=
 =?us-ascii?Q?HR6u6hrDuUOfN8/bd9jx4/1T0BA36wu/McLm9an+3yarTNPTXkY+hA3Pxvui?=
 =?us-ascii?Q?ZX7Tlz6YhLIZheGReKr1boHoUYI/Q3Dxk0yRc922EIzRrWl6JdHl460tErbW?=
 =?us-ascii?Q?vHwRoShtUT37ZT+kk5tqPTdMUNcGwjNNpcrGsim/+BtSglab8+Lf?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e94f9bd-71c6-4c04-af83-08deed7df823
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 14:30:42.3526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ymE0C+xT9TJJWb4OgwJAQL2+rinnQOcEiQQ3lUOdmm7U1lF94DC8LspId2EDaiKi550GTTk45PNtDeQ0rrpRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRP286MB5289

From: Frank Li <Frank.Li@nxp.com>

Add dw_edma_core_ll_cur_idx() to get the current LL entry index and
prepare for dynamic addition of DMA requests while the DMA engine is
running.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Co-developed-by: Koichiro Den <den@valinux.co.jp>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v4:
  - Document that LL regions must not cross a 4 GiB boundary instead of
    claiming low-word wrap support. (Sashiko)

 drivers/dma/dw-edma/dw-edma-core.h    | 10 ++++++++++
 drivers/dma/dw-edma/dw-edma-v0-core.c | 19 +++++++++++++++++++
 drivers/dma/dw-edma/dw-hdma-v0-core.c | 19 +++++++++++++++++++
 include/linux/dma/edma.h              |  2 +-
 4 files changed, 49 insertions(+), 1 deletion(-)

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
index abc1bd4c0be2..7b9a95ecedbb 100644
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
+	 * LL regions stay within one 4 GiB address window. If the low word is
+	 * zero, use the high word to distinguish a nonzero boundary address
+	 * from an unprogrammed all-zero context.
+	 */
+	if (!val && !GET_CH_32(chan->dw, chan->dir, chan->id, llp.msb))
+		return -EINVAL;
+
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
index 36ee72efcd31..d849220f3b5d 100644
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
+	 * LL regions stay within one 4 GiB address window. If the low word is
+	 * zero, use the high word to distinguish a nonzero boundary address
+	 * from an unprogrammed all-zero context.
+	 */
+	if (!val && !GET_CH_32(chan->dw, chan->dir, chan->id, llp.msb))
+		return -EINVAL;
+
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

