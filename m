Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD13E3B6C0E
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184569; cv=none; b=Uj2f1xEVAl7F5myBFj7LmtO3y6hZqSR9QEV1jYt/QPaoShVJmDqTHf/0ataDFqZxyBZKTqukWJ6JRWP9l9bRFukP95l2KVn0rSFB/4/YPlRNnD9Hhoj1QXSdKxSYk26WvYl73klueNuQUUmxLprPPhtph6u48jlk7VtjnbzwUjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184569; c=relaxed/simple;
	bh=rwpkv3U4oxlJnzkaiO4BXPV8Z4PCynKPn3PjP6Afv2I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AXOF5ImZ2ICRSPbieEqdLGpU0VVrcfILRZAN3K95BAMgO8OdV/JyhQX5O0h/KEMtNGn8KH4yOwbBXkgTwjHJtdczzC4C5BX0OwPw7FKO5rpE2SuUI3HFzAEPInbwLtkLwsqXrm/wvSOletBx5sxstDNZUjMFl0abuvfunw3S9bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=npnhAdUh; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="npnhAdUh"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cce6a0c9c3so36306455ad.1
        for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 13:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184567; x=1785789367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XalOy749noF7U/PkVHpodOoYcCuV0B+dPZogs4Uvtlo=;
        b=npnhAdUhhD3OYR9MEkqVESAzQhQoffNEmdkeTOq7UIQd+yTd2KzRmpO3UEPEkYpceO
         EzhNIcVDgWx1hAaUZtcpFG1q7QMW68ttRJXQqGdLfZE7gsn1VolzDXXln71BhLEwB3a7
         rNYiPm6+G+Y6bO21jkurucc4SCkbqgZ9Z6gEvWXyJcx5AREIVvArWE75PHXugEAiUL3r
         EyyU0TevVv7TcaO3lbFt6lvPepkJiZp/uVV22xHtFnYa5eMqvLJBbyc+XUg7luEh/jli
         q6/UvbOU5IpjIHpE/UQP4vyYG8ZopyVDVm7NApTdb4gDEw3a4Fpc0DNv+eyH6hX1E6dz
         Jk4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184567; x=1785789367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XalOy749noF7U/PkVHpodOoYcCuV0B+dPZogs4Uvtlo=;
        b=awQ7OGUIs+4d/k8RvSwWIMKRjviUDOY3ZqbH+c4ZiVjnZ2JmQ/fmJsquw9tdTLAzSJ
         CJriXzBPB0G650QUu+TWQobS10BQsoOttp9BE7EhjqcJqeUBTsCzFbchCinG3oMIwU4P
         xYXXn3kYxY/ETSzXdoKQ0e+oXwOId1+6cpt2TiES6l7DzB1bylxelLQaOmtH+3m9wXwk
         xSPxDjMnlj3VhN2NhtHCvGF1SLm5YfpSLfirVo9di6pRwko4NVZK+4B1shDznx8I9l8e
         KUwUKAvsH3YggwMODIvqITAa3iVuq3FqBxPWypM45aXvdmCptAP+nZ5jthwVpQmFBqup
         KjYw==
X-Forwarded-Encrypted: i=1; AHgh+Rp8xXE0W3W4qdflBOzp0W+0utqL2wiTWBkNmuXrkndTQR3k+GiT6wi/YN3I0/QXXudFiaZMnJxha7U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDlm+Uo9yGOIEWB2MGTyWUwWnC80SGD5HqGukgAwD1pCnCniME
	sV4YTxO8MzlIFzo/lMSrEYjG03dYhPfmx3Dvy86wre6C0JyQdmusWZQb
X-Gm-Gg: AR+sD12KOtQmJwk8tCtkPUDEBxqecZI1YCovZsHX8y3DOm6cyb9aXvjwJdNrXZutc7W
	r4v/lKwVU6iQrcBe5nv3MHyjCXVHLjGaGDdad9iLj9qB2vFbTDafZ+5d1FhT8DmPVTPFfKLU3N3
	MQ50OscgFHtdJwO9DbzQpA7Y4zRd62E1kknne497TTTUU2Fig6PTM/J/QNZ4HYd5JF4IQUAMvk8
	Vc4EaYEd41zixMiIWmSFlkA7iL7upKud8DNboKOAbvD7neJP8qg6ce7w+ri+vWch/aDZRAlcjFw
	SN0KZvRCSXXZ4ddJ1X7xRjEqLFZvhNBNW44iGxxgAflCGF/xaUgdAPx07u4+ywLhVhmTbVtcfXH
	AH2Jn8VJSeYkvdrRyl5gjuAVK4NmPXfZElfcJWBLRveeFqyKwitoHjoWLP9rmQUv3+s+u7/eOTB
	AxU1Un
