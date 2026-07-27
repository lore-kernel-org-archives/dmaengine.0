Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021072.outbound.protection.outlook.com [40.107.74.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329B4433BA4;
	Mon, 27 Jul 2026 17:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785171830; cv=fail; b=hEM3/UKp7Sl7DNo/hhGo3STS1sQzR1Sn/35GG8zCI8HqVZz1UO3bPu9Di8kxvgH3h2lXr1I8gTvIhOvy9fSkCz+LH0OUT545NJg4eP0qxHxlW7qRACAtTaAnmv+JAv7BymQ5mQeGwKAO0k76E6uarjlbJhp360ca+X4M38ZIWMg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785171830; c=relaxed/simple;
	bh=Nxy4ehbIhKJzelG0dQczIcqW1QBcWau8jCP0AuMK/68=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iB9V8vpAlaWn9fMH17k2SYigkTOxQmw70+0G12cJN6k/wdZDvIPeNfV6eCEHAjtsetyF/QIwiHXatEwmsYyApMmc8w0gOr9ZZA6biXQpQaOB28W+KiRLTpohztQ83IkT7XBvC1hQkPIh3LLrnVlbIESYNpc7/Gm+w5lIgna+zrI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=C43hgPcF; arc=fail smtp.client-ip=40.107.74.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="C43hgPcF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ywD5kCjPSnEEBwdeTD76LKu6/3OD02szI54HRiDBZsVvlDYkACeC9npjES75j+xFhbeS8DZRq6B0LFZyPvgt3pGyCQK+WA70Sncu+GOKtpAIPCigHY0NYkg6NFUiqn3Ofn/gC3MuSUBVFDHj40ZpeloHPK2mEAUJls9UqBXWTYOMo1vEOMaePIs/B4d0ecIkwp8i3V8AOmg+kkmLT+srZw7LSoZaG/xqxGNMubfsMutVjAmoAJjtlAoaS2SWS01Fe7ue13Q/u+a3zwLkIKvOWChWpVr6paQZQVNfRQ9Jok3w+M9cL6Gg9O7GmZu73ms4rFsV+HAKU6p4Twb4/Rl6/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iku8BRLAJsrNi36ZIe0+RBbuhz4f0M4tNrZF/DJlyXc=;
 b=jLE2S0rjbM8cWci6bsrD50uJ+n4hun64WmgHCzs68UwdNuqSyoGTDqIYrxTTENyIFbDlAlQSXvnfH16iMaZzBz0018SdFSVsdIHbTGlzbTmUuLPkWSiUsL6g06sv2KZjGdxCDZnc30E+SAB14QwPc2Iw9h1wyY5P0BykMMtHIaKYechUp8sMVJ68YLTaqvTJgOfsqwgTfPMA9+I0CF2BQorJXjb84gVJ3N+C64QETer4XHvgCTi/LzGDuYrtRDZZVWNyoV2sEGQDw2tGTfT/Z785NoviVmFmXdFUrUO5jfvH19bcUEpVq9ojJ0wOymW57T6y5s0VUlFbUn3Y7AUrAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iku8BRLAJsrNi36ZIe0+RBbuhz4f0M4tNrZF/DJlyXc=;
 b=C43hgPcFDTBXAbFQT5ZG9mmhealNpps0fY0CB+KCsFxiJ4nbkfUPk1/AFQ9jCZGKx4d5YOV+Mg15cUZbx7f+WCDm8bIeVDSyCYf6l83YqM0nxitXbd1UyhRREI0Nz4TRe2XDYEXrSW3rDFDi8goSQl1HNBjYlt7jj0mK7lUKBpM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYRP286MB4609.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:1a9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Mon, 27 Jul
 2026 17:03:41 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 17:03:41 +0000
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
Subject: [PATCH v3 12/24] dmaengine: dw-edma: Keep channels stopped while ABORT is pending
Date: Tue, 28 Jul 2026 02:03:11 +0900
Message-ID: <20260727170323.2321369-13-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260727170323.2321369-1-den@valinux.co.jp>
References: <20260727170323.2321369-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P301CA0012.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:26f::17) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYRP286MB4609:EE_
X-MS-Office365-Filtering-Correlation-Id: a7b87952-769e-457b-8937-08deec01023b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|376014|23010399003|10070799003|18002099003|22082099003|10067099003|56012099006|921020;
X-Microsoft-Antispam-Message-Info:
	Xi0Fcgb3vbKWdQMv8CYQRJAbQfOXChERX1L7qzCNcje5y+AboPleQEmvm8KPJ8UNAUwn25jQx90qj6P1WCI/DWL/xWaKqcyQX0zvZP8SaLfIxGtN2taTkCGyCPD5u7mhnr4SZ0Wt0v2MEhgfP71gku93mhuX/k5n7Du5tsOubTWbTYX6pb80W3iFStvgAPydtgeEHDCrgpVMDC57Nx38J78DYNEKivdl2FzbAd7dD4yPF851DzUH3yjdXcP/FlEtWyEdXEhVopIPc0p0q8dO8rqUxhj40DrwpxStg4xt36BlFBASSxboa2a3ZoQJUoV+2l0/KqfITsj9MTtSY4Y9n+uGwzfwFtXPlwsCANMgi6CkLHhJF7GEbAJ8rA9/hgwAywN7+aO8cyg1xMnEISaCnYHv0Iy7/1dha2jzXVQX/CFZUQrvwY4N9RKGeIVNX/mkLsQuUnGRnmbqkSlXeQNRo25yOWm2UGt+cUsce0ka8PzAVA92VW2aQKRlhOQTbBQBC4doPsXxPu9NPhebURd+um2/e/wBek6s3+mnZmALo4EoIwfpNfRxalrmGAUP5SN9Ytp65MdzJ9iiL3CcJ7qEVssXOhsV/lOHXE1OS3a/9Tdyc0ZhQj7SdZGnQ3Y6uBbjJgH70oDKiBAPOnJs0J8G3tHMP4YTDSHTDXk3OudC2KBSnWEEF7LQfxDeTdLAkokNY5IecRe6JcW55tncenCi6g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(23010399003)(10070799003)(18002099003)(22082099003)(10067099003)(56012099006)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Rm19/MchWSy8mk4skJDHydxVmMWmbkC4RYOyo8iOFXxX6KdDBwatkYOP34r8?=
 =?us-ascii?Q?hQmr/A5UiBpA0JbHx8r1X7z3wDJd22BGGhG2mDMzavxCqYqNw7hymwd9jtv6?=
 =?us-ascii?Q?KfkFZdBT7DCPL2L2PvfsYJ2t8OZhKmvKCwiZCtlQzQLsvVvFj6zFQ+L07K6C?=
 =?us-ascii?Q?A/Qu2bjgkeB0d9tVRhM5QMuuh2hDFbhCJ8AtbUbkY8EEraF1FOvMeCrOy+RJ?=
 =?us-ascii?Q?+1DHSx8lo7sjvWkS+1RN2zl2dK+Uax1Gj52fr76jm+yRJ/DGu9X4Jkq3B8EL?=
 =?us-ascii?Q?b60iYGyTwtNCkfuvdiZec77NLTXgupgnftE4WUemEKjJcDhqtRWMgSx4fyYT?=
 =?us-ascii?Q?Sq3Oxao8mxDjNki9SeaiGcG3r7AZZhLPGP1UQ91k+I737HFcwEynRDW3bHuy?=
 =?us-ascii?Q?nOjSIHAotnL7Rrn7bL8zFk+p83w3lm0HZQGQb1EAflt1kx5XzGoPsm2UEv3W?=
 =?us-ascii?Q?ViTva6dnj2ilixDTfAEjjV1NXL/fqnoiMxZ8X7Dcn84knA31bw8u+edhGvP/?=
 =?us-ascii?Q?h01qN/f2Aym7VAi0xjw8Q8DSA4vc6ovWN13gDrVY2KC+Ya4DeNZrk5sM1oK0?=
 =?us-ascii?Q?p9S3WVPKw3SZgp5Q4X7GPNfacpwG+DvZ6CUAnkrV0+i4MDHdAmIdHHCmFcMS?=
 =?us-ascii?Q?ja0GLRcM7ctHY/HHD4Pb5Rg1tx7bgzH3U4dgE61MhbEwAYf9Gm1eIqQFl+x7?=
 =?us-ascii?Q?y5CpwiJiWcUykiiS0pNXWyFr13MdGreVm44La4SpQl/IA0br+dLvsKf8ODfN?=
 =?us-ascii?Q?HLYZ0TLqPoDzqTUue2wPGob7um8OWNQjVt0OyzvcY8gS8ck2tI9YXPHd260Y?=
 =?us-ascii?Q?4IvwoGeSppIUsUDgYsDw9KgipSw8wWsEcCy2jXH6rXoSirW+7VXTu53csZ8/?=
 =?us-ascii?Q?1GT6nBAwMEnnBs2D4KcCq+C6ie/YL64BUp52jlEtMnSQqpimWxrfUow2kS2L?=
 =?us-ascii?Q?FNNQUknzVfDVyssw1B5SEO8fZjTok44JFZb6A2YmzLEJb1amQm6yOUn70ZBF?=
 =?us-ascii?Q?KWA3GsB1KzjIgNwycQGUg4dUuAxTYXTTfOpNqQ7t8h+aveSMeMkfl9ht8HwI?=
 =?us-ascii?Q?hhRlkoEKoeS87pHji7PoNHKi/JEL9RmjjnbGT3lZPJhDqEFXj+lpxBRYNJNb?=
 =?us-ascii?Q?sLA1M0pjHVk8e4XJVQX3WeAqkO4ctfZVICD2ddp2iLlhE8XbL0t7ydyaSFpa?=
 =?us-ascii?Q?BQgBDN+6Nk+FgMEL4KBFTvJPWg/IYh0XEFUrcJ2E+L3a1yJJMnf8mDbQiYyq?=
 =?us-ascii?Q?Ow4bdzVybwB7qb9UzIGKRCofuCXdVkGvpSzRBQEXniYoCSeAwLT09Ml1VyVR?=
 =?us-ascii?Q?+Anvjli+V8tbDJfc+L5rIs7RtltjtJnWcpc6+CohO0SLHcYrOfiXyDT1dbyH?=
 =?us-ascii?Q?zPOmu0CL1bTiIuRJFG6AM1iChBHxGsSROpnsV6Ckb7mO9PmZNLli5DCPBp1F?=
 =?us-ascii?Q?p8ZvS2AHcz4iqTC/TtkGGChjQ43IZh1ioZu95QMW9wVg9reZ3wTjNCCizKi5?=
 =?us-ascii?Q?xw+y00fhpAYIxvdGGI6dyumirDBNV4pHsR1cJaRQrAA2lhYPKLdKd4SqiWMT?=
 =?us-ascii?Q?uwO92xNAq4XBTZOXvLDgJ9rUzW47iUBViZ8Tfvs/3WE0Uf02TtXBQMS0x7mF?=
 =?us-ascii?Q?mi+rZNt/z/r+nArZYU0KgsCyphiaJARNsCY6tMBRLnXp1JGjegNO4D2ibNev?=
 =?us-ascii?Q?6G1gevYn2awC8QGrPogM70AMOoVOXn6TdlB8e1LFioiNt/cMiImfq918Kl2y?=
 =?us-ascii?Q?n6dQGKCXDFAF23GwRYjocdmGmmZL9XYKb8X1NVQbhYOxH0Q67DF5?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: a7b87952-769e-457b-8937-08deec01023b
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 17:03:41.0456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d7Wo17/ytxKhyBGniBfQiYVOE12TjbH05WrkgB0cNKXwpYSAZ0GMjAOjhlFdJoW7jqebR7ei6IR+PHlksPd74g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRP286MB4609

