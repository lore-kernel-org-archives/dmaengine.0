Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792725306;
	b=EOws5MwsbaKdHHzqqfcP7H2KOvkt0MGakg0IDT6hx0x0B0nOTmsQ/Gc2j7a55Mcvv314
	 35X7/n0/1Ny07Cp3F/7S9+g+oO00SGbS398rz0HqU6hs12M+Di/VOoPChMp9JIJUbeU8d
	 5ogB0u+9EZBljn63tqCDmz/2rt/2x3aGo/YOswF60Qlq5kWlotBjrH+sm5xrMKExHh1g0
	 +tAl01N/VJk+BaqD910k4DF8B7/Yx0oOtPhL6lx5JiXi/Y5Wfy+dSn66eWED4eHlFOxZu
	 CCXajjCoQn3z2L3RZwvUNQoSuOj1uXY1rsteEtB9bBq9e8OWvIRo7li1O73OTuyDmGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792725306;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=/Xshv/zG8TvKr+Lm5B41zSVm4wEapx/TH2rePk5m7qE=;
	b=lAWAPuIc11e9KQv2qSKGighsNP6pijMBxWRgNjGgoIAKL6ZuY4ruWHQdvDG7wa59NMxg
	 89L+3NYbtfxpAhtHJtA6lyv/TnrrUXjorPwfi7VcnpKRNatp01iZZa70mQWpu3xYo10cY
	 40PNMIIHSmHFUPerjygg8gTpg6KriAxQWJ6ry+d0TI9WwSPkQWhWimAoadFWjZFa+y395
	 lqtDeU/DviULVE/HOUd9342BTFTzHCzwlh8n8jdClOkJQywn+md6gZW/R/MxTa792QF50
	 aQ37Mhn/Bhcf9sjl+wKxGckQAjegADPVLH8u0DyUN3X8H4FYio1USLtLKXfpXiNgEFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Q1vIMUTR;
	arc=none smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04EF2606A329
	for <dmaengine@vger.kernel.org>; Fri, 23 Oct 2026 03:15:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04EF2606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Q1vIMUTR
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6faddda49e7so413850eaf.3
        for <dmaengine@vger.kernel.org>; Thu, 22 Oct 2026 20:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792725302; x=1793330102; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/Xshv/zG8TvKr+Lm5B41zSVm4wEapx/TH2rePk5m7qE=;
        b=Q1vIMUTRyKeLRxGt2F8XOMtJxaI0VBw4doJ5B79AF0uSGsrHRdc8r4LsspOzGggmZi
         MnaE5ACtqmOLvT1xsxIJXtE2L3jC8txavLPPjUCll5RvhMmN3oFQcog/ZTDVDllbt603
         dRYtgF4nKCOnilGLR3EX1UQbYC/oQfEwx1v5k0zqP+jkfQs2osw+wwL/7dHFgKg7VYhU
         f6PEEuxuXX1q5wTUmi9nDOYbQ2aMSS7XTAiBkD1kGSlM8aa5OOWVqRjXSaGOS9+kvwyC
         NR02XJyMmQ89Psj0KKd90ZA8HHIV+a+Y/iKMQPQBHkdwFfz1MlgyQKzC+9sM/O+JlhpU
         rnog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792725302; x=1793330102;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Xshv/zG8TvKr+Lm5B41zSVm4wEapx/TH2rePk5m7qE=;
        b=VUTsIod1iL8FLdKacD/KBPynpeLg2TB8w2ODSszpVnn0o8c9rFwgUFKXKU3U+4dsfi
         hwEANoPjNJw+nNer9mCAXi5QeRnXY2jEQLsCkLidffo7fq7TSLrmSKzhuNtNuicERqTZ
         FjCLMFhTruyzS+0HLadZM/BdH3wIBWuZBriucPwdsU+tYkcNEFpRp2DnFEELzpmhCUFE
         nHH0jx3hNWLI2Z3pX3ZT0JNon6Eez6kwSJyVXikgX9VjcfaCDLfZePHhVSNaITLaBbfP
         ECTwee4d2mFKg1VAb4gDMDg7ziNsSJNWTkULFgF/nrebg8Qio8ukIzKXMJxEnhgXXXnF
         LtLg==
