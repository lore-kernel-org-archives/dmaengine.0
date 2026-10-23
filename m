Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792798727;
	b=kLcxqQ6EVzmhMYnT2WLIXqmPrwE656VdzYy9NJaRVNdSZ9sUg+wD5eQUV7VnNFq1beQ8
	 FNEXqRxZ/oHI7V8Rfub37FD7DSOkhcA+1s2EClB92cb2Upf/E0Qsjq330BD6lWaj1S620
	 3AGRzOZG402i7r2MtYJPMsVPrwdi7/Nt9lwNet4Bv1iJtX+CVdHh943IgnDxSI3Z2Ckrc
	 kfq/dAaVTup5/6TQ2srdtuOb5mhPY1yRMay9U4cw73Ntdbqo3J7G7tD7Kh+hLGEEyCP/I
	 TGaen18BQfbLxIyWm/P1ukpOGaI79pZtE3UWlGuBYyDV66MgdB9pkyKikddByy/plKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792798727;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=R5FazDKhThxOYInKBUow6UStlAet68U4bSmH8n3hkL8=;
	b=dDNb2iUWwFXhyVGOs7wTf298lpFijRvwwQcz61yagu+GIwum5yFJasYuvQUEMaTqHMc8
	 oL2a/gsolSBThZqxBfvIyXpgYSnsPM8vsnN3kbvF9XNyJ0Fr2krrLujimUqhWCdgsYJQG
	 05CIJIJvW8yg4ZleO4qomwXiKVKTO+/UOv/NW6jWK0n3FjDGHcxDnfhOPNbev4ue4sr5M
	 ZQafBId3J2TZjsXcTA5JNl0zMzO0Ui/IOwzjUeyTtRB8fI5oWF4dPTbd863v3zphLFBF5
	 oc6wW5nTGVAZqP5cjjvPpNt8ubW8CD3nTzxlF2mDjVrSAxqTQpX8uqQHcZcp1J0Qlvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=R0ReTaKq;
	arc=none smtp.remote-ip=209.85.160.42
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E807360A2626
	for <dmaengine@vger.kernel.org>; Fri, 23 Oct 2026 23:38:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E807360A2626
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=R0ReTaKq
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-4a75171af39so512254fac.2
        for <dmaengine@vger.kernel.org>; Fri, 23 Oct 2026 16:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792798726; x=1793403526; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R5FazDKhThxOYInKBUow6UStlAet68U4bSmH8n3hkL8=;
        b=R0ReTaKqekUuwEi+6yW5GTyiGAtsWaZu8oip2H2koa+c75HwnNpL8Ki87k9vxe98NN
         FyczHtfniscTlImnh6cs7MIyxIllCLXtHwEXHU4BDz3X1voHx8pxfl5w3FcspoNEsAar
         TvV0O1y3Zzpy8kSXMVC3gMIrF3aDeIZlk4eLfvy9mtXVx2qrFjgZGtLOvnxpcTLQ8PhO
         IkMb6FELV3XWkLQlKLVGJ8jHraWSroU8vR/6YOTFJAaTa1/zTSbOG+glYzgGvdcQhFws
         CQmRzPj1gud+Ev7KIl0yxRfT7w5YChxhS+XYgsp2N9l9mQiOiHReIF/s2AytgFKBGjGw
         GE0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792798726; x=1793403526;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R5FazDKhThxOYInKBUow6UStlAet68U4bSmH8n3hkL8=;
        b=uk3CpMqIRoDjPSdLbPqUxWasxfxt6USKLrPukpSGezOPuGmjTJ+Mh3LIzfREHAXP49
         bUctcfWiyrPFLhS3uTHDYiwx9SW/colMqDVWbMEh7PyJH7kJT8+n9nYoNwJltLiXCUmB
         HKctos+uk/Opm4qm7LVsk/jKiMMXxALrUYazN1ZKuhmLSSyqFRQgAWPfd9x4jMFL0n2L
         u2sBhDtWu9J4HrlmrKa36LrlZ/xrTZrEiIWmcvuoAA5aCEsq4H7kkb2dUSX/2DKRDp+7
         Yh8K5TLKvEPCeKtzrKjQCU+Yu0tPfyff8MQ9Q85SWxlPAPNqd/cZflVXc7V3UFddCcTq
         ZLDg==
