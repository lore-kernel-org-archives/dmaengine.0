Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316604;
	b=gjICQ4PYhLLzNgjLXuQ4xVo705nmTYwlKor+EXHuYZ+ldBU9c/1bXtspcRA9BvWg5qi+
	 2cYLUQpGzqGUZB4Gf2M49Ud51NSBRW0NMhXABoXCtVixPvErsn4bRmu04NUF/kagRjhaD
	 Z/iKef1xkDRgsAhbrjM6CkU6OmBhQZ9ekfFA3YJBq56peZLUGOJOS9bjiVBe/O8HEJPtC
	 0Gt5L8fNLH0k/6ZUhk/rSUCAE3d64iaElg67JHM6T4O7hX1JBePmMwF0vL8YfRigqts0i
	 UQBIsILUnDc/3rtmci0wMmnqCYq6LA5LInN6ET0vW8T3tJs7d3FzKc6pEpw5HWLZpmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316604;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FrTi5WGJf6rYQ8TjZQMg59vPwm3N9TskdTdengcVrik=;
	b=2OW8IDRROr0CpNB8VUNoz4ZMZfDAOld3RIMOSF2TbeUBZuaF81iTXgNB5q8+dg1HdN3p
	 jaDIhY02sIhlyEhOn3GpXZbycUhTTmRCPLsDRxnSdnFLrgPYvYgNUmOlfSlaYc7ocr5Fk
	 JqtIziEH44t3s9ecA+QL3tOpvJjm7I8K6Xl++lq72xfUT9g+L6CmF5M2JzKCUEKHMT64L
	 QEUqvuzTirDKperUxef6wdFLRSmTjtIzewn0KZQRd10yExCIThKof8J/P7Iadfips+2MT
	 Y8BtqNga4PVlZpufizt8MJpRqSEKICyZaUaGEBikkoVdt1eFhGENh7Q5sU1OBuoqY8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eZdUYCif;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44067606A741
	for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 13:16:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44067606A741
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eZdUYCif
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc4c02ddd62so923758a12.0
        for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 05:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316604; x=1794921404; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FrTi5WGJf6rYQ8TjZQMg59vPwm3N9TskdTdengcVrik=;
        b=eZdUYCifsrv/B3bSCiKuMFzJuMoSNjobRc+uIamCit8kmZ4T3gfOUC7jyuRTff+TCH
         v6SZi6LeFf3RV9lYUlZ+GlSJHhKt9rE1w7iIOpSyMtchBzQncv2xQLbN8BB252mV0tWS
         Ef7bwNvhefoCaAGhZ9b5elPk+A49PSeKB7psfg3VHuiB9UU1okwM3ArcnGctcAKS2LDq
         /RXy0bSUHr6dSxU8RQOzJicLS07Uiy1Xjj38NitCI3HWLhOQy0vnpk40hjnAQ7hCYqtt
         SCnv6QBZUI/MRM6VT3clW9OQPCjT2lmhjSJyKE1mH3SI2Flu2Eh4aYbFw4ZyCP2e4LXb
         dUoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316604; x=1794921404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FrTi5WGJf6rYQ8TjZQMg59vPwm3N9TskdTdengcVrik=;
        b=OkT9nFlIgQc11yIMy5jftAeVtBZrxhQ+ygV5nh+AsXN8PCR75BKiDoOD1kEIVd5UOU
         0DRhKJgutkBSx4NOTIy54C/WcWIywCbhUPZbztuI0iMKAXN+FZE6rsmuEAK+OTdp92R/
         Jme3oUk4KgEDrYI40nZDqiN1l0DuejK9qPruiW7SNV/Kw6s+RYltfY+fDzbGp7UG8eGy
         ufvAvM+BmlMP+KNX5yyBO6/gpCb49NqqqIC5eciDsOKXtbZ14v7fFx3h5w796/i/zqkc
         opychtqdjJKSXZyuUsR/L6ISRa/iT/J8CHTmPx4YkSb2LqWk6ZLpDUXGTIs3j05QcWlL
         1nog==
X-Forwarded-Encrypted: i=1; AL+hErFUj2UUEyIoBzdYwueuAJTKcOkBG46xN7on1k0Vt52Xv+T5mOsbsyo8lkUsAQlHI+6gmPYjOYjhFag=@vger.kernel.org
X-Gm-Message-State: APuU4Z+yJHUvHO1Ap7oPVPnR/Fl4jcOhtLla5j/JNfZVa4OZc/kL+nu5
	o/8ePftG2xJ/ip5ceGcc35zr2lPNY52AihVJugsKiYpdS52/j7d/qoT9
