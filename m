Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792780978;
	b=xCWECsO9+L1gmhl2nRv1tzZTuZyxC6LfgCVCyLIbsVS7BrILQ3pJW+IQLn0tu/ECHdrE
	 wnu9VPmW8opC0aSmykpLyO76andBylH32FmlNcpgBEgm0TWNUPzIABkAsJ8dPdpjmU+qF
	 pZM5al+BJTjrwecNzbDYWHAvZdElNEdO3UNhuB5Vd3/r3uIU0kqu9f/dJTMhOU5GblfqY
	 hRnn9gt5lAPdIpRzSB2VlVA+Sdhdawd7L7Li7mIA/Pm0H8zmi/kB6UuICaQDrkqb95Glx
	 EVdhSH7s53cHUSASwTQ302bTjsjn7FELQUtoIZGExF+IvGeKoYbVAErkGGFYUK/8Yzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792780978;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ajRh/8q3xGrAtR9/oKjXRIyuCbzBYMEpU+B4J/2GtKQ=;
	b=qyld0Rnhb9lLEe5OUh0ouzsPB72PYKaQTpC4g3HLKCwrY2/wbp0WIXimXAmRvwsO+sv5
	 ejT31J0TREDhbUx3NozAFCCiKDLwLGyk9Ov+epb9xRVLwcN7wL107cyArrNZTr4S5mT5Y
	 IEPGGBKaS5UoTK7iqwx82BmeNaCVTjhBiJiUPcAl49kyHXqKKQ7bY5nfJOMmkyTjXkpwP
	 J5FBLTq8SlK09qqm9qSv+ENe0awxpUBKRsVpBwNA4n4S5lsVJbieblzi5gat2oz3l8Z4s
	 ovchyxOVERUAhMkC2Ggzv99w+2KdwPBoaSTt3Jypln5KFbyc96F5odzH8Ry6wOV0MjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=m5q45f1v;
	arc=none smtp.remote-ip=209.85.167.170
