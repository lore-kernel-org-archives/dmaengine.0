Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49BC5513548;
	Fri, 18 Sep 2026 16:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789748674; cv=none; b=J5YEVa375Uegz+ka4pCA+Y5gtbDYXuZklsdA1538Plqy4mAqkKFXiD4a4tq7m5m1RHsajpf5eZJR4cYOzW8Hc9RMmF7la2eNlMIf0IEJq8PkSPk9Lp/ZBUBbKZeJ+GwFQqhXo9/af5OQHkcv2GSV302wc6W5sdFc5t2p4AidsdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789748674; c=relaxed/simple;
	bh=Kwkvj2ousD8qn+ymBJsAsKdK1umfemK+ItffdgVFnaQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d36B2In/nc9yTlgN+h00BESIK8QSAizFowZr/3FtTR6Mqo+ZOEs+8xL4hBnL5QQmgek8amg3hwmQTsqgtWwmOqiPbWOFFUOYmBbp+ymDxNwBmfMOvoY6dtIb36BwnZxG0HWsjlC2INZHfgT25mKrtDJWYXAhddLqk2SXpmIVkrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XvojYiW+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XvojYiW+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7562C1F00899;
	Fri, 18 Sep 2026 16:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789748671;
	bh=msX7jkmGwnlpNJA4TVGZRKM+HKzmfYoS5NTzfkkgsVM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=XvojYiW+rhPe0RXktdoz4vMlECZpRH7wDW2F+HU1nzUIN/f390XhZ0lSxL+Z7Vv9t
	 Z66ETFP1usE4QCgVXer0yuMjqvpxW9iv1Lq+FkxbxRudUzwm+yzC2m86YznV/Wo7oF
	 ILT+rQyID5CZ+O0fXcA/2WfkpzOtdSRb+BJ9H5val0cGV3ZI3eGS3yRMkVLKdinLZG
	 8fIrdN6UIWJXeGB8JTE9xeJ/Su5JI0Kcrie9jR8VLG/wPUIO3Xfi19/HiCnk8JGnDv
	 wfEmNtCz/7BVBvEm59NG33rKwkWfKORERbah92CluT/Y4Ua1xPmuoqqa57DwNI+9oN
	 +3lFt0kBeFriQ==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 18 Sep 2026 18:24:21 +0200
Subject: [PATCH v3 02/22] dmaengine: ste_dma40: Fix cyclic transfer residue
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-dma40-fixes-v3-2-8dd8450669e8@kernel.org>
References: <20260918-dma40-fixes-v3-0-8dd8450669e8@kernel.org>
In-Reply-To: <20260918-dma40-fixes-v3-0-8dd8450669e8@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, phone-devel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

DMA40 reads residue from the element count of the currently active LLI.
For a cyclic transfer this reports at most one period, not the bytes
remaining until the cyclic buffer wraps.

Once DMA40 advertises burst granularity, DMAengine PCM uses this residue
directly. For a four-period PCM buffer it consequently reports the
hardware pointer near three periods after every period interrupt. ALSA
eventually stops playback with -EIO although DMA period callbacks
continue.

Track the active period of cyclic descriptors and add all later periods
in the buffer to the current LLI residue. Update the active period in the
terminal-count interrupt before scheduling its callback so residue also
stays coherent around period boundaries.

Also reject invalid cyclic geometries before dividing or constructing
the scatterlist.

