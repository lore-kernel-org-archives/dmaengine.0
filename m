Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C10233A9C4;
	Mon, 28 Sep 2026 03:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790567519; cv=none; b=Dmd/HOVbWV0Df+6SGM1sMk5UB6wBQYtNRMZINA6Junl+i4z5SbTOkVvn1ysxFnY22zSWcVu2bZkUMVCYQ5uB2L6vFnyXApeqmW6bYkSFSdpypvGV2swdV+8DZ+VCsZjcjSYUsMzVp3SFFQILGEprDc7iGWhi7jAHSRYg6ui66ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790567519; c=relaxed/simple;
	bh=kYb3kPKkSbZWTxqjFW8qgh+r9RRFudg4sr7bT74KmbQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GP+z2s0e9j/B4ls0IUOIjEKLeAPLn5C88zlfceSXlvRcNefcauqPYNbCfzZuaXaO1pU8g/KfiwbJ+VPNyOOr34E1TsaIoVt0/JmrMYXJKhR7z+7sxB19rItPz2C2KLaGoUU/GklvWzzYZ2Leb6CFzJnLkPabAzeucif/21DGAzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=J3AvCi99; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="J3AvCi99"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=+F
	gUgsM2HcR/0JWsr/Cg30ZpADwWc52tWAEbH6deoT4=; b=J3AvCi99ZMQYJN+j6Q
	JjOUCTQh+Eem78u/NLBLg0mIjwLr/uh4JrxCvyKq45xrqZqH/hH6sutS45BPa5Nw
	ZL0yLr8MJa97n9iT+m9r9A+RYFcJwgbfbRVB47FhU5mK5/IUfAQyqSWrHSMusHwu
	ym9PLtV46vXhdOU/tFDn5TznE=
