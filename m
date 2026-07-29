Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11020091.outbound.protection.outlook.com [52.101.228.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC624D9900;
	Wed, 29 Jul 2026 14:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785335461; cv=fail; b=Br2tAFT7yQJQJHGV94ExJvJEzHACY6tystbuYdRhke6xAA62jmwUFeC9eW3WViYGzQFPhF8dIZ5LNCUEcho0KchKYeGNHnCxXudbSA3JJsnLNLnLk3Ds5kW8YBpD13Q19G/Pa7iox8X/mrsKEtFSh2qh9HM8nKFyBm7icrhO7Rk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785335461; c=relaxed/simple;
	bh=jDaCby11ifXN2ioOLVoOfT2FpFs1lW8Npn71TulY8fc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=g65VFSL4i4vq+M7ws5Pa5V0kvqYoQIJY1L36xMGzBGy+lNq4Li3FLmtjVPNHKICDtUOqhSQdeuGm1IMLu5Nx9gQ1sJc0PUmY5uKYHF3Jt3mfZGAxGXwLkzimiJlyBMsO/VGhyuYLYiyRZU7mM3O0mmHmrv4cF1FKLfIsYAZ6FBI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=ha4Ldv+h; arc=fail smtp.client-ip=52.101.228.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="ha4Ldv+h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AVzwq99s7nA5aOOnGaPl1vTEYKajlBk7tAyIhoeHLTSPiJT5y63NnN4qaaKsaJmyOacY2p4jKFx3vY9xTGmPOkRhrH5KmCP+P21x6LWKHmx2029W1Wg6mWZmeHaAhwEdZSfbedF5fFPgooNCqxtil5RGE6TIJDLnTqrGiLMbBG3eWV94p7Ex9vaSiMJiKzzB7YJiAYu21buCXjxu1geF1TtPPUQNvCXdInzl6i66HIxUc5bRykHanfao4zEh2W3/avkBTowGcfXxoqdcvoeqSDdtSmZTSfuT/novkuOCE2MltQyZGVByN04wzmQUR27CphIY1HIr9pfYVXwuObV4Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mwFEL5HRPjbWg8NRJDM0S3dfzofTaVcjQNBTdJKJMH8=;
 b=OflOmB44SFgiefi75tY2F761lxH9pHmksOVF5B1czaIrc+oZU+tlRo6NclTLJkmI0/43aH1BI39GPLhVS9oQRIanOaO94R3/4swHpT0MYP8pS21zSAeR5zqkEwtZhcf4NQdu/Luy6BQCNCo4nV1uDoJ2SP500znjZWXD0zQfXAIjmM8bQDRJMPE3JmEAFYbzS+SmGSsutcKkTYXTKTzJYqkvV5+1XVrzkOFqgI0oRXHTsbn/VYBMeZHLO62gxjCGwNYMU4Ir/JMes0dEATVW9tPxW63l2sG0PvAB3E7+kPOXc0ej8kG485VcE1N9AWBRFGmzbLYrVkk3p6PB1fvhMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mwFEL5HRPjbWg8NRJDM0S3dfzofTaVcjQNBTdJKJMH8=;
 b=ha4Ldv+hRzGx4uNK/lrcyU5MZ9CGTcsjDo+mDI3GqLBIxTvITOOg7zzrI4IyNXdfKheyx8qEk9g+VTwr440aEU7wAGR75WQViC05Tk2lHEsxKq6+mACNMuVKYeaq73ADF4169Um+tQIaABlUwYHLlOfMvPAag22wpRvMXaMciBg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYRP286MB5289.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:112::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 14:30:51 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 14:30:51 +0000
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
Subject: [PATCH v4 12/24] dmaengine: dw-edma: Keep channels stopped while ABORT is pending
Date: Wed, 29 Jul 2026 23:30:24 +0900
Message-ID: <20260729143036.3087722-13-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260729143036.3087722-1-den@valinux.co.jp>
References: <20260729143036.3087722-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P301CA0088.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37a::9) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYRP286MB5289:EE_
X-MS-Office365-Filtering-Correlation-Id: afd8e2fb-2b7e-44a3-d132-08deed7dfd59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|7416014|366016|1800799024|23010399003|921020|18002099003|56012099006|10067099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	b0UrLZajcvxd80+JSlhhuLFWnB3CUcaHzEKgYFBzAhBSNP99rMcyHaXJbtZRMp8aVNPLwBkmdWlznnGhLNBAEI/UfZr4Fwwmldj8eLpsMV4RAG9MhPn6OllAqK2WP8OqTKQBHN/y8y+V+OCOHGTOKqNUzbb81ysYTsduPzPojbxBXD+7/gdb6xnAIJblbH3OLo3Lj5VpnKpT9j6aO8qGfXsk4tOJ9GIPhPPMABvjiyrDK8g2Y0mLxAKLDpLZ2nOVzquktRLXhFWzPF+IRQvmtnSNV/i04w5+SJLBhwnCVAz+qJZgN0BBeHO8JZTsYu3rZhRu/7QA4fJP1G0LZ4Dw4M4WvvTTjlQQwazB0iX31VWpFDGFf8LSPRUkhxXJirKh1alJ/xrQmbPvs+CocpTUWAw0iwPeuO+9nwLIS1Gn+bnzt2/eUg9Wor8+aBC6X7fWgj+mzjaL37jvwT22c0Km2L/c1cCc23fnr0ZNQeDBFaUNEk9qmga8bqSdaDzEvj+07DfalHe/JXRpLm5QVO0v+6twWvBF1cBli3FyhzfynL8RHirjpg2naoWzFP2jCYu6saakbvh+h4mGz8UrHq1Ikv6VqwZ1A9u1gcdi7m8IOxBqR956GapGYfHxFx3mrgT3UmJvJis42SjLRX1R04Vd7NSAFLLeWiGK5o0DrSvaekS2kUtNnPAHSA/ZBaye/rLVmpTLAeXcjBzsgUUtG9j4sQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(7416014)(366016)(1800799024)(23010399003)(921020)(18002099003)(56012099006)(10067099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ACgQY5/jdM6e+kexDTconNRj67pTny8FEtLpomxDPF1PshIKP1Ch9crw1luC?=
 =?us-ascii?Q?WdfH4u/tm2fIldGZxqiCFBRKSpWsp9S5ahlN1GA8optpiHj1pO9d2O1wntSw?=
 =?us-ascii?Q?096FQSBQ//Wq+Bf4mpOJ8e9OT8YitokVdu0E8Iqrp2T37Y8MKHKp4+d9D45E?=
 =?us-ascii?Q?LSA9kzC/wQ3BUdvBj+EmqOGTFJva0pJSfPDcvzM7MGfsgBljkRk5g+H6my2S?=
 =?us-ascii?Q?rFLCxegr0Is4Qc3FQ13byR4WUKzMiSLgUZ6PPCDgxKRKgCugetMgXamG+VYs?=
 =?us-ascii?Q?vNG7sB3FXKxCTq7YKdIwDpPQ4gneGN09UH/D4FhViqwCFQJYLyWmYMuPY6Rv?=
 =?us-ascii?Q?EQBfkDAFv/Q2eWXXhmb4aqO79B4jThkGX9Y//YzoWyy+c0SG7d7srlKof/Gy?=
 =?us-ascii?Q?TmYVJUL9Z/z5GfN6R+JBJjANqDM+cbdzfHIQSdcuxshp5AeB2+uu2WTd1PdQ?=
 =?us-ascii?Q?ePUYLMgrLvQXvnSkJTwjo26gjS4ZEqbeK8dDYNUQji85rswnexc5xeW9guH7?=
 =?us-ascii?Q?OGNQrPL+MhMLRTkFCKNtlQP+XGPWTq204xv52Fh2gnuj0eP+M9IXOb8blO6T?=
 =?us-ascii?Q?ZxNNl7Wfu756+7PayULwzpVsrjPeT99sgmJ6/Zk64IGOyZDFbHaNwUvo3j2X?=
 =?us-ascii?Q?I31vPWUxborRIwnmt/94iellzticRXsPxJ9HdwtEc3hPpUSCwFzaz1k5vunb?=
 =?us-ascii?Q?SXdWPe1h0Wf5Lj1iC5/nnQxWHUDpDwk1dCksRkuf/So2jYm7FxdtE4Cj8j7+?=
 =?us-ascii?Q?L92ylIyBofcBTt8gEKze3e45LJsiVXerZMpAUzjbhT9kYl38VAbARLn9oaBc?=
 =?us-ascii?Q?szbcrBVacd9nUPa8m5oZGBmwmZT5gQc4TimZYeMNpxtOchBdAgyYSsVUPMEo?=
 =?us-ascii?Q?aI0dOgqsy4Dku74zwH4LR80hE+Cbxlie1FfI6w36hPdZdTq2DM5LRTj7FKUJ?=
 =?us-ascii?Q?C0WPBpXh5OAPOqIOHXQO7JjYAVJDItmZMWurv1qkAqcRir2K2AeN4whREMP0?=
 =?us-ascii?Q?WSXif+VKvnP1757VMSIoRUtVOD1JjI+nY1YiG5VH6ES3okyRksBj9nY+Xk2O?=
 =?us-ascii?Q?nbGx/KgOk3b2ZhkZ7PXEGSfgKp5Ic1+X4fgFfnE/sJG5i3PRjWBYQLDJETs9?=
 =?us-ascii?Q?kz6Dg+5AIprZ5O5Y8EcCh5VhWFBPI/vnXQyTVlqBv5+5BXdBC7jX7aYnosFI?=
 =?us-ascii?Q?IAtjGZL1UKRXtbwIsZ4gSuZBXqrmWRuGDmxGHjP8DPrHvbc4V/7UmFxCpT/R?=
 =?us-ascii?Q?fN3Vg86pCG9uCSAKhanlnK7OOHfgL2q9wLb6PCbBU9NRuOLEZRNGyg+aI9nC?=
 =?us-ascii?Q?OsmNQXmZcOCffPu072sG2zJroVGOETx4n6CSdVihoQm8RDNMXpJDfKl124ft?=
 =?us-ascii?Q?+nLF2/Du2rARehwqgdu9+9H8AxdOjhj48PeibFC//+TO/8R1lJSrT/TxBJq+?=
 =?us-ascii?Q?ewVG/iwFmYc1eIBSOyf/9Zte83Ww+4QIw0AtieHQ5mcb72yOX2v813d988e9?=
 =?us-ascii?Q?4qiyaWOIHjTonKTot2QiosGGrsabhTKpx/y1KERKTY5LEiCF9ATVHhIRo7By?=
 =?us-ascii?Q?Sq4RB8zdtiTsvI3cdEEk1E3fiBuRVNNK+RiQzV6G48y3JhQNCFzqv3LGpSF/?=
 =?us-ascii?Q?OkPjvwPIPildbzmNATXFlQAa/oIaUP1mhFqoKHUhTZUTKSC8bI3ZeDF5MWRs?=
 =?us-ascii?Q?vEfkKCrLt8n8+hc/Azljt+ccIIcxXnLOeaojrNGZSYUVsxddiq9Qcyr1S2rB?=
 =?us-ascii?Q?amqBj8WgnbQKe8z4FO27cpP7YPDp86XBZe320QfM4g+pXNFvt/aP?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: afd8e2fb-2b7e-44a3-d132-08deed7dfd59
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 14:30:51.0957
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uR1n+zXp5bYkcWSntWa0Iu45AASOpMpBubjThF6UI3kcTDuAoaE5YqnjjMMqEctypfyehZBN7mFrOpiyvEyO8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRP286MB5289

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

Note also that only one issued descriptor can have LL entries published
at this point. Before multi-descriptor publication is enabled, the ring
reset is extended to abort every descriptor with outstanding published
entries. Therefore, discarding coalesced DONE or LL work cannot strand
another published descriptor.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v4:
  - Clarify in commit message why discarding DONE or LL work coalesced
    with ABORT cannot strand a published descriptor. (Sashiko)

 drivers/dma/dw-edma/dw-edma-core.c    | 82 ++++++++++++++++++++++++---
 drivers/dma/dw-edma/dw-edma-core.h    | 17 ++++++
 drivers/dma/dw-edma/dw-edma-v0-core.c |  9 +++
 drivers/dma/dw-edma/dw-hdma-v0-core.c |  8 +++
 4 files changed, 107 insertions(+), 9 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index 9ef7342a1093..4c4f19bf3c16 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -82,11 +82,30 @@ static void dw_edma_ll_snapshot_discard_locked(struct dw_edma_chan *chan)
 	chan->ll_irq.event = DW_EDMA_LL_EVENT_NONE;
 }
 
