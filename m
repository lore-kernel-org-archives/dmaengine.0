Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11021140.outbound.protection.outlook.com [52.101.125.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE014156E5;
	Thu, 23 Jul 2026 08:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784796146; cv=fail; b=uJbWp87qsPNK+MkwD4CfbK42gH8Ll1a1kIeBCwiFGreUtoEaTBtLE3X/8nuep4ApcWWnmOEA0dSUSe9dUHdclWEiQsA7YpwXPQ97V2lA2Q2qWjW6pfVQ7TIngCHSPonaFRS1QbaNXJv5Z868Da2XLuLB+dNFGppldATb4cla4x0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784796146; c=relaxed/simple;
	bh=RDchSgL71FEoCnn7VkEauhwbhS6q8MULksuhiE9rItA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QbCmytsuiW/fwNv4jFTW7v0Y+EAD0F2n54y4PhWTTUBuJ1vF3D+s6OQycWjydBq1tdxj7HrV42/LntslcT6RsWxUj29T9xSh4OtaPfMuUuDd93oysHAxLN+B55wzUjHDOBh0pqznuseP22uJySZwZuteHi1PSBcK7T4dfp2vJZA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=esqN45on; arc=fail smtp.client-ip=52.101.125.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="esqN45on"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IBR6jNVC3kofy+wMpKEE/al7xMJ5nr86oUCxTD6qyvcDhcRMkpJ38tvSpOFpAFO9qQhuRwC5V6tdxbgjjCHnQPrz+HQpxscSDORbHQgQp7Mm0T2yIqTiZWewP0iJyO5uyYKyct64Bp1/wK70oDa9I55fRnp4cxJS1G2FS3zU3pgyZ+6/EOybhtDWwWqwMBH2C08WeN9MoT1QlU88kBDTM7Q8V7EtMV6jkJRDyortzXL8c1tWOgA6C0fMHJxBQfUJ/5hvc8Vu0ZdVqH8lcPnltqMa2xWx1t5F1RBJU8NLOAmcAERGckKW84mI5CI+RioXZpIE77a00ert9weNu5n1rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wDlNQ1hz+k0ZzaMLe6G3JcEunV5Dhqa6wMXRNFmEWk4=;
 b=zC2jDhf4qgi5O4Wx9Wlc/0dHsgwvWX1vuhShFGhfEjiGrluXLlBM+cBa1qmtziwLV8C4vvOyG4Z0z8hcOvU6QNPujUMgg3QDi40iuEsnO+4rMf7F7eS5SQfUWq+JYiRQY7cYa05sya5XjcZAw5BbBoLdbObtSdesNRefV2p3l31mrKcnIeVmtGztJ7xNezf3NzpsKWFzBchi2wSF2TjXalyWroXj5zbuKEur4zQZmkwh/uJV9VXnnKGrsBLNPjWZt+MGhU7oqLj54BiSWXBMMugyqoaoRP/mv/rFA6aoyB8BrN3HmBK2S03tASCpIleV/PMD5b4Z6A59FpfM8afXEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wDlNQ1hz+k0ZzaMLe6G3JcEunV5Dhqa6wMXRNFmEWk4=;
 b=esqN45onUy6unKJsGCNqQ628QPw+mFsDtOOtSisratO1r9kDmS+e5u9oEWuL3lUHvhu9BOSzW+qzf95Q88rCbld4a7YH46v0japibGkRHD/OIOYWAbojHYIgzs9P5cC7yTanbzLLW73aGbNZ9tYwgKGvHR8fjdfBPj1fEobtSx8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYYP286MB1883.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:111::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 08:42:11 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 08:42:09 +0000
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
Subject: [PATCH v2 16/19] dmaengine: dw-edma: Add engine recovery infrastructure
Date: Thu, 23 Jul 2026 17:41:47 +0900
Message-ID: <20260723084150.521366-17-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260723084150.521366-1-den@valinux.co.jp>
References: <20260723084150.521366-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0010.jpnprd01.prod.outlook.com
 (2603:1096:405:26e::18) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYYP286MB1883:EE_
X-MS-Office365-Filtering-Correlation-Id: 89b9dabc-ebb3-4632-860c-08dee8964894
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|10070799003|366016|1800799024|921020|6133799003|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	MqE3WNlcPfuiiwtBNi25pYbgFdc9L1nK0nXTHxKWolCLZfj2GOZXwsCe5IVNliijE6En3qZwhkwKZbLi+46Q+FBAWi0jMcxepuSYKXEUDpz23B152mvb5u2p5SMyiBelHpJdnhpvwjfxUTJ2qdtIJhYEr5M/I8rGefI1yc5nf/QfvRyhBKaNYgETgvRJqOvfB4Rup012smvaSK8au2ZA0EEfyun9zagoRY7Hh1+dYn0DmUuYRotATNtf1UusSPaxJw9BeR7FQv6o5vH6M3wfLG7qEFl0udrJtJZ2q8DXKFRq1Yvf2TrvDc9O9InCxtwAkV71CfyEzkNo6Lci7mJ1o22cJtIrG/JHjLPSvlULO1KH/w3iXF5ITRJR4kgBNnCNCbtzkDMnbOWOoEg74OES5UwftzcoHrvYHXfIaqoqnSZHkJEBBoGMfrwnLnvZ256jjam9JI6kjBwH1gNbnaqn4Z8o8k7Rz2aGTYHEyeCCKBWQHILVdjqhvQNgD83Kc8WFEwVvkGwBe1n1bz8L+dsYMuVydHm/y+UNLIIOaB4pQ2W9kibTfRic1eQhF5GY/vSHMFJwTUMb2W+Wgsds5LxWjVqvOzBS59IvT4LICG3fqeGKP63SXda5AU04MXvvHGYjBCqindjUJ2E878XQGDAc9oJB1zeNwLCCXxzUBR2eVXabTXrtwi32LQ9hAQLG7748/oLTtPwyDgoW06HUF4u21A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(10070799003)(366016)(1800799024)(921020)(6133799003)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HMxVgCuMLc3YxzmEFMMYoGTwN7cMzehOu4eJZAQxjaYiqNtA2X5XGDiaBCrR?=
 =?us-ascii?Q?s7epP0hMRVlPYqa3LLylEi1Oi/KNp6u/fO7urBKsomkoBTfeqEHVFlSHiflv?=
 =?us-ascii?Q?1qsIBPJz6xlrfiv0DP2zLQ3x4x/btnskIZTAulQU8mzcr5r8usDPoV2ImqnX?=
 =?us-ascii?Q?uLtl5bgz670prjG30R4sewZY/Zx+LG05R8pYsB31PZZT4VxTIY/RAP+pR87N?=
 =?us-ascii?Q?EY2GSLTq9SzeFTppQUO6nSvacqNFuA+XgtScLXxUyYrTfpjAHuxNnxL7Zq9y?=
 =?us-ascii?Q?bNwigvcOMyUXZYd9i5SVRx7nEd+UE81pmIBAk+zoqntMI+v8RuoB9KYx7cjl?=
 =?us-ascii?Q?J2PZd7ZQqGZacn+6NNALomLJ2JXfUX553LpwhRU0VIcoA2Dm/C1Z2yF30CsN?=
 =?us-ascii?Q?bV0EN43IRaJXwxKHP7v0aUxyhvDw9yEHR/s6bVUDWrFF66nWxDe7eBHgLeET?=
 =?us-ascii?Q?UbUch7WOWnIslPH3I3NmKCGlQngPIOeSmFv5flX03zgtwTJ/Y12dzhslDPGZ?=
 =?us-ascii?Q?pXguhTdAo1Vr2BebobqK7tvPDfpTFmY0krQa8ekK+e8jU1jaMD4Zye7SHm0F?=
 =?us-ascii?Q?8XUoMYdY5TWlD72zoGXs3ZCR6pNtbuYk7BHC5GE+HQrneil7xtpjzb2yMvlR?=
 =?us-ascii?Q?z/2xXirDw2ak+Zq/y7wWfq2DITOnOGDpQHGOb1jk60PMqT7IRa1GODfhl7YJ?=
 =?us-ascii?Q?COgb46FgjK2z2Ifjh3mcRyNe+qCLXatMx2yA8bmwnRpj5LHGzdNRfKrraFcG?=
 =?us-ascii?Q?RYvb4co2a9+Co1ku6PEGnCcYspIM7xh9LX2rZ+fjKH+S8Hmyu1FOVZFgTakf?=
 =?us-ascii?Q?W9lyOM3EufQsO90XAKFWfkJRbxtYv2JrfYieHRkQJFn/DLLDe4mVEPTq9QEJ?=
 =?us-ascii?Q?xUFb6/FbLKj/B/sVbhaI9c1CATdMqL4AhpgjorQUMXaXpM+pFmcmKGa06q78?=
 =?us-ascii?Q?Sdx940tUNaR5I3NUVlJjMKROg1tnRGAX1NnvDSl52Q7Sf1maDG3cxQyiuY5e?=
 =?us-ascii?Q?S0Qopg4OG8cTGsekPVA0QknXatHfXBfzr7qFfGON+0loOmQ1B03dV5mVMcsq?=
 =?us-ascii?Q?j+z1ueoWVJ4kpEo5tz2hw7r3u4/UU2LvE8DHDVPR+YfGxebPKtJwY/H6IW+D?=
 =?us-ascii?Q?DQdvzojxTCo58IPfPvCSQGellkt1WEKKJMLINJxrcvOzVy/UDyGH3JyN/Pag?=
 =?us-ascii?Q?zbdQpVz3bE2mGbx5gX8SSbwzf4GSAzKUVgMabsFVSCotQvdBMMJFdrk6lFrg?=
 =?us-ascii?Q?7wo9eoPKCZqX1sTj9Y/QTUBjwkv5ptucloNfKV0aL2hNUsj7yJ75ToQS+ff3?=
 =?us-ascii?Q?lfsbEF1rbm/3bzQSZtcZM99GFblDo+OzjYTC6qgvRZbyT1Ik0/SJJ0p4NsjX?=
 =?us-ascii?Q?VUNKvNNzDSAhmIbhqZ64BrtgHzaLqOke1WR0Ct2KRFHcPey7t2QOjvT5TLq4?=
 =?us-ascii?Q?lNskGrGyajDKkj6S9/WODGTtwkD2DPyBJJN8tZv5/V6Cx1auAxG6e/6NQPrS?=
 =?us-ascii?Q?nJAqY3HP4gAvs6sl4N3QdZnsjrT1sLeBBFXisuPUmTd7WBu9KcQtHLbDRYpZ?=
 =?us-ascii?Q?I7Pl+n3U9LJrM/WQRihwgUEzYsbihpNq1TjgbFDoa/oZ8pRLDIWCCMjTN/4q?=
 =?us-ascii?Q?m4K5kqumx152Db//x9bKIre2kOTNrOFsaikLXAvY8CIDZzDm1Iqfi2RQeu9f?=
 =?us-ascii?Q?MTRsGeen965Dth20op/IWLu4TpXCvLslWLbQ3G18f+C46pNarruMsStW5PON?=
 =?us-ascii?Q?3CqBxtadlS9bLBVJ8ZxwGYd29Srnj5QVXep1uhv85jXuSZNtCe9F?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 89b9dabc-ebb3-4632-860c-08dee8964894
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 08:42:09.4415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TNTKAezIAFQNlHa1YAIUEsvByAmdBqF4Gif+hfsLxNBi5wiMhqGUXhmZFBbfzjPMou1t/hjFzHVdwRfE6b4U5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB1883

Resetting one direction affects every channel in it. Add a worker to
coordinate that recovery.

Gate publication and doorbells, then wait for active LL channels to stop.
If a transfer is still active, compare two transfer-size samples. Retry
when it is moving; treat an unchanged value as frozen.

For a frozen direction, reset the engine, synchronize hard and deferred
IRQ handling, rebuild configured LL contexts while the engine is disabled,
and then enable it. Honor EDMA_REQ_STOP and EDMA_REQ_PAUSE during the
rebuild. After five reset failures, leave the channels gated.

Providers opt in with engine_reset(), engine_enable(), and
ch_transfer_size(). Disable recovery before shutdown. No caller requests
recovery until the next patch.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v2:
  - New patch.

 drivers/dma/dw-edma/dw-edma-core.c | 291 ++++++++++++++++++++++++++++-
 drivers/dma/dw-edma/dw-edma-core.h |  30 ++-
 2 files changed, 310 insertions(+), 11 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index 9305137f85f6..14cd0038dbd2 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -24,6 +24,10 @@
 #include "../dmaengine.h"
 #include "../virt-dma.h"
 
+#define DW_EDMA_ENGINE_QUIESCE_TIMEOUT_MS	250
+#define DW_EDMA_ENGINE_RESET_MAX_FAILS		5
+#define DW_EDMA_MAX_DIR_CH			MAX(HDMA_MAX_WR_CH, HDMA_MAX_RD_CH)
+
 static inline
 struct dw_edma_desc *vd2dw_edma_desc(struct virt_dma_desc *vd)
 {
@@ -125,6 +129,7 @@ static void dw_edma_core_reset_ll(struct dw_edma_chan *chan)
 	chan->ll_head = 0;
 	chan->ll_done = 0;
 	dw_edma_ll_irq_idx_discard(chan);
+	chan->ll_recovery_pending = false;
 	/* Drop stale CB bits before reusing the circular LL ring. */
 	for (i = 0; i < chan->ll_max; i++)
 		dw_edma_core_ll_clear(chan, i);
@@ -178,6 +183,7 @@ static bool dw_edma_ll_advance(struct dw_edma_chan *chan, int idx, u32 *old_done
 
 	*old_done = chan->ll_done;
 	chan->ll_done = idx;
+	chan->ll_recovery_pending = false;
 
 	return true;
 }
@@ -275,6 +281,10 @@ static int dw_edma_start_transfer(struct dw_edma_chan *chan)
 	struct dw_edma_desc *desc;
 	struct virt_dma_desc *vd;
 
+	/* Stop publishing until recovery can rebuild and republish the ring. */
+	if (!chan->non_ll && chan->ll_recovering)
+		return 0;
+
 	vd = vchan_next_desc(&chan->vc);
 	if (!vd)
 		return 0;
@@ -468,8 +478,11 @@ static bool dw_edma_ll_reconcile_and_refill(struct dw_edma_chan *chan)
 /* Must be called with vc.lock held. */
 static void dw_edma_core_ch_maybe_doorbell(struct dw_edma_chan *chan)
 {
-	if (chan->non_ll || chan->request != EDMA_REQ_NONE ||
-	    chan->status != EDMA_ST_BUSY || !dw_edma_ll_pending(chan))
+	if (chan->non_ll ||
+	    chan->ll_recovering ||
+	    chan->request != EDMA_REQ_NONE ||
+	    chan->status != EDMA_ST_BUSY ||
+	    !dw_edma_ll_pending(chan))
 		return;
 
 	/*
@@ -486,6 +499,258 @@ static void dw_edma_core_ch_maybe_doorbell(struct dw_edma_chan *chan)
 	dw_edma_core_ch_doorbell(chan);
 }
 
+static bool
+dw_edma_engine_recovery_needed(struct dw_edma_engine_recovery *rec)
+{
+	struct dw_edma *dw = rec->dw;
+	u16 off = rec->dir == EDMA_DIR_WRITE ? 0 : dw->wr_ch_cnt;
+	u16 cnt = rec->dir == EDMA_DIR_WRITE ? dw->wr_ch_cnt : dw->rd_ch_cnt;
+	struct dw_edma_chan *chan;
+	bool found = false;
+	bool needed;
+	u16 i;
+
+	for (i = 0; i < cnt; i++) {
+		chan = &dw->chan[off + i];
+		scoped_guard(spinlock_irqsave, &chan->vc.lock) {
+			needed = chan->ll_recovery_pending && chan->configured &&
+				 !chan->non_ll &&
+				 chan->status != EDMA_ST_PAUSE;
+			if (needed && chan->request == EDMA_REQ_NONE &&
+			    dw_edma_ll_reconcile_and_refill(chan))
+				dw_edma_core_ch_maybe_doorbell(chan);
+			needed = needed && chan->ll_recovery_pending &&
+				 dw_edma_ll_pending(chan);
+			if (!needed)
+				chan->ll_recovery_pending = false;
+		}
+		found |= needed;
+	}
+
+	return found;
+}
+
+static void
+dw_edma_engine_recovery_release(struct dw_edma_engine_recovery *rec)
+{
+	struct dw_edma *dw = rec->dw;
+	u16 off = rec->dir == EDMA_DIR_WRITE ? 0 : dw->wr_ch_cnt;
+	u16 cnt = rec->dir == EDMA_DIR_WRITE ? dw->wr_ch_cnt : dw->rd_ch_cnt;
+	struct dw_edma_chan *chan;
+	u16 i;
+
+	rec->fails = 0;
+
+	for (i = 0; i < cnt; i++) {
+		chan = &dw->chan[off + i];
+		guard(spinlock_irqsave)(&chan->vc.lock);
+		chan->ll_recovering = false;
+
+		if (chan->configured && !chan->non_ll &&
+		    chan->request == EDMA_REQ_NONE &&
+		    chan->status != EDMA_ST_PAUSE) {
+			dw_edma_start_transfer(chan);
+			chan->status = dw_edma_ll_pending(chan) ?
+				       EDMA_ST_BUSY : EDMA_ST_IDLE;
+			dw_edma_core_ch_maybe_doorbell(chan);
+		}
+	}
+
+	WRITE_ONCE(rec->active, false);
+}
+
+static void
+dw_edma_engine_recovery_sync_irqs(struct dw_edma_engine_recovery *rec)
+{
+	struct dw_edma *dw = rec->dw;
+	struct device *dev = dw->chip->dev;
+	u16 off = rec->dir == EDMA_DIR_WRITE ? 0 : dw->wr_ch_cnt;
+	u16 cnt = rec->dir == EDMA_DIR_WRITE ? dw->wr_ch_cnt : dw->rd_ch_cnt;
+	struct dw_edma_chan *chan;
+	u16 i;
+
+	/* Wait until no hard IRQ can queue an event from the old contexts. */
+	for (i = 0; i < dw->nr_irqs; i++) {
+		if (bitmap_empty(rec->dir == EDMA_DIR_WRITE ?
+				 dw->irq[i].wr_mask : dw->irq[i].rd_mask, cnt))
+			continue;
+
+		synchronize_irq(dw->chip->ops->irq_vector(dev, i));
+	}
+
+	for (i = 0; i < cnt; i++) {
+		chan = &dw->chan[off + i];
+		cancel_work_sync(&chan->irq_work);
+
+		guard(spinlock_irqsave)(&chan->vc.lock);
+		atomic_set(&chan->irq_pending, 0);
+		dw_edma_ll_irq_idx_discard(chan);
+	}
+}
+
+static void dw_edma_engine_recovery_work(struct work_struct *work)
+{
+	struct dw_edma_engine_recovery *rec =
+		container_of(work, struct dw_edma_engine_recovery, work);
+	struct dw_edma *dw = rec->dw;
+	const char *dir_name = str_write_read(rec->dir == EDMA_DIR_WRITE);
+	u16 off = rec->dir == EDMA_DIR_WRITE ? 0 : dw->wr_ch_cnt;
+	u16 cnt = rec->dir == EDMA_DIR_WRITE ? dw->wr_ch_cnt : dw->rd_ch_cnt;
+	unsigned long timeout =
+		jiffies + msecs_to_jiffies(DW_EDMA_ENGINE_QUIESCE_TIMEOUT_MS);
+	struct dw_edma_chan *chan;
+	bool configured_ll;
+	bool busy;
+	u16 i;
+
+	if (!dw_edma_engine_recovery_needed(rec)) {
+		if (READ_ONCE(rec->active))
+			dw_edma_engine_recovery_release(rec);
+		return;
+	}
+
+	WRITE_ONCE(rec->active, true);
+
+	/* Gate each channel before inspecting or resetting the direction. */
+	for (i = 0; i < cnt; i++) {
+		chan = &dw->chan[off + i];
+		guard(spinlock_irqsave)(&chan->vc.lock);
+		chan->ll_recovering = true;
+	}
+
+	/*
+	 * Gated channels stop at their first unpublished element. Wait for that
+	 * point before resetting; otherwise a restart could skip the remainder
+	 * of an in-flight element.
+	 */
+	do {
+		busy = false;
+		for (i = 0; i < cnt; i++) {
+			chan = &dw->chan[off + i];
+			scoped_guard(spinlock_irqsave, &chan->vc.lock)
+				configured_ll = chan->configured && !chan->non_ll;
+			if (configured_ll &&
+			    dw_edma_core_ch_status(chan) == DMA_IN_PROGRESS)
+				busy = true;
+		}
+		if (!busy)
+			break;
+		fsleep(1000);
+	} while (time_before(jiffies, timeout));
+
+	/* Progress after queueing makes this recovery request obsolete. */
+	if (!dw_edma_engine_recovery_needed(rec))
+		goto out_release;
+
+	if (busy) {
+		DECLARE_BITMAP(busy_mask, DW_EDMA_MAX_DIR_CH) = { 0 };
+		u32 tsz[DW_EDMA_MAX_DIR_CH];
+		bool moving = false;
+
+		/*
+		 * A transfer_size change or a transition out of DMA_IN_PROGRESS
+		 * shows movement after the first sample. Retry while producers
+		 * remain gated. If neither occurs, treat the channel as frozen
+		 * within one element.
+		 */
+		for (i = 0; i < cnt; i++) {
+			chan = &dw->chan[off + i];
+			scoped_guard(spinlock_irqsave, &chan->vc.lock)
+				configured_ll = chan->configured && !chan->non_ll;
+			if (configured_ll &&
+			    dw_edma_core_ch_status(chan) == DMA_IN_PROGRESS) {
+				__set_bit(i, busy_mask);
+				tsz[i] = dw_edma_core_ch_transfer_size(chan);
+			}
+		}
+		fsleep(1000);
+		for_each_set_bit(i, busy_mask, cnt) {
+			chan = &dw->chan[off + i];
+			if (dw_edma_core_ch_status(chan) != DMA_IN_PROGRESS ||
+			    tsz[i] != dw_edma_core_ch_transfer_size(chan))
+				moving = true;
+		}
+		if (!dw_edma_engine_recovery_needed(rec))
+			goto out_release;
+		if (moving) {
+			dev_warn_ratelimited(dw->chip->dev,
+					     "%s engine quiesce timed out with transfers still progressing, retrying\n",
+					     dir_name);
+			queue_work(dw->wq, &rec->work);
+			return;
+		}
+
+		dev_warn(dw->chip->dev,
+			 "%s engine reset with a channel frozen mid-element\n",
+			 dir_name);
+	}
+
+	if (!dw_edma_engine_recovery_needed(rec))
+		goto out_release;
+
+	if (!dw->core->engine_reset(dw, rec->dir)) {
+		/*
+		 * Keep channels gated and do not re-enable the engine unless
+		 * ENGINE_EN clears.
+		 */
+		if (++rec->fails >= DW_EDMA_ENGINE_RESET_MAX_FAILS) {
+			dev_err(dw->chip->dev,
+				"%s engine did not drain after %u attempts; leaving channels gated\n",
+				dir_name, rec->fails);
+			return;
+		}
+		queue_work(dw->wq, &rec->work);
+		return;
+	}
+
+	if (rec->fails)
+		dev_warn(dw->chip->dev, "%s engine drained after %u retries\n",
+			 dir_name, rec->fails);
+
+	dw_edma_engine_recovery_sync_irqs(rec);
+
+	/*
+	 * Keep the engine disabled until every configured LL channel context is
+	 * rebuilt. On the tested integration, re-enabling a preserved context
+	 * resumed an old element without a doorbell, causing an IOMMU fault and
+	 * stalling the engine again. Reset each ring so it starts from a fresh
+	 * context.
+	 */
+	for (i = 0; i < cnt; i++) {
+		bool stop;
+
+		chan = &dw->chan[off + i];
+		guard(spinlock_irqsave)(&chan->vc.lock);
+
+		if (chan->configured && !chan->non_ll) {
+			/* Honor EDMA_REQ_STOP and EDMA_REQ_PAUSE instead of republishing. */
+			stop = chan->request == EDMA_REQ_STOP;
+			if (stop)
+				dw_edma_terminate_all_descs(chan);
+
+			dw_edma_core_reset_ll(chan);
+
+			if (stop) {
+				chan->request = EDMA_REQ_NONE;
+				chan->status = EDMA_ST_IDLE;
+			} else if (chan->request == EDMA_REQ_PAUSE) {
+				chan->request = EDMA_REQ_NONE;
+				chan->status = EDMA_ST_PAUSE;
+			}
+		}
+	}
+
+	dw->core->engine_enable(dw, rec->dir);
+	dw_edma_engine_recovery_release(rec);
+
+	dev_warn(dw->chip->dev, "%s engine was reset to recover a stalled channel\n",
+		 dir_name);
+	return;
+
+out_release:
+	dw_edma_engine_recovery_release(rec);
+}
+
 static void dw_edma_device_caps(struct dma_chan *dchan,
 				struct dma_slave_caps *caps)
 {
@@ -1640,6 +1905,13 @@ int dw_edma_probe(struct dw_edma_chip *chip)
 
 	raw_spin_lock_init(&dw->lock);
 
+	for (i = 0; i < ARRAY_SIZE(dw->eng_recovery); i++) {
+		dw->eng_recovery[i].dw = dw;
+		dw->eng_recovery[i].dir = i;
+		INIT_WORK(&dw->eng_recovery[i].work,
+			  dw_edma_engine_recovery_work);
+	}
+
 	/*
 	 * chip->ll_*_cnt describes the channels exposed by this instance. Keep
 	 * the usable hardware counts separate for partial ownership checks.
@@ -1738,11 +2010,6 @@ int dw_edma_remove(struct dw_edma_chip *chip)
 	if (!dw)
 		return -ENODEV;
 
-	if (chip->flags & DW_EDMA_CHIP_PARTIAL)
-		err = dw_edma_core_quiesce(dw);
-	else
-		dw_edma_core_off(dw);
-
 	/* Free irqs */
 	for (i = (dw->nr_irqs - 1); i >= 0; i--)
 		free_irq(chip->ops->irq_vector(dev, i), &dw->irq[i]);
@@ -1751,6 +2018,16 @@ int dw_edma_remove(struct dw_edma_chip *chip)
 	for (i = 0; i < dw->wr_ch_cnt + dw->rd_ch_cnt; i++)
 		cancel_work_sync(&dw->chan[i].irq_work);
 
+	/* Prevent a running recovery worker from requeueing itself. */
+	disable_work_sync(&dw->eng_recovery[0].work);
+	disable_work_sync(&dw->eng_recovery[1].work);
+
+	/* A recovery worker can re-enable the engine, so stop it last. */
+	if (chip->flags & DW_EDMA_CHIP_PARTIAL)
+		err = dw_edma_core_quiesce(dw);
+	else
+		dw_edma_core_off(dw);
+
 	destroy_workqueue(dw->wq);
 
 	/* Deregister eDMA device */
diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
index e3b42ad14f78..5520f49a76f1 100644
--- a/drivers/dma/dw-edma/dw-edma-core.h
+++ b/drivers/dma/dw-edma/dw-edma-core.h
@@ -104,6 +104,10 @@ struct dw_edma_chan {
 	bool				ll_irq_stopped;
 	bool				ll_irq_requested;
 
+	/* Per-channel recovery state. */
+	bool				ll_recovery_pending;
+	bool				ll_recovering;
+
 	u32				ll_max;		/* Data entries */
 	struct dw_edma_region		ll_region;	/* Linked list */
 	bool				ll_valid;	/* LL context programmed */
@@ -133,6 +137,18 @@ struct dw_edma_irq {
 	DECLARE_BITMAP(rd_mask, HDMA_MAX_RD_CH);
 };
 
+/*
+ * Direction-wide recovery state. active prevents duplicate recovery work;
+ * each channel's ll_recovering flag gates publication and doorbells.
+ */
+struct dw_edma_engine_recovery {
+	bool				active;
+	unsigned int			fails;
+	struct work_struct		work;
+	struct dw_edma			*dw;
+	enum dw_edma_dir		dir;
+};
+
 struct dw_edma {
 	char				name[32];
 
@@ -147,11 +163,13 @@ struct dw_edma {
 	struct dw_edma_chan		*chan;
 
 	/*
-	 * WQ_HIGHPRI keeps completion processing responsive under heavy load;
-	 * WQ_UNBOUND lets different channels run on different CPUs.
+	 * WQ_HIGHPRI keeps completion and recovery work responsive under heavy
+	 * load; WQ_UNBOUND lets independent work run on different CPUs.
 	 */
 	struct workqueue_struct		*wq;
 
+	struct dw_edma_engine_recovery	eng_recovery[2];
+
 	raw_spinlock_t			lock;		/* Protect v0 shared registers */
 
 	struct dw_edma_chip             *chip;
@@ -167,6 +185,10 @@ struct dw_edma_core_ops {
 	int (*ch_quiesce)(struct dw_edma_chan *chan);
 	u16 (*ch_count)(struct dw_edma *dw, enum dw_edma_dir dir);
 	enum dma_status (*ch_status)(struct dw_edma_chan *chan);
+	/*
+	 * Recovery is available only when ch_transfer_size, engine_reset, and
+	 * engine_enable are all provided.
+	 */
 	u32 (*ch_transfer_size)(struct dw_edma_chan *chan);
 	irqreturn_t (*handle_int)(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
 				  dw_edma_handler_t done,
@@ -180,7 +202,7 @@ struct dw_edma_core_ops {
 	int (*ll_cur_idx)(struct dw_edma_chan *chan);
 	/* Called with chan->vc.lock held. */
 	bool (*ll_irq)(struct dw_edma_desc *desc, u32 i, u32 free);
-	/* Reset one direction, discard its IRQ status, and leave it disabled. */
+	/* Reset one direction, clear its IRQ status, and leave it disabled. */
 	bool (*engine_reset)(struct dw_edma *dw, enum dw_edma_dir dir);
 	void (*engine_enable)(struct dw_edma *dw, enum dw_edma_dir dir);
 	void (*ch_doorbell)(struct dw_edma_chan *chan);
@@ -313,7 +335,7 @@ static inline void dw_edma_core_ch_doorbell(struct dw_edma_chan *chan)
 static inline void dw_edma_core_ch_enable(struct dw_edma_chan *chan)
 {
 	chan->dw->core->ch_enable(chan);
-	if (chan->dw->core->engine_enable)
+	if (!chan->ll_recovering && chan->dw->core->engine_enable)
 		chan->dw->core->engine_enable(chan->dw, chan->dir);
 }
 
-- 
2.51.0

