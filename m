Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792798722;
	b=Rko2qqw/4zmjhwbMm26z9PEcvPQXwmVz0pv9JJSVftMpRVt4aBaOnijnUuJd4vMGtvnf
	 4L0anpB+jBj1aTHH4cxwj89ACpcQE5x5OZTY059vug+Cd+ffTfzogGzGGEUqqaTp2gJ+A
	 X5a7ffbj4fUD+iJoHBV40rPM7j9X9r1DSu4itpp7CAcFjRz18zBsD33azRwjpS6eh+gef
	 0K5oWIOK37fU+L07HbpClCsOGC5SAcG4yJsWQQlwTtyY7MT7KcV1aQAHUzuZXGglZuUFH
	 sigZ996R8SLtl75bhjhM2DoFS38fqzhTmEvMXD2eTw9ttAYn0ZMY9W6xSFlm+U8Ffrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792798722;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=zkFWZrZqrOF0fJWX5siiys4KdKUOKCNqH6flFHqQFIY=;
	b=X7P6XgL8xXbB1Ga+yfczm4HyseXK9L99zweQBHX+RNzC0DdijXDap85oKTUSRiwTGWyJ
	 BvQOFHy6JS1xrhS0d/AkJ+mIVSsuYsRnzcYjdhSPmxSVxCzXZHLhI83SVNmEP5KvkPf7v
	 Cx7BNhNmmju3NKpbkP8azn953mYbGRz2Y8Q4Dx/QXA/tfiF/csLfBJyq862s/iR/KWnMJ
	 3YjVUr0yVAds4H/B5fSU37EbhAG/FhEk9nM/k1eiOvj87L47EMn+ZKFWR6YPjXIWIVQfG
	 mk3PDgfCMwnupyO/NPfBHAmVaBd0+tfxkVzMBTPivHn+lAOzPeB5vmYUheLG6a3sRQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LjndMgrL;
	arc=none smtp.remote-ip=209.85.161.52
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC95E60A2612
	for <dmaengine@vger.kernel.org>; Fri, 23 Oct 2026 23:38:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC95E60A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LjndMgrL
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6dd7070699eso992326eaf.3
        for <dmaengine@vger.kernel.org>; Fri, 23 Oct 2026 16:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792798721; x=1793403521; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zkFWZrZqrOF0fJWX5siiys4KdKUOKCNqH6flFHqQFIY=;
        b=LjndMgrLzw5Reh9tPtxf75MEcjNbZ12dALmdS996WEl0ejX/a2H3dh8ateDVBm0cNy
         ljtF5sVGIYCWQ8O1wBkhjAGFXe00ho4ZY23r3AFA+Z6JkyPH0/pAjvSd7yNHeIfPbGlz
         uhjn3bggvV8gKtEdQhm9NoO8YSkim8AJ4BiOViR5KaM5bpl1OYLtKlvvB/Cz42AzVD/b
         zj+R5bpYuIfJsKaIMxEZAV0A9WhP15e/i49AxRPD/K7ulMrZhlDNNBF9uYjubUmLcs3F
         UFOgcvBwCh935Y//kPHLwtuBVEPOdtEcsC3i+93D3nc+pXe0xb7gsvDCTaGDy5y0Q4J4
         rP8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792798721; x=1793403521;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zkFWZrZqrOF0fJWX5siiys4KdKUOKCNqH6flFHqQFIY=;
        b=HBI/m7keyxDm97/SSi1v+R/KfjL3M4ppKYhjOi7pFcchXXHjpj+9gm+lU2BmAypy7D
         JowvBhp5N/m9omAt/8Gn7kxCKiORKq7fqxxmNc9ClANrAaaAI9XeInUasyMrZALnxx8r
         ow7QxHdEqZ66InfVRrDhd+rnWtp9T/MttJqzdaCKnJcLDWhXyGIWUtTYFwJtJDDdFRDa
         m7be+W0WvKhtRSCO01E0C9ZvDDoi8k+l9KNUmXPDFCa7hmw66kNYy/Brra0lQl2gP9dq
         s1f9tZI8mBw8wLOtL7cCkvA2GnL85L+3qFooGDd0hEmZ77UI2HLrqCFzt3oZmrKmca3I
         MVoQ==
X-Forwarded-Encrypted: i=1; AKwUvByFt3dYKIhwtJFo/r2vwn6hYt7YBiad4G2czVIs3B6a03hXRPm3s4W4IKaQZOEBvdGYG8IBVUuwi9Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYISWI531OcBAMq1Wsjaedk5n+Fp+3JBgOh48haQTlifdXMTNhb8
	9js2Az6DzNcNzi4iR5IV/FebKzOSpryHO/YZZ1wBv9SNe9RvRcfnJ8DX