The hard IRQ path clears the ABORT interrupt status before deferred
handling. Keep the event pending until the worker has handled it;
otherwise a new start can race ahead after the status has been cleared.

Set abort_pending before clearing the status. Before a non-LL start or
LL doorbell, check both the pending flag and hardware status while
holding the event lock. This covers the case where the start path gets
the lock before the IRQ handler has latched the event.

Handle ABORT before coalesced DONE or LL work. Also block LL progress
consumers while ABORT is pending; tx_status() can otherwise complete a
descriptor before the ABORT worker runs. ABORT cleanup makes that
progress stale by completing or terminating descriptors and, for an LL
channel, resetting the ring. Clear abort_pending only after cleanup.

If termination sees a pending ABORT, leave EDMA_REQ_STOP set until the
ABORT worker finishes. This prevents dw_edma_device_synchronize() from
discarding the event before cleanup.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v3:
  - New patch to latch ABORT before clearing its interrupt status, block
    channel restart and LL progress consumers while it is pending, and
    keep termination pending until deferred cleanup completes. (Sashiko)

 drivers/dma/dw-edma/dw-edma-core.c    | 82 ++++++++++++++++++++++++---
 drivers/dma/dw-edma/dw-edma-core.h    | 17 ++++++
 drivers/dma/dw-edma/dw-edma-v0-core.c |  9 +++
 drivers/dma/dw-edma/dw-hdma-v0-core.c |  8 +++
 4 files changed, 107 insertions(+), 9 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index 3970b066dca2..5bf08ff0fe46 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -82,11 +82,30 @@ static void dw_edma_ll_snapshot_discard_locked(struct dw_edma_chan *chan)
 	chan->ll_irq.event = DW_EDMA_LL_EVENT_NONE;
 }
 
