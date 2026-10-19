Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792422878;
	b=fFt3Xeeb4FgJ4C3/K5NQd7tQ/I/txXzm0gqb3oTxzBoD1U73JWI5NWSPLipN0sdhuCDo
	 Uo9g6ot4ESuDGH4oJOBKbIDJUWVmUR2ZRoZQudpgC1HdkTWH+H01KfCMUE0CAwraTbZcC
	 cVpa6R04j7ZYSH0ecBObceoMI2ifb6YVDUxJbbgdj/YVaOZzWGYyB5UCo0X60dapUxG3y
	 /6LbwEbo9pMEzhJGxtac6k468FIPV9AHd1+YKgIx/qnRvCe1DS0N0dVaRdQ1zJbK8EJX7
	 2BgZycU36QCkVFCrKKk/ZHVGLcF6DXQhC+VKFhF2c39EEycL0gnJ6GFkmTeA2UAcTbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792422878;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5Rg8ro+nVC+0k89M1QmhZ1e0RzR/D2AdQ8L9fKW1vx4=;
	b=Oi/NgL/RK42UrLQjY8ZmdONddBC9YOtJ8IQnlfNRMv756olksqXykvakGEZ0HpqhIatB
	 zWW3Wy8y4XCWEpP6N5HqASusR3l0OUWQnrMU/oZCxH9SAXhCJC1m1ZW/7PTtolMIpEv8x
	 PsCXLCkwhDUHUlTdRfizoWU/ymgZGQqzweLC7FdLYFm8axZ/E0K5dKGhVZMhxFqxJVpps
	 d80uEOJ49OxgPRNI7TAERJzFBchkUrah5drfsM7Ulnk5E1s/uNeX3bpHONhuHRTo72+Aq
	 GxkpsO4o3dDZZ8f6xCD/gGB6en2mgt+FmEQDnXUUjZk10SKYaiddorH3tFL5fn+KSNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fcCGXFNm;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505FA609CEDF;
	Mon, 19 Oct 2026 15:14:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 505FA609CEDF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fcCGXFNm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792422878; x=1823958878;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1XahINlI+qtzt3WIrBdAjFdXjrmyMcpiOfQXjm/4WOY=;
  b=fcCGXFNm/+4tvDAC36LEQQYj/Mk0wDjMwXaWB/V445pm0ltz3z1lTG/k
   t7urc0htJ0sQsminiS9njcPS/VNGhDE8AEh0HtLVUbBvyN79vVDztIzcP
   1jdYIiNZUMjDJsmogimO9gI+1MVk6tdhOdlVBWMujXlx25+bWLb5Axx7e
   E9Bs4UfKrZo0uM4mFS3HaRIQSy1kStpmByS7R5aG8Nv/DdiIg7u0dvlCr
   uEerl7UE/oyKi9oBjU2h/6cqUbk6uSI5FMJrXqmnEZe2OnkoWumj+J8u1
   ULJ+jVYaZdRDI+tuQr6ibDhhySxXq+AekZI1MuQhmORQinT20+2dGOnFN
   g==;
X-CSE-ConnectionGUID: UzJr9t8fRG234Li6t5Crgg==
X-CSE-MsgGUID: 8k/cbX9hSXiS/jq57ZMLOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="992130"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="992130"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 08:14:36 -0700
X-CSE-ConnectionGUID: wG5r3/fiQl2BWTJBHQT9Jw==
X-CSE-MsgGUID: X2Ddg/jvSledtfS/BnPcuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2636142"
Received: from jf5300-15a101203tc.jf.intel.com (HELO meta-crater2c.jf.intel.com) ([10.54.113.49])
  by fmviesa005.fm.intel.com with ESMTP; 19 Oct 2026 08:14:35 -0700
From: Daniel Byrne <daniel1.byrne@intel.com>
To: Vinod Koul <vkoul@kernel.org>,
	Dave Jiang <dave.jiang@intel.com>
