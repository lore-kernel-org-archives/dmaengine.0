Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792707156;
	b=l4a99AR31LufiL7w+1Q9HlA99S5zgE+/lUjl+n5EkQTn3gy5N6cqG4nWkRbjGQnWTi1y
	 A0l10uIUBa9/NKkAlf1ummnzZNjHuIyvnnFLKCQmefgO9pdYAflwyBN0QJ9p+05ZKbZpN
	 rUCuFNVxjmwE0w3OvgAqynubkV5qG/DrWZdszDYjtU3mEURRRBnCDjktYaMkzgYViBKW/
	 4TX5YscpHVnYij+92+rQY4+9bk64+/IJakvX3mbrtXhtOmTbq9y2gxEoOaZ9FNCBnTy3n
	 4OvVEHXx9vKXOTK+bqx0yrXpUtigMNzX2K6/GeKy7LfQXlu6WMz9n90N9jaycz3/RNA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792707156;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=1bEvPG19AYGfhRwwDsA26Ec35q3t6hOIj5fBaUZJUBg=;
	b=d/5AIOZdhN2ksE5SBhphDCYvb3qJ6CsiCLMN43vDbtbZMLz6Fr4UwFaTO20N92dk+Gqs
	 0Jdi2i8juaWn/pQB3MlILRqCuj0PclHtQjWgiHOK/FbTit6w3ckY05w22vf7fPmfX/r9Z
	 rKHyVmFT+uk7oAVvLoqDXQLuFKAyRjCM7qsHNXbf1c/8GZ2/eV23e9T5643mYUzJr9Ki+
	 O/Bfn3IQXiQIKucgDr7QUq7GFh+boGruRjOUtTgNkZ/7TeAmPoFdmjmgpnbfMfUlcp7XD
	 +6+5vcbSOkA7SmZSfKX47inp3WSZ/vwps4hLCDM8eRtiBj/FaT/uCMk9evcVCuWgL8A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W5Yr8VsJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE130606A320;
	Thu, 22 Oct 2026 22:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W5Yr8VsJ
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792707155;
	b=QKMYQOEzSaVu70KyhF+Arm0bZnJuIoLDynHlGX76opiavmvhaKxhwB8tDXaomF3xRzir
	 mCh0Q2SLHst+pncX6k2xcwmFURIfBNQhfOtHH2YmJEEnP2s3usovxBEew8BRr8qapbuoZ
	 DNF65pSgboHNi6mSWXuB5onNyV9ZrIOEWe9O0XZircR5oyvL/Jn+aVdqhuxooYTQJcAAp
	 f5H+B5pT5QuWZEzd9Y/a1dx22tapytU6EAe4G6hxLe81rxCWAPeYCFoEClUL/TA/RpcnJ
	 6JwoYymF4+93miwNgGhzdayVTHz796KZ0fUWqzCR1acHAEFAksJSLj2Mf9vylEPnCTQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792707155;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=1bEvPG19AYGfhRwwDsA26Ec35q3t6hOIj5fBaUZJUBg=;
	b=NHP1D+ce61/cqgoLDoQush+3km83+0xfRSS9TqPg/FtzIujfoE/0sV+/FSeR8jQ7idJ4
	 kO/iiVWStWqgXtUNDYf/Za1llFnTZQoDP71YeT8KLi4pna4U7I2+Frk7j/CeSptAMlUjq
	 Wzz6fdDpukyiZMamzs+6drq3Dqpv67k++dz0oOoPgl+QC3rEDL9JoyfFRRg9rdWFej/kN
	 DCbHhctjNalM6fJ1exJj4H/YwAkYKQj6I9kl0tFIf0apURsEDEUpUSC+UZq/2PRbWgW8g
	 FTabLl2ixisVo3POGCKsbt6rhIiX+lyWtbbLExHdwtGjTiw6fx4m6ASZZdffLEIqxHw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1FFED1F031E1;
	Thu, 22 Oct 2026 22:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792707155;
	bh=1bEvPG19AYGfhRwwDsA26Ec35q3t6hOIj5fBaUZJUBg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=W5Yr8VsJbROi5A5fO0/Y0pfC+N/6oVJrGGYjClsUzTFcOe51pb9Q5HnPYz0HNj7kL
	 RXmWPihAKbdhbPi4i6UvYGzvRYtqjrlpID5Dy5CQiVMC2MAhT/yDoXodIiYe+V4ObV
	 M38ZAK0knZHgCHmVWGpgN2R+CTmZwPk184fRt5pOsau2nies32J8zK8o5+M9a54RWO
	 WZNXzQJBec85D/ttjsD0ppbHlau3kjYMmBAxDdHvGPgo1+LOV8TLECwTtw2DRTLU3e
	 aJ+TAtV8aD0zfPsPVEPuWyhPNYpvo9x08XV63QAqIhIEdlMpfFk4o7eQxmQCKFjfaA
	 gvpjXnntr7bog==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 97B8F41FCD;
	Thu, 22 Oct 2026 22:12:33 +0000 (UTC)
