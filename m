Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34511339394;
	Sat, 19 Sep 2026 22:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789856544; cv=none; b=jJ+Uv6kb+I+RdSqp5eT+og1PEPc73xP7MU1IQ66+VsOJCaDgZOZW2DeD5fJTfwW9Pz+IRaK+PEOPiA0fTbgRYSg6IVQKAiiUkA8x5t0FSbmQzikNZ6/gqXUj5aFL0IjZ2ZfLTvEqxEdFYNWR0O3swOJbgEz7Cn8baShu8Fb1meE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789856544; c=relaxed/simple;
	bh=9HZ8Xyfhk9RyLyhFTkRxYQFc/kCMWGJifd6oFhB/juw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hKp9ci060TVdIfoIna2i3MmO7P8EPRHcWudJ4ZPXoqvxF6QC/GtQ4rqO8g4Er0zLOCzhFQU4QjZP7IOOQ/H4l/BFDJBWPkv2ukCoinYynpvbFdYOBVtKR+3FL568RMPnhGYg/R/LcJhVz1WfhqMc/Nu4VbVaNDPx7ujtImLBrpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bLjDhSxB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bLjDhSxB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA4661F00893;
	Sat, 19 Sep 2026 22:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789856542;
	bh=Or8voGk/fg2Rh9DvqI926tz1yb8jN5F6vh7sL/4wRUI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=bLjDhSxBnHAhH9G9xhpavnTSYcYRcxi1k9YpjJdz1UqV8Qe6TSsoPVd2xv8LQYWje
	 bsip1R/pgYy3TvOGIV9RjJ3uJuSq6r8I+Kk9D+qgdIAhnhCTTkC5+XrHwJU3s/Gx1j
	 pKHEPIwelXJoqRXuNj2j9bz3+n6JkDyKnRFue+MymLlpeLxwkRpXo0gCM0bLcwulP2
	 l8Y418UVyHQxipEHGo2BBPPhaKu+Gu8LccSsWqvXoK2eMVEdOgHnl/seaLQT250hZz
	 ovbovAtLCgv9QR2Sup23CQ7k5mIrWqKujLwQ6FbiAB4Foq/f3X9TAjkEfDiSoeHSg1
	 7kq6qjL8//jUg==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 20 Sep 2026 00:22:14 +0200
Subject: [PATCH v4 03/23] dmaengine: ste_dma40: Recover coalesced cyclic
 callbacks
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-dma40-fixes-v4-3-d751b2d9c23f@kernel.org>
References: <20260920-dma40-fixes-v4-0-d751b2d9c23f@kernel.org>
In-Reply-To: <20260920-dma40-fixes-v4-0-d751b2d9c23f@kernel.org>
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
so the tasklet invokes one callback for each of them. Fall back to one
callback when the pointer cannot be sampled.

If the pointer has returned to the same period boundary, account for one
complete buffer lap. The hardware has no counter that could distinguish
multiple complete laps, but recovering one lap avoids silently losing all
callbacks represented by the observed terminal-count interrupt.

The preceding cyclic-residue fix ensures that every cyclic period fits in
one LLI, so each boundary corresponds to one client callback.

Fixes: 0c842b551063 ("dma40: cyclic xfer support")
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c | 44 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 43 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index c9983e600daf..b992471e05f2 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -381,6 +381,8 @@ struct d40_lli_pool {
  * @cyclic_dma_addr: Start address of the cyclic buffer.
  * @cyclic_buf_len: Length of the cyclic buffer.
  * @cyclic_residue: Last valid cyclic residue sample.
+ * @cyclic_period_len: Length of one cyclic period.
+ * @cyclic_callback_pos: Position after the callbacks already queued.
  * @txd: DMA engine struct. Used for among other things for communication
  * during a transfer.
  * @node: List entry.
@@ -402,6 +404,8 @@ struct d40_desc {
 	dma_addr_t			 cyclic_dma_addr;
 	size_t				 cyclic_buf_len;
 	size_t				 cyclic_residue;
+	size_t				 cyclic_period_len;
+	size_t				 cyclic_callback_pos;
 
 	struct dma_async_tx_descriptor	 txd;
 	struct list_head		 node;
@@ -1484,6 +1488,40 @@ static bool d40_cyclic_offset(struct d40_chan *d40c, struct d40_desc *d40d,
 	return false;
 }
 
+static unsigned int d40_cyclic_periods_elapsed(struct d40_chan *d40c,
+					       struct d40_desc *d40d)
+{
+	size_t current_pos;
+	size_t offset;
+	unsigned int periods;
+
+	if (!d40d->cyclic_period_len ||
+	    !d40_cyclic_offset(d40c, d40d, &offset))
+		return 1;
+
+	current_pos = rounddown(offset, d40d->cyclic_period_len);
+	if (!d40_residue(d40c) && current_pos != offset)
+		current_pos += d40d->cyclic_period_len;
+	if (current_pos == d40d->cyclic_buf_len)
+		current_pos = 0;
+
+	if (current_pos > d40d->cyclic_callback_pos) {
+		periods = (current_pos - d40d->cyclic_callback_pos) /
+			d40d->cyclic_period_len;
+	} else if (current_pos < d40d->cyclic_callback_pos) {
+		periods = (d40d->cyclic_buf_len -
+			d40d->cyclic_callback_pos + current_pos) /
+			d40d->cyclic_period_len;
+	} else {
+		/* At least one interrupt occurred, so assume one buffer lap. */
+		periods = d40d->cyclic_buf_len / d40d->cyclic_period_len;
+	}
+
+	d40d->cyclic_callback_pos = current_pos;
+
+	return periods;
+}
+
 static bool d40_tx_is_linked(struct d40_chan *d40c)
 {
 	bool is_link;
@@ -1606,6 +1644,7 @@ static struct d40_desc *d40_queue_start(struct d40_chan *d40c)
 static void dma_tc_handle(struct d40_chan *d40c)
 {
 	struct d40_desc *d40d;
+	unsigned int callbacks = 1;
 
 	/* Get first active entry from list */
 	d40d = d40_first_active_get(d40c);
@@ -1631,6 +1670,7 @@ static void dma_tc_handle(struct d40_chan *d40c)
 				d40d->lli_current = 0;
 		}
 
+		callbacks = d40_cyclic_periods_elapsed(d40c, d40d);
 	} else {
 		d40_lcla_free_all(d40c, d40d);
 
@@ -1651,7 +1691,7 @@ static void dma_tc_handle(struct d40_chan *d40c)
 		d40_desc_done(d40c, d40d);
 	}
 
-	d40c->pending_tx++;
+	d40c->pending_tx += callbacks;
 	tasklet_schedule(&d40c->tasklet);
 
 }
@@ -2636,6 +2676,8 @@ dma40_prep_dma_cyclic(struct dma_chan *chan, dma_addr_t dma_addr,
 		desc->cyclic_dma_addr = buf_addr;
 		desc->cyclic_buf_len = buf_len;
 		desc->cyclic_residue = buf_len;
+		desc->cyclic_period_len = period_len;
+		desc->cyclic_callback_pos = 0;
 	}
 
 	kfree(sg);

-- 
2.55.0

