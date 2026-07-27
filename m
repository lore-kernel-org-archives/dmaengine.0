Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11021097.outbound.protection.outlook.com [52.101.125.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08387439012;
	Mon, 27 Jul 2026 17:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785171843; cv=fail; b=UEaejCK/ScPtBpkg1RmtrVcRFIH/FzI25fETtZp5xoT/EIGP+Orq3pOhY8HSElpfYL1QjFrDMA6v/uR7LE4CxfdGHZB0k/iSpvamwE51xFQbLRnyQunByXZ1eRQbKLaz4pJoE5m62JzBnGubPOBD92AgBAPGDnqpnCsD9Tl+dZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785171843; c=relaxed/simple;
	bh=F+ySqtq4GQl1jNPiY8pCuBQ/Uq5Df4v/DJDZ9pCqAUo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sN23JXjHCymz9TvTw3Z3UR1kn9HMjk7/MA6jkN+dhgdHD+VQIqgIRsebGEsi9cLugN5wrv+BjwICZLGYcWG2ol3OuHNI60wZViQACZK6n3PWh/YsnN/VDk2Le3s2OhDWYVY2OiKT62ltxeduMvml8Qf0pOrkFDLe3vO9V/i1jTg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=Q6Fq1AZN; arc=fail smtp.client-ip=52.101.125.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="Q6Fq1AZN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RyGFViBNB0Ox4TfuYNPknHVQv8MFMTy5rcKsAS+uG7F9FETf5VNkol8RMyk1Ti/lWqcrBxUWamfamdKrxqZ0S3CNYT5yqlA3DgVEcgSgWNiKtxKjlDi/jpD4O81tXOnR+BpQiOSmHyEifnYwc1VnF20Zf2oRLmS7WhjpUoU6tCHdQqoG0zHdywmQ4xUs07zt1moD5xQwFyz/jw/v0Uxfv1oFlh5tkE9n3XAoVApP9qZfho14moMLJmJaxeSG9PRaE6SPLBIGQrEdOBTys0jog8U1L7CStVfRbX98BiGvE8Bqmd0vgbK2xmEHEmLNIrtVm/de4zPvFaJJTmieh14H8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UNAyzvue4s8oh+zrbJ81YEYiHH8BCGxnO/tbcgWNEyk=;
 b=PKTRqvIDlzBytBWrg1JO9lZoR9xkeXMM/fujELMsozrfBjpEeAkpvaLBx6P7jyWw4kaV940Y/K9/GEeU4NlwqbjM6ESL05ls2Zw8NJGDS626js2f3rojsEYdrR2d8Q6CDwwX3yl7hdZX2/W+o/yJ6cm4DJg1UEP5s02aoQnMzqvHiRptyJlTEKDpRhE6IpSngeQoTpwlxqLnjw1syhrnhKem6nDgZqKdgwCSEIQhhPKHCASBGiDOQwFKNW/s/1W4KmK2OupQkuCjjR0k8z29fBmAo0D0j9qog1BOt3gVVliT2lz0wFD5WEgnHhXW3+MJAqH0NzH4ZS99NNKdUM5tjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UNAyzvue4s8oh+zrbJ81YEYiHH8BCGxnO/tbcgWNEyk=;
 b=Q6Fq1AZNIfiyOftSAOjAcZsCEI2VV48nYLXC9OeseazlklmLemuCeF6VtJgAsBxtHsbj91eBUR66GGt6+Z7v2d3ysPVwcA1DXUnkFcarBuTPjaj5sFhlfZTRTYgY93c8FchFRgEkgI86IzpPBKKs2m2/3XiSt4uIiEHuCj46Md8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TY7P286MB6515.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:31d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 17:03:51 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 17:03:51 +0000
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
Subject: [PATCH v3 24/24] dmaengine: dw-edma: Add trace support
Date: Tue, 28 Jul 2026 02:03:23 +0900
Message-ID: <20260727170323.2321369-25-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260727170323.2321369-1-den@valinux.co.jp>
References: <20260727170323.2321369-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0026.jpnprd01.prod.outlook.com
 (2603:1096:405:2bf::12) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TY7P286MB6515:EE_
X-MS-Office365-Filtering-Correlation-Id: 973226ae-5120-42dc-58f6-08deec01084a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|10070799003|7416014|376014|921020|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	/vUUNMi6XpTpzSlJti0oHpIBlzfhTfUGL0FOnaogmQbDAgMIA1INYWmoUpOgrOxAhPO+D3VVSuAJWNnAR/UF3rN+ZnCtSb+9dm3sLlH1WqUElzihXye0zvFL89RjaEeuX3CR1oKpaOl21WUL1GBckeFYIqA11mQw54rKrvCYi5HQpdEnBT5w448o70IBYKm93SuB01QzdWEENJ2dv5Dtt2LLQdxPnAY49G3N9kn13OOkGJ+FHT0VlO1yu8CHZY88ge9c/81eHtJAIjQllKskOvAsyuiulk8jmOBcnnntBWNZy7Vm5w7/igdMjd/8vSvlePzGYD5kejWoDsst79jFv+i5bXi9s+vZDecmHUgaAWT4/xvcSafTChOzASuu7+Ms5nkfi+z0d1tYgFc3CWDYKN2Hb2xQDkjvIrgUcPkr65uwcx3YNVOmvbYDP4VjoEngLxJZYrWvJUIBCyy/n9Ct41vhsKoOTO7uq7H6zLTcZLxU1TgmUjuisp+yOoIzXsqbVt63/fz45Fp4SmYxpl2P5bqlMkWb276ULw8DKutH/VVCCeILzFL+aJrJ5BVQO4BcRUZrBjAqeHynmP5rmqwaBcV4VwuzcfZUFS7TWTlU3TcVBJbEGfDzBcVvi4XeP+KUdqltFt+CSV13/qW9xKI9hVsaIak/uaeOPWCN9Wyo0b3O9vRtSmiai1BZzFGXKgpe1fzYieUa7vXsKXlJ7kMvZg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(10070799003)(7416014)(376014)(921020)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ho1tuAxmwGBk7ruooWU7H+UNtMcQkH4NsedS0GYI9N9g5TDlGMXhZLiPpX8X?=
 =?us-ascii?Q?1ZbHUb9naGGpX21jSH72A7etbKZq5nLKEIr9u22Tx3WLvGIfDZ1mVihGpQiV?=
 =?us-ascii?Q?KlKwD+FILxw/0f+7zXe/3DtAESi4YsCef4iDGlvxADvyGZ2nWp/syjhMSlN9?=
 =?us-ascii?Q?m0F1Ss6qXhEZ17vbKmc1dtv3rCpxCHlQj+agTldzx2o6imZf5xtkutb4zoqu?=
 =?us-ascii?Q?vzlq/PkMX8/m+y8kbVX5HoJPN083lOuldhvrmJTAnVLfhb/4qfx6thJf2qFW?=
 =?us-ascii?Q?274V4vsI7WkZM72MyHAaHim7M1T4SzhTWSYumNgEepP+czfT4Rqg6R+14sAp?=
 =?us-ascii?Q?sTM0ROybHlrj6/MsL2s80CN5NohzuKOrV27scsnMfrpWxQ3wtUE0sYhTY9j9?=
 =?us-ascii?Q?wHoNE6uVRotIlJ8SRrXHhNLkFJ4z3ZiI/xEpNFdcRH9jSvgzoh2N9Dzc+kqy?=
 =?us-ascii?Q?46pfHLXBc+3cHLXxuSJet6XLi68k81wrF1H2oeWDlUFhZL3S9nNvUos9XyZt?=
 =?us-ascii?Q?r13Kn3el0lDzMOlJ8ImgW1NGJZ1JI2pcKecDslvwnmMT/C8H+7GUO0tWT5o6?=
 =?us-ascii?Q?cfqOHKQFo/j+TguXJHzKzezyL1u8Nm2QeSE6voiCDgsQABP/s4MDqkWwxgLW?=
 =?us-ascii?Q?l/bFIJyAEcZAoFYrWH4YUsh3e9jgG464WbCkaqVTpqj7yOLock2A/oV/Aiu5?=
 =?us-ascii?Q?e3K5wlEbL7+E46HOFg2JGKZEzDwowk78DDM7irWOR6fiEryiU3a2fNvkxemK?=
 =?us-ascii?Q?a98Xx9eJ4hsHnOsWftursS8IVaD6Sj2ZBuIK7BP+fLqThEAHi2Wam0B0sZGV?=
 =?us-ascii?Q?G3NlX7LuZs/0/7qFSRT0B7kTgjDDUkxm6nm5G/gaj5GNlRXzBGq8HGmcXhQw?=
 =?us-ascii?Q?sNkBUvyFcYj48+54MhHeC42p9QLP0F7INimSRTrU71z3ul2IvUvVBFqn8f07?=
 =?us-ascii?Q?4YbxjHKghOe2u8hDqTTxoUAz7uDuB4+tHMpA0cSE7+3/QHYlens6Vc3hDmfW?=
 =?us-ascii?Q?PjalQm7UuILCtfM5nKD8EK09DAL9nAD9K/cBr7BBrii8erCUv9ggIR4xcHUq?=
 =?us-ascii?Q?M3qM1OxfaeWMIPuC3dzRe2aoL3ikh+VxsH6Gef7OZalNAo3JB+jXRBXa/rjX?=
 =?us-ascii?Q?L9UxjXCtHPINz4RgL+pIe8zaVBrYOK5CWz8Z80cVr1n8HOlhv+gDI/e6AVGV?=
 =?us-ascii?Q?bMcFZbSYLYTnXjLJePPcKfNfwo1Y7LzCiRwm/XY0ftIpJBvjdLNdeY3U9emr?=
 =?us-ascii?Q?DZfUYnS+dqteysftptKsOQmOnvSnhMDqaaB7FXH/U4MIbe8MjyFRd1M6pRcn?=
 =?us-ascii?Q?aMGpIn+bDpMmtDb+6yBErmZwkIRewCXpmZ8Inh3zr8SLL8IFiqyzW0FEMgEW?=
 =?us-ascii?Q?I04D5shxGM6HsVW7zfyX/pZPmU+YQTR/CT4nJjKJCmWcG5WIAcwtd9yHER4e?=
 =?us-ascii?Q?rGvrr5APrDjMzS3yeDDroUiSwjGdO9P2DrKSppRng9InQYPN1PGi/9cEARsd?=
 =?us-ascii?Q?s2JCPIoTJ/mb75ERUF6+mECySXlTTV1HeS2/J6oTK9htGA/VTQTONl6qr0Ej?=
 =?us-ascii?Q?kPaFBBTAvum8+PAuWoSLYe3g/PJ6YmXqC41NhBrFfrJD1VnuR2tRKI6zOMqJ?=
 =?us-ascii?Q?7UxYjQ5GevoaM9CVjvFZl01hy7YiAdd1JbnnT28zw1H3xoZLFcLlxBdujzBl?=
 =?us-ascii?Q?rGXfmyOS/VKDZX/7cnYIUi6V9Lp9qjIg/5PWUH+7u51GFd69vu2Azp48Jfat?=
 =?us-ascii?Q?PRPZ0+xciIRaOkwE7ARtbgG7SqNcPVCyHNg5oeqwC+d8l5SXmS08?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 973226ae-5120-42dc-58f6-08deec01084a
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 17:03:51.2117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8OWCsRj0/wf8csttpKkuB2xPTr/AANiZP/DqFKa0+RyHPz+bqItxWDY3vx6gSjIdMpT4SaQDHeiEBBpjowGleQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7P286MB6515

From: Frank Li <Frank.Li@nxp.com>

The circular LL ring has separate producer and consumer positions. Add
tracepoints for LL publication, descriptor append and completion,
IRQ-paired LL events, and engine recovery. The LL events cover both eDMA
and HDMA.

The recovery event records configured LL channels before a direction
reset. When disabled, static keys leave only a branch at each trace
site.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
Co-developed-by: Koichiro Den <den@valinux.co.jp>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v3:
  - Record the full pending-entry count in recovery traces. (Sashiko)
  - Trace the recorded LL event snapshot and update recovery tracing for
    the revised recovery flow. (Sashiko)
  - Replace single-use event classes with direct trace events.

 drivers/dma/dw-edma/Makefile        |   2 +
 drivers/dma/dw-edma/dw-edma-core.c  |  49 ++++++++
 drivers/dma/dw-edma/dw-edma-core.h  |   2 +
 drivers/dma/dw-edma/dw-edma-trace.c |   4 +
 drivers/dma/dw-edma/dw-edma-trace.h | 169 ++++++++++++++++++++++++++++
 5 files changed, 226 insertions(+)
 create mode 100644 drivers/dma/dw-edma/dw-edma-trace.c
 create mode 100644 drivers/dma/dw-edma/dw-edma-trace.h

diff --git a/drivers/dma/dw-edma/Makefile b/drivers/dma/dw-edma/Makefile
index 83ab58f87760..5f395fa1ede4 100644
--- a/drivers/dma/dw-edma/Makefile
+++ b/drivers/dma/dw-edma/Makefile
@@ -1,8 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0
 
+CFLAGS_dw-edma-trace.o		:= -I$(src)
 obj-$(CONFIG_DW_EDMA)		+= dw-edma.o
 dw-edma-$(CONFIG_DEBUG_FS)	:= dw-edma-v0-debugfs.o	\
 				   dw-hdma-v0-debugfs.o
+dw-edma-$(CONFIG_TRACING)	+= dw-edma-trace.o
 dw-edma-objs			:= dw-edma-core.o	\
 				   dw-edma-v0-core.o	\
 				   dw-hdma-v0-core.o $(dw-edma-y)
diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index 262ea893174f..e94557d79d4c 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -414,6 +414,12 @@ static void dw_edma_core_ll_start(struct dw_edma_desc *desc)
 				     chan->ll_head, chan->cb,
 				     dw_edma_core_enable_ll_irq(desc, i, free));
 
