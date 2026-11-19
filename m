Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795111392;
	b=THp+e1rvgWN+JMXTOsUoYqlwOpO0KO/Sj4xk29pjEKB6FRKRs1UpYKARqmmkVxk8v/Y4
	 6lnhG/DoJs7fU1FuW70+fryiCUSjs7QfBo7pNvFNqs+bhob+pQ47YXDGfnmaB2uJixjtw
	 wb+ztoLQ7zmkUpSks7G18hhNByNpm0+8DL9tgK0QhVNf4PeO5KjvhFyTrXYZn9Zq4xlMj
	 ktA70Zt8R1k9oHPqyDl/xU+BHQkTV9inqCNcV/TfQEcmjk1ktCemOpv35GmvLlQnCHwEq
	 J7c1CcreUMiPJzaPM2+k1p1wwYDEH9EVWoGtmhhDIpWriXhNmwVvZ+3/UTD/NCUf+hQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795111392;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=dfbuM0pmbxDgRGHnvK9GVp1KbnVrBOX0xw08dSvpRRw=;
	b=paIXp5opUm5H+kENMF1usbw7f1nNpfyYRnMPMmj+Ma874xa9VDXq7xOFSLWlDmsCdnHX
	 WC6Q8tWiTgQJzsicoeJa8uqSoBjKnj+7OdMqRfSZaSMheFjB9qWjkoirSSDXJV2we6ZUV
	 mUc3wBdx5a4GDKCxbvuTrX4a6rXThU5v/4XxKOknaS4WXJMeU1SrWGX/Dd7nfedVUNf/l
	 DS6Y2gqLmifsIkbiy4cnULv9tnSpf0G79R6ogoPgvGhU8CmvRGf9bTZPbFF3DVNJ+2Pi7
	 2sUFNqdNa2L39yVNUtzC24C8tdidJ5aFVRJG0i1ZNoQkMFzzz50Vjzg73+AI8F051xQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kMMJaIw1;
	arc=none smtp.remote-ip=209.85.161.49
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18132606A33F
	for <dmaengine@vger.kernel.org>; Thu, 19 Nov 2026 18:03:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18132606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kMMJaIw1
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-716c0217635so1359506eaf.0
        for <dmaengine@vger.kernel.org>; Thu, 19 Nov 2026 10:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795111391; x=1795716191; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dfbuM0pmbxDgRGHnvK9GVp1KbnVrBOX0xw08dSvpRRw=;
        b=kMMJaIw1atQfQOHDkKbNI3z2L+GOPgCJHW4PfsqAw0f0i3wrVcTaOrg/D2b8I9prRV
         vUoeDxsjHea9FMdIjMANCtGt3N9NwINAx9mi5E9LEjBxiH2dk+sqGLGClXY8etHQTH7K
         j5lCvDcAabqkV0JSivgusAJmn5LXpzkr4AqbgF9CSFWo6I6/GTsCVL1//eYzfg8h/aND
         kmZb6WOZvScp7wNtM560ctYRiwrvPshk+UmxDTYJStO3ZdB0LfkY0raMY+rY99njfWtF
         PIkibAwYMNFmTmNNVf5sQCDE/MJvbXabEngC7VfHgkt67ifo94+zejMmegsFJ+v3qa8k
         H/Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795111391; x=1795716191;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dfbuM0pmbxDgRGHnvK9GVp1KbnVrBOX0xw08dSvpRRw=;
        b=PReOJj7gGAzJKKQfmS8aLhx68IYUdX9GGrbD2Ion9vd/O7TP8BTHTYXTbvAcml3fFw
         K4XvzTkO7AI9LSbWgPomDcEsulLRN6ivfpe6oh3tGeEon0USbpGHlPmV3NoiVTN/ljPz
         toeYFO4MyV2+rK8XnubUqy5ElA3JD55AQfxF5wqHqMoFv6asxaDMYAxIih9UGnbNp9bt
         FD3UD9Dqdxlmw9eCifEfczAmR6BGcfjIHulpdCwjGlkMLsA8+NQnErcy3fq2Cjlp26ip
         tPmWUSjHU2DEvTLAdXpscq4DT1eTu5+siPrWI29aFVjWEAgFG/dr+MNc5rubEcCe9QoK
         /cVQ==
