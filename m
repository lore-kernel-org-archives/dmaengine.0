Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11020091.outbound.protection.outlook.com [52.101.228.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2860F48D88D;
	Wed, 29 Jul 2026 14:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785335450; cv=fail; b=mmgGobLsupa8s6Aiz40mSzcy37xVr6y7Ka69ofg39T75waH2EAy9R2YOd7sjR4Tq4+I+g5PJ+VsSaFqPYYw8JY1oZwtrF5g3DP3wMlU360dAzaZsEaeTK5tuR7chEM84AMfq0z6QFxpsLIqRT8iw+v1Y4BZlZ5ggbuexfw+CLdc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785335450; c=relaxed/simple;
	bh=JrywQRI9j+9IsPMuJMzg9QwRbseAl8095FaanemLhQk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KcraPBigzGACBD0CsjwL0C2znfKSmBIoWbOPvRL9Oa9hSElUfLIGJ4ITpIP3sjRGT96rBGokd27rpxG9b6ERT8GWOTobqUM2JquR3gObqAQ/kQ+PZky2TbrffPyvqxoYkh4Ym/pkjQNCGbECYB6HBiUWMTH7u3BS36q/qizGRgU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=lmgj59qc; arc=fail smtp.client-ip=52.101.228.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="lmgj59qc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tkEdd5jKtPGM6EDTv+MO9SXRfGUb2daFspaAgNv952u+wADSlX4WFcRlhFdtT2w9brrhoyhFRkcIBzDalJc3GbvwwOqujbVyOwEyrkw6SqOO5X68udDoPQH219C0H3NJjkJzkQYyztkA6ycy6uvJYm0qT7AAvNDWfgKnReaZn5CgW/OO0YVISb1Epy3jaJ7uRd6owqjZHu3PPJbpElMEG3Q53KnsoyY4M/za/KwqsMfOGSkQGPdGGp4sAelGeN3IOMzWZtBI/tPqNioXaqB15e+B/QcT+vPHRA6cnxe6ZenkN0Cr7P4AbQghgD71wKKBH+Fa43DXHLpfvtvUPq8MmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rjsSocg7etaSY8b4E+pIzHwFjIDIRCQYYTqKcCQO+o8=;
 b=TWwV0h3SMIh4toioTpUSOngCgXViDG8ZHWAgEfcjO5wtk2bbhhwkjpYvdo7hLFA1cC4Tgyp5tlEyFR7oP6Cf7EAqGvMjNzCpVw2OpPPu5DabJP3YowQUZKCl2rvZOJzwRc0mPjpTxeOmVY9HYDkAy/7hNXJDj5bYKhuh6TNFOImc5gDDC+tt8pIP7jz1OI5PUfawQKYQp9+8eoZZlMayI6G/dt9sK3GB/A5pdc23YNBlctx16ueip4UaAlHfebmqVj2T4XPvU4iB9lFd6NOjt1GFvr377jNysrUwhodB3kiHEpsHX355AKryfLuaB49MxabeZDeaFTG2sDuZOWFYaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rjsSocg7etaSY8b4E+pIzHwFjIDIRCQYYTqKcCQO+o8=;
 b=lmgj59qceoUDaXsR8r0mAxLTkaY8dxNFYOcTUIkKHB6mcFRv1uajhlD7ou7Oce9aDC/PWNZY/Ow+Db0t0aRLgfN1R5TIW6xdsfNi/kfyQP46zq4vYI1Sq4XBL/fmkgBK1aUo0bWUUwA6RIrQNf2SilJzHALDiJUWcphXx9uuccg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYRP286MB5289.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:112::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 14:30:43 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 14:30:43 +0000
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
Subject: [PATCH v4 02/24] dmaengine: dw-edma: Add dw_edma_core_ll_clear() to clear LL control-word
Date: Wed, 29 Jul 2026 23:30:14 +0900
Message-ID: <20260729143036.3087722-3-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260729143036.3087722-1-den@valinux.co.jp>
References: <20260729143036.3087722-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWPR01CA0007.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::12) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYRP286MB5289:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fd71d7e-3fbd-480b-6f55-08deed7df89a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|7416014|366016|1800799024|23010399003|921020|18002099003|56012099006|10067099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	VebpqlSHn8erAlVDlI7PPIiHbcdoZiHuxbBJI5Y2bPmQSqoQxsTwMYWckvAPWUX3peRGUEdOIkmrGDGnTxvmOwj0AOedFQh6bbgI7dUiKSP9VW4T8wtQpQCfnNgpl7WocCpWe5J+j33d+P0P5faG0HGT4xdHCyyV7QTetiFRW2JfV4qLOf/ydQKGzJsbo3lKG+EMyY0Yw88izUxzgYBQR1zW39tdHTdTgFTdJwOJ6Qi6qhEwImMWb2N2rxR66oHHoPgGB9gDocUT9/KzAVCHMRdnYm9+ztAaMpcrGBV0BcSRma7bKbR26BCdzYMYgQHgnXFoKm4GIb3wshomQOrw+QJuGbDlQz727v9PFiuSoGymdeaeCBr9jC7UMMliqqtUySWAVse1vRXjMGIs6BK1rIPojuqNUmEdD58pOEU/wrXrsVVh0r6W0R1ynrkliHRM7OeCN6sux0cWXyzUXnrL/kuWnFSqmAXiKDYlcEBKREQVcEwuqCvOUThp9PWaPqpjrMtJFnRfDqdunJjV0VgW+2f3UNgRPqiMHMZy46ejjQo7lTl49euulhBF/M11Nmk/CT7t2D3QaDYzs3ip8yPJkIOXDzscOg0hSBjOun9O/dEvspC7qR9wbog+4RAnZESiJmmSZ56dIk457b1IUrWfkltUFiJT5OhfA1sMdSyyXr9L+gTxqBVVRY7YVB26eR9MfBdbGY/1x050+bh3vfx/eA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(7416014)(366016)(1800799024)(23010399003)(921020)(18002099003)(56012099006)(10067099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6UyYFg1xWLbMpCuVexA5/JAMIkNlqcyp3QvwOXQ414iTXVm3Dk2EHNqxPQlE?=
 =?us-ascii?Q?+mD1DdE/QdHpY/gkff/i7d8YJgD/87hkyFrydnNNhUF83kGN+BMolNxPt+zz?=
 =?us-ascii?Q?H2KyqjJwo2vpjW4sbbrl2x2WKN88OKGMkmYsZPaWtK7Qf9rQ6Uf2IVX+gVKa?=
 =?us-ascii?Q?yL5Gyu7I1wLoXS31Gutk7LtpYRUvCVDJwCboGyKjlkFOecg07PRqf5xu5G6/?=
 =?us-ascii?Q?va4fbQrGQCX0qyorWCqhOaWPXuZmVgJRtaKL4WmxYlbg85pp9zDfj/sOdoOP?=
 =?us-ascii?Q?E6/fGefHGtfkTcYc9Bdk3x+w/LcIxz9avKZVUaQrsUu8ESvWVe9a9yKqrYBk?=
 =?us-ascii?Q?b8vczuNbLOskbo3yHdiVAZz2gnJWHMkKu1m4tIglJjQZNMY+CYdH6xo0K6Co?=
 =?us-ascii?Q?RU68L9wfKJBiDDA5RUgjMWSYbvuyag/hq+qqQt1/A/xJ2TxFqWW0TW2IAjOm?=
 =?us-ascii?Q?liNeiJdC6RUAxIN7D2WB7y9HWMKk1CCfo1RlMPiXe/ytzsqfbyMYAn+C/S/0?=
 =?us-ascii?Q?BEpF2sspoEaGVxTf6rWV00o9C4JMqvmxcJptlg9JybYaDx12mgaZ1d6IrcRn?=
 =?us-ascii?Q?8ibUR886XWLiJf9EEXvbO7SNd0yqAvI/2J2CvjqEez2dwhwq3xUoK6oCsWCs?=
 =?us-ascii?Q?Jf1VvJLVvo15TX+v8VO5sIV2roKmu5opor5WPbyDptJP9UMeh5NVxMv1WbPo?=
 =?us-ascii?Q?DxQjxYWQr9ygNjg3vXpRzlkmBbE4xuB0WT2KeT/qIORcHua2SYQ0ThnBUEQX?=
 =?us-ascii?Q?2+ll5g4mA3l7M+nDnf+IuPT1aB45mTyKwAxKzxTZ8vbE/rv7TdanVXMi6Uro?=
 =?us-ascii?Q?M21nCVUYu4K5kw0qdMr/Tl/klz8jNHBRFBM0XXxHkqOrmaPWgec7o/TYYrBF?=
 =?us-ascii?Q?8gcIEPuAaWakgtYczwlb6HE3FBXZpflr8MY7TWXE+Mgu2NWRlS27G2HXrzwW?=
 =?us-ascii?Q?Sp0BdO/elf46vSDvsPAF/s43wkm6pbE5ffLb/KYS93NnHnu0RicO9/KSTBM8?=
 =?us-ascii?Q?EtYbZeaV7TIGJ4Mx+KGP5wRKQzdQwPaagyo7Ya+7Jqcp0gYin+R8JbvrgwIA?=
 =?us-ascii?Q?rgJpsmK0ui6m3xLajPAZgJK3Yf6Z1yPSEKoEh/h4vyx5WQw2IcJq5o0KVYre?=
 =?us-ascii?Q?3AQAXgaPS/fc97kgsYHQ8ISBzhtBnpRXHdj+5fwwg0Wpm105nqumajlZ3xPt?=
 =?us-ascii?Q?rV4AAof1NVGbTk5+f72gx6u7lWj+lUuttyL/ywGLsDZbAgqjC4SBZVqIXH/B?=
 =?us-ascii?Q?aJQtOneUhKuFqkeCCthjtrHezvV04Ud5ObR56ca+G47ci7rFXoAO7OtcCLKB?=
 =?us-ascii?Q?DwBARi5eJosas/Or1yxJ1La4GCex8qohamKWd4YTsNCRNqwjHiVaiLoYUjOH?=
 =?us-ascii?Q?kpbt0yHy9n2PNvuo3Hmt+ESbsxni4uoZfh/pdeBn1wQhreGpp5LFQEqE2Czd?=
 =?us-ascii?Q?z9IyflAPyJgy1mZkjcDxCYiGbcNUqRrs2Kw7T2tY7Grx+ABAkpKHro4r5IOU?=
 =?us-ascii?Q?9NlmnKIddnX9YQasQ2pTHgJCLFeGG/LlpKYOmU1lCp7Rq8CxJCR22qJSYyQL?=
 =?us-ascii?Q?YLMlg41XkarVGoEzgG8xu44/GEBfl+87JyipnTklH8bsJeZVt3Hicw6dtdGj?=
 =?us-ascii?Q?xDGkQ+BHT3tTYXXB/hbaWXYqNJsXsWEvjHwtB8SP3Pzkr0jxNRPk3EM25IK2?=
 =?us-ascii?Q?FhJ1HTx6Zed1LX3k2VPpt5AZbHDbEbSrdsG0K+F7vmezDpsoFAvAS0pwFqti?=
 =?us-ascii?Q?1yzUo2NYE9va41M6pbomIb15KPS2xGKnHhcpmMwOI6yZ1w19INNc?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fd71d7e-3fbd-480b-6f55-08deed7df89a
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 14:30:43.1358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VnZrXw+Ls0NB2S7L1V7180Y6L1aEBL4MQ8wFEiQbhRRQ1mlAGHmJ+drqnc4c077Y0fCLO+zvQTbduXYaQl7dfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRP286MB5289

Add a core operation for clearing the control word of one linked-list
entry. A later patch uses the operation to invalidate stale CB when
resetting a circular LL ring.

No functional change.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v4:
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
index 7b9a95ecedbb..7ca4b6823ece 100644
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
index d849220f3b5d..67a3a7778280 100644
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

