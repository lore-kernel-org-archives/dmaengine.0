Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795111390;
	b=Es7xwMgLIyHwJyKddXIwjSrmap/wlPfLHaKByETgHN0Eg5NpHSEOGRpzV8DOl4DKLiRV
	 TcL27BFiYIcsgmaZ1vrfzUyeBA12LUcny0kApt7uecLwVnRDMv1vYsGBuj9tHjwPS50L3
	 bGPJ/ufO48nxjP8ZLtr2+E2pcLezfoyzF2utb3jTtr3KuvUGBN4lz82QEeAQNy1s1XHxg
	 HjE76q97YyRiiUMv5CwtW6uvZEHaNrToUgpPzz2WhdSz8x3M0/PyCW30+D3p+HzBuEwp/
	 F1ZYBCeidGj7tqYSNw3crk1ELDWcn+md2dMK1gjL+CyZXpKmEFzDVjt5CZmtyCzOOWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795111390;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=xgSmoxBrqnKlDHDPXkpFmY/x2C8GWXkCurAJnyoUmxM=;
	b=aScv1r4c/U3ZE7HfB0VL6OY8X/JLkdYrd8F8efWyzLKk3ExNeh3SqMm+FkESB4PI9rz8
	 g65dMyOKrx7R0ZCHygPzwYxTJtwsbrYQbxcSzXpLvVtqvptkKZfKHnFNMkYVwrN6qgCEK
	 X7Stqk3Hrsi7w6/bzGDD2kQ0Mf4DndC1ZzuELHK5AuMuz3vLmLZ4E1j4t7ABL+UeVDKnN
	 35sTHKIUpLTs9ErDihKCaN7j4CysZRQicIK2x5C79AuNyUEdmCppED6Yf1bWKZY6XM0rc
	 GIKsuHPiMPMMzVMciIojuiWTQMm2hGqe/oWdFj4GS2dB91/PFGqmTVAs80593BECltg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fzRNPf51;
	arc=none smtp.remote-ip=209.85.161.46
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1D9606A332
	for <dmaengine@vger.kernel.org>; Thu, 19 Nov 2026 18:03:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B1D9606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fzRNPf51
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-71acdd32a53so1000585eaf.3
        for <dmaengine@vger.kernel.org>; Thu, 19 Nov 2026 10:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795111389; x=1795716189; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xgSmoxBrqnKlDHDPXkpFmY/x2C8GWXkCurAJnyoUmxM=;
        b=fzRNPf515yOTUM7GQIR5y2GWzmgvJd98uCwhAzFHCQTfZTRxWKOVI4uFLxPDCUhzEO
         csealtC7PMGowcKCUW93tRfedWxQgYp0whXXWN07WjKOkCsNBKBoC9SUxr7Uqauc0fBc
         vs+W3JwusJ9foX4WIaSISR9/VxtfnkH0SCtWAdJRA6O4n1zmpOgZr9GyPejh4wu2afe9
         A/Rt5IVQhu01UB029MLMxs7MYDOoX+0WrrCDRCiBa3AUeYDeKcUwLYZ96Izby7V4VEQp
         Nx1lCAs8XSmvA72RHn6FGZnQ4hJ8gD3XHta0u64LX6dM7w9SNh7I0iP7JbNTbaOMUHiY
         Gwyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795111389; x=1795716189;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xgSmoxBrqnKlDHDPXkpFmY/x2C8GWXkCurAJnyoUmxM=;
        b=h8Ph7xji3oiNtSqSowtE9Ph3uuKCmTGBuHjZS5XkNh8FjoJ8aNtBZksHq4kksj8W2U
         DPtdlWF607MIRVJMxQBKa9KaBGkmoEoOkTWk2UAbQiSfMzO5komKoS0Gv5RavzC7CxP9
         bSZM7HxTpLf/0W5M9z1Sd4GcMgfZcOfX7tvBztBlZ4LipaNXfOD819hwdE8ElV2AutOJ
         JwZ3Ohgr1TFNJlBMueOTIRm7xwmnZ9QHcLafBo310+5OLg3iMcpHWePV+FGjiqKlYOId
         0BIgU5x4Uu8BWo8ZXepiEs64qrWPNqjZKApSd9lC3eooUwwSPPmfCKuKPqYDaNaxOkQX
         Ch0w==
X-Gm-Message-State: APuU4Z8QaDeASaihN6w5Zky+McjNZNLSz4AbIPRldhpUfruWNfWvNAwh
	RdS6AgvcqWtFfeKEmOs1pOgwujmQBkaKNbn+sRKE097C12v/PS5MzSdP
