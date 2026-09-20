Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9AA937DAC0;
	Sun, 20 Sep 2026 18:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789930795; cv=none; b=qAjvowNyM0sqDxTS1ykdmK9c03MLL1BUAesLGSZG+Py1w2jMMkufHtTXucM3lXIa1HouJwhvoeTsZYpUGXYcfLfgeCsYm/h935hIHAkPIY3mRRlez4TL/YrD0m6sZ/j74KOI5aqXR5FvscjgHHBms8tvDEwnuev4g/EKh4OJZqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789930795; c=relaxed/simple;
	bh=Gh4UYZw8EGs/Qs4oyQ6ug6AZN7JSw92gHun8Cin43oM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a/gOsapXjsiA9DIYTA6wpm12Dp5dHN8Lt2jFvdXKlnE7jFWcZSyKBh59a0BDuHJVaEoPotTX59lvui7F6DjLF4QbdbcUR0wftnGiCrRzljbSuiMjBdtswfDXe+ufU3Nie/Th5UhH4bbAeosyfCJU9XafEbs8Y4SNtig3i08oeVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ijj+uO7n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ijj+uO7n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69AA01F000FF;
	Sun, 20 Sep 2026 18:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789930794;
	bh=1snAjnlyOYpaEFICg7HB74YoxXlj/u8fKignNGukmiE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ijj+uO7nB62J0TKSwbDOlA9i/6+/EP8en7rkPG5nLBgS8IoZ+3Wi7kur9bQHvpU9O
	 od55lWeT8nQewuJ0LBu6+JaKdVSP6MA0sFn1YJ3YD9EtJHYAEPaBIz3vqi5NPhG1FZ
	 +BQD6C2d6yXVVhKNX7WUjpbVrf5FdxfItKsymuzUy0iMQMg2OH6SBN/hfIYjBktv/n
	 yd7D588lO078BMSXkQYCjgMT55DDWyAimfbuPqQcVEvfiFjK0ik/07Bb2pPgrJiEA9
	 ijrHWhuVHln2meYtzFoBUmYF6/+iLyYVw6l7QH7Yk+hmlEjWFLmguS/mov0i5CP9v/
	 T/1odvNMv3ffQ==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 20 Sep 2026 20:59:42 +0200
Subject: [PATCH v5 07/23] dmaengine: ste_dma40: Handle runtime PM resume
 errors
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-dma40-fixes-v5-7-5c55cd7f92f9@kernel.org>
References: <20260920-dma40-fixes-v5-0-5c55cd7f92f9@kernel.org>
In-Reply-To: <20260920-dma40-fixes-v5-0-5c55cd7f92f9@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, phone-devel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

Several channel operations use pm_runtime_get_sync() and access DMA40
registers without checking whether runtime resume succeeded. If resume
fails, the registers may be inaccessible. pm_runtime_get_sync() also
increments the usage counter on failure, making error unwinding easy to
unbalance.

Use pm_runtime_resume_and_get() and avoid register access when resume
fails. Acquire the runtime PM reference before allocating a channel so
failure needs no channel-allocation rollback.

If a queued transfer cannot be started because resume failed, retire all
issued descriptors through the normal tasklet path. Since
dma_async_issue_pending() cannot return an error, leaving them queued would
make clients wait indefinitely for callbacks.

Termination and channel release must also clean up software state when the
controller cannot resume. Always release descriptors and the outstanding
busy reference, and release channel allocation state when freeing the
channel. Skip only the hardware stop that requires register access.

Fixes: 7fb3e75e1833 ("dmaengine/ste_dma40: support pm in dma40")
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c | 67 ++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 50 insertions(+), 17 deletions(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 58128a980847..bb052d3028cc 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -1567,11 +1567,14 @@ static int d40_pause(struct dma_chan *chan)
 		return 0;
 
 	spin_lock_irqsave(&d40c->lock, flags);
-	pm_runtime_get_sync(d40c->base->dev);
+	res = pm_runtime_resume_and_get(d40c->base->dev);
+	if (res < 0)
+		goto unlock;
 
 	res = d40_channel_execute_command(d40c, D40_DMA_SUSPEND_REQ);
 
 	pm_runtime_put_autosuspend(d40c->base->dev);
+ unlock:
 	spin_unlock_irqrestore(&d40c->lock, flags);
 	return res;
 }
@@ -1591,13 +1594,16 @@ static int d40_resume(struct dma_chan *chan)
 		return 0;
 
 	spin_lock_irqsave(&d40c->lock, flags);
-	pm_runtime_get_sync(d40c->base->dev);
+	res = pm_runtime_resume_and_get(d40c->base->dev);
+	if (res < 0)
+		goto unlock;
 
 	/* If bytes left to transfer or linked tx resume job */
 	if (d40_residue(d40c) || d40_tx_is_linked(d40c))
 		res = d40_channel_execute_command(d40c, D40_DMA_RUN);
 
 	pm_runtime_put_autosuspend(d40c->base->dev);
+ unlock:
 	spin_unlock_irqrestore(&d40c->lock, flags);
 	return res;
 }
