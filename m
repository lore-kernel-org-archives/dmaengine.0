Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687E542CAE4
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184339; cv=none; b=IlhWgR/na7GDms4pta5UYZtEGbOfffVWH2QAu4up3EIDvBJqDpNz60bUPdHH/HJq+gkTFy9+55RFKRh20xHbX/GN0rlm3CK//6qi2s0gz+lLvlbJiN1ZxMLyylBtUkk3WwU3dS6XkaKMzChPaGlZHBTyNKnWiI+mqaMBRBQb78E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184339; c=relaxed/simple;
	bh=2mVF6aSeexMQi8YaOla2m9vDS2hlbdHTFBeJx9MYV/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KxLiHlztT5NSJ8lEifQr/SyAu74LKPGUak5wOMcyDM74UZgWmWQWBPpWUFMqgnwsRX7n1elLXceg11o6oBNieqheFlxGQgcM9ihMLAQ/cId/qhTDc6J1Ms05FxXTUDj72fZLumlYqcGm3FfdHIt4poTityVPn4mMl69V/xnR53Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VvITlRaB; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VvITlRaB"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cace91f112so35619735ad.0
        for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 13:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184338; x=1785789138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=osE759pQOIbCs0URdSsKAkldj8MZm3Utpg4vgTdlOqU=;
        b=VvITlRaBl3jp2ySdTs8barmkPNmVt6pCFq1RNTa/gN3LbGxAJ2O5kopaBvuILqve/U
         LqqBvmfJ9urFqJ8Yqh0RTGbGj0ktTrmODxaBRdNhYFkI5DyS3aTeDJCb+u2UkyXYmReK
         0sTo8rx03SMLfn7+HDigsGNTCrgLYWAGw+8EV0uw3e/tBZnUgug4O6oGd0lXr56kFr54
         kna9HwkUPRvagpa5IYRjswQKhs1eayjaqigl9ImS9xKazGYj4sHpQr3+uDNhtUALT9j9
         TavbVPBgSr5zzu6ky6tfEF5FG1MAUivTvzPZ2kHIYmqPwRfVcpbwDHk7P95R1iLCRjD/
         WApA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184338; x=1785789138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=osE759pQOIbCs0URdSsKAkldj8MZm3Utpg4vgTdlOqU=;
        b=B2C6qLBG8kFD9ag4dWy3p4QEjsDY1nPpeAvDANGboh+c/1s3DERG+Qq4clcCUiBrXt
         WkNV9WjxiZ6axNLCdMLL9H/rWmJu3bCneiyvUKrICUozwWmwgY+D2oHbv9QdNd7cyKYN
         vkxMT5HfZzj5a3lHVx1MGigQMmjx/1BWXfQycH/0EW0Kvp9vcVceJlFTrdexnJwvyP/a
         lpL/j81m8d1n52iAP1dAi2z6VBhIgXH25ol9n4rkeVrdqfnUJCUQJcDBQeDF2VMz9Bhi
         OWZVuxu32kNa8aFS4Ca7uJu2OWAdqXWu7vnkOtswoyr3kJOb29K1fwOz5nIS/Ubl9+R1
         OTLA==
X-Forwarded-Encrypted: i=1; AHgh+RrVBMsilYIPBUYrs5nzbaBDWrVMoWh4IdRws7ssF3FWGQUMWOYKw5tFwQbT519dHtYQu91NTKSN7ew=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsmoTPjVpPNF383TbnPFQsAT7RN0B++BGYxZioc6co6PZPLBAW
	gI76UfY2+WtnhJwQoxkYgEGAK+yArgii3PM/HeGFmgcy1iSGcezjlyMIljirpw==
X-Gm-Gg: AR+sD10yFUHW6XFaI5vCdjSSo+OJwYH3QHe2sY55JhUDBz+/CDVp54RsCE/I9MWqcdq
	qFmykqilW65FjzFFJAiDBWJKxIZYpNdDC0lyMZorAYY1E6BgvABqqgSjNieXxkfWVIQ8wyEM+RD
	Xu6kRQGAq4hV+8k9Ooeg7gj5Ox3CFpxnZ/GRHF/sp356mw1yNEdNxZbg2KB5qB/vQnpxB9vb2um
	usjFnvq5jS8ZAadAzevQZNaIQAMUwjXt4XDVK2/sIWujzHEm2r4h6NEhbozYL3KxEPh90WaURUV
	BgpG8FfCmnI/2CmpwSHVnrkpp6fBtGEj3uPkvW0ZzkBllKTcHTcv+EmRgRkzE/f8rBHFzNHz+K+
	UgnC06/pq6LOhx1n7oGdSxY3dW1dgc1lzMUhYSo7MJF/CY1bzyI+DNgUAqH4RVtSLr80qx7hUr9
	DnFavO
