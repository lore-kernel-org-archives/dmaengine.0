Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985AA436370
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 18:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786385603; cv=none; b=kQZCoDEq45OUdQds4SwGu9rJNKxZ7OujL/TFWIsC52LRxmbCEnE7v1vXCTpGD06jHq+70oF4eMgSzsj2Gx0JaTqK9Dqa6BPeefLenuJFHX3thw/62kTpp2myDM2NL4YWCMVpjHGWd2T/5MOl+A8r6iyNljVS1uxQ7hSaWiP764w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786385603; c=relaxed/simple;
	bh=NS7zVADDIeH4+0PZ9vorAkwgPGmrV9A7bzuyDQWXZ3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JNog+S8rIrmO9ZErClWK+TBXFxqloxevEDjPvohf1Ih/wM483Ez5VbUje0qc8z9c8mhRX2EWcPdC1tw/wizsEt3/7rLMwh8wmHFmgspUkkX6IJqneMD5A7mDgB1fdlVpkrnynyBCs9xzCZ0GIOKTA2lw1fzkOQURWqcIL/zxhDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OmUq5x5r; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OmUq5x5r"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38511175ad3so2086449a91.2
        for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 11:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786385602; x=1786990402; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fg5NKedmOIsgVxQe+J4+vrtNJwQ8IkxdnAv9taWG/wA=;
        b=OmUq5x5r6Znm+dL0VYFD/iPjvlvqo/xA6UjK9z/TER2b86tf6LDYKa5qeylFFqNEm9
         jLyjyZw5lAc0DwDo6z37oAPmKV7Kkx24tPuhxkiBshtAmVEBRd4d1apbLNAGoZV7jKFs
         OtMZISNa5mB3dtN+Sg0MjnHAABn0aWYtdNdcK9E+q6I0me7Y6XtkAgmlQQpCO83Dmpla
         GZjeN32KjTD/5pNee3h60B7gUn0z/IfLLiedDTS/ku9A6kXSJkZq6KaBw1vhcYEIVWf8
         7X8C4pGjK53OGeMJLhMQMHUWdOqSPxmuH6WpcgihS0X0l0LzDyS3TzotTq0z1bF6Ib5z
         1few==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786385602; x=1786990402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fg5NKedmOIsgVxQe+J4+vrtNJwQ8IkxdnAv9taWG/wA=;
        b=XcKil8PblRUSaX1b3R6EGdMQEFG/M4W6WeFA8Mp/hY+gheA4CPz598gWjvtJnsj4OP
         RU0IZFR6Iy0Koe7oCk8sMM7EBWHk8WYfxx8CifFJ7fUMXbl5dqat098IGJiEskCNOKPE
         8IbRrroCkfQNsT2B0qaxEa455t5rYw+VCiulgjgLVJLrZ0LJXQ2VyZK44JaDV5YCxnVD
         4KoB9yd0IEepkfelc3xRTqyFVSy7e9qII4LGB1K+vmmeAPxbtuIbknsoXXkKlB1lpVah
         +qU149q/yisFdu7mkB8orXHjjuBHhUg4XeHC7QvwZqY0/pNPNebt0rCiwngVFF4vfSju
         40TA==
X-Forwarded-Encrypted: i=1; AHgh+RqW4vhCZcFNoZ2GNSwk/yvLh8yWtKuySutrWJ0vZxnTYdWqkE/FNP8QSTcbsRRshsattSZnXyjJWuw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRwupEjSHKlmnoqR73sGyu1SRedZ1mtK+a8AKMUUAC0KoIJ3CL
	G3WXbTq17xrhA9r2yIVN/hjOTwGrJ12o+kREt8tqPNWmeZTT1FUT2LYA1FM0SQ==
X-Gm-Gg: AR+sD10AyA8Olhl4ikm3KB3ngxglkERuBAa/B3SgHKCTdZbIA6lc8fGWEpI6AGayX22
	l/970i7e/rPyR69Fgf3Jw+lQ+Gc1SCmK0ExrRqNjyAaPwvUujowdEVtWo4fdx3CiP6bKu99I8vJ
	ImCHiHS60SOc3d3/Ax11onWNlxcSL6wLZtjcMGIRAMfBrmM+zinFcD46aMn7zhiu+vWMYdxLqJy
	Y3MfC3yteL4fxOZ9jh8FBqXihZa0owNoXQ0o0VWITLmw48RpB8AbeaABmhE8bLOJBKlFNBhXdB3
	PkJfjRVN+QndnvOV4+zfRpSMRzLJGwAJ5bWJ61IfwoE/1G6BrPjoJl/GTsLB9FAN8eq1/BfFu7X
	YU1lgFn3B54SSOYJ0k/vuxQAThRypsZZYrz70oc2dK/1RDY2Dpj1i4cQEmOyfjQVU5XZfNbV5NS
	Qi78iwX+VQTCebv6NJ6YTAWWkjx29BsgOM7yTAyZFJjvw0YdSagLW4up6JsPugFIc=
X-Received: by 2002:a17:90b:2549:b0:38e:1497:af5b with SMTP id 98e67ed59e1d1-392cc936bd6mr3450550a91.1.1786385601905;
        Mon, 10 Aug 2026 11:13:21 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fa9:fa00:b1a9:6513:83c6:1d23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d53b873asm472795a91.17.2026.08.10.11.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 11:13:21 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>
Subject: [PATCH v3 29/34] dmaengine: pl330: route callbacks via channel BH
Date: Mon, 10 Aug 2026 11:09:30 -0700
Message-ID: <98b9e66a1ac9f866f36ecc60d287e479bae22f60.1786384169.git.allen.lkml@gmail.com>
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

Convert the per-channel tasklet to dmaengine_*_bh while keeping the
controller tasklet for non-callback events.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/pl330.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
index 25ba84b18704..1b6069ba0d5e 100644
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
+	dmaengine_schedule_bh(&pch->chan);
 }
 
 static void pl330_dotask(struct tasklet_struct *t)
@@ -2060,14 +2057,15 @@ static inline void fill_queue(struct dma_pl330_chan *pch)
 			desc->status = DONE;
 			dev_err(pch->dmac->ddma.dev, "%s:%d Bad Desc(%d)\n",
 					__func__, __LINE__, desc->txd.cookie);
-			tasklet_schedule(&pch->task);
+			dmaengine_schedule_bh(&pch->chan);
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
+	dmaengine_init_bh(&pch->chan, pl330_tasklet);
 
 	spin_unlock_irqrestore(&pl330->lock, flags);
 
@@ -2354,7 +2352,7 @@ static void pl330_free_chan_resources(struct dma_chan *chan)
 	struct pl330_dmac *pl330 = pch->dmac;
 	unsigned long flags;
 
-	tasklet_kill(&pch->task);
+	dmaengine_kill_bh(&pch->chan);
 
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

