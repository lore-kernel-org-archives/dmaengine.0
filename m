Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAB442BC35
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184383; cv=none; b=Tva3kdBJ1m0PbZomUZTtXbyqLPgHP9ultiWE+1yxFX51ZeNvEJ6UEw40KVey+JJmKXxaE3UJARHJaQAS6zBmXuMy5o33T+cGvawdltrKwcBWiGQKJYzdHVxKAma47VeNrF/WbE8S4MnUnyUJOG+ObV/ZcMiK4YkbUocnRSreOFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184383; c=relaxed/simple;
	bh=OkxpDyQ63m+V46aRfjIrSXchUPYHF8ldi0EciBaxCjM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y1/6FRNckXmiZJpHhv7uCOp6RK8s25Hh60GZArqdA5/NCP46nJy7V254g7yn/3f/v3C/l+3qhpa7FpE8GhuZ+jUmhnA7UP/fKnTjSg1TZ0WIfI4BcKjwjx6MHboVWbAyuRD4lpsQyK+zRc4qvT628Xnp6S7cBPM88LxbkdGU86Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L6Q5UGTM; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L6Q5UGTM"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2caea3f742bso38325435ad.0
        for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 13:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184382; x=1785789182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hqjCqMJEUGFa3ccm1OGMDSf5byzjSENws28lRdT9gkQ=;
        b=L6Q5UGTM9YuGCm1+PBoSym3n4nT+jEHME9LHVZtoV4FOKWe15VYUgic1sOlGdBLtWc
         J/pH3ehgS+hRGL+pYkxSZIS9vJ4siwZTjsiv0eLvu+eHcHmQeCG9rsD29SqmiJCwIqS6
         /9zTLRVUZqxo7WW47GcnI9cicDxPEe7ylPyOyG3zTFw2lCg0bBs0zxh2HyrJ8WtSdfZ0
         8jCVYI5IiD5aNR+73UabwjgLDLaLMfblmbRYIbJNCUHyq6lPu1tMWOX/4pp+oNor+E8f
         DVqMJUXLDn+oy/CF9czUYpHQFoyNMdY3mp51Nxb4x6GUxAKDnSf3AIJ3JZhBqVb46Z5G
         yj0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184382; x=1785789182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hqjCqMJEUGFa3ccm1OGMDSf5byzjSENws28lRdT9gkQ=;
        b=CBF3ebjt9lbtUrBaKfy6LKPXurSUHXAVH8bymjvDJ6t9Ek0Xca8BCjeV/+zpc9rE6O
         ivRdFRjhp4rSmdA7nfDbIEZngRN0CqHnVGFNW8oADVZs6EUqkGX8zUQYZNQWbUtBO+wh
         q9sFLZCaJ3VN8GzCKakX569phq0JWg62IHu0YXUWXew0wBs1wxTS+6GfyU6arrbP8UZq
         mw561HXMQyvDWnSeStbCpvrghv+3j6bjHfFMf2BKHwKEgGysvHVIVf2S53e9jEhQ+4xq
         Q8NnNPzwFnkNFsmxKdFklM6wHKn247mOXZIIaf4/GX23SW+SbSA0WEufeSAT5W0CaOGn
         bhZw==
X-Forwarded-Encrypted: i=1; AHgh+RoBw3wJ7aAn5/0JX9Rlz5t69QyJqjmNQQptFLztjJLAb6oVEo3IhosF2thZ/B9pubbQfNF0LHGt7k8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi53nCB7Rrjb6FZ9Fu80+NIocIYpGT6XAV0Q74DxZB2OqwiA/D
	BzHT7kMNLLl3kqylR+CnxGkNphAtUCaDAcqR+ApPJxAF9rQ9rDbuiNZV
