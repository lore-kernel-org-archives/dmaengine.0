Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794735198;
	b=dLIw6D1aoj14BW8BDVRDL0dxGNH+Vrhb5h5AuJ2GT2xqUBKCeqoqtD761b3rwT+hO7ka
	 uYCKs+SeLNoMmu0VGZHu6Bx7CySfjMpU1bxOH+gWYbaNJCiL4zOjIv1nHWjYJAzncPAFW
	 z0HV9vw2cxn2jxNxu1sHeqUvdol0hIyEWJv6LdX6G+katDaZC7gxr7FHNyfgkrMjdV4RE
	 wDLoN77BI3FtKS72d8F7GjytZHZ488RPG3QvObNHpLATrIEhQ5eHMe2pm5SVgac+Ioqfu
	 FsxTNwEelPly0TKgwpyw4s+yzck8ELQC02VICnr7EZwEwTXDc6xnoVH0VMUJhf7UZdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794735198;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ULmfgjA8hHN0IGqRl2n23MUGsl2Syf0XQisPuEg7n6M=;
	b=RIqt1AqEQJwxuQD4+3dlCXMl5kjpvkbj+IphnsZv+xz9CVK1Hmy+BagqElS2Nc7CFrON
	 SacnYxBSZS88IW1mASXsrHQ92pLcjUbTQuqK/UBWjX0V+rNWcNQyzaYh7zpPnq9LrL1eO
	 LplilTr4gWi4FSzA93TXY7o5L2O9bM8IDkWwjCJVtLcUiGXUGZVqlMiSyVCtDFVxnd8i1
	 iVqPxup5AO9Rw3VaqulDVlXPtqpLc5ZgqiKvU+Rn0PZ/obQKidwNuBYU8Cny1eOxXQUVs
	 +6QlLKKlgB1yChV1yfcMvTPpY7xkb6ICJMTxoVk4lW/SdaCjjuTniidfX48aeBwxxDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qqJJk866;
	arc=none smtp.remote-ip=209.85.161.46
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819BB606A31D
	for <dmaengine@vger.kernel.org>; Sun, 15 Nov 2026 09:33:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 819BB606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qqJJk866
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6b1afdf5196so872164eaf.2
        for <dmaengine@vger.kernel.org>; Sun, 15 Nov 2026 01:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794735196; x=1795339996; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ULmfgjA8hHN0IGqRl2n23MUGsl2Syf0XQisPuEg7n6M=;
        b=qqJJk8662Fzd874Ad0qZxtNVkMdspNn74DC+U8MD2yXKBI930cQ/vNUl2LZC/MsMIh
         tuCmlOm+AVXfFxs462pE+8i4JCsNlejeC/wTVqarM7xKMrr9kiXAKvdfQLyiTOza/d19
         bmmcOGEgv1SPFLGbjpZBer4djzPH9HofROdPuCPuedzkmtn1SJQEEeOMHzmShtf2VkbL
         vqrEOnqbwnlHuNl89StZ5/2rdzvr+Cv4d8RHnr+cWtiLfOgsoRt6S0ghwH/Ho/a0uEBs
         +fBSzLfklwJHMDPo+yca2K19KOH4J2nJi/CBsZ0HNXt/OnAe4ZskoecEmSysW5/Qr1aj
         /8Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794735196; x=1795339996;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ULmfgjA8hHN0IGqRl2n23MUGsl2Syf0XQisPuEg7n6M=;
        b=sdaxJwb0F6nh0YrRIw9s7K4OFO0wzraoGO3tAvz2veWjV+1WK6pwMqdRk0Q+PWYKBt
         VaNSjOOMG9yvgBY5/5Wf5GAGvwJiQmbcNBQ5yPr4cKPL176E2XVgauH+2z4T4VGzwLDT
         x3Wo+v3SBltVRfEh6f0I3iYtV36Kq7fKe7dAEgcKjuAivzHkbEF/MykScifXzMuHkjfp
         OTP4RufPBvQDrFXSfe+gBXf8Cc+Cw2Wmao9LAXLnckG8rxZVGBR3p6wv9ZMwpcj8Z+7k
         e2mQ/TyYnwDyp0Sdff9YatQy2uYrecIi2W4OPDak6lPCNFqA9O2s1CracTBhxI2xGTz8
         J6JA==
X-Forwarded-Encrypted: i=1; AL+hErEDkMAuQMseidc9LRFSu4rEMxOWgr7HE9rThBULHdxz2fMf22ZtIhKJ6GieO8vh/wfZ24dBrGnPKYA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8HF2103jw1RaDeuDA3jnTFqET3h0zQyZdoGrvxMjjVwJPa2yTR
	DJwrIOi8ItUFgwcrNR8eguQzelk64yOl1fC94ltWDOdvrMCgLGsYCaP8
