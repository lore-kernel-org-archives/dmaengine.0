Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792798720;
	b=o+Te4A9eSkDUdKUryOMNVxI3j71iIc/dSuwPSHU+PoB5rT/ntgwJVqgX6zlS4rfokl+y
	 ciHRkceX0W82bZ+sQIm7QdJJ8UXAfBiScf9MiwdzEeeioANpWSPvY7lf677V9F71iqEOa
	 E/34XKC7rwtHVel/zkz0kBBnewd31mToFwcrKHHx1Z2aSVEUMWvdp3paqaIWIi9Tk/d69
	 5QcVAyp9/NWjqiJVV13mJ3TK3RGh/fbqShdq5EnjpqI9qd1GDxXCdBxU4pjKs1BTYLulz
	 FYzLU5n4yerSLbn/nXSXdKsUcFhcQB6WPbu6aItLCif8zBXq61mzFMXyAWU1QARcFXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792798720;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=vk26c3BTQSmOJJ6zClJ284dH3SqVTC5An1nrNJrjOFw=;
	b=x8E3wy0vQS//ctAoYDxpGqv7P0daSmPECLuUtWwg4xpPOPLAqe17DjfGmY3+710U98PE
	 Mt2ToJFVbB+NczZXR/PH7olA0SCwPP2weKtTGlRPHiIzAjesiOIjgge4WV8TS30khA40N
	 0suuIgqIfMOeTg4S76CGifYfuLLd3O/adZ5QD7EMqsF8Z0iLOycv8QaGtyvHq9OgvtGkF
	 by84xl2s6v4SDT3t8sFwr+K4K1VPnkyRc+juVAIhrMcp1yWBu6Lp/QAMqhBBhYu30Da11
	 +IpwdRdFgH4Kg8IBzlqKWKgIlfqIbWt503NQWJv6ccu4jaqAXGxuAKeSIy7cpOu/EOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Rua0rHHO;
	arc=none smtp.remote-ip=209.85.167.169
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7678360A260A
	for <dmaengine@vger.kernel.org>; Fri, 23 Oct 2026 23:38:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7678360A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Rua0rHHO
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-53a448f86e0so795514b6e.1
        for <dmaengine@vger.kernel.org>; Fri, 23 Oct 2026 16:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792798719; x=1793403519; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vk26c3BTQSmOJJ6zClJ284dH3SqVTC5An1nrNJrjOFw=;
        b=Rua0rHHO2a3kcD8ZA4Tsh0WbhveH41g4Xi+/C93f4hEgEg7G5EUy6PhffHnkWI4v/I
         KJb+m7CUycfvMTlH2lbN4zIwd4qyfg4eTl2aJ9PJU6JqtxSH8rSIGNZKdL1fpbCe441S
         4jFAewl/nCJXSCl11RxFDnjvtKNtRhIlz9dJnkANrQ9nyCz1lW9HaJ4RtYAUhwLcWsdS
         fJKRjBgEzUUzYQNMe99dwpWkc3EwEVdgYq0ADVckG1f3y+eCRs/L+Di36nVjF2xGtaXz
         3MRKqh+pgYijC/kEneIbh1qE6vQGQgZsfMM+aJfuR6cCBHtc+R1tad9JSm4yBKhCDOV4
         k0CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792798719; x=1793403519;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vk26c3BTQSmOJJ6zClJ284dH3SqVTC5An1nrNJrjOFw=;
        b=pW4m6HNIIumz1bb9+8Gb11To+/ail6lJz4opwVgsH/jxuvNzuTYbhwjKAX0quyylIK
         mmADtrQgZW3cSus5nWlQM4KhRgtSQRhijdcin/7veYIhZqO6FTEIrt0pokt81syklxIU
         Vbhtff+VlAoq1N3UfrSD67l0zcBUDr1CkUrvPmuyYYxMb0m6+P9jq1WqT88NTxh/tbYe
         JWDsRr8gq6psVIN+uK0bAQqFui/h/Da+XGgpQ2Kd5CvidqQjanJTR3MTcLfL4OiGoBwz
         KQ/drkPo/s6CHnmcXuy57+npICzqPI+r9uh6rN5hO07NkH8PdDEB+xFge+qKoy2aV/ap
         bMCg==
X-Forwarded-Encrypted: i=1; AKwUvBwB8z9xErFg4jj0+w8mxh6wkvE7YQmI6pH7sWv244c/gJCZIaQGzMtk2KZ/VPPxXRkHtWMaIKycz2A=@vger.kernel.org
X-Gm-Message-State: AFq9FYLHrAKWuSuqiHMAksqRoAUxjB9k4bVVbA/22c0jwEWth37zmijW
	zSzoBM/YaA77rjnISk3J7AMJPU0VrNwTMct5LgroqZRN1TAZOLY8lPM+Y5UZbTVO
