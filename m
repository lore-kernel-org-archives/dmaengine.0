Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FFB42DFE4
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184369; cv=none; b=HOCw3wR3UrJPMsZu+ZiYjV3FVV55KY8l3RhfGytbJk3TF4xLf2KpbINLYR6qaYxNVbfZTqox7CxlOui7GQtlWQCkAHnOL7SQyixRwpMiLScBMT1Y0c6pgcKr8vtp7kmfrzly3sG6xT6HpfV+Tc27OLv1QFySz0zu1vR32p6j1EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184369; c=relaxed/simple;
	bh=3UrbZ4bvULoxajBeowqPgddjA2o7YQL6VDRXZUSeb5U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SzDg4p9nduAGpsT7tvh2vJsVHKRolVGv0Hi8bfrnYBS+qSQklCcDMq9q9RZumB6/mAnLpfPsfHggKh1EBOR7FfdEmwDAGnKq02myVVGUpunGURwHhAf8LBskDxwWo51hEMvMCRK1SBL6+t3N5e4V9A+dgJH+R3Gbl9giRC013BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EzNDLZ1A; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EzNDLZ1A"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ceb096e675so38138935ad.0
        for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 13:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184368; x=1785789168; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=apCKdLn8A2EQvRwLEUDyfFHWe/yzsnfn4ASs2Z5nLWw=;
        b=EzNDLZ1AiRUvdaYsC+gyN1Q4gdVrYzNpJIbbbDc+Aa/7UJL4Hy9gysU0UI1IL700/9
         DoRhZz7oTrB3yvl3flK2nuBknj2VMtjUZq5wHRQvGLhLrGbwDBN4bGQUEczzhbk7FKmT
         eCrT8dxqYOdHeV1DySkMmKWmzthZdro8RfO4Wk/FCKrWyI0O6VqGrokpxneEtoiccyaa
         3ZAqT2IejrXAAbQc/aSA4G18xrB8fI1v8KXhiDM6OcaKysPT0OXcqhfyaW93WV/4yjQq
         DeF88v+AhAQfRrXJJekvtiGRaYFY5zv/rMhpCdxFyaMj6sirjlwB0Q320PNF6Xj5+uB6
         wt5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184368; x=1785789168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=apCKdLn8A2EQvRwLEUDyfFHWe/yzsnfn4ASs2Z5nLWw=;
        b=bE60VvRxGCmRlJ7yurkqNYrJSmco13mg5Z49HoifSk+HiX5NccJimnrVQEblRrykQN
         JVY+rBRMV5OErVZ27NS3PBcfLCztuJHNm8G8WwQhv5Im2bRqSkPGNsGkcdLyhuDaCKoU
         w8jfPzs264pHagdhl2/P+F6kKGLKxki+wsKCt2WCWLecNEzJwDsK2z7QXnlHZCdwdcYJ
         lThvlfGjBB8dx64MZjsGqO0danHcNCB2DdgY1EQ5fEmK4k0Es+T4Fy+UYSRgfKR9TANo
         MvIOQGuEEyFWfAu5vSjma1r9BVAnZgSGlpBPOYL1lghziR5ph5h1AO9zL68vKoLP7+67
         CVFQ==
X-Forwarded-Encrypted: i=1; AHgh+RocYGW4dDdaC3bztRKYB1ZMXdzpTHw/Zo8A1W2QcW4OP8Nh5rMtDFBiPPDnpM4PH1iDN+k7lqYfBAI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHEEJHXIvhyYT9a0W17/Voe78RjU9tUXJrqfT+bJfflEOBkYEi
	VpJ9QnG6c9WL580ZHbJNF4EEJ7vbi55JbdlcIZfzGPQZyibpvgHJDGZs
X-Gm-Gg: AR+sD12M+EIAbPN+EA/+RSRY63371RutzTKUHGOc2qTeZKU5FGDyglsqBl6WR47f1yU
	RelduD9soFbHxejKsi0SincnJ8xTSaTKYPGupX0e6R8CkjOV4y3NLMXjVSDT3wWe6aLS8Bkl5EN
	YHbiwDtnzzstz4m38am0orSL1uUabBiFB1A6s6EPZhE7JvOB3HCDb51gUwZZjJcxNoN6LYESs5i
	hO41wHR4iDibNmueGYdqnzgsg+H7MQzxxSDm91kfwQhl0jIhZvbdxCLg/QUOFst6TVGQ4hJbC8k
	upDh9dZ7armOMsf+y+WPi40ErqXLtiHmaxmXXjM/PUFUJjNrWJri3kUkQGTCuPN6ct+Bp6XIk8t
	vASIA48pjbDqIEkB/I4xekaiGegYvL13GncoAHUiha0NPkrw8EuhMp4ntWIwGfVPoZKXZGW5Q4w
	K+u14rz/UiTBK2elM=
