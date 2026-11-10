Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794279974;
	b=TBPX3tyn4E7aFSFtUeFVnbTdRpMDMNHdNrpZHnh4lHLxYRwgbjQYUtTqIHk3zXKtz4cK
	 QaKxJG/+A1F8cRgLpFHFrubURjbAsX5Pv7mTAA2t2z4MWGRhuueP6RWCeiEh74NzoWtgc
	 lX1s0rtHK1y3wrxaFkNEYcyHYmcm9RlMgA+46RBoTaTd88KA3VQDXFtD8Qjnt5LU5gArd
	 4ntCHzA1ONoM6ZqQR8NsiQB5gwTpNGL+24dodUeFLyLngV84+GUdNO6ScqkC4ntAoPRkH
	 jnn1RFulvSoxKu4NDa8MIGwBDlRT1tR8tYW++K3lwxLDolFKY2Yahbx3XqZEPM4g11g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794279974;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=L5RBou/wH7W3yruKU0mo8RfLDeMK/TCy1QAXcInHKoU=;
	b=GsfiaKiH2TX2V97t15EsZmhdaR3YcTzIxjCIq+uX+a6Sqr4eWvQ0ONUtScOwlVKIGEYs
	 K/GLGxDzXMxUBFke3j0rXY/WVvcclaphngEkLzI2Wm+O6gE4bb1E+0VV7rJWKRlIYYImh
	 LWGfUHvP9x7voYN4WTsnh5Y1JLefWgmvfrpvRbGeDUXbeVocPvL+NTsPZ/+YU89uW/Lr3
	 c+r5LN/DbGiMsgl4JJHbBvU2PpV46LNszOlHe1yRgd12N8DGMn0KVOeybRV9zM9bP4SG7
	 /Rk8+t8D65SgV7xNnVUA7rUrTB2kdIuUSgWpGYOMfjyT7V77me1h1nMeh7gGuYEDatg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zpZ83bBH;
	arc=none smtp.remote-ip=209.85.160.42
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE40760A260F
	for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 03:06:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE40760A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zpZ83bBH
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-4ad587ba293so997016fac.0
        for <dmaengine@vger.kernel.org>; Mon, 09 Nov 2026 19:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794279973; x=1794884773; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L5RBou/wH7W3yruKU0mo8RfLDeMK/TCy1QAXcInHKoU=;
        b=zpZ83bBHPjitTsbXQSBxAveULYnRjdbE2GCb8MBC/DTfSjGrK1Sg+CNmJlp/34qXmO
         CDr6ESQwnI3xMSk0pvIKebgMf1VJaOf7E2pO0K1CMy2nz0qNu+W/iF2MdcYbtxDylroe
         6iL1L2CDh/KzUgT5dLJi/v2RSHneIhTB8ofs1iPgWkD3po2glqrUJ4W6tJKt2kLXYrb7
         6SnNtCWgDLC59K0YJzy+D1Y9qr4jpuBi103ZcBQnxMvTa+gJUGuDbY+uyQh2TdlJNjrB
         GzUY4arOeKQZUK8BMhg6lZhKFVKjcjrYSkROVySBigBqo83KNsqq5brJZqaOEEtY1aFt
         Axeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794279973; x=1794884773;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L5RBou/wH7W3yruKU0mo8RfLDeMK/TCy1QAXcInHKoU=;
        b=tjG+SBXjDNFLVP2aEr+UkAWFAMqhFIdVuj7e+IHRUXBklUn2tsePDBUjeUg3Lkd0OU
         quVAvVTncxk7aFnh8ovP6OtRwCXGmkhm6Hs5c5GUc+ZOwBM3DWV3+fO/pHhFr45PkDZ9
         w8Au0RDeYGAdMo0dppkgscEYwmQhw/xMVD9pH6uq/1ai+VnW5WCYMdtRRBaZlEzM0CVO
         zReL+xh8TlpI0mFvJklLDLbg0WcqPfJFFx9U2Qv6QmGYRB5OOegmhp2CR3ccu/i2xEYA
         PCMCcZMOAaXjnSdf3A9WMZNngp5YZ++GJ9ilJnlh1fwr0YYhSGugowQneupVJ59xLJKq
         Vkhg==
X-Gm-Message-State: APuU4Z9jciqiXn0gdd9xtxj51Wj+K0u9CZLKmflevQv9wpZI3lDpQbnB
	5Jrm08LfBP/kGxtfNdF6oWPi/29DmwAb5cQ0eGkr88l//j64EweFqt/c