X-Gm-Message-State: APuU4Z81URWsxNViNDHBuOu2GqWXalV4GYfH8isIlGzZbPUJ7x59FU5z
	R88lkFsClq08U1W5i7LQEtbb7Ybyqhi/DcrL+0M96PEnIrQWVpb0C1Vp
X-Gm-Gg: AYBFou0UqFGZB8YpxuS5S9N5yE+zUCkUaTTkWi0b5SkXCJ25yFtqOFIhb4M0LIMenF+
	v/QfLZwsQ+Ut8yn/4dGn58s2/HoP/9AyZRhljdk3r2gxwEuLAelW4dON34vW1e511Gpsx+1lDFc
	oAzxHog2vk4PiVscYEns/eVzWOO0tq7Q5gkZXVvv1Ag2yTo/YEGe6lzp3GwVnsz6nx0F6LGhgMU
	d94JAREd0/Vfa6urHbD8EY5MTF+yHevlKUIMq0NhcSi45zMz/7Haav2iSxn0zOH4QgAyLoHOIx6
	qD95LCU9B+j7VNL+5lX+8WKZPzO/t/btKvSpJOoFh7zpn5V8uUU1KY+1MV+WAMFUiGgVwbhqYFo
	q5HmMavcBFkH2XCk8O/QYOcDq6Ai6QwpMewUCGsbQTrSLYhk8Rk4ByNUX4J0g1Ps23Ce/ExT3MW
	E/EYZOkmi4igiI6LcAluKQcO4zHNrJIdtq5G0eNnDFXoQ30oipUi2md34khJG7iot/WhWlJ4FDx
	UGiCKfHkWJJ4ljNEfkNzZnXboXIxcz1F+NdD32Ok3eQnc5ClhVq46NDz5iFLnZtUTk//+xd2M+b
	GjwuGW0/JAt4smbSvd9LXPj1+w9vi+UPBWrhhWZnpPhIUuPTJW6grWhzT1wPU3J1XWkFcF/eZ/Y
	cDvPY5zo3/4nhMTFrsaEUeCT7UtlpEvxQ+W9STSIgzG3wIkbrbuPSbbmGZo0m1zknDPW5lrq02W
	xzDKG3adYd7U5uPYhAjs1cCKlk8joc1bZFE3U1gIjz6cA38gQYxghnFw==
X-Received: by 2002:a05:6820:248a:b0:71a:f035:823e with SMTP id 006d021491bc7-71b3945d5demr218426eaf.7.1795111390594;
        Thu, 19 Nov 2026 10:03:10 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b3806ef20sm448478eaf.7.2026.11.19.10.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:03:09 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Nov 2026 11:02:23 -0700
Subject: [PATCH v3 3/3] dmaengine: sun4i: retire interrupt state before
 channel reuse
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
Message-Id: <20261119-submit-sun4i-dma-callback-lifetime-v1-v3-3-3935aef58db9@gmail.com>
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

The IRQ handler samples pending status before looking up the physical
channel's virtual owner. Another CPU can terminate that owner and start
a transfer on a different virtual channel using the same physical channel.
The old pending bit then passes the new owner's association check and can
complete its transfer before the DMA has finished.

The handler also releases a completed transfer's physical channel before
masking and acknowledging its interrupts. A replacement transfer can start
in between, only to have its interrupts disabled or cleared by the old
handler's deferred cleanup.

Clear both pending interrupt sources when disabling a physical channel,
and read the status back before allowing the channel to be reused. Disable
the sources before releasing a completed transfer's channel. Re-read and
acknowledge each pending event under the owning virtual channel's lock,
before completing or rearming the transfer. This rejects stale status and
keeps the old handler from clearing a replacement transfer's events.