Cc: Fenghua Yu <fenghua.yu@intel.com>,
	Frank Li <Frank.Li@kernel.org>,
	Vinicius Costa Gomes <vinicius.gomes@intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	dmaengine@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] dmaengine: idxd: generation-number transaction status
Date: Mon, 19 Oct 2026 08:06:31 -0700
Message-ID: <20261019150632.4026424-3-daniel1.byrne@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019150632.4026424-1-daniel1.byrne@intel.com>
References: <20261019150632.4026424-1-daniel1.byrne@intel.com>
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement device_tx_status() by reading the addressed descriptor's
completion record. The cookie encodes the descriptor id in its lower
16 bits and a generation number in the 14 bits above, so a query
against a recycled descriptor sees a stale cookie and reads
DMA_COMPLETE. The generation wraps after 16383 submissions of the same
slot; the contract is that a client polls a cookie to its terminal
answer, or abandons it, before its slot has been reused 16383 times,
which every in-tree polling client satisfies by construction.

Descriptors with a completion interrupt armed stay with the IRQ
handler: a generic client such as dmatest may request an interrupt,
and reading such a descriptor's completion record here would race with
the handler recycling it. tx_status therefore reports DMA_IN_PROGRESS
while such a cookie is live and the stale-cookie check answers once the
handler has completed it. Whether a descriptor is interrupt-armed
travels in the cookie, in the bit below the sign bit, since the
descriptor's own flags are rewritten when the handler recycles it.

A polled descriptor has two terminal answers. Its completion record
gives the first; the query retires the descriptor and reports
DMA_COMPLETE or DMA_ERROR from the status. The second is DMA_ERROR for
a descriptor outstanding on a work queue or a device that is no longer
enabled, since nothing will complete it; the slot is retired only when
the device halted, which kills it for good. Descriptors carry the
device's reset epoch from submit time for that, and the halt stores its
state before it bumps the epoch, so a poll that read the old epoch and
the halted state reads the epoch again and retires on a mismatch. The
same epoch lets device_synchronize() treat a drain that a halt ended
as complete, since the halt killed everything the drain covered.

Switch the prep callbacks' descriptor allocation to IDXD_OP_NONBLOCK:
prep callbacks may not sleep, and on an exhausted pool they return NULL
so the caller falls back. Direct kernel clients such as iaa_crypto keep
the blocking allocator path. This gives dmaengine_async_is_tx_complete()
exact per-descriptor results for polling clients on a device whose work
queues complete out of order across a group's engines.

Assisted-by: Claude:claude-opus-5-5
Assisted-by: Claude:claude-fable-5-1
Signed-off-by: Daniel Byrne <daniel1.byrne@intel.com>
---
 drivers/dma/idxd/device.c |   1 +
 drivers/dma/idxd/dma.c    | 158 ++++++++++++++++++++++++++++++++++++--
 drivers/dma/idxd/idxd.h   |   3 +
 drivers/dma/idxd/irq.c    |   8 ++
 4 files changed, 165 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/idxd/device.c b/drivers/dma/idxd/device.c
index 5ccdc5ff8d53..68a7de74f9e6 100644
--- a/drivers/dma/idxd/device.c
+++ b/drivers/dma/idxd/device.c
@@ -155,6 +155,7 @@ int idxd_wq_alloc_resources(struct idxd_wq *wq)
 			desc->iax_completion = &wq->iax_compls[i];
 		desc->compl_dma = wq->compls_addr + idxd->data->compl_size * i;
 		desc->id = i;
+		desc->gen = 1;
 		desc->wq = wq;
 		desc->cpu = -1;
 	}
diff --git a/drivers/dma/idxd/dma.c b/drivers/dma/idxd/dma.c
index 0a7517cb51f2..dd5a9d9274ce 100644
--- a/drivers/dma/idxd/dma.c
+++ b/drivers/dma/idxd/dma.c
@@ -12,6 +12,20 @@
 #include "registers.h"
 #include "idxd.h"
 