X-Received: by 2002:a17:902:f546:b0:2cc:f7c6:8353 with SMTP id d9443c01a7336-2d00f47ad52mr7326845ad.41.1785184337602;
        Mon, 27 Jul 2026 13:32:17 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde59b768sm41551805ad.4.2026.07.27.13.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:32:15 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>
Subject: [PATCH v2 18/64] dmaengine: xgene-dma: wire descriptor cleanup to dma_chan BH
Date: Mon, 27 Jul 2026 13:28:46 -0700
Message-ID: <b50997a5ce2cd59ccf056513d123f37f3b23932e.1785183549.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com> <cover.1785183549.git.allen.lkml@gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the per-channel tasklet with the shared dma_chan BH helper.
The handler continues to run in softirq context while dmaengine owns
the common scheduling and teardown mechanism.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/xgene-dma.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/dma/xgene-dma.c b/drivers/dma/xgene-dma.c
index fa1173e49900..8d0428c2944e 100644
--- a/drivers/dma/xgene-dma.c
+++ b/drivers/dma/xgene-dma.c
@@ -260,7 +260,6 @@ struct xgene_dma_desc_sw {
  *	These descriptors have already had their cleanup actions run. They
  *	are waiting for the ACK bit to be set by the async tx API.
  * @desc_pool: descriptor pool for DMA operations
- * @tasklet: bottom half where all completed descriptors cleans
  * @tx_ring: transmit ring descriptor that we use to prepare actual
  *	descriptors for further executions
  * @rx_ring: receive ring descriptor that we use to get completed DMA
@@ -280,7 +279,6 @@ struct xgene_dma_chan {
 	struct list_head ld_running;
 	struct list_head ld_completed;
 	struct dma_pool *desc_pool;
-	struct tasklet_struct tasklet;
 	struct xgene_dma_ring tx_ring;
 	struct xgene_dma_ring rx_ring;
 };
@@ -975,9 +973,10 @@ static enum dma_status xgene_dma_tx_status(struct dma_chan *dchan,
 	return dma_cookie_status(dchan, cookie, txstate);
 }
 
-static void xgene_dma_tasklet_cb(struct tasklet_struct *t)
+static void xgene_dma_tasklet_cb(struct dma_chan *c)
 {
-	struct xgene_dma_chan *chan = from_tasklet(chan, t, tasklet);
+	struct xgene_dma_chan *chan = container_of(c, struct xgene_dma_chan,
+						   dma_chan);
 
 	/* Run all cleanup for descriptors which have been completed */
 	xgene_dma_cleanup_descriptors(chan);
@@ -999,11 +998,11 @@ static irqreturn_t xgene_dma_chan_ring_isr(int irq, void *id)
 	disable_irq_nosync(chan->rx_irq);
 
 	/*
-	 * Schedule the tasklet to handle all cleanup of the current
+	 * Schedule the bottom half to handle all cleanup of the current
 	 * transaction. It will start a new transaction if there is
 	 * one pending.
 	 */
-	tasklet_schedule(&chan->tasklet);
+	dma_chan_schedule_bh(&chan->dma_chan);
 
 	return IRQ_HANDLED;
 }
@@ -1539,7 +1538,7 @@ static int xgene_dma_async_register(struct xgene_dma *pdma, int id)
 	INIT_LIST_HEAD(&chan->ld_pending);
 	INIT_LIST_HEAD(&chan->ld_running);
 	INIT_LIST_HEAD(&chan->ld_completed);
-	tasklet_setup(&chan->tasklet, xgene_dma_tasklet_cb);
+	dma_chan_init_bh(&chan->dma_chan, xgene_dma_tasklet_cb);
 
 	chan->pending = 0;
 	chan->desc_pool = NULL;
@@ -1556,7 +1555,7 @@ static int xgene_dma_async_register(struct xgene_dma *pdma, int id)
 	ret = dma_async_device_register(dma_dev);
 	if (ret) {
 		chan_err(chan, "Failed to register async device %d", ret);
-		tasklet_kill(&chan->tasklet);
+		dma_chan_kill_bh(&chan->dma_chan);
 
 		return ret;
 	}
@@ -1579,7 +1578,7 @@ static int xgene_dma_init_async(struct xgene_dma *pdma)
 		if (ret) {
 			for (j = 0; j < i; j++) {
 				dma_async_device_unregister(&pdma->dma_dev[j]);
-				tasklet_kill(&pdma->chan[j].tasklet);
+				dma_chan_kill_bh(&pdma->chan[j].dma_chan);
 			}
 
 			return ret;
@@ -1790,7 +1789,7 @@ static void xgene_dma_remove(struct platform_device *pdev)
 
 	for (i = 0; i < XGENE_DMA_MAX_CHANNEL; i++) {
 		chan = &pdma->chan[i];
-		tasklet_kill(&chan->tasklet);
+		dma_chan_kill_bh(&chan->dma_chan);
 		xgene_dma_delete_chan_rings(chan);
 	}
 
-- 
2.43.0

