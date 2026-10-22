Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792695173;
	b=Src8GiLaHvMbH3U0rMo++XCApuX5S48olZ60boiDr1FXw8xKB597DtN4qnincq+EhLpN
	 zrvTdiRRlA7s8uaHkeP89hn7u8hVEfPyHO9kYNOyPPWFE3US/yRPYx7HgTRoXN6DMKomB
	 RHuPpzfR/IM1Es/fwJncjVVv7U3iQk5KzbpkJwQ4cX18RKruAJr5emgyS03YrE6Qa3AEJ
	 od4xMQ5foVT456W8xTHpQyc7wI+f2YzSmncl/zfNqXq+BvqN+8pxjZrDZ4gcBnl+B4bvX
	 Z+WuXpRMbEj33DTo09VpUZhKIkd2FVJQ15w0VUYBfWTOtDWE5i3lGip5nNTW8Dew8BQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792695173;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ZNy7GlryTQX1/7R0dXcIMAHqMyL4o5XmS9vSyRLbpSw=;
	b=p/gOwF5Xs84xLFkEYhrGKkmrg5wZf49AdZIGkoFo4x6VUdyBdPFsN/bsJ0kjYh2n7ZAk
	 QT1TgpLz4V7MfwjKA61KMBWhqS4hKnZg+owCfyoav5uAOmMstOjd4eAYBx34DY+MimmLt
	 ERnrWlQ3wLss2d811DqmcV9UiJuxs3khw9Vm56PAgjI56SnII3tE1SPsMxa7qmyH01XXF
	 x9cj8taNb8Ccc11M4zjIPja8lOiyJoI9dtDYHWeoj/4Ch+3mL9PUMPIFNFHKexjm+1huQ
	 +KlZ96aAKT8D5iWmx/eczWHfQ95C8FFfjI03YPgQdLD1qmfZ65vp385ZOFvrIM3dSYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YEUJjpDc;
	arc=none smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA9F606A320
	for <dmaengine@vger.kernel.org>; Thu, 22 Oct 2026 18:52:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BA9F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YEUJjpDc
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6de2f213b7aso70285eaf.0
        for <dmaengine@vger.kernel.org>; Thu, 22 Oct 2026 11:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792695172; x=1793299972; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZNy7GlryTQX1/7R0dXcIMAHqMyL4o5XmS9vSyRLbpSw=;
        b=YEUJjpDcSywgbdSCg2CHm0rj4zicRED03tF52qYohnYatMax3GbXi6/+uiPr2HF+K6
         WzpNWntxa6F7YJwEiWCt3LtrBL7g9pkjFIb2gg61F/oFaD0XS5ZMM1Ug6SWWVaEbi44J
         xGlmdnFT7E7GcwiB/8FWCT+wEUJylOKeJNXnWcR18hXmnDunvRCPY+GQndRCOGzQJAqM
         HiAFd+mc6iDrSHlZv+hvHw92OIYbJivuUMSvK300ucHLRDc8D2Lg06CnvQUnJTPjy5/z
         bCG3QqKyxrJONZ1vOR2wz2X6rcevGzGvXX2BWWMJUT9osIfZxXQG0ruwfLjWlBwBrh6f
         6doA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792695172; x=1793299972;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZNy7GlryTQX1/7R0dXcIMAHqMyL4o5XmS9vSyRLbpSw=;
        b=Io1k8lK0m8n8xpWQHdHItobLAqrPK80wqUTobk6meOs5tDWqmxZY5XKICg94C9bo/e
         63BmHnQLC3/6wCKWq6YNZ8FTLtJ+Gz1B59pfMIF4Jj4AuXTe7z7XBVfHlUUl6yeBfgok
         /kcXrFxIBqGs5hwx0fVOcHiajV73rdu9tQ0ttXTwyKa9sEJYwCUo0lclQwEmkaGQFqUD
         iF5JwnhWUu+3WM/7L1BTr9cAtPgsAXAxcIf81aTxOZTeLGRj64g0mm8mMDzNn/o4o3W4
         44fBdllSNqyFdJs4Vr3m6MAqiJQh9/q9V7FCU2yHR9R4CctsW6k/rV7mGk36euPJ0m5+
         ixpQ==
