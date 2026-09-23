Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB6734EF0C;
	Wed, 23 Sep 2026 06:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790143276; cv=none; b=uPSr8OjJ60Yj2BBu8RyzwMlE+ym5t54Ue0zkrtgztHDyWNvuN+2axoQ0s5Tjw0ZKP2lF96V0k5T1boZBGpIaxsssSWlh6+nxU8+8j+OUDeC5Z+fkiljYYB4im4soVZ2efxqgsCIyGTX2oYJeKlMKY6h8G6CXSqNeXS+ScRx5jTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790143276; c=relaxed/simple;
	bh=q5HtuaL/7zIru73zl+ZsvNSbOOJb12l5eB6mME90i4U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hcFEhIVYGQX/kyUUDLqVLCAy+yByeO/T/Po67Qc8Kkd2aHDWH9viCq3AKM/UhwR+CHSLGy4g8AlG2UhgGl7mCJvKIoe4vg6h++OQdLn5mj2h295mZ2BFJptMNcizFoIla/FVBk7ZRhLahZwWg32vRMJb5b0K0qT/s30dfAFwK7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=AaB8pLQy; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="AaB8pLQy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=YQ
	y5aR7oWIGdKoIh87gvoEUOxvJFspyyAAlzNvXtwtM=; b=AaB8pLQyWlrhfoGLnP
	9pLoPNINOoyQm1dHMkcukXhrCYjFOlO7TDH6nC2yIM6cWH2z8NkYOHOzls4H93cU
	ieDkpAxbaDTgaO0wisRCaSP7IJOtBPsL6laTk4gzqfibhAnKnAMKG98c84NLP4CM
	ZnWqarzEWpIVtBwVsgMmzXxQ0=
Received: from LUOBO-DINQG8T.hobot.cc (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wD3_7gRa7NqLhUUAQ--.55648S2;
	Wed, 23 Sep 2026 14:00:50 +0800 (CST)
From: Rui Wang <wr574332525@163.com>
To: vkoul@kernel.org,
	Eugeniy.Paltsev@synopsys.com
Cc: Frank.Li@kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rui Wang <wr574332525@163.com>
Subject: [PATCH v4] dmaengine: dw-axi-dmac: report paused state and residue in tx_status
Date: Wed, 23 Sep 2026 14:00:45 +0800
Message-ID: <20260923060045.5571-1-wr574332525@163.com>
X-Mailer: git-send-email 2.53.0.windows.2
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3_7gRa7NqLhUUAQ--.55648S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxtr1rJr1kZF18ZrWrGw4UArb_yoWfWw17pF
	W5G3yrKrWDXFnY9F47Gw4rJr15ZF4rJFy2kryrJ34akF45Grna9Fs3Ka4YqF1DCr929342
	9F4Yy343Ga1UCrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pi8uctUUUUU=
X-CM-SenderInfo: lzuvlkittskjqv6rljoofrz/xtbC1BRnAGqzaxQqIAAA3L

The driver implements device_pause/device_resume, but device_tx_status
keeps reporting DMA_IN_PROGRESS for a paused channel, so clients cannot
tell a paused channel apart from a running one. Report DMA_PAUSED when
the channel is paused and the cookie is still in flight, including for
callers that pass a NULL dma_tx_state, and clear the stale is_paused
flag in dma_chan_terminate_all(), which disables the channel and thus
implicitly cancels the paused state.

Also, the residue of an in-flight transfer is currently derived from
the number of completed LLI blocks, so it only advances in block-size
steps and stays stale for the duration of a large block. Read the
current hardware pointer (CH_SAR for MEM_TO_DEV and MEM_TO_MEM, CH_DAR
for DEV_TO_MEM) and walk the descriptor's LLIs to compute how many
bytes have actually been transferred. The 64-bit pointer is sampled
with a tearing-safe double read, as the transfer may be running
concurrently. The pointer is only consulted for the descriptor most
recently programmed into the hardware, tracked in the previously
unused chan->desc field; any other descriptor has not been started yet
and keeps reporting its full length. When the transfer has just
completed but the descriptor has not been reaped yet, the pointer sits
at the end of the last block and the residue naturally reads as 0;
conversely, a channel whose enable bit is still set never reports full
completion, so a stale pointer left by a previous transfer reusing the
same buffer cannot be mistaken for a finished one. Cyclic descriptors
keep the block-granular accounting.

Tested on an FPGA platform.

Signed-off-by: Rui Wang <wr574332525@163.com>
---
Changes in v4:
- Track which descriptor the hardware pointer registers belong to via
  the (previously unused) chan->desc field instead of testing the head
  of desc_issued: a queued-but-never-started descriptor must not be
  matched against the stale pointer left by a previous transfer, which
  could otherwise falsely report full completion when its buffer is
  reused.
- Clear chan->desc when its descriptor is reaped or the channel is
  terminated.
- Link to v3: https://lore.kernel.org/dmaengine/20260923044104.3234-1-wr574332525@163.com/
Changes in v3:
- Report DMA_PAUSED also to callers passing a NULL dma_tx_state.
- Never report full completion while the channel enable bit is still
  set, so a stale pointer (e.g. a new transfer reusing the buffer of a
  just-finished one) is not mistaken for completion.
- Link to v2: https://lore.kernel.org/dmaengine/20260923034653.1413-1-wr574332525@163.com/
Changes in v2:
- Sample the 64-bit SAR/DAR with a tearing-safe double read instead of
  lo_hi_readq(), avoiding a torn pointer when the low half wraps.
- Read the hardware pointer for the in-flight descriptor even after the
  hardware has just completed it (channel enable self-cleared, IRQ not
  yet handled), so the residue reads 0 instead of jumping back to the
  full length.
- Link to v1: https://lore.kernel.org/dmaengine/20260923030201.859-1-wr574332525@163.com/
---
 .../dma/dw-axi-dmac/dw-axi-dmac-platform.c    | 114 ++++++++++++++++--
 1 file changed, 106 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index eebed2474..66da247ff 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -352,33 +352,122 @@ static void vchan_desc_put(struct virt_dma_desc *vdesc)
 	axi_desc_put(vd_to_axi_desc(vdesc));
 }
 