X-Gm-Gg: AYBFou1Z0F7SxW4f1lcx7cLSaQt5oc8+teZwVFY3Twv20km12ochQEYEQUzYtAG144C
	/DxSYsxcBl/A7YdmgmpOQMb0M7BRkZ9zHsryBgwACqH1gNvLXELRTfESRUlErTGN4B3PQb4MJPc
	UIPE1fHKlcDBTyR3Jn62IFb2pVsqq7msfZEHWwz0FzjMfjkXeI8q8PV60lBFzwDxXO2GEx+2tIl
	PagLdfhpO0LxwJo1xNFlPOJN6nzTX365alGw2UsYw/28uavrr/KyImf4B5BVYtmbUEisHNx3ReM
	2eCl/izoOSsfhhXbjP0VbjnDHC3pBatfK3G+qq7vcmiXpwrvkmSymEiPErPoxR1IvKrCdmqWgq+
	WkezPs58ebB1DizdnWkfHQHL+QdZNtzkWxZVXomdai7OFj+MTH/IGFp9GT556FWR409JRi7ehro
	YXoeR90BntItsNqHRs118SqmZW7VXBavwpX5oLiLlLgmi4pYhO5O12Qp4t58O86Rq0hjhd1o9Ye
	FBsG/skCzy5rCjd4/yl/vXylh0+R1jV9/TkxuTb4og3NBerJJuYHIBIKgSB1sWCG+NKiCTz4tkP
	xlEGfbgHVPoxJQZAPP6tyU6HW27kwkI=
X-Received: by 2002:a17:90b:6c8:b0:3a0:b312:1fbe with SMTP id 98e67ed59e1d1-3b166cd84b0mr2754626a91.23.1794316603596;
        Tue, 10 Nov 2026 05:16:43 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:16:43 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>,
	Kees Cook <kees@kernel.org>
Subject: [PATCH v4 16/33] dmaengine: ppc4xx: replace irq tasklet with dmaengine BH
Date: Tue, 10 Nov 2026 05:13:16 -0800
Message-ID: <49664b6b5a0780454a3e9d2342275abfec7069ed.1794315350.git.allen.lkml@gmail.com>
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

Replace the per-channel tasklet with the shared dmaengine BH helper.
The handler continues to run in softirq context while dmaengine owns
the common scheduling and teardown mechanism.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/dma/ppc4xx/adma.c | 14 +++++++-------
 drivers/dma/ppc4xx/adma.h |  2 --
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/dma/ppc4xx/adma.c b/drivers/dma/ppc4xx/adma.c
index bcc54d584e2b..8fa36d72b145 100644
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
+	dmaengine_schedule_bh(&chan->common);
 	return NULL;
 }
 
@@ -3595,7 +3595,7 @@ static irqreturn_t ppc440spe_adma_eot_handler(int irq, void *data)
 	dev_dbg(chan->device->common.dev,
 		"ppc440spe adma%d: %s\n", chan->device->id, __func__);
 
-	tasklet_schedule(&chan->irq_tasklet);
+	dmaengine_schedule_bh(&chan->common);
 	ppc440spe_adma_device_clear_eot_status(chan);
 
 	return IRQ_HANDLED;
@@ -3612,7 +3612,7 @@ static irqreturn_t ppc440spe_adma_err_handler(int irq, void *data)
 	dev_dbg(chan->device->common.dev,
 		"ppc440spe adma%d: %s\n", chan->device->id, __func__);
 
-	tasklet_schedule(&chan->irq_tasklet);
+	dmaengine_schedule_bh(&chan->common);
 	ppc440spe_adma_device_clear_eot_status(chan);
 
 	return IRQ_HANDLED;
@@ -4137,7 +4137,7 @@ static int ppc440spe_adma_probe(struct platform_device *ofdev)
 	chan->common.device = &adev->common;
 	dma_cookie_init(&chan->common);
 	list_add_tail(&chan->common.device_node, &adev->common.channels);
-	tasklet_setup(&chan->irq_tasklet, ppc440spe_adma_tasklet);
+	dmaengine_init_bh(&chan->common, ppc440spe_adma_tasklet);
 
 	/* allocate and map helper pages for async validation or
 	 * async_mult/async_sum_product operations on DMA0/1.
@@ -4247,7 +4247,7 @@ static void ppc440spe_adma_remove(struct platform_device *ofdev)
 				 device_node) {
 		ppc440spe_chan = to_ppc440spe_adma_chan(chan);
 		ppc440spe_adma_release_irqs(adev, ppc440spe_chan);
-		tasklet_kill(&ppc440spe_chan->irq_tasklet);
+		dmaengine_kill_bh(&ppc440spe_chan->common);
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