X-Gm-Gg: AYBFou1hMITKxpyMHv2Y2ioRRjSE269UUoILmfYgLiLz9YZuiRa93WaxG+unK5epKO+
	dtW44YfOOnpohGa2wPyDg5PLT68WKcfVaCr3qlTHqO8DRpfd+lbtoIraIoJWB07KUKpfUo0VnEI
	UdVilqAFtm+TlEJIbD922wcKu+fur9CRdsno4T9XIIAMyHdgzZPRjmEkdAUK/pbnF2I9GkG44Ab
	0RHfvZNRn8OE4ZlsI3ss5FbYgRmC7AKjdSI/XbRr5ZbUlDkKQKrK4YKcB7t/h/ZIoG6GYa7X1yU
	dtud0pDYM5AXv4qqrlWEq8U+G8Bib9Js3gHVfMT/nA+I+KlqU4BclZE0BhhTq+/YIg/eyhNJicH
	NvtJePw+1wetih9tqwmU92cY+YXn/+lKrCLYzWCyAEFDF9IwktC1fBBsIAbIiqYUZmZJiJwXW1f
	qjSTQxgy2dU/rU1ysEUD06Gtnx7K2QAr4wZhg2MK5BDWfU9eSr+tEMWu7uA83hu597EG/RqtR0Y
	gpZM2qYwGNox/XKe1X4I1hEK6orkfGQFhouFIHeOz0ri/abCMR3jT7xIvFt/ZXYph49xWmDdrUl
	0w+VOtihlvmiF2yelV4C3xh4goGCh7k3t9A2muOdLiZwGVG51BKwC//U2VemUzymVPAlnYGBAS3
	EnCrTvW2ZUR1mC8bJf1LBD03gac8raESf1HtG+eYPqHzlsfJ8OfLNiduS6yMwXG008c7ZQZisY0
	SawwQ=
X-Received: by 2002:a05:6820:7093:10b0:70b:8379:c145 with SMTP id 006d021491bc7-70ba0da0506mr162964eaf.28.1792798720713;
        Fri, 23 Oct 2026 16:38:40 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a843225d69sm284345fac.15.2026.10.23.16.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:38:40 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 17:38:25 -0600
Subject: [PATCH v3 6/9] dmaengine: sun6i: retire interrupt state before
 reusing physical channels
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-6-ef1acb0be768@gmail.com>
References: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-0-ef1acb0be768@gmail.com>
In-Reply-To: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-0-ef1acb0be768@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Arnd Bergmann <arnd@arndb.de>, 
 Maxime Ripard <mripard@kernel.org>, Jens Kuske <jenskuske@gmail.com>, 
 Jean-Francois Moine <moinejf@free.fr>
Cc: Hongling Zeng <zenghongling@kylinos.cn>, 
 Chengfeng Ye <cyeaa@connect.ust.hk>, 
 Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>, 
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Termination stops a physical channel and drops its owner without masking
or clearing its interrupt state. A completion latched by the old transfer
can therefore be delivered to a descriptor installed after reassignment.

Mask and acknowledge the stopped channel's interrupts before releasing
its ownership, and clear pending status before starting a new descriptor.
Keep these register updates under the same device lock used to sample and
acknowledge interrupts in the handler.

Schedule the allocator after termination so pending virtual channels can
use the released physical channel even when no further interrupt occurs.

Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 900bb629ba3b..dab17b3863fc 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -501,6 +501,11 @@ static int sun6i_dma_start_desc(struct sun6i_vchan *vchan)
 	irq_reg = pchan->idx / sdev->cfg->num_channels_per_reg;
 	irq_offset = pchan->idx % sdev->cfg->num_channels_per_reg;
 
+	/* Do not deliver a previous transfer's interrupt to this descriptor. */
+	sun6i_write_irq_stat(sdev, irq_reg,
+			     (DMA_IRQ_HALF | DMA_IRQ_PKG | DMA_IRQ_QUEUE) <<
+			     (irq_offset * DMA_IRQ_CHAN_WIDTH));
+
 	vchan->irq_type = vchan->cyclic ? DMA_IRQ_PKG : DMA_IRQ_QUEUE;
 
 	irq_val = sun6i_read_irq_en(sdev, irq_reg);
@@ -973,6 +978,7 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(chan->device);
 	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
 	struct sun6i_pchan *pchan;
+	u32 irq_reg, irq_shift, irq_mask;
 	unsigned long flags;
 	LIST_HEAD(head);
 
@@ -994,6 +1000,14 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 		writel(DMA_CHAN_ENABLE_STOP, pchan->base + DMA_CHAN_ENABLE);
 		writel(DMA_CHAN_PAUSE_RESUME, pchan->base + DMA_CHAN_PAUSE);
 
+		irq_reg = pchan->idx / sdev->cfg->num_channels_per_reg;
+		irq_shift = (pchan->idx % sdev->cfg->num_channels_per_reg) *
+			    DMA_IRQ_CHAN_WIDTH;
+		irq_mask = (DMA_IRQ_HALF | DMA_IRQ_PKG | DMA_IRQ_QUEUE) << irq_shift;
+		sun6i_write_irq_en(sdev, irq_reg,
+				   sun6i_read_irq_en(sdev, irq_reg) & ~irq_mask);
+		sun6i_write_irq_stat(sdev, irq_reg, irq_mask);
+
 		vchan->phy = NULL;
 		pchan->vchan = NULL;
 		pchan->desc = NULL;
@@ -1003,6 +1017,8 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 	spin_unlock_irqrestore(&sdev->lock, flags);
 
 	vchan_dma_desc_free_list(&vchan->vc, &head);
+	if (!atomic_read(&sdev->tasklet_shutdown))
+		tasklet_schedule(&sdev->task);
 
 	return 0;
 }

-- 
2.53.0