+/*
+ * Read a 64-bit channel address register while the transfer may be
+ * running. A plain lo_hi_readq() tears if the low half wraps (carrying
+ * into the high half) between the two 32-bit reads, so sample the high
+ * half twice and re-sample the low half if it moved; a second 4 GiB
+ * wrap cannot happen within these few instructions.
+ */
+static u64 axi_chan_readq(struct axi_dma_chan *chan, u32 reg)
+{
+	u32 hi, lo, hi2;
+
+	hi = readl(chan->chan_regs + reg + 4);
+	lo = readl(chan->chan_regs + reg);
+	hi2 = readl(chan->chan_regs + reg + 4);
+	if (unlikely(hi != hi2)) {
+		/* Low half wrapped in between, take consistent samples */
+		lo = readl(chan->chan_regs + reg);
+		hi = hi2;
+	}
+
+	return (u64)hi << 32 | lo;
+}
+
+/*
+ * Return the number of bytes already transferred by the descriptor
+ * currently on the hardware (running, paused or just completed), based
+ * on the current read or write position: CH_SAR for MEM_TO_DEV and
+ * MEM_TO_MEM, CH_DAR for DEV_TO_MEM. Must be called with vc.lock held.
+ */
+static u32 axi_chan_get_xferred(struct axi_dma_chan *chan,
+				struct axi_dma_desc *desc)
+{
+	struct axi_dma_hw_desc *hw_desc;
+	bool dst = chan->direction == DMA_DEV_TO_MEM;
+	u64 pos, start;
+	u32 xferred = 0;
+	int i;
+
+	pos = axi_chan_readq(chan, dst ? CH_DAR : CH_SAR);
+
+	for (i = 0; i < desc->nr_hw_descs; i++) {
+		hw_desc = &desc->hw_desc[i];
+		start = le64_to_cpu(dst ? hw_desc->lli->dar : hw_desc->lli->sar);
+
+		/* Current position is inside this block: partial progress */
+		if (pos >= start && pos <= start + hw_desc->len)
+			return xferred + (u32)(pos - start);
+
+		xferred += hw_desc->len;
+	}
+
+	/* Position doesn't match any block, be conservative */
+	return 0;
+}
+
 static enum dma_status
 dma_chan_tx_status(struct dma_chan *dchan, dma_cookie_t cookie,
 		   struct dma_tx_state *txstate)
 {
 	struct axi_dma_chan *chan = dchan_to_axi_dma_chan(dchan);
 	struct virt_dma_desc *vdesc;
+	struct axi_dma_desc *desc;
 	enum dma_status status;
 	u32 completed_length;
 	unsigned long flags;
-	u32 completed_blocks;
 	size_t bytes = 0;
 	u32 length;
-	u32 len;
 
 	status = dma_cookie_status(dchan, cookie, txstate);
-	if (status == DMA_COMPLETE || !txstate)
+	if (status == DMA_COMPLETE)
 		return status;
 
 	spin_lock_irqsave(&chan->vc.lock, flags);
 
+	if (chan->is_paused && status == DMA_IN_PROGRESS)
+		status = DMA_PAUSED;
+
+	if (!txstate) {
+		spin_unlock_irqrestore(&chan->vc.lock, flags);
+		return status;
+	}
+
 	vdesc = vchan_find_desc(&chan->vc, cookie);
 	if (vdesc) {
-		length = vd_to_axi_desc(vdesc)->length;
-		completed_blocks = vd_to_axi_desc(vdesc)->completed_blocks;
-		len = vd_to_axi_desc(vdesc)->hw_desc[0].len;
-		completed_length = completed_blocks * len;
-		bytes = length - completed_length;
+		desc = vd_to_axi_desc(vdesc);
+		length = desc->length;
+
+		if (chan->cyclic) {
+			completed_length = desc->completed_blocks *
+					   desc->hw_desc[0].len;
+		} else if (desc == chan->desc) {
+			/*
+			 * chan->desc is the descriptor last programmed into the
+			 * hardware, so the pointer registers belong to it. Never
+			 * match a queued-but-never-started descriptor against
+			 * the stale pointer left by a previous transfer.
+			 *
+			 * If the transfer has just finished but the interrupt
+			 * has not reaped the descriptor yet, the pointer sits at
+			 * the end and the residue reads 0. Conversely, the
+			 * hardware clears the channel enable bit on completion,
+			 * so a still-enabled channel cannot be done: right after
+			 * the start the pointer may still alias the end of a
+			 * previous transfer reusing the same buffer. Never report
+			 * full completion while the channel runs.
+			 */
+			completed_length = axi_chan_get_xferred(chan, desc);
+			if (completed_length == length &&
+			    axi_chan_is_hw_enable(chan))
+				completed_length = length - 1;
+		} else {
+			/* Still queued, nothing transferred yet */
+			completed_length = 0;
+		}
+
+		bytes = length - min_t(u32, completed_length, length);
 	}
 
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
@@ -468,6 +557,9 @@ static void axi_chan_block_xfer_start(struct axi_dma_chan *chan,
 	}
 	axi_chan_config_write(chan, &config);
 
+	/* The hardware pointer registers now belong to this descriptor */
+	chan->desc = first;
+
 	write_chan_llp(chan, first->hw_desc[0].llp | lms);
 
 	irq_mask = DWAXIDMAC_IRQ_DMA_TRF | DWAXIDMAC_IRQ_ALL_ERR;
@@ -1077,6 +1169,8 @@ static noinline void axi_chan_handle_err(struct axi_dma_chan *chan, u32 status)
 	}
 	/* Remove the completed descriptor from issued list */
 	list_del(&vd->node);
+	if (chan->desc == vd_to_axi_desc(vd))
+		chan->desc = NULL;
 
 	/* WARN about bad descriptor */
 	dev_err(chan2dev(chan),
@@ -1140,6 +1234,8 @@ static void axi_chan_block_xfer_complete(struct axi_dma_chan *chan)
 	} else {
 		/* Remove the completed descriptor from issued list before completing */
 		list_del(&vd->node);
+		if (chan->desc == vd_to_axi_desc(vd))
+			chan->desc = NULL;
 		vchan_cookie_complete(vd);
 	}
 
@@ -1205,7 +1301,9 @@ static int dma_chan_terminate_all(struct dma_chan *dchan)
 
 	vchan_get_all_descriptors(&chan->vc, &head);
 
+	chan->desc = NULL;
 	chan->cyclic = false;
+	chan->is_paused = false;
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
 
 	vchan_dma_desc_free_list(&chan->vc, &head);
-- 
2.43.0

