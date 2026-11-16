Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794826386;
	b=hL+Q/H4Uhxxwc3GHHk9uj8WFVct8gzzV6dqyF6ZkMfyi7FDUbDln5UX8X2xugUf37iLi
	 6MH1MjVrUsZDEX7cPZB93vEXyotSoo9Dtjq+TpWV+UImQxfo16EILotb7RRq2ZocAw+CD
	 vezaqICgd3oFErr2pgY+jVXJmhpdlNz21HGZwwHOksFt5nvIe2TzmVkkTds+HGwabAyBn
	 1d5ByJWbmeW+/4U3yjWEffqmJzTeZQsgDuIPptX1wYB3V9TkRoz4St5bIVH65cYnMQjkm
	 SYtMY5F9hzADwcMKtYhqUbDC1FBAJ+gSqUutB851StfCob7f9/m/lDI+yTJwCaRRgFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794826386;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=/oL/d63e2xaO/P/OLh85rsbWKHpvbqFNY1ZyDh443Xs=;
	b=Ls8jU66WDusrH9OIVfuhn/w7nj/SrAWuVTFp+hV1OWSXbZ+tI6yvRLYW2I36loL9UCPw
	 x6q9uou7L5yn0XVxbplNRSwheHkghEsD61aO0cCurkrGQ/xF8zv9IfuuLcUHu3z+XPyoe
	 x4c/pJEqfmosPQbf0tDaQnuvO6idNkk47fgz/Sy9xqRGli+AhYpe3TX9646SqLBM8nwaL
	 5BTSb2ZWwXfBou0rZdc4fTvGlSOxhKDFl29fHuTOzBUKTVjf2yosUbrWESymGpYiJXRci
	 wngHTA/3MDSaYqh1IHiIHzSgAZW+xln4ySEU0NTknyRlDsiVagHZKHE1MUaWVV0eHDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oJrJ4TgF;
	arc=none smtp.remote-ip=209.85.210.51
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48828606A333
	for <dmaengine@vger.kernel.org>; Mon, 16 Nov 2026 10:53:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48828606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oJrJ4TgF
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7f84a55e31aso2624358a34.2
        for <dmaengine@vger.kernel.org>; Mon, 16 Nov 2026 02:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794826385; x=1795431185; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/oL/d63e2xaO/P/OLh85rsbWKHpvbqFNY1ZyDh443Xs=;
        b=oJrJ4TgFryQ2A0pMaS4x8z1zIHdBSKyOhDY6LTiBPYm9D0+BuFBTcvFETam1BcvZyw
         M8SmNt1wAnDvWQcyJixj5eD4oP65pKd0gMD2+kXnqItjHYqDgaEAkM/d8KK0pCgjGzuG
         ieIOJg7x2cLAtbAcuQkDDp/CFmc4CbbdqqIbWv7zxHmD05fVaZw6+kLmuRZc0lpXg+5u
         w3uIkkoMueaj341LiYnraW///UTRBlYhvt97oUK3y4/SmT680I+Bs9ALfnD0g2W+Fzzr
         +2wKmZlevxHe6Esc5gIVILddUqwP2Y/bDhCQornkhm1mUsXXaQ9hATMShvnt4r0ZGxTd
         0Adw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794826385; x=1795431185;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/oL/d63e2xaO/P/OLh85rsbWKHpvbqFNY1ZyDh443Xs=;
        b=oBU//oA56a5rZriSMVvRtqCDb1G328o6A5/7GLpa31blj++iDDe6e9i7OCAkejlPYu
         Cf3iFCWHumyq7hGWuPMMBOoo9rUxEfF5i0fbNYhrz+iXGOnJcCq3OgzuBxRTz5Cyoucv
         WnIXP1LMsRiah6RDhXwL91p6zyISBivsHC10UGNnPSmmPiqZgBon3LJWSSpYLIfhfpDZ
         q/9hA3OqBUz3CTV1eJpai4YhdqzGqUALzO8z5hxl6ckXQIEPWxOPwUfeXcGwG1C2YcjI
         lKleBeomEjs8DlE663KfMeOud6AfwpC+CIso3M6FzqxZ4g9KxFylbviJUMSEmpa2fCQG
         om8A==
X-Forwarded-Encrypted: i=1; AL+hErFRCEYvFnCV6VA7s3UrItuuJuJsd0/qX/2W1hNvMAh6qfXKniAF6/Wz59IqJEjda3HD/pVkiZ17WAs=@vger.kernel.org
X-Gm-Message-State: APuU4Z93CmORQSPwFo7L48cA1nK2c12JZDBoF8uKwA8SPVGxuYfZyQGy
	bUzzk8SqU0BMdOmUhGeqt1DZlt6ts3X283r4YYpN0zU2qeKL7JGLJ3P2