+#define DMA_COOKIE_BITS (sizeof(dma_cookie_t) * 8)
+/*
+ * The descriptor id takes the lower 16 bits of the cookie.
+ */
+#define DESC_ID_BITS 16
+#define DESC_ID_MASK ((1 << DESC_ID_BITS) - 1)
+/*
+ * The generation takes the 14 bits above the id. Since dma_cookie_t is
+ * signed, the upper-most bit is left for the sign, and the bit below it
+ * records that the descriptor completes by interrupt.
+ */
+#define IDXD_COOKIE_RCI BIT(DMA_COOKIE_BITS - 2)
+#define DESC_GEN_MAX ((1 << (DMA_COOKIE_BITS - DESC_ID_BITS - 2)) - 1)
+
 static inline struct idxd_wq *to_idxd_wq(struct dma_chan *c)
 {
 	struct idxd_dma_chan *idxd_chan;
@@ -93,7 +107,7 @@ idxd_dma_prep_interrupt(struct dma_chan *c, unsigned long flags)
 		return NULL;
 
 	op_flag_setup(flags, &desc_flags);
-	desc = idxd_alloc_desc(wq, IDXD_OP_BLOCK);
+	desc = idxd_alloc_desc(wq, IDXD_OP_NONBLOCK);
 	if (IS_ERR(desc))
 		return NULL;
 
@@ -120,7 +134,7 @@ idxd_dma_submit_memcpy(struct dma_chan *c, dma_addr_t dma_dest,
 		return NULL;
 
 	op_flag_setup(flags, &desc_flags);
-	desc = idxd_alloc_desc(wq, IDXD_OP_BLOCK);
+	desc = idxd_alloc_desc(wq, IDXD_OP_NONBLOCK);
 	if (IS_ERR(desc))
 		return NULL;
 
@@ -154,11 +168,128 @@ static void idxd_dma_free_chan_resources(struct dma_chan *chan)
 		idxd_wq_refcount(wq));
 }
 
