Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733615;
	b=l43+5je9NsDrD+F2Lgja2HJDEqzCOKfjzMo78g++S1j6qMwoKTqfKLWAv9SSn6zSOD0k
	 hDvSXHlMDSzn4jr0QOqBKL4hsyOzh3EygaY5VuwkwkPcn7sUSuFIW+eI/r76fralfrnOk
	 d9hpByoL2VuCia6+5nP5bn9+zyR8CItcRMrDbDR23CpOXDepvitJT1LBN2E+FhvDAbtTm
	 /snJanvTRHJPro+zpwYFlmtBHBjInR5SSH+7BFTFRGEUBA6CsU4s0DCBAhUJo2ctCsTLO
	 wU6r2wuz9Ulbxdvn/Pjzj+C+cxFWVPd3D9MX8G2DF3asHrl6JqBpUbJLVgcjTv//xVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733615;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=dfbuM0pmbxDgRGHnvK9GVp1KbnVrBOX0xw08dSvpRRw=;
	b=ZTKfvX+vjas3mPlzwaKgLpfEfc54CQCAh/wbOgFbopoZ65SfKQPTys6KpIrX89/3Z8k0
	 2SLohGuCivlbiMafO7u7AZqRKNZcmcI5lzJiiFap4Jx/mzDtxnZA4lJ8gDn59xFY+px3l
	 9o3CiJE5l+dI+OUFkdpdk+VSvbP/9PT29B23VgkkXenTauCy0YSom4HB0rWBYcX89wcGF
	 oKXM8VmmsZupeYMqxIYNnX/6OOLgMJjUmP17mDXyBZSShKZ5hsAYHBEZKEV7Z3sR7LQ2O
	 co01T3VvvzWzHqqgYJ6Y8rmx4aFb+L4XHBG+/Y2cpuZ+VhWPaYfR9vOKtlsys71UB8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="h/s53A8m";
	arc=none smtp.remote-ip=209.85.161.49
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73809606A897
	for <dmaengine@vger.kernel.org>; Sun, 15 Nov 2026 09:06:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73809606A897
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h/s53A8m
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-703be215729so780974eaf.1
        for <dmaengine@vger.kernel.org>; Sun, 15 Nov 2026 01:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733614; x=1795338414; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dfbuM0pmbxDgRGHnvK9GVp1KbnVrBOX0xw08dSvpRRw=;
        b=h/s53A8mMefJ9KOFiILUdjqUOgaMr2//upkQg9YZ27fnYNbl9MnbYzB57neI7LpJ+/
         TqRTvytNrFzQEE8Xsa1QhDzYc5XOYlqd9P0y7DZ+KD/MukbnTTJHqtYJKwtVHTHZcMet
         5rtdfjJnREuLWcRl+2LeQ43kSaiDbSLs/nFSJybBx4dOo0GrReS9O5a2qdZIcYg4chtt
         Bm2YFV6ekmEQDzbwTpgRuENIH34vvsNt88hTD/p3VwcWgppZrdjgRUHXLcXbrn5+ePIe
         I+i+B6rNcTGoCb6Y3fJ9M994MgzUuHv66tN3AdGNBRiYtNTOYdB2K+WzXcKZIPSqEiwU
         8u7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733614; x=1795338414;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dfbuM0pmbxDgRGHnvK9GVp1KbnVrBOX0xw08dSvpRRw=;
        b=X3ce6wyAru4uiaqqjOd7fThvMwNgwF5PECtVjRwd2x+DT2g6RsVIvPZhK+xKRSCoYx
         witWo4VKr0NWxhJDoRTbK+D+A/h7bnYc43HGTt57WA34zp3g6FHswC6m54r627p0keft
         6HEVFn4kr0GGPVNszchKDc7rTQu2ce0mOORkfvLYuNzGZNmfZxb/mr67yC8ibW+1iFvD
         eNPyzUHdb1xwVTXkKDZJZHgCd+kef5iijnDO6maHu6HkhA2NYJCoAlbfnkOaLDZTHu8V
         rHsGDedrHiJlgOOUKHkPg4ZLhUba8KdDPrSOriqYYtYDxtMLMWdgFrU8rYVOp5BRhea8
         qBSQ==
X-Gm-Message-State: APuU4Z8agl2tdLNYzsyyzyR3nUKB0u8Fgjjj0lhiygndr8cBG7PRXK+k
	iOqAxzWVBrDkaFVItnYlQIMBsReyhN+ZG60ycxPB/Ctk8jQiEx9lTqIz
X-Gm-Gg: AYBFou1iwbeeIch3OqMzDcjHLWECStpECLII6fB/hEHSyWg9kDthwg3sCO8x31Oc33W
	Ca9+vKLa9JNvJvC8Y6pTuQQzvZLQ7N1ZkYnUTmRT3vfp2Ot2Y4sFbzv2KPmOQQX/CqdlMCH1XOS
	Q2V4TK/f3ZHKHtK+Nqd9mALL+dEPGuMBkVqG/L6aoS2D2x58t3RrqzscIFyyMxJbN6g7flAJsQN
	/5WIyZ9qtJaqViGp+uLUOvGXRqUzSSnfdTKmNDe8/ayEjdtr6qaqFzh3pPZiBTk/VbFAduPZ1AX
	rSF61yY9rMTx5o3HPh0MICNRqcZ0VRJ5jzW8KEwpXKF6XDZhb28au1UvV5KRgKcLexcjWilPh4j
	eCqIF4pkTXolFPAhKE/h2EWC6r10umt5XVQ6R8g0fItq9TTHlLxxzZHjuXfaqihJMLUI+6MQ5j4
	utok+1lAOpjltUvSlZuA9FrJ5ZuOxdstxql/AZfiUtwQoAes51N6NtysAH71zC8nC1DqRTVYSwB
	IgJg4MFwvDClORzXQlfEL1Xojckt7u//Sug4uZ6KsV/DcJ8JbRrU4XPIo7nVeKQO2Sm6WFJv0LF
	8c+Ws3NA9cP5cGOuVw1hPFLQmman3pmzNROgBw3ZvO8tEBuEQ8lJN5Sp/uYfQyvx32Cu3BRB7dV
	ySlhW9G0Bkbk4UrrDVd2teg1ObjNLUS+p2aoT54uHaTAsrHCxylydFvuNJk6iDkOnBdnXlP2uZ/
	eqyw8KoohO3/yjQT5K2ChwPATH7WmpDiyn3igmnWms3SHNQbw7aoz0
X-Received: by 2002:a05:6820:1caa:b0:71a:e9eb:6b9b with SMTP id 006d021491bc7-71ae9eb6f5amr480181eaf.21.1794733614395;
        Sun, 15 Nov 2026 01:06:54 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab4338765sm6198902eaf.14.2026.11.15.01.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:06:53 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 02:06:36 -0700
Subject: [PATCH v2 3/3] dmaengine: sun4i: retire interrupt state before
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
Message-Id: <20261115-submit-sun4i-dma-callback-lifetime-v1-v2-3-fb7d258702f8@gmail.com>
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

