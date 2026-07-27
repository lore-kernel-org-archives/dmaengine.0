Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020093.outbound.protection.outlook.com [52.101.229.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B42C431A3C;
	Mon, 27 Jul 2026 17:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785171826; cv=fail; b=eROYynrlEYnNv2vSSOc2ny2CnobKyfIkhSX674hTzXMc/Sqko74c0VUOO3OOP0TU5sYJojAftyQn7iNzPZtuIN3pvWPdTibnfJJ+ydiEuIhybpm0yLNsxKxMz2kYZxpf+DZYwN7h2lrXtQgr6a5Hfc1c009ApbRw0145LWaYg9Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785171826; c=relaxed/simple;
	bh=zYF/v9QDTF1Lp8FjkhctOVOcyK/gbIcEQEEOurovHZg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SzCi1naHJ6TymTVmFvK5gdSHT5tDE4hsXRHay9U/MD7zgx6ukEc/5/Ex/UNbA2F+v1ej00I9jCLeFouXGodGKEo2o9NjCPWIjTScr8rwdLfMRcYPrhTSOhLmMR2R/crG4ZyVrBDpGVyDGpyAd0ZVYgFx0Zblq9RoODLRt/JJMok=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=Se1zjEiu; arc=fail smtp.client-ip=52.101.229.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="Se1zjEiu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M3QuAX+OlIhcbwiIZCFIYsBQ0NPbwj6v89rMylK6RGV/nEwYHkynyqfs4RULEBzupmzkCqRkjpOxdOTtoKKfdbBSfVp8oDDnDV5+ifuxDrNCKdHECtswTZu9RF42LMMwlRa6b21gFvEqrHGlgrEY7iJpuzn47MgDW/YOMgoDrdBr41+WL7oMx1hgzEDeU0L5+5R9VwrD3lvP2tCPw7z9h1Y8KjVMbdawiTrMY+kmcb3yzUXoLKPmEyoXOEjqK/Rt69IOwIOBJsPyduUFxK5vyw16ghO6qBDAFw+CsXQgiH7h+GgISZ3h1mZNXJQXrTJWLg7Lk5OWlgKTXa4WE+eTSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Msa2dA47pzEEobYIiHLQwwKpHisD+2M/bFaU7RWtKBE=;
 b=pHHlQrcCQa7D4SYPH+PjdxjEYdE3kQ6W8JDcSMQhpN4+beZ9/aCrkJBIfgoMNlVjGoai6HwwP6/n9amEf54K7ukqcFt3a5Kqhyua7PRghPrWU0EtmCL4fV9DruHWa9feCXt7REQD5XLL4haxp5BDmfa4SRJsj1x3JOAEBp/2xLLVlsncyIMqL0Rg793GYPkPZaOGX+V08Bu/2eu4wujUeBdvDXiGwMmVNo8iRRNbXzn64qzt7nrriSYwJkk/Rv7T7w3LAzu67znO23afPQl9XNwAol0tmbM9iswUVMNFj8izMbkjImJ0ir9Sh50mq8wI0h34pO016reUp1hRbeiKqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Msa2dA47pzEEobYIiHLQwwKpHisD+2M/bFaU7RWtKBE=;
 b=Se1zjEiu7bAv/9BXwu1Ls80zmhBlDESAnaW1n2i0Q2r17HC5NCrMdFJzU7hgQw2LveUpMC+4jmddsC3TzEajAi3Kfa4PHcUMxsii15D6EPxsYjOjMqofJ4MOxMHEJzxpOj00IRxUHMei1lA1hvpGXYe1AXvSmNHsogioZpdH48s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYRP286MB4609.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:1a9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Mon, 27 Jul
 2026 17:03:38 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 17:03:38 +0000
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
Subject: [PATCH v3 09/24] dmaengine: dw-edma: Prepare deferred IRQ reporting for LL events
Date: Tue, 28 Jul 2026 02:03:08 +0900
Message-ID: <20260727170323.2321369-10-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260727170323.2321369-1-den@valinux.co.jp>
References: <20260727170323.2321369-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0047.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::18) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYRP286MB4609:EE_
X-MS-Office365-Filtering-Correlation-Id: 43f09ecd-2501-4424-0e09-08deec0100ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|376014|23010399003|10070799003|18002099003|22082099003|10067099003|56012099006|921020;
X-Microsoft-Antispam-Message-Info:
	uFUqFHKaF9FGS1cJsTkdSOUQ5r5m9YC3phxmr5gpklPJY/uUKGrxvHoQy1H9J15yrIn9mZfbRvszSbFejPtgQ4ifsMGaMgbCPEbEHU4iO97rrEPx65VUi/2KdvtUro3xR9YHgO6LMUON8m8Y7HSZaoaae93yv4D0xp3qG5jjR3rHTlkbi1g2fuDaAfvzsvifgfme3jBZjqopLSVEwNuRo3VR2P+f+yX2nL+d73PO3V5FtGCvBewO/2LgsC189n3Y4CkyqzhS8DvbtcyRyTx3FSyNVigmudBWHpDlcZZXV3oJWPNQOVSpBT5cvQ8KoNvXMAJIUOZWKhbgWtxjHDJVyXV9f1NK2d5EpiwVbuHxyKvaDXS6DitKn2MQOZVNlB+hZo5gtpYgUGg97Q773c500xXVWAlJCLR5X042jhckUn74jU6hNz+UI7U7tVRWPVaTgx+k4ygrpGC93IGbDF44GtYHshodmuFrnw0GPnxhBC/49CSd7d5iuR+BNIqIN6ucgYzp3OFQtSVNqKHQjLXGIabraKhIkfQcHZtB5QoGOMwwnXRrl+zv1i1d5LuBxdngEwMFIezBY8WQOYpGf7B4XGFFNS0w6NSa1uR35+dlCbFNhD3P3R1cbHEOqiUo7EUZUneIKvdBXXeso7T+VNolJmF1J3cdSqjQLZGXbcaL1oq0h6RCYk/FlbdayJs2h0EOMc70RhWyyC5oetNT11eeQg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(23010399003)(10070799003)(18002099003)(22082099003)(10067099003)(56012099006)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aaPc6spQUQjJj/R+hdN8YugschzWSTllIeKOveIbSGjE+jWdIuJHghPKXz4+?=
 =?us-ascii?Q?TuNKnk2mfNgoLn8mpJrm8FlLg20vjMDw/cznXfc+4LpaJ6jt+cE0sSjrAnWe?=
 =?us-ascii?Q?iK7TE/4PRwNJIcPUIq5LmgkqX5oGzXOESjb/4heRElBKkVkGQ8MxEtYsa784?=
 =?us-ascii?Q?naJOGCr1pDavyDMp6BhqKFiIOVUhm8YrykBSL5FfB3ltgLn6gXgy9Vp9e9Fv?=
 =?us-ascii?Q?/EpjubHrzmrD5HfldcRh3MJr8bt1380fa1hOBZF5pdWn2ShaOLLMCJL2xrhd?=
 =?us-ascii?Q?7fya1xbt+b6uXyBM4lmHrg2uKwUnAxHgqS0qCuZdgZNgEsdFFVygaTMd5ddz?=
 =?us-ascii?Q?8Rl0ZdZrd3hOs3xVyeplRF2Ci/NqzP6QaidAtMFO7M4hkwnZw9KG/fCUkBfy?=
 =?us-ascii?Q?5X8kI8t1/wYA5QPGqzKFv91g3M9DOGL1Jjk6sYtjrIRliUKCGH2cYlmlBG6T?=
 =?us-ascii?Q?a2airBh3QL7xxtkiUMQovpLSu4rNJi+h3ZpQSwLzsYqKxwv8AQ7uZ2Xqe2kB?=
 =?us-ascii?Q?JdE4usMdNh2qVHOHs1rft6GWgaU0OnpgKsEftzrqp+e/6YnkwJFqGDELs/ht?=
 =?us-ascii?Q?Rtz36RAZqRd83k5IVbXdRWN/jDUERBo5VUHBXB7nlxihQlEkrPirbLjGwECo?=
 =?us-ascii?Q?qPfM5vRbBqGRQsfhR+4i1WmnAy03Os7HWZNUmH7lvUeyJ6KXZ8VDw372J/u4?=
 =?us-ascii?Q?i1l70p5lSXxij/FsltveXKFdWB2hjHXssZnvZvmARHmkvxsk0CHTMbLtfBhh?=
 =?us-ascii?Q?MTRRwKsL/LqzBK5Y4tZP+SqrTykgbk+B3UMg1Fbe60mgbh2A5N0U2C1kmQHq?=
 =?us-ascii?Q?TM0GTxDOH75YTntJSto45QAPvOmpifld8E46wpSpedk+kRWK/Wf8pWUPoNWO?=
 =?us-ascii?Q?0H/skmVCmhEq/K/MXBlj0GnQw7ZCjwl/Acv5EIu89sT+V5PliCVkl7DREZ45?=
 =?us-ascii?Q?knFbIZRHRLC0fvoHz7AFAe4+6jWRjxnieFyIeFA3EycPGJG6MCQ8lORlmhFk?=
 =?us-ascii?Q?1R5FSayCDOisVh+SlfDpaAaiIo1D00gRypTXpYDjyaywR8SXy+9kiL5bPGqU?=
 =?us-ascii?Q?5oUI0MK7rliNBPUHWfaXZKfRb39U7hbXe2CzkgQmULLEhjdsjG18lVxVyXnR?=
 =?us-ascii?Q?IDC3EUDifurIAtEzrRXHfpt2L2etfjgjS6BdtDEyNcl0m9O8yqOJ8eDHHbbZ?=
 =?us-ascii?Q?Go+00QYeO2mr2jiziD4NjJBw70z7Lsy/cXChHOK6UzZnCsSr0Qcy5UI3Y/ey?=
 =?us-ascii?Q?xIwU9e25zASn6uN8rhrqmqQX33GMBtteHDKmBdPE+CP9Uun59gPFpkGW1LYe?=
 =?us-ascii?Q?okx7UC+oGyAmLn2LoNMrIdTC1p/tdtLwpNRvR1ei9DE25iJS9NUn4PmvBFyL?=
 =?us-ascii?Q?+29mKAqspe9gk4mo6eLok9ERFplm5c6rdYDwefYEl7Wxx+0rcJIqJu206GdU?=
 =?us-ascii?Q?kZlap1mkjG2HKJ7Dg+uL81wFgIJX3Rg5OJ9CvzHqdc1LdqtUmzBU1lnfmsJU?=
 =?us-ascii?Q?EKsLxksXbgLthJ94H/MmM1QuOBuEF/T/iDo8GbrAPWSZWTxGkWOXz+zX/RHg?=
 =?us-ascii?Q?G5kbXFZ1KvL568pEzJ4UoFWxXx7qVos/IHiM2r0simjeph7oF4j6DpFqqYRg?=
 =?us-ascii?Q?ZM6W4HnMdlGFJiOBRhp4ZkO29kS2N1BnMnQjdhvYJ6dkI1o//Ii/KVlZIQZZ?=
 =?us-ascii?Q?WXXDQSw38YcDxyg2WlWh/wfU0POWWcnA5Fn5Ie22s/VcVzmCn1wfLLZLsgn8?=
 =?us-ascii?Q?73eD8bBUGrRXKZiC1U6QAvruImX3ha0xVpaxa/FSPWdu2+l7CFUm?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 43f09ecd-2501-4424-0e09-08deec0100ae
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 17:03:38.4830
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I8mQk4Ylc5DkCtjON65n8ixn5d1zZ6X68s44Aq/pbk9a3I5P51has9gTzDX68Jzedvuiixd7TR1BA8zADUFmhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRP286MB4609

