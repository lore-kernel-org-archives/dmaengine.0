Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792780976;
	b=n0WOpWRR//M/ChXAgnfSNWcbJEtvhFi7iW929pdwoj/l57MLUOARVK5KHAEmf7+3DHkA
	 jpAxMMPCIrjrqzvj1x3B0EzuljNfzmGprTQ71mByfENyDLhf0eDClVhlCfyoQaiwPS6/T
	 9MS6v4HaAsWoRIgN9JkiIQ5DlqpaYwBgjL6qh9atwwbHpD6B5jEB57IaHVRx6E1/g87AP
	 2TZ+tOTnZBYfk3V023AvMBMT7INoBZzae9JYx9GQ9bKyDeWW/pJmYkhokekn/BFElJDil
	 eZ8KWdsNe56Up5DU8A/auN6j/W1Shoc8a0vgqWL6FXGtWEEwz6fmxM2bRIUpAD/3M7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792780976;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=B1IqYW+doNQQMcUHP4l8j+5MQVcguml9gPI+cwHAG8g=;
	b=WtlLFyv6MJVmZYJlKlH6EI3vef7gDhBS+KZ+9GEmcta8u5PFBdPIoi2HoEMXaLQXDtPh
	 4GFBg6B2rwv/WIF7tVthtcpj7jcQe8Lj2JL6q35evSfrrkBHEUYnYcWF5wR5r7eJ4l20+
	 jSfgv8+e6uPRwFKO5XIB2DkrhHtLwDaYciAUfDOGrCLL+1+b866rHDldBBV0V2D6YY+Pc
	 z7qGOLhNHbCm76uXXexU609t1jC4JuHXKn6MuzeqZqkdZk0OsGZI1jN9KGASmqFHcteyp
	 RohtEbGJC4whMTS/92k0CzS6Hu1g1FUkBoTQ4me9w/nYrLQ6j6iw7LNAckYHuD7IhVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=knisfSwf;
	arc=none smtp.remote-ip=209.85.167.179
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087EB606A330
	for <dmaengine@vger.kernel.org>; Fri, 23 Oct 2026 18:42:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 087EB606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=knisfSwf
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-4f55a53898cso557230b6e.3
        for <dmaengine@vger.kernel.org>; Fri, 23 Oct 2026 11:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792780970; x=1793385770; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B1IqYW+doNQQMcUHP4l8j+5MQVcguml9gPI+cwHAG8g=;
        b=knisfSwfxDsnp3oHxTmjHdcfSgAs9YwUwr68Enk70VCy4ct3tRGZaa1NiLFgplBG++
         sAw3zrh3JcpNSnBI4n3ZxZkQORfmAPrJ/u86sXN3hqEqFFsM9Y9BQhliayYO4QHiOIEx
         dA7IrpAaCZv27PG2NWrHKIIgEBxOtfgFW2CuXNyOvhfnedpLntVP5d6cndmc6NrVTKtC
         Ru+3v8/8eFvZ6IGNCTq8k3F/vXf3p1Msfyve1JDQg0VKAYYcdTO5/eMTBovrvVkRg9/7
         fsD1CnVzxSXFYh1c/GcnSIz56rOVxAkv6EDcfEEjFxzu94+oY3yyKwlJ4SicNSZMnMsG
         adLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792780970; x=1793385770;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B1IqYW+doNQQMcUHP4l8j+5MQVcguml9gPI+cwHAG8g=;
        b=DfaU39cUkD11+zutWuWkg/xMEfWC/JeKCs86EuiDW4c7s+eYX0lI640LjU47/LLePW
         b6RI2VmAxy1Gie2AGOMdg8mmSq/gMBlvp49tDpEvRMurPYFlq4K7DCBtwCe8vkCZ7DdW
         to9iYiYAPBV6z1+W5JrRb/U0kltVliKyH4qzFCrhp+meaX1CMfu2D/4VooN4FPLavMsy
         8CtvAwaQxeg+WxbNITwnWSdP1Xz5+5juQpxcbsILtxzmWSS5K6zloAPtirxmktQDGxSa
         V5ytWJkDV/hIqGekz+S+6sKVAFQOkGUlUbEd153vcerufokk9Q3vhtfFW5Orkm+KRYen
         5mYA==
X-Forwarded-Encrypted: i=1; AKwUvBy3GVoNQuZnsy3IdM+zkrIbx/enyOzE+Fp+zx41Uqojg8pd1tSMV1IkEkbDA9PfxqUQwVpXHZyWtNw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzmAO2GvxYz65FwxYoIpb0+4cCkygLNhEVSbQAiWbKQO/LecO9
	/d1sUQo0gcoH4uQ9i+4DeyOaiz1H62SXh9A4M4v/Del44OLRf/tXEwFu