X-Gm-Gg: AR+sD12Rnch7Ou2YUTBmIWjdTfnj2PKOLjkLJ8RsFxzMyJWV35ulNex6VZnJQV8nIFx
	KDIIYYaP2NnGiQ4UWSiccjzcqk7loOkU8pVtyKKpN1ySOfOT6Qh6jow4ejZ747Usk4nPguZUG+S
	rEI9LPxwcjh8Now7kytInhlD1uJiM49ZsC8yMNW0Sl523hYNO9Bi8NDUOItuEBtFIFV5JJMinkw
	Mo4M7KdEi58+if3AfQoSrQrtnu0tu3APz3vmIKhaExJXUmjXlEq70kwBhn7NaVdTXrH44dhjBNz
	zeHmhgyHDGKTsHZmMMcJjA4GcKUSOSHsLJy5faQsPkLu7LAsN6hmaMFWI+WI8f8p0LFYngK0Vkv
	RDUYVj47UruQyAJyRjd4uvGDUOHznI/uEgw7fojjcgi2XZ2JOM3YQS35ousLaQRa8XhemT3lsKz
	COri5p
X-Received: by 2002:a17:903:246:b0:2c9:a9c0:80b6 with SMTP id d9443c01a7336-2d00f3e0af2mr8180295ad.34.1785184382087;
        Mon, 27 Jul 2026 13:33:02 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde59b768sm41551805ad.4.2026.07.27.13.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:32:57 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Logan Gunthorpe <logang@deltatee.com>
Subject: [PATCH v2 28/64] dmaengine: plx_dma: use channel BH helpers
Date: Mon, 27 Jul 2026 13:28:56 -0700
Message-ID: <f2aa736ef2d9422717ab798cd38bcc405eefa94b.1785183549.git.allen.lkml@gmail.com>
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

Replace the device tasklet with the per-channel BH helper so completion
callbacks run via dma_chan_*_bh.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/plx_dma.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/plx_dma.c b/drivers/dma/plx_dma.c
index 84941a918b01..9d6bbdfa5a69 100644
--- a/drivers/dma/plx_dma.c
+++ b/drivers/dma/plx_dma.c
@@ -105,7 +105,6 @@ struct plx_dma_dev {
 	struct dma_chan dma_chan;
 	struct pci_dev __rcu *pdev;
 	void __iomem *bar;
-	struct tasklet_struct desc_task;
 
 	spinlock_t ring_lock;
 	bool ring_active;
@@ -241,9 +240,10 @@ static void plx_dma_stop(struct plx_dma_dev *plxdev)
 	rcu_read_unlock();
 }
 
-static void plx_dma_desc_task(struct tasklet_struct *t)
+static void plx_dma_desc_task(struct dma_chan *chan)
 {
-	struct plx_dma_dev *plxdev = from_tasklet(plxdev, t, desc_task);
+	struct plx_dma_dev *plxdev = container_of(chan, struct plx_dma_dev,
+						  dma_chan);
 
 	plx_dma_process_desc(plxdev);
 }
@@ -366,7 +366,7 @@ static irqreturn_t plx_dma_isr(int irq, void *devid)
 		return IRQ_NONE;
 
 	if (status & PLX_REG_INTR_STATUS_DESC_DONE && plxdev->ring_active)
-		tasklet_schedule(&plxdev->desc_task);
+		dma_chan_schedule_bh(&plxdev->dma_chan);
 
 	writew(status, plxdev->bar + PLX_REG_INTR_STATUS);
 
@@ -471,7 +471,7 @@ static void plx_dma_free_chan_resources(struct dma_chan *chan)
 	if (irq > 0)
 		synchronize_irq(irq);
 
-	tasklet_kill(&plxdev->desc_task);
+	dma_chan_kill_bh(&plxdev->dma_chan);
 
 	plx_dma_abort_desc(plxdev);
 
@@ -510,7 +510,7 @@ static int plx_dma_create(struct pci_dev *pdev)
 		goto free_plx;
 
 	spin_lock_init(&plxdev->ring_lock);
-	tasklet_setup(&plxdev->desc_task, plx_dma_desc_task);
+	dma_chan_init_bh(&plxdev->dma_chan, plx_dma_desc_task);
 
 	RCU_INIT_POINTER(plxdev->pdev, pdev);
 	plxdev->bar = pcim_iomap_table(pdev)[0];
-- 
2.43.0