A later change serializes status capture, interrupt clear, and event
recording against channel restart. It must also publish all causes
observed for a channel in that critical section through one callback.
Otherwise, the deferred worker can consume one cause before another from
the same status pass is recorded.

Replace the DONE and ABORT callback pair with one callback carrying an
event bitmap. For now, map the bitmap back to the existing deferred DONE
and ABORT work, so behavior remains unchanged.

Also split DONE handling into a lock-taking wrapper and a vc.lock-held
body. The later LL event path needs to validate its recorded event under
vc.lock before running the existing DONE state machine.

No functional change.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v3:
  - New prep patch split from the LL event/restart serialization change
    to keep its functional diff focused. (Sashiko)

 drivers/dma/dw-edma/dw-edma-core.c    | 44 ++++++++++++++++-----------
 drivers/dma/dw-edma/dw-edma-core.h    | 16 +++++++---
 drivers/dma/dw-edma/dw-edma-v0-core.c |  6 ++--
 drivers/dma/dw-edma/dw-hdma-v0-core.c |  6 ++--
 4 files changed, 44 insertions(+), 28 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index b84aed59bf77..bb57f2d39d1c 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -702,17 +702,16 @@ dw_edma_device_prep_interleaved_dma(struct dma_chan *dchan,
 	return dw_edma_device_transfer(&xfer, dw_edma_device_get_config(dchan, NULL));
 }
 
