Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7393D3D11;
	Sun, 20 Sep 2026 18:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789930789; cv=none; b=pJ1EVKSVmiDFiYcsX79y67h9akEqHF92ScZsqGoIGz4nHXrEh2BekOi2vCU9Rv8mMQj/rcLxGyLwKXdZqf0jDMqCg8/VlWF+Wnkq4fd8WFpZ+yLGFuv+Af8NRqDXZsxoTtDW3ufJ5mEhlOJJL0+LAcFbdHw6CM2/8b5TyEjfR30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789930789; c=relaxed/simple;
	bh=r3BHxJxy/AwEvpMLth2EcGn/oojmTTZVC1oYbQCkgfo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CHdq6vJQu5+2xvgzk68yr5f5OPWKRRRqnuZIHtM+nnvoT0C7C4E7TMwwyLRJhq8EXvKf4EZZLBSh+5M8qEdGf81dTXiulCZPFnwjKiF2/7J3capLKt33cJdxxPoPZxY5DnX4Uyzcgv4jRxHvcL95WMiLzANrkRABC4ODJ9oqHRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NBzMJKRP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NBzMJKRP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73F341F00893;
	Sun, 20 Sep 2026 18:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789930787;
	bh=Zy+1+UoMc/P0Xjcx9QlBCN5I45cYnx166YBe42hygvc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=NBzMJKRP/cn+9gWFZU+jpRb+Tyv1AjBTpJTTDV3myx70d6iMXz6gqmTVunD3QrZiA
	 u5l366i8ui0RYuk9xGhDPal4wx9mAtu/hM4w+vG6Nl3w1dMVpDLugN8Qd0YrcgjCAc
	 r0O5JSc5Rn3RPMUTbG+6UvlKj+hCcTFJ5eZRiumz/okhFOwSYB07x/FVeyDqmQh0DF
	 me1MzxSeAxfrPA/XS4JkoHazETN45+FvtISTjEjU/hjMvqn6WhVJByV5Lh6fKpN5+S
	 cwcyaOcFIwxg07qJZyvQkMnuMT5HOy13uEBjkiFmPw4W6RT7Tzfah1JD3b4ncpiz9w
	 6lzwpLt+u5zLQ==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 20 Sep 2026 20:59:38 +0200
Subject: [PATCH v5 03/23] dmaengine: ste_dma40: Recover coalesced cyclic
 callbacks
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-dma40-fixes-v5-3-5c55cd7f92f9@kernel.org>
References: <20260920-dma40-fixes-v5-0-5c55cd7f92f9@kernel.org>
In-Reply-To: <20260920-dma40-fixes-v5-0-5c55cd7f92f9@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, phone-devel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

DMA40 exposes one terminal-count status bit per channel. If more than one
cyclic period completes before the interrupt handler clears the bit, the
events coalesce and the driver schedules only one callback. Short audio
periods can consequently lose period notifications.

Use the current memory-side pointer to find the period boundary reached
since callbacks were last queued. Add every elapsed period to pending_tx
so the tasklet invokes one callback for each of them.

If the pointer cannot be sampled, report one callback and mark the callback
position invalid. At the next successful sample, resynchronize instead of
deriving a count from stale state. Any additional periods coalesced while
the pointer is unavailable cannot be recovered reliably.

DMA40 exposes one latched terminal-count status bit, not an event counter.
If the pointer remains at the same boundary, hardware cannot distinguish a
repeated status from an exact full-buffer lap. In this ambiguous case,
report one callback rather than potentially enqueueing a whole buffer of
spurious callbacks. Exact full laps, including multiple laps, therefore
cannot be recovered by software.

The preceding cyclic-residue fix ensures that every cyclic period fits in
one LLI, so each boundary corresponds to one client callback.