X-Gm-Gg: AYBFou05PEJu+cF8ktT3SrYodjmCrp5A7BVu9esmivABDEsFaHkAzKjcS68nWYQxo7S
	zK+k5AJhQLuvBJ92gcgkrlO+FVj0F54KBDRKVfoomvv6krQV0Ny3jh+ZyUFEWX2cq4tkO4OGsrZ
	1WFgrngPaBjFW/3erj1WH/ubNvx1J0Ky8jJ3jZkAU4IFM9k0C/+PhYNYYST+K5F/FUKfrTeSbCJ
	h7V9NR2q7HHyZ18sOOlCOwVh0aGGRWMBp2t6oUDiuRow8ItjnZMci0M74rA1GRIYtx9TvTDlCKO
	lpJP+rgrEj/fPuOp+89IcOg4nYayj4FcDdsClt6eA+VbV+ELY4vflVFq7b0g3GUJJ1W4NMimxce
	ZNcv764TNYsKoYY+D5T94vsZseph+K27/90q++y1UrZH95uRh++fhkWB3k3PlYY41N0vNBtAe5c
	2Yi1YgIogYCwPWoseltOl7WoaFC+QDWaLhGBWucy2cD4CUjDpn3UmlNvbP7mD14YfIOaEXpv/RX
	IDjD3/kPzf6L/Ry+PFztlc1gX3HJNO+Iv0LpHYJNsA0fOThcuNZp2S9l8vpoQ3AoP8dimg5zEJx
	/ydbNf3GJpOxicZ97kkvsO+eFOowbkLMCQVXMDJr2QA/7Z78aZDYieNkMV1V2ee8m4ioGuovuNi
	bXzJW/ZqqRrNODPdFIQJFl4gpo2LIH2/v7WOh8I0Rw35+0ZuBEQoZUJ+UTFEJzY2kcuvJ8i7mOy
	ZYRPL4CNhkH9yk/ki1SjnXqVpqGl7jK7R2Gj2aBd57wYIN2TPB1FLL
X-Received: by 2002:a05:6870:f616:b0:4a7:6dc:af5f with SMTP id 586e51a60fabf-4ae22743a94mr748298fac.53.1794279972710;
        Mon, 09 Nov 2026 19:06:12 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ae22fcdc93sm683389fac.10.2026.11.09.19.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:06:12 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 09 Nov 2026 20:06:02 -0700
Subject: [PATCH v2 3/3] dmaengine: dw-axi-dmac: preserve pending pause
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
Message-Id: <20261109-submit-dw-axi-dma-stop-pause-v1-v2-3-64adc48df793@gmail.com>
References: <20261109-submit-dw-axi-dma-stop-pause-v1-v2-0-64adc48df793@gmail.com>
In-Reply-To: <20261109-submit-dw-axi-dma-stop-pause-v1-v2-0-64adc48df793@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Sergey Khimich <serghox@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2

dma_chan_pause() clears SUSPENDED even when polling times out. Hardware
can set that status after the last poll, including during the final
delay, and the unconditional clear then discards an acknowledgment the
caller never observed. Another channel's interrupt can also consume the
status because the shared IRQ handler clears every channel's status
before taking its lock.

Leave SUSPENDED to the pause and resume paths. Track the suspend request
separately from its acknowledgment so a timeout can be followed by either
a pause retry or a resume. Wait for acknowledgment before clearing the
hardware request, since hardware ignores an earlier clear. If that wait
also times out, return -EAGAIN with the request still pending. Use the
atomic polling helper so an acknowledgment during the final delay is
observed.

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

Fixes: 1fe20f1b8454 ("dmaengine: Introduce DW AXI DMAC driver")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 101 ++++++++++++++++++++-----
 drivers/dma/dw-axi-dmac/dw-axi-dmac.h          |   2 +
 2 files changed, 86 insertions(+), 17 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index 281d7c79246e..5c1eb120a28b 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -481,6 +481,8 @@ static void axi_chan_block_xfer_start(struct axi_dma_chan *chan,
 	irq_mask |= DWAXIDMAC_IRQ_SUSPENDED;
 	axi_chan_irq_set(chan, irq_mask);
 
+	axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED);
+	chan->desc = first;
 	axi_chan_enable(chan);
 }
 
@@ -489,6 +491,9 @@ static void axi_chan_start_first_queued(struct axi_dma_chan *chan)
 	struct axi_dma_desc *desc;
 	struct virt_dma_desc *vd;
 
+	if (chan->desc || chan->pause_requested)
+		return;
+
 	vd = vchan_next_desc(&chan->vc);
 	if (!vd)
 		return;
@@ -543,6 +548,10 @@ static int dma_chan_alloc_chan_resources(struct dma_chan *dchan)
 		pm_runtime_put(chan->chip->dev);
 		return -ENOMEM;
 	}
+	chan->desc = NULL;
+	chan->pause_requested = false;
+	chan->is_paused = false;
+	chan->cyclic_restart = false;
 	dev_vdbg(dmaengine_chan_dev(dchan), "%s: allocating\n", axi_chan_name(chan));
 
 	return 0;
@@ -1087,6 +1096,8 @@ static noinline void axi_chan_handle_err(struct axi_dma_chan *chan, u32 status)
 	vchan_cookie_complete(vd);
 
 	/* Try to restart the controller */
