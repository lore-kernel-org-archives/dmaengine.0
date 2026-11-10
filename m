Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316638;
	b=yvBlikb4X+jwH1dto7XwkUOw2ox76pWYXDAmiUCplq+J1RAqSNu62ZRfKbtHTaqOZt1K
	 FB6h6/X/gx5Ew809jNy2ZkOLYLFqzocI184P2tSLCie/3VMtsXVTF4D2UNAXESBEZoW89
	 N7x3M7ck54VZupNpz9uRpD5EkhuDyfIsd2IlA7NMdCxYsudeQr4txIISt+kl8yxMt9iQY
	 I00MOBSnOK4e8u4vM9X6q7R4ewaR91YY1hr9XOKl/G9PYGSa66yQu8rXsCBBDbFZndpUp
	 u7oKwJGJsauailcV5AyVguYxAa2kTPqYqaoUCAZl06cEns/zRLzE+755B7ZpKP5vZtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316638;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=r3wr6IHLy4V7+ZNBxFAJmCOSfBx7lTozRB+lQsmMRkc=;
	b=ca2UuOinoA9cz2ENfvpybwZm2N+doZ5ZAzhCbXXKn7Zs7xPFltTUkSJMbjFUNPg/FQRy
	 fluIwoumaqRD9ianSYDeEJ8ix1/mXOkchNnqyU5oe5nRPIM7VBzuoEFFmLW+TL4dKJeLQ
	 icodEhSms/1ADbRTaF79ETr9B2cDh/79bKr4z8g3ia+W+7u6vyqaULdgsr6peucCsyrAO
	 0eyYXIgov9wF2O82SJ20fDGvDFKR9CQhDT9biccS3nXMwbv7mhMqtZLfMwC8LSGRZK5g5
	 D9nP8nlorFQM482XyKNBNtTitE9jEBFyx8vu9RSxxnbr4yl00D8Stfsh8yv3YVSX0Hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iZxFUalg;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073D1606A76F
	for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 13:17:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 073D1606A76F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iZxFUalg
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cdb45e96d2bso782970a12.0
        for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 05:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316637; x=1794921437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r3wr6IHLy4V7+ZNBxFAJmCOSfBx7lTozRB+lQsmMRkc=;
        b=iZxFUalgzOBVwtWuMdphShtd6WjtgWG627EyNp9xyU4q2GHZ4d2IMiye4iaCvyW3xi
         pjbR43L3Z8aocTsO++ifSl9D1xwyC6BDkHMNb7iAweXlj1J8MzSH7I+DOZGuGXWC9nfY
         BYKAP+8qLPR6SURsGEOOOq3UTTeU95mCl06gI0tI8FsegUooZSfPfcQig5xKjePPVbzk
         MPXcNgm/tbX1wDpsVk3NC0wajrfLr6zbEdXdWOl5URWp4JKatnzaIf4/fbptYjaFNDw5
         rkzrWdlNKmOF+ss1WYPKwdJBuwktKJ9EIfG1QvammA6GWxBYr63S/36ZbFTSf+uEFq7c
         zJqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316637; x=1794921437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r3wr6IHLy4V7+ZNBxFAJmCOSfBx7lTozRB+lQsmMRkc=;
        b=sYtxuvVdbqlpW6SPPO4BDEqTsvOl0U47vPwnc1A/12YZP/+4lyRvBK9iPutp0lA1b/
         GNGIEouRolm2/K1BVFOjwgxDq3EkDnabrwve6P4t7syMgGSfyK3JKIfaAk/MLUVQKFUw
         lT6iHZPrV1Qz62cq3XkB1A74USOJes/BZz0ihSIsSyqAWPpo6wilNInnXtA8axB8H6eQ
         GaHSsx8F2K/6i2HBFzvwuR4hzKRH0Q//575ChAWg0gOPK53cmBhc3Cc09Z7kkHfzWSem
         9u/NldgNwPAChTM1wvvFw1vZBDq7MiAeZmRt9Mgv16xJHAJYugcJAo89q/Q61Usd0JDQ
         4yEg==