Fixes: 0c842b551063 ("dma40: cyclic xfer support")
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c | 62 ++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 61 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index c9983e600daf..1f9e8c7249b1 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -381,11 +381,14 @@ struct d40_lli_pool {
  * @cyclic_dma_addr: Start address of the cyclic buffer.
  * @cyclic_buf_len: Length of the cyclic buffer.
  * @cyclic_residue: Last valid cyclic residue sample.
+ * @cyclic_period_len: Length of one cyclic period.
+ * @cyclic_callback_pos: Position after the callbacks already queued.
  * @txd: DMA engine struct. Used for among other things for communication
  * during a transfer.
  * @node: List entry.
  * @is_in_client_list: true if the client owns this descriptor.
  * @cyclic: true if this is a cyclic job
+ * @cyclic_callback_pos_valid: Whether cyclic_callback_pos is reliable.
  *
  * This descriptor is used for both logical and physical transfers.
  */
@@ -402,12 +405,15 @@ struct d40_desc {
 	dma_addr_t			 cyclic_dma_addr;
 	size_t				 cyclic_buf_len;
 	size_t				 cyclic_residue;
+	size_t				 cyclic_period_len;
+	size_t				 cyclic_callback_pos;
 
 	struct dma_async_tx_descriptor	 txd;
 	struct list_head		 node;
 
 	bool				 is_in_client_list;
 	bool				 cyclic;
+	bool				 cyclic_callback_pos_valid;
 };
 
 /**
@@ -1484,6 +1490,55 @@ static bool d40_cyclic_offset(struct d40_chan *d40c, struct d40_desc *d40d,
 	return false;
 }
 
+static unsigned int d40_cyclic_periods_elapsed(struct d40_chan *d40c,
+					       struct d40_desc *d40d)
+{
+	size_t current_pos;
+	size_t offset;
+	unsigned int periods;
+
+	if (!d40d->cyclic_period_len)
+		return 1;
+
+	if (!d40_cyclic_offset(d40c, d40d, &offset)) {
+		d40d->cyclic_callback_pos_valid = false;
+		return 1;
+	}
+
+	current_pos = rounddown(offset, d40d->cyclic_period_len);
+	if (!d40_residue(d40c) && current_pos != offset)
+		current_pos += d40d->cyclic_period_len;
+	if (current_pos == d40d->cyclic_buf_len)
+		current_pos = 0;
+
+	if (!d40d->cyclic_callback_pos_valid) {
+		/*
+		 * One callback was reported without a reliable pointer.
+		 * Resynchronize instead of deriving periods from stale state.
+		 */
+		periods = 1;
+	} else if (current_pos > d40d->cyclic_callback_pos) {
+		periods = (current_pos - d40d->cyclic_callback_pos) /
+			d40d->cyclic_period_len;
+	} else if (current_pos < d40d->cyclic_callback_pos) {
+		periods = (d40d->cyclic_buf_len -
+			d40d->cyclic_callback_pos + current_pos) /
+			d40d->cyclic_period_len;
+	} else {
+		/*
+		 * The TC status is a single latched bit. An unchanged pointer
+		 * cannot distinguish a complete lap from a repeated interrupt,
+		 * so do not amplify it into a buffer's worth of callbacks.
+		 */
+		periods = 1;
+	}
+
+	d40d->cyclic_callback_pos = current_pos;
+	d40d->cyclic_callback_pos_valid = true;
+
+	return periods;
+}
+
 static bool d40_tx_is_linked(struct d40_chan *d40c)
 {
 	bool is_link;
@@ -1606,6 +1661,7 @@ static struct d40_desc *d40_queue_start(struct d40_chan *d40c)
 static void dma_tc_handle(struct d40_chan *d40c)
 {
 	struct d40_desc *d40d;
+	unsigned int callbacks = 1;
 
 	/* Get first active entry from list */
 	d40d = d40_first_active_get(d40c);
@@ -1631,6 +1687,7 @@ static void dma_tc_handle(struct d40_chan *d40c)
 				d40d->lli_current = 0;
 		}
 
+		callbacks = d40_cyclic_periods_elapsed(d40c, d40d);
 	} else {
 		d40_lcla_free_all(d40c, d40d);
 
@@ -1651,7 +1708,7 @@ static void dma_tc_handle(struct d40_chan *d40c)
 		d40_desc_done(d40c, d40d);
 	}
 
-	d40c->pending_tx++;
+	d40c->pending_tx += callbacks;
 	tasklet_schedule(&d40c->tasklet);
 
 }
@@ -2636,6 +2693,9 @@ dma40_prep_dma_cyclic(struct dma_chan *chan, dma_addr_t dma_addr,
 		desc->cyclic_dma_addr = buf_addr;
 		desc->cyclic_buf_len = buf_len;
 		desc->cyclic_residue = buf_len;
+		desc->cyclic_period_len = period_len;
+		desc->cyclic_callback_pos = 0;
+		desc->cyclic_callback_pos_valid = true;
 	}
 
 	kfree(sg);

-- 
2.55.0