X-Forwarded-Encrypted: i=1; AKwUvBzu0shOqTS1+K2GNm2tSztOHAek+r9kgOfc8lZVfRev86ro9Ezk97MkIDzUSEjddTWA57ShQ0bZHTA=@vger.kernel.org
X-Gm-Message-State: AFq9FYL1Mdok5KuqCrjvUmfeEG/1VlNAtAM5Lkea/Egr8SVzZgKIu0hS
	ieaA+vHMZ2fWP4SZ8iSC7gdSgoRvsVUcQpWWcLkEM0JVcgvS0McQAFFl
X-Gm-Gg: AYBFou3F3qKtvNUPLpzXmxQyYP2APaWzwOEEQhFcekNswlrULavOw8HPzeZDTdoLZup
	Kw3LDYCYihRRCQrFQ9yHasirsQU51/gthNoBz5Ns7o+9IDHXIcAeRYAra+yM0x+JTEO8NY96JCg
	jn75V8aaN4GAA09N6/CvmPv41/GzqyGbLP2Xdg3DERrKlYy9eu++TgMJIB+uZeu3jEQz70bAWPk
	e22DW8OzQ7FZoJHG1N+F5yF8I765DstRXM6Sa2aPanrrvdrcLhhOlDaVBUM8e4yq+avseutIT0S
	QWdJNDBgUraj3chH4tAIx3aQLKoy5JXxbjgKxGwv7QZfOJAUhT+HoKJh8x8c/3J6VPv2FfSNKoG
	nOgRZVTi9E3aPSG5EfSEC31aTOsyHhhoAAggeFZNa7q2RweI7N5j51u09b9yEoVSOpOEGiPMyga
	6s3CqhKtScboFS+aYw968+CTdoIZLFmLmWxGeLFsvl/q4P2Zq53y+AKeXH2gG4tmzZLoBhzZ8xd
	hQBsT2OhO5o+9r8bUHbouPvhJ8gY3LjjcvSComBV182cPRfn7fifNrcdoTDnty6bReq2NZHYkvU
	SNDXv6P7nJPDb5kgfSi725TLPns6xdIfZYnNSaKW1ibcOKOQn+hXVF2fxtCAr69e4Ow5LpVzkLO
	CYzeiSfJ1W2jvHCghwVoePxueL3P1b8uwilVSuXA+db8q7BMaIj58222H/tXpTMl/65bUeFKRl2
	R9Gy0=
X-Received: by 2002:a05:6870:8322:b0:4a7:5eb7:ab9c with SMTP id 586e51a60fabf-4a83f58e567mr601234fac.28.1792798725802;
        Fri, 23 Oct 2026 16:38:45 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a843225d69sm284345fac.15.2026.10.23.16.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:38:45 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 17:38:28 -0600
Subject: [PATCH v3 9/9] dmaengine: sun6i: keep cyclic state with the
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
Message-Id: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-9-ef1acb0be768@gmail.com>
References: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-0-ef1acb0be768@gmail.com>
In-Reply-To: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-0-ef1acb0be768@gmail.com>
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
index b83138745bd1..2152979f72f2 100644
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
 
@@ -507,7 +507,7 @@ static int sun6i_dma_start_desc(struct sun6i_vchan *vchan)
 			     (DMA_IRQ_HALF | DMA_IRQ_PKG | DMA_IRQ_QUEUE) <<
 			     (irq_offset * DMA_IRQ_CHAN_WIDTH));
 
-	vchan->irq_type = vchan->cyclic ? DMA_IRQ_PKG : DMA_IRQ_QUEUE;
+	vchan->irq_type = pchan->desc->cyclic ? DMA_IRQ_PKG : DMA_IRQ_QUEUE;
 
 	irq_val = sun6i_read_irq_en(sdev, irq_reg);
 	irq_val &= ~((DMA_IRQ_HALF | DMA_IRQ_PKG | DMA_IRQ_QUEUE) <<
@@ -610,7 +610,7 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 			desc = pchan->desc;
 			if (vchan && desc && (status & vchan->irq_type)) {
 				spin_lock(&vchan->vc.lock);
-				if (vchan->cyclic) {
+				if (desc->cyclic) {
 					vchan_cyclic_callback(&desc->vd);
 				} else {
 					/* Completion transfers ownership to virt-dma. */
@@ -911,7 +911,7 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_cyclic(
 
 	prev->p_lli_next = txd->p_lli;		/* cyclic list */
 
-	vchan->cyclic = true;
+	txd->cyclic = true;
 
 	return vchan_tx_prep(&vchan->vc, &txd->vd, flags);
 
@@ -1000,13 +1000,12 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
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