X-Forwarded-Encrypted: i=1; AL+hErGmFoOULh/7MfpIAnunOZ9+hKgbUIxmwBsAj28DQuE8VC/g7TCqFspSfrzW6ubDMKZcDPVkrLaevVw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Drdx9d+eP7AWDyrTqDeBUmQMQI5Idwr0QKolz58+SZroAbRVW
	m5ADcyXfoe34Kj9z44TgiNteu7GjH32AwuW2R3y0ISooSeD8PzShC7aC
X-Gm-Gg: AYBFou1Er4Ia1OeATUduv0hWsL9Ci4vwrXW0IlsioFvORDr1c7x7VDrdhsWoTHoeXYD
	fbNspKfN9kgdWG+sYJd+xVL3DR0mkDqYKcmeeNrI7+60DG3Wkwe85+5VCJAAOLbif1xs1788lBH
	3R9Iy/J2g0fYEVgvFOVGNYFRdJqffHB2a8xBqlxQ0MLx8+96YQgkIIyIuXciLu3ZSawyxTXlUO7
	11DJu/l+6HY3n7fqTXsc5CnetbYHXiLhI8ZJMwXjawbdUDFktYlZZOXHkX7bE3sw90j58wWZ6I0
	EKIHdAIbF1AElL6/amJLJulV+3uKZtxETBBcvrTtSNMgM35tSoKp1A0pV2YQN62oCHQ7Vfrd4Cm
	0/iCyWogvf/KQPVt2LdWQJWVxqq8+MluSOgqnn9yO80SDBjwFIPKgevABT7MQ2oxeXl1YfsQGNv
	NHM7spEQnHexFBDI0XM077IljO6N2M8tP5Heca7TyIF3o7n+8534e27zx8QPVRmEG59BVFU9qt1
	LpXSZ/dfgvrMnL2JT3/KVVI/4oBz0znh2ER4Hhzg4XjAUbMZaIO1RnAD16XFQVKkLMBBt6Hi071
	B7bHQhLcXhm/KabEDCtO22bCmYkR7hI=
X-Received: by 2002:a17:90b:55cd:b0:3a7:a463:54c2 with SMTP id 98e67ed59e1d1-3b166cb467fmr2693107a91.35.1794316637413;
        Tue, 10 Nov 2026 05:17:17 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:17:17 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>
Subject: [PATCH v4 26/33] dmaengine: mpc512x: route callbacks via channel BH
Date: Tue, 10 Nov 2026 05:13:26 -0800
Message-ID: <051bf57158a5c5ae82d0b7babeefd951c3ba85a7.1794315350.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794315350.git.allen.lkml@gmail.com>
References: <cover.1794315350.git.allen.lkml@gmail.com>
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Schedule per-channel BH work for completions and process callbacks there,
leaving the controller tasklet for IRQ/error handling.

Drain the per-channel BH work in mpc_dma_remove() after the controller
tasklet is killed, so no callback can run once the device memory is
released.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/mpc512x_dma.c | 78 +++++++++++++++++++++++++--------------
 1 file changed, 51 insertions(+), 27 deletions(-)

diff --git a/drivers/dma/mpc512x_dma.c b/drivers/dma/mpc512x_dma.c
index f67421f2d6d3..b6a1b3c94da4 100644
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
 
@@ -1088,6 +1108,7 @@ static void mpc_dma_remove(struct platform_device *op)
 {
 	struct device *dev = &op->dev;
 	struct mpc_dma *mdma = dev_get_drvdata(dev);
+	int i;
 
 	if (dev->of_node)
 		of_dma_controller_free(dev->of_node);
@@ -1099,6 +1120,9 @@ static void mpc_dma_remove(struct platform_device *op)
 	free_irq(mdma->irq, mdma);
 	irq_dispose_mapping(mdma->irq);
 	tasklet_kill(&mdma->tasklet);
+
+	for (i = 0; i < MPC_DMA_CHANNELS; i++)
+		dmaengine_kill_bh(&mdma->channels[i].chan);
 }
 
 static const struct of_device_id mpc_dma_match[] = {
-- 
2.43.0

