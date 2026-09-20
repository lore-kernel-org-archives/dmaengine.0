Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17454718C5;
	Sun, 20 Sep 2026 18:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789930790; cv=none; b=AEQg7+NMKCW/GpXmuUdkjIHTRsz9AigfE/XrJdRTfHIF5NUXiP7PNDRAaP+e+a8NkRsGyIP9F1btJVpS0yC1tc3qiMacXerYxo1fHX9Dp8EL2YeEiUtjhy4Xs7zlJxK18BGuACm42YalYuvX4aT+P+vWmWcmbl9LAT0C1uHWlSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789930790; c=relaxed/simple;
	bh=uTkRNvO3nQrshqaslcuzQrwBJRPIJv1b1Ph3vkxgWqg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jylvkAweDS7zPOeVuCHsf/me2Ly6Lb17ecLzyO1fuFZRlN10HOo7tWJES8VLrS+IGdGM5YpegVdIHNjsutxkAo0g6ifjGZQws1h8pUg63l5pG6lOAs8asq3hWk8+aL2O69LRXuFqhzyhmOW/HxqSUlrdFwGfl87Jeh2Z2vvdK5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KGiW6dfy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KGiW6dfy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 105031F00898;
	Sun, 20 Sep 2026 18:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789930789;
	bh=tLJB9b5RPs/idcizHbgVXdMu+RKbDfg8lceht6Css5w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=KGiW6dfyuy/0L1Jd6f9ylaZszsYyy4uO8dmbxTNAnKHuXPyv1KOCdiCj9+uFJMaUa
	 ERM65lLAfbv4LNV703qyxdE9yhnlXtyF1A+lzlLIF8Javg56r6qnUluvi1b+lYcNLj
	 Yk+7lu1JNdbzptrvLdf8xXdPthC4LJgX+UB0LEWp2qA5J2x+lFewuapncsMGM5frWS
	 IIkM4NL4F+8hTmrOrbOciUUlc5YwbeljL9h+7NRTHFhhjLh0NIoLeENgqiTeUEDjV1
	 YNbReRmiJ7Ooy1WMUrycLpCBkmbKokEv6K9nb9u5LlM7m44rBt7PSMdNn3ySwpHJ81
	 BaHkypZmTWEmA==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 20 Sep 2026 20:59:39 +0200
Subject: [PATCH v5 04/23] dmaengine: ste_dma40: Fix failed start cleanup
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-dma40-fixes-v5-4-5c55cd7f92f9@kernel.org>
References: <20260920-dma40-fixes-v5-0-5c55cd7f92f9@kernel.org>
In-Reply-To: <20260920-dma40-fixes-v5-0-5c55cd7f92f9@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, phone-devel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, sashiko-bot@kernel.org
X-Mailer: b4 0.14.3

If d40_start() fails after a queued descriptor has been moved to the
active list, d40_queue_start() currently returns NULL without unwinding
the transfer state or clearing the channel busy flag.

Fix this pre-existing error path by completing the descriptor through the
normal tasklet path, clearing the busy flag, balancing the runtime PM
reference and returning an error pointer to distinguish the failure from
the no-work case. Do not free the descriptor directly, since it has
already been submitted and has a DMA cookie.

When starting the next queued transfer from the completion handler, put
the completed descriptor on the done list first. This preserves FIFO
completion order if the new transfer fails to start and prevents the
completed cookie from moving backwards.

Use done-list membership rather than the cyclic flag to identify terminal
descriptors in the tasklet. A cyclic descriptor that failed to start is
then completed and removed instead of remaining permanently at the head
of the done list.

Fixes: 7d83a854a1a4 ("dma40: remove "hardware link with previous jobs" code")
Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/dmaengine/20260618051539.15E201F000E9@smtp.kernel.org/
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 1f9e8c7249b1..280a0d2f16c5 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -1650,8 +1650,15 @@ static struct d40_desc *d40_queue_start(struct d40_chan *d40c)
 		/* Start dma job */
 		err = d40_start(d40c);
 
-		if (err)
-			return NULL;
+		if (err) {
+			d40_desc_remove(d40d);
+			d40_desc_done(d40c, d40d);
+			d40c->pending_tx++;
+			d40c->busy = false;
+			pm_runtime_put_autosuspend(d40c->base->dev);
+			tasklet_schedule(&d40c->tasklet);
+			return ERR_PTR(err);
+		}
 	}
 
 	return d40d;
@@ -1698,14 +1705,14 @@ static void dma_tc_handle(struct d40_chan *d40c)
 			return;
 		}
 
+		d40_desc_remove(d40d);
+		d40_desc_done(d40c, d40d);
+
 		if (d40_queue_start(d40c) == NULL) {
 			d40c->busy = false;
 
 			pm_runtime_put_autosuspend(d40c->base->dev);
 		}
-
-		d40_desc_remove(d40d);
-		d40_desc_done(d40c, d40d);
 	}
 
 	d40c->pending_tx += callbacks;
@@ -1719,20 +1726,22 @@ static void dma_tasklet(struct tasklet_struct *t)
 	struct d40_desc *d40d;
 	unsigned long flags;
 	bool callback_active;
+	bool from_done;
 	struct dmaengine_desc_callback cb;
 
 	spin_lock_irqsave(&d40c->lock, flags);
 
 	/* Get first entry from the done list */
 	d40d = d40_first_done(d40c);
-	if (d40d == NULL) {
+	from_done = !!d40d;
+	if (!from_done) {
 		/* Check if we have reached here for cyclic job */
 		d40d = d40_first_active_get(d40c);
 		if (d40d == NULL || !d40d->cyclic)
 			goto check_pending_tx;
 	}
 
-	if (!d40d->cyclic)
+	if (from_done)
 		dma_cookie_complete(&d40d->txd);
 
 	/*
@@ -1748,7 +1757,7 @@ static void dma_tasklet(struct tasklet_struct *t)
 	callback_active = !!(d40d->txd.flags & DMA_PREP_INTERRUPT);
 	dmaengine_desc_get_callback(&d40d->txd, &cb);
 
-	if (!d40d->cyclic) {
+	if (from_done) {
 		if (async_tx_test_ack(&d40d->txd)) {
 			d40_desc_remove(d40d);
 			d40_desc_free(d40c, d40d);

-- 
2.55.0

