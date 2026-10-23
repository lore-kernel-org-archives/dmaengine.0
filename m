Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792772854;
	b=QjxZPqdTDS6Oe4aoGOHVXmKoCeI/8QxIZHaJyqJv37rhtKZHadTDN4dYVXetNEbW5tC7
	 hNVgakCKDERn05PVaZnF5cvw+CGSaxao9WeMch32YcBR1sXF208CqxpK8Tzkv4v9AscWH
	 lb09QQinz3GGKmq2OXl1KJI6G8y1Efi2mtvKPWAEty1fagqRCiOFk8c3BCKvWNFUFEKMv
	 emXuqUzS9tKmEBQQ8+6INQ58Zyxd6rBBZ/S2tRKFo39bka5SyTrGq10KkFF8HrYW+EUZ6
	 pl3OUUomC1vERo+R18FqMAIqHD20fXBYYXjwbsVYXpvVTYXHo5bH8fTDIQ8R+JifxPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792772854;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=WWUMgnlvvc4Rsjza9ahfhnVgrFXzVeqndskQZgUZGQ0=;
	b=usRarASY7DXfhlpHkZb6iS5XUwni2B9L99Z+JZIzfqfaOqvdYdtxMOhUvJDdROZZV6MB
	 iTx/vZafYXD0cJ9Qdw6jOMc78qMqA4GFT73Ujov1R4hga6ebrhm2s1kO463Hub6jr6I01
	 5uMt6eilzFIXfzBc8gkTuKY0vDiuqXw5UyqT3HVUOi2dORVJSjpRqm2Olo7z9O3K7mFoq
	 RxfM6Tw/9dB7xkObdQ6IMuMxJ/UwfAfZ4wRqQKPZVL6fp/GpZw4jgYqQp4CTvoZfbgWsz
	 oJ4VazfZG6kRew1bL+WWCRMDj8uzOMy8U3A3NjG3Tv51GTh7Bt2XmCppNknSw3gJ2Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RxJrr56i;
	arc=none smtp.remote-ip=209.85.161.50
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA1A606A328
	for <dmaengine@vger.kernel.org>; Fri, 23 Oct 2026 16:27:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EA1A606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RxJrr56i
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-70b875f6f13so651059eaf.0
        for <dmaengine@vger.kernel.org>; Fri, 23 Oct 2026 09:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792772853; x=1793377653; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WWUMgnlvvc4Rsjza9ahfhnVgrFXzVeqndskQZgUZGQ0=;
        b=RxJrr56i/Xd+UwWgOVCGk/OzRjFSeaTQUyq0QbJtku9ewGTz+Sl0wD+J0xrARAoYeB
         9ThI9p4CFvshdNQW+IovO1QhhbLI5VweC1ye0uqqj41b4h8a8lLjDxLsLeWTyDnt6alH
         XKoaBlbyI9xrF9xNxAg1fzS65XlA5gzVg7Pudeb3HtzZYXuEKeIy16YRPB3VgtLAhn9O
         bvBFSqE9GLJgUJaGVyObLutni+DdPoru8+sPaqhsaaVRgaL9hVEojQGo4hJnp/3ux696
         3FvEHrGyOv2JMUtRe4Un6VJ9osnoeFxhPNHjm+Lj4DTWdQc6PGEK0xXbdcEEOWgolZJ4
         tZEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792772853; x=1793377653;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WWUMgnlvvc4Rsjza9ahfhnVgrFXzVeqndskQZgUZGQ0=;
        b=Vn5pCKkx7x+pYIi0jS79waUVT8p1YzVgLo8Wv1UV96UZYkG3czm0siSmzSDt6T1u6w
         JJEmfK5eGDot7m70qchwiqNEjOf6aQAe+WMbPuqpK0ivCIUWe9AjQ5ZqpBtAUl5JORvD
         O9YcasWC4oX067B5Ko/z/bxYEXB0gJl8dXWNxwdfK92EjA629L3oKa6WRkmo2hVQAPZr
         v2HuoAfEIMRD7m6UrDrOre2y09nMwugkWkc9o4oExENl+qxxGrjrdZWZhGNI2YiDsgyX
         abGkEf6N9AGt6f4rdiBchd98yzU4WiA1BWKfNZlQwup7nXon2qAT1NPq62Hq9PrMInQ2
         tC+Q==