X-Gm-Gg: AYBFou3BHx6Ax8OMsKik4BdjxAs7ndtNtF3Sf2M1sJkYLwiM7XCBb8vJCH/PWrKrxy9
	ol6E+fTQ0ONCHDnQwk9RCI4rdW5J6Lsxl0C/gqci6AJfVLkeSVolU7dijfVATu5bSw4S6a4v7pk
	VJBc+XaHpqfrOMJPnHYeYLCyJVMIeNtXjbi2HMHj8GaJn1YOPw/+/iYRn7vJZ+kNU0uZDKji8M5
	47PfQADksSZ6H9xsrTr2hB89EbvROGfL1yyx7rU4LtRPBejDMYTqVygkgVeq2LPHgwl4Y5wXGwJ
	T2CFERmykwmE0BugDwtjHJ6oKc0np+1B2vRVBysjBdfHwcIxcJCNM9DJ42OsSG3n2snFeJCEwNx
	aWujj4RQiN4AxiU0uT4/8Z46tC0PlSnUefNqa6G1gzHnAb07dpO+dLvBD2/LMp+B9+HP/+8zyAZ
	MMeBTH/zoDM4J9AbxcYownBk3BdoKyrdXNJwPbgQHXWD2jhDjDUEig7aNDfPD9oWUJ1PqpJmPEX
	BXDdT1VaHKutiMxLE0RlZ61KJOlRey1WvOj2ftMC73algDvtQLN3TGp7OKL0c5pMK5uEK5ph4nA
	o4Su0Q8CEJHrgnRrysGlWFMgRYBdldfMYj9zYSb5aAhKpPzN2PYIDvukzkqJsxU9jtIDhiZ8IFA
	9GOSpTk5cqcwVeabPjpPIbnce2AgLWjnuPJwQ2sbdNGdxuf9NUT6OX01gfFVa3dOQhnAGhJN84Q
	Bfiv6UaF37L03IhLoTzvmt0XFU
X-Received: by 2002:a05:6808:538b:b0:4d7:2721:cfb0 with SMTP id 5614622812f47-55c002e295emr491276b6e.31.1792798719329;
        Fri, 23 Oct 2026 16:38:39 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a843225d69sm284345fac.15.2026.10.23.16.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:38:38 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 17:38:24 -0600
Subject: [PATCH v3 5/9] dmaengine: sun6i: detach completed descriptors
 before invoking callbacks
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
Message-Id: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-5-ef1acb0be768@gmail.com>
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

Finite completion publishes a descriptor to virt-dma but leaves pchan->desc
pointing to it until the allocator runs. The virtual-channel tasklet may
free that descriptor first. A residue query for another incomplete cookie
can still pass the retired descriptor to sun6i_get_chan_size().

Clear the active descriptor pointer before publishing completion. An
assigned physical channel without a descriptor is ready for the allocator
to start its next transfer or release it. Use that state in place of the
completed-descriptor pointer, so residue queries and termination only
consult descriptors still owned by the physical channel.

Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index d3a63c866645..900bb629ba3b 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -198,7 +198,6 @@ struct sun6i_pchan {
 	void __iomem		*base;
 	struct sun6i_vchan	*vchan;
 	struct sun6i_desc	*desc;
-	struct sun6i_desc	*done;
 };
 
 struct sun6i_vchan {
@@ -490,16 +489,12 @@ static int sun6i_dma_start_desc(struct sun6i_vchan *vchan)
 	if (!pchan)
 		return -EAGAIN;
 
-	if (!desc) {
-		pchan->desc = NULL;
-		pchan->done = NULL;
+	if (!desc)
 		return -EAGAIN;
-	}
 
 	list_del(&desc->node);
 
 	pchan->desc = to_sun6i_desc(&desc->tx);
-	pchan->done = NULL;
 
 	sun6i_dma_dump_lli(vchan, pchan->desc->v_lli, pchan->desc->p_lli);
 
@@ -536,7 +531,7 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
 
 		pchan = vchan->phy;
 
-		if (pchan && pchan->done) {
+		if (pchan && !pchan->desc) {
 			if (sun6i_dma_start_desc(vchan)) {
 				/*
 				 * No current txd associated with this channel
@@ -582,6 +577,7 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 	u32 channels_per_reg = sdev->cfg->num_channels_per_reg;
 	struct sun6i_vchan *vchan;
 	struct sun6i_pchan *pchan;
+	struct sun6i_desc *desc;
 	unsigned long flags;
 	int i, j, ret = IRQ_NONE;
 	u32 status;
@@ -601,13 +597,15 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 		     i * channels_per_reg + j < sdev->num_pchans; j++) {
 			pchan = sdev->pchans + i * channels_per_reg + j;
 			vchan = pchan->vchan;
-			if (vchan && (status & vchan->irq_type)) {
+			desc = pchan->desc;
+			if (vchan && desc && (status & vchan->irq_type)) {
 				spin_lock(&vchan->vc.lock);
 				if (vchan->cyclic) {
-					vchan_cyclic_callback(&pchan->desc->vd);
+					vchan_cyclic_callback(&desc->vd);
 				} else {
-					vchan_cookie_complete(&pchan->desc->vd);
-					pchan->done = pchan->desc;
+					/* Completion transfers ownership to virt-dma. */
+					pchan->desc = NULL;
+					vchan_cookie_complete(&desc->vd);
 				}
 				spin_unlock(&vchan->vc.lock);
 			}
@@ -983,7 +981,7 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 	pchan = vchan->phy;
 	list_del_init(&vchan->node);
 
-	if (pchan && pchan->desc && pchan->desc != pchan->done) {
+	if (pchan && pchan->desc) {
 		struct virt_dma_desc *vd = &pchan->desc->vd;
 
 		vchan_terminate_vdesc(vd);
@@ -999,7 +997,6 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 		vchan->phy = NULL;
 		pchan->vchan = NULL;
 		pchan->desc = NULL;
-		pchan->done = NULL;
 	}
 
 	spin_unlock(&vchan->vc.lock);

-- 
2.53.0

