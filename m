Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794562605;
	b=i+1tiG9MIPDQyeXEkMNNtiSpxZ4FNKTak5jSXGLvYtK8AjMoR9m8KQv1oDkliIXsGyX8
	 Kwx2kn636tNiLhTQY8TNYVRZ4WpKstO+Ttbp/1CmL7rp88aa4iwC1v/6prpdMJjhtj0hd
	 qhS+7/1kHw4eQOLt458+xk4KH+yOEc021n9C5+NbFGh4lJwmttY2UI/fZHApCAUBxv/xs
	 Fz+y12ebuSQ3Ix3So+GOy+jv7AIaA/Mufn0fQrOvfRgL9qYpGaJfe//6NMI/FIVSLaSFe
	 3zn3gHFS/IasrI9RkXNuhGwbQIinO46a+lCgoVgLaLSkeuNMZ4BfxfiI0f3YsizN/pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794562605;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=v2k4jFluLeaP0eKylJ7J9HI4auhBjQtbrBm24Guvwz8=;
	b=0Zc8+p6+HA+T0+9ZyGv5XrPrCtx1WPUGwXfeeSZJYmG8pixN4JIGo/e4l4tNI42eKW3n
	 51gZY3CuP3LBx+RSy95zhMgVahcnC0TsmCIMrA7xH2cTizygFvzVi+JmHP2FrHT6rFbAy
	 Mu3so6QvCiXQvcJFuEbGeeSoFgdJlO1xMr5RCbMjT/Yvfnj4Jk7+kpVf7aPyS82M4y+bL
	 EX1O0lNbrp+FxYNE3D6csof1xmFFrXnTHPmHe2/DvGzYNd6TUiTV9Z/dHWGXF7+FFPudv
	 M/4B8Wl7fKT2DhPxlMPihiqDhiCEPmW7izQzwn0bgKmSyZq2psShVZqKll7m3TZ9BHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wBGbxXzE;
	arc=none smtp.remote-ip=209.85.167.176
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C88E60A2611
	for <dmaengine@vger.kernel.org>; Fri, 13 Nov 2026 09:36:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C88E60A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wBGbxXzE
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-4ab8cb2a6e4so1045503b6e.0
        for <dmaengine@vger.kernel.org>; Fri, 13 Nov 2026 01:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794562604; x=1795167404; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v2k4jFluLeaP0eKylJ7J9HI4auhBjQtbrBm24Guvwz8=;
        b=wBGbxXzE04sjmZWmBOamp1sP2/bnvrpmUJxEQhd4poKnqPWXnGr5oxTsQ8j5b2+Rlw
         efDtVYPZqbQRQHV317K6I/pwUEbqn81VLAgPkcUazleN+r5jEBy/9P1qp5gEfUgeylux
         G2jwD+QHqBcZDva13cnVqG+xKOLamw/0uAv8hXI6mRAjVDwWfeygIfhsRYs38addGBfu
         N1XhKlv6IWDdEtgJKLppw5Wxn+9QG/pPRcH5dMqkaQOQgvqEJ79oAfixCAOUXzilIbdR
         d5PfZXQqv7FJXXqRRqoX8mJK5q9DGbUjceQb0SEDSK7rRK7OSPoSBfLIe83b5myJLqzd
         6M9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794562604; x=1795167404;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v2k4jFluLeaP0eKylJ7J9HI4auhBjQtbrBm24Guvwz8=;
        b=fk/KvPuIIf6SP4TTvvPvqICAVMCwIn24EPDd0nSaPKbv3kzeNYPXg+Wv5er+JbZPeW
         1Itkk7g87/Sndo9dKG996keuYe+6Mf15L801I7GFRaIUFGwfu4JI5ShruC/klZMmwGCi
         70gKSuAwXrGV2jwiUD0QMmpGoz+MM6hyQv5q4D2whjVDztKQhwYTCTVpe7XxF4ZKBihT
         MigVfnOwBFBDz+lCyJ1I4uWRLxRae1brOdmaKJJ9i75K9V2HZ2y2Bl0AX/H6CybUoWoE
         tqwhT+q/p522gOV8PvqOsU0iRNlc584BKrphGcQCkdWkE4G9dDIW/2/kTJe8Hb84Dzxk
         ZFFg==
X-Gm-Message-State: APuU4Z9hyZ8Dl8zbUL55YfFe3GCWihVRZhcRm8YHhdgd4p8jw2cfbJQY
	l+S4Or79frAYaSWG417MsZECPMsGRj5C5sMKznHRAOYy6kalkReNcYM6
X-Gm-Gg: AYBFou0J+ejjrtQqLHSmTPQJ7wP27p/FaLDd0px4fK8Rn613GAuk9nD2OZognYasLG1
	Wnun5Db9A+1H1YqCYAF/byb7TCkNF1lJJx2FLkqUHoGxG0qyvKXl8DtY0x8d+zjVpfRgQR4gJ3z
	3vtGFDynY0YAhztlKalIuJs8+p8a8Q8lMmoVJ8aLTXKVrX7bgNfD0Tft7MF1GCEpuYzCA62tgNo
	+b7WFApEDk+FQ7MJ/6L0f3fmIAXjL4dU2LNmBxvBDT/gqHuGtIW34KS9xXzD6u7HUbo/XVLeK0Y
	Fq10k47OzdzjxBOH/Rg/xpr+6E44L//pPXc1TmtvCCLbDwfja8oFzhlVZS8eEqQ/b1YTLHnmiUg
	SYfm5oxEknL8WNpq6HPLIW/+zm/i6TwtfAAjh5iZSpPtmH3wvER7RozqcwE3nOyGHz6bte1BaQm
	DZbb/DkWnmcvekqnEVvf2eI8XJo1cEzdXnkG6brvFMSqgaRsy29nePj5UFcTxmgYQbzCWnPzYm1
	BKOn6Q45x4atS7kWE3tGIpW/tcmskXAAoaI88mShmZRL5p3DDhLOZZZBw72hOvJBmoHvmf5WpwP
	0SkgJOYR88baVxzNkFZ3UvLUbzLdGOXdUNnEb0dyzBgRg3FdetEjucImQDvK1LBoUYd/dzKPePc
	L45AoDLTju9Q+Qc4qtM6KURxNeWXzo3gqpfAWGnpQ4e88KQJTe4W551XwWmXKuaEWGpmVyzxyF/
	xmUxukn8x091GxUBSJpas3t6AgNJLrROQqtz/GTboCZ/uyrDBeZWB0
X-Received: by 2002:a05:6808:10cf:b0:563:e8b6:c5d5 with SMTP id 5614622812f47-56e64cf4cb6mr1678912b6e.44.1794562604104;
        Fri, 13 Nov 2026 01:36:44 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e6fc42a8asm1627607b6e.3.2026.11.13.01.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 01:36:43 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 02:36:37 -0700
Subject: [PATCH v5 4/5] dmaengine: dw-axi-dmac: use atomic polling for
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
Message-Id: <20261113-submit-dw-axi-dma-stop-pause-v1-v5-4-8523a27b5788@gmail.com>
References: <20261113-submit-dw-axi-dma-stop-pause-v1-v5-0-8523a27b5788@gmail.com>
In-Reply-To: <20261113-submit-dw-axi-dma-stop-pause-v1-v5-0-8523a27b5788@gmail.com>
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