X-Forwarded-Encrypted: i=1; AKwUvBzqTGbncljXta7Ven8s7ye3BN9ZqvbqVAUeiQS+zqcCxauRL6rFXXwzjxYL+aa2+gEEFg9FZ3Ahffw=@vger.kernel.org
X-Gm-Message-State: AFq9FYK9IYLrnFNnNVhZ/K1hPCNQYULGmqhodd1qGTb4OFEmXyKNvI2N
	hUm4RFOR9LkEGXecg1duSotsCdxCMPg4DkBqlMZAbz5ulvU63MbT2EHQ
X-Gm-Gg: AYBFou3dJHiIyF/LL3FvYAczL9WDzGrVb7sd/4mK5Tmt/ozzQgIw5w1OjHJlLNvkywq
	X9TXaavmuMQKX19Nuj3F11j55zWgKr9RmBLDRZR/KHWzT1/i/8xiqJtNmhRhhiTgXs2+ew+1CCi
	eRxGxahXpEUNqjEyxpmqdF2Zau5Lr9gJ7wXRR9jnXANWKX1TJSdZMb7SA4r+UxPn/nIg6zUoIMT
	GEQ70Hprz8GFzs8ZpeefOAaF2R7hhmLeW9c2kMt/FbMFAzlw1RtrOBZvF8TejfQ67qYC3ltP4Nj
	8mA12Xe2EXoeug+wEgFMFI3jzIQZS/pSAIqr8LZSjkmeRxW1/EbQD7gcE4gmXWWVWeITd7SzOdi
	iJ5WiwGm0OFbOm1GH5GmPszQovfT6WARm3E32ZM2YH8/PcrpRmn4yC/sUg3y7zUcUppPEFF0kAI
	/uud2NaRip6sDyXLpEiYaSECT+CVPQgC3DQXkp32wDjl9AQzxo7XSU52MPklR9RynL0gx2B/muK
	632xVxYitxv2+JV59eOP8WRcrt39prYHDQJZgw5Dpr/FUqskDHgUeIeOh8hRdM2ediXJTPrrR1T
	AqedR3H1kZjjwDUWMp/cNgj0FZBya+oqinj7lsE8eVAXSbuPoWooPpdiIvAeQ//EfU9FQ22S+Jt
	cD/G7h80pW7GSjdSFDoA/a1yB9fKSAy9FMldkiUH1ecB/iOrZzQ8AXaU5KSIqqdeVyhTjgOJ9Ls
	pI1v12
X-Received: by 2002:a05:6820:198d:b0:6f4:80f6:6ae7 with SMTP id 006d021491bc7-70b88ab7462mr231021eaf.67.1792695172346;
        Thu, 22 Oct 2026 11:52:52 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84f7703d288sm536083a34.4.2026.10.22.11.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 11:52:52 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 22 Oct 2026 12:52:49 -0600
Subject: [PATCH v2 2/4] dmaengine: dw: Fix XFER bit set, but channel not
 idle error
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
Message-Id: <20261022-submit-dw-dma-synchronize-v1-v2-2-5244e94dca8c@gmail.com>
References: <20261022-submit-dw-dma-synchronize-v1-v2-0-5244e94dca8c@gmail.com>
In-Reply-To: <20261022-submit-dw-dma-synchronize-v1-v2-0-5244e94dca8c@gmail.com>
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: Serge Semin <fancer.lancer@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 dmaengine@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2

From: Serge Semin <fancer.lancer@gmail.com>

If a client driver gets to use the DW DMAC engine device tougher
than usual, with occasional DMA-transfers termination and restart, then
the next error can be randomly spotted in the system log:

> dma dma0chan0: BUG: XFER bit set, but channel not idle!

For instance that happens in case of the 8250 UART port driver handling
the looped back high-speed traffic (in my case > 1.5Mbaud) by means of the
DMA-engine interface.

The error happens due to the two-staged nature of the DW DMAC IRQs
handling procedure and due to the critical section break in the meantime.
In particular in case if the DMA-transfer is terminated and restarted:
1. after the IRQ-handler submitted the tasklet but before the tasklet
   started handling the DMA-descriptors in dwc_scan_descriptors();
2. after the XFER completion flag was detected in the
   dwc_scan_descriptors() method, but before the dwc_complete_all() method
   is called
the error denoted above is printed due to the overlap of the last transfer
completion and the new transfer execution stages.

There are two places need to be altered in order to fix the problem.
1. Clear the IRQs in the dwc_chan_disable() method. That will prevent the
   dwc_scan_descriptors() method call in case if the DMA-transfer is
   restarted in the middle of the two-staged IRQs-handling procedure.