-static void dw_edma_ll_snapshot_discard(struct dw_edma_chan *chan)
+static void dw_edma_irq_events_discard(struct dw_edma_chan *chan)
 {
 	guard(raw_spinlock_irqsave)(dw_edma_event_lock(chan));
 
 	dw_edma_ll_snapshot_discard_locked(chan);
+	chan->abort_pending = false;
+}
+
+static bool dw_edma_abort_latch_locked(struct dw_edma_chan *chan)
+{
+	lockdep_assert_held(dw_edma_event_lock(chan));
+
+	if (!chan->abort_pending &&
+	    dw_edma_core_ch_abort_int_pending(chan))
+		dw_edma_abort_event_mark(chan);
+
+	return chan->abort_pending;
+}
+
+static bool dw_edma_abort_is_pending(struct dw_edma_chan *chan)
+{
+	guard(raw_spinlock_irqsave)(dw_edma_event_lock(chan));
+
+	return chan->abort_pending;
 }
 
 /* Must be called with vc.lock held. */
@@ -99,12 +118,23 @@ dw_edma_ll_snapshot_take(struct dw_edma_chan *chan,
 	if (chan->ll_irq.event == DW_EDMA_LL_EVENT_NONE)
 		return false;
 
+	if (dw_edma_abort_latch_locked(chan))
+		return false;
+
 	*snapshot = chan->ll_irq;
 	dw_edma_ll_snapshot_discard_locked(chan);
 
 	return true;
 }
 