-static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
+/* Must be called with vc.lock held. */
+static void dw_edma_done_interrupt_locked(struct dw_edma_chan *chan)
 {
 	struct dw_edma_desc *desc;
 	struct virt_dma_desc *vd;
-	unsigned long flags;
 
-	spin_lock_irqsave(&chan->vc.lock, flags);
-	if (chan->status == EDMA_ST_PAUSE) {
-		spin_unlock_irqrestore(&chan->vc.lock, flags);
+	lockdep_assert_held(&chan->vc.lock);
+
+	if (chan->status == EDMA_ST_PAUSE)
 		return;
-	}
 
 	switch (chan->request) {
 	case EDMA_REQ_NONE:
@@ -751,7 +750,14 @@ static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
 		break;
 	}
 	dw_edma_core_ch_maybe_doorbell(chan);
+}
 
+static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&chan->vc.lock, flags);
+	dw_edma_done_interrupt_locked(chan);
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
 }
 
@@ -793,20 +799,24 @@ static void dw_edma_irq_work(struct work_struct *work)
 }
 
 static void dw_edma_queue_irq_work(struct dw_edma_chan *chan,
-				   enum dw_edma_deferred_event event)
+				   unsigned int events)
 {
-	atomic_or(event, &chan->irq_pending);
+	atomic_or(events, &chan->irq_pending);
 	queue_work(chan->dw->wq, &chan->irq_work);
 }
 
