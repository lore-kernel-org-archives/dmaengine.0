Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794735199;
	b=HIuaemzbxf7NqoPhiGCS8rYlcILUoIEZvK+lQdC+T+CiPrA5zYOEULqam6zevj5XfolG
	 ZT9vcMZ+Bq/8xIgj0mGWd8/T+Bn9gf9pulco2+vfnNM3lqZqopyqgq6psQ2by5hNnmGkL
	 BIuWjaqpcW1PX3eVC2rbbMPMikeS5hZceBejcfcpRrzOL8onsluyuWNGrewETfCk5aFHa
	 V+VDXLttwGduHZcQTVS5Yh54+8bwG66JO3Dm8CRcudNPRT7ZMniw32Tz4W78FrpU8tvCS
	 6L/yEa4odHHnMFY2i06mf6cvi06EKZhTkotNBRkEyQVr9VYTF+fFmTUFWA52zOwCERA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794735199;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=PHAQXgA7Ag6ugvQaLzYJVeEvbSBqXCAOAmP+o62IFzg=;
	b=mDEe6BCd7woiphmGlOsspSQuHWuUFzDQHRra6jtTthHyoMmi3IM3gPj8NwVbcccPUoQ2
	 PpR/OUj7yQmPhKIYqTAnBj0oG33IUwIZYZmVDiaKV0wpxa5moh9SI56nTH9B26uBYnS+p
	 pQrJpQKc5G/oLCBf3f1wYE7sSYV1l5s3EUiHNrBAv76ZHuBMV3QsUrFGXhnzCGTu5e4AT
	 aGGMwV8/8FqOdkeuWtLy9oF5yrx3ftPEaAFuX1ZewKq3frvBY5GyufYAYmoppNj7xV7Ng
	 gE51NWivEZ+9qrDu33+oKQpL+r99s85/DM00lJk+5mr/A9dnxbTCYXHJk70mpnuhUIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C75E2lCj;
	arc=none smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF24606A331
	for <dmaengine@vger.kernel.org>; Sun, 15 Nov 2026 09:33:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EF24606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C75E2lCj
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-86103aaac12so2492520a34.0
        for <dmaengine@vger.kernel.org>; Sun, 15 Nov 2026 01:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794735198; x=1795339998; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PHAQXgA7Ag6ugvQaLzYJVeEvbSBqXCAOAmP+o62IFzg=;
        b=C75E2lCj6W6LCJZpJdOZXTm83xopMdBxBvjb4L19/A15MgKA3qiNnMfjtxofVQNsja
         +SBKQ+1wI7zyqxbx2t2R4xLigvHY/5a5coYqmmVzsz0JVO0ZprfkOFJc/S8dF1ROwhXk
         Tg0d04JibDkMETJTUiv0iPcj4qMYwy5JhBJW3gTgJWphVEMIfnZGlGYbKKinjEWDr1UU
         lvGE6NHgd+Bi153TzwuFUs96+8eKvm/yf4Obw0U5oYl5tSb0e3r1NeelvP1kXMSxLRdk
         B5mza6mnjApt0ewOl1YIDwziaD0BfbsdzQHvUrpRne4rTrnlPssVoEevaAZguJnNHwpT
         7icA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794735198; x=1795339998;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PHAQXgA7Ag6ugvQaLzYJVeEvbSBqXCAOAmP+o62IFzg=;
        b=hCXOMuV028xipqy7X/xOyMwHIA0MddhzBXx07wr9+ldkDHUZ5khZ9plnPQN0EKPmz/
         vezlARRj1bn04Oz5aUC5KmoiKUeghkGsRaPB+ZM2Ka6E7hg5ECw8jdQux26r/SycAbTd
         NOuJekC5U0E9zmlM8o66xIxn1rABeXanadkeO3iZvUCpUq7oAFAtLE9Vfervl9SXnyP0
         YNMhlJSveyO2AXNlqZ02CpzDi9a741p5X6JVCP0ooB/KGiDLvR+Xd+eGFbJlYfIlfvyB
         K880xnf/cMPoKw+MNPQZj0aLWKq7NkmIN5wGmMHzldoZvoYBhwTLb5jervr5ktNx5qjA
         1xDw==
X-Forwarded-Encrypted: i=1; AL+hErHSXpEshGp40cMR4eKWvQdi9pLBM7gds+PlX6mny9UTdsxiX2tP4+5OU6DiRXEGfLUVWFa4IolxVHg=@vger.kernel.org
X-Gm-Message-State: APuU4Z87d7qGLtNl9NvGcwmX/4hBE9KVOiXhbKXmQfKH5rPhHeT+8Qbe
	a9DycQckPCQyxqxpeD4IRPLx/RtrhyyUwKdNFlPCWTwXXuSm7XxAyz+AS1Rq2g==
