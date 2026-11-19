Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795082549;
	b=N9t3JaM6VUomKJna/yWIpc7y9In0hMs/cDsyGJJ/IitAcyg6uZ1t85oW4t9BjA6firJ0
	 /pebP8ZElmNxhK4ikXnuMVA2aiq8AAia+C/GCMZ46IxAzoQG9ouPFBwUxpn4ap4m4jhhU
	 jSqQlz9A5LmK2fcPPIRlfKEcWTNotpwm666zdjQUlJinQMQcY9ObEEvMHsBEGkZ4vsoO8
	 QHg++gBIhlxXGeDYpxkiAe7c1AKMd2KTVo/K6hjknfqfKC8QKAxB0SVH7FrD6blub10xs
	 GDAJCGTi00Mw11lFuWR3yofPl2LvhGy7ZbCgnRgrWI+TD5KlYqcrD+mYyBJryPac4AA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795082549;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=/oL/d63e2xaO/P/OLh85rsbWKHpvbqFNY1ZyDh443Xs=;
	b=ThEfDCG7QTqNDk1P5sLCnfwmhZ3UVXaewr4b4cklsw1crG+mjjzz7W3QDlEu5ej3gq+C
	 B5wzZcE5zgN81W98dGvW9tpRa58Pdk7eXEmuFoAVDRVmdVRV1j2Z7LTK6F0M5KwPzV4ws
	 F7inPRQdbJSg6j4+Nm481vhd7SKKSfTnm0vuybqAAILzSuNrUEcdKRfIOViuPCYY6Eieh
	 +wZR3INKpaMJiICuuTtm3p0g4ICniHzAJmHfVZqGynWetU62jA+hICUhIHEtXgcppOfsc
	 juQdfETUNqXxNo7xCj9dcBmw0nZKJu/jONYVkffQj0NhzsY9r9jniTySIfXk7MvUXyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="VriFb/Io";
	arc=none smtp.remote-ip=209.85.161.50
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07EE0606A336
	for <dmaengine@vger.kernel.org>; Thu, 19 Nov 2026 10:02:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07EE0606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VriFb/Io
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6d68de53053so1441186eaf.0
        for <dmaengine@vger.kernel.org>; Thu, 19 Nov 2026 02:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795082548; x=1795687348; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/oL/d63e2xaO/P/OLh85rsbWKHpvbqFNY1ZyDh443Xs=;
        b=VriFb/IomSMBKuss1NsRbwU1chZvjnuX9Ca7VX/RdWqqw1ULA7Fq2reX1LFXnkmx5C
         cw1bhkGPr8zB3cGPUQGh+xktyd8LYWZ02lHLHLWpihBPZ2nkJU27xAlWAfWHFJvNJ6xP
         svV1nIO3CQxoWaA10MULknSp5aHtzyCAdFMJutinY5/QBJAndCv3OecE7sE9NLB+hPxq
         fOnVJ04Vwh1mYdia92I8LWmdpwPH1PmqYhP4iESEIlFVqgHd3pLmkyYGUsZBpadc5Hbd
         Xd5wFtEhnScMRaNr8MIShJ96owOPI6bLblQlp9RSJnqiYQtVLQXpslJgw15oRQmvM7Sq
         OkJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795082548; x=1795687348;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/oL/d63e2xaO/P/OLh85rsbWKHpvbqFNY1ZyDh443Xs=;
        b=Q7kQCxEznHmQngbgQpKAmUeUUgBV//NpcsnOgDy2hqeuliYas3Hd6JsPeFixRfcpoN
         tVxXBkZezyxOpixZnUM3rNmYwi+aPgcmTTbQdTJhtvVNYNPev8UvKGm3Fh0UbRdiYZsz
         JuBNdHG9tmtijT5ly55bcvBrtdac+DN8ROzh3BXt36RbIbK/ePLJDgENkTD1QPMy91k+
         CAWoKYuYo/T89E6KjaCxxU0vxVYsD3em/DjxLrSu9rWK/OBFz656pC9YJdKIJKWPdDSV
         vY3yZJjDoXc3w7XG3upAubJN4mVbLuWpRBgxOjUhky10xqWtf5Ks7MeDdaSqIDbwa3ad
         l9AQ==
X-Forwarded-Encrypted: i=1; AL+hErFK842utkhYvzVLEr4gjHSn4h1c+dEvA+tWHc8wIDm4FYvzY1idLoGmYLjBOwb/E1K3kCeAqjMUpTY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/KcLYULvGvXj8IP/yOZS3I0qpgiKJ1DuqVdp1MHAKUej5Hqd2
	KYBBTPSkHTM9SpKbw/SiZA33mTlp92DPdc4FVcpB5TMQsnft4VihZSDR
X-Gm-Gg: AYBFou32G4PJJpf/MyVQ/yDQy7jKLqmnKO4g2y8gESheA4T0w3I0yf2sYaMIqZRMDgJ
	HukLNP1XJK+ScVy3wRJcbgVuwm2fAol5wEHuDdni0S85ZRR4zWy3pm1aRezunZUmvvrbqf9j63/
	QwUl4Ef6oThp7+1ciwPI9Wk50a+JjKFmJ1JI/aYC53iZA05OQaQZivTCnDe1SnFx13FMLlE93JE
	uUqWxu3rNazSTW1WGcHykR82BhxkxGbcCEa7DsriGxKQ2tzPOde7I43KLxhiiiVBKsXD0rZni37
	auDLlcbUVwRzdiiAsddGt3Ks+viLNe5B+9/SRfKAgCwg/jTyepixajzcTRF/GOXil/gDRVwmtgm
	zk1V2x22TSHPTCFYypj0Uu1bp4mgA7UNN43PnVNCrq5PAA7ZhxqAkpnFbh62HwHiKhuICS9DmtU
	tqKt2yMSlZpWU7VFReygTLcCm5BSjrRFkWxLmr6edfa9LKo2NyKVdXkj3fvxZJrhs48/mKNTmHF
	RkWTpHWAmlQuc6grLkFY3eO3XAwhO3UP+tE8N99zDkKRHVznljJx/bDngQoz7Vj7lvRYRbdx72+
	bp2hWhmUDn9ccWId9XbtztU3Ng383F4j4sPX6/NPpB4kyqzgyFwbcXuBeFWQb2x+aGOejzuhrRU
	Uj6aAlMWlbQKkaJlo6VtOFJsTIbsgyUmqlKx4Bj6R24G0pkTwABihIp10O0d0G4PKyAWptXGjzw
	YLQv1hPa5C83gxkJyIS7wYvji9EnRjh57Mf3wNNXlpWEysjXY7NfwF+zlccBUoRYLJSnWnCXRws
	A==
X-Received: by 2002:a05:6820:1ca8:b0:716:bf0d:7010 with SMTP id 006d021491bc7-71b297992demr2068946eaf.2.1795082547849;
        Thu, 19 Nov 2026 02:02:27 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b18fbb9a8sm3906194eaf.0.2026.11.19.02.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 02:02:27 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Nov 2026 03:01:35 -0700
Subject: [PATCH v10 1/7] dmaengine: dw: Fix XFER bit set, but channel not
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
Message-Id: <20261119-submit-dw-dma-synchronize-v1-v10-1-3a737597a0d1@gmail.com>
References: <20261119-submit-dw-dma-synchronize-v1-v10-0-3a737597a0d1@gmail.com>
In-Reply-To: <20261119-submit-dw-dma-synchronize-v1-v10-0-3a737597a0d1@gmail.com>
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

