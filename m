Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792725307;
	b=yUO0Gr4MVYK26pPrZB1bWsYHYl/iz1P3/MXOa9ZCFBBmQ0xD4iUsze1GysieS03HkHUe
	 FdcYM1wbvMnGFGSHiUeuhYOWXqm/BBrYa5PIBZ8D7AmkqF9sH/00+Q23+RD3hHLdAF9fe
	 QuqTxXK1GSPeo2pvXsAIE6OSybnj83YqfRMAz2TkdxrT6xAH91xZe3t6yphc38NeyQlwo
	 kJvkBzoV68lAIxXv8a3qWjWE/2aJrO+/+h5dW40s1134elo2/Y3lsoDiehMCpq1FIWdJR
	 ivnuPmvp269B98FeIwip3akwwaGEQ0XeNDuNXXVJ+ooDugAmMXDIDA9Sjh/QX63VWJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792725307;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=CYdgjPfv0+4Wy+FKCquHpiCKWW+PI9qvviL25EIL1ZY=;
	b=ydWr1rBANlMD2CZ9fqLDGTghew6cEBCOpMwHK+zfXRdSDf+bebYhfsxAfTpyvMDYak2E
	 /v6X4INtHn/I7eAVZL1590Mu9MjFLXC2CcU5m8KYkxXE5Kt6UUav4watsJjAhIQn3njD+
	 l0sAXmHUM2/uLUIzS+zPuqTsMdBh3lfyNVNTEdaYWFf9EHU582c1tYBGOUS5EBPzlsYsx
	 PbwwUwvrZoS0awRFS+zJheYd14HXUullR38okJb2JzcheZXjJz22wtvlhg4/OJrgRgPAE
	 rqUTeYadoA4GP7bot+U6RAP2401d8/B6//GJMI/LKLXfyCPB2urQRCf6NtegbHRyciw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VPOF8c3u;
	arc=none smtp.remote-ip=209.85.210.54
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E86660A2600
	for <dmaengine@vger.kernel.org>; Fri, 23 Oct 2026 03:15:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E86660A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VPOF8c3u
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-8253bc5a613so258272a34.0
        for <dmaengine@vger.kernel.org>; Thu, 22 Oct 2026 20:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792725306; x=1793330106; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CYdgjPfv0+4Wy+FKCquHpiCKWW+PI9qvviL25EIL1ZY=;
        b=VPOF8c3uG/vsbusufMKR/t8KqgMk8CFRuyCz01PDthlpk482ax5edQeaoE0j0XqJdj
         AIPWO7Kows4IDIa2LKREkCgFw7/0gX8c+FyFJb1n+41EBFce/4jJ97mqz6qW8+xOAWCE
         DV5dK+ncEB0N9dDx35nkLDTXLGBT9MsO7owpv+NtzvmLEA006rYOUC484KTWJcmxnOTz
         T32aJJID3e9xSFuyXq0fD70ZpbRMMQuuUKJjv11lh0+lxDwvIhQAy+E8Wml4YwoBOOAV
         l41DzfCPAfsVUuFBsb/dBTiZLuxOTF0AeN2fs2+DKeMfVUgAnPDl4en580rqsZSRLbGI
         aI7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792725306; x=1793330106;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CYdgjPfv0+4Wy+FKCquHpiCKWW+PI9qvviL25EIL1ZY=;
        b=DWz5LMoB4nMC8t2v6Pyl0GLJ51Xjg7PlMJ2Ombc63c5bcRwpoIp/7ehbGvV+SgweA0
         8xJKZBiJenYT8PnlZVdpJNG6KkKgWjRZSEq5bHthFN7+sGPkxLSsRtezCJEspyrlTIRv
         /0hbYQHidxGz/4TA4fYY6/QTASJxMFTfa/2UOmSolQnbEOneHmTNOM1PC5AaVIcNDcvR
         BnAuKaIRYJc/qzYRCwdjDUyPO2ywj8UzNu3YseZ2/XvbN1NLPduSFdZ0BPbBlIFtTgIe
         rUCZHPLaLHma87o7AMq/gPTUZ5QkoTBrNN4xPVz6NH/+uZI9FuSpYz+82B6mAJ7O/Ljr
         RyMQ==
X-Forwarded-Encrypted: i=1; AKwUvBwm1qEIBnMAgj8o6XJ6000AQ85UbaPSA3V/pGQI378UVYCySUn6HrYvGvug/30oRQZ5OUUK06WOOb0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLbEIvqygtPOS8O1RtUzpuz2/yRQ12ny84LTVvgjMKyLDQKX+vs
	cQLFLFn4fga5WsVyZE+KIQ3dNKUtv2X1AgcKsnz9Cp5//Ri7NyeRjcvT
