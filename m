Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9844D339394;
	Sat, 19 Sep 2026 22:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789856542; cv=none; b=hFKTDh4jwcdl/txTD+0qzYmRwbu9woXRVqeG2c+emBzZb1EnaSzdxAPqAk3cT4bEOlYJylHNri28RT/MeHKWIAvaPbz8XYJySCluxMkjIaMWzMozN2HUHkA2pFnpf2FTNunqRsNEmID4AiSwILraLtNXyiZNL8CdLZe92fj/cQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789856542; c=relaxed/simple;
	bh=sscp8pH68rDoIZPbwXUB2KO5d6e1qiH39/FvUx2OAy8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WB+nFWIRIhkfETqoPSXN6ElZptd5hvnMui/Be13TPZyysJnXqPCr9sUVXb+o+MoRqTt01+aj3hRUTS8lyy3KQKa0TgHZq3IwLBZ4Hg6tr21pzDYmx7zyNLtzI7K24bHVGBrRh7pLRnNgjXatl3YMkfbm5AtMrSHNhR4SjHDxO/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ndqX4xTd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ndqX4xTd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDC791F000FF;
	Sat, 19 Sep 2026 22:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789856541;
	bh=2PlgJzMW6+mQMgGe6XWkdwDSpDv6BT2bMU+ws/asq4g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ndqX4xTdbgmOeLn5s+kBbAZ3zFE5sIUE5mQMUGG32Jr1bjtXJf3MR5E0lkR+sA0XZ
	 I/e9VFUNikE8OksjG4O0OwN0z+26e972tBp8XL6kcRXN1DHkc/xyZ5G0WN9WYn5ZzI
	 NYXm4ljq9Hf3LNItHIOjiAZg1+EV0qSQ1y6t7LJKncfGzSv072EkiS0D3R7oF/vqMk
	 VFmK0wp8BT1NzmwQDyzrHcqWT/GnGMDoQaX5kzVEJTQmZfiYrRPO5XACP9Z5HGiHhx
	 Zj9GGD5CjRB+6Fpwki5eouhSlXb9VwKbVCdGRjhHzUnZ901rkmqzkLLFrS/YgF189Q
	 5t9DG/3+C855g==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 20 Sep 2026 00:22:13 +0200
Subject: [PATCH v4 02/23] dmaengine: ste_dma40: Fix cyclic transfer residue
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-dma40-fixes-v4-2-d751b2d9c23f@kernel.org>
References: <20260920-dma40-fixes-v4-0-d751b2d9c23f@kernel.org>
In-Reply-To: <20260920-dma40-fixes-v4-0-d751b2d9c23f@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, phone-devel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, Frank Li <Frank.li@oss.nxp.com>
X-Mailer: b4 0.14.3

DMA40 reads residue from the element count of the currently active LLI.
For a cyclic transfer this reports at most one period, not the bytes
remaining until the cyclic buffer wraps.

Once DMA40 advertises burst granularity, DMAengine PCM uses this residue
directly. For a four-period PCM buffer it consequently reports the
hardware pointer near three periods after every period interrupt. ALSA
eventually stops playback with -EIO although DMA period callbacks
continue.

Calculate cyclic residue from the current memory-side hardware pointer
instead. Read the destination pointer for capture and the source pointer
for playback. Sample the split logical channel pointer coherently and
retain the last valid residue during relink transitions.

This avoids counting terminal-count interrupts, which races with hardware
advancing to the next LLI and cannot account for coalesced interrupt
status. Also reject cyclic periods that expand into multiple LLIs because
logical cyclic LLIs each request a terminal-count interrupt and would
generate more than one callback per period.

Reject invalid cyclic geometries before dividing or constructing the
scatterlist as well.

