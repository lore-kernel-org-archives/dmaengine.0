Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794366923;
	b=Pe+eLcaEJZ7enpL8i/uaXD0p5v/X7p5PBbVsIFz5h1u11v4Ar3bYlnvv17/CTXBWDiUM
	 dtan+rAFjP2VnG25mRdIPsVb/MBIy6NDXejMQ9bNR5IrGKQHzMMwpS0Yc8i28w0TziWDy
	 8KDoxKKdTugo9DZqfuHTGiAaUgUCR1IvxvYUOeBIb0AnEdm+VMDVh+RvpVjURZNpSPaFs
	 t32R8zkzVsgC897AGgPL0Gqzi5Jbs5JG7JsqXrl68KhcRKVp4NFk/xxEgSq/+YOJxrY9p
	 yc0D/LDcBAxvjGmLNQ7oQLR3V6odm5+6WmYN1ZBkc7dLPxth9EHZsSRiwQg8IrJ3Jsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794366923;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=e8df/NTz16j2LV3MQZg86rEAVGswadD7PiuI8Twx1p0=;
	b=o7cCDcdxHQl3z8606ChKcqaMHxkmXFrdG5NClv/9hsL4DacHVqXgbiwLMmjKKNfZlr0Q
	 7mi8/raeSuaf2gsE9vw01Xm1tVxr5d2cRh0JzSh3v8y60h7jcrfF3WeS8smu9azzI8Kw7
	 qe4ukix94nA7B/eaQB4tjEA/dH5R86+rvSVBILcN8Gs6S6h7Uml3jOhhdyNoOHo2y38Zx
	 5MRdu1CQrDxpqC4jb044hi7Eq4mh02Kuv1TyOTc7VvkoOBi1+4KKB9B1W9iEXooTgJmQ7
	 A/wh9YEj88RII6DrR8amG1N4FLwIC2EOXljPeLH3iMXEYeptDODiF75UaIs+cygypyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NM9Zi3Ii;
	arc=none smtp.remote-ip=209.85.167.171
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B2660A260D
	for <dmaengine@vger.kernel.org>; Wed, 11 Nov 2026 03:15:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9B2660A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NM9Zi3Ii
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-4d198f1a591so1574437b6e.2
        for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 19:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794366922; x=1794971722; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e8df/NTz16j2LV3MQZg86rEAVGswadD7PiuI8Twx1p0=;
        b=NM9Zi3IiTgTIAVvQEwPuqucUI3hZjzVN9oiZHndW6EwIu3qMEu8SsdWIfZzgFEe+vf
         a03GbCIJgFjkJBB9LOVfQKk22BGWgnBcGSOOtz5tO2i1VE9LXLiixlF2k7W8oE/AH8QL
         sGygvYzmTDypIm5YtQuhsdv6nWWsaFqzlTahGmjzzlzJG5XDgmaZj/+9t17raNVlmmZC
         LC5aOCxo5vP7YEEujpJXPpa85E53UwCcn3ZuxcZcdGEYMu7x7FwIDaayS5anciWtBW1T
         RiPeEmm/bVtpDzlLFhv1k2g9r7lV4xHbOErQClMKGQ9boU7AgVDOIBp136wpbPlValnE
         YAuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794366922; x=1794971722;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e8df/NTz16j2LV3MQZg86rEAVGswadD7PiuI8Twx1p0=;
        b=uYsMxJZkXDGawSUtRnyximu3A2yOYIOoXm9ixjrGYzqmdBO+/wkctkfvtljyUW5F6c
         6gBBOfxRH+xIGpsC31FjTfF3xuZwqgnEx8oumbxPISi4i0DEtv+ET5GbDe6cVG2NuCn3
         idA2YGapX08a+TxXEb1XaCPSEYGBUzvk8bBdA1Wnt41YgA7ldxAc70PdGzJxLMKhSgBR
         1a97relU9jcw9cgXhPVZW/SfbhlMnZwd2tElJmdfgogz0YiPuet4De/VWJ79mcWpczQf
         LFBWHLz3xZ6F312mcSf64ilzPxMcge9W52cMQz2ruUndiqtBSvsY18fmJuPEF4EYHxPQ
         frqw==
X-Gm-Message-State: APuU4Z9HF5uJIsaE376FItndDSAxwrHz8EWRoQeoLT1XzPHaON7Yy+/p
	mbXsVXraoYGLcr2TNkTdxlmy87Ljmxxm6xaQ1JcTo623GYdrc16ddl6u
