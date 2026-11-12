Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794471789;
	b=a7GEQdUzSwDTEfuiQhHxgNG3HqSAr2IfPBI1n+keBoxT02aiDYeXVpCAkoXg2Ewx8HHK
	 L37SWbXfyBgelMWlcR8HfX9P/U0Sg9u+73u/8q+pu/FoEeRUPmrK4WRg2o9HukMDXmrQ8
	 dA4Kb1dJpnbfjtltwsMYClExPYktSvPDX+pFPsR0ZmZVlmJZzDL9JagnMTrhm7n2zVPx3
	 MyzKTuoIHmPvmFglFJaqwnhioJ+5Ob/2oo2eUdmol+AGh29V4/+8v8EnkzWzAESBrTS1r
	 U6jIzo6JRX5sZUL8kNudY+CoeD7bzipc9dqu9tapYpMvCKlhMuh7UgofftgZ8nrRuWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794471789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=v2k4jFluLeaP0eKylJ7J9HI4auhBjQtbrBm24Guvwz8=;
	b=Mpd9C5l4/apHD+Wo4VKkol5JsXcVKqy/h1GqddvSsOv1aQm3ZnLJTj1aebWj4eAkGlUw
	 lHQ+UagP24YJnw54HsnGR8CiE0DntiTKQWPbCf1ABr9S2tb9/JDV+OvcKPUjUGJ8E951y
	 3QY7YDmYT8ucAXH/2wz9q3lPNiAMkII7nrK2C7XYVRxEiBnLa4J7ZaYFWUffICWFvfbpA
	 OCADLSjKnUyGIlso3IJJjCFoazb1Op9MP/AEIEzxJXd2KiqHVB0U9MHIgD8RHVYKlNkvW
	 xNXo5szWsOAjHFXiyaP9LDSgJYfb5ba16UlHQN5s09TGjuXNT+fp8jP3/Ls883Yct2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eBmUcZD7;
	arc=none smtp.remote-ip=209.85.167.177
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7808606A8BD
	for <dmaengine@vger.kernel.org>; Thu, 12 Nov 2026 08:23:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7808606A8BD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eBmUcZD7
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-4b28d9537bcso470717b6e.0
        for <dmaengine@vger.kernel.org>; Thu, 12 Nov 2026 00:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794471787; x=1795076587; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v2k4jFluLeaP0eKylJ7J9HI4auhBjQtbrBm24Guvwz8=;
        b=eBmUcZD7RDwL6scvKv2mhhFTSaZm6ZyosW7GYAoaRF6RB1wdDUoM8cIgPfMg4TXV9S
         Ikytfuzn/unSJuXRhUdnuDgVisjz+bQonw1KKn8tGfpannc6xNuWpQTjLYP1X0II/Bo3
         pAAhGIC3lgZztPUOsCjDjTHVqMr0j2BhkcK+aqHT7i8GPyrj4gZ/Rl6fUOEF0gq4Ggtj
         mztuY3LAVavof1KCg+9+KksseKmDp34z2BfRHET0v6yndglB8oy7gvmHLfCoeIoiU0v8
         DU6H5jJ2FkPveORLLboDtJJqagJBBbjB+r6I51eVmstDw44J8pEr+QPGcC/N6pDH48Wo
         RSgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794471787; x=1795076587;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v2k4jFluLeaP0eKylJ7J9HI4auhBjQtbrBm24Guvwz8=;
        b=Dmzi1PpbvHYqqWWjm3+eeD3EW/v03/h6ydcLuES3ANlEde5Db8+rSKevvyDbRsG5YJ
         4ANzxX0WMs/x5LowbDxOS94ejlT9l1+9kce4scTxSV5z24PVJgKcHgS6CfFeLRCI3YFT
         jqrjPWLr3n6zStAmnxDCIyYlmTs/cyArfA6BWAlaj0FfagtMFlVUw6zERcKA83YBVThh
         xv0kQE/fw+T9LFCukLCrjQ0ef7RvmYrknjQNpFgStKFT7rFp6QUkImD68h5TKDoekh5f
         P70DL8EGJ7v3yx/5MjnEWSiQKKrznVmYIvylK/lpSghcChWC4Em8Gk2TXqXyQcAYGpcH
         74pQ==
X-Gm-Message-State: APuU4Z+JFs7rrPwKnuQuKmfWAYfWdDG+MhWKCwIC65QheWI6pC4zk3qq
	h7cRCqHdEHJ/o7QGQvEq1k3yHHA2T+WL5l1WuEU/FfvFwSGzax4FHpZS