X-Gm-Gg: AYBFou0X6+zBUw8VD6UMZE5GvMdsLewAlvETYCRokBQXYknIAUK/RGJ5YX197/kG6G/
	YWprAe+72hPwNWtOWoGeOFmq/415XC34o7G5Xc0tdVzu/tsZ6m36660Txd2ebE4lKhbGElQUdJb
	/Uw365Ss+Q0A9RwQHw0U/SF7v/pPILAcU8oGOyaYX7rvmnGLibYgZ/fyAfWFFWw9aZm4cOQDpKm
	qAUp/Q4hU3FH478I6do6Q7rVGEv0OMPBwhxVBSqRj0tGSnidk19TD+B+ZBechgeF0CiV9ZtnRQM
	L+kv0mTqtad204+wgiLTV+55v/qjDPYEyEJIbEFw95l5okiPyWwOCtlk7R9DceN8X9ZN34lHuGZ
	k/t23kFyELuFVmzEZLP7ANMVJC+YBklgCarSTx2BjP8swYPP/+PwLQOGeRBBIIi4OsYuUCblDxp
	UpxAcyPkFIvkEI2sq4rIJgOutKxu55KJJFJkVQZIgkMb+ZTQWNiKIYMVDw6W8ecKwjgagQCzkCn
	VjSQUHxzy1jmm2whtR4KINIweRCpgCiFWVcDNLGx3QKxiS1bgNAjfGdYIzni/OScWJiRwIVik6+
	Lj21iTtrvGP2slNyMPxeu6oRRucsF/i0k0SXcv+s8qnxNS2+lKJobM4gCkn0VlMr2CNjGxi7eyo
	MNMrr95t2lBnkMbyBbapbS9HZ52zLSudbtD5nRoksKV66rmHicwnuCMoARiIEgarjpyXpoJEUFQ
	Lydd2lhXuAz1gcTElW+vBaOXQmWB7xyY9/lWiPR2Fq9UGq29bEZTyn
X-Received: by 2002:a05:6820:614:b0:71a:f794:49c6 with SMTP id 006d021491bc7-71b39566d0cmr341259eaf.69.1795111388904;
        Thu, 19 Nov 2026 10:03:08 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b3806ef20sm448478eaf.7.2026.11.19.10.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:03:08 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Nov 2026 11:02:22 -0700
Subject: [PATCH v3 2/3] dmaengine: sun4i: retain cyclic descriptors until
 callbacks drain
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
Message-Id: <20261119-submit-sun4i-dma-callback-lifetime-v1-v3-2-3935aef58db9@gmail.com>
References: <20261119-submit-sun4i-dma-callback-lifetime-v1-v3-0-3935aef58db9@gmail.com>
In-Reply-To: <20261119-submit-sun4i-dma-callback-lifetime-v1-v3-0-3935aef58db9@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
 Maxime Ripard <mripard@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

A cyclic IRQ queues a virt-dma tasklet with a pointer to the active
descriptor. sun4i_dma_terminate_all() frees it without clearing the queued
cyclic callback or waiting for one which has already started. The tasklet
can subsequently access the freed descriptor. There is no
device_synchronize callback to let clients drain these callbacks before
releasing their own resources either.

Serialize both half-transfer and end-transfer IRQ handling with termination
under the virtual-channel lock. Recheck the physical-channel association
after acquiring that lock so an IRQ which looked up the channel before
termination cannot use its detached transfer state.

Use vchan_terminate_all() to retire descriptors until synchronization. This
clears any pending cyclic callback. Retain them until a new synchronize
callback has waited for the IRQ handler and drained the tasklet. Drain
callbacks before freeing channel resources as well. Termination itself
remains usable from atomic context and from a completion callback.

The shared helper retains all collected descriptors. An in-flight
non-cyclic callback still owns its descriptor on the tasklet's private
list and retires it when the callback returns.

Fixes: b096c1377d1e ("dmaengine: sun4i: Add support for the DMA engine on sun[457]i SoCs")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun4i-dma.c | 41 +++++++++++++++++++++++++++--------------
 1 file changed, 27 insertions(+), 14 deletions(-)

diff --git a/drivers/dma/sun4i-dma.c b/drivers/dma/sun4i-dma.c
index 225e4a53502b..b0c91dab62f0 100644
--- a/drivers/dma/sun4i-dma.c
+++ b/drivers/dma/sun4i-dma.c
@@ -293,10 +293,20 @@ static int convert_buswidth(enum dma_slave_buswidth addr_width)
 	return (addr_width >> 1);
 }
 
+static void sun4i_dma_synchronize(struct dma_chan *chan)
+{
+	struct sun4i_dma_dev *priv = to_sun4i_dma_dev(chan->device);
+	struct sun4i_dma_vchan *vchan = to_sun4i_dma_vchan(chan);
+
+	synchronize_irq(priv->irq);
+	vchan_synchronize(&vchan->vc);
+}
+
 static void sun4i_dma_free_chan_resources(struct dma_chan *chan)
 {
 	struct sun4i_dma_vchan *vchan = to_sun4i_dma_vchan(chan);
 
+	sun4i_dma_synchronize(chan);
 	vchan_free_chan_resources(&vchan->vc);
 }
 