Reported-by: Frank Li <Frank.li@oss.nxp.com>
Closes: https://lore.kernel.org/dmaengine/aq2wIPJW6viUxyy9@SMW015318/
Fixes: 15c606686541 ("dmaengine: ste_dma40: indicate granularity on channels")
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c | 104 +++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 99 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index e4d689c9eba8..c9983e600daf 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -378,6 +378,9 @@ struct d40_lli_pool {
  * @lli_len: Number of llis of current descriptor.
  * @lli_current: Number of transferred llis.
  * @lcla_alloc: Number of LCLA entries allocated.
+ * @cyclic_dma_addr: Start address of the cyclic buffer.
+ * @cyclic_buf_len: Length of the cyclic buffer.
+ * @cyclic_residue: Last valid cyclic residue sample.
  * @txd: DMA engine struct. Used for among other things for communication
  * during a transfer.
  * @node: List entry.
@@ -396,6 +399,9 @@ struct d40_desc {
 	int				 lli_len;
 	int				 lli_current;
 	int				 lcla_alloc;
+	dma_addr_t			 cyclic_dma_addr;
+	size_t				 cyclic_buf_len;
+	size_t				 cyclic_residue;
 
 	struct dma_async_tx_descriptor	 txd;
 	struct list_head		 node;
@@ -1420,6 +1426,64 @@ static u32 d40_residue(struct d40_chan *d40c)
 	return num_elt * d40c->dma_cfg.dst_info.data_width;
 }
 
+static bool d40_current_addr(struct d40_chan *d40c, dma_addr_t *addr)
+{
+	bool dst = d40c->dma_cfg.dir == DMA_DEV_TO_MEM;
+	void __iomem *high_reg;
+	void __iomem *low_reg;
+	u32 low;
+	u32 high;
+	u32 check;
+	int i;
+
+	if (chan_is_physical(d40c)) {
+		*addr = readl(chan_base(d40c) +
+			      (dst ? D40_CHAN_REG_SDPTR : D40_CHAN_REG_SSPTR));
+		return true;
+	}
+
+	if (dst) {
+		low_reg = &d40c->lcpa->lcsp2;
+		high_reg = &d40c->lcpa->lcsp3;
+	} else {
+		low_reg = &d40c->lcpa->lcsp0;
+		high_reg = &d40c->lcpa->lcsp1;
+	}
+
+	for (i = 0; i < 3; i++) {
+		high = readl(high_reg) & D40_MEM_LCSP1_SPTR_MASK;
+		low = readl(low_reg) & D40_MEM_LCSP0_SPTR_MASK;
+		check = readl(high_reg) & D40_MEM_LCSP1_SPTR_MASK;
+		if (high == check) {
+			*addr = low | high;
+			return true;
+		}
+	}
+
+	return false;
+}
+
+static bool d40_cyclic_offset(struct d40_chan *d40c, struct d40_desc *d40d,
+			      size_t *offset)
+{
+	dma_addr_t current_addr;
+	dma_addr_t current_offset;
+	int i;
+
+	for (i = 0; i < 3; i++) {
+		if (!d40_current_addr(d40c, &current_addr))
+			continue;
+
+		current_offset = current_addr - d40d->cyclic_dma_addr;
+		if (current_offset <= d40d->cyclic_buf_len) {
+			*offset = current_offset;
+			return true;
+		}
+	}
+
+	return false;
+}
+
 static bool d40_tx_is_linked(struct d40_chan *d40c)
 {
 	bool is_link;
@@ -1566,6 +1630,7 @@ static void dma_tc_handle(struct d40_chan *d40c)
 			if (d40d->lli_current == d40d->lli_len)
 				d40d->lli_current = 0;
 		}
+
 	} else {
 		d40_lcla_free_all(d40c, d40d);
 
@@ -2108,15 +2173,26 @@ static bool d40_is_paused(struct d40_chan *d40c)
 
 }
 
-static u32 stedma40_residue(struct dma_chan *chan)
+static u32 stedma40_residue(struct dma_chan *chan, dma_cookie_t cookie)
 {
 	struct d40_chan *d40c =
 		container_of(chan, struct d40_chan, chan);
+	struct d40_desc *d40d;
+	size_t offset;
 	u32 bytes_left;
 	unsigned long flags;
 
 	spin_lock_irqsave(&d40c->lock, flags);
-	bytes_left = d40_residue(d40c);
+	d40d = d40_first_active_get(d40c);
+	if (d40d && d40d->txd.cookie == cookie && d40d->cyclic &&
+	    d40d->cyclic_buf_len) {
+		if (d40_cyclic_offset(d40c, d40d, &offset))
+			d40d->cyclic_residue = d40d->cyclic_buf_len - offset;
+		bytes_left = d40d->cyclic_residue;
+	} else {
+		bytes_left = d40_residue(d40c);
+	}
+
 	spin_unlock_irqrestore(&d40c->lock, flags);
 
 	return bytes_left;
@@ -2246,8 +2322,13 @@ d40_prep_sg(struct dma_chan *dchan, struct scatterlist *sg_src,
 	if (desc == NULL)
 		goto unlock;
 
-	if (sg_next(&sg_src[sg_len - 1]) == sg_src)
+	if (sg_next(&sg_src[sg_len - 1]) == sg_src) {
 		desc->cyclic = true;
+		if (desc->lli_len != sg_len) {
+			chan_err(chan, "Cyclic periods must fit in one LLI\n");
+			goto free_desc;
+		}
+	}
 
 	src_dev_addr = 0;
 	dst_dev_addr = 0;
@@ -2524,11 +2605,18 @@ dma40_prep_dma_cyclic(struct dma_chan *chan, dma_addr_t dma_addr,
 		     size_t buf_len, size_t period_len,
 		     enum dma_transfer_direction direction, unsigned long flags)
 {
-	unsigned int periods = buf_len / period_len;
+	unsigned int periods;
 	struct dma_async_tx_descriptor *txd;
+	struct d40_desc *desc;
 	struct scatterlist *sg;
+	dma_addr_t buf_addr = dma_addr;
 	int i;
 
+	if (!buf_len || !period_len || buf_len % period_len)
+		return NULL;
+
+	periods = buf_len / period_len;
+
 	sg = kzalloc_objs(struct scatterlist, periods + 1, GFP_NOWAIT);
 	if (!sg)
 		return NULL;
@@ -2543,6 +2631,12 @@ dma40_prep_dma_cyclic(struct dma_chan *chan, dma_addr_t dma_addr,
 
 	txd = d40_prep_sg(chan, sg, sg, periods, direction,
 			  DMA_PREP_INTERRUPT);
+	if (txd) {
+		desc = container_of(txd, struct d40_desc, txd);
+		desc->cyclic_dma_addr = buf_addr;
+		desc->cyclic_buf_len = buf_len;
+		desc->cyclic_residue = buf_len;
+	}
 
 	kfree(sg);
 
@@ -2563,7 +2657,7 @@ static enum dma_status d40_tx_status(struct dma_chan *chan,
 
 	ret = dma_cookie_status(chan, cookie, txstate);
 	if (ret != DMA_COMPLETE && txstate)
-		dma_set_residue(txstate, stedma40_residue(chan));
+		dma_set_residue(txstate, stedma40_residue(chan, cookie));
 
 	if (d40_is_paused(d40c))
 		ret = DMA_PAUSED;

-- 
2.55.0

