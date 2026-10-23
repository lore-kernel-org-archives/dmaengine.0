Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792798726;
	b=fU04h+m4VVx8dwbCcb5po+vIguUBYOKGTK9q1QyH2NqF+HU6VoLMJYj14CFWbv+Y3Q2t
	 wqHvkREnsqFGjosrFNRiOhiGjHUhi8RN3HegEWWR7kWcpdfRPfv2GRAruF9BywXIkNWn0
	 VKo1EIEP+sycMFti7hCHdhf+sIDAIYrQ7ssNEeZlVV6RsRxNozcwK1I1ynnMUznfGfsjf
	 St+ghkTR3co7uxt1GHSdkv5Dr21BLo0KpGCQcHLKmbAaClE2FgeN+8THlTZx2PVQzSXZk
	 1LMIxNJqFI6LW2nwN+J6WBAnnBjCZ86d/fsQPktBu3KwWEy5GD2o84sJ9TMEMDRIV4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792798726;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=yK+VB9i3XnDuZ2aB6oRjlCMBfgt+FvmOgzszXtH8SUQ=;
	b=xBUWCedg7mMrI0p2bsl6u19NR0z7rMm1rs/k76qBve4+NeYhhwHyD+3z6iK6NOCt2vU2
	 /e4sfb+ANskeWtRVuUXAJO5sfqyeUzSLZ4RtFRDLxplvfNKAqlO5tKu5il0Q/gpuNKLWn
	 tWykW+jEJsdVqQzezbRdmPiMWbIVbuhF7f0YmZ75ma2vUCXWEGgNX/dDlnYnvQm6idpC1
	 nvmKFeOI/I2B91iAbZpM/EPqjHYF5RCGXeSHEqIGtkCOLXV27DRAYSyUFSk/ibUVOafpJ
	 C1j4pux+U7vHn/IuXSa9CeiNB1ShsbK9tQ8kv4aYs8J/QVXvS2o07nMkUcTosuGqQ6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="oX/IpkS2";
	arc=none smtp.remote-ip=209.85.161.43
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B9360A2605
	for <dmaengine@vger.kernel.org>; Fri, 23 Oct 2026 23:38:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43B9360A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oX/IpkS2
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6deb848ddd7so997919eaf.0
        for <dmaengine@vger.kernel.org>; Fri, 23 Oct 2026 16:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792798724; x=1793403524; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yK+VB9i3XnDuZ2aB6oRjlCMBfgt+FvmOgzszXtH8SUQ=;
        b=oX/IpkS2mUaZ1JTxGCYrbvDWzWxioQ9ONOBDtMNiu2KP81eHSlHLFSgUK1JWLqmJUL
         9XQi+QVypStBgsdQ9U5t7jSQmaUmSNW7QU3ZlZmGkV/pCsrnH0vwSXKO+NnvTWn3UBHc
         RBQ3OCLDPXDPs80bX9Lr98I8JW9nJpjrH4jXq5Ugk+ksjZyOYRfybZsM6b5xmYM5jaH6
         ZnNMHjtHdiBxQK0eM7jreaEMuZYlRpybI7YykFNyS4ieq62QmBrG4LH7O6Q82MN+YfWS
         +63OaM9+4rhmInUa2uHS3WZk/jaw7eMCNoJfb0lPmi3acnWCw0Ry187BT21AxGZopaQF
         GU/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792798724; x=1793403524;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yK+VB9i3XnDuZ2aB6oRjlCMBfgt+FvmOgzszXtH8SUQ=;
        b=tktp6Gt3jMMqQ1GPfDzbfgF0pNzUmEOWhnvUlRpsacCv1HGHN5yo7LohalAGdrCHD9
         +3MqsSQJVDsIO8bTkeXUvKnr3NzSPN+l1fj8SKkq3Y+Zfxm6zp6xVkqG4EelcpSUy9c7
         U/zgzWvvwBVtKtjn6+APkfGw8e7zYeS2pKEU8J4eedPdgqgxx4P4XwNRDNMVWLxuZQGv
         ttIaxE64AdSNy/ZkKOWCFq2SqwYzLoN+rk9mS6Ju/Xb+gxAH5YjjY9T/BYyRebxs55cz
         38k28MXoeb73F+RTpFo0SadrrFYi/v7VOoAhAci30p6EvKdN+x7w/8Ps70125LAkA/37
         TfZA==
