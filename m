Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646C542BE97
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184270; cv=none; b=PeebIQ7TXX8JcFyA2uEUWbFVaJi+gycjQx66aWBdgBi5NOucvvmpY5WrxeKOcHoQdiYm2t5p3nwG/L5uoibQN7nb/91Z/AboMy4jO4lha3OiSnGCEvvI7REvXSa9wHL/gfmCm6sG2L3XR9LARSx3XXiOIJBnT6AOsjcL2bBInIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184270; c=relaxed/simple;
	bh=oLkfYs0tq/lckQE0TRTX0GOH7OhXTYuSGY+4lbqd36o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d6/Ou+g28DQkDXJ+kACH2lRtaXnmyH4dl0Dmg5ukKUA3Y5liweVeOwkkLJQyaS6P0yc7ntssVNXZrEg/1Qj2hr0zVQl4BJUHARyMg0XlH72sjn1NaTJbsvmVGmcNvOFmyhRvCf451lIHQOHHTKUj+nCzmkqoC7bBgJkvGoE5QF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jC/u1dux; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jC/u1dux"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cf52d15d88so31918405ad.2
        for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 13:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184269; x=1785789069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n8T8TWTQyQ+SWBV2PlP1tfSh0YEULzmTov2IR/fRnoA=;
        b=jC/u1duxGH5mCQ22RDJqTODo/3Lz+pyfXRfHtHYu0u0ipODoaAKPLjWFZyqJevnIw+
         m69q9dwuclqZxvEUpYSd3Bu9gqTyfnXXW9mCtVpSxEMlG+4A0CZ/VQ2rANXGXD6sSDXF
         Na9PxGbho8s9sXQbCThsFRCV6iEXIwMmTcoli3h1VzZ77RQ+R/GhJL8GMPrgG626svrx
         SOh3Rx0S3gKzXB6aJcWl6aPj9Lcb3S2UFm72nTn50ufwvBpqXhJPEirSGISri2r05Wkc
         Gmi+vLaN3+pZWcpR6f9+pd38FA9Mbh350vUCnzzdQ9PSoRWQNqPXk8L/lxDqFe/Wv5Jc
         DpBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184269; x=1785789069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n8T8TWTQyQ+SWBV2PlP1tfSh0YEULzmTov2IR/fRnoA=;
        b=BhZFmWzN5mV8GlbOPKhxvk3ir/0AJYFhcAWEom2pybCl8OUYsS3f5qjq+o3i1eFTcX
         PX3PFMEnOeAmQxRokQ7j1c1i58zF7OJPOyxQliUBEEdKpFZor4n3mp9GuwQXUtM3UCe1
         txygBGPviXAsV+IpeBbErDVON43LbOGd6olZMn/4HL1aDl4dtA8bY0sA7OGaeKi4NDIF
         qmLteHdz76EBQqdHRoqCURIQkh8krAihfds9VIZiCvdzO9VaQQHCFe/tVYowqQXZOEr4
         QKPpFcGv27oW4AR618a03D0NOgK7KfHwQaU41dzbNJiZsuOoJVETnj6eBpfJ5WB5ZdAQ
         DB4Q==
X-Forwarded-Encrypted: i=1; AHgh+RoxIx1cgzCudxWL33TSmtRmkCNfDW2ODMcAtvEuOgxhlYvWHb/3ey6APgO5Ymws5ufateP/pupcqBc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRqXthr/DnNzAWrC74PcgT14qLGsIokxLYIPeZwIdaV0LN0c8j
	WTtLVAxiJS3KV8R2bLs8RCwk1lzHLYTktrT3X5qp/nK7+DkktlrT4Ioh
X-Gm-Gg: AR+sD10XfPO/ounUuKZHAaaD/yjGFSRX+xcS/gTAhlD2HCYxl7VnYjQJj9LSby+FB5C
	ZfaWWgADLHaHVbGrb1QgwI3sArOl+FIwRquKLKFF7FdwPbi2eTQ+wU6GPexZ4qgmEGvgjpKfL8Q
	0ucOYZ8audaPmxyxAfp9z6Jeqn8BDbofqZe2FitYxmZnWEVlTpCKVDj8Gmd/u3cyV3Qe0Bf/Z58
	aZwt2xBWxPnzltWi42122dhqm3VQOekq3H5bN8hslghTx7yklr7n/YZxCIB3F5JCArka7oe+Y+x
	5zNKASHPAeTAwTBLmCe8LH0lH+RE2MiHI10ZzUgqDiqMlP6UrOQEYKXYFZJ5I3fNfvY+MCe+m+m
	kFVCAGhtYepP/R4/TIGcvIfbmsG5N5azZFU9Hth+zZzvFIuepiwrmbCZC19qq7/IsF/73uSClYO
	/1oyJxX0R0AekrYKE=
