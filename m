Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020143.outbound.protection.outlook.com [52.101.229.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122B9480DE0;
	Wed, 12 Aug 2026 15:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.143
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786550286; cv=fail; b=Y/gckTYaBsfqLPLV/l3eC1LaPKr3PkNFEMqCQb45C/ySlLw/DIkq20HCcVOZqpgCFgddnSPYFxioIjmfX2dobdYiLXss/VtjpwicgUDRSrSdk0ETqr8M1i9IHCb4lmqLamVOMhPZgt+BSOj3hEeK33yt1GJcp59eb643WLTMTCk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786550286; c=relaxed/simple;
	bh=VvoVI7qFYJsVqtvVvbV+Eso3U2Otnyv2XQTPDUnNqsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ktFuUU89nu5l0edl0VuL+sJ+qM93m1xb9MlCBL5YdK0l1o1UacJ/rQ/iR7MIU6nqIQIi41FxxCWU5yejzpWS4n2y8TYkUVHzuPDHmjknnmqQslF4AiuM66c6TIMK/KOiI3pYGqyp6n3saeRb6U6fwxHmp5KUyKDUR4YWsctRJJQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=WZI6H5QP; arc=fail smtp.client-ip=52.101.229.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="WZI6H5QP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OVBlzWAPtWqniOwTBXlc6pkY0qewB1Z9p/BM/hEFNN7mRShOomkacWo7UA3qxREOrHSufl1Osaj7ORyjq2jiwHpFf6CiTHibOknkZV0/Y4VW1uT32XqQ+8Wogb8Ffn/7d3RlsYG8plBDODz7Rgrjie9g3uP3MecbV/lVCGZLMuQ12CFnLjKGHko7Us8ajn3CRZLaak52XR97J6XfwihTHHPSKErdtriDp4LqYZGCcOoX2aYrv5s0hQpqh/duv7KTm0drj083zHzbQjGsoMwLBH1QG69HgmCeWYOGfrwtmIrFJHHvUO63pJ16Zcjw0LditOlp9cK+LhWL9wn8DIyn2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hLBgNuhDfQwoRhWRFLlBULNeV5vtaEJOB6EAlWyp2q8=;
 b=OfkwAR1M0MJ4qWTPWf5YKLVj3dPwa1tXHU6zFZjpiFY0wFyEHDOhypNH4zK8Wcw+05Petm8yG3PJP7UYaRbTr3AOfhCHu5l5KCBAoDQ0CyCC3MaW78wDyvvrkGIfDELfhBYY0Syp9pLV/bpsu6HJgox442udpXp8IL21Lrc4f2vIccEKWWIz1be9vbvu4OaIk0tHhoTYabCXbgiFKRpbzhy+fjBgs69vjaOdBUYz6Wr8yR+Rxh84jUdq2euL+33CU9fiAwbxlYC2qYfIjPhqeHlwrte98aB249tWHA2Z2qbg5SPy9w+Oxykl2ViUPQJ7ehmRM9AZuU2Vq5t42Ch6aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hLBgNuhDfQwoRhWRFLlBULNeV5vtaEJOB6EAlWyp2q8=;
 b=WZI6H5QPfzHzhBV8kzYodlm3V0XQsoaWBGiXgtlU1wAnBcAGLiW/ILgNTwI+I/bJgRsGvlMm+O4PfgCDGjSdS+CMuONoEHTh8nVlNDNZLm/MxCOsrge61wlpZGL8ucowCDpVzZoYq3egBG0gMOHg/QObb+f+PR3werBpsaWH3P4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TY4P286MB7069.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:343::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Wed, 12 Aug
 2026 15:57:45 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0292.024; Wed, 12 Aug 2026
 15:57:45 +0000
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
Subject: [PATCH v5 24/24] dmaengine: dw-edma: Add trace support
Date: Thu, 13 Aug 2026 00:57:21 +0900
Message-ID: <20260812155721.2807506-25-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260812155721.2807506-1-den@valinux.co.jp>
References: <20260812155721.2807506-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0263.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::11) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TY4P286MB7069:EE_
X-MS-Office365-Filtering-Correlation-Id: 1614eb46-8e3a-410a-fdb4-08def88a7310
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|23010399003|7416014|18002099003|22082099003|56012099006|10067099003|921020;
X-Microsoft-Antispam-Message-Info:
	b4C0v+Oh4Yxr7y0lbv5bCSPhuajg13YdlBZT2OMXTGVFEYW6vI2DTFB10Qfv3M6rfeJmLogZ1n0f34hIjsxD3OdDtEoX3t4TZLthaDZRPsS+2eYF01m+rhYO6ZT86MtkIncHF7wG2GKf/aJCWC8WfzepwsiIMBL+pE9WoBiIv/q/ksObQV+ogCjASpXB3OROSZ0tnw8ZxFYiuaIiT9TYk02XJVWiYuX6cGf/7to3qda3RF5klFthlWVJQUPPL2tUQbJgWWRhSDzxX+83sE3dgEu7HLyh5hu9wc3sxIrCvRainUcLDf/GoHetMaCugfxoD7UFXL5P0OwG/6nxE3gLrzeBr6h9IJ1bdV+4HPnquNzXiM1W2e9anxHafpH/wealr6FuvZ7dahurKACy4HPPy19mLMmR1ubvQMvKLwPHtVx5YJx8zStqfwWNaJVAfufiQttSzOKGbLk9PpTK+tMD7vzm/PPS3VWCOQF+WGDfs9mYFP4YOYNUVkFqSTSfQXXDjNMOAn21yhmaFwYwSjwm1JyvjhD1+AD6Lzs13J0mtSsz0z0UZPtTiK/3Qd1qHf8bJFw/cYK7EaTYHMUCRfPK6qV85DrPs5BWVZy1uhA2CcdcCHZgA9T7XFwgXdFWbFbqcoltuqtsaxxn8GKUaMgL36Cko2a9ZPwkgi5Or5wy5Ojc/03Vg1MXGIsmVdVA2XkxNzpf4+tDspK1AGZFEuc31A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(23010399003)(7416014)(18002099003)(22082099003)(56012099006)(10067099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pni720nLNkDn0EBlhieOxQu2QggTbP9FdJTlKIHEigIW7SON1OhPMgHKUqWX?=
 =?us-ascii?Q?IwpeUqEJSLAGDnhOOplLtFtQmQZ+TPA+BZvrqMt4XezlkGWnTbZDM/w+ku3p?=
 =?us-ascii?Q?0ZygepTABZrwTnRa0xYdVY8Hw9jrJ+2dEHR2aV1mS7ts1tGpUvwUOJPw0UJv?=
 =?us-ascii?Q?wXFFL8MNQtBgV2xwR6ZWMohDy/olni5KOZ2A2Du9xTdNdm4TbI/dFUDoXDrI?=
 =?us-ascii?Q?/Ie4Fp5t0KmzEpNvra3Wx4UGVJIO1aVVDwFXUUmqHHDfCCAg01AAfwGBf623?=
 =?us-ascii?Q?vdOA7zk9fcE5rVD4lX9n8N/AX+yebD735si3c3IfB+3fmgHgY1uP4uXKuNeP?=
 =?us-ascii?Q?2JkBNtNSWuCtCEUSPdJCcbz4Hk8jf/GTCxO9RSluavBNp5dJq6mqGiyjZkGv?=
 =?us-ascii?Q?7vKx/1ptynYcp6cdKcPBd2xmXNeuCR5FF6UQakUiX9n6uV7p5CcglgfsTswG?=
 =?us-ascii?Q?L+XAr3+PJG9SpTk7Un7GXPTWoq68s4ChtDL4ntR8/mml/HUcmmnmRDw7FuwG?=
 =?us-ascii?Q?GMlzth1YvRG/FIq3HPxHBL7hF+KCxny2zlcKJz/3eGCOCoE+dSUHjyhR6e7m?=
 =?us-ascii?Q?iSKheW7Y8mi2GmIIT1JUs4oXEFg7gxBB+b9d6vZA4a4/5jJa/NbSwhGHXdcJ?=
 =?us-ascii?Q?F4Tr4UFn0p2ZlihMDP75DnT/ma9I8swp6ezyD/jX/uuZdWtNnZEsHjpccUEO?=
 =?us-ascii?Q?DvaSXcz72INPxU52cugtDdxTa3iKt6MP+rCVC4PmEA8hHcrImLhYhFKxSqPh?=
 =?us-ascii?Q?xLHEz9EPOXe/TBBv5FFXHgYUGcewW60v8rNebaXhC4KgXiwvnOuUE5Ijmu1Q?=
 =?us-ascii?Q?nzcV5w/PxFNBxRHj4VgPf9J6cPRdqdw1dl6lR1IMZmOkUAvDzhVO+rVgjfYq?=
 =?us-ascii?Q?Lw9gt+FFtYYbveeqSEouoSfXUPXgZDgX/PABm3zHDiQaYO8QeEMP2h5Rd9RM?=
 =?us-ascii?Q?jzZiuo2gjibD4oz8ADLNUJxh52ApaHNA0a3JhVz2A3nuXKNkd+aaBfJ3Hgzs?=
 =?us-ascii?Q?TMEl9Bo2KZ9ZZtw0QzFTqNeWtg3s5Gf72TLaa98J9i7fhJOhRcPK9/BFCnyT?=
 =?us-ascii?Q?9rqbjP5G8o7tLbuFXtuONQDSAtWpg6CbJ8GkAQDMUlohLMCI1mJ0Cc9qcIup?=
 =?us-ascii?Q?pnHlH2cb5UZIFWAdFoWn3gk+xGoniSSaEdU2SX6CE6DIO/gbHLUs/ewaSo39?=
 =?us-ascii?Q?lx43o+eii1nQqe4uE2GdLzqnpJ1K/ZbJvjiNeLYZ87o5qsBTJJlfyFy8EUcw?=
 =?us-ascii?Q?UfF41R0TdA2bvNniLBjylgfN2bVuDwxtZsfFK8j9JZkH0MVXOl939D3Rtsah?=
 =?us-ascii?Q?wSQdWo9GY9gePDIDA7AsLT6et7R8/7A6WvqMQqXZI7hkeKZBEw1FVnfI/g00?=
 =?us-ascii?Q?T3eXxwPh3TDM6Qd5SKFepjwmftrnCYTkS0nCmniLo9994UbDHVB4A2Mmp46V?=
 =?us-ascii?Q?0liWdu/Tq51ZNwmLXqY+05B6bxJ4O9P/aEiqVPw0jxpAhzWfXtAPZOXFKsps?=
 =?us-ascii?Q?vcOd9zqiD75KbvQI7tiRvYIs3IfIGzWfDpuDObSGhBryXl+rJw2/EItf8h4X?=
 =?us-ascii?Q?eYx6mlDJV9O0zBOiWkcaMKhlgcIRsCE54yjHvbsBSSLwDxAFLMb0krYAUY5b?=
 =?us-ascii?Q?SYi9FnicHiqhAvbMfT5m8MvAICz+ye0FQDcaJoMD6rURpOVddAWjwj3/kNjs?=
 =?us-ascii?Q?cu/B7LPZIV4fwKtGaWvDgPBtc+IuI9nJYHCiEj2tvD2K+48zMMIiLjQnTDRP?=
 =?us-ascii?Q?61BlHmTaXBdh+65zZwQ5dJ4LFEwVEaUrV7kQhGWLQdOHmDxiz+5b?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 1614eb46-8e3a-410a-fdb4-08def88a7310
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 15:57:45.3336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y+1IOYPQLfD8Iv7ifpmfZHg45KEAX0xv8goIqbJydMgcVYscIuLUhAgBfdF25E27gX0BXTvwOzvx8dT86cR/nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4P286MB7069

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
Changes in v5:
  - Export LL event enum values for userspace trace format parsers.
    (Sashiko)

 drivers/dma/dw-edma/Makefile        |   2 +
 drivers/dma/dw-edma/dw-edma-core.c  |  49 ++++++++
 drivers/dma/dw-edma/dw-edma-core.h  |   2 +
 drivers/dma/dw-edma/dw-edma-trace.c |   4 +
 drivers/dma/dw-edma/dw-edma-trace.h | 176 ++++++++++++++++++++++++++++
 5 files changed, 233 insertions(+)
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
index 8dba7e02c944..261c7e770f63 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -423,6 +423,12 @@ static void dw_edma_core_ll_start(struct dw_edma_desc *desc)
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
@@ -484,6 +490,7 @@ static int dw_edma_start_transfer(struct dw_edma_chan *chan)
 		if (desc->start_burst == desc->nburst)
 			continue;
 
+		trace_edma_append_desc(desc);
 		dw_edma_core_start(desc);
 		ret = 1;
 	}