X-Received: by 2002:a17:902:cf41:b0:2cc:76fd:6537 with SMTP id d9443c01a7336-2cfde78b739mr88236225ad.2.1785184367725;
        Mon, 27 Jul 2026 13:32:47 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde59b768sm41551805ad.4.2026.07.27.13.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:32:46 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>
Subject: [PATCH v2 25/64] dmaengine: mv_xor_v2: use channel BH helpers
Date: Mon, 27 Jul 2026 13:28:53 -0700
Message-ID: <64a4b1b008b641510416ee8ff13df3cca0b69314.1785183549.git.allen.lkml@gmail.com>
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

Replace the device tasklet with the per-channel BH helper so descriptor
callbacks run through dma_chan_*_bh.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/mv_xor_v2.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/dma/mv_xor_v2.c b/drivers/dma/mv_xor_v2.c
index cad4d4fb51ac..e5fa7a221d5b 100644
--- a/drivers/dma/mv_xor_v2.c
+++ b/drivers/dma/mv_xor_v2.c
@@ -139,7 +139,6 @@ struct mv_xor_v2_descriptor {
  * @reg_clk: reference to the 'reg' clock
  * @dma_base: memory mapped DMA register base
  * @glob_base: memory mapped global register base
- * @irq_tasklet: tasklet used for IRQ handling call-backs
  * @free_sw_desc: linked list of free SW descriptors
  * @dmadev: dma device
  * @dmachan: dma channel
@@ -158,7 +157,6 @@ struct mv_xor_v2_device {
 	void __iomem *glob_base;
 	struct clk *clk;
 	struct clk *reg_clk;
-	struct tasklet_struct irq_tasklet;
 	struct list_head free_sw_desc;
 	struct dma_device dmadev;
 	struct dma_chan	dmachan;
@@ -290,8 +288,8 @@ static irqreturn_t mv_xor_v2_interrupt_handler(int irq, void *data)
 	if (!ndescs)
 		return IRQ_NONE;
 
-	/* schedule a tasklet to handle descriptors callbacks */
-	tasklet_schedule(&xor_dev->irq_tasklet);
+	/* schedule a bottom half to handle descriptors callbacks */
+	dma_chan_schedule_bh(&xor_dev->dmachan);
 
 	return IRQ_HANDLED;
 }
@@ -346,8 +344,8 @@ mv_xor_v2_prep_sw_desc(struct mv_xor_v2_device *xor_dev)
 
 	if (list_empty(&xor_dev->free_sw_desc)) {
 		spin_unlock_bh(&xor_dev->lock);
-		/* schedule tasklet to free some descriptors */
-		tasklet_schedule(&xor_dev->irq_tasklet);
+		/* schedule bottom half to free some descriptors */
+		dma_chan_schedule_bh(&xor_dev->dmachan);
 		return NULL;
 	}
 
@@ -553,10 +551,10 @@ int mv_xor_v2_get_pending_params(struct mv_xor_v2_device *xor_dev,
 /*
  * handle the descriptors after HW process
  */
-static void mv_xor_v2_tasklet(struct tasklet_struct *t)
+static void mv_xor_v2_tasklet(struct dma_chan *chan)
 {
-	struct mv_xor_v2_device *xor_dev = from_tasklet(xor_dev, t,
-							irq_tasklet);
+	struct mv_xor_v2_device *xor_dev =
+		container_of(chan, struct mv_xor_v2_device, dmachan);
 	int pending_ptr, num_of_pending, i;
 	struct mv_xor_v2_sw_desc *next_pending_sw_desc = NULL;
 
@@ -760,7 +758,7 @@ static int mv_xor_v2_probe(struct platform_device *pdev)
 	if (ret)
 		goto free_msi_irqs;
 
-	tasklet_setup(&xor_dev->irq_tasklet, mv_xor_v2_tasklet);
+	dma_chan_init_bh(&xor_dev->dmachan, mv_xor_v2_tasklet);
 
 	xor_dev->desc_size = mv_xor_v2_set_desc_size(xor_dev);
 
@@ -869,7 +867,7 @@ static void mv_xor_v2_remove(struct platform_device *pdev)
 
 	platform_device_msi_free_irqs_all(&pdev->dev);
 
-	tasklet_kill(&xor_dev->irq_tasklet);
+	dma_chan_kill_bh(&xor_dev->dmachan);
 }
 
 #ifdef CONFIG_OF
-- 
2.43.0

