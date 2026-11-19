Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795104114;
	b=temhCHMJ8fgIhkOaV/jtdtWmle3MYu4HPWMPMYQWMyDuTLaS1qjXxs9Rhd40Y5gDPyn8
	 nDo29IyuemD2wsHjIs0YL1M7CuoFVH8UKaOXWJz7jfdgfuyeTTw1VP9rb1aakcDIJwdIM
	 VRr8KO10lkf0GNDyGCoF60PXRR7IJwCfXB10EPe77KyLW2+xhU/7PtWs3S0dJpzMMQdxL
	 QujRr1LAfYmrQy6Vgd48XTtWhjD2eSA04MffFRJF0O4DZK9IPi3ewdFfjj1Tw+DWgI6bU
	 VlowUH2A+2nwTg/xjf/qfyrlCFOs0/Zvt+HeT3g8W67TFA1vxLbTNaxSVI4ZNaB6Anw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795104114;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ELPVGKyJPN38ost3dJadROBrjbhctV0voUbr4/8P8tY=;
	b=M1FjPhJol1AD1T1vMropZF+AhVJA3brousydQlGL9snyCNAB/BWPBrpQFARNIKKEfz29
	 ydLYnNumVrlTw3L0gexDz9XMSBBFA3j7wxBOpuqF+uvSmrSexAEmQvlbxkP7vvp3BcwTE
	 /BQSQFug+QxhauWINPN2QFZgmGuCLoCLmBqGgHQzGZFkAjnBozdLaHpJQfpnullLN8iTq
	 R7ZgTFBFBqi73aCgiWtA9fbTZKR8xPFjTs78IBJpBZ9NV62nNqxsCSF6h0LU0yrEubcFx
	 fBTm4q3BMy4Eaz2HbTXu7MoC/thjeFBbUsSgiD0LpoyHxyQqEziBgAHGOTtQ/fSj1Ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xsyHnKod;
	arc=none smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F66606A334
	for <dmaengine@vger.kernel.org>; Thu, 19 Nov 2026 16:01:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72F66606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xsyHnKod
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b4e246acc2so19258587b3.3
        for <dmaengine@vger.kernel.org>; Thu, 19 Nov 2026 08:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795104113; x=1795708913; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ELPVGKyJPN38ost3dJadROBrjbhctV0voUbr4/8P8tY=;
        b=xsyHnKodkL1XBh5fRrq6hxBMmmzsBSrGtOkHT6OkZ9QXMFx47YLNZc6YWphfVjWXfZ
         q72sCG3RNnPwoUvjkztP9V4BGUymiWgNyChvKSW5Jdu3Cyp5XbbqHOy3RGboDsV1Fx4B
         cDTrWbfVK2ATpwpWR880HgF6tB8qwaKM5o3F+rpyDOfBKTA6TUp8TEXXAA93rlryLw8s
         XyuwiVJRSwEEls8DxvabLjsQKTNkFacXFD6bPQIo++EExZp+eJPab13zoRWvVj8oZcbm
         XCaM/q1NwQHn/hV6Gf90Vdto9fX3Akcl1YV/GXV+JR32EaSfPUA92jFI0MGvArVVvbDt
         0rKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795104113; x=1795708913;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ELPVGKyJPN38ost3dJadROBrjbhctV0voUbr4/8P8tY=;
        b=qOjvpuD/z7EPXxNM/Fm1/y4k/43YqOl9w6vdT+yo3BrVQGfS/DdGcgHuKn8ba62yW7
         lXQPGIsoFx8BIbwx77DjKQ17jfr2DHFODPE5+8UnhECXZHpAOrJYZ0JGKLo8egJ/2rlO
         3S7mvK1lmB9jnhbkqvXy4JJsyb5/r/LrWIKTqG+bPoU57s5xPV/v7//o3FFe4dpJJxGR
         9QlEKZYSJ+S2+iGAUpea8iV/Xlt12GQc4EW2P+Dj4dHs2MlEdA9ZSmE1WlqW85IffjaD
         5abmO/Yl/WeYTucm79jlFFP5uORxecd7n5UovxlE65jTGMZXPOVifXOykBn5/bv6kYRw
         O/SA==
