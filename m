Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FEB23D2A1;
	Wed, 23 Sep 2026 04:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790138495; cv=none; b=CMPNr+IaxM3ymO7U/34XLMrN9nHbKb65F9ioADGhTGFw1UxBbBsZuYO+FmqOLJ6vepzNyvoOYxZiUAmmPSvgfp0qH1pkPfTck1kZ9Rnwrdaw391eEFWJQ5Zhas3ugn8zElSzL8F/EfLlI2sZy0T++qxvUHGkyC5AdgYjQJfmHPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790138495; c=relaxed/simple;
	bh=2g8DpJUpH8PlrjKZXif8Lq7wdVqgWNsDSnDRhW5C1wE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d+EsTOI4CZnnubWhBl4AKsW46QdzXkVNLifTpQsO05wUn8MjVgP8nKqFScudsuIhEOOuJXZiN+5HCUu32VwTveOylXB6ZfGyu7NfVNzM4XkB3E4ILvBkLLgVMaEJA+CvaLffzu7VNwwL4GIR98Ozv3iBFI9d6IKVESjmih6Z5i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=fAm3VdMV; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="fAm3VdMV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=PH
	YHhH3fbkvl/BtctNyr8DOuwciATd1JnB35eSqWrtU=; b=fAm3VdMVFRtXWfOIKa
	XfMnDFVfmlPweTdPrv9rdlawIfDzq8fG4b8ehsK0MZRimPiQBO5DaO+nEKPxUzzq
	1M19MFjpxyzEcLTOCT/ZqEIdn9T4cQl7q2NUQ2/coqgcbR0aJZryjT2n/V0ELuF/
	OqAsmHaXWn9nnkltNrG3IxFTE=
Received: from LUOBO-DINQG8T.hobot.cc (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wDnb0xjWLNqBjINAQ--.56838S2;
	Wed, 23 Sep 2026 12:41:09 +0800 (CST)
From: Rui Wang <wr574332525@163.com>
To: vkoul@kernel.org,
	Eugeniy.Paltsev@synopsys.com
Cc: Frank.Li@kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rui Wang <wr574332525@163.com>
Subject: [PATCH v3] dmaengine: dw-axi-dmac: report paused state and residue in tx_status
Date: Wed, 23 Sep 2026 12:41:04 +0800
Message-ID: <20260923044104.3234-1-wr574332525@163.com>
X-Mailer: git-send-email 2.53.0.windows.2
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnb0xjWLNqBjINAQ--.56838S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxtr1rJr1kZr4DWw45Xw4kCrg_yoWxtw4rpa
	y5G3yrGr4DWF9avF4UGw4UJr15ZF4rXFW7CrWrG3sIka1UX3sakF4fKa4YqF1DArn29342
	9F4YyFy3Ga1UArJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pi8uctUUUUU=
X-CM-SenderInfo: lzuvlkittskjqv6rljoofrz/xtbC9Qe2T2qzWGeuGwAA3Y

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
concurrently. When the transfer has just completed but the descriptor
has not been reaped yet, the pointer sits at the end of the last block
and the residue naturally reads as 0; conversely, a channel whose
enable bit is still set never reports full completion, so a stale
pointer left by a previous transfer reusing the same buffer cannot be
mistaken for a finished one. Queued descriptors keep reporting their
full length and cyclic descriptors keep the block-granular accounting.

Tested on an FPGA platform.

Signed-off-by: Rui Wang <wr574332525@163.com>
---
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
 .../dma/dw-axi-dmac/dw-axi-dmac-platform.c    | 104 ++++++++++++++++--
 1 file changed, 96 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index eebed2474..5653a5712 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -352,33 +352,120 @@ static void vchan_desc_put(struct virt_dma_desc *vdesc)
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
+		} else if (vdesc == vchan_next_desc(&chan->vc)) {
+			/*
+			 * The descriptor is on the hardware: read the progress
+			 * from its pointer. If the transfer has just finished
+			 * but the interrupt has not reaped the descriptor yet,
+			 * the pointer sits at the end and the residue reads 0.
+			 *
+			 * The hardware clears the channel enable bit when the
+			 * transfer completes, so a still-enabled channel cannot
+			 * be done: right after the start its pointer may still
+			 * hold the value of a previous transfer, which aliases
+			 * the end of the new one when the buffer is reused.
+			 * Never report full completion while the channel runs.
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
@@ -1206,6 +1293,7 @@ static int dma_chan_terminate_all(struct dma_chan *dchan)
 	vchan_get_all_descriptors(&chan->vc, &head);
 
 	chan->cyclic = false;
+	chan->is_paused = false;
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
 
 	vchan_dma_desc_free_list(&chan->vc, &head);
-- 
2.43.0