X-Received: by 2002:a17:903:2c07:b0:2c2:bd7f:ccd4 with SMTP id d9443c01a7336-2d00f2fec60mr7113565ad.21.1785184567088;
        Mon, 27 Jul 2026 13:36:07 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde5c8337sm41681885ad.20.2026.07.27.13.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:36:06 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>
Subject: [PATCH v2 31/64] dmaengine: pl330: route callbacks via channel BH
Date: Mon, 27 Jul 2026 13:34:53 -0700
Message-ID: <6043500b5b32bf53eb0cfc4d68e82d5822ac8f60.1785183549.git.allen.lkml@gmail.com>
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
Message-ID: <20260727203453._r_QMJ-oiUvb_kmNOvQwcps8GhIF18RIt-GuusNbO8M@z>

Convert the per-channel tasklet to dma_chan_*_bh while keeping the
controller tasklet for non-callback events.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/pl330.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
index 25ba84b18704..f4940bd1ab84 100644
--- a/drivers/dma/pl330.c
+++ b/drivers/dma/pl330.c
@@ -417,9 +417,6 @@ enum desc_status {
 };
 
 struct dma_pl330_chan {
-	/* Schedule desc completion */
-	struct tasklet_struct task;
-
 	/* DMA-Engine Channel */
 	struct dma_chan chan;
 
@@ -1574,7 +1571,7 @@ static void dma_pl330_rqcb(struct dma_pl330_desc *desc, enum pl330_op_err err)
 
 	spin_unlock_irqrestore(&pch->lock, flags);
 
-	tasklet_schedule(&pch->task);
+	dma_chan_schedule_bh(&pch->chan);
 }
 
 static void pl330_dotask(struct tasklet_struct *t)
@@ -2060,14 +2057,15 @@ static inline void fill_queue(struct dma_pl330_chan *pch)
 			desc->status = DONE;
 			dev_err(pch->dmac->ddma.dev, "%s:%d Bad Desc(%d)\n",
 					__func__, __LINE__, desc->txd.cookie);
-			tasklet_schedule(&pch->task);
+			dma_chan_schedule_bh(&pch->chan);
 		}
 	}
 }
 
-static void pl330_tasklet(struct tasklet_struct *t)
+static void pl330_tasklet(struct dma_chan *chan)
 {
-	struct dma_pl330_chan *pch = from_tasklet(pch, t, task);
+	struct dma_pl330_chan *pch = container_of(chan, struct dma_pl330_chan,
+						  chan);
 	struct dma_pl330_desc *desc, *_dt;
 	unsigned long flags;
 	bool power_down = false;
@@ -2173,7 +2171,7 @@ static int pl330_alloc_chan_resources(struct dma_chan *chan)
 		return -ENOMEM;
 	}
 
-	tasklet_setup(&pch->task, pl330_tasklet);
+	dma_chan_init_bh(&pch->chan, pl330_tasklet);
 
 	spin_unlock_irqrestore(&pl330->lock, flags);
 
@@ -2354,7 +2352,7 @@ static void pl330_free_chan_resources(struct dma_chan *chan)
 	struct pl330_dmac *pl330 = pch->dmac;
 	unsigned long flags;
 
-	tasklet_kill(&pch->task);
+	dma_chan_kill_bh(&pch->chan);
 
 	pm_runtime_get_sync(pch->dmac->ddma.dev);
 	spin_lock_irqsave(&pl330->lock, flags);
@@ -2490,7 +2488,7 @@ static void pl330_issue_pending(struct dma_chan *chan)
 	list_splice_tail_init(&pch->submitted_list, &pch->work_list);
 	spin_unlock_irqrestore(&pch->lock, flags);
 
-	pl330_tasklet(&pch->task);
+	pl330_tasklet(&pch->chan);
 }
 
 /*
-- 
2.43.0