@@ -322,7 +332,7 @@ static struct sun4i_dma_pchan *find_and_use_pchan(struct sun4i_dma_dev *priv,
 	spin_lock_irqsave(&priv->lock, flags);
 	for_each_clear_bit_from(i, priv->pchans_used, max) {
 		pchan = &pchans[i];
-		pchan->vchan = vchan;
+		WRITE_ONCE(pchan->vchan, vchan);
 		set_bit(i, priv->pchans_used);
 		break;
 	}
@@ -339,7 +349,7 @@ static void release_pchan(struct sun4i_dma_dev *priv,
 
 	spin_lock_irqsave(&priv->lock, flags);
 
-	pchan->vchan = NULL;
+	WRITE_ONCE(pchan->vchan, NULL);
 	clear_bit(nr, priv->pchans_used);
 
 	spin_unlock_irqrestore(&priv->lock, flags);
@@ -970,13 +980,11 @@ static int sun4i_dma_terminate_all(struct dma_chan *chan)
 {
 	struct sun4i_dma_dev *priv = to_sun4i_dma_dev(chan->device);
 	struct sun4i_dma_vchan *vchan = to_sun4i_dma_vchan(chan);
-	struct sun4i_dma_pchan *pchan = vchan->pchan;
-	LIST_HEAD(head);
+	struct sun4i_dma_pchan *pchan;
 	unsigned long flags;
 
 	spin_lock_irqsave(&vchan->vc.lock, flags);
-	vchan_get_all_descriptors(&vchan->vc, &head);
-	spin_unlock_irqrestore(&vchan->vc.lock, flags);
+	pchan = vchan->pchan;
 
 	/*
 	 * Clearing the configuration register will halt the pchan. Interrupts
@@ -991,13 +999,14 @@ static int sun4i_dma_terminate_all(struct dma_chan *chan)
 		release_pchan(priv, pchan);
 	}
 
-	spin_lock_irqsave(&vchan->vc.lock, flags);
 	/* Clear these so the vchan is usable again */
 	vchan->processing = NULL;
 	vchan->pchan = NULL;
-	spin_unlock_irqrestore(&vchan->vc.lock, flags);
+	vchan->contract = NULL;
 
-	vchan_dma_desc_free_list(&vchan->vc, &head);
+	/* A tasklet may already be using the active cyclic descriptor. */
+	vchan_terminate_all(&vchan->vc);
+	spin_unlock_irqrestore(&vchan->vc.lock, flags);
 
 	return 0;
 }
@@ -1128,9 +1137,15 @@ static irqreturn_t sun4i_dma_interrupt(int irq, void *dev_id)
 
 	for_each_set_bit(bit, &pendirq, 32) {
 		pchan = &pchans[bit >> 1];
-		vchan = pchan->vchan;
+		vchan = READ_ONCE(pchan->vchan);
 		if (!vchan) /* a terminated channel may still interrupt */
 			continue;
+
+		spin_lock(&vchan->vc.lock);
+		if (vchan->pchan != pchan || !vchan->processing) {
+			spin_unlock(&vchan->vc.lock);
+			continue;
+		}
 		contract = vchan->contract;
 
 		/*
@@ -1138,8 +1153,6 @@ static irqreturn_t sun4i_dma_interrupt(int irq, void *dev_id)
 		 * interrupt (odd bit)
 		 */
 		if (bit & 1) {
-			spin_lock(&vchan->vc.lock);
-
 			/*
 			 * Move the promise into the completed list now that
 			 * we're done with it
@@ -1173,8 +1186,6 @@ static irqreturn_t sun4i_dma_interrupt(int irq, void *dev_id)
 				disableirqs |= BIT(bit);
 				release_pchan(priv, pchan);
 			}
-
-			spin_unlock(&vchan->vc.lock);
 		} else {
 			/* Half done interrupt */
 			if (contract->is_cyclic)
@@ -1182,6 +1193,7 @@ static irqreturn_t sun4i_dma_interrupt(int irq, void *dev_id)
 			else
 				disableirqs |= BIT(bit);
 		}
+		spin_unlock(&vchan->vc.lock);
 	}
 
 	/* Disable the IRQs for events we handled */
@@ -1276,6 +1288,7 @@ static int sun4i_dma_probe(struct platform_device *pdev)
 	priv->slave.device_prep_dma_cyclic	= sun4i_dma_prep_dma_cyclic;
 	priv->slave.device_config		= sun4i_dma_config;
 	priv->slave.device_terminate_all	= sun4i_dma_terminate_all;
+	priv->slave.device_synchronize	= sun4i_dma_synchronize;
 	priv->slave.copy_align			= 2;
 	priv->slave.src_addr_widths		= BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
 						  BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |

-- 
2.53.0

