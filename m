Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792780977;
	b=jTNe+qBUHg2CpeMOeZRgaENeNIu8DLAHP1WAKrWikNCIGzzQQU09I32bgAZHip6WxMhf
	 Gw4hi9Fq+JIOpQ5IYQJxfxUdPdn9cUjF/BS3BnRHKGJTT9rcXBbSVRHltkVWZa3pdC9Q+
	 oNeE9bfRu9qBbbgOqshD92jG63FYjWLb73F2QAacKHgPGR2ahuz2ogcwAfs03mm8Kjsd3
	 JSgDyg/jK7n2Yf/5ENRMuCi9YOxE1uW2WUDqZccTsmVRB6odKjTvg7EVXz8lqmlPz/xpH
	 C7vsvxCEAt/SFLffQBboJAfLqnmpMeuxGWQag8ezrAvjSZ5tnCq5C4G5IjORhSIkx7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792780977;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=PqNMKX2JAKOcdDMHgbj/E/YCDonhqS9mo8xwaEZBKXY=;
	b=s8zGD0gIvsSRPkGl7GQkepC4Bt86gtfCapFAM+wHh8pzyYEd3a6NPwMoK61Mt46EvsSx
	 inPCcFuPUUW5QLgg42L1fNmLMx1ydUqKJbAF83kOUIfCb7r+pa/ubgsbJLuvk/sZeu+p3
	 5UOx0TSkUNWFuloEUZkA4a5V2CfHae+XGUqMde0dWWi9lqnrULqaIXF8K/3W/AMjXktsp
	 SljT3L5sZMJ/X5u/jsROo0iKOOruvb969AHeM4QgN5pKvYTu1SyCrwcr3Y+6HeNnPN+pc
	 BmQ/L82hZ+Bm1up94K1RPX2lHuliEWRrH1JBJiMZKopCYCI4iyKueTs4VXNyxzk1A/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="e8Na5Td/";
	arc=none smtp.remote-ip=209.85.167.174
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635BE606A339
	for <dmaengine@vger.kernel.org>; Fri, 23 Oct 2026 18:42:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 635BE606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=e8Na5Td/
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4d198f1a591so634866b6e.2
        for <dmaengine@vger.kernel.org>; Fri, 23 Oct 2026 11:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792780971; x=1793385771; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PqNMKX2JAKOcdDMHgbj/E/YCDonhqS9mo8xwaEZBKXY=;
        b=e8Na5Td/jMa9nZR4f5MQvdLoMXTRwMZy8Vo9M5MJWvrNyRIr1nDrHDZ7bdiGT6MG2z
         QuM6Tbn+W+a+DaWYDajzZMqkLMJHOujuHdASNVZx1QfB1Za0EeVw9QCZGUPGTSSKgOTW
         gO+UKNHKBrgtSBARHw3p2WnBxSeT6u6q59EB61FI9jbspCowXl1h/7WCFUdTptFsMv2g
         AC4JQnL0G5UGq1GONHkb51xAE4oxSyDOZdQRAncKUCZpnVuve8+QkvNHfxRpea8IWdQ8
         QqBLWkF0F5j+UEasRsTrf4slcTB6c902obUaM1ERrKglvilyOJqNoqJfdUorknlSm0cm
         0m7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792780971; x=1793385771;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PqNMKX2JAKOcdDMHgbj/E/YCDonhqS9mo8xwaEZBKXY=;
        b=j0lNDU4Ox7UT61g59uEhIc5nxIxUitC7trohkfylFv2aiVbNBifA4Wxxb12GcNFLPo
         UcvZ+S2Jz8JzXUouzqzWtj/CyVRy8CHPjZk/Sbk8BUl1to3iGU0FRtrqtfRf3gCkVnUp
         8Sqd1FZqGdIzPpIa4ya54zEQcPsyim+GB4MSd5gex4ElftoCN+ou9j/Hf2n98CH7Y9Q8
         ef1W/TMsurA/QnhhT0c0XunzO8T56MFffec7rqemni3hcJd16Q3HnxGcVUX57awCVchz
         +5nPB4liNI6NeyoOlnMg7lyHNg17FMfmxP+dbwBPUFhmb2qZmM6dsB0sGhGZlmfy7w1+
         v+Gw==
X-Forwarded-Encrypted: i=1; AKwUvByt4ETnKHDsPHN+S2mWn3BWctlbYHqs3YRRGMbDmvp2qWatM4MIut2sM0JrxZGvkOEeQzWez+A+vAc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLno6d0BRkMbOEl1gJFHZMilnAxMzyiOqK9dwX1gtWQjcyTvR1y
	U/Wun7xDXL/qC09q3QFP/s+sGUqZoZZQ8PX932WdDdMKFV/9a7vYmXMM