@@ -618,6 +625,7 @@ static bool dw_edma_ll_consume_progress(struct dw_edma_chan *chan, int idx)
 		/* Hardware has consumed this descriptor's LL entries. */
 		dw_hdma_set_callback_result(vd, DMA_TRANS_NOERROR);
 		list_del(&vd->node);
+		trace_edma_complete_desc(desc);
 		vchan_cookie_complete(vd);
 	}
 
@@ -959,6 +967,44 @@ dw_edma_engine_recovery_drain_irqs(struct dw_edma_engine_recovery *rec)
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
@@ -1085,6 +1131,8 @@ static void dw_edma_engine_recovery_work(struct work_struct *work)
 		return;
 	}
 
+	dw_edma_trace_engine_recovery(rec);
+
 	if (!dw->core->engine_reset(dw, rec->dir)) {
 		unsigned long delay = 0;
 
@@ -1707,6 +1755,7 @@ static void dw_edma_ll_interrupt(struct dw_edma_chan *chan)
 	if (!dw_edma_ll_snapshot_take(chan, &snapshot))
 		return;
 
+	trace_edma_irq(chan, &snapshot);
 	if (chan->status == EDMA_ST_PAUSE)
 		return;
 
diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
index b721d0926de5..bbca2d611c95 100644
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
index 000000000000..cf78e299049f
--- /dev/null
+++ b/drivers/dma/dw-edma/dw-edma-trace.h
@@ -0,0 +1,176 @@
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
+TRACE_DEFINE_ENUM(DW_EDMA_LL_EVENT_NONE);
+TRACE_DEFINE_ENUM(DW_EDMA_LL_EVENT_PROGRESS);
+TRACE_DEFINE_ENUM(DW_EDMA_LL_EVENT_STOP);
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
+		  __print_symbolic(__entry->event,
+				   { DW_EDMA_LL_EVENT_NONE, "none" },
+				   { DW_EDMA_LL_EVENT_PROGRESS, "progress" },
+				   { DW_EDMA_LL_EVENT_STOP, "stop" }),
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

