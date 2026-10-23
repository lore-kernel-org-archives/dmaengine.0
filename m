Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792798719;
	b=3wI15cXB3OeCMrFNRGUIMWvp/iWxqMP1SOVllTlndZTRmCyTrAuxtY4aAb6gZCf1ZP18
	 C4T/AQq1HauE6vH3wXjzqPWNT2tv86luhU781BHmyCyKB9EV2qbcK8x8Bp1a20QHB6qT9
	 WtCyuK7Q9Ge+mheeIMl1SDpnr3xB1NtKLgDMQ0gjMrMJ0//f2stXvvvzhJnB2j7sLa+IY
	 ZAjIFHSXxhwADNgHMd2cgE/NOlnBqGPAC79n9zdLLa/wszVv5Jrl8oD6yPC3aw1NSSqaN
	 z/JBb0kqHY/G6QJn8tzaLQ/EXI84Te852uFjEamRVH8R0nJmPd/FW/K/n696Pw0+lBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792798719;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=GUQ9hlCoo6Dy1AIQut5SiYH7FfRIMv35mZmA2VeNSQQ=;
	b=aK7fXMyY93bZ5rFbFCWwyn3PYiFrBdDPdXNBpQICXWyZslZxXC8PzKoL5fHJc31d1MJ9
	 f+jaZeMUKavsM++spcvjK5s4cQxHYp7tgBijyCkqZW8L8evsb80OiNaYNxBDkvxubf+EY
	 a/uSId5DKRoFHJVRotx5d4+idFF6MKK9su4YOBG68rbCQwGvu5aZXJYOI0yvfaIV2xZnm
	 c9ilqCTfxrWph4KiNte1hkWO+ECNAEVdKdF2JnlkpJFafokaqgZTIryOoz6qhOV5hV5hj
	 unxfeR+90YSPBpu3cFG1yt9wENZpVPsDv4Abt8Zrp45//eDzq2Wro/aXSdE5Bf2VWIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HYtMiqUa;
	arc=none smtp.remote-ip=209.85.160.47
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB08606A33E
	for <dmaengine@vger.kernel.org>; Fri, 23 Oct 2026 23:38:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCB08606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HYtMiqUa
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-4a6bb779d13so743546fac.1
        for <dmaengine@vger.kernel.org>; Fri, 23 Oct 2026 16:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792798718; x=1793403518; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GUQ9hlCoo6Dy1AIQut5SiYH7FfRIMv35mZmA2VeNSQQ=;
        b=HYtMiqUazt6m3sHD9sE7m0X7ZCKL/VqDow9KT11jpYlQAttB53O6Bu2ROla0k1lBYv
         x/rLt+EgzhizOG+aqsUGmZmdN0XvPeCL520uFnbfDkmagkRa/51Ekm13ABF1WpKgwryU
         00Tv+NuK6hD42dgZK7A0iElR6E/zxRUyqsdr/v0vApVqYNXyWHm/5agJvarTy1b1ruF8
         Le43EAL4uM2iUmJlYpTfeTC+Qv4du/vAmZq+3dc5eFapGnkUuaGs+Omr6lTbYY13rGdB
         fZna2Dgr7zAUbsy/1G6M5rbOMcmmGxm0Q+1zLTXemJYkT+46V4rhwHsIFGhbOC3btCbk
         NXYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792798718; x=1793403518;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GUQ9hlCoo6Dy1AIQut5SiYH7FfRIMv35mZmA2VeNSQQ=;
        b=Whwz+GVG8RMc9Dwsb9WD1HMJ/+qdTRYP8POS4BeXoN2GRmQNefwVTWBfViuzTmneK9
         UMpzXKkAHmZEkjeUdrOjb3pJK6gh5xQuobrC/vrPCTnJdiDyX7BC8Yq/VjtTFse4wta5
         Ck3SmWlpvCDGtGJPeAvBTwdt1/rV0ODn6jT57tLNCRf25eWnVvUFCX/hJGlHr7M22Q2t
         lIEiGK6/XxLLG1yKT6KOUekcBjvHL8YvHbNuDJNDummKCgFt5crMFNDQuXMxHvggSOQ0
         dN3xHTih3SNiV/IjEtFqhi5WQin6Ruigf4r08aOfRPsZQge8y7bc/h+29aaO9iHDhIvn
         FSyA==