Received: from LUOBO-DINQG8T.hobot.cc (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgAXD8pJ5Llqv1WFBg--.19351S2;
	Mon, 28 Sep 2026 11:51:38 +0800 (CST)
From: Rui Wang <wr574332525@163.com>
To: vkoul@kernel.org,
	Eugeniy.Paltsev@synopsys.com
Cc: Frank.Li@kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rui Wang <wr574332525@163.com>
Subject: [PATCH v6] dmaengine: dw-axi-dmac: report paused state and residue in tx_status
Date: Mon, 28 Sep 2026 11:51:33 +0800
Message-ID: <20260928035133.2046-1-wr574332525@163.com>
X-Mailer: git-send-email 2.53.0.windows.2
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgAXD8pJ5Llqv1WFBg--.19351S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3ur43Kr45Wr1DAw47tw48Crg_yoWDWrW8pF
	W5G3yrKrWqgFnYvF43Gw4UJr1UZF45XFy29ryrJ3sxCF45Gr1Skrs3Ka4YqF1DCr929w1j
	vF4Yy343CF4UArJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piYFAdUUUUU=
X-CM-SenderInfo: lzuvlkittskjqv6rljoofrz/xtbC9QxV7Wq55EzYLAAA3O

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
at the end of the last block and the residue naturally reads as 0. The
pointer registers are pre-loaded with the first block's addresses when
the channel is programmed, so a stale pointer left by a previous
transfer (e.g. when its buffer is reused) can never be observed before
the first LLI fetch completes. Cyclic descriptors keep the
block-granular accounting.

Tested on an FPGA platform.

Signed-off-by: Rui Wang <wr574332525@163.com>
---
Changes in v6:
- Pre-load CH_SAR/CH_DAR with the first block's addresses when
  programming the channel, so a stale pointer from a previous transfer
  can never be observed before the first LLI fetch, even if its buffer
  is reused for the new one (discussed with Frank Li).
- Link to v5: https://lore.kernel.org/dmaengine/20260924025739.844-1-wr574332525@163.com/
Changes in v5 (thanks to Frank Li's review):
- Rewrite the tearing-safe register read as a do/while loop.
- Drop the "never report full completion while the channel is enabled"
  clamp: chan->desc matching already keeps never-started descriptors
  away from the stale pointer, and the residual stale-read window is
  bounded by the first LLI fetch after channel enable.
- Use min() instead of min_t().
- Link to v4: https://lore.kernel.org/dmaengine/20260923060045.5571-1-wr574332525@163.com/
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
 .../dma/dw-axi-dmac/dw-axi-dmac-platform.c    | 113 ++++++++++++++++--
 1 file changed, 105 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index eebed2474..0fa97b83b 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -352,33 +352,110 @@ static void vchan_desc_put(struct virt_dma_desc *vdesc)
 	axi_desc_put(vd_to_axi_desc(vdesc));
 }
 
+/*
+ * Read a 64-bit channel address register while the transfer may be
+ * running. The two 32-bit halves cannot be read atomically on all
+ * platforms, so sample the high half before and after the low half
+ * and retry if it moved (the low half wrapped in between).
+ */
+static u64 axi_chan_readq(struct axi_dma_chan *chan, u32 reg)
+{
+	u32 hi, lo, hi2;
+
+	do {
+		hi = readl(chan->chan_regs + reg + 4);
+		lo = readl(chan->chan_regs + reg);
+		hi2 = readl(chan->chan_regs + reg + 4);
+	} while (unlikely(hi != hi2));
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
+			 * chan->desc is the descriptor last programmed into
+			 * the hardware, so the pointer registers belong to
+			 * it; never match a queued-but-never-started
+			 * descriptor against the stale pointer left by a
+			 * previous transfer. If the transfer has just
+			 * finished but the interrupt has not reaped the
+			 * descriptor yet, the pointer sits at the end and
+			 * the residue reads 0.
+			 */
+			completed_length = axi_chan_get_xferred(chan, desc);
+		} else {
+			/* Still queued, nothing transferred yet */
+			completed_length = 0;
+		}
+
+		bytes = length - min(completed_length, length);
 	}
 
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
@@ -427,6 +504,7 @@ static void axi_chan_block_xfer_start(struct axi_dma_chan *chan,
 {
 	u32 priority = chan->chip->dw->hdata->priority[chan->id];
 	struct axi_dma_chan_config config = {};
+	struct axi_dma_lli *lli = first->hw_desc[0].lli;
 	u32 irq_mask;
 	u8 lms = 0; /* Select AXI0 master for LLI fetching */
 
@@ -468,6 +546,19 @@ static void axi_chan_block_xfer_start(struct axi_dma_chan *chan,
 	}
 	axi_chan_config_write(chan, &config);
 
+	/*
+	 * Pre-load the pointer registers with the first block's addresses.
+	 * The hardware reloads them with the same values once it fetches
+	 * the first LLI; in between, a reader observes the start of the
+	 * first block instead of a stale pointer left by a previous
+	 * transfer (which may alias the new one if the buffer is reused).
+	 */
+	axi_chan_iowrite64(chan, CH_SAR, le64_to_cpu(lli->sar));
+	axi_chan_iowrite64(chan, CH_DAR, le64_to_cpu(lli->dar));
+
+	/* The hardware pointer registers now belong to this descriptor */
+	chan->desc = first;
+
 	write_chan_llp(chan, first->hw_desc[0].llp | lms);
 
 	irq_mask = DWAXIDMAC_IRQ_DMA_TRF | DWAXIDMAC_IRQ_ALL_ERR;
@@ -1077,6 +1168,8 @@ static noinline void axi_chan_handle_err(struct axi_dma_chan *chan, u32 status)
 	}
 	/* Remove the completed descriptor from issued list */
 	list_del(&vd->node);
+	if (chan->desc == vd_to_axi_desc(vd))
+		chan->desc = NULL;
 
 	/* WARN about bad descriptor */
 	dev_err(chan2dev(chan),
@@ -1140,6 +1233,8 @@ static void axi_chan_block_xfer_complete(struct axi_dma_chan *chan)
 	} else {
 		/* Remove the completed descriptor from issued list before completing */
 		list_del(&vd->node);
+		if (chan->desc == vd_to_axi_desc(vd))
+			chan->desc = NULL;
 		vchan_cookie_complete(vd);
 	}
 
@@ -1205,7 +1300,9 @@ static int dma_chan_terminate_all(struct dma_chan *dchan)
 
 	vchan_get_all_descriptors(&chan->vc, &head);
 
+	chan->desc = NULL;
 	chan->cyclic = false;
+	chan->is_paused = false;
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
 
 	vchan_dma_desc_free_list(&chan->vc, &head);
-- 
2.43.0

