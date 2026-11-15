Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794735202;
	b=fsOqRGJcyLgQi29BplFOURatag7o0zoTlYY0w48KVW79zw209TIoQA6N8I9V0Q+Qwmsf
	 EFflUevv8G3CO+Mff04MW/k3O9N1i/9KY/3gqc8hCvCZLPZ9Wbwujau76Xv2gSG2kfDO4
	 PaQXGGXB7fY/bXWGEM+MxIxTyHDHa0mqoR5VN3sA3qNr4hTyt3E91kFUFFLcJGFCIINLy
	 d+EQ4KnvYXqmJye9Xf6pd+he3Fg/4QAaSPfx4AuP6mdQ7ueUYFS8dUOYUOLSjRdWZOTw+
	 ivYHxhZvaqr6tkTYBxqm+6Xku+v091E3BmliqgNFw8FWY/zeT8/QyVZJLJb+fFo63gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794735202;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=NlQp3R8KuFLhV9wrXx8XG9nak7uXzaBTY2y9ltCW+Ec=;
	b=Gdy5GKgsHg75BptTZeV+UbfYUejHWbZykVuiCVIEDSwmj5fpk7TWORFtov7yoGJfm8jY
	 ylZd0rEl+O5YLRiQFd0Ll395ewy5uvLPCsBbiI4LWURV/byb+dPpAvj1y75hH7bUn4kkh
	 DvtXGNsUNvrpeBmGkeBXe9POYmrfbryBkn1EY6ceWyiE/QzGHolkCt1HqXBo6awAYICWT
	 RZZ7uRXKmVhvjCidwRMLSAhjDsqx14pT/oLdfUR/nCFehXKG7tpmPeNqTyxtosTL/4RYK
	 JdAXn3FM2VzAdHzmahYg8BzJpgzO5KzuMnG6cS4ef7rdlwd5ZCoQ8bT6q0HX/MB4yRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pSk1uQwr;
	arc=none smtp.remote-ip=209.85.161.44
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CB2606A8A5
	for <dmaengine@vger.kernel.org>; Sun, 15 Nov 2026 09:33:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94CB2606A8A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pSk1uQwr
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-703be215729so783891eaf.1
        for <dmaengine@vger.kernel.org>; Sun, 15 Nov 2026 01:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794735200; x=1795340000; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NlQp3R8KuFLhV9wrXx8XG9nak7uXzaBTY2y9ltCW+Ec=;
        b=pSk1uQwrQ9+IhZo3tVwwW4sDd0IXKsvXfiY9bYZPx1icGRAr2hZVNhxDr/iSSRozAq
         sHvbcYqEHglKucpIZsRdVhpcO77N2p6LNvN+MN8s5rf/ebFxAScYN+qtbKfGtDmAZTpC
         mJIYB9RQgATzVINQlzLXyDrO6u6vohBh5Ooylwy3KXGXLnugXIrEqdR5DDaryY4KBhvl
         XsCXpxMVPZpDJRe9uTm7aD5aprL4YgKeRKfdSByLHoEzQ8Nh+s366tkUBLsJWFnNguH5
         6Lmnq7Fjn7ieWnENvtT2DLXJYrnn6E8tJnSEXH7c+b+lvnFcqM71K0lJJ0FeNTv8xhAH
         9zgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794735200; x=1795340000;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NlQp3R8KuFLhV9wrXx8XG9nak7uXzaBTY2y9ltCW+Ec=;
        b=rqXBMRBH6EGxMZUmj92D0fWHlsvuaQ3hBrSYE9ERPztVKfF2T7TMt17sIjUT2IgirW
         4abbxCdqovoqDPielITw2qhMkYWfrnfDdT+LxGGq3LLFZm4zXupGjy1YnS+9/RMDwx5d
         rJs9+5o7341Xy5okYFA+4UGFTVcg+PU30oWKqcAF+TqCs89o+wsh1fTsUDuWQiGeeC6T
         CEjspgji+lF2s3REjiytSVYEqtcWHE+0FJvoNRDRZuDKkataWFr99m10SSQ5zQR56oCp
         xpz/xWke+drjSBOyqvqabLbjuSxFS2T8QZFdrCJKerL6BjHET3k4t97a77Ij2fbR5gDp
         207Q==
X-Forwarded-Encrypted: i=1; AL+hErEl5OVyqJZUhDz3545Gg+prXSiuR0Qus4hnXRePhXfV1NtfL44x+jmG+WmvWEbp7sf9nyl/TYK79RY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8yGvlqyH1V3sqgl5elY6+C3bKsV/ZFODXldz2h3TuhViMuZyVf
	q/5zpw67v3Y5TOGLl/suYbUcX7yQ4vpkp6876hIgrKIFr32TQUoBUl1D