Fixes: 15c606686541 ("dmaengine: ste_dma40: indicate granularity on channels")
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c | 42 +++++++++++++++++++++++++++++++++++++++---
 1 file changed, 39 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index e4d689c9eba8..49e9139e0ad0 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -378,6 +378,9 @@ struct d40_lli_pool {
  * @lli_len: Number of llis of current descriptor.
  * @lli_current: Number of transferred llis.
  * @lcla_alloc: Number of LCLA entries allocated.
+ * @cyclic_buf_len: Length of the cyclic buffer.
+ * @cyclic_period_len: Length of one cyclic period.
+ * @cyclic_pos: Start of the current cyclic period in the buffer.
  * @txd: DMA engine struct. Used for among other things for communication
  * during a transfer.
  * @node: List entry.
@@ -396,6 +399,9 @@ struct d40_desc {
 	int				 lli_len;
 	int				 lli_current;
 	int				 lcla_alloc;
+	size_t				 cyclic_buf_len;
+	size_t				 cyclic_period_len;
+	size_t				 cyclic_pos;
 
 	struct dma_async_tx_descriptor	 txd;
 	struct list_head		 node;
@@ -1566,6 +1572,12 @@ static void dma_tc_handle(struct d40_chan *d40c)
 			if (d40d->lli_current == d40d->lli_len)
 				d40d->lli_current = 0;
 		}
+
+		if (d40d->cyclic_period_len) {
+			d40d->cyclic_pos += d40d->cyclic_period_len;
+			if (d40d->cyclic_pos >= d40d->cyclic_buf_len)
+				d40d->cyclic_pos = 0;
+		}
 	} else {
 		d40_lcla_free_all(d40c, d40d);
 
@@ -2108,15 +2120,27 @@ static bool d40_is_paused(struct d40_chan *d40c)
 
 }
 
-static u32 stedma40_residue(struct dma_chan *chan)
+static u32 stedma40_residue(struct dma_chan *chan, dma_cookie_t cookie)
 {
 	struct d40_chan *d40c =
 		container_of(chan, struct d40_chan, chan);
+	struct d40_desc *d40d;
 	u32 bytes_left;
 	unsigned long flags;
 
 	spin_lock_irqsave(&d40c->lock, flags);
 	bytes_left = d40_residue(d40c);
+
+	d40d = d40_first_active_get(d40c);
+	/*
+	 * The hardware residue is for the current LLI. Cyclic transfers use
+	 * one LLI for each period, so include the later periods in the buffer.
+	 */
+	if (d40d && d40d->txd.cookie == cookie && d40d->cyclic &&
+	    d40d->cyclic_period_len)
+		bytes_left += d40d->cyclic_buf_len - d40d->cyclic_pos -
+			      d40d->cyclic_period_len;
+
 	spin_unlock_irqrestore(&d40c->lock, flags);
 
 	return bytes_left;
@@ -2524,11 +2548,17 @@ dma40_prep_dma_cyclic(struct dma_chan *chan, dma_addr_t dma_addr,
 		     size_t buf_len, size_t period_len,
 		     enum dma_transfer_direction direction, unsigned long flags)
 {
-	unsigned int periods = buf_len / period_len;
+	unsigned int periods;
 	struct dma_async_tx_descriptor *txd;
+	struct d40_desc *desc;
 	struct scatterlist *sg;
 	int i;
 
+	if (!buf_len || !period_len || buf_len % period_len)
+		return NULL;
+
+	periods = buf_len / period_len;
+
 	sg = kzalloc_objs(struct scatterlist, periods + 1, GFP_NOWAIT);
 	if (!sg)
 		return NULL;
@@ -2543,6 +2573,12 @@ dma40_prep_dma_cyclic(struct dma_chan *chan, dma_addr_t dma_addr,
 
 	txd = d40_prep_sg(chan, sg, sg, periods, direction,
 			  DMA_PREP_INTERRUPT);
+	if (txd) {
+		desc = container_of(txd, struct d40_desc, txd);
+		desc->cyclic_buf_len = buf_len;
+		desc->cyclic_period_len = period_len;
+		desc->cyclic_pos = 0;
+	}
 
 	kfree(sg);
 
@@ -2563,7 +2599,7 @@ static enum dma_status d40_tx_status(struct dma_chan *chan,
 
 	ret = dma_cookie_status(chan, cookie, txstate);
 	if (ret != DMA_COMPLETE && txstate)
-		dma_set_residue(txstate, stedma40_residue(chan));
+		dma_set_residue(txstate, stedma40_residue(chan, cookie));
 
 	if (d40_is_paused(d40c))
 		ret = DMA_PAUSED;

-- 
2.55.0

