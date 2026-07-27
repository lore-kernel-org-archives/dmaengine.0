Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D16142DA45
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184374; cv=none; b=E11lsz9rP6b/JC5ajo142s6uv2nBkaphWXDURKdpPyTHWJ/cojx5zoQjaf/zQzb4lU7ahDfsGxTwEI7DsdyLXnsvYZptu7ebJqIK5sc3DShCcfSOvoX7d8rjl5Iv4dPxzdRZpN+/NsBl0Guykr93d/+DeTY0OQLbB1Wa8c5N+8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184374; c=relaxed/simple;
	bh=Pb/JmLn9bTnY2u0rx4iLLx3moYuo6oXzjxSUySe275s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gBNOrONX4mQl1sXiePlmUT5nshsUHv003TQqmm+j7m9iml835f8SvCncX6MxgztLzzgjZ1jTVCGIKyy0d/nR45FBYxEAdbqMRtpnN5H5JeHB+w/tCnxCM721/tBLy/6L1CfkpqaOKh7rXd+I+ChGV+Ulh0PXu1irXZlGGQYteDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ib4672q9; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ib4672q9"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2caced6038eso4716905ad.0
        for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 13:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184372; x=1785789172; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UbHxB/1RXJ0juq4Sto3pfn6HAeNtyngUAsGcfs6n0tA=;
        b=Ib4672q9ip7aBIm/QPHKh2p+lPspzBfZ5bNUA+vX0xG4KfrhnJH5kdLtlOaqBh9Upt
         OF09V4MTZBcpdb6XEju4hGUYNNMRmiHbdbP35t9L2PK6Os+pj0QYh9nCi+XDEV4RkYrV
         e+/T6X4zjdljh5OKel9Pm2m+8qyNeqetQTgFLNA+QEv2oCQdgYucdFQb1x3NVh59trcj
         ROBTXfm9drD6ZJ2GhKagxik16yn2P6zyFvxAJuS2Z+k1ONypzPttph2bmnO94lL25LNd
         Vcel7ZeGhIiutyeGxs5/ScSkG21T8cm2limMRcJYOpWwac1pIxRKR8yBtxaTNOXaKxYq
         H04g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184372; x=1785789172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UbHxB/1RXJ0juq4Sto3pfn6HAeNtyngUAsGcfs6n0tA=;
        b=nUsmcy9twHEFGCp5yhjeGGG3wXXZKztjdkV9ya1/OFSS5PIBzRC9yFiJ8kfflAJCpB
         moSk9tSSqd0mi1jEYk0Yn5lT5YISFcFOEbNwK6UTzmoC4uC+qkEv8QrhrgHRmduuFR6B
         LVmHi/aE1QiuF4ajqSSU/gCDceckZee3nzzaEC5dGggsiFPGb2ywnrEmlGwUpecaKk29
         FoK2rz326VR5CAHgRn9zq3Fz6oymYhfR5fCwUMIcG8gC7ilzmOpkllvYDJUvteXanXKU
         7mkF5asaJVHRGrCEi2/UjIzqii1omxR6BJCS4NatP89n5XJ8kh61MMubCupZutLbYImd
         kC6g==
X-Forwarded-Encrypted: i=1; AHgh+Rq1Q/dFaX+ggUSw7sqFoh1UqP9TQhAHZUt1SojaiQOt0Pha0Ux4qG2nYfMb3WjAD3JVd6FFxJPVQPc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOOUn2O1U+ehbRbUvZmOJYPf3xqyuZH8efJkal0hC5xjK/k6ld
	ojopL0iIbXqsvsdOieyj08O0Pbb0n3tuLYfi5Dpbg7hyZLqui3PAMJ6AIe3cfA==
X-Gm-Gg: AR+sD11eCzIb2SRLRIVOx64ql5gov67T4+NhYRJnMzOVzMVG6CI4JYS8oW3nY5DsZgZ
	MkAmMoyj2JwCneeOYGfOH7EMy2J6GqQXK0DLR9KrVUGLgn3RhIM0mmtQ6AQ/RPzZZtiThFtB2xv
	F02IUoI2ce22CV/wlgqtHa0V1LW9J/W5NTGCQSK7PKnV65rvCk+XfNsirnX8KbdOBL3mRGLPL2M
	L+H8HSloy6eb9yt/arvQwj6Dqo0WD+Y89S8iTQWQGxKzN86FvKwwp7SzR2/WMUU2ndpzwzDb0aq
	UL0DDH+0rQHPrdb/rJjI/BRukeQrLGF52KYIxYtSqYtXwD9IbUpkSwKBui8e7fc2RdivcRjOIP+
	ccAIF1GBqwazDDGlotvuMr5jghQE+xRd5nfxB18Z81Y/yPI6pza0Y/C8av49jw82frymsc7Mefu
	/DjAT5
X-Received: by 2002:a17:903:198e:b0:2c9:c517:d08b with SMTP id d9443c01a7336-2d0121e1e4fmr2290055ad.22.1785184372370;
        Mon, 27 Jul 2026 13:32:52 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde59b768sm41551805ad.4.2026.07.27.13.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:32:49 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>
Subject: [PATCH v2 26/64] dmaengine: mpc512x: route callbacks via channel BH
Date: Mon, 27 Jul 2026 13:28:54 -0700
Message-ID: <d2498dfc97d2b38d70ea4aee00126cfbf3b4dbb3.1785183549.git.allen.lkml@gmail.com>
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

Schedule per-channel BH work for completions and process callbacks there,
leaving the controller tasklet for IRQ/error handling.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/mpc512x_dma.c | 74 +++++++++++++++++++++++++--------------
 1 file changed, 47 insertions(+), 27 deletions(-)

diff --git a/drivers/dma/mpc512x_dma.c b/drivers/dma/mpc512x_dma.c
index 0adc8e01057e..552ea72a9108 100644
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
+			dma_chan_schedule_bh(&mchan->chan);
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
 
+	dma_chan_kill_bh(&mchan->chan);
+
 	spin_lock_irqsave(&mchan->lock, flags);
 
 	/* Channel must be idle */
@@ -1007,6 +1026,7 @@ static int mpc_dma_probe(struct platform_device *op)
 		INIT_LIST_HEAD(&mchan->completed);
 
 		spin_lock_init(&mchan->lock);
+		dma_chan_init_bh(&mchan->chan, mpc_dma_chan_bh);
 		list_add_tail(&mchan->chan.device_node, &dma->channels);
 	}
 
-- 
2.43.0