X-Forwarded-Encrypted: i=1; AKwUvBxWC/sxSf7TOKUm9p6QDNjLJGaYdQoLlaJA9eApoQ6NHZVuc+YeoTH+yQovpVajsAR1hbY42/as7nM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIfEjGI3pOHnsi8sPC7k18Vh3SUsMovZnDPWewhFX7O3/FhHK3w
	DN9bYGS6cBvX6Hv3q0GsSHyuS3SYSt7X4UcQEazKALHL0442xysXCxdpHlkh0ZDa
X-Gm-Gg: AYBFou3lMWVy0/ZfRh2PKvszZd54YbDAPM1loiOJ9g+Fo8CyognmYdRJVFwVdqbZ0n8
	p6Nt9PR+os5BC1WLIuye37IH+USeNZply0Amh0c4x+tYyU/eIB+HsJ/ZrFLMY54CxKGkfOPRDZJ
	C80LJoF0ddeOIhBQz0cWy/cnoszWxmnZW4Tq4bbiwoaDJ/HObkA4q6S8U2pS+ANsfNxqRji5xjP
	xSWMYvXy1ecgKLYoQGbc/Ude5Yyd+UXNS4CVr/ApkLk7x9nOYmtunEeflnScLWXzMqXRTVxGLRV
	2Qy1jHg+Xo9slfWMi/j1VbaLodehKhbwnhrEp6ZkaukUTRH7YvMrYnh8QpE0uEXtLDMEr3yoPxR
	35ey9I7+jVT986QZAxXPzPF4qI15Ahfr6UAr1NzB3od1RT5SE6tnLFxqOvGW+/X1HhXbCWLXCKn
	2cKcvyutm6JCQTOpTecwnzNd/5420YJ3O9jAuiwcqfUTAT1xDuX228RU3lbybhu657Jdm8RaAB2
	uvBHydl224aOObCxkVQRsA68kor6b5qnGwHAmujAfX4+KthgulUI7NSv7iv2qwXJTpzNS6eV2Vz
	bV0+fFdRiTaIxJbjiMdeZLDs1vey089zqBbCE7MCStWhR5g6WXrDDk1oFV4XaTG2iG2mGPpYffM
	nBqpq4zt/ZkkVht2SU5YT9l6/KusSMhaD8PJLkeFJrtAVvzI4m7BXzD1wj/eAKguHwAfTFO6hgc
	zfOMo=
X-Received: by 2002:a05:6820:a516:20b0:6d0:1fe7:1744 with SMTP id 006d021491bc7-70b88a9b614mr552186eaf.83.1792725301918;
        Thu, 22 Oct 2026 20:15:01 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84fbda584d9sm938638a34.13.2026.10.22.20.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 20:15:01 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 22 Oct 2026 21:14:54 -0600
Subject: [PATCH 3/6] dmaengine: sun6i: serialize channel reassignment with
 interrupt handling
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
Message-Id: <20261022-submit-sun6i-dma-lifetime-next-v1-v1-3-01085f684c9f@gmail.com>
References: <20261022-submit-sun6i-dma-lifetime-next-v1-v1-0-01085f684c9f@gmail.com>
In-Reply-To: <20261022-submit-sun6i-dma-lifetime-next-v1-v1-0-01085f684c9f@gmail.com>
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
 drivers/dma/sun6i-dma.c | 101 +++++++++++++++++++++++++++---------------------
 1 file changed, 56 insertions(+), 45 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 0a9645171180..cd0562de7def 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -217,6 +217,7 @@ struct sun6i_dma_dev {
 	struct clk		*clk;
 	struct clk		*clk_mbus;
 	int			irq;
+	/* Channel assignment and register access; nests outside vc.lock. */
 	spinlock_t		lock;
 	struct reset_control	*rstc;
 	struct tasklet_struct	task;
@@ -502,6 +503,11 @@ static int sun6i_dma_start_desc(struct sun6i_vchan *vchan)
 	irq_reg = pchan->idx / sdev->cfg->num_channels_per_reg;
 	irq_offset = pchan->idx % sdev->cfg->num_channels_per_reg;
 
+	/* Do not deliver a previous transfer's interrupt to this descriptor. */
+	sun6i_write_irq_stat(sdev, irq_reg,
+			     (DMA_IRQ_HALF | DMA_IRQ_PKG | DMA_IRQ_QUEUE) <<
+			     (irq_offset * DMA_IRQ_CHAN_WIDTH));
+
 	vchan->irq_type = vchan->cyclic ? DMA_IRQ_PKG : DMA_IRQ_QUEUE;
 
 	irq_val = sun6i_read_irq_en(sdev, irq_reg);
@@ -524,11 +530,11 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
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
 
@@ -545,10 +551,9 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
 				pchan->vchan = NULL;
 			}
 		}