X-Forwarded-Encrypted: i=1; AL+hErE529iKyL+qfiqCA1uvHcuz6cwv6suWtZ1zGcYxqG2IBDndMTne9y1+pa6P7xzthQllbcKT/wa4tvo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9GFkDHbIijUS1PNFjd2yx3qBFtiFvwUJ/Z1rITWn51PIDS5zDE
	WrqnbhnahRrqAU4zupG5g3Zswbg4lNxPHXUUqR/x8ss6h+PXxCMBBG6w
X-Gm-Gg: AZFdTZePYFd9ZxEXLWycJF1D1pQSDuBF096deFOsmcXnuFtMqH2PW2iB/pNDfpIyVJT
	cREmrG8DSF13gwc1KE159rSrIRS3MNuwmxbEzgqu4Ha8VAYwEO+7A6x1laC76zao5YDAnHNysHa
	hgSFiLHHZuRIG6AyWQm/WMXR3Z3t5xsASg2EL1XBxMkEMXtAm8HihhBNYB4txUdYC8oAsn5ja8E
	/w7X9BzdikwqXQYiAzE2lu1SUuPr9fYlDYhgCX+bxpl6vuVkjU/ZtXQCn7amroBWyAot1aM0J6+
	auu+2MX+jiBV9SBdil6X5lBDL6JnYUGG3+AutBMAfD/PY3VhIMy16vOEcVb4RCeb/TzlNUU+mm1
	5AvnLNe5CKITzoDm3lQ6oUk7KyBJsvvTdhoqrNMCgcM7NkARXVLe7QnObmIui1pHHiPS6ezT0Aw
	PGxB82idvgT+xDSTluVjz6OVLVD2g5OZxPzbWoBN9JgUT/u1LC7yLNud7G7kCOlEtZd6ECj25ZO
	okpZh0C9B1l/2+EiqtUa7Pv4fAECSrja24EBSwo+xdEuWr7TBQCe1/VQMQjznnL6KfSld6bEOq7
	RV/2mng6HSOIuTLR+duV1W7IBgiQer/TsoD57D5dorhUSCreSwXyQVn1WJ4V2VV1fWk8jOATv0T
	1DWm7ExNb1AeAAtTmw4xJnl47NOFVIFIj+VQcdU3UbV3fBd7l8hFKeAX96NaNGMmE/+a/6RmLPu
	QmRd9ajpd6h/IqMq+RiajeaVk/AaIWT8L+zjzxibQ1gaAg30uejPs=
X-Received: by 2002:a05:690c:6381:b0:8ad:bc2e:aad1 with SMTP id 00721157ae682-8b52042e7b9mr753327b3.17.1795104113164;
        Thu, 19 Nov 2026 08:01:53 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b52031aa4bsm623267b3.34.2026.11.19.08.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:01:52 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Nov 2026 09:01:00 -0700
Subject: [PATCH v8 5/9] dmaengine: dw-axi-dmac: preserve pending pause
 requests
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
Message-Id: <20261119-submit-dw-axi-dma-stop-pause-v1-v8-5-f8e7fe60594c@gmail.com>
References: <20261119-submit-dw-axi-dma-stop-pause-v1-v8-0-f8e7fe60594c@gmail.com>
In-Reply-To: <20261119-submit-dw-axi-dma-stop-pause-v1-v8-0-f8e7fe60594c@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Sergey Khimich <serghox@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>, Baruch Siach <baruch@tkos.co.il>
Cc: Mitch Barnett <mitch@accuratesound.ca>, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.17-dev

dma_chan_pause() clears SUSPENDED even when polling times out. Hardware
can set that status after the last poll, and the unconditional clear then
discards an acknowledgment the caller never observed. Another channel's
interrupt can also consume the status because the shared IRQ handler
clears every channel's status before taking its lock.

Leave SUSPENDED to the pause and resume paths. Track the suspend request
separately from its acknowledgment so a timeout can be followed by either
a pause retry or a resume. Wait for acknowledgment before clearing the
hardware request, since hardware ignores an earlier clear. If that wait
also times out, return -EAGAIN with the request still pending.

