Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4995339A7EF;
	Sun, 27 Sep 2026 09:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790499811; cv=none; b=u6usifLVt1e4RFmPFKl2zO9brAIaiLb2LStnJN/uKlDkaiFgcPz1jKjYJF2r9BsqKaLnnshxyF76hlw5rR9NiJJkjwoIiUQafOFZtAYXCgDkrOc5Dx9jdxKppFLzQKHxB8nQHduRNmCnjOVFi1xEP4aEdHL1vELJ4LnHu2rNFNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790499811; c=relaxed/simple;
	bh=YRKlC63i8AUBV+1v3noCtj48TO7Rp7NRHzlenb+PgYM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YoY81D8LVhbIz8FJ2H+Luf27cElLQtYBsYYNSnIT86FONWB7m7JRc3Og/oFf53RZjOtClBMQXWOzXATyjrrHnudiFJJlYjw/UvzpCoUtc4iIZ/Xb5+TvXavDeZCUovLpVoceU9fZ+C1qWFMX7cYNGTkge8mn3S4GlZEc4VNFKFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=amy6MA6E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="amy6MA6E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94F6E1F000FF;
	Sun, 27 Sep 2026 09:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790499810;
	bh=r8kVFgRWnNenLgaWipjRBsjI0G+tBRx2bz5lF5MQt98=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=amy6MA6E/YSgMDsTldc73ZFLxsf/XsmLxvxDwua7CxG4fI8GeOyK15zNAcO+5rye7
	 bjN1EPtfYj2lFeaozKDfeKXEe6RiKRknC+aL21uGtS2rlxz8qe4zvS1GDi8RmM9iUh
	 X+gZR2AmvtkuSrXLwq5SOdrsOZX8L/8+smb1UbyY2fGcrKYQ1ABn9nNznuNqlIwzhK
	 xHb6UKKOd3vbkP1SjzL4+wQTIqmbZY14BTc7JFlj1zSBsgupBejunTeDecig11ln9H
	 8y4YFAExSwj7uoYy67+a0toYkXZhaH/C/K502gFoJB4KB5aTVlrGkQt44cL062eAXT
	 unqkZUQB5g5qQ==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 27 Sep 2026 11:03:17 +0200
Subject: [PATCH v7 04/24] dmaengine: ste_dma40: Fix failed start cleanup
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260927-dma40-fixes-v7-4-89f595e8851d@kernel.org>
References: <20260927-dma40-fixes-v7-0-89f595e8851d@kernel.org>
In-Reply-To: <20260927-dma40-fixes-v7-0-89f595e8851d@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, phone-devel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, sashiko-bot@kernel.org, 
 Frank Li <Frank.Li@nxp.com>
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Assisted-by: LLM
Link: https://lore.kernel.org/dmaengine/20260618051539.15E201F000E9@smtp.kernel.org/
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 4b138aa313c8..64f7a0ca20b9 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -1659,8 +1659,15 @@ static struct d40_desc *d40_queue_start(struct d40_chan *d40c)
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
@@ -1707,14 +1714,14 @@ static void dma_tc_handle(struct d40_chan *d40c)
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
@@ -1728,20 +1735,22 @@ static void dma_tasklet(struct tasklet_struct *t)
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
@@ -1757,7 +1766,7 @@ static void dma_tasklet(struct tasklet_struct *t)
 	callback_active = !!(d40d->txd.flags & DMA_PREP_INTERRUPT);
 	dmaengine_desc_get_callback(&d40d->txd, &cb);
 
-	if (!d40d->cyclic) {
+	if (from_done) {
 		if (async_tx_test_ack(&d40d->txd)) {
 			d40_desc_remove(d40d);
 			d40_desc_free(d40c, d40d);

-- 
2.55.0