+		trace_edma_fill_ll(chan, chan->ll_head,
+				   desc->vd.tx.cookie,
+				   desc->burst[i].sar,
+				   desc->burst[i].dar, desc->burst[i].sz,
+				   chan->cb);
+
 		chan->ll_head++;
 
 		if (chan->ll_head == chan->ll_max) {
@@ -475,6 +481,7 @@ static int dw_edma_start_transfer(struct dw_edma_chan *chan)
 		if (desc->start_burst == desc->nburst)
 			continue;
 
+		trace_edma_append_desc(desc);
 		dw_edma_core_start(desc);
 		ret = 1;
 	}
@@ -604,6 +611,7 @@ static bool dw_edma_ll_clean_pending(struct dw_edma_chan *chan, int idx)
 		/* Hardware has consumed this descriptor's LL entries. */
 		dw_hdma_set_callback_result(vd, DMA_TRANS_NOERROR);
 		list_del(&vd->node);
+		trace_edma_complete_desc(desc);
 		vchan_cookie_complete(vd);
 	}
 
@@ -939,6 +947,44 @@ dw_edma_engine_recovery_drain_irqs(struct dw_edma_engine_recovery *rec)
 	}
 }
 
+static void
+dw_edma_trace_engine_recovery(struct dw_edma_engine_recovery *rec)
+{
+	struct dw_edma *dw = rec->dw;
+	u16 off = rec->dir == EDMA_DIR_WRITE ? 0 : dw->wr_ch_cnt;
+	u16 cnt = rec->dir == EDMA_DIR_WRITE ? dw->wr_ch_cnt : dw->rd_ch_cnt;
+	struct dw_edma_chan *chan;
+	u16 i;
+
+	if (!trace_edma_engine_recovery_enabled())
+		return;
+
+	for (i = 0; i < cnt; i++) {
+		enum dw_edma_request request;
+		enum dw_edma_status status;
+		bool configured_ll;
+		u32 ll_head, ll_done, pending;
+
+		chan = &dw->chan[off + i];
+		scoped_guard(spinlock_irqsave, &chan->vc.lock) {
+			configured_ll = chan->configured && !chan->non_ll;
+			if (configured_ll) {
+				request = chan->request;
+				status = chan->status;
+				ll_head = chan->ll_head;
+				ll_done = chan->ll_done;
+				pending = dw_edma_core_get_used_num(chan);
+			}
+		}
+		if (!configured_ll)
+			continue;
+
+		trace_edma_engine_recovery(chan, dw_edma_core_ch_status(chan),
+					   request, status, ll_head, ll_done,
+					   pending);
+	}
+}
+
 static void dw_edma_engine_recovery_work(struct work_struct *work)
 {
 	struct dw_edma_engine_recovery *rec =
@@ -1064,6 +1110,8 @@ static void dw_edma_engine_recovery_work(struct work_struct *work)
 		return;
 	}
 