X-Gm-Gg: AYBFou1lZ8xYC6mzwZDpgzTW3SQPXKfNx6TKMIyB3Gq2hYKQk/6p91gfwTim2fshh8D
	ifhfkMXKxPU+ZmeTuUVk7BAwJaZ7Le+nPr6DEYSYZv0fNZb2f25rV5zk65QrHa3XAlhDGBwMV/X
	gaYBxgHMRiPsHv7fwEXN7km8Z5riNLil7r3YUTHuLTxewCZEvbwa97ssFs0Xoj8aQSAyQ4Agznf
	iAsH1plpA+6Ff99umkZYNzMSsXP2X/eFyU3YDatTJBYqNM6RrlwOscd2qL8tbUVm/62Tj0Z4CYh
	Tgpyr4t9Celpdf4Auzak5dfI0u5bVQLWR8SFat3OY+eEAmHPNSfobbje3qFoZTJhI33KI9r+pwc
	whv59LGXAPdkqqKR1yh9hlS3Tj3SWxKffShwdYrE3mD0HqZnq0QXPaI90jaOQo9HvAw3m/Uz2EN
	zeqTqHyVxKNdUZMnnM1Ucy/C7mxspjQszt9CIood6eZ7rrwPLT2fINNx+w12v5lhoX0NynNdEyS
	hHglDpQo8bRO0f/WPJSqB0EYvhaOiACsIPm5u91KS64CFPtbAFpoySD35fjQj0HT7wWSV1lGhrX
	XGInbX63+5rtkppPdHxMnuIH/AkDCLsaK+9HrNr+3RuVvWe0VuB8tKkiO1WmBlNvdqq6GA832mW
	NH2KLzyWLlzrQk+maqvk3QarGZmBQA4sYdxBCICrB4hKTzBW9dsyKWxfnlJVzjVvFo14BC+BEVe
	nnx/k=
X-Received: by 2002:a05:6808:4f6b:b0:4f5:eaac:5173 with SMTP id 5614622812f47-55c002c7d48mr52342b6e.57.1792780969992;
        Fri, 23 Oct 2026 11:42:49 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55bfe199544sm336682b6e.13.2026.10.23.11.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 11:42:49 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 12:42:39 -0600
Subject: [PATCH v2 5/6] dmaengine: sun6i: synchronize callbacks before
 releasing channel resources
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
Message-Id: <20261023-submit-sun6i-dma-lifetime-next-v1-v2-5-c9e07cc44bf8@gmail.com>
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

The driver has no device_synchronize callback. dmaengine_terminate_sync()
therefore returns after stopping the channel without waiting for the
virtual-channel tasklet. That tasklet may already have removed completed
descriptors from the shared list and be executing their callbacks. For
example, serial8250_release_dma() frees the RX buffer and unmaps the TX
buffer immediately after terminate_sync(), while those callbacks can
still access them.

Use vchan_dma_synchronize() for device_synchronize. Channel termination
excludes the interrupt handler and allocator before detaching the channel,
so they cannot schedule another completion for that transfer. Also stop
the channel and synchronize when freeing its resources.

Keep terminated cyclic descriptors on desc_terminated until synchronization
finishes. vchan_complete() may retain that descriptor outside vc.lock.
Ordinary active descriptors have not published a callback and can still be
freed by terminate_all(). This avoids accumulating descriptors on each
8250 partial-RX flush, which uses the atomic termination API.

Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 157746c9423d..c244ef572492 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -996,12 +996,20 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 	if (pchan && pchan->desc) {
 		struct virt_dma_desc *vd = &pchan->desc->vd;
 
-		vchan_terminate_vdesc(vd);
+		/* A cyclic callback may still hold this descriptor outside vc.lock. */
+		if (vchan->cyclic)
+			vchan_terminate_vdesc(vd);
+		else
+			list_add_tail(&vd->node, &head);
 	}
 
 	vchan->cyclic = false;
 	vchan->paused = false;
-	vchan_get_all_descriptors(&vchan->vc, &head);
+	/* Leave terminated cyclic descriptors for the sleepable synchronize. */
+	list_splice_tail_init(&vchan->vc.desc_allocated, &head);
+	list_splice_tail_init(&vchan->vc.desc_submitted, &head);
+	list_splice_tail_init(&vchan->vc.desc_issued, &head);
+	list_splice_tail_init(&vchan->vc.desc_completed, &head);
 
 	if (pchan) {
 		writel(DMA_CHAN_ENABLE_STOP, pchan->base + DMA_CHAN_ENABLE);
@@ -1100,14 +1108,10 @@ static void sun6i_dma_issue_pending(struct dma_chan *chan)
 
 static void sun6i_dma_free_chan_resources(struct dma_chan *chan)
 {
-	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(chan->device);
 	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
-	unsigned long flags;
-
-	spin_lock_irqsave(&sdev->lock, flags);
-	list_del_init(&vchan->node);
-	spin_unlock_irqrestore(&sdev->lock, flags);
 
+	sun6i_dma_terminate_all(chan);
+	vchan_dma_synchronize(chan);
 	vchan_free_chan_resources(&vchan->vc);
 }
 
@@ -1480,6 +1484,7 @@ static int sun6i_dma_probe(struct platform_device *pdev)
 	sdc->slave.device_pause			= sun6i_dma_pause;
 	sdc->slave.device_resume		= sun6i_dma_resume;
 	sdc->slave.device_terminate_all		= sun6i_dma_terminate_all;
+	sdc->slave.device_synchronize		= vchan_dma_synchronize;
 	sdc->slave.src_addr_widths		= sdc->cfg->src_addr_widths;
 	sdc->slave.dst_addr_widths		= sdc->cfg->dst_addr_widths;
 	sdc->slave.directions			= BIT(DMA_DEV_TO_MEM) |

-- 
2.53.0