X-Gm-Gg: AYBFou3EomSQYk9jZ5Y8/oFWINaooehZs0zt8GFEAbbZPW4XqlUe8kywAzWSL7sCJtR
	6H8UFeHsRfhZ6t54Hx7pNVjicMv8kpZy48ezFhcA5pOPUhDKxGvZs8RjJ8laxWy5CxrbqVZarIL
	rKf2Du5FDYUNQAXZREWaAfymf3Fon1wJp1/JLU4QtaFp4nm6umURI1Xi3irGe21fkJaaMgnImem
	mkFlv/jkgx01xGt1lEXD9zdOWgnx3fitLoUG7bJvOHqrgN/s0xoFIJj0GTohYRlZGonfohD3RXn
	brcSNlP719yE0zuFd3p1EcMOpAFQBTJaofkJuH7IP2K0RGLpl/Im+nZJQi4qKJ/pOnlOqVSt2nW
	ffF4DtW4yn/r2SlrZXCP6kFIo+KK9Izr3tx5blpPTiNd22n4UUFX5VvKaCka6yx2OXQ9X/86v8i
	EWijpG9/rIYRhW2mehlgYCBye3n42hhvbw3Y/GfLZl5Fl5Of8GvX+ArNO9FOIaeMtouvwS8KudY
	aZlJfIkx1T/imoONOG59fKPwbshK6gBNPwlpjqIfh1HGwBi4Ugjr0nW8gJzfohDxG605nIBbqld
	LCLL57fBLaHZ27pAaciHhZJNsfkvSf0X9clEN8+qLSEjULzW+5G/WLT9uJKH2tZ4NNcizuj1iKO
	MdWHAKI75db7yisN5wcvSD9p+rY8Q5eCUJL0uqy9KbONVljY+H+jIHRwIPMpEU72oPiJ+AkKS53
	McOJ5SeY86lhH55Jx9C+/4jNve577sPvuEVPsDnUl/mNd0CrzbNYw=
X-Received: by 2002:a05:6820:1caa:b0:71a:e9eb:6b93 with SMTP id 006d021491bc7-71ae9eb6f20mr396173eaf.1.1794735197991;
        Sun, 15 Nov 2026 01:33:17 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab43347b9sm5933617eaf.12.2026.11.15.01.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:33:17 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 02:32:52 -0700
Subject: [PATCH v4 4/9] dmaengine: sun6i: serialize physical channel
 ownership
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
Message-Id: <20261115-submit-sun6i-dma-lifetime-next-v1-v4-4-043cd476a45f@gmail.com>
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
 James Hilliard <james.hilliard1@gmail.com>, 
 Sashiko <sashiko-bot@kernel.org>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2

The allocator changes vchan->phy and pchan->vchan under sdev->lock, but
termination reads the physical channel before taking either lock. The IRQ
handler also takes an unprotected owner snapshot. Termination can miss a
new assignment or detach an owner while an interrupt is about to complete
its descriptor. A sampled IRQ can also be applied after reassignment.

Protect physical-channel ownership with sdev->lock across allocation,
interrupt handling, pause, termination and residue queries. Read and
acknowledge IRQ status under that lock, and allocate and start each pending
channel in the same critical section. This also serializes updates to the
shared interrupt-enable registers.

Nest vc.lock inside the device lock when accessing descriptor lists or
updating cookies, including cyclic notifications. virt-dma takes vc.lock
independently when preparing, submitting and completing descriptors, so
the device lock does not replace it. Client callbacks run outside both
locks in the virtual-channel tasklet.

Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/20260706065650.34B131F00A3A@smtp.kernel.org
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 67 ++++++++++++++++++++++++-------------------------
 1 file changed, 33 insertions(+), 34 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 0b8e5deb2252..5d39a2c0c2e1 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -217,6 +217,10 @@ struct sun6i_dma_dev {
 	struct clk		*clk;
 	struct clk		*clk_mbus;
 	int			irq;
+	/*
+	 * Physical channels, pending list and registers; nests outside vc.lock.
+	 * virt-dma also takes vc.lock independently for its lists and cookies.
+	 */
 	spinlock_t		lock;
 	struct reset_control	*rstc;
 	struct tasklet_struct	task;
@@ -526,11 +530,11 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
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
 
@@ -547,10 +551,9 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
 				pchan->vchan = NULL;
 			}
 		}
-		spin_unlock_irq(&vchan->vc.lock);
+		spin_unlock(&vchan->vc.lock);
 	}
 
-	spin_lock_irq(&sdev->lock);
 	for (pchan_idx = 0; pchan_idx < sdev->num_pchans; pchan_idx++) {
 		pchan = &sdev->pchans[pchan_idx];
 
@@ -559,31 +562,20 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
 
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
@@ -592,9 +584,11 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
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
@@ -610,14 +604,14 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
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
@@ -627,6 +621,7 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 			tasklet_schedule(&sdev->task);
 		ret = IRQ_HANDLED;
 	}
+	spin_unlock_irqrestore(&sdev->lock, flags);
 
 	return ret;
 }
@@ -933,19 +928,20 @@ static int sun6i_dma_pause(struct dma_chan *chan)
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
@@ -980,15 +976,14 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 {
 	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(chan->device);
 	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
-	struct sun6i_pchan *pchan = vchan->phy;
+	struct sun6i_pchan *pchan;
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
@@ -1009,7 +1004,8 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 		pchan->done = NULL;
 	}
 
-	spin_unlock_irqrestore(&vchan->vc.lock, flags);
+	spin_unlock(&vchan->vc.lock);
+	spin_unlock_irqrestore(&sdev->lock, flags);
 
 	vchan_dma_desc_free_list(&vchan->vc, &head);
 
@@ -1020,19 +1016,21 @@ static enum dma_status sun6i_dma_tx_status(struct dma_chan *chan,
 					   dma_cookie_t cookie,
 					   struct dma_tx_state *state)
 {
+	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(chan->device);
 	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
-	struct sun6i_pchan *pchan = vchan->phy;
+	struct sun6i_pchan *pchan;
 	struct sun6i_dma_lli *lli;
 	struct virt_dma_desc *vd;
 	enum dma_status ret;
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
 
@@ -1046,9 +1044,10 @@ static enum dma_status sun6i_dma_tx_status(struct dma_chan *chan,
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

-- 
2.53.0

