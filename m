Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66089422542
	for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 20:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184333; cv=none; b=fXJmo6q2bYRPCvMtSOYDxYFCs4z7/VepYhs/6J4QMLaE+SoPpYvJwvO3G18LtaXsv6I+e2JWt/BkHunfnhQ+o55SWsKlpT52xhILmCdAni4hsuRdBatYldMQE4mhzntZcuxt1hXWyRUon1l21vF/wHjvlvdb0SvQvcgEO61TWrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184333; c=relaxed/simple;
	bh=MV8Avm8ka+YBVXaP/wt8uDAB2cCba2ez37OgcoiN8No=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kDMXDVtK+IZicQd8R3L/WlN9d8G88NqNBfyy1QJot4CYir4YWVeA6VNSPOL9XKqfrR2Mk1YW28CJT0Kq3Y4gyvwY58nbZ0iM5be97QUn0lQypEEhkM50BrVhHs3I0KOYu7IYxq8pz8CwM3CUYtBdu0XSruYLjuq4nL5QqdTYcKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VoNsw0Ja; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VoNsw0Ja"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cf50c6f235so38250085ad.0
        for <dmaengine@vger.kernel.org>; Mon, 27 Jul 2026 13:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184332; x=1785789132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yBrpYduiDtcGvM1Dns+VuoauzKyu+0QgDFkK4uLnQ1Q=;
        b=VoNsw0JavptuSXlzxddYcWfJTEda5H4307ZsgScBPdL6HKZPAzTCEX4S2+wzySKG04
         KLDcs7j/hUyt7S4JLF+eRn1/wXq8iz1xTGcDNJ4WgZEBawmA7I+SFEOWIYQP+l95Xsno
         SkwAxhChaoGVC4vrLgOH1B9u5s7baFRKrlFhylnRNdqLA7y3o958PUf25e4Qt5KEdl4M
         ySXlzf6Uv9dbyoeh7SOGXIsqsaqHcIjuVxRDoIVvsE8xunsHjdvo7SfX2vpoxTtjxJId
         S5M+DFXmgAEAqRhNp95u4UZrO6+mRlReXTwVZSbBNSWBHrIYg3A6vRi8E7OBp/r5FH3j
         HVgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184332; x=1785789132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yBrpYduiDtcGvM1Dns+VuoauzKyu+0QgDFkK4uLnQ1Q=;
        b=fzwFM3CQ6lR6alX6zwfw70LKK3mWwr/vphR5fOfQk4Eik9ajpZrNYFHfr8eSk2kx2I
         dybPBzJY5ib8Ct5jAl26PFTMbocN+guMA2halZnPyNR9HhH3fJYbicBuuAeml75uOsuC
         INJqnQl6eCWAI4ppHn1L/W8c74IsFdckyHbnbDU8NGKUE0VJtqSnCMzCxNO4J7SzkdDp
         U8OGR0fjjmkt3t+FN9JHKdT9PodksTy6r/2vof+OkERLnBpO8sScLrGAceyAN6xPFNrY
         0Cc6z16T2T7AsYKSYIhkVUjiV+nsOLHjV8vMxzpz8dnBUa980dtR9N0y6/z46jN633fw
         rA9A==
X-Forwarded-Encrypted: i=1; AHgh+RoB30Ug8jVbCtPTezKH9/tu1Vr8THcJtSQfbWraZzm7bRZrgWMHZjuLl/HMH3zhqRyqUAOLJIW/b1s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ1pP/TBSD00F912uVqAMmUlE6PmMQtytZvt3d4cJYq4qgd/sE
	YTSoXFqaYBqCv+Z7ol7zYtdEPDg7m4NH0velTHwVTLhhH8JW69WIIBCH
X-Gm-Gg: AR+sD12tWdc3tPX/DohHjQjh9UvviPtEkqZP9+Jvz9d47ZnbvA4ZSxmBPj9f498zRdQ
	Jq8IHwLwlbf3Us7e1EwD323kkLyLT2DGxiOHe2KkrFUQMuu9WWQ2D4GqujAnTYbrlmCln+9PdRe
	96gAJo5aIyp4f4VuB1lIqvPahwGFA+6ChJBxf030prPzgtHmvTO7n7ovkOo80Jma4AdgwSkU7+M
	zW2TIJ5PF9b1ncsxF/+A120WxxF2g602S035y9bx7+hB5RBdx8kg+47h6Xzyd7mGreMVKq3oCxG
	f/gGpPxlVMtOMvaq6f0gMoqp4IRXOamOWYmhIifSDXTrt4J6jf2i+qv7n5HVldvChYYr45CR2JA
	7gM/6Ln7UhrCjUEQPNU+/rIrCr8GofQ1u7u+2++WlYSuqa3jC+qnhumTKd/ybXsLLViA0krM9lS
	0ZtZwA
X-Received: by 2002:a17:902:d492:b0:2cc:d192:50b5 with SMTP id d9443c01a7336-2d00f570b99mr6417935ad.34.1785184331513;
        Mon, 27 Jul 2026 13:32:11 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde59b768sm41551805ad.4.2026.07.27.13.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:32:10 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Colin Ian King <colin.i.king@gmail.com>