X-Gm-Gg: AYBFou2VT/2t+0mjt9x94Geefn5ZoJijL8G32C0FkoBG17Qu4B049qlw7Iq8FGvOJ4A
	TwiyyGVDDBlfQMxi+XHG5oXXT+/KZU4Yz8osj3vWlPQQSW/WcMZet/xH6TzfwySk99M5eazYII7
	5FQn42BXOZ+HjeGoHNuyacQxSMosALU7AO0jemF4ppEnL/m0HxVnwb/7vSaaX295pwOVRFR1HSn
	dXS547PFhEOoXfnJ/4N5eCtvh93rSS0h8EHBl1EBVF6ziCJrOH3/vZrqnxYPcKWDc5GyPaTK+cM
	UU+Fm2sJnKDMZkdQSHSdazSke1YmihYd5SsbkPPzOTmpNK89FVI/Z6dnvTkATPF8Wq4dxBc3glC
	8y3qvG9FBO/NP3LG61QUZ9aXuDUFnmDWgD8tppXmn2hFxQ6BSjVgW00WY+KZ+VTFCkQiXOeJ6h9
	o02dVImgsOic/Dy7wGHJqd0jjdiEqJsnwkc5wTweouMa+Q5R1obyzX6coJDSxMvJYF9xWc//fyR
	uGYlrbUUoYBsv2DJDWEdKO1uWGAtinb6HIMQ45R+6oz8srTJ6JBqWIGFmOWIItkSKWnZUnIZrnj
	cHBkW/5Ep9+ClV/LydUjXv0XJAMoWO//eNnMX2LEJa7tN51r848TymHrJJCR4jR10orPAZsMv3x
	u9nevY4g+0UacX2RyrsLxN39kCHd+6slsPjW8CAGGIEryBnzqQJfq8j6L8W5YKgZA6PMpOyZhyd
	aBy3YCX49zBm71/xe6mL+1iJQ=
X-Received: by 2002:a05:6808:1911:b0:50a:6fcf:d287 with SMTP id 5614622812f47-55c00232f05mr72486b6e.37.1792780971361;
        Fri, 23 Oct 2026 11:42:51 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55bfe199544sm336682b6e.13.2026.10.23.11.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 11:42:50 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 12:42:40 -0600
Subject: [PATCH v2 6/6] dmaengine: sun6i: keep cyclic state with the
 prepared descriptor
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
Message-Id: <20261023-submit-sun6i-dma-lifetime-next-v1-v2-6-c9e07cc44bf8@gmail.com>
References: <20261023-submit-sun6i-dma-lifetime-next-v1-v2-0-c9e07cc44bf8@gmail.com>
In-Reply-To: <20261023-submit-sun6i-dma-lifetime-next-v1-v2-0-c9e07cc44bf8@gmail.com>
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
index c244ef572492..c9a72cfe3f44 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -191,6 +191,7 @@ struct sun6i_desc {
 	struct virt_dma_desc	vd;
 	dma_addr_t		p_lli;
 	struct sun6i_dma_lli	*v_lli;
+	bool			cyclic;
 };
 
 struct sun6i_pchan {
@@ -207,7 +208,6 @@ struct sun6i_vchan {
 	struct sun6i_pchan	*phy;
 	u8			port;
 	u8			irq_type;
-	bool			cyclic;
 	bool			paused;
 };
 
@@ -504,7 +504,7 @@ static int sun6i_dma_start_desc(struct sun6i_vchan *vchan)
 			     (DMA_IRQ_HALF | DMA_IRQ_PKG | DMA_IRQ_QUEUE) <<
 			     (irq_offset * DMA_IRQ_CHAN_WIDTH));
 
-	vchan->irq_type = vchan->cyclic ? DMA_IRQ_PKG : DMA_IRQ_QUEUE;
+	vchan->irq_type = pchan->desc->cyclic ? DMA_IRQ_PKG : DMA_IRQ_QUEUE;
 
 	irq_val = sun6i_read_irq_en(sdev, irq_reg);
 	irq_val &= ~((DMA_IRQ_HALF | DMA_IRQ_PKG | DMA_IRQ_QUEUE) <<
@@ -607,7 +607,7 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 			desc = pchan->desc;
 			if (vchan && desc && (status & vchan->irq_type)) {
 				spin_lock(&vchan->vc.lock);
-				if (vchan->cyclic) {
+				if (desc->cyclic) {
 					vchan_cyclic_callback(&desc->vd);
 				} else {
 					/* Completion transfers ownership to virt-dma. */
@@ -908,7 +908,7 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_cyclic(
 
 	prev->p_lli_next = txd->p_lli;		/* cyclic list */
 
-	vchan->cyclic = true;
+	txd->cyclic = true;
 
 	return vchan_tx_prep(&vchan->vc, &txd->vd, flags);
 
@@ -997,13 +997,12 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
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