-static void dw_edma_done_interrupt_deferred(struct dw_edma_chan *chan)
+static void dw_edma_record_irq(struct dw_edma_chan *chan, unsigned int events)
 {
-	dw_edma_queue_irq_work(chan, DW_EDMA_DEFERRED_DONE);
-}
+	unsigned int pending = 0;
 
-static void dw_edma_abort_interrupt_deferred(struct dw_edma_chan *chan)
-{
-	dw_edma_queue_irq_work(chan, DW_EDMA_DEFERRED_ABORT);
+	if (events & (DW_EDMA_IRQ_DONE | DW_EDMA_IRQ_PROGRESS |
+		      DW_EDMA_IRQ_STOP))
+		pending |= DW_EDMA_DEFERRED_DONE;
+	if (events & DW_EDMA_IRQ_ABORT)
+		pending |= DW_EDMA_DEFERRED_ABORT;
+
+	if (pending)
+		dw_edma_queue_irq_work(chan, pending);
 }
 
 static void dw_edma_emul_irq_ack(struct irq_data *d)
@@ -906,8 +916,7 @@ static inline irqreturn_t dw_edma_interrupt_write_inner(int irq, void *data)
 	struct dw_edma_irq *dw_irq = data;
 
 	return dw_edma_core_handle_int(dw_irq, EDMA_DIR_WRITE,
-				       dw_edma_done_interrupt_deferred,
-				       dw_edma_abort_interrupt_deferred);
+				       dw_edma_record_irq);
 }
 
 static inline irqreturn_t dw_edma_interrupt_read_inner(int irq, void *data)
@@ -915,8 +924,7 @@ static inline irqreturn_t dw_edma_interrupt_read_inner(int irq, void *data)
 	struct dw_edma_irq *dw_irq = data;
 
 	return dw_edma_core_handle_int(dw_irq, EDMA_DIR_READ,
-				       dw_edma_done_interrupt_deferred,
-				       dw_edma_abort_interrupt_deferred);
+				       dw_edma_record_irq);
 }
 
 static inline irqreturn_t dw_edma_interrupt_write(int irq, void *data)
diff --git a/drivers/dma/dw-edma/dw-edma-core.h b/drivers/dma/dw-edma/dw-edma-core.h
index 95bd4bf47ea2..6b0d475bb8b5 100644
--- a/drivers/dma/dw-edma/dw-edma-core.h
+++ b/drivers/dma/dw-edma/dw-edma-core.h
@@ -41,6 +41,13 @@ enum dw_edma_xfer_type {
 	EDMA_XFER_INTERLEAVED
 };
 