X-Gm-Gg: AYBFou0Mruiw+rEwBGWVowjZ61qm7lxREirMUcMr/MMchaUmCCjCK9/lcN0Uq7LCIHo
	LH+VZtgQk/mVrQXSEli/nXgIIOg5WaVbqv+uWS5V6JuD2qcyTatQNKVh1nOqkhA8AXGww78VKGV
	E3Bqg0mDYFve0WuozyEG66/Ri0beW7fl8dfvxaEx9tw49B74frHSsKjhwrOlVMKS7tQgPzbv9i3
	rd5v0emPHpRC9+n5JIg7I+NsSSxkqXT9P5tLkGB/yihBwIhSbxAJWM/BKp9KWwf+fLzKS2kLL4b
	oC3yFQHYIKK9dBXYnsV/rI8b2fwtY47RTFhdiQGe9GeyGVB/Mc6X+7Y/ue5VyzQ0GK8/40byWxj
	2kLatovV2SE2XjwP5qYacVOWc4/p+LfeAd7ysCOPN0v+e3GxDR5oCbz58j+cYRsC7abIBVbrTNe
	TmuD6wa0jNmNr08dCNNLpxL1utwx0pMy+qmUfrWkYk8I2rw18NIUSTbpDKt8BmiBE+fSr4DoS4E
	FZnfLSuH+BOkYxgnmnonEHztriQzxgZtGlXPsz8DphOOHdp5PNWlHt1fDgodZeCSR/coCd2rZHs
	Y3EskQuLSg+f8VtZ5HoQP+6EBMs4VkEozvDvfenHs3zwSS+WS50kt6qD5Y31MaiLe2QJSGPypUi
	Z+f9QQsI+sZ9ljtSqAcft6iW3PRT/xsZIyLU5M6kaLTr4jTG3zOqzcOUlQMlh6m0sPCnWruFiT0
	g+wSS9eB5KhxLHyKM2dyvwQyEjDDGAnWgTZ79NnSvHnCxu1+slmws=
X-Received: by 2002:a05:6820:5201:b0:71a:ed36:e3e2 with SMTP id 006d021491bc7-71aed36e554mr241349eaf.27.1794735196516;
        Sun, 15 Nov 2026 01:33:16 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab43347b9sm5933617eaf.12.2026.11.15.01.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:33:16 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 02:32:51 -0700
Subject: [PATCH v4 3/9] dmaengine: sun6i: take the device lock before the
 virtual channel lock
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
Message-Id: <20261115-submit-sun6i-dma-lifetime-next-v1-v4-3-043cd476a45f@gmail.com>
References: <20261115-submit-sun6i-dma-lifetime-next-v1-v4-0-043cd476a45f@gmail.com>
In-Reply-To: <20261115-submit-sun6i-dma-lifetime-next-v1-v4-0-043cd476a45f@gmail.com>
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
 James Hilliard <james.hilliard1@gmail.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2

The pending queue is protected by sdev->lock, while virt-dma uses vc.lock
for descriptor lists and cookies. issue_pending() and resume() currently
take the device lock inside the virtual-channel lock when queueing work.

Take sdev->lock first in both paths, and inspect the physical-channel
assignment after acquiring the locks. This establishes the nesting order
needed to keep allocation and descriptor startup in one critical section.
virt-dma preparation, submission and callback processing continue to use
vc.lock independently.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/dma/sun6i-dma.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 9533f3bdb949..0b8e5deb2252 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -954,23 +954,24 @@ static int sun6i_dma_resume(struct dma_chan *chan)
 {
 	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(chan->device);
 	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
-	struct sun6i_pchan *pchan = vchan->phy;
+	struct sun6i_pchan *pchan;
 	unsigned long flags;
 
 	dev_dbg(dmaengine_chan_dev(chan), "vchan %p: resume\n", &vchan->vc);
 
-	spin_lock_irqsave(&vchan->vc.lock, flags);
+	spin_lock_irqsave(&sdev->lock, flags);
+	spin_lock(&vchan->vc.lock);
+	pchan = vchan->phy;
 
 	if (pchan) {
 		writel(DMA_CHAN_PAUSE_RESUME,
 		       pchan->base + DMA_CHAN_PAUSE);
 	} else if (!list_empty(&vchan->vc.desc_issued)) {
-		spin_lock(&sdev->lock);
 		list_add_tail(&vchan->node, &sdev->pending);
-		spin_unlock(&sdev->lock);
 	}
 
-	spin_unlock_irqrestore(&vchan->vc.lock, flags);
+	spin_unlock(&vchan->vc.lock);
+	spin_unlock_irqrestore(&sdev->lock, flags);
 
 	return 0;
 }
@@ -1058,25 +1059,23 @@ static void sun6i_dma_issue_pending(struct dma_chan *chan)
 	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
 	unsigned long flags;
 
-	spin_lock_irqsave(&vchan->vc.lock, flags);
+	spin_lock_irqsave(&sdev->lock, flags);
+	spin_lock(&vchan->vc.lock);
 
 	if (vchan_issue_pending(&vchan->vc)) {
-		spin_lock(&sdev->lock);
-
 		if (!vchan->phy && list_empty(&vchan->node)) {
 			list_add_tail(&vchan->node, &sdev->pending);
 			tasklet_schedule(&sdev->task);
 			dev_dbg(dmaengine_chan_dev(chan), "vchan %p: issued\n",
 				&vchan->vc);
 		}
-
-		spin_unlock(&sdev->lock);
 	} else {
 		dev_dbg(dmaengine_chan_dev(chan), "vchan %p: nothing to issue\n",
 			&vchan->vc);
 	}
 
-	spin_unlock_irqrestore(&vchan->vc.lock, flags);
+	spin_unlock(&vchan->vc.lock);
+	spin_unlock_irqrestore(&sdev->lock, flags);
 }
 
 static void sun6i_dma_free_chan_resources(struct dma_chan *chan)

-- 
2.53.0