+	chan->desc = NULL;
+	chan->cyclic_restart = false;
 	axi_chan_start_first_queued(chan);
 
 out:
@@ -1135,12 +1146,19 @@ static void axi_chan_block_xfer_complete(struct axi_dma_chan *chan)
 				}
 			}
 
-			axi_chan_enable(chan);
+			if (chan->pause_requested) {
+				chan->is_paused = true;
+				chan->cyclic_restart = true;
+			} else {
+				axi_chan_enable(chan);
+			}
 		}
 	} else {
 		/* Remove the completed descriptor from issued list before completing */
 		list_del(&vd->node);
 		vchan_cookie_complete(vd);
+		chan->desc = NULL;
+		axi_chan_start_first_queued(chan);
 	}
 
 out:
@@ -1162,6 +1180,8 @@ static irqreturn_t dw_axi_dma_interrupt(int irq, void *dev_id)
 	for (i = 0; i < dw->hdata->nr_channels; i++) {
 		chan = &dw->chan[i];
 		status = axi_chan_irq_read(chan);
+		/* Leave suspension status for the pause and resume paths. */
+		status &= ~DWAXIDMAC_IRQ_SUSPENDED;
 		axi_chan_irq_clear(chan, status);
 
 		dev_vdbg(chip->dev, "%s %u IRQ status: 0x%08x\n",
@@ -1207,6 +1227,11 @@ static int dma_chan_terminate_all(struct dma_chan *dchan)
 
 	vchan_get_all_descriptors(&chan->vc, &head);
 
+	axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED);
+	chan->desc = NULL;
+	chan->pause_requested = false;
+	chan->is_paused = false;
+	chan->cyclic_restart = false;
 	chan->cyclic = false;
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
 
@@ -1217,15 +1242,49 @@ static int dma_chan_terminate_all(struct dma_chan *dchan)
 	return 0;
 }
 
+static bool axi_chan_is_suspended(struct axi_dma_chan *chan)
+{
+	if (!axi_chan_is_hw_enable(chan)) {
+		/* A completed transfer cannot acknowledge a new suspend request. */
+		axi_chan_disable(chan);
+		return true;
+	}
+
+	return axi_chan_irq_read(chan) & DWAXIDMAC_IRQ_SUSPENDED;
+}
+
+/* Called with vc.lock held. A timed-out request can still be acknowledged. */
+static int axi_chan_wait_for_suspend(struct axi_dma_chan *chan)
+{
+	bool suspended;
+	int ret;
+
+	if (chan->is_paused)
+		return 0;
+
+	ret = readx_poll_timeout_atomic(axi_chan_is_suspended, chan, suspended, suspended,
+				       2, 40);
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
-	unsigned int timeout = 20; /* timeout iterations */
+	int ret;
 	u64 val;
 
 	spin_lock_irqsave(&chan->vc.lock, flags);
 
+	chan->pause_requested = true;
+	if (chan->is_paused || !axi_chan_is_hw_enable(chan))
+		goto wait;
+
 	if (chan->chip->dw->hdata->nr_channels >= DMAC_CHAN_16) {
 		val = axi_dma_ioread64(chan->chip, DMAC_CHSUSPREG);
 		if (chan->id >= DMAC_CHAN_16) {
@@ -1252,20 +1311,11 @@ static int dma_chan_pause(struct dma_chan *dchan)
 		}
 	}
 
-	do  {
-		if (axi_chan_irq_read(chan) & DWAXIDMAC_IRQ_SUSPENDED)
-			break;
-
-		udelay(2);
-	} while (--timeout);
-
-	axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED);
-
-	chan->is_paused = true;
-
+wait:
+	ret = axi_chan_wait_for_suspend(chan);
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
 
-	return timeout ? 0 : -EAGAIN;
+	return ret;
 }
 
 /* Called in chan locked context */
@@ -1299,6 +1349,8 @@ static inline void axi_chan_resume(struct axi_dma_chan *chan)
 		}
 	}
 
+	axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED);
+	chan->pause_requested = false;
 	chan->is_paused = false;
 }
 
@@ -1306,15 +1358,30 @@ static int dma_chan_resume(struct dma_chan *dchan)
 {
 	struct axi_dma_chan *chan = dchan_to_axi_dma_chan(dchan);
 	unsigned long flags;
+	int ret = 0;
 
 	spin_lock_irqsave(&chan->vc.lock, flags);
 
-	if (chan->is_paused)
-		axi_chan_resume(chan);
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
index d8dd07efe60f..c61fcf070958 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
@@ -52,7 +52,9 @@ struct axi_dma_chan {
 	enum dma_transfer_direction	direction;
 	bool				cyclic;
 	/* these other elements are all protected by vc.lock */
+	bool				pause_requested;
 	bool				is_paused;
+	bool				cyclic_restart;
 };
 
 struct dw_axi_dma {

-- 
2.53.0