X-Gm-Gg: AYBFou2DJnhBeMO1MPZY5O4xHCJw0ZdF+Z7o03JekaWpI2pQrIbWJbli9T0A69khhMA
	xOpmtuFc1zbyPjl0vzJkgougnvo93iIlq+Zt86VxTTJlM1KHZGmZmes16Kt8M7W590IHkJjkXbl
	lbxZ3ZKG1g9aFWOM1K/HmovXFeOZ4CXjZXC72KY9IGbr9NzHSrQ0ES0I3m/y9Qt1U31HmDV4gTw
	iNxZMkrnNJXJcTxUiESshVCmY2oiXkgK9hA3l1rGCj4JYH6HcDkriMQq7g+ADzvpySPugGqFYXe
	4HRHqOruaEgw/hoy1h6YdY7pjL2JnrmM7zZAHOUWPJQMxZGzcatjLoSEJjXfHEYFkpDo6pzWFOi
	Zq3LBpLM8xWpaLxn64q4xP0qX8MbUhHmM2VOA87/IIeqNYGO2vajRAKxBxjzjj2M2qYJAT1LnLo
	5vZKMQw6LKOIwfYrtFoUePOhrFj9JCki/DT1gFJXkbEiqV/8oBTv/lG+jAqbUz9NzI0qILghcYY
	IQq506aMBs/0CX9WZVBTNYzFBxZyL73kwXL3Jw3ic8hRZzMVh6eL5y/C6Bz4aD1kZYw9fmSPbbk
	Xx6iUiiRlDxo2+uv8ivczolDNEqPEuFxLuwR8WXfA7ogS6WnHfYK2rKC/tq78drpFsciqanBoja
	BfEGCH4ZgQ2bOnDswze7wGkq9sfiaEmdt2W9oT6nokIcBBqEBunSxdc6ghIc2nPRTcMUwDFkESo
	9uR1FWZINfFaDvlp/VzLLYnPMM/ve1R436SNyUpeGhPamsD5Pqwd8H
X-Received: by 2002:a05:6808:508f:b0:4d6:9133:cff1 with SMTP id 5614622812f47-56cd673ea55mr1534867b6e.24.1794471787562;
        Thu, 12 Nov 2026 00:23:07 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905d3bab2sm7411157b6e.12.2026.11.12.00.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:23:06 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 12 Nov 2026 01:22:53 -0700
Subject: [PATCH v4 4/5] dmaengine: dw-axi-dmac: use atomic polling for
 suspend acknowledgment
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
Message-Id: <20261112-submit-dw-axi-dma-stop-pause-v1-v4-4-3ebc24b243db@gmail.com>
References: <20261112-submit-dw-axi-dma-stop-pause-v1-v4-0-3ebc24b243db@gmail.com>
In-Reply-To: <20261112-submit-dw-axi-dma-stop-pause-v1-v4-0-3ebc24b243db@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Sergey Khimich <serghox@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2

The pause loop delays after its final status read, so an acknowledgment
that arrives during that delay is cleared without being observed and
the caller receives -EAGAIN.

Use readx_poll_timeout_atomic() to check the status after the final delay.
Keep the two-microsecond polling interval, 40-microsecond timeout and
-EAGAIN return value when suspension is not acknowledged.

Fixes: 1fe20f1b8454 ("dmaengine: Introduce DW AXI DMAC driver")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index 040c12d07db2..1a53fbc951a9 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -1219,7 +1219,8 @@ static int dma_chan_pause(struct dma_chan *dchan)
 {
 	struct axi_dma_chan *chan = dchan_to_axi_dma_chan(dchan);
 	unsigned long flags;
-	unsigned int timeout = 20; /* timeout iterations */
+	u32 status;
+	int ret;
 	u64 val;
 
 	spin_lock_irqsave(&chan->vc.lock, flags);
@@ -1250,12 +1251,9 @@ static int dma_chan_pause(struct dma_chan *dchan)
 		}
 	}
 
-	do  {
-		if (axi_chan_irq_read(chan) & DWAXIDMAC_IRQ_SUSPENDED)
-			break;
-
-		udelay(2);
-	} while (--timeout);
+	ret = readx_poll_timeout_atomic(axi_chan_irq_read, chan,
+					status, status & DWAXIDMAC_IRQ_SUSPENDED,
+					2, 40);
 
 	axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED);
 
@@ -1263,7 +1261,7 @@ static int dma_chan_pause(struct dma_chan *dchan)
 
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
 
-	return timeout ? 0 : -EAGAIN;
+	return ret ? -EAGAIN : 0;
 }
 
 /* Called in chan locked context */

-- 
2.53.0