Subject: [PATCH v2 16/64] dmaengine: ppc4xx: replace irq tasklet with dma_chan BH
Date: Mon, 27 Jul 2026 13:28:44 -0700
Message-ID: <c2fa905ca405e0832085111ea534750e5cf90e28.1785183549.git.allen.lkml@gmail.com>
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
 drivers/dma/ppc4xx/adma.c | 14 +++++++-------
 drivers/dma/ppc4xx/adma.h |  2 --
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/dma/ppc4xx/adma.c b/drivers/dma/ppc4xx/adma.c
index 279a431ccae3..98cfd012ca5b 100644
--- a/drivers/dma/ppc4xx/adma.c
+++ b/drivers/dma/ppc4xx/adma.c
@@ -1658,9 +1658,9 @@ static void __ppc440spe_adma_slot_cleanup(struct ppc440spe_adma_chan *chan)
 /**
  * ppc440spe_adma_tasklet - clean up watch-dog initiator
  */
-static void ppc440spe_adma_tasklet(struct tasklet_struct *t)
+static void ppc440spe_adma_tasklet(struct dma_chan *c)
 {
-	struct ppc440spe_adma_chan *chan = from_tasklet(chan, t, irq_tasklet);
+	struct ppc440spe_adma_chan *chan = to_ppc440spe_adma_chan(c);
 
 	spin_lock_nested(&chan->lock, SINGLE_DEPTH_NESTING);
 	__ppc440spe_adma_slot_cleanup(chan);
@@ -1754,7 +1754,7 @@ static struct ppc440spe_adma_desc_slot *ppc440spe_adma_alloc_slots(
 		goto retry;
 
 	/* try to free some slots if the allocation fails */
-	tasklet_schedule(&chan->irq_tasklet);
+	dma_chan_schedule_bh(&chan->common);
 	return NULL;
 }
 
@@ -3595,7 +3595,7 @@ static irqreturn_t ppc440spe_adma_eot_handler(int irq, void *data)
 	dev_dbg(chan->device->common.dev,
 		"ppc440spe adma%d: %s\n", chan->device->id, __func__);
 
-	tasklet_schedule(&chan->irq_tasklet);
+	dma_chan_schedule_bh(&chan->common);
 	ppc440spe_adma_device_clear_eot_status(chan);
 
 	return IRQ_HANDLED;
@@ -3612,7 +3612,7 @@ static irqreturn_t ppc440spe_adma_err_handler(int irq, void *data)
 	dev_dbg(chan->device->common.dev,
 		"ppc440spe adma%d: %s\n", chan->device->id, __func__);
 
-	tasklet_schedule(&chan->irq_tasklet);
+	dma_chan_schedule_bh(&chan->common);
 	ppc440spe_adma_device_clear_eot_status(chan);
 
 	return IRQ_HANDLED;
@@ -4137,7 +4137,7 @@ static int ppc440spe_adma_probe(struct platform_device *ofdev)
 	chan->common.device = &adev->common;
 	dma_cookie_init(&chan->common);
 	list_add_tail(&chan->common.device_node, &adev->common.channels);
-	tasklet_setup(&chan->irq_tasklet, ppc440spe_adma_tasklet);
+	dma_chan_init_bh(&chan->common, ppc440spe_adma_tasklet);
 
 	/* allocate and map helper pages for async validation or
 	 * async_mult/async_sum_product operations on DMA0/1.
@@ -4247,7 +4247,7 @@ static void ppc440spe_adma_remove(struct platform_device *ofdev)
 				 device_node) {
 		ppc440spe_chan = to_ppc440spe_adma_chan(chan);
 		ppc440spe_adma_release_irqs(adev, ppc440spe_chan);
-		tasklet_kill(&ppc440spe_chan->irq_tasklet);
+		dma_chan_kill_bh(&ppc440spe_chan->common);
 		if (adev->id != PPC440SPE_XOR_ID) {
 			dma_unmap_page(&ofdev->dev, ppc440spe_chan->pdest,
 					PAGE_SIZE, DMA_BIDIRECTIONAL);
diff --git a/drivers/dma/ppc4xx/adma.h b/drivers/dma/ppc4xx/adma.h
index f8a5d7c1fb40..9af1feaf0b9a 100644
--- a/drivers/dma/ppc4xx/adma.h
+++ b/drivers/dma/ppc4xx/adma.h
@@ -80,7 +80,6 @@ struct ppc440spe_adma_device {
  * @pending: allows batching of hardware operations
  * @slots_allocated: records the actual size of the descriptor slot pool
  * @hw_chain_inited: h/w descriptor chain initialization flag
- * @irq_tasklet: bottom half where ppc440spe_adma_slot_cleanup runs
  * @needs_unmap: if buffers should not be unmapped upon final processing
  * @pdest_page: P destination page for async validate operation
  * @qdest_page: Q destination page for async validate operation
@@ -97,7 +96,6 @@ struct ppc440spe_adma_chan {
 	int pending;
 	int slots_allocated;
 	int hw_chain_inited;
-	struct tasklet_struct irq_tasklet;
 	u8 needs_unmap;
 	struct page *pdest_page;
 	struct page *qdest_page;
-- 
2.43.0