-		spin_unlock_irq(&vchan->vc.lock);
+		spin_unlock(&vchan->vc.lock);
 	}
 
-	spin_lock_irq(&sdev->lock);
 	for (pchan_idx = 0; pchan_idx < sdev->num_pchans; pchan_idx++) {
 		pchan = &sdev->pchans[pchan_idx];
 
@@ -557,31 +562,20 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
 
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
@@ -590,9 +584,11 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 	u32 channels_per_reg = sdev->cfg->num_channels_per_reg;
 	struct sun6i_vchan *vchan;
 	struct sun6i_pchan *pchan;
+	unsigned long flags;
 	int i, j, ret = IRQ_NONE;
 	u32 status;
 
+	spin_lock_irqsave(&sdev->lock, flags);
 	for (i = 0; i < DIV_ROUND_UP(sdev->num_pchans, channels_per_reg); i++) {
 		status = sun6i_read_irq_stat(sdev, i);
 		if (!status)
@@ -608,14 +604,14 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 			pchan = sdev->pchans + i * channels_per_reg + j;
 			vchan = pchan->vchan;
 			if (vchan && (status & vchan->irq_type)) {
+				spin_lock(&vchan->vc.lock);
 				if (vchan->cyclic) {
 					vchan_cyclic_callback(&pchan->desc->vd);
 				} else {
-					spin_lock(&vchan->vc.lock);
 					vchan_cookie_complete(&pchan->desc->vd);
 					pchan->done = pchan->desc;
-					spin_unlock(&vchan->vc.lock);
 				}
+				spin_unlock(&vchan->vc.lock);
 			}
 
 			status = status >> DMA_IRQ_CHAN_WIDTH;
@@ -625,6 +621,7 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 			tasklet_schedule(&sdev->task);
 		ret = IRQ_HANDLED;
 	}
+	spin_unlock_irqrestore(&sdev->lock, flags);
 
 	return ret;
 }
@@ -931,19 +928,20 @@ static int sun6i_dma_pause(struct dma_chan *chan)
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
@@ -952,23 +950,24 @@ static int sun6i_dma_resume(struct dma_chan *chan)
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
@@ -977,15 +976,15 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
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
-
-	spin_lock_irqsave(&vchan->vc.lock, flags);
 
 	if (pchan && pchan->desc && pchan->desc != pchan->done) {
 		struct virt_dma_desc *vd = &pchan->desc->vd;
@@ -1000,15 +999,26 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
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
 		pchan->done = NULL;
 	}
 
-	spin_unlock_irqrestore(&vchan->vc.lock, flags);
+	spin_unlock(&vchan->vc.lock);
+	spin_unlock_irqrestore(&sdev->lock, flags);
 
 	vchan_dma_desc_free_list(&vchan->vc, &head);
+	if (!atomic_read(&sdev->tasklet_shutdown))
+		tasklet_schedule(&sdev->task);
 
 	return 0;
 }
@@ -1017,8 +1027,9 @@ static enum dma_status sun6i_dma_tx_status(struct dma_chan *chan,
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
@@ -1026,11 +1037,12 @@ static enum dma_status sun6i_dma_tx_status(struct dma_chan *chan,
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
@@ -1044,9 +1056,10 @@ static enum dma_status sun6i_dma_tx_status(struct dma_chan *chan,
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
@@ -1057,25 +1070,23 @@ static void sun6i_dma_issue_pending(struct dma_chan *chan)
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