X-Gm-Gg: AYBFou2ayXdOkM9wmz7tcFEyxjUkw5e/SjoNjdXXSMBr/Tc3eEExO7GrDcjdoscGjYd
	AYsGC1X0BIT2w+GOfvrabqSI2OK677SBmkjHgbq57t22X2CeiefGLrMPQGKNeZsAW+0wMjSGPFZ
	vc2OJigKisMPc8sDkZOPU4RZ5aO2hvqQbxc3ViNGQUQupOCHYi5Vv6+ANUEVOPtQCtDzVI60elM
	PPlBXmx8o8ZkaCgvBrNr5eBd1PuxekIJRPGEHh2R/76dA9MEMwOE7XVd9SDWio+D4FtPED2BCbw
	bAjQg1nnG2Bc4TbPkv39OGQOefTROgaHShsnloiBBoHbcDAmM1gjPU6FOTpazkl8ra3FGW7GXjH
	JuRhpWPrNcJComsCARJVD0bH5UJ5f0GcD8ETitaOON45spSIYnw8i5FUckFfTOi+iZQItKygKCZ
	bwgsonZOB7FJHwPA4SXX1VHucfXY8xp+H8sZufAJYyXM/Zt4d/ZpNhOo0aPrujzUxrxCDD8Gjt4
	gaMWp7iz3SjnBvc5RBbOpvVJeIdo9YAzQxkNWhcCYdEHSqVCLNwV+0yBM53Aa14Id6LCNLKusHp
	xg/J8TSIIc/c37k1yOm41KSkqdQ4EcHFpd1FRKBBqrJ4b1KmDm1hffaM7bGL1lZgU+vcghi1MUk
	J3OmiJ/vlkjVuixYFrwZ0AnKQD8PLFjZ5Tk/UCYf0DVhAl+BycNQ6ZF5OE5WPhW9+32KsKy8FG8
	KP6eE5wq1HGLux4CmfEfGwRDzf5XybQYl+B7QrvGE7ZKG9GVUbjzc=
X-Received: by 2002:a05:6820:a711:10b0:70e:1dd8:6713 with SMTP id 006d021491bc7-71ab51550camr2956017eaf.71.1794735200601;
        Sun, 15 Nov 2026 01:33:20 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab43347b9sm5933617eaf.12.2026.11.15.01.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:33:20 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 02:32:54 -0700
Subject: [PATCH v4 6/9] dmaengine: sun6i: retire interrupt state before
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
Message-Id: <20261115-submit-sun6i-dma-lifetime-next-v1-v4-6-043cd476a45f@gmail.com>
References: <20261115-submit-sun6i-dma-lifetime-next-v1-v4-0-043cd476a45f@gmail.com>
In-Reply-To: <20261115-submit-sun6i-dma-lifetime-next-v1-v4-0-043cd476a45f@gmail.com>
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
 James Hilliard <james.hilliard1@gmail.com>, Frank Li <Frank.Li@nxp.com>
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index c30e244e50ea..ab4474f0a8aa 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -503,6 +503,11 @@ static int sun6i_dma_start_desc(struct sun6i_vchan *vchan)
 	irq_reg = pchan->idx / sdev->cfg->num_channels_per_reg;
 	irq_offset = pchan->idx % sdev->cfg->num_channels_per_reg;
 
+	/* Do not deliver a previous transfer's interrupt to this descriptor. */
+	sun6i_write_irq_stat(sdev, irq_reg,
+			     (DMA_IRQ_HALF | DMA_IRQ_PKG | DMA_IRQ_QUEUE) <<
+			     (irq_offset * DMA_IRQ_CHAN_WIDTH));
+
 	vchan->irq_type = vchan->cyclic ? DMA_IRQ_PKG : DMA_IRQ_QUEUE;
 
 	irq_val = sun6i_read_irq_en(sdev, irq_reg);
@@ -975,6 +980,7 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(chan->device);
 	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
 	struct sun6i_pchan *pchan;
+	u32 irq_reg, irq_shift, irq_mask;
 	unsigned long flags;
 	LIST_HEAD(head);
 
@@ -996,6 +1002,14 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
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
@@ -1005,6 +1019,8 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 	spin_unlock_irqrestore(&sdev->lock, flags);
 
 	vchan_dma_desc_free_list(&vchan->vc, &head);
+	if (!atomic_read(&sdev->tasklet_shutdown))
+		tasklet_schedule(&sdev->task);
 
 	return 0;
 }

-- 
2.53.0