X-Forwarded-Encrypted: i=1; AKwUvBxchEHuflc1XIjd7vOyqOerKzhTuDDOdGHpMchlUVItzylOr1o5/CZUhlBHNQnBPJGF2xXRbFu2zPU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQ/kN1wX3AtkpuJdIHEqfVjjUXzhbQyiGU9cGw90kdG2vDXZhl
	IUf73wFM+c89H8iHgWPdLLIFLdIZvpBibbMEu6MaZj79keF0MWIRwKMv
X-Gm-Gg: AYBFou0g2LibJvm6dvDsfWyHcIfUmsT+c+hXwrlOF8fvAhqciZ2eDfxXDZiQ3oR92ip
	oPNdq/yo3xP9mbGqastgbdLC1LT3XgpCELmD9Z1TyVKdFeOZAAARKhixGS3/zMNSdyLrSAOVlLf
	nU3aQ0GCCf2BsPQVo4i/qpTcBs5qL2E+z1rNAo7YDzay5NWEXLNxCFBRj7bZyrvo7N1F7973aGK
	IZQnJOVFCfwJ8CfpmhV1RMuQHXI5CsAn7kYgoxnZ0KI/gxAZ210bfDk+V0ORn4KPaoYgAkA/FKn
	B8rjvxyxt3CqBU87L/Z5cEMxlqkm/w6DNWSt/wBt0ULUCoRUjlLAwxH/6B5nzoDheaI0y/ck1Q1
	ZpR0dqJqE911oEuFYE5V+hQaoRiO18+keSlwq1/6LMmLdIiKKTat7XguXFdNsQuabeWclRce72N
	LwUFnqu4b0WIOBDRdyJ3b9r80yUxf67rwHvdl/fEfZgGowuiZ/0aOuXW2UMnFakJY2sERRHb23n
	cq6a6OWc1zp0UTT8+OkDuWKrENuqW6I9A/rPFCVVZJJfpQnklOjIbTnN9BHVGfSAr27Vzx77Niy
	h57qQ6jZLKd87WHc735OKuI6+etzLPIXA9+q65LxyEmt/ddrxLRy1xhBFCLGEBdjdyIELywPy/T
	VcMbWA72xyfmibCUvf3VCSuLw/WOWVYjQipreyTsi6YEq0+Bd3oBrC0obVqNv2A+fxGdpsWaPd/
	fd8x4=
X-Received: by 2002:a05:6871:4715:b0:4a2:c175:d339 with SMTP id 586e51a60fabf-4a83f58e426mr639235fac.39.1792798717749;
        Fri, 23 Oct 2026 16:38:37 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a843225d69sm284345fac.15.2026.10.23.16.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:38:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 17:38:23 -0600
Subject: [PATCH v3 4/9] dmaengine: sun6i: serialize physical channel
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
Message-Id: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-4-ef1acb0be768@gmail.com>
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
 James Hilliard <james.hilliard1@gmail.com>, 
 Sashiko <sashiko-bot@kernel.org>
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
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 67 ++++++++++++++++++++++++-------------------------
 1 file changed, 33 insertions(+), 34 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 435d7daa1c0f..d3a63c866645 100644
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
@@ -524,11 +528,11 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
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
 
@@ -545,10 +549,9 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
 				pchan->vchan = NULL;
 			}
 		}
-		spin_unlock_irq(&vchan->vc.lock);
+		spin_unlock(&vchan->vc.lock);
 	}
 
-	spin_lock_irq(&sdev->lock);
 	for (pchan_idx = 0; pchan_idx < sdev->num_pchans; pchan_idx++) {
 		pchan = &sdev->pchans[pchan_idx];
 
@@ -557,31 +560,20 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
 
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
@@ -590,9 +582,11 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
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
@@ -608,14 +602,14 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
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
@@ -978,15 +974,14 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
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
@@ -1007,7 +1002,8 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 		pchan->done = NULL;
 	}
 
-	spin_unlock_irqrestore(&vchan->vc.lock, flags);
+	spin_unlock(&vchan->vc.lock);
+	spin_unlock_irqrestore(&sdev->lock, flags);
 
 	vchan_dma_desc_free_list(&vchan->vc, &head);
 
@@ -1018,8 +1014,9 @@ static enum dma_status sun6i_dma_tx_status(struct dma_chan *chan,
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
@@ -1027,11 +1024,12 @@ static enum dma_status sun6i_dma_tx_status(struct dma_chan *chan,
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
@@ -1045,9 +1043,10 @@ static enum dma_status sun6i_dma_tx_status(struct dma_chan *chan,
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