A completed transfer is also quiescent, but its completion handler may
still need to advance a cyclic descriptor. Defer that restart while a
pause is pending, and resume it without reprogramming the first LLI.
Track the active descriptor until its completion handler runs so that
resume and issue_pending cannot restart a completed cyclic segment or
reissue a completed noncyclic descriptor while its IRQ is pending.
Start queued work after the active descriptor is retired, respecting the
pause request.

Clear stale suspension status at the start of a new descriptor rather
than at each cyclic restart. Reset the software state after successful
termination and when allocating a channel for a new client.

Store the lock-protected pause flags as bitfields in existing padding.

Fixes: 1fe20f1b8454 ("dmaengine: Introduce DW AXI DMAC driver")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 99 ++++++++++++++++++++++----
 drivers/dma/dw-axi-dmac/dw-axi-dmac.h          |  8 ++-
 2 files changed, 91 insertions(+), 16 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index 8c115d20728b..99b648d4ca76 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -482,6 +482,8 @@ static void axi_chan_block_xfer_start(struct axi_dma_chan *chan,
 	irq_mask |= DWAXIDMAC_IRQ_SUSPENDED;
 	axi_chan_irq_set(chan, irq_mask);
 
+	axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED);
+	chan->desc = first;
 	axi_chan_enable(chan);
 }
 
@@ -490,6 +492,9 @@ static void axi_chan_start_first_queued(struct axi_dma_chan *chan)
 	struct axi_dma_desc *desc;
 	struct virt_dma_desc *vd;
 
+	if (chan->desc || chan->pause_requested)
+		return;
+
 	vd = vchan_next_desc(&chan->vc);
 	if (!vd)
 		return;
@@ -544,6 +549,10 @@ static int dma_chan_alloc_chan_resources(struct dma_chan *dchan)
 		pm_runtime_put(chan->chip->dev);
 		return -ENOMEM;
 	}
+	chan->desc = NULL;
+	chan->pause_requested = false;
+	chan->is_paused = false;
+	chan->cyclic_restart = false;
 	dev_vdbg(dmaengine_chan_dev(dchan), "%s: allocating\n", axi_chan_name(chan));
 
 	return 0;
@@ -1088,6 +1097,8 @@ static noinline void axi_chan_handle_err(struct axi_dma_chan *chan, u32 status)
 	vchan_cookie_complete(vd);
 
 	/* Try to restart the controller */
+	chan->desc = NULL;
+	chan->cyclic_restart = false;
 	axi_chan_start_first_queued(chan);
 
 out:
@@ -1135,11 +1146,18 @@ static void axi_chan_block_xfer_complete(struct axi_dma_chan *chan)
 			}
 		}
 
-		axi_chan_enable(chan);
+		if (chan->pause_requested) {
+			chan->is_paused = true;
+			chan->cyclic_restart = true;
+		} else {
+			axi_chan_enable(chan);
+		}
 	} else {
 		/* Remove the completed descriptor from issued list before completing */
 		list_del(&vd->node);
 		vchan_cookie_complete(vd);
+		chan->desc = NULL;
+		axi_chan_start_first_queued(chan);
 	}
 
 out:
@@ -1161,6 +1179,8 @@ static irqreturn_t dw_axi_dma_interrupt(int irq, void *dev_id)
 	for (i = 0; i < dw->hdata->nr_channels; i++) {
 		chan = &dw->chan[i];
 		status = axi_chan_irq_read(chan);
+		/* Leave suspension status for the pause and resume paths. */
+		status &= ~DWAXIDMAC_IRQ_SUSPENDED;
 		axi_chan_irq_clear(chan, status);
 
 		dev_vdbg(chip->dev, "%s %u IRQ status: 0x%08x\n",
@@ -1200,6 +1220,12 @@ static int dma_chan_terminate_all(struct dma_chan *dchan)
 			dw_axi_dma_set_byte_halfword(chan, false);
 
 		vchan_get_all_descriptors(&chan->vc, &head);
+
+		axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED);
+		chan->desc = NULL;
+		chan->pause_requested = false;
+		chan->is_paused = false;
+		chan->cyclic_restart = false;
 	}
 
 	if (ret) {
@@ -1215,16 +1241,49 @@ static int dma_chan_terminate_all(struct dma_chan *dchan)
 	return 0;
 }
 