2. Move the dwc_complete_all() code to being executed inseparably (in the
   same atomic section) from the DMA-descriptors scanning procedure. That
   will prevent the DMA-transfer restarts after the DMA-transfer completion
   was spotted but before the actual completion is executed.

Fixes: 69cea5a00d31 ("dmaengine/dw_dmac: Replace spin_lock* with irqsave variants and enable submission from callback")
Fixes: 3bfb1d20b547 ("dmaengine: Driver for the Synopsys DesignWare DMA controller")
Cc: stable@vger.kernel.org
Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
Tested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw/core.c | 54 ++++++++++++++++++++++++---------------------------
 1 file changed, 25 insertions(+), 29 deletions(-)

diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index af1871646eb9..fbc46cbfe259 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -143,6 +143,12 @@ static inline void dwc_chan_disable(struct dw_dma *dw, struct dw_dma_chan *dwc)
 	channel_clear_bit(dw, CH_EN, dwc->mask);
 	while (dma_readl(dw, CH_EN) & dwc->mask)
 		cpu_relax();
+
+	dma_writel(dw, CLEAR.XFER, dwc->mask);
+	dma_writel(dw, CLEAR.BLOCK, dwc->mask);
+	dma_writel(dw, CLEAR.SRC_TRAN, dwc->mask);
+	dma_writel(dw, CLEAR.DST_TRAN, dwc->mask);
+	dma_writel(dw, CLEAR.ERROR, dwc->mask);
 }
 
 /*----------------------------------------------------------------------*/
@@ -259,34 +265,6 @@ dwc_descriptor_complete(struct dw_dma_chan *dwc, struct dw_desc *desc,
 	dmaengine_desc_callback_invoke(&cb, NULL);
 }
 
-static void dwc_complete_all(struct dw_dma *dw, struct dw_dma_chan *dwc)
-{
-	struct dw_desc *desc, *_desc;
-	LIST_HEAD(list);
-	unsigned long flags;
-
-	spin_lock_irqsave(&dwc->lock, flags);
-	if (dma_readl(dw, CH_EN) & dwc->mask) {
-		dev_err(chan2dev(&dwc->chan),
-			"BUG: XFER bit set, but channel not idle!\n");
-
-		/* Try to continue after resetting the channel... */
-		dwc_chan_disable(dw, dwc);
-	}
-
-	/*
-	 * Submit queued descriptors ASAP, i.e. before we go through
-	 * the completed ones.
-	 */
-	list_splice_init(&dwc->active_list, &list);
-	dwc_dostart_first_queued(dwc);
-
-	spin_unlock_irqrestore(&dwc->lock, flags);
-
-	list_for_each_entry_safe(desc, _desc, &list, desc_node)
-		dwc_descriptor_complete(dwc, desc, true);
-}
-
 /* Returns how many bytes were already received from source */
 static inline u32 dwc_get_sent(struct dw_dma_chan *dwc)
 {
@@ -303,6 +281,7 @@ static void dwc_scan_descriptors(struct dw_dma *dw, struct dw_dma_chan *dwc)
 	struct dw_desc *child;
 	u32 status_xfer;
 	unsigned long flags;
+	LIST_HEAD(list);
 
 	spin_lock_irqsave(&dwc->lock, flags);
 	status_xfer = dma_readl(dw, RAW.XFER);
@@ -341,9 +320,26 @@ static void dwc_scan_descriptors(struct dw_dma *dw, struct dw_dma_chan *dwc)
 			clear_bit(DW_DMA_IS_SOFT_LLP, &dwc->flags);
 		}
 
+		/*
+		 * No more active descriptors left to handle. So submit the
+		 * queued descriptors and finish up the already handled ones.
+		 */
+		if (dma_readl(dw, CH_EN) & dwc->mask) {
+			dev_err(chan2dev(&dwc->chan),
+				"BUG: XFER bit set, but channel not idle!\n");
+
+			/* Try to continue after resetting the channel... */
+			dwc_chan_disable(dw, dwc);
+		}
+
+		list_splice_init(&dwc->active_list, &list);
+		dwc_dostart_first_queued(dwc);
+
 		spin_unlock_irqrestore(&dwc->lock, flags);
 
-		dwc_complete_all(dw, dwc);
+		list_for_each_entry_safe(desc, _desc, &list, desc_node)
+			dwc_descriptor_complete(dwc, desc, true);
+
 		return;
 	}
 

-- 
2.53.0