From: "Jeff C. Jensen via B4 Relay" <devnull+kernel.nullptr.com@kernel.org>
Date: Thu, 22 Oct 2026 15:11:33 -0700
Subject: [PATCH 4/5] dmaengine: xilinx_dma: Withhold an AXI DMA engine
 whose reset did not complete
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261022-xilinx-dma-work-v1-4-20faea2e7a80@nullptr.com>
References: <20261022-xilinx-dma-work-v1-0-20faea2e7a80@nullptr.com>
In-Reply-To: <20261022-xilinx-dma-work-v1-0-20faea2e7a80@nullptr.com>
To: Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org
Cc: Frank Li <Frank.Li@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 Suraj Gupta <suraj.gupta2@amd.com>, 
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, 
 Alex Bereza <alex@bereza.email>, 
 Folker Schwesinger <dev@folker-schwesinger.de>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 "Jeff C. Jensen" <kernel@nullptr.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=13224;
 i=kernel@nullptr.com; s=openpgp-2026; h=from:subject:message-id;
 bh=8f3echmTscK7Xuk/qyfm0slf+tLr34d5v2E+aRNmBNI=;
 b=kA0DAAoW2P9wgagLEQgByyZiAGrailCgTcVE5SWI6WjzmOZcDKVkXW5RtZAMYtFxdXIVLO0hp
 oh1BAAWCgAdFiEEx8aWuW89T35ye9962P9wgagLEQgFAmrailAACgkQ2P9wgagLEQjU+wEAp+MA
 V82tR6Vmtmh8M3hhDgtw4GaTBqgXWc4c/xWjzq8A+gJ8aBvY8F3/zN6/HPgKdbqX0jodR05b08e
 EGM/FMy4N
X-Developer-Key: i=kernel@nullptr.com; a=openpgp;
 fpr=C7C696B96F3D4F7E727BDF7AD8FF7081A80B1108
X-Endpoint-Received: by B4 Relay for kernel@nullptr.com/openpgp-2026 with
 auth_id=1265
X-Original-From: "Jeff C. Jensen" <kernel@nullptr.com>
Reply-To: kernel@nullptr.com
Content-Transfer-Encoding: 7bit

From: "Jeff C. Jensen" <kernel@nullptr.com>