X-Gm-Gg: AYBFou1WM7vHIiczhEIKx1ti9Hi75KzpSsJUSSpKeA7gM4Uqp8HAI2BuNaiojossdgi
	9iLHOjQtCrbaaaL82zVARCP7Ut0GK+PrRxPGjAFEfrjsC8TK/0jzGSo43/9J6OYORgJIPQv+CC6
	6sNRNNdBzFz5HuAa7xM2j0zfjEZ8WicTxKs+OTAvoDx3ODFWhNSWZYCklojS6SaAlSU5FvMIgV/
	pGGF6E2scG39F8Dk3400aX/gOoaMkRJRwK33EjiERSadtxzN7h/LsRrWZ/FuXF3Sa8+yUoKFRdJ
	sbRtOBskvFTKJOjgMPRo1NKllh8KKAzXQbvoJMs42t/2y5h8N1bbDsV+ewQhL3NbXpJwGNHRw5g
	71nCdFsYOtx0wWjbHGi3cMZHONc0QxIVbUwQezmXPX2/G79+XEYaoWGW56Awgmnji5aQS0ENt9Q
	maUqFpCK+5JOSzkaCslTUjkwhV9/WGN/IZhaawYvwnikxwXhwpUkhAjz3TrwXYUZJhnKU+0d2yG
	NLdDAoiQcVOGeRaQWqmeSSja+Ox07EmPrB1LETY93kSGXe2VoX4dRECM4djvImjCwVpw6AP3JVQ
	F9axIBw+UG/h6PrZKSNO+Gngn7hhvYnNc4FH0c29DUgwWVwKcFlZ3l+962nzNogd3tBFBRvS9EQ
	meAO0+7EjkKHobPRwIOTWYmqbMc4UBUGP6Q3+Tp/JeELgyfNM9ZnxEP36ZGHbv4p07t/yrVUFvo
	LZWTA1RCIj5L1D4RLAVGC2I6D88tyHTT2QEhttNzu1+Aahj6T0Egk=
X-Received: by 2002:a05:6808:1b8b:b0:568:1649:9c3a with SMTP id 5614622812f47-56b97c17678mr1028974b6e.43.1794366921604;
        Tue, 10 Nov 2026 19:15:21 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm3999345b6e.3.2026.11.10.19.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 19:15:21 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 20:15:15 -0700
Subject: [PATCH v3 4/4] dmaengine: dw-axi-dmac: preserve pending pause
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
Message-Id: <20261110-submit-dw-axi-dma-stop-pause-v1-v3-4-35fdfba8b61d@gmail.com>
References: <20261110-submit-dw-axi-dma-stop-pause-v1-v3-0-35fdfba8b61d@gmail.com>
In-Reply-To: <20261110-submit-dw-axi-dma-stop-pause-v1-v3-0-35fdfba8b61d@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Sergey Khimich <serghox@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2

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

Store the lock-protected pause flags as bitfields in existing padding,
keeping cyclic in a separate byte because it is set outside vc.lock.

Fixes: 1fe20f1b8454 ("dmaengine: Introduce DW AXI DMAC driver")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 98 ++++++++++++++++++++++----
 drivers/dma/dw-axi-dmac/dw-axi-dmac.h          |  9 ++-
 2 files changed, 90 insertions(+), 17 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index bb305ab94d02..6f15fcb790a8 100644
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
@@ -1208,6 +1228,11 @@ static int dma_chan_terminate_all(struct dma_chan *dchan)
 
 	vchan_get_all_descriptors(&chan->vc, &head);
 
+	axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED);
+	chan->desc = NULL;
+	chan->pause_requested = false;
+	chan->is_paused = false;
+	chan->cyclic_restart = false;
 	chan->cyclic = false;
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
 
@@ -1218,16 +1243,50 @@ static int dma_chan_terminate_all(struct dma_chan *dchan)
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
+	ret = readx_poll_timeout_atomic(axi_chan_is_suspended, chan,
+					suspended, suspended, 2, 40);
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
@@ -1254,17 +1313,11 @@ static int dma_chan_pause(struct dma_chan *dchan)
 		}
 	}
 
-	ret = readx_poll_timeout_atomic(axi_chan_irq_read, chan,
-					status, status & DWAXIDMAC_IRQ_SUSPENDED,
-					2, 40);
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
@@ -1298,6 +1351,8 @@ static inline void axi_chan_resume(struct axi_dma_chan *chan)
 		}
 	}
 
+	axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED);
+	chan->pause_requested = false;
 	chan->is_paused = false;
 }
 
@@ -1305,15 +1360,30 @@ static int dma_chan_resume(struct dma_chan *dchan)
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
 
+	axi_chan_resume(chan);
+	if (chan->cyclic_restart) {
+		chan->cyclic_restart = false;
+		axi_chan_enable(chan);
+	} else {
+		axi_chan_start_first_queued(chan);
+	}
+
+out:
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
 
-	return 0;
+	return ret;
 }
 
 static int axi_dma_suspend(struct axi_dma_chip *chip)
diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
index d8dd07efe60f..4322f9f89fd7 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
@@ -42,6 +42,12 @@ struct axi_dma_chan {
 	void __iomem			*chan_regs;
 	u8				id;
 	u8				hw_handshake_num;
+	bool				cyclic;
+	/* Protected by vc.lock. */
+	bool				pause_requested:1;
+	bool				is_paused:1;
+	bool				cyclic_restart:1;
+
 	atomic_t			descs_allocated;
 
 	struct dma_pool			*desc_pool;
@@ -50,9 +56,6 @@ struct axi_dma_chan {
 	struct axi_dma_desc		*desc;
 	struct dma_slave_config		config;
 	enum dma_transfer_direction	direction;
-	bool				cyclic;
-	/* these other elements are all protected by vc.lock */
-	bool				is_paused;
 };
 
 struct dw_axi_dma {

-- 
2.53.0

