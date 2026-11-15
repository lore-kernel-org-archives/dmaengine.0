Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733614;
	b=MR/TbX9bGjU/w/i7HQtz9M3JZfqfM+b62BgsDhch6kmFxiYWJyO5j1BLrA8h+2l8jRzv
	 6tJsMKrz18Q0pKc8aZJPgt/n1GSSEz4LSGEr698kKLQ4+zm39WMyG+egJQ3+nARCrGMHi
	 qhOBb15saRHUsK8THOQddVLojOEZiei1dStJd2GvxzWC+804BSv4ItYG6hGaCAKco1hf3
	 iBl+nWZm6dMPB4O4SmvQJyDoyh7fKtM+D/LgmATMmFEXZtA2ZJreuAtysWR8eQwCion2G
	 RaJb0Q4s6Gu3rqyNATvjTXZDPF7rXDpKks7+PChKLaMEiM9zarV8h3Vxu3r034SHfqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733614;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=xgSmoxBrqnKlDHDPXkpFmY/x2C8GWXkCurAJnyoUmxM=;
	b=qFyF2SGTbgenWIssPd/I1YuV7Oz++ik5SddhUYHnQI0g38Xk/eTHjVvM75Ljr6Ime/bf
	 olASGVmb7urgHmMxG9/gkPgIyG7pDcXwRViV2bJ1KLVKILlEVrHWWrBrstv3MTOxY8UFp
	 S0qsnjOObMC4fT8JyvvGFAvIwxfy7H2scYxPOi66h2FpYP6M3gsxVTp5dmM0Ecl00OZ3v
	 xLywulzqaJDetrcAf33jCTgwPTt/Y2hfWF3+LK9NxbtDoESzs4YVxnICvn8eGWUWkFpqv
	 RJ94547loBJMJ9ep0ITs/i+ExKE55UmO1z5L2/2YVsnEViyZj4cV7HCXCLglg62LPiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZnbXuAwx;
	arc=none smtp.remote-ip=209.85.161.51
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F9E606A889
	for <dmaengine@vger.kernel.org>; Sun, 15 Nov 2026 09:06:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19F9E606A889
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZnbXuAwx
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-71ad099391dso343569eaf.3
        for <dmaengine@vger.kernel.org>; Sun, 15 Nov 2026 01:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733613; x=1795338413; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xgSmoxBrqnKlDHDPXkpFmY/x2C8GWXkCurAJnyoUmxM=;
        b=ZnbXuAwx5T5O1JUnj5pidVvTj+f2fCOow+VM8wPOgwU3UluNuyKXeAnyRG11ynJ/77
         b6GZlSuu+YyWGA46RP7X0NsqnDKs2gDYtV71JZ5yZv4qbBhw9vP5L53JIhtyChmYR4qD
         C5TAp/SWRuDOIrItTy5gRCuS7jrGINaHZvnx3qAsRRVC3/6Ntf3yRqo2MayX+7j9DKzo
         n1xwc9GfQVzwZK8XOCwWFrOf3LxVGRyM70AqU4aNcrDkEDPcH/uXoQYYnmBnXPvQovjR
         mGsVD/UVJEa5AyE5YU71FBMk+wGpg1hz2NBtVkTXxQl2Re5nVhcvoubIMc196p2fiYPw
         FLWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733613; x=1795338413;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xgSmoxBrqnKlDHDPXkpFmY/x2C8GWXkCurAJnyoUmxM=;
        b=esctrXV96UHKUD5jnneNYSDgU2gzqG5PPw9MNvvml4ts8Squ8YNujsjsgrxY+GN5Vb
         YJfA90NTuO+3tgmlN9tF7DJROEmthzpX/1PH7nXW1STSkFtC/lBww7MqDEUxgOigpjP3
         cod8GghO5//gLwl7FgI6I79tqfmE6Cu5F6oy+JGxOambLP7ZmXRyEt7jaK1AaXavT4E/
         +pEtTBh3fPUpCNPg3eL5EjAvSSkzo/6nE93d5M+R5OYgctLtqYO5GoAEk+wsKLwaY4lP
         Ts6Q51i3495sRLc3xMcsmx49VfDf9UwxdEGsFbUTLuo0WpA5m9OQxoQOIZfiQ4HSkf70
         GMCg==
X-Gm-Message-State: APuU4Z/m2CaJDhYmJ6soVe5jnjRu3uhNS9yj+AO5/79V8ZPoDpfxPdPL
	e4BiPP/yStBKKxTIbuZkDJLB0GIr+/03zxanXt7eVma0dseN8oQU48U0
X-Gm-Gg: AYBFou1yriScIHwYfhEXNuDFH9oFQcmKZ7LBFi3Ejndn5kZA64wz0btz+z9HI3ThtmH
	2PsrjFVwtNX//eu9CN0ml9BK6uimJb7eN8vT1JjDdsRmB2Rz87oSFmQvyodyObiy3X9giw+/rnB
	LwRB+zSZ+8ktme4Tg5N4YaKMDEjIMRuBd3nrE571WkblZJtn1hUt0m2AjJg7J771RLKwmuOn6sM
	EwE5ZseuQdLgZX9xdPIJzdj7PFckCqYGDXqSXN0GYzY7X2vaijTKdsuAcHMBz/omsJiOWTflcMj
	AkJTwvUUBY7r1QYCloevauRxzTr/odc5yWNDWWrY/J7gjNfQ0qTvjQ+89GnHlk3Th1DolnF8pvm
	wXxLPxA9vKhGVCthXDsrXG21N058qSRk7OIRnyWhuZ8rs8u5sqtYBxwBQAxf/+5c//2idedwkLA
	44uQeRsMSR4/peVHMmBZyLlgvm+K+EzrZab4XNPy5ya6tELOmnJZIzN5Uq7pKKr8w27MqgNO3XZ
	aMOTUj05+++l3r16jijOtE8+8Dz1HzfFmfAEW30nDLHiOUD4FXWxjz1xCOdw524FsrXkB8DlAvZ
	+ss4e9aPqOAdbYlKakDB59P8yEc9WNmD4jOfPw+ErFg2994HvR1sEDPfxa6r4/40oVu3aW4Q5Ft
	kqakYgM4Ocep+3C4hFa6XSFiFgiWeYEnaNZNoOutwbqZq6dBMbgBDr8J7GEns+rtbF3CSm6zxpH
	Wn8VaeuWiqy8DJb2RaZ+GeiU+/v1YxKify7FNaQgC2S2t1Ux37MJ9m
X-Received: by 2002:a05:6820:1c98:b0:716:d143:4692 with SMTP id 006d021491bc7-71ab50b23e5mr4407570eaf.33.1794733613075;
        Sun, 15 Nov 2026 01:06:53 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab4338765sm6198902eaf.14.2026.11.15.01.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:06:52 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 02:06:35 -0700
Subject: [PATCH v2 2/3] dmaengine: sun4i: retain cyclic descriptors until
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
Message-Id: <20261115-submit-sun4i-dma-callback-lifetime-v1-v2-2-fb7d258702f8@gmail.com>
References: <20261115-submit-sun4i-dma-callback-lifetime-v1-v2-0-fb7d258702f8@gmail.com>
In-Reply-To: <20261115-submit-sun4i-dma-callback-lifetime-v1-v2-0-fb7d258702f8@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
 Maxime Ripard <mripard@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

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