+/*
+ * A cookie has exactly one polling owner, the client that submitted the
+ * transaction. Observing a terminal completion record here retires and
+ * recycles the descriptor, since a polled descriptor has no interrupt
+ * and nobody else will. Two contexts polling the same live cookie
+ * would race that recycle, which every in-tree dmaengine polling
+ * client already avoids by construction.
+ */
 static enum dma_status idxd_dma_tx_status(struct dma_chan *dma_chan,
 					  dma_cookie_t cookie,
 					  struct dma_tx_state *txstate)
 {
-	return DMA_OUT_OF_ORDER;
+	struct idxd_wq *wq;
+	struct idxd_desc *desc;
+	u32 idx;
+	u8 status;
+
+	if (txstate)
+		memset(txstate, 0, sizeof(*txstate));
+
+	if (dma_submit_error(cookie))
+		return DMA_ERROR;
+
+	wq = to_idxd_wq(dma_chan);
+
+	idx = cookie & DESC_ID_MASK;
+	if (idx >= wq->num_descs)
+		return DMA_ERROR;
+
+	desc = wq->descs[idx];
+
+	/*
+	 * Descriptors with a completion interrupt armed (RCI) are
+	 * completed and recycled by the IRQ handler. Reading their
+	 * completion record here would race with the handler, and so
+	 * would reading the recycled descriptor's flags, which is why
+	 * the property travels in the cookie the caller owns. The handler
+	 * invalidates the cookie on completion, so a matching cookie means
+	 * the command is still in progress.
+	 */
+	if (cookie & IDXD_COOKIE_RCI)
+		return READ_ONCE(desc->txd.cookie) == cookie ?
+			DMA_IN_PROGRESS : DMA_COMPLETE;
+
+	if (desc->txd.cookie != cookie) {
+		/*
+		 * The cookie belongs to an old transaction that has
+		 * already completed and been recycled.
+		 */
+		return DMA_COMPLETE;
+	}
+
+	status = desc->completion->status & DSA_COMP_STATUS_MASK;
+
+	if (status) {
+		/* Capture completion record fields before desc is freed below. */
+		u8 fault_info = desc->completion->fault_info;
+		u64 fault_addr = desc->completion->fault_addr;
+
+		/*
+		 * Check against the original status because ABORT is
+		 * software defined as 0xff, which DSA_COMP_STATUS_MASK
+		 * can mask out.
+		 */
+		if (unlikely(desc->completion->status == IDXD_COMP_DESC_ABORT))
+			idxd_dma_complete_txd(desc, IDXD_COMPLETE_ABORT, true, NULL, NULL);
+		else
+			idxd_dma_complete_txd(desc, IDXD_COMPLETE_NORMAL, true, NULL, NULL);
+
+		dev_dbg(&wq->idxd->pdev->dev,
+			"dsa completion: status=0x%02x fault_info=0x%02x fault_addr=0x%llx\n",
+			status, fault_info, fault_addr);
+
+		if (status == DSA_COMP_SUCCESS)
+			return DMA_COMPLETE;
+
+		return DMA_ERROR;
+	}
+
+	/*
+	 * The descriptor is genuinely outstanding. A polled descriptor
+	 * carries no interrupt, so nothing but this function will ever
+	 * retire it, and a work queue or device that is no longer enabled
+	 * will not complete it either. Report the failure instead of
+	 * leaving the caller polling forever.
+	 *
+	 * A descriptor submitted before a device halt is dead for good:
+	 * the halt ended the engines and the reset that follows starts
+	 * them empty, so its record will never be written even once the
+	 * device is enabled again. Only in that case can the descriptor
+	 * be retired here safely; otherwise the pool would shrink by one
+	 * for every descriptor caught by a halt.
+	 */
+	if (desc->epoch != READ_ONCE(wq->idxd->reset_epoch)) {
+		idxd_dma_complete_txd(desc, IDXD_COMPLETE_ABORT, true, NULL, NULL);
+		return DMA_ERROR;
+	}
+	/*
+	 * A device that is no longer enabled runs nothing it holds, so an
+	 * outstanding descriptor on it has failed. A halt stores its state
+	 * before it bumps the epoch, and this poll may have read the epoch
+	 * before the halt and the state after it, so the epoch is read
+	 * again: only the retire frees the slot of a descriptor the halt
+	 * caught. A halted device whose epoch still matches is between the
+	 * two stores, and the next poll retires the descriptor. The submit
+	 * reads the state after the stamp, so it refuses a descriptor
+	 * stamped with the bumped epoch.
+	 */
+	if (wq->idxd->state != IDXD_DEV_ENABLED) {
+		if (desc->epoch != READ_ONCE(wq->idxd->reset_epoch)) {
+			idxd_dma_complete_txd(desc, IDXD_COMPLETE_ABORT, true,
+					      NULL, NULL);
+			return DMA_ERROR;
+		}
+		if (wq->idxd->state == IDXD_DEV_HALTED)
+			return DMA_IN_PROGRESS;
+		return DMA_ERROR;
+	}
+	if (wq->state != IDXD_WQ_ENABLED)
+		return DMA_ERROR;
+
+	return DMA_IN_PROGRESS;
 }
 
 /*
@@ -177,7 +308,17 @@ static dma_cookie_t idxd_dma_tx_submit(struct dma_async_tx_descriptor *tx)
 	int rc;
 	struct idxd_desc *desc = container_of(tx, struct idxd_desc, txd);
 
-	cookie = dma_cookie_assign(tx);
+	cookie = (desc->gen << DESC_ID_BITS) | (desc->id & DESC_ID_MASK);
+	if (desc->hw->flags & IDXD_OP_FLAG_RCI)
+		cookie |= IDXD_COOKIE_RCI;
+
+	if (desc->gen == DESC_GEN_MAX)
+		desc->gen = 1;
+	else
+		desc->gen++;
+
+	tx->cookie = cookie;
+	desc->epoch = READ_ONCE(wq->idxd->reset_epoch);
 
 	rc = idxd_submit_desc(wq, desc);
 	if (rc < 0) {
@@ -219,6 +360,7 @@ static void idxd_dma_synchronize(struct dma_chan *c)
 {
 	struct idxd_wq *wq = to_idxd_wq(c);
 	LIST_HEAD(quarantined);
+	u32 epoch;
 
 	/*
 	 * dmaengine_synchronize() promises the client that its memory may
@@ -240,7 +382,13 @@ static void idxd_dma_synchronize(struct dma_chan *c)
 	 * Only a device reset ends the exposure of the client's memory.
 	 */
 	idxd_wq_quarantine_take(wq, &quarantined);