Received: from mail-oi1-f170.google.com (unknown [209.85.167.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B5F60A2602
	for <dmaengine@vger.kernel.org>; Fri, 23 Oct 2026 18:42:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0B5F60A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=m5q45f1v
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-53a448f86e0so685664b6e.1
        for <dmaengine@vger.kernel.org>; Fri, 23 Oct 2026 11:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792780967; x=1793385767; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ajRh/8q3xGrAtR9/oKjXRIyuCbzBYMEpU+B4J/2GtKQ=;
        b=m5q45f1v5DP0jtIwYaZHYLoh0jUH5JdNujBkvMMnRlSB50KzhPoelX5P11fZGD1Vc7
         f4yMFWp7qmoxxxh9Uj/Pq5wQtzN4RDfiYcWrhieOFGjZwV2nP2RQRPz0hmFIxcbxqzBz
         ZRYC5y7K3EdPi+bbTeK3qmaKl6/0YNXDm/BNxIKZuSVHtjAylCj0bgB+zOdWqV3HDrPC
         /8Xw6/4W2ySmC9t1okfO2BLkSNZ74zrZGYa5V4tHquInURFMCMXbksCUIVrP9R4ruiyl
         yDZt1MtTPF8om9HSr8hTErkfWmb82GtrzUuoMzHgcx1Ni5uEg2CzyHAWR3RRqn1asj66
         qN3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792780967; x=1793385767;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ajRh/8q3xGrAtR9/oKjXRIyuCbzBYMEpU+B4J/2GtKQ=;
        b=v63bTGM9enle0G9meUAfpyJjkljeoJUMv04SxditxqL0A4ROXIrpuQ9eBeir8D852E
         5JAO15yrJJIj15IKF1hfdTuzm5QfZSTtHQWHkGSA38znKV6w1rY1YUSsXckNZcf8eh4i
         3qqtipDnjTmhvNRJDeM/mH/NXVZI0QHz6ZQjMmkqnd+rs8jhZKrnR10HR65TTPicoLEq
         xrFXmBvkUqCtdtxihdDPcNpOqe65fewSZU7xIiOY0GMUU089NGhLv4fdy3Vi7N9DAp1j
         qrtJHNPQ+MIdHGEXlX84LGhK/j+HEvn3iYddOIn1QgaRr4b5PK4o8UU/TdBIBvcsXXbQ
         I+YA==
X-Forwarded-Encrypted: i=1; AKwUvBxQyEkgnhWent6hMo18E7k+FEkJlRmy8nh8e4VGU7dhHu0x1+098dXAhWaBNx1EAyxV2Z8UPVdyYwA=@vger.kernel.org
X-Gm-Message-State: AFq9FYI7GMR2fajNAD/PK2WLncuzsJXbhls0V2/MweuxAtvYjRFBmlQH
	6EXsw2iRDTH0f38GynUHk8cRFxEcWennyegp8OaVlkLwWbyC43ONlFZq
X-Gm-Gg: AYBFou0P2Op+Khl0Ffvhjf4PWgcKKivLWC5tAiuCoyjoDsL/3hOaQ2KmHI6fEcCs6kA
	gVuHmWEYTvhrvnPbGF6zQHMAWb9EDwwsfDdFmtgPOVHrDomGMpbDSZnlr2LarZK50irvK5lnHEX
	7JbzsdowEpOaouX3cruZX1qJBkleTbpADxvo05woG98iMM5CoNPBSnxb1EIgqEX96tVdv6ag+Vm
	JrYwEW/1XBQa8RprHNq7xghEzbHOJA+/AO2IH2515K+azaM5pLqcaGmw0WNhHokoQ5OaBKffNL2
	IAqznOf7UEjbjcMQ+CTW43TOazonHFHd3ab6vvr3U5MTm5sspqCHLL3UIbMEE8GyqmDMhuH5Roa
	ihc3F2/N/vYD+aRNsdkZgpVC9wG35h/35OV5fy/RFRLOMhU6eUSCul6WfLxX6fPSVbeSe5lPh75
	nteySd5qEOAgmZCF40kwURKDEjhuH6WMkHKLC2jNVtiVg5p+iGAqVGfR5nXVadOZprtGLkvVTdv
	dxk1Pd5YqEuMHf44Cgeb8QAhUK4RrOcF9MrxvZnNT2ytP+EpxaQ8hsqBCqknSH7tgCtJUUjJ9Gt
	xQP9pFYH/zYh01rRNxsb5RmkXRw6lDxQEFtuqQUqhXMDTpg/UrDWmWp8uDR58TQ9AdFvciRulY0
	s0gvFFguKQSd62J+zuhRPRXztauBn3DnquDPtCALb3JEUMTkkFkTxMAoEUpAGnW4F1CF/4eQoNX
	z8UTj46PovqrEVjn/2ilY5ChgO
X-Received: by 2002:a05:6808:198d:b0:4f3:68d6:f0dd with SMTP id 5614622812f47-55c002f88b2mr60849b6e.38.1792780966700;
        Fri, 23 Oct 2026 11:42:46 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55bfe199544sm336682b6e.13.2026.10.23.11.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 11:42:46 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 12:42:37 -0600
Subject: [PATCH v2 3/6] dmaengine: sun6i: serialize channel reassignment
 with interrupt handling
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
Message-Id: <20261023-submit-sun6i-dma-lifetime-next-v1-v2-3-c9e07cc44bf8@gmail.com>
References: <20261023-submit-sun6i-dma-lifetime-next-v1-v2-0-c9e07cc44bf8@gmail.com>
In-Reply-To: <20261023-submit-sun6i-dma-lifetime-next-v1-v2-0-c9e07cc44bf8@gmail.com>
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
 James Hilliard <james.hilliard1@gmail.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2

The allocator changes vchan->phy and pchan->vchan under sdev->lock, but
termination reads the physical channel before taking either lock. The IRQ
handler also takes an owner snapshot without protecting it. Termination
can therefore miss a new assignment or detach an owner while an interrupt
is about to complete its descriptor. An IRQ status snapshot can survive
reassignment and be applied to the next transfer.

Use sdev->lock for physical-channel ownership, pending channels and the
shared interrupt registers, nesting vc.lock inside it for descriptor
lists and cookie updates. Allocate and start each pending channel in one
critical section. Read and acknowledge IRQ status under the same outer
lock, and protect cyclic notifications as well as ordinary completions.

Clear the active descriptor pointer before publishing finite completion
to virt-dma, whose tasklet may free it independently of the allocator.
An assigned channel without an active descriptor is ready for the
allocator to start its next transfer or release it. This replaces the
completed-descriptor pointer and keeps residue queries and termination
from consulting a descriptor already handed to virt-dma.

Mask and clear a stopped channel's IRQs before releasing its ownership,
and clear pending status before starting a new descriptor. Schedule the
allocator after termination so other pending channels can use the released
physical channel without depending on another device interrupt.

This also keeps process-context acquisitions IRQ-safe. Client callbacks
remain outside these locks in the virtual-channel completion tasklet.

Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/20260706065650.34B131F00A3A@smtp.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 124 ++++++++++++++++++++++++++----------------------
 1 file changed, 66 insertions(+), 58 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 0a9645171180..a21acb9ecc27 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -198,7 +198,6 @@ struct sun6i_pchan {
 	void __iomem		*base;
 	struct sun6i_vchan	*vchan;
 	struct sun6i_desc	*desc;
-	struct sun6i_desc	*done;
 };
 
 struct sun6i_vchan {
@@ -217,6 +216,7 @@ struct sun6i_dma_dev {
 	struct clk		*clk;
 	struct clk		*clk_mbus;
 	int			irq;
+	/* Channel assignment and register access; nests outside vc.lock. */
 	spinlock_t		lock;
 	struct reset_control	*rstc;
 	struct tasklet_struct	task;
@@ -486,22 +486,23 @@ static int sun6i_dma_start_desc(struct sun6i_vchan *vchan)
 	if (!pchan)
 		return -EAGAIN;
 
-	if (!desc) {
-		pchan->desc = NULL;
-		pchan->done = NULL;
+	if (!desc)
 		return -EAGAIN;
-	}
 
 	list_del(&desc->node);
 
 	pchan->desc = to_sun6i_desc(&desc->tx);
-	pchan->done = NULL;
 
 	sun6i_dma_dump_lli(vchan, pchan->desc->v_lli, pchan->desc->p_lli);
 
 	irq_reg = pchan->idx / sdev->cfg->num_channels_per_reg;
 	irq_offset = pchan->idx % sdev->cfg->num_channels_per_reg;
 
+	/* Do not deliver a previous transfer's interrupt to this descriptor. */
+	sun6i_write_irq_stat(sdev, irq_reg,
+			     (DMA_IRQ_HALF | DMA_IRQ_PKG | DMA_IRQ_QUEUE) <<
+			     (irq_offset * DMA_IRQ_CHAN_WIDTH));
+
 	vchan->irq_type = vchan->cyclic ? DMA_IRQ_PKG : DMA_IRQ_QUEUE;
 
 	irq_val = sun6i_read_irq_en(sdev, irq_reg);
@@ -524,15 +525,15 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
 	struct sun6i_dma_dev *sdev = from_tasklet(sdev, t, task);
 	struct sun6i_vchan *vchan;
 	struct sun6i_pchan *pchan;
-	unsigned int pchan_alloc = 0;
 	unsigned int pchan_idx;
 
+	spin_lock_irq(&sdev->lock);
 	list_for_each_entry(vchan, &sdev->slave.channels, vc.chan.device_node) {
-		spin_lock_irq(&vchan->vc.lock);
+		spin_lock(&vchan->vc.lock);
 
 		pchan = vchan->phy;
 
-		if (pchan && pchan->done) {
+		if (pchan && !pchan->desc) {
 			if (sun6i_dma_start_desc(vchan)) {
 				/*
 				 * No current txd associated with this channel
@@ -545,10 +546,9 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
 				pchan->vchan = NULL;
 			}
 		}
-		spin_unlock_irq(&vchan->vc.lock);
+		spin_unlock(&vchan->vc.lock);
 	}
 
-	spin_lock_irq(&sdev->lock);
 	for (pchan_idx = 0; pchan_idx < sdev->num_pchans; pchan_idx++) {
 		pchan = &sdev->pchans[pchan_idx];
 
@@ -557,31 +557,20 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
 
 		vchan = list_first_entry(&sdev->pending,
 					 struct sun6i_vchan, node);
+		spin_lock(&vchan->vc.lock);
 
 		/* Remove from pending channels */
 		list_del_init(&vchan->node);
-		pchan_alloc |= BIT(pchan_idx);
 
 		/* Mark this channel allocated */
 		pchan->vchan = vchan;
 		vchan->phy = pchan;
 		dev_dbg(sdev->slave.dev, "pchan %u: alloc vchan %p\n",
 			pchan->idx, &vchan->vc);
+		sun6i_dma_start_desc(vchan);
+		spin_unlock(&vchan->vc.lock);
 	}
 	spin_unlock_irq(&sdev->lock);
-
-	for (pchan_idx = 0; pchan_idx < sdev->num_pchans; pchan_idx++) {
-		if (!(pchan_alloc & BIT(pchan_idx)))
-			continue;
-
-		pchan = sdev->pchans + pchan_idx;
-		vchan = pchan->vchan;
-		if (vchan) {
-			spin_lock_irq(&vchan->vc.lock);
-			sun6i_dma_start_desc(vchan);
-			spin_unlock_irq(&vchan->vc.lock);
-		}
-	}
 }
 
 static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
@@ -590,9 +579,12 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 	u32 channels_per_reg = sdev->cfg->num_channels_per_reg;
 	struct sun6i_vchan *vchan;
 	struct sun6i_pchan *pchan;
+	struct sun6i_desc *desc;
+	unsigned long flags;
 	int i, j, ret = IRQ_NONE;
 	u32 status;
 
+	spin_lock_irqsave(&sdev->lock, flags);
 	for (i = 0; i < DIV_ROUND_UP(sdev->num_pchans, channels_per_reg); i++) {
 		status = sun6i_read_irq_stat(sdev, i);
 		if (!status)
@@ -607,15 +599,17 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 		     i * channels_per_reg + j < sdev->num_pchans && status; j++) {
 			pchan = sdev->pchans + i * channels_per_reg + j;
 			vchan = pchan->vchan;
-			if (vchan && (status & vchan->irq_type)) {
+			desc = pchan->desc;
+			if (vchan && desc && (status & vchan->irq_type)) {
+				spin_lock(&vchan->vc.lock);
 				if (vchan->cyclic) {
-					vchan_cyclic_callback(&pchan->desc->vd);
+					vchan_cyclic_callback(&desc->vd);
 				} else {
-					spin_lock(&vchan->vc.lock);
-					vchan_cookie_complete(&pchan->desc->vd);
-					pchan->done = pchan->desc;
-					spin_unlock(&vchan->vc.lock);
+					/* Completion transfers ownership to virt-dma. */
+					pchan->desc = NULL;
+					vchan_cookie_complete(&desc->vd);
 				}
+				spin_unlock(&vchan->vc.lock);
 			}
 
 			status = status >> DMA_IRQ_CHAN_WIDTH;
@@ -625,6 +619,7 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 			tasklet_schedule(&sdev->task);
 		ret = IRQ_HANDLED;
 	}
+	spin_unlock_irqrestore(&sdev->lock, flags);
 
 	return ret;
 }
@@ -931,19 +926,20 @@ static int sun6i_dma_pause(struct dma_chan *chan)
 {
 	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(chan->device);
 	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
-	struct sun6i_pchan *pchan = vchan->phy;
+	struct sun6i_pchan *pchan;
 	unsigned long flags;
 
 	dev_dbg(dmaengine_chan_dev(chan), "vchan %p: pause\n", &vchan->vc);
 
+	spin_lock_irqsave(&sdev->lock, flags);
+	pchan = vchan->phy;
 	if (pchan) {
 		writel(DMA_CHAN_PAUSE_PAUSE,
 		       pchan->base + DMA_CHAN_PAUSE);
 	} else {
-		spin_lock_irqsave(&sdev->lock, flags);
 		list_del_init(&vchan->node);
-		spin_unlock_irqrestore(&sdev->lock, flags);
 	}
+	spin_unlock_irqrestore(&sdev->lock, flags);
 
 	return 0;
 }
@@ -952,23 +948,24 @@ static int sun6i_dma_resume(struct dma_chan *chan)
 {
 	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(chan->device);
 	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
-	struct sun6i_pchan *pchan = vchan->phy;
+	struct sun6i_pchan *pchan;
 	unsigned long flags;
 
 	dev_dbg(dmaengine_chan_dev(chan), "vchan %p: resume\n", &vchan->vc);
 
-	spin_lock_irqsave(&vchan->vc.lock, flags);
+	spin_lock_irqsave(&sdev->lock, flags);
+	spin_lock(&vchan->vc.lock);
+	pchan = vchan->phy;
 
 	if (pchan) {
 		writel(DMA_CHAN_PAUSE_RESUME,
 		       pchan->base + DMA_CHAN_PAUSE);
 	} else if (!list_empty(&vchan->vc.desc_issued)) {
-		spin_lock(&sdev->lock);
 		list_add_tail(&vchan->node, &sdev->pending);
-		spin_unlock(&sdev->lock);
 	}
 
-	spin_unlock_irqrestore(&vchan->vc.lock, flags);
+	spin_unlock(&vchan->vc.lock);
+	spin_unlock_irqrestore(&sdev->lock, flags);
 
 	return 0;
 }
@@ -977,17 +974,17 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 {
 	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(chan->device);
 	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
-	struct sun6i_pchan *pchan = vchan->phy;
+	struct sun6i_pchan *pchan;
+	u32 irq_reg, irq_shift, irq_mask;
 	unsigned long flags;
 	LIST_HEAD(head);
 
 	spin_lock_irqsave(&sdev->lock, flags);
+	spin_lock(&vchan->vc.lock);
+	pchan = vchan->phy;
 	list_del_init(&vchan->node);
-	spin_unlock_irqrestore(&sdev->lock, flags);
 
-	spin_lock_irqsave(&vchan->vc.lock, flags);
-
-	if (pchan && pchan->desc && pchan->desc != pchan->done) {
+	if (pchan && pchan->desc) {
 		struct virt_dma_desc *vd = &pchan->desc->vd;
 
 		vchan_terminate_vdesc(vd);
@@ -1000,15 +997,25 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
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
-		pchan->done = NULL;
 	}
 
-	spin_unlock_irqrestore(&vchan->vc.lock, flags);
+	spin_unlock(&vchan->vc.lock);
+	spin_unlock_irqrestore(&sdev->lock, flags);
 
 	vchan_dma_desc_free_list(&vchan->vc, &head);
+	if (!atomic_read(&sdev->tasklet_shutdown))
+		tasklet_schedule(&sdev->task);
 
 	return 0;
 }
@@ -1017,8 +1024,9 @@ static enum dma_status sun6i_dma_tx_status(struct dma_chan *chan,
 					   dma_cookie_t cookie,
 					   struct dma_tx_state *state)
 {
+	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(chan->device);
 	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
-	struct sun6i_pchan *pchan = vchan->phy;
+	struct sun6i_pchan *pchan;
 	struct sun6i_dma_lli *lli;
 	struct virt_dma_desc *vd;
 	struct sun6i_desc *txd;
@@ -1026,11 +1034,12 @@ static enum dma_status sun6i_dma_tx_status(struct dma_chan *chan,
 	unsigned long flags;
 	size_t bytes = 0;
 
+	spin_lock_irqsave(&sdev->lock, flags);
+	spin_lock(&vchan->vc.lock);
 	ret = dma_cookie_status(chan, cookie, state);
 	if (ret == DMA_COMPLETE || !state)
-		return ret;
-
-	spin_lock_irqsave(&vchan->vc.lock, flags);
+		goto out;
+	pchan = vchan->phy;
 
 	vd = vchan_find_desc(&vchan->vc, cookie);
 	txd = to_sun6i_desc(&vd->tx);
@@ -1044,9 +1053,10 @@ static enum dma_status sun6i_dma_tx_status(struct dma_chan *chan,
 		bytes = sun6i_get_chan_size(pchan);
 	}
 
-	spin_unlock_irqrestore(&vchan->vc.lock, flags);
-
 	dma_set_residue(state, bytes);
+out:
+	spin_unlock(&vchan->vc.lock);
+	spin_unlock_irqrestore(&sdev->lock, flags);
 
 	return ret;
 }
@@ -1057,25 +1067,23 @@ static void sun6i_dma_issue_pending(struct dma_chan *chan)
 	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
 	unsigned long flags;
 
-	spin_lock_irqsave(&vchan->vc.lock, flags);
+	spin_lock_irqsave(&sdev->lock, flags);
+	spin_lock(&vchan->vc.lock);
 
 	if (vchan_issue_pending(&vchan->vc)) {
-		spin_lock(&sdev->lock);
-
 		if (!vchan->phy && list_empty(&vchan->node)) {
 			list_add_tail(&vchan->node, &sdev->pending);
 			tasklet_schedule(&sdev->task);
 			dev_dbg(dmaengine_chan_dev(chan), "vchan %p: issued\n",
 				&vchan->vc);
 		}
-
-		spin_unlock(&sdev->lock);
 	} else {
 		dev_dbg(dmaengine_chan_dev(chan), "vchan %p: nothing to issue\n",
 			&vchan->vc);
 	}
 
-	spin_unlock_irqrestore(&vchan->vc.lock, flags);
+	spin_unlock(&vchan->vc.lock);
+	spin_unlock_irqrestore(&sdev->lock, flags);
 }
 
 static void sun6i_dma_free_chan_resources(struct dma_chan *chan)

-- 
2.53.0