When xilinx_dma_chan_reset() times out, all the driver knows is that it
did not see the reset complete. The engine may still be fetching
descriptors and writing data: the AXI DMA product guide (PG021, Reset
bit of MM2S_DMACR and S2MM_DMACR) says a soft reset completes or flushes
outstanding operations while the reset bit stays set. Two paths carry on
regardless:

 - xilinx_dma_terminate_all() ignores the result of the reset, frees
   every descriptor, marks the channel idle and returns success. The
   next transaction then reuses segments the engine may still fetch.
   This has been the case since AXI DMA support was added;
   commit 2575cb81a966 ("dmaengine: xilinx_dma: Reset DMA channel in
   dma_terminate_all") made the reset unconditional without checking its
   result either.

 - xilinx_dma_tx_submit() resets a channel that is in error and returns
   the error without freeing the descriptor, which leaks the descriptor
   and the segments it holds.

Withhold the engine instead. Setting the reset bit of either direction
resets the whole AXI DMA engine, so both channels of the controller are
withheld: their descriptors move to a quarantine list instead of being
freed, and neither channel takes new work. Each check is made under
chan->lock, where the resource changes hands:

 - segment reservation fails, so repeated preparation cannot drain the
   pool;
 - xilinx_dma_tx_submit() keeps a descriptor that was prepared before
   the channel was withheld, since the engine may own its segments;
 - xilinx_dma_start_transfer() starts nothing, whether it is called from
   issue_pending or from the interrupt handler;
 - xilinx_dma_alloc_chan_resources() fails, and
   xilinx_dma_free_chan_resources() keeps the descriptor memory, so the
   engine cannot write into whatever is allocated next.

Withholding sets chan->terminating before it moves the lists, so that a
completion pass running a callback stops at its current descriptor, as
it does for a terminate. xilinx_dma_tx_status() reports DMA_ERROR for
cookies of a withheld channel that have not completed; cookies that
completed earlier still report DMA_COMPLETE.

This protects descriptor ownership only. A withheld channel stays out of
service. The client keeps its buffers mapped and its callback resources
alive, because a terminate that fails has not stopped the engine, and
dmaengine_terminate_sync() does not synchronize after one. On driver
removal the withheld memory is left allocated, and
xilinx_dma_chan_remove() reports it.

CDMA, VDMA and MCDMA channels behave as before.

Fixes: c0bba3a99f07 ("dmaengine: vdma: Add Support for Xilinx AXI Direct Memory Access Engine")
Assisted-by: Claude:claude-fable-5-1
Signed-off-by: Jeff C. Jensen <kernel@nullptr.com>
---
 drivers/dma/xilinx/xilinx_dma.c | 150 +++++++++++++++++++++++++++++++++++-----
 1 file changed, 133 insertions(+), 17 deletions(-)

diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index 805cd3e2bc27..0316c6e7881f 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -391,6 +391,9 @@ struct xilinx_dma_tx_descriptor {
  * @pending_list: Descriptors waiting
  * @active_list: Descriptors ready to submit
  * @done_list: Complete descriptors
+ * @quarantine_list: Descriptors withheld after a reset that did not complete
+ * @quarantined: The reset did not complete; the channel is withheld and takes
+ *	no work
  * @free_seg_list: Free AXI MCDMA descriptors
  * @seg_used: AXI DMA segments in use, indexed by ring position
  * @seg_next: Ring position the next AXI DMA reservation starts at
@@ -432,6 +435,8 @@ struct xilinx_dma_chan {
 	struct list_head pending_list;
 	struct list_head active_list;
 	struct list_head done_list;
+	struct list_head quarantine_list;
+	bool quarantined;
 	struct list_head free_seg_list;
 	DECLARE_BITMAP(seg_used, XILINX_DMA_NUM_DESCS);
 	u32 seg_next;
@@ -720,8 +725,9 @@ xilinx_cdma_alloc_tx_segment(struct xilinx_dma_chan *chan)
  * wrapping at the pool end. The engine fetches descriptors in ring order, so
  * the run cannot be placed anywhere else.
  *
- * Return: 0 on success, -ENOMEM when the run is not free. A failure leaves the
- * ownership bitmap and @chan->seg_next unchanged.
+ * Return: 0 on success, -ENOMEM when the run is not free, -ENODEV when the
+ * channel is withheld. A failure leaves the ownership bitmap and
+ * @chan->seg_next unchanged.
  */
 static int xilinx_axidma_reserve_segments(struct xilinx_dma_chan *chan,
 					  u32 count, u32 *start)
@@ -732,6 +738,11 @@ static int xilinx_axidma_reserve_segments(struct xilinx_dma_chan *chan,
 
 	spin_lock_irqsave(&chan->lock, flags);
 
+	if (chan->quarantined) {
+		ret = -ENODEV;
+		goto out;
+	}
+
 	for (i = 0; i < count; i++) {
 		if (test_bit((chan->seg_next + i) % XILINX_DMA_NUM_DESCS,
 			     chan->seg_used))
@@ -748,7 +759,7 @@ static int xilinx_axidma_reserve_segments(struct xilinx_dma_chan *chan,
 out:
 	spin_unlock_irqrestore(&chan->lock, flags);
 
-	if (ret)
+	if (ret == -ENOMEM)
 		dev_dbg(chan->dev, "no run of %u free tx segments\n", count);
 
 	return ret;
@@ -963,6 +974,64 @@ static void xilinx_dma_cancel_tx_descriptor(struct xilinx_dma_chan *chan,
 	xilinx_dma_free_tx_descriptor(chan, desc);
 }
 
+/**
+ * xilinx_dma_quarantine_channel - Withhold a channel whose engine did not reset
+ * @chan: Driver specific DMA channel
+ *
+ * Moves every descriptor of the channel to the quarantine list. While
+ * @chan->quarantined is set, the channel refuses segment reservation,
+ * submission, transfer start and resource allocation. Segment reservations
+ * and the descriptor pool stay held.
+ */
+static void xilinx_dma_quarantine_channel(struct xilinx_dma_chan *chan)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&chan->lock, flags);
+	chan->quarantined = true;
+	chan->err = true;
+	/* a completion pass mid-callback stops at its current descriptor */
+	chan->terminating = true;
+	list_splice_tail_init(&chan->done_list, &chan->quarantine_list);
+	list_splice_tail_init(&chan->active_list, &chan->quarantine_list);
+	list_splice_tail_init(&chan->pending_list, &chan->quarantine_list);
+	chan->desc_pendingcount = 0;
+	chan->desc_submitcount = 0;
+	spin_unlock_irqrestore(&chan->lock, flags);
+
+	dev_err(chan->dev, "channel %p withheld: the engine did not reset\n", chan);
+}
+
+/**
+ * xilinx_dma_quarantine_controller - Withhold every channel of an AXI DMA engine
+ * @chan: Channel whose reset did not complete
+ *
+ * The AXI DMA soft reset acts on the whole engine, so a reset that did not
+ * complete leaves both directions in an unknown state.
+ */
+static void xilinx_dma_quarantine_controller(struct xilinx_dma_chan *chan)
+{
+	struct xilinx_dma_device *xdev = chan->xdev;
+	int i;
+
+	for (i = 0; i < xdev->dma_config->max_channels; i++) {
+		if (xdev->chan[i])
+			xilinx_dma_quarantine_channel(xdev->chan[i]);
+	}
+}
+
+static bool xilinx_dma_chan_quarantined(struct xilinx_dma_chan *chan)
+{
+	unsigned long flags;
+	bool held;
+
+	spin_lock_irqsave(&chan->lock, flags);
+	held = chan->quarantined;
+	spin_unlock_irqrestore(&chan->lock, flags);
+
+	return held;
+}
+
 /* Required functions */
 
 /**
@@ -1009,6 +1078,15 @@ static void xilinx_dma_free_chan_resources(struct dma_chan *dchan)
 
 	dev_dbg(chan->dev, "Free all channel resources.\n");
 
+	/*
+	 * Freed descriptor memory would go to the next allocation while the
+	 * engine may still fetch from it.
+	 */
+	if (xilinx_dma_chan_quarantined(chan)) {
+		dev_err(chan->dev, "channel %p withheld: keeping its descriptor memory\n", chan);
+		return;
+	}
+
 	xilinx_dma_free_descriptors(chan);
 
 	if (chan->xdev->dma_config->dmatype == XDMA_TYPE_AXIDMA) {
@@ -1204,6 +1282,12 @@ static int xilinx_dma_alloc_chan_resources(struct dma_chan *dchan)
 	struct xilinx_dma_chan *chan = to_xilinx_chan(dchan);
 	int i;
 
+	/* a new pool would replace the one the withheld descriptors still occupy */
+	if (xilinx_dma_chan_quarantined(chan)) {
+		dev_err(chan->dev, "channel %p withheld: refusing allocation\n", chan);
+		return -EBUSY;
+	}
+
 	/* Has this channel already been allocated? */
 	if (chan->desc_pool)
 		return 0;
@@ -1450,11 +1534,13 @@ static enum dma_status xilinx_dma_tx_status(struct dma_chan *dchan,
 	u32 residue = 0;
 
 	ret = dma_cookie_status(dchan, cookie, txstate);
-	if (ret == DMA_COMPLETE || !txstate)
+	if (ret == DMA_COMPLETE)
 		return ret;
 
 	spin_lock_irqsave(&chan->lock, flags);
-	if (!list_empty(&chan->active_list)) {
+	if (chan->quarantined) {
+		ret = DMA_ERROR;
+	} else if (txstate && !list_empty(&chan->active_list)) {
 		desc = list_last_entry(&chan->active_list,
 				       struct xilinx_dma_tx_descriptor, node);
 		/*
@@ -1466,7 +1552,8 @@ static enum dma_status xilinx_dma_tx_status(struct dma_chan *dchan,
 	}
 	spin_unlock_irqrestore(&chan->lock, flags);
 
-	dma_set_residue(txstate, residue);
+	if (txstate)
+		dma_set_residue(txstate, residue);
 
 	return ret;
 }
@@ -1717,7 +1804,7 @@ static void xilinx_dma_start_transfer(struct xilinx_dma_chan *chan)
 	struct xilinx_axidma_tx_segment *tail_segment;
 	u32 reg;
 
-	if (chan->err)
+	if (chan->err || chan->quarantined)
 		return;
 
 	if (list_empty(&chan->pending_list)) {
@@ -2203,18 +2290,23 @@ static void append_desc_queue(struct xilinx_dma_chan *chan,
  * be submitted, or its rejection handled, before the next one is prepared on
  * the same channel.
  *
- * Return: cookie value on success and failure value on error
+ * Return: cookie value on success, -EBUSY while a cyclic transaction runs, or
+ * -ENODEV or the reset error on a withheld channel, which keeps the descriptor
+ * on the quarantine list.
  */
 static dma_cookie_t xilinx_dma_tx_submit(struct dma_async_tx_descriptor *tx)
 {
 	struct xilinx_dma_tx_descriptor *desc = to_dma_tx_descriptor(tx);
 	struct xilinx_dma_chan *chan = to_xilinx_chan(tx->chan);
-	dma_cookie_t cookie;
+	dma_cookie_t cookie = -ENODEV;
 	unsigned long flags;
 	int err;
 
 	spin_lock_irqsave(&chan->lock, flags);
 
+	if (chan->quarantined)
+		goto withhold;
+
 	if (chan->cyclic) {
 		xilinx_dma_cancel_tx_descriptor(chan, desc);
 		spin_unlock_irqrestore(&chan->lock, flags);
@@ -2222,15 +2314,17 @@ static dma_cookie_t xilinx_dma_tx_submit(struct dma_async_tx_descriptor *tx)
 	}
 
 	if (chan->err) {
-		/*
-		 * If reset fails, need to hard reset the system.
-		 * Channel is no longer functional
-		 */
 		spin_unlock_irqrestore(&chan->lock, flags);
 		err = xilinx_dma_chan_reset(chan);
-		if (err < 0)
-			return err;
+		if (err < 0) {
+			if (chan->xdev->dma_config->dmatype != XDMA_TYPE_AXIDMA)
+				return err;
+			xilinx_dma_quarantine_controller(chan);
+			cookie = err;
+		}
 		spin_lock_irqsave(&chan->lock, flags);
+		if (chan->quarantined)
+			goto withhold;
 	}
 
 	cookie = dma_cookie_assign(tx);
@@ -2245,6 +2339,16 @@ static dma_cookie_t xilinx_dma_tx_submit(struct dma_async_tx_descriptor *tx)
 
 	spin_unlock_irqrestore(&chan->lock, flags);
 
+	return cookie;
+
+withhold:
+	/*
+	 * The reservation predates the withholding, so its segments cannot be
+	 * told apart from ones the engine still owns.
+	 */
+	list_add_tail(&desc->node, &chan->quarantine_list);
+	spin_unlock_irqrestore(&chan->lock, flags);
+
 	return cookie;
 }
 
@@ -2817,7 +2921,8 @@ xilinx_mcdma_prep_slave_sg(struct dma_chan *dchan, struct scatterlist *sgl,
  * xilinx_dma_terminate_all - Halt the channel and free descriptors
  * @dchan: Driver specific DMA Channel pointer
  *
- * Return: '0' always.
+ * Return: 0, or the reset error when an AXI DMA reset does not complete, in
+ * which case every channel of the engine is withheld with its descriptors.
  */
 static int xilinx_dma_terminate_all(struct dma_chan *dchan)
 {
@@ -2835,7 +2940,12 @@ static int xilinx_dma_terminate_all(struct dma_chan *dchan)
 		}
 	}
 
-	xilinx_dma_chan_reset(chan);
+	err = xilinx_dma_chan_reset(chan);
+	if (err && chan->xdev->dma_config->dmatype == XDMA_TYPE_AXIDMA) {
+		xilinx_dma_quarantine_controller(chan);
+		return err;
+	}
+
 	/* Remove and free all of the descriptors in the lists */
 	chan->terminating = true;
 	xilinx_dma_free_descriptors(chan);
@@ -2943,6 +3053,11 @@ EXPORT_SYMBOL(xilinx_vdma_channel_set_config);
  */
 static void xilinx_dma_chan_remove(struct xilinx_dma_chan *chan)
 {
+	if (xilinx_dma_chan_quarantined(chan))
+		dev_err(chan->dev,
+			"channel %p withheld: its descriptor memory is not reclaimed\n",
+			chan);
+
 	/* Disable all interrupts */
 	dma_ctrl_clr(chan, XILINX_DMA_REG_DMACR,
 		      XILINX_DMA_DMAXR_ALL_IRQ_MASK);
@@ -3171,6 +3286,7 @@ static int xilinx_dma_chan_probe(struct xilinx_dma_device *xdev,
 	INIT_LIST_HEAD(&chan->pending_list);
 	INIT_LIST_HEAD(&chan->done_list);
 	INIT_LIST_HEAD(&chan->active_list);
+	INIT_LIST_HEAD(&chan->quarantine_list);
 	INIT_LIST_HEAD(&chan->free_seg_list);
 
 	/* Retrieve the channel properties from the device tree */

-- 
2.43.0


