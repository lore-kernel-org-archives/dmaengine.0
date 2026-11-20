Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202046;
	b=qUtce9MtvrH9WtNSfAQsJ6BO/iVW+zFLEQ8XLpXJmxmqZAwE14F5Gk/6gvBa+0+z9/mE
	 Fk2Cni6srcQXeLECirzonzAwRXcHb6s/9o3Ha9Uj7yhN1RJoNgPl3Ga35v55FOqgSPX0W
	 m94OOMaWpglkRcusJYO/dodTYYkWi0iUHW9HTetY6QLiCS0JqtD1c8Ros3TAu4kl/wFIr
	 Jq0QbRWUkQLH0A1uHajLAekzr464YxnlfTFU4peevZk+S/kw3QpXwBMoSAJDFEtV7V9WX
	 NQ+N7EeSTYgUJCkPvnQbJgmCk9rlLShaCqPg07hDzhFyNKRCrdPZ8ni3MzzJeMLP+Rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202046;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=hff5tvGmP/RyFyMtruhnb2xhTD0GxWM6AkuaxxUQMjA=;
	b=sVtS09LmLQ3NPbPON5YZKs/6F+eb+k33lFU1XGKKynms7YWEuLzaNft6NcVjEeYcrYKr
	 0uiNRsneamIQmurUn3mWizEEqDrUmvUAzWUmJDUXlqqwZ2wfhm54q/reYHI/wObqTg6M6
	 xHt3cc7yQ+LDC3hPmOfGMde3lzc71wBJoNyQSkmZ2gFdhdiatuiWMExP/lsHYXC0ddXaH
	 5zIZuH7rx6ztkPVIbKGWy9MSj1pxcGGM38E9/RC7rMT4ug6BY17va1ewrJqJ5P/vHRIhD
	 GPmTeRy/a90/OSumDWFDdQDf11iM1wO3nz6cF9XYqvwBK2+S/8wX0vYrejt3/DFrppg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rWkf5jVC;
	arc=none smtp.remote-ip=209.85.161.50
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C7F60A2613
	for <dmaengine@vger.kernel.org>; Fri, 20 Nov 2026 19:14:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5C7F60A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rWkf5jVC
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-702dedeb70dso829940eaf.1
        for <dmaengine@vger.kernel.org>; Fri, 20 Nov 2026 11:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795202045; x=1795806845; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hff5tvGmP/RyFyMtruhnb2xhTD0GxWM6AkuaxxUQMjA=;
        b=rWkf5jVCB8LNCMh8N4AVYV5aWMG2fVD2EYCdQGGwTx6bHuW2pDeGm6d11kjsa1K8UI
         H5P52CHryu6ry3HvWHGLwRyVuPAE2sz590oz9ZBctoeosw/R7+3DumPTUc/11BhDLrRY
         on2wZDonBh30+zAUVHwAx0QJeO5Lq++chXZjsGCvc3kypauJti8RFW7bT/8rIHzboLL4
         ESWbD+d9jJNFTl709tRvWsEGtFZdICT+FvPB2kufXRBw3W1aFgzK5WNj+dJjPvMoas9a
         WfsgPJilomteRNE2D0SiQNhkTkrt90gE+ZjU/6NI/tk66dmRM0R06KOi8YgwVccvdCKP
         HmJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202045; x=1795806845;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hff5tvGmP/RyFyMtruhnb2xhTD0GxWM6AkuaxxUQMjA=;
        b=gCZ87YGUkCJeMP4c0+ExjKiA3Aq1OPJKxqDv7/SVEXjb9pwW6//D232JqXLOw68NDy
         V+B3uZGSptTamo85FToJAZWFeOTHzqurdnuhq+rcQihMK/fijnuojU/bS8MWJRpDmd+4
         ccrSaxhDrjVrahzijaMa6cfiU6FUVbB+Zk32iERS2VgL8g0lnWYUs+EB2R5an6D4J8zN
         m3X9LUXAfwaID+yDdJEa0wELb+/pCq7cCCEAnd2gCQdy8jyDQcZCr7VuKM4hJ/AqITSW
         UTCuNitrEj3KCTDn8fnIqJ1v188G8Hee+jlr3oJQR4jtaLTjlK6BfGLzgZfOQUmGOdtl
         iEEA==