+/* Must be called with vc.lock held. */
+static void dw_edma_abort_event_clear(struct dw_edma_chan *chan)
+{
+	guard(raw_spinlock_irqsave)(dw_edma_event_lock(chan));
+
+	chan->abort_pending = false;
+}
+
 static void dw_edma_ll_event_discard_locked(struct dw_edma_chan *chan)
 {
 	lockdep_assert_held(dw_edma_event_lock(chan));
@@ -253,7 +283,20 @@ static int dw_edma_start_transfer(struct dw_edma_chan *chan)
 	if (!desc)
 		return 0;
 
-	if (!chan->non_ll && !chan->ll_valid)
+	if (chan->non_ll) {
+		guard(raw_spinlock_irqsave)(dw_edma_event_lock(chan));
+
+		if (dw_edma_abort_latch_locked(chan))
+			return 0;
+
+		dw_edma_core_start(desc);
+		return 1;
+	}
+
+	if (dw_edma_abort_is_pending(chan))
+		return 0;
+
+	if (!chan->ll_valid)
 		dw_edma_core_reset_ll(chan);
 
 	dw_edma_core_start(desc);
@@ -293,6 +336,11 @@ static void dw_edma_terminate_all_descs(struct dw_edma_chan *chan)
 /* Must be called with vc.lock held after the channel has stopped. */
 static void dw_edma_finish_termination(struct dw_edma_chan *chan)
 {
+	if (dw_edma_abort_is_pending(chan)) {
+		dw_edma_set_request(chan, EDMA_REQ_STOP);
+		return;
+	}
+
 	dw_edma_terminate_all_descs(chan);
 
 	/* Preserve a clean ring; resync only if entries remain published. */
@@ -320,6 +368,9 @@ static void dw_edma_core_ch_kick(struct dw_edma_chan *chan)
 
 	guard(raw_spinlock_irqsave)(dw_edma_event_lock(chan));
 
+	if (dw_edma_abort_latch_locked(chan))
+		return;
+
 	/*
 	 * A recorded event belongs to the current ring and must be consumed
 	 * before starting another hardware run.
@@ -496,7 +547,8 @@ static int dw_edma_device_terminate_all(struct dma_chan *dchan)
 	} else {
 		dw_edma_set_request(chan, EDMA_REQ_STOP);
 	}
-	if (chan->status == EDMA_ST_IDLE)
+	if (chan->status == EDMA_ST_IDLE &&
+	    !dw_edma_abort_is_pending(chan))
 		dw_edma_set_request(chan, EDMA_REQ_NONE);
 
 	return err;
@@ -850,14 +902,19 @@ static void dw_edma_ll_interrupt(struct dw_edma_chan *chan)
 	dw_edma_done_interrupt_locked(chan);
 }
 
-static void dw_edma_abort_interrupt(struct dw_edma_chan *chan)
+static bool dw_edma_abort_interrupt(struct dw_edma_chan *chan)
 {
 	struct virt_dma_desc *vd;
 	unsigned long flags;
 
 	spin_lock_irqsave(&chan->vc.lock, flags);
+	if (!dw_edma_abort_is_pending(chan)) {
+		spin_unlock_irqrestore(&chan->vc.lock, flags);
+		return false;
+	}
+
 	vd = vchan_next_desc(&chan->vc);
-	if (vd && chan->request == EDMA_REQ_STOP) {
+	if (chan->request == EDMA_REQ_STOP) {
 		dw_edma_terminate_all_descs(chan);
 	} else if (vd) {
 		dw_hdma_set_callback_result(vd, DMA_TRANS_ABORTED);
@@ -868,7 +925,11 @@ static void dw_edma_abort_interrupt(struct dw_edma_chan *chan)
 		dw_edma_core_reset_ll(chan);
 	dw_edma_set_request(chan, EDMA_REQ_NONE);
 	chan->status = EDMA_ST_IDLE;
+	dw_edma_abort_event_clear(chan);
+
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
+
+	return true;
 }
 
 static void dw_edma_irq_work(struct work_struct *work)
@@ -880,12 +941,14 @@ static void dw_edma_irq_work(struct work_struct *work)
 	do {
 		events = atomic_xchg(&chan->irq_pending, 0);
 
+		/* ABORT cleanup makes coalesced DONE and LL work stale. */
+		if ((events & DW_EDMA_DEFERRED_ABORT) &&
+		    dw_edma_abort_interrupt(chan))
+			continue;
 		if (events & DW_EDMA_DEFERRED_DONE)
 			dw_edma_done_interrupt(chan);
 		if (events & DW_EDMA_DEFERRED_LL)
 			dw_edma_ll_interrupt(chan);
-		if (events & DW_EDMA_DEFERRED_ABORT)
-			dw_edma_abort_interrupt(chan);
 	} while (atomic_read(&chan->irq_pending));
 }
 