X-Forwarded-Encrypted: i=1; AKwUvByHFTCjigW0ZkJEoIo3Yz3wRs04pZezkUfEMeMvs0CmrCJ0oJYNbv9av2NSZpwmkq6alkkuqia0jRY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLD5eW1uLgzNYXGudIxNcNZzpzFOdM7dZs2H2mZQMyczN9/MOvK
	ABQk+Xy3ZYkUzUCF+y18KAlNV4brVi8HHJRiUzeGSXjnJnjkQYLEn+Bs
X-Gm-Gg: AYBFou3E+XH32QfkCnd6E6tjR+Z2wAXkfSRSVmtmwaH4/+qKiOBPN7POOtWfCzVnudA
	FjJqeaIm3zp6i8P5djuO3O4HE7/t/C4AXcoiiB/q9aHwKJCFvmvmgtrCvYrYP/vXG23BnhWL/l+
	NA/x3kccLTprvI+6Yk930FHKwMmLlQriJGvWGG2YMx1nW+DCivkYr2f14K/YV4QvCXES4U7r0CJ
	HOxwCSHfuX6oQ7Z1W79bYP+KkERYcSRANwuMlWwOFLlXLCubgEzRuWveQX5+kYqbb4s/8E7wj/8
	m71t+NFfs1h03nI537yKO3quJMbaCsN54xhQmdyTp3lKPOTb8VHz5DwoSnze6kHb0bM5jMzwHEQ
	6HLv8rD4hReltalbUi5QS/ppMeg92ikKckuLWbuNyPJk48Odq7pJfgGtaMQz3p/vB/QeYKIutif
	eqQU7tzu1WWDfPoDK/VKXtCaBfmYmrGDtRdTqecZ70wnXhTU+MZhbVrGzqeVqOkcb0V/fNvXmw2
	p6vpQhDUpLhTfrsKRwqEDo2Q7cp228QpKGNi/xNK7rLHGMLtnU/awzjvR6Le9xwfobASv6FWd76
	TxiKUKjRKX0xGLGJDdIvv4D9qgqWQJXPPwZSVxIKhPPpza7tXPX4yd70ZDVXQpCrbxWdAKhBQH7
	0wvP846XXEn8k9BDkyellQ9dtafQd80AoLtE88uTfrB/JAd2X9OoOVVEwq3XnzolkR5pIOk1i/q
	LFAiE=
X-Received: by 2002:a05:6820:612:b0:70b:960c:53d2 with SMTP id 006d021491bc7-70b960c6672mr938760eaf.1.1792772852613;
        Fri, 23 Oct 2026 09:27:32 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70b9aed3144sm372801eaf.12.2026.10.23.09.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 09:27:31 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 10:27:22 -0600
Subject: [PATCH v3 1/4] dmaengine: dw: Fix XFER bit set, but channel not
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
Message-Id: <20261023-submit-dw-dma-synchronize-v1-v3-1-c62bf048f5ce@gmail.com>
References: <20261023-submit-dw-dma-synchronize-v1-v3-0-c62bf048f5ce@gmail.com>
In-Reply-To: <20261023-submit-dw-dma-synchronize-v1-v3-0-c62bf048f5ce@gmail.com>
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Maciej Sosnowski <maciej.sosnowski@intel.com>, 
 Dan Williams <djbw@kernel.org>, 
 Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
Cc: Serge Semin <fancer.lancer@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 dmaengine@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
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

Clear the channel interrupt status when stopping it, and keep the XFER
check, descriptor detachment and queued-transfer restart in one locked
section. An empty active list needs no completion processing.

