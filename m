Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620A343745E
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 18:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786385593; cv=none; b=Lk4Lv/6m86T7+T/6RwQm/og/H4sFXDTm2dk4yPIjutnTjrT4iCBbvBvb9GkaA1WXb+CQ3CcRZj9IEoaSRwSugBbXIyVTBiYJQlmlmYf+5PjJyc95rQ7Qw4qg/lLXqXVewvEyb8PzsMBHVfrhQ4y/Si87Q8E+l1w4cMmRLfPP88A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786385593; c=relaxed/simple;
	bh=yupeiOO8fmOL5Q45fGMYjdfJvYxjK9X0pwrsrA/jt2A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YNBlm2QhrbnRyXcstwlKCD2Q+YcotQinttE4n1l+0ce/7ktsjExpHyRob18sXzfSx8ZB5YxXCqaZ3ohLTebU3+ejJBqgFAHXUQRwDxU87iIgwARIt1R3N9SJ8ypqIFzbjhMJtrq6TMojaFeMlgVAJ7Lro9QVAgRVp05uHHvwf4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CzGIFZ+I; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CzGIFZ+I"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38e347638adso2455730a91.0
        for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 11:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786385592; x=1786990392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y41rG9GD2vJLat9LGzFZQ5btVcwyl0a1Mv04++c5Gh8=;
        b=CzGIFZ+I3+Cqmd0ObF5GsBTDQE6LltWbTXOuUjYveQYhkbX+h7N9AQJHdGxCtkTzDk
         0AcA18HifS2ZntaX+4PKrpeAFVqvYbaRT6kMQq+1WTtMFahtaAxUs750X1HSL9jyxM61
         513odDPhP46GzwxxTjD2kG5m/6xG/6Yb/7sEJwjAfZKT5wNLf2EBeMtf+jSt+6MFUorD
         WKFNClJONWgCQXnh+IvJEM3xa0/NQxqC0dxc4sko7yjfXAHjT+33L+Ola1xz2hdXnbpE
         b0dyTCrfXZyG8WfLxkp2g8wGUloXCkbsPHhaLuG4uDLODXnJtc6yHxn4htOhWflrEBrt
         65DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786385592; x=1786990392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y41rG9GD2vJLat9LGzFZQ5btVcwyl0a1Mv04++c5Gh8=;
        b=Fk+vnhQJMK7YV5B9V+B18MzVGPEQnBgGZpp610csk52zU0lsCg3X6wn3xel/GJhCwc
         cAp0TC9iwfiBGV5mPOcxJCzWTwTxFraHGhIGSdOGdbId0ys7zR6jLKSUs6eKcuAmqVuq
         d7TElrig/IW8rigT7Ky/ztoeJezexZWNBowSn4WdkP+PFTrgg8x85JW0gg7EcNjXWnjA
         4JoUKxoi8lsm3s4nYlsE9iSw9mrUIvNvsXKY/Aj2EBuqeTsJ3L4VcKxagl/jzWTNjxFh
         nVd3CW6A7VkcYRZBsKEagqddbYr86EY2rbcnOW3dvMnAi0m025GbL85YqhZug0VFALdU
         F3qg==
X-Forwarded-Encrypted: i=1; AHgh+RpqqToIVMG1IOiO2InOaK7Ms4YnV/DYRHTkXNNh6WJ+z3pcv0eugj3UlZ4XO/OloogRn2NIykiKFSQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ0gxGGRbGUNPUdHCFJNVKcIr3Nm+NBBSdCh2gvDmANncJe3gX
	y6S3myuwauHgyoqgLHOKlyBfPV3l+hhZc4s7qbu87GvXDT11Qwr0LgA6PFXKZA==
X-Gm-Gg: AR+sD127qVEtdCtgUoQcGpGbu+qFyF86ehaodMgNkm7VinEFSVGeP7IyK/eQMJF5sIJ
	mVdn1T8Jiet5DYgHVgOdjk9WRXcXOYNqZCUDquosfcv+/C9+okcPIhHZFhz2hIpQuEpkJsmYn6+
	5FlA8AyLtoLKr2jGCLRAYfEi+DKilCdgBmL3R/r2YHv0U9Z2hTU1cPxJYJH/+R1EFnTehiSroQh
	W7wJ4+CxMXVr5VLjLIDpWpuQZzeYD5uyNCnnUEyb5no6vUpq2H5pVpG3YAU/qxF08IfT6vc+YDd
	8O6HD+IHkKyKxdvq2UxgVBnPm3lYu0QE/MP+CufsTZ8E1hLK1iw6UNbKoZA+LJAMRv+LA/2vQoQ
	o/7/Q3LejgccRY8FbsU+/a8QG4g/10E6SbumpinUkGYJjhK/LAbxe2x1/WiVHEqvmvykqC/Tcgn
	ojOoLQQSq6Uc7ejRSgA5zb7mjs94u6TFaVE7eAOWBCjhY8QWjpAH05DjxIPUwUmGs=
X-Received: by 2002:a17:90b:2507:b0:38f:57f3:4dc6 with SMTP id 98e67ed59e1d1-392c068d70emr5545361a91.21.1786385591607;
        Mon, 10 Aug 2026 11:13:11 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fa9:fa00:b1a9:6513:83c6:1d23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d53b873asm472795a91.17.2026.08.10.11.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 11:13:11 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>
