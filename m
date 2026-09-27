Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6820639A7EF;
	Sun, 27 Sep 2026 09:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790499809; cv=none; b=tO+LX8Zb+qi76x9mC53qtYrF4gWb4rN45PHFwdJhDSpK7RrFCJ4jRI4IyHUl9MGL9q4TRUyLTuMideXMRREhVAfX0Oap4dj2AceEQUzrNGGsl172Fq3mzgz1sm+FdDaDo+/200YjZiKLlacOyrmnTSHMTEy22GV6F5LW6gTo1Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790499809; c=relaxed/simple;
	bh=QsoJrqA/8VIvFYIcsJ9+y1orLIj4YicgEw4t6h+9sO8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lyfx7LAMpagsbrTFYj4gpUHCvIdtDN3dhG6nDkhghGada6dCU0UgpSF93O4FxyEtDiyZp09g08B4nquS+GSM0GpQO6vR9qsiS9S6usO8ii79ywWoiThYdhN9BS3lU0A7MyXfxiT496mLXiY20LX/mgSppCoj3Wn+aQ15h5my/Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kbO6ygE1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kbO6ygE1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC6D71F00899;
	Sun, 27 Sep 2026 09:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790499808;
	bh=p+DrErmvDmpgOIvKidfL92gKwhQnyJiffd6QIm14RYg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=kbO6ygE1NRqXMFetDtXqKHY6C2YqC9K0KGsxPp/QV8FoO3Zj8ze/fLYaCk8XczOit
	 A8XfdlqbAnzSgxVJKOXUIj8vUtq/xis1IOM8TB669N5U4Kl2/9rqk8xMoJmBQMFN8S
	 UZYAKxtYe6otgeFdwJwY9P+TCdOn/yTBbYYVuVj4pwW2jml2Cc4sVNOMMsD7uzM8Sd
	 XkH7NU8jYLClnpW17Ha+AP5AXXkeZZWQYwH2R/pCsDeaaL8BpQR2bKGs4a8qv6GzNQ
	 29dA4zn4R63W/7UwMR4hC+pHs27gGtTRm1nvOD4FcjScmWcUIl3XAV/zWvINAluUTx
	 wfLXLUblDNN5w==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 27 Sep 2026 11:03:16 +0200
Subject: [PATCH v7 03/24] dmaengine: ste_dma40: Recover coalesced cyclic
 callbacks
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260927-dma40-fixes-v7-3-89f595e8851d@kernel.org>
References: <20260927-dma40-fixes-v7-0-89f595e8851d@kernel.org>
In-Reply-To: <20260927-dma40-fixes-v7-0-89f595e8851d@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, phone-devel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

DMA40 has one terminal-count status bit per channel, so cyclic period
interrupts can coalesce.

Use the memory-side pointer displacement to queue the minimum observable
number of callbacks. If sampling fails, queue one callback and invalidate
the saved position; the next successful sample resynchronizes without
recounting it.

The pointer is modulo the cyclic buffer: a displacement of d periods can
mean d plus n complete iterations of the buffer. Report d, so the driver
could have missed n iterations of the buffer; DMA40 has no counter to
recover them. For an unchanged pointer, report one callback rather than
risk a spurious full-buffer burst.

This condition has not been seen in practice and is only a product of
review comments that the buffer can miss interrupts.

The preceding cyclic-residue fix ensures that every cyclic period fits in
one LLI, so each boundary corresponds to one client callback.

Fixes: 0c842b551063 ("dma40: cyclic xfer support")
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c | 69 ++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 68 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index eab9c09b4bfe..4b138aa313c8 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -384,11 +384,14 @@ struct d40_lli_pool {
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
@@ -405,12 +408,15 @@ struct d40_desc {
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
@@ -1487,6 +1493,61 @@ static bool d40_cyclic_offset(struct d40_chan *d40c, struct d40_desc *d40d,
 	return false;
 }
 
+static unsigned int d40_cyclic_periods_elapsed(struct d40_chan *d40c,
+					       struct d40_desc *d40d)
+{
+	size_t current_pos;
+	size_t delta;
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
+		 * The previous interrupt was reported without a pointer
+		 * sample. Resynchronize without using the stale position,
+		 * which would count that callback again.
+		 */
+		d40d->cyclic_callback_pos = current_pos;
+		d40d->cyclic_callback_pos_valid = true;
+		return 1;
+	}
+
+	/*
+	 * The pointer wraps with the cyclic buffer, so its displacement is
+	 * only the minimum number of elapsed periods. Complete buffer laps
+	 * are not observable.
+	 */
+	delta = (current_pos + d40d->cyclic_buf_len -
+		 d40d->cyclic_callback_pos) % d40d->cyclic_buf_len;
+	periods = delta / d40d->cyclic_period_len;
+	if (!periods) {
+		/*
+		 * The TC status is a single latched bit. An unchanged pointer
+		 * cannot distinguish a complete lap from a repeated interrupt,
+		 * so do not amplify it into a buffer's worth of callbacks.
+		 */
+		periods = 1;
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
@@ -1609,6 +1670,7 @@ static struct d40_desc *d40_queue_start(struct d40_chan *d40c)
 static void dma_tc_handle(struct d40_chan *d40c)
 {
 	struct d40_desc *d40d;
+	unsigned int callbacks = 1;
 
 	/* Get first active entry from list */
 	d40d = d40_first_active_get(d40c);
@@ -1633,6 +1695,8 @@ static void dma_tc_handle(struct d40_chan *d40c)
 			if (d40d->lli_current == d40d->lli_len)
 				d40d->lli_current = 0;
 		}
+
+		callbacks = d40_cyclic_periods_elapsed(d40c, d40d);
 	} else {
 		d40_lcla_free_all(d40c, d40d);
 
@@ -1653,7 +1717,7 @@ static void dma_tc_handle(struct d40_chan *d40c)
 		d40_desc_done(d40c, d40d);
 	}
 
-	d40c->pending_tx++;
+	d40c->pending_tx += callbacks;
 	tasklet_schedule(&d40c->tasklet);
 
 }
@@ -2638,6 +2702,9 @@ dma40_prep_dma_cyclic(struct dma_chan *chan, dma_addr_t dma_addr,
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