X-Received: by 2002:a17:902:d2d2:b0:2c9:aae1:a61c with SMTP id d9443c01a7336-2cfde7af8b3mr89163145ad.20.1785184268669;
        Mon, 27 Jul 2026 13:31:08 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde59b768sm41551805ad.4.2026.07.27.13.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:31:08 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>
Subject: [PATCH v2 05/64] dmaengine: ep93xx: hook callbacks via dma_chan BH
Date: Mon, 27 Jul 2026 13:28:33 -0700
Message-ID: <5b4f1f6e674bd520c47cb058ba400bc033bd446b.1785183549.git.allen.lkml@gmail.com>
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
 drivers/dma/ep93xx_dma.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/ep93xx_dma.c b/drivers/dma/ep93xx_dma.c
index 311e55a97ba9..8f5200750fe9 100644
--- a/drivers/dma/ep93xx_dma.c
+++ b/drivers/dma/ep93xx_dma.c
@@ -167,7 +167,6 @@ struct ep93xx_dma_chan_cfg {
  * @dma_cfg: channel number, direction
  * @irq: interrupt number of the channel
  * @clk: clock used by this channel
- * @tasklet: channel specific tasklet used for callbacks
  * @lock: lock protecting the fields following
  * @flags: flags for the channel
  * @buffer: which buffer to use next (0/1)
@@ -196,7 +195,6 @@ struct ep93xx_dma_chan {
 	struct ep93xx_dma_chan_cfg	dma_cfg;
 	int				irq;
 	struct clk			*clk;
-	struct tasklet_struct		tasklet;
 	/* protects the fields following */
 	spinlock_t			lock;
 	unsigned long			flags;
@@ -801,9 +799,9 @@ static void ep93xx_dma_advance_work(struct ep93xx_dma_chan *edmac)
 	spin_unlock_irqrestore(&edmac->lock, flags);
 }
 
-static void ep93xx_dma_tasklet(struct tasklet_struct *t)
+static void ep93xx_dma_tasklet(struct dma_chan *chan)
 {
-	struct ep93xx_dma_chan *edmac = from_tasklet(edmac, t, tasklet);
+	struct ep93xx_dma_chan *edmac = to_ep93xx_dma_chan(chan);
 	struct ep93xx_dma_desc *desc, *d;
 	struct dmaengine_desc_callback cb;
 	LIST_HEAD(list);
@@ -858,12 +856,12 @@ static irqreturn_t ep93xx_dma_interrupt(int irq, void *dev_id)
 	switch (edmac->edma->hw_interrupt(edmac)) {
 	case INTERRUPT_DONE:
 		desc->complete = true;
-		tasklet_schedule(&edmac->tasklet);
+		dma_chan_schedule_bh(&edmac->chan);
 		break;
 
 	case INTERRUPT_NEXT_BUFFER:
 		if (test_bit(EP93XX_DMA_IS_CYCLIC, &edmac->flags))
-			tasklet_schedule(&edmac->tasklet);
+			dma_chan_schedule_bh(&edmac->chan);
 		break;
 
 	default:
@@ -1420,7 +1418,7 @@ static struct ep93xx_dma_engine *ep93xx_dma_of_probe(struct platform_device *pde
 		INIT_LIST_HEAD(&edmac->active);
 		INIT_LIST_HEAD(&edmac->queue);
 		INIT_LIST_HEAD(&edmac->free_list);
-		tasklet_setup(&edmac->tasklet, ep93xx_dma_tasklet);
+		dma_chan_init_bh(&edmac->chan, ep93xx_dma_tasklet);
 
 		list_add_tail(&edmac->chan.device_node,
 			      &dma_dev->channels);
-- 
2.43.0