@@ -906,7 +969,7 @@ static void dw_edma_record_irq(struct dw_edma_chan *chan, unsigned int events)
 
 	lockdep_assert_held(dw_edma_event_lock(chan));
 
-	if (events & DW_EDMA_IRQ_ABORT)
+	if ((events & DW_EDMA_IRQ_ABORT) && chan->abort_pending)
 		pending |= DW_EDMA_DEFERRED_ABORT;
 
 	if (chan->non_ll) {
@@ -1108,7 +1171,7 @@ static void dw_edma_device_synchronize(struct dma_chan *dchan)
 	dw_edma_wait_termination(dchan);
 	cancel_work_sync(&chan->irq_work);
 	atomic_set(&chan->irq_pending, 0);
-	dw_edma_ll_snapshot_discard(chan);
+	dw_edma_irq_events_discard(chan);
 	vchan_synchronize(&chan->vc);
 }
 
@@ -1161,6 +1224,7 @@ static int dw_edma_channel_setup(struct dw_edma *dw, u32 wr_alloc, u32 rd_alloc)
 		INIT_WORK(&chan->irq_work, dw_edma_irq_work);
 		atomic_set(&chan->irq_pending, 0);
 		chan->ll_irq.event = DW_EDMA_LL_EVENT_NONE;