+	dw_edma_trace_engine_recovery(rec);
+
 	if (!dw->core->engine_reset(dw, rec->dir)) {
 		/*
 		 * Keep channels gated and do not re-enable the engine unless
@@ -1683,6 +1731,7 @@ static void dw_edma_ll_interrupt(struct dw_edma_chan *chan)
 	if (!dw_edma_ll_snapshot_take(chan, &snapshot))
 		return;
 
+	trace_edma_irq(chan, &snapshot);
 	if (chan->status == EDMA_ST_PAUSE)
 		return;
 
diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
index 0c9c17edd835..ca0f60ad5ab5 100644
--- a/drivers/dma/dw-edma/dw-edma-core.h
+++ b/drivers/dma/dw-edma/dw-edma-core.h
@@ -206,6 +206,8 @@ struct dw_edma {
 	const struct dw_edma_core_ops	*core;
 };
 
+#include "dw-edma-trace.h"
+
 typedef void (*dw_edma_handler_t)(struct dw_edma_chan *chan,
 				  unsigned int events);
 
diff --git a/drivers/dma/dw-edma/dw-edma-trace.c b/drivers/dma/dw-edma/dw-edma-trace.c
new file mode 100644
index 000000000000..2620ad61a943
--- /dev/null
+++ b/drivers/dma/dw-edma/dw-edma-trace.c
@@ -0,0 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#define CREATE_TRACE_POINTS
+#include "dw-edma-core.h"
diff --git a/drivers/dma/dw-edma/dw-edma-trace.h b/drivers/dma/dw-edma/dw-edma-trace.h
new file mode 100644
index 000000000000..e5b3eb57df06
--- /dev/null
+++ b/drivers/dma/dw-edma/dw-edma-trace.h
@@ -0,0 +1,169 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright 2023 NXP.
+ */
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM dw_edma
+
+#if !defined(__LINUX_DW_EDMA_TRACE) || defined(TRACE_HEADER_MULTI_READ)
+#define __LINUX_DW_EDMA_TRACE
+
+#include <linux/types.h>
+#include <linux/tracepoint.h>
+
+DECLARE_EVENT_CLASS(edma_desc_info,
+	TP_PROTO(struct dw_edma_desc *desc),
+	TP_ARGS(desc),
+	TP_STRUCT__entry(
+		__field(size_t, nburst)
+		__field(size_t, start_burst)
+		__field(dma_cookie_t, cookie)
+		__field(u32, id)
+		__field(u8, dir)
+	),
+	TP_fast_assign(
+		__entry->nburst = desc->nburst;
+		__entry->start_burst = desc->start_burst;
+		__entry->id = desc->chan->id;
+		__entry->dir = desc->chan->dir;
+		__entry->cookie = desc->vd.tx.cookie;
+	),
+	TP_printk("chan %u%c desc %d nburst %zu start_burst %zu",
+		__entry->id,
+		__entry->dir ? 'R' : 'W',
+		__entry->cookie,
+		__entry->nburst,
+		__entry->start_burst)
+);
+
+DEFINE_EVENT(edma_desc_info, edma_append_desc,
+	TP_PROTO(struct dw_edma_desc *desc),
+	TP_ARGS(desc)
+);
+
+DEFINE_EVENT(edma_desc_info, edma_complete_desc,
+	TP_PROTO(struct dw_edma_desc *desc),
+	TP_ARGS(desc)
+);
+
+TRACE_EVENT(edma_irq,
+	TP_PROTO(struct dw_edma_chan *chan,
+		 const struct dw_edma_ll_snapshot *snapshot),
+	TP_ARGS(chan, snapshot),
+	TP_STRUCT__entry(
+		__field(u32, head)
+		__field(u32, done)
+		__field(u32, total)
+		__field(int, index)
+		__field(int, event)
+		__field(dma_cookie_t, completed_cookie)
+		__field(dma_cookie_t, cookie)
+		__field(u32, id)
+		__field(u8, dir)
+	),
+	TP_fast_assign(
+		__entry->head = chan->ll_head;
+		__entry->done = chan->ll_done;
+		__entry->total = chan->ll_max;
+		__entry->index = snapshot->idx;
+		__entry->event = snapshot->event;
+		__entry->completed_cookie = chan->vc.chan.completed_cookie;
+		__entry->cookie = chan->vc.chan.cookie;
+		__entry->id = chan->id;
+		__entry->dir = chan->dir;
+	),
+	TP_printk("chan %u%c event %s head %u done %u total %u idx %d completed %d cookie %d",
+		  __entry->id,
+		  __entry->dir ? 'R' : 'W',
+		  __entry->event == DW_EDMA_LL_EVENT_STOP ? "stop" : "progress",
+		  __entry->head,
+		  __entry->done,
+		  __entry->total,
+		  __entry->index,
+		  __entry->completed_cookie,
+		  __entry->cookie)
+);
+
+TRACE_EVENT(edma_engine_recovery,
+	TP_PROTO(struct dw_edma_chan *chan, enum dma_status hw_status,
+		 enum dw_edma_request request, enum dw_edma_status status,
+		 u32 ll_head, u32 ll_done, u32 pending),
+	TP_ARGS(chan, hw_status, request, status, ll_head, ll_done, pending),
+	TP_STRUCT__entry(
+		__field(u32, id)
+		__field(u32, head)
+		__field(u32, done)
+		__field(u32, pending)
+		__field(int, hw_status)
+		__field(int, request)
+		__field(int, status)
+		__field(u8, dir)
+	),
+	TP_fast_assign(
+		__entry->id = chan->id;
+		__entry->dir = chan->dir;
+		__entry->hw_status = hw_status;
+		__entry->request = request;
+		__entry->status = status;
+		__entry->head = ll_head;
+		__entry->done = ll_done;
+		__entry->pending = pending;
+	),
+	TP_printk("chan %u%c hw %d request %d status %d head %u done %u pending %u",
+		__entry->id,
+		__entry->dir ? 'R' : 'W',
+		__entry->hw_status,
+		__entry->request,
+		__entry->status,
+		__entry->head,
+		__entry->done,
+		__entry->pending)
+);
+
+TRACE_EVENT(edma_fill_ll,
+	TP_PROTO(struct dw_edma_chan *chan, u32 idx, dma_cookie_t cookie, u64 src,
+		 u64 dest, u32 sz, bool flag),
+	TP_ARGS(chan, idx, cookie, src, dest, sz, flag),
+	TP_STRUCT__entry(
+		__field(u32, idx)
+		__field(u64, src)
+		__field(u64, dest)
+		__field(u32, sz)
+		__field(u32, id)
+		__field(dma_cookie_t, cookie)
+		__field(bool, flag)
+		__field(u8, dir)
+	),
+	TP_fast_assign(
+		__entry->idx = idx;
+		__entry->src = src;
+		__entry->dest = dest;
+		__entry->sz = sz;
+		__entry->id = chan->id;
+		__entry->dir = chan->dir;
+		__entry->cookie = cookie;
+		__entry->flag = flag;
+	),
+	TP_printk("chan %u%c %d [%u] %c src: %08llx dest: %08llx sz: %04x",
+		__entry->id,
+		__entry->dir ? 'R' : 'W',
+		__entry->cookie,
+		__entry->idx,
+		__entry->flag ? 'C' : 'c',
+		__entry->src,
+		__entry->dest,
+		__entry->sz)
+);
+
+#endif
+
+/* This part must be outside the header guard. */
+
+#undef TRACE_INCLUDE_PATH
+#define TRACE_INCLUDE_PATH .
+
+#undef TRACE_INCLUDE_FILE
+#define TRACE_INCLUDE_FILE dw-edma-trace
+
+#include <trace/define_trace.h>
-- 
2.51.0