+static bool axi_chan_is_suspended(struct axi_dma_chan *chan)
+{
+	if (axi_chan_is_hw_enable(chan))
+		return axi_chan_irq_read(chan) & DWAXIDMAC_IRQ_SUSPENDED;
+
+	/* A completed transfer cannot acknowledge a new suspend request. */
+	axi_chan_disable(chan);
+	return true;
+}
+
+/* A timed-out request can still be acknowledged. */
+static int axi_chan_wait_for_suspend(struct axi_dma_chan *chan)
+	__must_hold(&chan->vc.lock)
+{
+	bool suspended;
+	int ret;
+
+	if (chan->is_paused)
+		return 0;
+
+	ret = read_poll_timeout_atomic(axi_chan_is_suspended, suspended, suspended,
+				       2, 40, false, chan);
+	if (ret)
+		return -EAGAIN;
+
+	axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED);
+	chan->is_paused = true;
+	return 0;
+}
+
 static int dma_chan_pause(struct dma_chan *dchan)
 {
 	struct axi_dma_chan *chan = dchan_to_axi_dma_chan(dchan);
 	unsigned long flags;
-	u32 status;
 	int ret;
 	u64 val;
 
 	spin_lock_irqsave(&chan->vc.lock, flags);
 
+	chan->pause_requested = true;
+	if (chan->is_paused || !axi_chan_is_hw_enable(chan))
+		goto wait;
+
 	if (chan->chip->dw->hdata->nr_channels >= DMAC_CHAN_16) {
 		val = axi_dma_ioread64(chan->chip, DMAC_CHSUSPREG);
 		if (chan->id >= DMAC_CHAN_16) {
@@ -1251,17 +1310,11 @@ static int dma_chan_pause(struct dma_chan *dchan)
 		}
 	}
 
-	ret = read_poll_timeout_atomic(axi_chan_irq_read, status,
-				       status & DWAXIDMAC_IRQ_SUSPENDED,
-				       2, 40, false, chan);
-
-	axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED);
-
-	chan->is_paused = true;
-
+wait:
+	ret = axi_chan_wait_for_suspend(chan);
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
 
-	return ret ? -EAGAIN : 0;
+	return ret;
 }
 
 /* Called in chan locked context */
@@ -1295,6 +1348,8 @@ static inline void axi_chan_resume(struct axi_dma_chan *chan)
 		}
 	}
 
+	axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED);
+	chan->pause_requested = false;
 	chan->is_paused = false;
 }
 
@@ -1302,15 +1357,31 @@ static int dma_chan_resume(struct dma_chan *dchan)
 {
 	struct axi_dma_chan *chan = dchan_to_axi_dma_chan(dchan);
 	unsigned long flags;
+	int ret;
 
 	spin_lock_irqsave(&chan->vc.lock, flags);
 
-	if (chan->is_paused)
-		axi_chan_resume(chan);
+	ret = 0;
+	if (!chan->pause_requested)
+		goto out;
+
+	/* Hardware ignores resume until the suspend request is acknowledged. */
+	ret = axi_chan_wait_for_suspend(chan);
+	if (ret)
+		goto out;
+
+	axi_chan_resume(chan);
+	if (chan->cyclic_restart) {
+		chan->cyclic_restart = false;
+		axi_chan_enable(chan);
+	} else {
+		axi_chan_start_first_queued(chan);
+	}
 
+out:
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
 
-	return 0;
+	return ret;
 }
 
 static int axi_dma_suspend(struct axi_dma_chip *chip)
diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
index 3c86e5d468ea..b18c9880711a 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
@@ -42,6 +42,12 @@ struct axi_dma_chan {
 	void __iomem			*chan_regs;
 	u8				id;
 	u8				hw_handshake_num;
+
+	/* Protected by vc.lock. */
+	bool				pause_requested:1;
+	bool				is_paused:1;
+	bool				cyclic_restart:1;
+
 	atomic_t			descs_allocated;
 
 	struct dma_pool			*desc_pool;
@@ -50,8 +56,6 @@ struct axi_dma_chan {
 	struct axi_dma_desc		*desc;
 	struct dma_slave_config		config;
 	enum dma_transfer_direction	direction;
-	/* these other elements are all protected by vc.lock */
-	bool				is_paused;
 };
 
 struct dw_axi_dma {

-- 
2.53.0