-static void dw_edma_ll_snapshot_discard(struct dw_edma_chan *chan)
+static void dw_edma_irq_events_discard(struct dw_edma_chan *chan)
 {
 	guard(spinlock_irqsave)(dw_edma_event_lock(chan));
 
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
+	guard(spinlock_irqsave)(dw_edma_event_lock(chan));
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
+	guard(spinlock_irqsave)(dw_edma_event_lock(chan));
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
+		guard(spinlock_irqsave)(dw_edma_event_lock(chan));
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
@@ -320,6 +368,9 @@ static void dw_edma_core_ch_doorbell(struct dw_edma_chan *chan)
 
 	guard(spinlock_irqsave)(dw_edma_event_lock(chan));
 
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
 
 		if (chan->dir == EDMA_DIR_WRITE)
 			chan->ll_region = chip->ll_region_wr[chan->id];
diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
index b6de4ac9a8aa..82c0d66747be 100644
--- a/drivers/dma/dw-edma/dw-edma-core.h
+++ b/drivers/dma/dw-edma/dw-edma-core.h
@@ -115,6 +115,8 @@ struct dw_edma_chan {
 	 * its consumption with LL state.
 	 */
 	struct dw_edma_ll_snapshot	ll_irq;
+	/* ABORT is terminal and remains pending across LL state changes. */
+	bool				abort_pending;
 	/* Native HDMA lock storage. */
 	spinlock_t			event_lock_per_chan;
 	spinlock_t			*event_lock;	/* Selected event lock */
@@ -185,6 +187,8 @@ struct dw_edma_core_ops {
 	int (*ch_quiesce)(struct dw_edma_chan *chan);
 	u16 (*ch_count)(struct dw_edma *dw, enum dw_edma_dir dir);
 	enum dma_status (*ch_status)(struct dw_edma_chan *chan);
+	/* Called with the event scope locked. */
+	bool (*ch_abort_int_pending)(struct dw_edma_chan *chan);
 	irqreturn_t (*handle_int)(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
 				  dw_edma_handler_t handler);
 	void (*non_ll_start)(struct dw_edma_chan *chan, struct dw_edma_burst *child);
@@ -252,6 +256,13 @@ static inline spinlock_t *dw_edma_event_lock(struct dw_edma_chan *chan)
 	return chan->event_lock;
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
@@ -299,6 +310,12 @@ enum dma_status dw_edma_core_ch_status(struct dw_edma_chan *chan)
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
index 3f3e94b9073f..451e421b11b8 100644
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
@@ -390,6 +397,7 @@ dw_edma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
 
 			events[pos] |= DW_EDMA_IRQ_ABORT;
 			active |= BIT(pos);
+			dw_edma_abort_event_mark(chan);
 			dw_edma_v0_core_clear_abort_int(chan);
 		}
 
@@ -667,6 +675,7 @@ static const struct dw_edma_core_ops dw_edma_v0_core = {
 	.ch_quiesce = dw_edma_v0_core_ch_quiesce,
 	.ch_count = dw_edma_v0_core_ch_count,
 	.ch_status = dw_edma_v0_core_ch_status,
+	.ch_abort_int_pending = dw_edma_v0_core_ch_abort_int_pending,
 	.handle_int = dw_edma_v0_core_handle_int,
 	.ll_data = dw_edma_v0_core_ll_data,
 	.ll_link = dw_edma_v0_core_ll_link,
diff --git a/drivers/dma/dw-edma/dw-hdma-v0-core.c b/drivers/dma/dw-edma/dw-hdma-v0-core.c
index 617e39f7a8b7..0ed4e1b8240a 100644
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
 	.handle_int = dw_hdma_v0_core_handle_int,
 	.non_ll_start = dw_hdma_v0_core_non_ll_start,
 	.ll_data = dw_hdma_v0_core_ll_data,
-- 
2.51.0

