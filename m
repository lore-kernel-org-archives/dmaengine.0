Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794735206;
	b=FeXG3XxC3CsCyvRB60pu7GR7JDQnt7Cij0jBOempC2fC0aMmO4m7fWhw80/fiWeXJfuO
	 tJGnSgM2rBS2190U9vUpauErFhrnXY4Kzmxd4Yc/CYAXHvuqBBVaOd7A2PPb77k9JBrbb
	 eQT1o3j+UQzVsNQkYPkpQet3RUlegaExlpOfouNHAh0tw9mdzf4P9KeYUhA0TlorDhOau
	 HmTeND9wT7aYUxqw4I7k+VlYBnR41nCDANBl8U/5dfg5Afv3SoTlYNvjozCKIKk8dXMfT
	 6pMGr1yEYvGk/9QLBYzhQ0rEUVSc5WLdk4NhrgDTS9a+8nWgBR05o7miTdlNMh56FcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794735206;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=PuczV2jozFUeyJsXtX8bgTt59XDEa5cGyADBIgej+KE=;
	b=G0drldfiO2in/yKj9xhm+DETaXkzeeGCIzek4a0BGp3Oo+eelhQYxlxTw0a1vjJKRzdE
	 YMTC03dRvTshoXCkRbNb6KRePjSHOgQxT6OuT/AiIGB57fThB+ycRGY5c2q83+VNKcVOl
	 djTMMRBVRZrt8toKWOy4dUuH8Ypn+pKvC7QTm7N7duMDsgq0NpwkSCsG32o7mjQEl27K7
	 NxsfdaTZuEnOwiiUJKgKrTAJlPnU+ZYNTj+yr81580MrHc/tkuGvdaBaLRG632F3r/NvT
	 jQZkmZWEPvr3voGu4zWLIVX9KjWpJt/FT74n/VfZDHX9yw9736k051b2mM05bQgAqcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PEj59C2r;
	arc=none smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF68A606A8BD
	for <dmaengine@vger.kernel.org>; Sun, 15 Nov 2026 09:33:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF68A606A8BD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PEj59C2r
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-703be215729so783909eaf.1
        for <dmaengine@vger.kernel.org>; Sun, 15 Nov 2026 01:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794735205; x=1795340005; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PuczV2jozFUeyJsXtX8bgTt59XDEa5cGyADBIgej+KE=;
        b=PEj59C2rYSl+quIcKTy9dV9+5SuhTpvAT2KDDAuzgsQBLvmnNlEET4u5uAC76Sf1Zy
         3/4PovDy8uKhKxBxSv/cVQ9f0/SN5gyLl4odEOi0edPTRaX4ELapu9bk6C5dHaBvrWmK
         1GVI2tHz0bvRCmFCFu1EhCeB0qJqsoCXnYOURXflf5yMk/7A4WNZrmSVgghBKzN6QTOe
         sknbs2Rk157BMvySDqe1jemIz1GfnoPBt7Un3s7sIcrH/b8aMVoUiL6gkKRHNnTXAb3z
         HjnpREoNDWwbPivwwr0bSzHqnpV30LT+sEcZCCUVnnZD6nsaPu0TMDI9rR8n3t6oFshk
         bgZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794735205; x=1795340005;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PuczV2jozFUeyJsXtX8bgTt59XDEa5cGyADBIgej+KE=;
        b=M684tbMn36MWwTpTuuB7U9qQy8VodSJI2JOYy0qNk9g4Waeu/IaSpe2L51/mVoqWwk
         EzeqXrg4MS/oN8aqijYy4z4CUNzRBYRaMMr00wK5Fio5xDfaa6FQF1CYOV7L1mMmwTtk
         aAopii8tXm5t5UiVyi0SXiHArYWTKQLPTerT7sGWF7ieUuxsRF5Kfe09OL7xklHyO6uI
         0miepmbCI8xVnYJAg7s1tHYBR+kiROWNDu13MQDClleQPYtwLW4iqAfIfc4JNT4fBxG7
         47lb5DDGGIc1b+4qTHJk0MvnmHfylhSmT8Dshu57DgvopiDzKhAaVJaLXJhhR8V6dxQi
         gXew==