@@ -1634,8 +1640,20 @@ static struct d40_desc *d40_queue_start(struct d40_chan *d40c)
 
 	if (d40d != NULL) {
 		if (!d40c->busy) {
+			err = pm_runtime_resume_and_get(d40c->base->dev);
+			if (err < 0) {
+				chan_err(d40c, "Failed to resume DMA: %d\n",
+					 err);
+				do {
+					d40_desc_remove(d40d);
+					d40_desc_done(d40c, d40d);
+					d40c->pending_tx++;
+					d40d = d40_first_queued(d40c);
+				} while (d40d);
+				tasklet_schedule(&d40c->tasklet);
+				return ERR_PTR(err);
+			}
 			d40c->busy = true;
-			pm_runtime_get_sync(d40c->base->dev);
 		}
 
 		/* Remove from queue */
@@ -2150,11 +2168,9 @@ static int d40_free_dma(struct d40_chan *d40c)
 	int res = 0;
 	u32 event = D40_TYPE_TO_EVENT(d40c->dma_cfg.dev_type);
 	struct d40_phy_res *phy = d40c->phy_chan;
+	bool pm_acquired = false;
 	bool is_src;
 
-	/* Terminate all queued and active transfers */
-	d40_term_all(d40c);
-
 	if (phy == NULL) {
 		chan_err(d40c, "phy == null\n");
 		return -EINVAL;
@@ -2176,13 +2192,21 @@ static int d40_free_dma(struct d40_chan *d40c)
 		return -EINVAL;
 	}
 
-	pm_runtime_get_sync(d40c->base->dev);
+	/* Terminate all queued and active transfers */
+	d40_term_all(d40c);
+
+	res = pm_runtime_resume_and_get(d40c->base->dev);
+	if (res < 0)
+		goto release_channel;
+	pm_acquired = true;
+
 	res = d40_channel_execute_command(d40c, D40_DMA_STOP);
 	if (res) {
 		chan_err(d40c, "stop failed\n");
 		goto mark_last_busy;
 	}
 
+ release_channel:
 	d40_alloc_mask_free(phy, is_src, chan_is_logical(d40c) ? event : 0);
 
 	if (chan_is_logical(d40c))
@@ -2197,7 +2221,8 @@ static int d40_free_dma(struct d40_chan *d40c)
 	d40c->phy_chan = NULL;
 	d40c->configured = false;
  mark_last_busy:
-	pm_runtime_put_autosuspend(d40c->base->dev);
+	if (pm_acquired)
+		pm_runtime_put_autosuspend(d40c->base->dev);
 	return res;
 }
 
@@ -2572,10 +2597,14 @@ static int d40_alloc_chan_resources(struct dma_chan *chan)
 		err = d40_config_memcpy(d40c);
 		if (err) {
 			chan_err(d40c, "Failed to configure memcpy channel\n");
-			goto mark_last_busy;
+			goto unlock;
 		}
 	}
 
+	err = pm_runtime_resume_and_get(d40c->base->dev);
+	if (err < 0)
+		goto unlock;
+
 	err = d40_allocate_channel(d40c, &is_free_phy);
 	if (err) {
 		chan_err(d40c, "Failed to allocate channel\n");
@@ -2583,8 +2612,6 @@ static int d40_alloc_chan_resources(struct dma_chan *chan)
 		goto mark_last_busy;
 	}
 
-	pm_runtime_get_sync(d40c->base->dev);
-
 	d40_set_prio_realtime(d40c);
 
 	if (chan_is_logical(d40c)) {
@@ -2616,6 +2643,7 @@ static int d40_alloc_chan_resources(struct dma_chan *chan)
 		d40_config_write(d40c);
  mark_last_busy:
 	pm_runtime_put_autosuspend(d40c->base->dev);
+ unlock:
 	spin_unlock_irqrestore(&d40c->lock, flags);
 	return err;
 }
@@ -2767,6 +2795,7 @@ static int d40_terminate_all(struct dma_chan *chan)
 {
 	unsigned long flags;
 	struct d40_chan *d40c = container_of(chan, struct d40_chan, chan);
+	bool pm_acquired = false;
 	int ret;
 
 	if (d40c->phy_chan == NULL) {
@@ -2776,19 +2805,23 @@ static int d40_terminate_all(struct dma_chan *chan)
 
 	spin_lock_irqsave(&d40c->lock, flags);
 
-	pm_runtime_get_sync(d40c->base->dev);
-	ret = d40_channel_execute_command(d40c, D40_DMA_STOP);
-	if (ret)
-		chan_err(d40c, "Failed to stop channel\n");
+	ret = pm_runtime_resume_and_get(d40c->base->dev);
+	if (ret >= 0) {
+		pm_acquired = true;
+		ret = d40_channel_execute_command(d40c, D40_DMA_STOP);
+		if (ret)
+			chan_err(d40c, "Failed to stop channel\n");
+	}
 
 	d40_term_all(d40c);
-	pm_runtime_put_autosuspend(d40c->base->dev);
+	if (pm_acquired)
+		pm_runtime_put_autosuspend(d40c->base->dev);
 	if (d40c->busy)
 		pm_runtime_put_autosuspend(d40c->base->dev);
 	d40c->busy = false;
 
 	spin_unlock_irqrestore(&d40c->lock, flags);
-	return 0;
+	return ret;
 }
 
 static int

-- 
2.55.0

