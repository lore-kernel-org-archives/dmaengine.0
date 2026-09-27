Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF173BB689;
	Sun, 27 Sep 2026 09:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790499817; cv=none; b=tizAoipxeXUCvdMEE37rsNDn3BW6V86rWqudGn4ghc6zr5SpFeGC3gPcDcggvmJ0kvgaTgEB7VxKZnZ7KfD9FiECXHbIAjhxg2rRvxFE1OsNd6sFAFakQ+AYjsQ+JLSpA960Yc1G8VqkCfIAUSEtUbzXemE9QPtwDTUHiexZJjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790499817; c=relaxed/simple;
	bh=4ZHcYCjPBZR0PBU0jGkEUwuHOwyoA9p0aHF+JDp1MsI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=daF/w5ZuBl8gnUOkE+WjpsPzikZ0SEReIPDMF5pPVKvIbirsMqHhY2Y9tJ4mnXbPpHmnvuV41Reb16ujMBXhDYdBJJbd7kNGGc8SV2+msFA/ngFQIYU/Z4vnCLD+Y/B2KmQM/DENvBMfIktq4YwbSV6t6XIkVs3A/MdAaRIKWbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tbs5Kozj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tbs5Kozj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B38231F000FF;
	Sun, 27 Sep 2026 09:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790499816;
	bh=/NOSv8TTwFb/Inl0OTFFewdxSkF9e7cMmvFC0HsE6tc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Tbs5KozjStbE1lxNM72GU8c5fNA7Hvr8IPacMHr+3dVI7vza6G0wvZeAgVejEpCws
	 iV5Hdek/TzWVvI57hs5ITTeaqeXzHaRzNCGUFhHXaf7/Z36JzpKny1kmXD9NLo1ntU
	 bbuTJ+oCdfrGY8pS/qfFJCVIx08MvN7VOcm8G7DHwV7NthPAIz5KFXbmMBKeH3Zhtr
	 R/54psxQ9WOmQRtye7uNyjEhEtM5LL3SWqDb2XVhyFnXJwVV2t+vQxuKjQJZF1zItW
	 qp5TEX228eFmeW9mco9zECV736iNAW8BXb2gC5p2RctJA4JvDac/NLXWRX1fvNrwZm
	 5xnEaify5pP8Q==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 27 Sep 2026 11:03:20 +0200
Subject: [PATCH v7 07/24] dmaengine: ste_dma40: Handle runtime PM resume
 errors
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260927-dma40-fixes-v7-7-89f595e8851d@kernel.org>
References: <20260927-dma40-fixes-v7-0-89f595e8851d@kernel.org>
In-Reply-To: <20260927-dma40-fixes-v7-0-89f595e8851d@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, phone-devel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, Frank Li <Frank.Li@nxp.com>
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
controller cannot resume. d40_term_all() only releases descriptor state and
does not access DMA40 registers, so it remains unconditional.

Balance each transient runtime PM reference in its successful acquisition
block, without bookkeeping flags. Release the outstanding busy reference
and channel allocation state when freeing a channel. Skip only the hardware
stop that requires register access.

Fixes: 7fb3e75e1833 ("dmaengine/ste_dma40: support pm in dma40")
Assisted-by: LLM
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c | 74 ++++++++++++++++++++++++++++++++++---------------
 1 file changed, 52 insertions(+), 22 deletions(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 5e9b6342c5a9..80780f76dff0 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -1576,11 +1576,14 @@ static int d40_pause(struct dma_chan *chan)
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
@@ -1600,13 +1603,16 @@ static int d40_resume(struct dma_chan *chan)
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
@@ -1643,8 +1649,20 @@ static struct d40_desc *d40_queue_start(struct d40_chan *d40c)
 
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
@@ -2161,9 +2179,6 @@ static int d40_free_dma(struct d40_chan *d40c)
 	struct d40_phy_res *phy = d40c->phy_chan;
 	bool is_src;
 
-	/* Terminate all queued and active transfers */
-	d40_term_all(d40c);
-
 	if (phy == NULL) {
 		chan_err(d40c, "phy == null\n");
 		return -EINVAL;
@@ -2185,11 +2200,18 @@ static int d40_free_dma(struct d40_chan *d40c)
 		return -EINVAL;
 	}
 
-	pm_runtime_get_sync(d40c->base->dev);
-	res = d40_channel_execute_command(d40c, D40_DMA_STOP);
-	if (res) {
-		chan_err(d40c, "stop failed\n");
-		goto mark_last_busy;
+	/* Release descriptor state; this does not access DMA40 registers. */
+	d40_term_all(d40c);
+
+	res = pm_runtime_resume_and_get(d40c->base->dev);
+	if (res >= 0) {
+		res = d40_channel_execute_command(d40c, D40_DMA_STOP);
+		if (res)
+			chan_err(d40c, "stop failed\n");
+
+		pm_runtime_put_autosuspend(d40c->base->dev);
+		if (res)
+			return res;
 	}
 
 	d40_alloc_mask_free(phy, is_src, chan_is_logical(d40c) ? event : 0);
@@ -2205,8 +2227,6 @@ static int d40_free_dma(struct d40_chan *d40c)
 	d40c->busy = false;
 	d40c->phy_chan = NULL;
 	d40c->configured = false;
- mark_last_busy:
-	pm_runtime_put_autosuspend(d40c->base->dev);
 	return res;
 }
 
@@ -2581,10 +2601,14 @@ static int d40_alloc_chan_resources(struct dma_chan *chan)
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
@@ -2592,8 +2616,6 @@ static int d40_alloc_chan_resources(struct dma_chan *chan)
 		goto mark_last_busy;
 	}
 
-	pm_runtime_get_sync(d40c->base->dev);
-
 	d40_set_prio_realtime(d40c);
 
 	if (chan_is_logical(d40c)) {
@@ -2625,6 +2647,7 @@ static int d40_alloc_chan_resources(struct dma_chan *chan)
 		d40_config_write(d40c);
  mark_last_busy:
 	pm_runtime_put_autosuspend(d40c->base->dev);
+ unlock:
 	spin_unlock_irqrestore(&d40c->lock, flags);
 	return err;
 }
@@ -2785,19 +2808,26 @@ static int d40_terminate_all(struct dma_chan *chan)
 
 	spin_lock_irqsave(&d40c->lock, flags);
 
-	pm_runtime_get_sync(d40c->base->dev);
-	ret = d40_channel_execute_command(d40c, D40_DMA_STOP);
-	if (ret)
-		chan_err(d40c, "Failed to stop channel\n");
+	ret = pm_runtime_resume_and_get(d40c->base->dev);
+	if (ret >= 0) {
+		ret = d40_channel_execute_command(d40c, D40_DMA_STOP);
+		if (ret)
+			chan_err(d40c, "Failed to stop channel\n");
+
+		pm_runtime_put_autosuspend(d40c->base->dev);
+	}
 
+	/*
+	 * Always release software state, even when the controller cannot
+	 * resume. d40_term_all() does not access DMA40 registers.
+	 */
 	d40_term_all(d40c);
-	pm_runtime_put_autosuspend(d40c->base->dev);
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