Subject: [PATCH v3 26/34] dmaengine: mpc512x: route callbacks via channel BH
Date: Mon, 10 Aug 2026 11:09:27 -0700
Message-ID: <c4ed3eb4259edcb339eb69466aba216d51c93559.1786384169.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1786384168.git.allen.lkml@gmail.com>
References: <cover.1785183549.git.allen.lkml@gmail.com> <cover.1786384168.git.allen.lkml@gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Schedule per-channel BH work for completions and process callbacks there,
leaving the controller tasklet for IRQ/error handling.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/mpc512x_dma.c | 74 +++++++++++++++++++++++++--------------
 1 file changed, 47 insertions(+), 27 deletions(-)

diff --git a/drivers/dma/mpc512x_dma.c b/drivers/dma/mpc512x_dma.c
index 0adc8e01057e..19e0b2f1b2aa 100644
--- a/drivers/dma/mpc512x_dma.c
+++ b/drivers/dma/mpc512x_dma.c
@@ -372,45 +372,47 @@ static irqreturn_t mpc_dma_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-/* process completed descriptors */
-static void mpc_dma_process_completed(struct mpc_dma *mdma)
+static void mpc_dma_process_chan_completed(struct mpc_dma_chan *mchan)
 {
 	dma_cookie_t last_cookie = 0;
-	struct mpc_dma_chan *mchan;
 	struct mpc_dma_desc *mdesc;
 	struct dma_async_tx_descriptor *desc;
 	unsigned long flags;
 	LIST_HEAD(list);
-	int i;
 
-	for (i = 0; i < mdma->dma.chancnt; i++) {
-		mchan = &mdma->channels[i];
+	/* Get all completed descriptors */
+	spin_lock_irqsave(&mchan->lock, flags);
+	if (!list_empty(&mchan->completed))
+		list_splice_tail_init(&mchan->completed, &list);
+	spin_unlock_irqrestore(&mchan->lock, flags);
 
-		/* Get all completed descriptors */
-		spin_lock_irqsave(&mchan->lock, flags);
-		if (!list_empty(&mchan->completed))
-			list_splice_tail_init(&mchan->completed, &list);
-		spin_unlock_irqrestore(&mchan->lock, flags);
+	if (list_empty(&list))
+		return;
 
-		if (list_empty(&list))
-			continue;
+	/* Execute callbacks and run dependencies */
+	list_for_each_entry(mdesc, &list, node) {
+		desc = &mdesc->desc;
 
-		/* Execute callbacks and run dependencies */
-		list_for_each_entry(mdesc, &list, node) {
-			desc = &mdesc->desc;
+		dmaengine_desc_get_callback_invoke(desc, NULL);
 
-			dmaengine_desc_get_callback_invoke(desc, NULL);
+		last_cookie = desc->cookie;
+		dma_run_dependencies(desc);
+	}
 
-			last_cookie = desc->cookie;
-			dma_run_dependencies(desc);
-		}
+	/* Free descriptors */
+	spin_lock_irqsave(&mchan->lock, flags);
+	list_splice_tail_init(&list, &mchan->free);
+	mchan->chan.completed_cookie = last_cookie;
+	spin_unlock_irqrestore(&mchan->lock, flags);
+}
 
-		/* Free descriptors */
-		spin_lock_irqsave(&mchan->lock, flags);
-		list_splice_tail_init(&list, &mchan->free);
-		mchan->chan.completed_cookie = last_cookie;
-		spin_unlock_irqrestore(&mchan->lock, flags);
-	}
+/* process completed descriptors */
+static void mpc_dma_process_completed(struct mpc_dma *mdma)
+{
+	int i;
+
+	for (i = 0; i < mdma->dma.chancnt; i++)
+		mpc_dma_process_chan_completed(&mdma->channels[i]);
 }
 
 /* DMA Tasklet */
@@ -419,6 +421,7 @@ static void mpc_dma_tasklet(struct tasklet_struct *t)
 	struct mpc_dma *mdma = from_tasklet(mdma, t, tasklet);
 	unsigned long flags;
 	uint es;
+	int i;
 
 	spin_lock_irqsave(&mdma->error_status_lock, flags);
 	es = mdma->error_status;
@@ -453,7 +456,21 @@ static void mpc_dma_tasklet(struct tasklet_struct *t)
 			dev_err(mdma->dma.dev, "- Destination Bus Error\n");
 	}
 
-	mpc_dma_process_completed(mdma);
+	for (i = 0; i < mdma->dma.chancnt; i++) {
+		struct mpc_dma_chan *mchan = &mdma->channels[i];
+
+		spin_lock_irqsave(&mchan->lock, flags);
+		if (!list_empty(&mchan->completed))
+			dmaengine_schedule_bh(&mchan->chan);
+		spin_unlock_irqrestore(&mchan->lock, flags);
+	}
+}
+
+static void mpc_dma_chan_bh(struct dma_chan *chan)
+{
+	struct mpc_dma_chan *mchan = dma_chan_to_mpc_dma_chan(chan);
+
+	mpc_dma_process_chan_completed(mchan);
 }
 
 /* Submit descriptor to hardware */
@@ -551,6 +568,8 @@ static void mpc_dma_free_chan_resources(struct dma_chan *chan)
 	unsigned long flags;
 	LIST_HEAD(descs);
 
+	dmaengine_kill_bh(&mchan->chan);
+
 	spin_lock_irqsave(&mchan->lock, flags);
 
 	/* Channel must be idle */
@@ -1007,6 +1026,7 @@ static int mpc_dma_probe(struct platform_device *op)
 		INIT_LIST_HEAD(&mchan->completed);
 
 		spin_lock_init(&mchan->lock);
+		dmaengine_init_bh(&mchan->chan, mpc_dma_chan_bh);
 		list_add_tail(&mchan->chan.device_node, &dma->channels);
 	}
 
-- 
2.43.0