X-Gm-Gg: AYBFou0WzA2/IY0pr+YHL4mnyrNVk3DtZK9Dt/ci/6SDkjIhTAhaXhAiUjIoUq89dlK
	J8qV7Nx3t4BZvjECm39Mtj0d2iaDcQCZnvWzHWpfnYTGsUk+yEju56GDugNAHLFLOhkiJqUD+1B
	Qz2ppBktKjqdqVva1n7gqlqf85U97nwQPooR3I70VmONNEz8sp2Ry2NMMv+km9RPt8GxEXDSUiZ
	pVW4yuGhTPvfM+cSmpCf1MULgBrTnUEejiFFU5mIeUVAbm4YRumpnttZER5b63COHykT5rATH4H
	67DNYs7AEecwRp4+n3JJ5f2mSXVTPQdypPcT2zU6pMppezeA/lqSiYgD9YU0zsnbqHRF5JlhNfO
	hfodHmmS56BB8p/ZSIrhcnDGuccUdAPaNAaipLbOCV14VxpAP7XC9JcnkZMsZXP+fcV/c0eK4A7
	9Pihbz8wEAuHkgVH32ZJCo8N+VL62M44sRxCdsr6N/Gbh9tzhd0zfX2f+WT6zL/KqMlx5yDDExy
	lDoqUPH/9AXcKstTWKL+PJ+P4fT+0+eswowLhm47S/wh3dqUAq8T3zr44mJbDgbheUSou6trTz9
	z3Yz/vE41D3Yq25xGiqNlroXYTzP2Zy79AwYLsepGL1TWk9m9b1MZqClW1FL6Kp5R2ezwMumTex
	1CtTtximBlAS98BNpjTKEDeK7XxG8Ch5F6yGIXnHVboRPgSJ5DUkoM6R/2On+IbvhKXv0pbvdM0
	i4+fOtVJ/JYPMnJ39/Knls04PqMPNMIdxHrxNd1D0av2bL4ce0TZI=
X-Received: by 2002:a05:6830:310f:b0:862:a53e:6f60 with SMTP id 46e09a7af769-862a53e7201mr7369586a34.3.1794826385277;
        Mon, 16 Nov 2026 02:53:05 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862b08b8b5bsm5555546a34.5.2026.11.16.02.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 02:53:04 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 16 Nov 2026 03:52:29 -0700
Subject: [PATCH v8 1/6] dmaengine: dw: Fix XFER bit set, but channel not
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
Message-Id: <20261116-submit-dw-dma-synchronize-v1-v8-1-4a82d64fcd1a@gmail.com>
References: <20261116-submit-dw-dma-synchronize-v1-v8-0-4a82d64fcd1a@gmail.com>
In-Reply-To: <20261116-submit-dw-dma-synchronize-v1-v8-0-4a82d64fcd1a@gmail.com>
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Dan Williams <djbw@kernel.org>
Cc: Serge Semin <fancer.lancer@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 dmaengine@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.17-dev

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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw/core.c | 70 ++++++++++++++++++++-------------------------------
 1 file changed, 27 insertions(+), 43 deletions(-)

diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index 575b7bb6af9a..2a9db9e39f5f 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -136,6 +136,12 @@ static inline void dwc_chan_disable(struct dw_dma *dw, struct dw_dma_chan *dwc)
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
@@ -252,34 +258,6 @@ dwc_descriptor_complete(struct dw_dma_chan *dwc, struct dw_desc *desc,
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
-		dev_err(dmaengine_chan_dev(&dwc->chan),
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
@@ -297,6 +275,7 @@ static void dwc_scan_descriptors(struct dw_dma *dw, struct dw_dma_chan *dwc)
 	struct dw_desc *child;
 	u32 status_xfer;
 	unsigned long flags;
+	LIST_HEAD(list);
 
 	spin_lock_irqsave(&dwc->lock, flags);
 	llp = channel_readl(dwc, LLP);
@@ -305,6 +284,10 @@ static void dwc_scan_descriptors(struct dw_dma *dw, struct dw_dma_chan *dwc)
 	if (status_xfer & dwc->mask) {
 		/* Everything we've submitted is done */
 		dma_writel(dw, CLEAR.XFER, dwc->mask);
+		if (list_empty(&dwc->active_list)) {
+			spin_unlock_irqrestore(&dwc->lock, flags);
+			return;
+		}
 
 		if (test_bit(DW_DMA_IS_SOFT_LLP, &dwc->flags)) {
 			struct list_head *head, *active = dwc->tx_node_active;
@@ -336,9 +319,23 @@ static void dwc_scan_descriptors(struct dw_dma *dw, struct dw_dma_chan *dwc)
 			clear_bit(DW_DMA_IS_SOFT_LLP, &dwc->flags);
 		}
 
+		if (dma_readl(dw, CH_EN) & dwc->mask) {
+			dev_err(dmaengine_chan_dev(&dwc->chan),
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
 
@@ -384,22 +381,9 @@ static void dwc_scan_descriptors(struct dw_dma *dw, struct dw_dma_chan *dwc)
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
 
-	dev_err(dmaengine_chan_dev(&dwc->chan),
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