X-Forwarded-Encrypted: i=1; AL+hErE+jzcXrdDS9AARVjCUTtyrrcPajwpI2mg5Q08JbbsiIGRLhwgfn/WR1PVA4fnWJ98qSr1nchPZ2Bo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Z71QheVFiRUCTe9A7jqJOM9T4ryxdpvPCZzst99zrfOrw2O3H
	alDlyPAiTzVIaF0jZ6cmtWzghQ46yalARV71FUgLaUTDNUa/lCMv+UH+
X-Gm-Gg: AYBFou1kVFLGd+QnDGjOkb4B+CjBjeivk3FtTOwto+GNoTNCgaJwHFQSaF6f/ARHLKf
	ajgWjMiaJsVWE/f0vurbSXXVM0TkjLonvcG3HtjVEIQnvl69dNzQusL1cVgura2AK4cQ4LXpQZP
	gtLWuOUGti9GHUJKrdRDIx2LktLFSVDY2gSLmzI50GoQbnvPQJ10FjdHss8KdyibW6e2QFADygZ
	3Z3afBUyHryqnU3FF8jXQP5iyL/NHUeO2e8YUstJDLAlzOeTXWMZtwSLHw79LKqg5vlMw5v/VKe
	sWI9nCkQYuj+g4erOzRcdKDNoCoHKP1Gn77X64xvNyKUWss4LVjciaGOZEszgIfe+CUU6FT08vY
	Z5g3mOUuRCnbr0OVvc+gXOPlP5hdGliCluglVIu7dVMR/OtN+ZsVWuP0RRHJHqOGtqEIaNsCOwi
	WFZ5mUNd6e2NK3yZYccTndvWnjRIUjgHIfPxkpCs4jheE1qvc5bOFbqxxOWAr/SVkVlXEIxUfz+
	iFJfa3yUSN2ShjMcOltBRubof2GBIhLKBjwDdz97ATlcw/XSKpalWl0f3D1JNTMckjdPGf5vlMe
	nuqgOlV1Hvl1meRdQWXytqIPQmh5pm5ZP7oN/+cWZs2Z9w4P3theubpXzsS20jdU25zpp9y29SG
	0AG1V7T7Rk+A5J/6nW8APxqKSQ9Hv1DMkYahgZH1jKkfFKGRCTBzX764qWmWAer1cnXirygirQI
	AQT/K5hm6NYLgB4MnzI2LWG/qljfCyJciGuNDDk8PrrQkQZM6JzEMe
X-Received: by 2002:a05:6820:891c:10b0:70b:8148:94f with SMTP id 006d021491bc7-71b39588aaemr2283538eaf.76.1795202044585;
        Fri, 20 Nov 2026 11:14:04 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168f3964sm2654782a34.14.2026.11.20.11.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:14:04 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 12:13:55 -0700
Subject: [PATCH v9 5/9] dmaengine: dw-axi-dmac: preserve pending pause
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
Message-Id: <20261120-submit-dw-axi-dma-stop-pause-v1-v9-5-48ab58961d6e@gmail.com>
References: <20261120-submit-dw-axi-dma-stop-pause-v1-v9-0-48ab58961d6e@gmail.com>
In-Reply-To: <20261120-submit-dw-axi-dma-stop-pause-v1-v9-0-48ab58961d6e@gmail.com>
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

Leave SUSPENDED to the pause and resume paths. The channel latches the
status for polling but does not enable its interrupt signal, so leaving
the bit set does not assert the IRQ. Track the suspend request separately
from its acknowledgment so a timeout can be followed by either a pause
retry or a resume. Wait for acknowledgment before clearing the hardware
request, since hardware ignores an earlier clear. If that wait also times
out, return -EAGAIN with the request still pending.

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