X-Forwarded-Encrypted: i=1; AL+hErEecXelqRqCCbrDb1qNavVViEl9odnRBfycH0SQwdoPnTR9oMlRTI8OXTLnqW0dwPsaMuncg2oiH8o=@vger.kernel.org
X-Gm-Message-State: APuU4Z9S7P2dGlGkRlifnp96Q5+lNnlgjugJ3sPds1Dx+wpTKgiVzpAz
	blJaLtgUZTOr7P7DNbWAs+QEiAprx1eUsVyjpXa2PuXqrHajN5L5CIbD
X-Gm-Gg: AYBFou3+8aWP8bFoHhxyjwirPwE+uCRsowGWJoAFOq81RTqLf5QrUADnbZOsh6YWAVr
	KszBlhT9IQIe/HKibUyV4uTqj7qCz9RLfIqGRm6kPQKfseTM2duVuBdVkc4bVz/ItOyB2Vm/8l+
	r3xpnJyO1xnPWuiVCBDJrhki3Snk1RhBoY68tsDXeZv8p0GEgcuO2x1mUpPAL/So3YlWMofgoGc
	cYjLJz75FikiRLlzrXBFUxionSZ81YJKLPQ4Didpt8xsI0vhTR/KGgXB7N6L6tDI66f3eezqvwd
	MRbRbG0fmjTPQeG+fWYaoye2ozghgtgb1XG+40NQbxb9Dkv+vLOCOvGDAReSDmQvQdPUHn1NNoY
	NDTCU676zf5fyG9H+u1a3tcl/UeVSZxBt2JdrvMkt0oMdFsuX5BebrhpJWXxY+YNisJHUvv76fa
	jscoPovJEGwevSJAxl+85gFIdgznaA8bovEU+DVMXh4g0wJxL5KEC4Afog10yNMXtjt/GWIOWw2
	vOXK0BdzI8GYkBWSp2I0412KbVR94abO47gvMnQYU2rzXxHjsSLfryH1oEFbIXLkJlqd6B71hVM
	dQZ4kNQRzyX40xpipSS3+ih8wwwFM4qZNsWoXr9HJW4udLg36pFYgV3iHZjIyc/+SZdh4J/vRfj
	t2EEYOxuAKNIwgSUOpPcmi28Azqalf0GYiP0iBWjp0ndm27bRoUGKyPZSpQI+EtFjSe0McVoCHk
	Vr7d467SfYsC7qhIN3BnR+WKvp4AfqQJilxjt3/Pg84jK/G1ji2fA=
X-Received: by 2002:a05:6820:5604:20b0:716:c2df:d9a2 with SMTP id 006d021491bc7-71ab505077cmr2942230eaf.44.1794735204957;
        Sun, 15 Nov 2026 01:33:24 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab43347b9sm5933617eaf.12.2026.11.15.01.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:33:24 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 02:32:57 -0700
Subject: [PATCH v4 9/9] dmaengine: sun6i: keep cyclic state with the
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
Message-Id: <20261115-submit-sun6i-dma-lifetime-next-v1-v4-9-043cd476a45f@gmail.com>
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 8f8443e14719..7316631545c3 100644
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
 
@@ -509,7 +509,7 @@ static int sun6i_dma_start_desc(struct sun6i_vchan *vchan)
 			     (DMA_IRQ_HALF | DMA_IRQ_PKG | DMA_IRQ_QUEUE) <<
 			     (irq_offset * DMA_IRQ_CHAN_WIDTH));
 
-	vchan->irq_type = vchan->cyclic ? DMA_IRQ_PKG : DMA_IRQ_QUEUE;
+	vchan->irq_type = pchan->desc->cyclic ? DMA_IRQ_PKG : DMA_IRQ_QUEUE;
 
 	irq_val = sun6i_read_irq_en(sdev, irq_reg);
 	irq_val &= ~((DMA_IRQ_HALF | DMA_IRQ_PKG | DMA_IRQ_QUEUE) <<
@@ -612,7 +612,7 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 			desc = pchan->desc;
 			if (vchan && desc && (status & vchan->irq_type)) {
 				spin_lock(&vchan->vc.lock);
-				if (vchan->cyclic) {
+				if (desc->cyclic) {
 					vchan_cyclic_callback(&desc->vd);
 				} else {
 					/* Completion transfers ownership to virt-dma. */
@@ -913,7 +913,7 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_cyclic(
 
 	prev->p_lli_next = txd->p_lli;		/* cyclic list */
 
-	vchan->cyclic = true;
+	txd->cyclic = true;
 
 	return vchan_tx_prep(&vchan->vc, &txd->vd, flags);
 
@@ -1003,13 +1003,12 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
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