When the locked XFER recheck finds no event, only update residue. A stale
tasklet snapshot may belong to a terminated transfer, and a zero residue
only means the source has been read, not that destination writes have
finished. Requiring RAW.XFER also prevents the fallback scan from freeing
a descriptor still linked on active_list.

Fixes: 69cea5a00d31 ("dmaengine/dw_dmac: Replace spin_lock* with irqsave variants and enable submission from callback")
Fixes: 3bfb1d20b547 ("dmaengine: Driver for the Synopsys DesignWare DMA controller")
Cc: stable@vger.kernel.org
Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
[james: require a locked XFER event and handle an empty active list]
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw/core.c | 70 ++++++++++++++++++++-------------------------------
 1 file changed, 27 insertions(+), 43 deletions(-)

diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index dd75f97a33b3..07a5f5105787 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -141,6 +141,12 @@ static inline void dwc_chan_disable(struct dw_dma *dw, struct dw_dma_chan *dwc)
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
@@ -257,34 +263,6 @@ dwc_descriptor_complete(struct dw_dma_chan *dwc, struct dw_desc *desc,
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
@@ -302,6 +280,7 @@ static void dwc_scan_descriptors(struct dw_dma *dw, struct dw_dma_chan *dwc)
 	struct dw_desc *child;
 	u32 status_xfer;
 	unsigned long flags;
+	LIST_HEAD(list);
 
 	spin_lock_irqsave(&dwc->lock, flags);
 	llp = channel_readl(dwc, LLP);
@@ -310,6 +289,10 @@ static void dwc_scan_descriptors(struct dw_dma *dw, struct dw_dma_chan *dwc)
 	if (status_xfer & dwc->mask) {
 		/* Everything we've submitted is done */
 		dma_writel(dw, CLEAR.XFER, dwc->mask);
+		if (list_empty(&dwc->active_list)) {
+			spin_unlock_irqrestore(&dwc->lock, flags);
+			return;
+		}
 
 		if (test_bit(DW_DMA_IS_SOFT_LLP, &dwc->flags)) {
 			struct list_head *head, *active = dwc->tx_node_active;
@@ -341,9 +324,23 @@ static void dwc_scan_descriptors(struct dw_dma *dw, struct dw_dma_chan *dwc)
 			clear_bit(DW_DMA_IS_SOFT_LLP, &dwc->flags);
 		}
 
+		if (dma_readl(dw, CH_EN) & dwc->mask) {
+			dev_err(chan2dev(&dwc->chan),
+				"BUG: XFER bit set, but channel not idle!\n");
+
+			/* Try to continue after resetting the channel... */
+			dwc_chan_disable(dw, dwc);
+		}
+
+		/* Detach the completed transfer before starting queued work. */
+		list_splice_init(&dwc->active_list, &list);
+		dwc_dostart_first_queued(dwc);
 		spin_unlock_irqrestore(&dwc->lock, flags);
 
-		dwc_complete_all(dw, dwc);
+		list_for_each_entry_safe(desc, _desc, &list, desc_node) {
+			list_del_init(&desc->desc_node);
+			dwc_descriptor_complete(dwc, desc, true);
+		}
 		return;
 	}
 
@@ -389,22 +386,9 @@ static void dwc_scan_descriptors(struct dw_dma *dw, struct dw_dma_chan *dwc)
 			desc->residue -= child->len;
 		}
 
-		/*
-		 * No descriptors so far seem to be in progress, i.e.
-		 * this one must be done.
-		 */
-		spin_unlock_irqrestore(&dwc->lock, flags);
-		dwc_descriptor_complete(dwc, desc, true);
-		spin_lock_irqsave(&dwc->lock, flags);
 	}
 
-	dev_err(chan2dev(&dwc->chan),
-		"BUG: All descriptors done, but channel not idle!\n");
-
-	/* Try to continue after resetting the channel... */
-	dwc_chan_disable(dw, dwc);
-
-	dwc_dostart_first_queued(dwc);
+	/* Residue describes source reads; only RAW.XFER completes a transfer. */
 	spin_unlock_irqrestore(&dwc->lock, flags);
 }
 

-- 
2.53.0