X-Gm-Gg: AYBFou1+GUUARmYN7sBt038+46LWRvdu/kzEfS22wfqaGfm2XwELUPD9w0VWbQziFmT
	JAXpoVr0CvlNRuOqxPuGVgLERhka6FyL0PEFWgPT7fUXIyFgHfshhrMppdBOh6pE3f6KtbkrPd9
	xeXWNnYjy4dYUW+EP5vt9DKwMyxQryluuwVV6qtAPHGBg/hbiwNA4rl+ZyszxIcnCrh4pQNYWX1
	NU+dMJs21JTUZ+J9Gq8WFwMlEioUvetuHTHBBBxGlISP/YCB9riG3YeejTN67S8Ywoz59yAAUgP
	R/gvBtYF+PIiF99g+V32m94fu8WZ0BbaneKyu0C3l27bpeBxTMSxUBgGr/X4G0DV9PEjMCkMewD
	qMZGbXu1zgDU5WBrkIeLCYqBa59me9jNjHFkfHxeifZ7Eh1PwUH9nebIBykaafNfpbMfEwihQdr
	25LowPxmYozflU75KdIm9WWFcRERUhj9/jVWuU3BKrBrSg+xTXdE7R6GeR/jl0h5az+t05M4EDG
	PTUFEYnBUlNAKc6zcVOg4CSrssoH+ulcNr9/dhuEzmtDmre4OSUnKGjNhTiFGA1hyNleh2pCxp+
	2m02TsaREuSIMCFwfOOdS+XFjvkvzbxnMREJDnjbxdqtgoA6occ0YYZZEhXDPZWGV/kMr+r74xt
	Nsx8osb6qAwDLw7D24gu2VGv5+qwepl7LPl23sMFltiYQCmNMJTlQMXVD7xw+3pSSh92sXhapmw
	MdE6Q7
X-Received: by 2002:a05:6830:640c:b0:829:2866:3106 with SMTP id 46e09a7af769-84fb2712b6cmr633959a34.21.1792725306519;
        Thu, 22 Oct 2026 20:15:06 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84fbda584d9sm938638a34.13.2026.10.22.20.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 20:15:05 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 22 Oct 2026 21:14:57 -0600
Subject: [PATCH 6/6] dmaengine: sun6i: keep cyclic state with the prepared
 descriptor
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
Message-Id: <20261022-submit-sun6i-dma-lifetime-next-v1-v1-6-01085f684c9f@gmail.com>
References: <20261022-submit-sun6i-dma-lifetime-next-v1-v1-0-01085f684c9f@gmail.com>
In-Reply-To: <20261022-submit-sun6i-dma-lifetime-next-v1-v1-0-01085f684c9f@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Arnd Bergmann <arnd@arndb.de>, 
 Maxime Ripard <mripard@kernel.org>, Jens Kuske <jenskuske@gmail.com>, 
 Jean-Francois Moine <moinejf@free.fr>
Cc: Hongling Zeng <zenghongling@kylinos.cn>, 
 Chengfeng Ye <cyeaa@connect.ust.hk>, 
 Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>, 
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Preparing a cyclic transfer sets vchan->cyclic before the descriptor is
submitted. A finite transfer on that channel can then select package
interrupts and take the cyclic callback path instead of completing its
cookie. Merely preparing an unrelated future transfer must not change
the active transfer or the meaning of queued descriptors.

Store the flag in sun6i_desc and consult the active descriptor when
selecting interrupts, completing a transfer and terminating it. Finite
descriptors retain their zero-initialized flag. This also makes callback
retirement depend on the descriptor whose lifetime is being ended.

The shared state was identified during the H616 cyclic UART RX review.

Fixes: a90e173f3faf ("dmaengine: sun6i: Add cyclic capability")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index f807d9386939..5fac3a991314 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -191,6 +191,7 @@ struct sun6i_desc {
 	struct virt_dma_desc	vd;
 	dma_addr_t		p_lli;
 	struct sun6i_dma_lli	*v_lli;
+	bool			cyclic;
 };
 
 struct sun6i_pchan {
@@ -208,7 +209,6 @@ struct sun6i_vchan {
 	struct sun6i_pchan	*phy;
 	u8			port;
 	u8			irq_type;
-	bool			cyclic;
 	bool			paused;
 };
 
@@ -509,7 +509,7 @@ static int sun6i_dma_start_desc(struct sun6i_vchan *vchan)
 			     (DMA_IRQ_HALF | DMA_IRQ_PKG | DMA_IRQ_QUEUE) <<
 			     (irq_offset * DMA_IRQ_CHAN_WIDTH));
 
-	vchan->irq_type = vchan->cyclic ? DMA_IRQ_PKG : DMA_IRQ_QUEUE;
+	vchan->irq_type = pchan->desc->cyclic ? DMA_IRQ_PKG : DMA_IRQ_QUEUE;
 
 	irq_val = sun6i_read_irq_en(sdev, irq_reg);
 	irq_val &= ~((DMA_IRQ_HALF | DMA_IRQ_PKG | DMA_IRQ_QUEUE) <<
@@ -606,7 +606,7 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 			vchan = pchan->vchan;
 			if (vchan && (status & vchan->irq_type)) {
 				spin_lock(&vchan->vc.lock);
-				if (vchan->cyclic) {
+				if (pchan->desc->cyclic) {
 					vchan_cyclic_callback(&pchan->desc->vd);
 				} else {
 					vchan_cookie_complete(&pchan->desc->vd);
@@ -906,7 +906,7 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_cyclic(
 
 	prev->p_lli_next = txd->p_lli;		/* cyclic list */
 
-	vchan->cyclic = true;
+	txd->cyclic = true;
 
 	return vchan_tx_prep(&vchan->vc, &txd->vd, flags);
 
@@ -995,13 +995,12 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 		struct virt_dma_desc *vd = &pchan->desc->vd;
 
 		/* A cyclic callback may still hold this descriptor outside vc.lock. */
-		if (vchan->cyclic)
+		if (pchan->desc->cyclic)
 			vchan_terminate_vdesc(vd);
 		else
 			list_add_tail(&vd->node, &head);
 	}
 
-	vchan->cyclic = false;
 	vchan->paused = false;
 	/* Leave terminated cyclic descriptors for the sleepable synchronize. */
 	list_splice_tail_init(&vchan->vc.desc_allocated, &head);

-- 
2.53.0

