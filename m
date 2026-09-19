Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0073138424C;
	Sat, 19 Sep 2026 22:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789856551; cv=none; b=p3HgfvczOQ+rBgv+H6T/mfC4w4OcGvQ9fqe13TO3YEA39X8N+m8JZulg8Gb/8uNaEskZHBP0GJwynFXf1eZv8txP3eXiAcbvyqwBuR4PfZIPU3+97t3So+1dsaT01pRfJ6/KsiK3v1M+6I9rE8TynS/P7lmhIFXfL3qGjjiehgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789856551; c=relaxed/simple;
	bh=U9AqC8dIn7uJChkt5Hehj50XL78MSli/YM9jYzHutx0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EoIPahq1K7WWAF0qyYvajYRJQBmIC9lfPdsJdN3aLyTDNBRg30KPnlXdLPDmh4BhJi3u1xyE/boCE+sCY3EC5kp8rQNtnenAGllgUoulR/JYbTPnAzdCiuxYSTuhUFxGt9BCl9fS1ubeOR6Un8/5N6SIOIOBeLey+tgUj8DX8Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LEDyp+8l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LEDyp+8l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8F441F00893;
	Sat, 19 Sep 2026 22:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789856549;
	bh=dwzkTPukm6h2MzcLnUbviiWQ0C7BMuVsL0tBVgeESKc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=LEDyp+8lkwB0CgVtl1p6gU19lzugXZlJTfcf6dqsLjlyH+Hqkdt6wk02IEj5Ddfxb
	 0SYWg2pH3VX7ZVzbaDrLeWhmQJGCuK8Fh0KJ24Jhl2fvmNwnB90mJ7OhNQ0TMCeeZk
	 6bkvPXY10xKTLddqjsMc8glIBpelPWSrhaYbZWd8+f0AUfhA5QNZss9V4YeaHZPxmM
	 0Uo+9/aYeklJIasKNC9h375jrH322pELBsRZ2rIcDWEWo85iBA5nMAValyJEsx4sUO
	 EYhZ9fqlppEbEWDK4mvC3S51AqNb84vVY4AtA3+TQi46NOe1uX6p4FuLUyO2AmN6hw
	 SBS9jUbMnz7WQ==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 20 Sep 2026 00:22:18 +0200
Subject: [PATCH v4 07/23] dmaengine: ste_dma40: Handle runtime PM resume
 errors
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-dma40-fixes-v4-7-d751b2d9c23f@kernel.org>
References: <20260920-dma40-fixes-v4-0-d751b2d9c23f@kernel.org>
In-Reply-To: <20260920-dma40-fixes-v4-0-d751b2d9c23f@kernel.org>
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
index f32c3eee16d9..633f6a04fdc1 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -1550,11 +1550,14 @@ static int d40_pause(struct dma_chan *chan)
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
@@ -1574,13 +1577,16 @@ static int d40_resume(struct dma_chan *chan)
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
@@ -1617,8 +1623,20 @@ static struct d40_desc *d40_queue_start(struct d40_chan *d40c)
 
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
@@ -2133,11 +2151,9 @@ static int d40_free_dma(struct d40_chan *d40c)
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
@@ -2159,13 +2175,21 @@ static int d40_free_dma(struct d40_chan *d40c)
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
@@ -2180,7 +2204,8 @@ static int d40_free_dma(struct d40_chan *d40c)
 	d40c->phy_chan = NULL;
 	d40c->configured = false;
  mark_last_busy:
-	pm_runtime_put_autosuspend(d40c->base->dev);
+	if (pm_acquired)
+		pm_runtime_put_autosuspend(d40c->base->dev);
 	return res;
 }
 
@@ -2555,10 +2580,14 @@ static int d40_alloc_chan_resources(struct dma_chan *chan)
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
@@ -2566,8 +2595,6 @@ static int d40_alloc_chan_resources(struct dma_chan *chan)
 		goto mark_last_busy;
 	}
 
-	pm_runtime_get_sync(d40c->base->dev);
-
 	d40_set_prio_realtime(d40c);
 
 	if (chan_is_logical(d40c)) {
@@ -2599,6 +2626,7 @@ static int d40_alloc_chan_resources(struct dma_chan *chan)
 		d40_config_write(d40c);
  mark_last_busy:
 	pm_runtime_put_autosuspend(d40c->base->dev);
+ unlock:
 	spin_unlock_irqrestore(&d40c->lock, flags);
 	return err;
 }
@@ -2749,6 +2777,7 @@ static int d40_terminate_all(struct dma_chan *chan)
 {
 	unsigned long flags;
 	struct d40_chan *d40c = container_of(chan, struct d40_chan, chan);
+	bool pm_acquired = false;
 	int ret;
 
 	if (d40c->phy_chan == NULL) {
@@ -2758,19 +2787,23 @@ static int d40_terminate_all(struct dma_chan *chan)
 
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