Fixes: b096c1377d1e ("dmaengine: sun4i: Add support for the DMA engine on sun[457]i SoCs")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun4i-dma.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/dma/sun4i-dma.c b/drivers/dma/sun4i-dma.c
index b0c91dab62f0..6ecc45cadd91 100644
--- a/drivers/dma/sun4i-dma.c
+++ b/drivers/dma/sun4i-dma.c
@@ -400,6 +400,13 @@ static void set_pchan_interrupt(struct sun4i_dma_dev *priv,
 
 	writel_relaxed(reg, priv->base + SUN4I_DMA_IRQ_ENABLE_REG);
 
+	/* Do not leave pending events for the channel's next owner. */
+	if (!half && !end) {
+		writel_relaxed(BIT(pchan_number * 2) | BIT(pchan_number * 2 + 1),
+			       priv->base + SUN4I_DMA_IRQ_PENDING_STATUS_REG);
+		readl(priv->base + SUN4I_DMA_IRQ_PENDING_STATUS_REG);
+	}
+
 	spin_unlock_irqrestore(&priv->lock, flags);
 }
 
@@ -1125,14 +1132,13 @@ static irqreturn_t sun4i_dma_interrupt(int irq, void *dev_id)
 	struct sun4i_dma_vchan *vchan;
 	struct sun4i_dma_contract *contract;
 	struct sun4i_dma_promise *promise;
-	unsigned long pendirq, irqs, disableirqs;
+	unsigned long pendirq, irqs;
 	int bit, i, free_room, allow_mitigation = 1;
 
 	pendirq = readl_relaxed(priv->base + SUN4I_DMA_IRQ_PENDING_STATUS_REG);
 
 handle_pending:
 
-	disableirqs = 0;
 	free_room = 0;
 
 	for_each_set_bit(bit, &pendirq, 32) {
@@ -1142,10 +1148,13 @@ static irqreturn_t sun4i_dma_interrupt(int irq, void *dev_id)
 			continue;
 
 		spin_lock(&vchan->vc.lock);
-		if (vchan->pchan != pchan || !vchan->processing) {
+		/* The channel may have been reused since pendirq was sampled. */
+		irqs = readl_relaxed(priv->base + SUN4I_DMA_IRQ_PENDING_STATUS_REG);
+		if (vchan->pchan != pchan || !vchan->processing || !(irqs & BIT(bit))) {
 			spin_unlock(&vchan->vc.lock);
 			continue;
 		}
+		writel_relaxed(BIT(bit), priv->base + SUN4I_DMA_IRQ_PENDING_STATUS_REG);
 		contract = vchan->contract;
 
 		/*
@@ -1183,7 +1192,7 @@ static irqreturn_t sun4i_dma_interrupt(int irq, void *dev_id)
 				vchan->pchan = NULL;
 
 				free_room = 1;
-				disableirqs |= BIT(bit);
+				set_pchan_interrupt(priv, pchan, 0, 0);
 				release_pchan(priv, pchan);
 			}
 		} else {
@@ -1191,21 +1200,11 @@ static irqreturn_t sun4i_dma_interrupt(int irq, void *dev_id)
 			if (contract->is_cyclic)
 				vchan_cyclic_callback(&contract->vd);
 			else
-				disableirqs |= BIT(bit);
+				set_pchan_interrupt(priv, pchan, 0, 1);
 		}
 		spin_unlock(&vchan->vc.lock);
 	}
 
-	/* Disable the IRQs for events we handled */
-	spin_lock(&priv->lock);
-	irqs = readl_relaxed(priv->base + SUN4I_DMA_IRQ_ENABLE_REG);
-	writel_relaxed(irqs & ~disableirqs,
-		       priv->base + SUN4I_DMA_IRQ_ENABLE_REG);
-	spin_unlock(&priv->lock);
-
-	/* Writing 1 to the pending field will clear the pending interrupt */
-	writel_relaxed(pendirq, priv->base + SUN4I_DMA_IRQ_PENDING_STATUS_REG);
-
 	/*
 	 * If a pchan was freed, we may be able to schedule something else,
 	 * so have a look around

-- 
2.53.0

