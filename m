Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8462542B303
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184572; cv=none; b=JCKbtkPuk6yEzq2YVwuNymW6nV6nPgmxamXRmrZrMtTIsseb4rLlEG8YTodC14OT3W9g72cGvu+Z7Fyr1QKSa03FXEp+4eXdAy8r70k8ijC89lb/IK9LkyLSnjPJBQOaZVS+kaOiUzThP/a3xccgmRORUg8FHI6wM5Z05O9evuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184572; c=relaxed/simple;
	bh=ySUgCrwg0RgrM1DYS+FFgWxsZGG3GkFuI60i50bKR5c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j+bnU2fRnfRdUa/QtIIGMlmB+yfxbKmuPItTMAZEJiRomrHO+hTMy9HeBFuzq9OtXSNPQ8SofMBkQwPhlAZHcVpIk1lN2fRToBJ7+j1W/rezkpmtZUGaSGH4cL5US1FKKC+EkCCl35uaCEm5axpqLL3wT4lt/3xXlIdneSxJO7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MU5JSsDy; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MU5JSsDy"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ceae1ed204so34213855ad.0
        for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 13:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184569; x=1785789369; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zcheLO8orK20PUIiz96mnTxc+cc7vg3DtEUqjIvWtQU=;
        b=MU5JSsDytA9BFEg3o22qhQc9eobqhzhP6nViVQhsk0jQEyOfgBjJsyIAYtQrYTWMVc
         mVhvLzJNgVdK3V7WumJ2H0pJgnQuqsXAggXxDZIoSWOmTipbaFK48lRF9Wqmi4Aisgi5
         sw3J8ZB3xCpSc0fI43vRHtkiC8vC9OPEUJzM8VAv1jMbPkA7DqTp+vLffa7bkQnuRIpK
         SARMlyONi3HgW4Ygf9raVPca4FWJcWkCP2LoJhjq/YJDKdGrw2WpdvnqBhLsjJ9jIzef
         /+snParr4BvYQ3aY0eUGzIUN1n03FALpzhrb3zwKVRSoYMqqW/JxSsQ+E/tXlEOvzmPn
         F5PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184569; x=1785789369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zcheLO8orK20PUIiz96mnTxc+cc7vg3DtEUqjIvWtQU=;
        b=crzc8EwJlxD6ImTCYxtsN0ByWqQGNoco9CIEHWoq0oMlXmqFeVvr9ZMBCb0TDGpyi8
         DPbF5QNRtQoU0lwAuS0bJ4HUpGDIPRlI3Ce+VBd8jrTFKxTbdsykx9+Rl05jmj2asMJE
         QnnD0QRTukZyyzY8a2VKY4vq5d+vr0+VyQxNnI3+yeY0QUm/AFJGJe428VnhSgbtDfa4
         e8hgdXA1IplCoyabkrfVIZVTG1IogONeIOniWfKp+na67ZFEZlXYMUKbh//9JfV+Y9wS
         xSVu6orhbVhYvyvdsIe11UvNFKj9aqK3mZu9jj3kwdWiBh0hWZmPPqEzGFHFzOqQr5hD
         bjYA==
X-Forwarded-Encrypted: i=1; AHgh+Rp3AA+sB2id/WVRKc+qVRy2qQWY3ahjarUnhccOUoRo3tZ0DUXJKa+WJg/zGImZSdqw6sOnYVDCD3w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz459aR2IanICROUS+1aBPBjIUVJEQYLr/a/Z3kEM3OsoVh3Sz/
	2jJYT5lX4siyWl0lA5/6W9WDNl5ZnHXnN9mTjG00HE+GhEaqHrhpRFta
X-Gm-Gg: AR+sD11tYOTyNg7BnNej2clUKH1xyj0F1o8AOG93MM2Rk0VJo0D8OFhj6xSKUQDz2/p
	gI0aGikVGqzj7tv15r1ejM7+K7oF6uoeQnLSMlqP3SrNPAbAaIkBPAdQORMtoUGwuy1x5qG7KjV
	FLS14VHjhW/VUmfpMIx4ocScIei5s/88cVL8VlMun2dbmsSmHvs5qXYduqXjl2pwz0eXlM7Rt3i
	ScbFBuQI84bddKQNIFP9RrcEO0Wq82nTweKy3nI2yWU5MwkE7iV5Gi7GeyzbeS+PKYYkrThhdRG
	cpUbu7BOghy/Zhj4KthugDEX//wUVrap2jEiy/Ez0zXXrQte/saJJpJ6URWQQbWpidtbkVGvvLV
	H+ZDmOJAr6TS2Wf5gLxte6of8hBUhodotcWcZOWdG5KAteH5v7+SGMp/xJt3OX7RGRhg+9v2OO4
	RmaaHK
X-Received: by 2002:a17:903:22cc:b0:2c9:97a7:f543 with SMTP id d9443c01a7336-2cfde885feamr96333925ad.41.1785184569566;
        Mon, 27 Jul 2026 13:36:09 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde5c8337sm41681885ad.20.2026.07.27.13.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:36:08 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v2 32/64] dmaengine: k3-udma: use channel BH for vchan completions
Date: Mon, 27 Jul 2026 13:34:54 -0700
Message-ID: <590639c835c2926e2ff26d803f1282a27b147555.1785183549.git.allen.lkml@gmail.com>
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

Use the per-channel BH mechanism for custom vchan completion handling
and clean up via dma_chan_kill_bh().

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/ti/k3-udma.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index 1cf158eb7bdb..12b8a9caf4d2 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -4042,12 +4042,12 @@ static void udma_desc_pre_callback(struct virt_dma_chan *vc,
 }
 
 /*
- * This tasklet handles the completion of a DMA descriptor by
+ * This BH handles the completion of a DMA descriptor by
  * calling its callback and freeing it.
  */
-static void udma_vchan_complete(struct tasklet_struct *t)
+static void udma_vchan_complete(struct dma_chan *chan)
 {
-	struct virt_dma_chan *vc = from_tasklet(vc, t, task);
+	struct virt_dma_chan *vc = to_virt_chan(chan);
 	struct virt_dma_desc *vd, *_vd;
 	struct dmaengine_desc_callback cb;
 	LIST_HEAD(head);
@@ -4112,7 +4112,7 @@ static void udma_free_chan_resources(struct dma_chan *chan)
 	}
 
 	vchan_free_chan_resources(&uc->vc);
-	tasklet_kill(&uc->vc.task);
+	dma_chan_kill_bh(&uc->vc.chan);
 
 	bcdma_free_bchan_resources(uc);
 	udma_free_tx_resources(uc);
@@ -5627,8 +5627,8 @@ static int udma_probe(struct platform_device *pdev)
 		if (!uc->name)
 			return -ENOMEM;
 		vchan_init(&uc->vc, &ud->ddev);
-		/* Use custom vchan completion handling */
-		tasklet_setup(&uc->vc.task, udma_vchan_complete);
+		/* Override the default vchan completion handler */
+		uc->vc.chan.bh_work_fn = udma_vchan_complete;
 		init_completion(&uc->teardown_completed);
 		INIT_DELAYED_WORK(&uc->tx_drain.work, udma_check_tx_completion);
 	}
-- 
2.43.0