-	if (!idxd_wq_drain(wq)) {
+	/*
+	 * A halt during the drain kills every descriptor submitted before
+	 * it, which is all of them, and a reset that followed may have
+	 * ended the drain itself. Such a drain is as good as complete.
+	 */
+	epoch = READ_ONCE(wq->idxd->reset_epoch);
+	if (!idxd_wq_drain(wq) || READ_ONCE(wq->idxd->reset_epoch) != epoch) {
 		idxd_wq_quarantine_free(wq, &quarantined);
 		WRITE_ONCE(wq->stuck, false);
 		return;
diff --git a/drivers/dma/idxd/idxd.h b/drivers/dma/idxd/idxd.h
index b0cfd7101174..7fe5ec6c3bf3 100644
--- a/drivers/dma/idxd/idxd.h
+++ b/drivers/dma/idxd/idxd.h
@@ -349,6 +349,7 @@ struct idxd_device {
 	spinlock_t cmd_lock;	/* spinlock for device commands */
 	struct completion *cmd_done;
 	u32 cmd_seq;		/* bumps when a command starts running */
+	u32 reset_epoch;	/* bumps on every device halt */
 	struct idxd_group **groups;
 	struct idxd_wq **wqs;
 	struct idxd_engine **engines;
@@ -447,9 +448,11 @@ struct idxd_desc {
 	struct list_head list;
 	int id;
 	int cpu;
+	u16 gen;
 	u16 terminate_gen;	/* the queue's terminate_gen at an
 				 * interrupt-armed submit
 				 */
+	u32 epoch;		/* the device reset_epoch at submit */
 	struct idxd_wq *wq;
 };
 
diff --git a/drivers/dma/idxd/irq.c b/drivers/dma/idxd/irq.c
index 8217698056bb..5e34790359ee 100644
--- a/drivers/dma/idxd/irq.c
+++ b/drivers/dma/idxd/irq.c
@@ -508,6 +508,14 @@ static irqreturn_t idxd_halt(struct idxd_device *idxd)
 	gensts.bits = ioread32(idxd->reg_base + IDXD_GENSTATS_OFFSET);
 	if (gensts.state == IDXD_DEVICE_STATE_HALT) {
 		idxd->state = IDXD_DEV_HALTED;
+		/*
+		 * Every descriptor submitted before this point is dead: the
+		 * device will never write its completion record. Pollers
+		 * compare their descriptor's epoch against this to retire
+		 * such descriptors instead of waiting for a record that never
+		 * comes.
+		 */
+		WRITE_ONCE(idxd->reset_epoch, idxd->reset_epoch + 1);
 		if (gensts.reset_type == IDXD_DEVICE_RESET_SOFTWARE) {
 			/* The reinit below re-enables the queues, so revive them. */
 			idxd_wqs_halt_flush(idxd, true);
-- 
2.43.0