+		chan->abort_pending = false;
 		raw_spin_lock_init(&chan->event_lock);
 
 		if (chan->dir == EDMA_DIR_WRITE)
diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
index 9f528f160cea..2bfbd1b25703 100644
--- a/drivers/dma/dw-edma/dw-edma-core.h
+++ b/drivers/dma/dw-edma/dw-edma-core.h
@@ -120,6 +120,8 @@ struct dw_edma_chan {
 	 * its consumption with LL state.
 	 */
 	struct dw_edma_ll_snapshot	ll_irq;
+	/* ABORT is terminal and remains pending across LL state changes. */
+	bool				abort_pending;
 	raw_spinlock_t			event_lock;
 
 	u32				ll_max;		/* Data entries */
@@ -187,6 +189,8 @@ struct dw_edma_core_ops {
 	int (*ch_quiesce)(struct dw_edma_chan *chan);
 	u16 (*ch_count)(struct dw_edma *dw, enum dw_edma_dir dir);
 	enum dma_status (*ch_status)(struct dw_edma_chan *chan);
+	/* Called with the event scope locked. */
+	bool (*ch_abort_int_pending)(struct dw_edma_chan *chan);
 	enum dw_edma_event_scope event_scope;
 	irqreturn_t (*handle_int)(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
 				  dw_edma_handler_t handler);
@@ -258,6 +262,13 @@ static inline raw_spinlock_t *dw_edma_event_lock(struct dw_edma_chan *chan)
 	return &chan->event_lock;
 }
 
+static inline void dw_edma_abort_event_mark(struct dw_edma_chan *chan)
+{
+	lockdep_assert_held(dw_edma_event_lock(chan));
+
+	chan->abort_pending = true;
+}
+
 /*
  * Return the current LL entry index. A negative value means that the channel
  * context is not initialized or was lost after a link reset.
@@ -305,6 +316,12 @@ enum dma_status dw_edma_core_ch_status(struct dw_edma_chan *chan)
 	return chan->dw->core->ch_status(chan);
 }
 
+static inline bool
+dw_edma_core_ch_abort_int_pending(struct dw_edma_chan *chan)
+{
+	return chan->dw->core->ch_abort_int_pending(chan);
+}
+
 static inline irqreturn_t
 dw_edma_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
 			dw_edma_handler_t handler)
diff --git a/drivers/dma/dw-edma/dw-edma-v0-core.c b/drivers/dma/dw-edma/dw-edma-v0-core.c
index 43e33a400a3e..91b5d331cfa3 100644
--- a/drivers/dma/dw-edma/dw-edma-v0-core.c
+++ b/drivers/dma/dw-edma/dw-edma-v0-core.c
@@ -318,6 +318,13 @@ static enum dma_status dw_edma_v0_core_ch_status(struct dw_edma_chan *chan)
 		return DMA_ERROR;
 }
 
+static bool dw_edma_v0_core_ch_abort_int_pending(struct dw_edma_chan *chan)
+{
+	u32 sts = GET_RW_32(chan->dw, chan->dir, int_status);
+
+	return FIELD_GET(EDMA_V0_ABORT_INT_MASK, sts) & BIT(chan->id);
+}
+
 static void dw_edma_v0_core_clear_done_int(struct dw_edma_chan *chan)
 {
 	struct dw_edma *dw = chan->dw;
@@ -387,6 +394,7 @@ dw_edma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
 
 			events[pos] |= DW_EDMA_IRQ_ABORT;
 			active |= BIT(pos);
+			dw_edma_abort_event_mark(chan);
 			dw_edma_v0_core_clear_abort_int(chan);
 		}
 
@@ -664,6 +672,7 @@ static const struct dw_edma_core_ops dw_edma_v0_core = {
 	.ch_quiesce = dw_edma_v0_core_ch_quiesce,
 	.ch_count = dw_edma_v0_core_ch_count,
 	.ch_status = dw_edma_v0_core_ch_status,
+	.ch_abort_int_pending = dw_edma_v0_core_ch_abort_int_pending,
 	.event_scope = DW_EDMA_EVENT_PER_DIR,
 	.handle_int = dw_edma_v0_core_handle_int,
 	.ll_data = dw_edma_v0_core_ll_data,
diff --git a/drivers/dma/dw-edma/dw-hdma-v0-core.c b/drivers/dma/dw-edma/dw-hdma-v0-core.c
index bbf9ee0392f8..5d0d7575bae9 100644
--- a/drivers/dma/dw-edma/dw-hdma-v0-core.c
+++ b/drivers/dma/dw-edma/dw-hdma-v0-core.c
@@ -172,6 +172,12 @@ static u32 dw_hdma_v0_core_status_int(struct dw_edma_chan *chan)
 	return GET_CH_32(dw, chan->dir, chan->id, int_stat);
 }
 
+static bool dw_hdma_v0_core_ch_abort_int_pending(struct dw_edma_chan *chan)
+{
+	return FIELD_GET(HDMA_V0_ABORT_INT_MASK,
+			 dw_hdma_v0_core_status_int(chan));
+}
+
 static irqreturn_t
 dw_hdma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
 			   dw_edma_handler_t handler)
@@ -210,6 +216,7 @@ dw_hdma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
 
 			if (FIELD_GET(HDMA_V0_ABORT_INT_MASK, val)) {
 				events |= DW_EDMA_IRQ_ABORT;
+				dw_edma_abort_event_mark(chan);
 				dw_hdma_v0_core_clear_abort_int(chan);
 			}
 
@@ -429,6 +436,7 @@ static const struct dw_edma_core_ops dw_hdma_v0_core = {
 	.ch_quiesce = dw_hdma_v0_core_ch_quiesce,
 	.ch_count = dw_hdma_v0_core_ch_count,
 	.ch_status = dw_hdma_v0_core_ch_status,
+	.ch_abort_int_pending = dw_hdma_v0_core_ch_abort_int_pending,
 	.event_scope = DW_EDMA_EVENT_PER_CHAN,
 	.handle_int = dw_hdma_v0_core_handle_int,
 	.non_ll_start = dw_hdma_v0_core_non_ll_start,
-- 
2.51.0