X-Forwarded-Encrypted: i=1; AKwUvByEjXr82C9Md3MiueLDYjYalqD4RoVCZnEBQqI2unX9v3XPCAGjWOrDvRVfw62mUHm2RYo2X2AYvhg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIEftaSKuwVpJ15Sw1BjH793+SaZ24uq622pYsQenKsu6wc2TXI
	xm5gNmARNpWo4/bU1jzS10J2RkgowqGv79IfpnblFk/qyFotV8AYfrqO
X-Gm-Gg: AYBFou2BUegu7zChpPUAEbSrZ3R5YIL/UmHPkfP5OHZidZSoiuKRrY6ANUVKsTm6V7i
	nTkmtm+pgs33CUgCqXZTjLkJg0JFns5E1hvKzH+icoeMmL/guRaPJpcxHZimeVt85BrY4U8JTQD
	tGhYYLKTDq1SKba0jujdLAmjO8y0tupwkyje1dXWtHjBPcdpSGIBl6u3sLCPFKpgrCqT54h0v2r
	obA3fGQRj8BmTabGI3Sn9HIsUjD0SrIMZXiEwfc42zh9rOxuoV18Q2PAOlhfsa6xpEuelnt55Gh
	CB3CaAscFwa9tkHjeR+VUTdjbcxly/K3lIh0+M2aKrFioUWAxuhJbh88H6bAtoS9KxLqSMV9Xrp
	bRlhMObf/Rhc0DMCt7xXfDXjDmq4raQviUQ5NfVy6B4SeITLMnECunon0STox9JSOr2BNwcVI9e
	4BzWp2dtg3ZuBUSHbpGlS2CQSoulng7tL4dW/t4Hvb7R3cnho1hPUbaFIZn8SQOaXaR99ZsU4B+
	RHalyGibhWsS+8dqhk+NOqjjlc4YbFzBlteiHUOhy1y2/aH1JwlEQoaXVpQRMtaM+vaL/2YnnFP
	jO0adPPIgVjtP7vCb6rFbMmvPcgdUpvylwdw4jTdGffND0geKJ1PLJ9pfjTIusFvUaFtop0rXJ3
	/0NI7LkOdRP4D3u9nUqZVS9/v/oDA7c+DbVMS5WAfbVvlMSUkTu/XQSSyNzEGoEGXcOnpZAByV3
	TAg6mF5RMgnFp44QnEhq2hKNRq
X-Received: by 2002:a05:6820:83dc:10b0:709:244b:b4f8 with SMTP id 006d021491bc7-70ba0ebf5f5mr161408eaf.63.1792798724223;
        Fri, 23 Oct 2026 16:38:44 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a843225d69sm284345fac.15.2026.10.23.16.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:38:43 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 17:38:27 -0600
Subject: [PATCH v3 8/9] dmaengine: sun6i: synchronize callbacks before
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
Message-Id: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-8-ef1acb0be768@gmail.com>
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
index 25987f550707..b83138745bd1 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -999,12 +999,20 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
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
@@ -1103,14 +1111,10 @@ static void sun6i_dma_issue_pending(struct dma_chan *chan)
 
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
 
@@ -1483,6 +1487,7 @@ static int sun6i_dma_probe(struct platform_device *pdev)
 	sdc->slave.device_pause			= sun6i_dma_pause;
 	sdc->slave.device_resume		= sun6i_dma_resume;
 	sdc->slave.device_terminate_all		= sun6i_dma_terminate_all;
+	sdc->slave.device_synchronize		= vchan_dma_synchronize;
 	sdc->slave.src_addr_widths		= sdc->cfg->src_addr_widths;
 	sdc->slave.dst_addr_widths		= sdc->cfg->dst_addr_widths;
 	sdc->slave.directions			= BIT(DMA_DEV_TO_MEM) |

-- 
2.53.0