+enum dw_edma_irq_event {
+	DW_EDMA_IRQ_DONE	= BIT(0),
+	DW_EDMA_IRQ_PROGRESS	= BIT(1),
+	DW_EDMA_IRQ_STOP	= BIT(2),
+	DW_EDMA_IRQ_ABORT	= BIT(3),
+};
+
 enum dw_edma_event_scope {
 	DW_EDMA_EVENT_PER_CHAN,
 	DW_EDMA_EVENT_PER_DIR,
@@ -152,7 +159,8 @@ struct dw_edma {
 	const struct dw_edma_core_ops	*core;
 };
 
-typedef void (*dw_edma_handler_t)(struct dw_edma_chan *);
+typedef void (*dw_edma_handler_t)(struct dw_edma_chan *chan,
+				  unsigned int events);
 
 struct dw_edma_core_ops {
 	void (*off)(struct dw_edma *dw);
@@ -162,7 +170,7 @@ struct dw_edma_core_ops {
 	enum dma_status (*ch_status)(struct dw_edma_chan *chan);
 	enum dw_edma_event_scope event_scope;
 	irqreturn_t (*handle_int)(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
-				  dw_edma_handler_t done, dw_edma_handler_t abort);
+				  dw_edma_handler_t handler);
 	void (*non_ll_start)(struct dw_edma_chan *chan, struct dw_edma_burst *child);
 	void (*ll_data)(struct dw_edma_chan *chan, struct dw_edma_burst *burst,
 			u32 idx, bool cb, bool irq);
@@ -262,9 +270,9 @@ enum dma_status dw_edma_core_ch_status(struct dw_edma_chan *chan)
 
 static inline irqreturn_t
 dw_edma_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
-			dw_edma_handler_t done, dw_edma_handler_t abort)
+			dw_edma_handler_t handler)
 {
-	return dw_irq->dw->core->handle_int(dw_irq, dir, done, abort);
+	return dw_irq->dw->core->handle_int(dw_irq, dir, handler);
 }
 
 static inline
diff --git a/drivers/dma/dw-edma/dw-edma-v0-core.c b/drivers/dma/dw-edma/dw-edma-v0-core.c
index d497d36f5b28..d883ca446f5a 100644
--- a/drivers/dma/dw-edma/dw-edma-v0-core.c
+++ b/drivers/dma/dw-edma/dw-edma-v0-core.c
@@ -336,7 +336,7 @@ static void dw_edma_v0_core_clear_abort_int(struct dw_edma_chan *chan)
 
 static irqreturn_t
 dw_edma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
-			   dw_edma_handler_t done, dw_edma_handler_t abort)
+			   dw_edma_handler_t handler)
 {
 	struct dw_edma *dw = dw_irq->dw;
 	unsigned long total, pos, val;
@@ -375,7 +375,7 @@ dw_edma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
 			continue;
 
 		dw_edma_v0_core_clear_done_int(chan);
-		done(chan);
+		handler(chan, DW_EDMA_IRQ_DONE);
 
 		ret = IRQ_HANDLED;
 	}
@@ -389,7 +389,7 @@ dw_edma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
 			continue;
 
 		dw_edma_v0_core_clear_abort_int(chan);
-		abort(chan);
+		handler(chan, DW_EDMA_IRQ_ABORT);
 
 		ret = IRQ_HANDLED;
 	}
diff --git a/drivers/dma/dw-edma/dw-hdma-v0-core.c b/drivers/dma/dw-edma/dw-hdma-v0-core.c
index b181603bf2c7..afc2f24fecd3 100644
--- a/drivers/dma/dw-edma/dw-hdma-v0-core.c
+++ b/drivers/dma/dw-edma/dw-hdma-v0-core.c
@@ -174,7 +174,7 @@ static u32 dw_hdma_v0_core_status_int(struct dw_edma_chan *chan)
 
 static irqreturn_t
 dw_hdma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
-			   dw_edma_handler_t done, dw_edma_handler_t abort)
+			   dw_edma_handler_t handler)
 {
 	struct dw_edma *dw = dw_irq->dw;
 	unsigned long total, pos, val;
@@ -200,14 +200,14 @@ dw_hdma_v0_core_handle_int(struct dw_edma_irq *dw_irq, enum dw_edma_dir dir,
 		val = dw_hdma_v0_core_status_int(chan);
 		if (FIELD_GET(HDMA_V0_STOP_INT_MASK, val)) {
 			dw_hdma_v0_core_clear_done_int(chan);
-			done(chan);
+			handler(chan, DW_EDMA_IRQ_STOP);
 
 			ret = IRQ_HANDLED;
 		}
 
 		if (FIELD_GET(HDMA_V0_ABORT_INT_MASK, val)) {
 			dw_hdma_v0_core_clear_abort_int(chan);
-			abort(chan);
+			handler(chan, DW_EDMA_IRQ_ABORT);
 
 			ret = IRQ_HANDLED;
 		}
-- 
2.51.0

