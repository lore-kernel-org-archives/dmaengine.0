Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794735204;
	b=LK3h/zZzhzQF/O1buZ2Y2nSGY6/QAGDnltdBrWkKPzKs3ZYlb9iNY4c0tqcYNEUqdKdy
	 ECviu0+41ptJPVnRofRR0azcB/aRUConqgiDDPtbBjMjknXni2kSkA7+HYDiBeSiVboTy
	 Tcip0d3ML2/neyU3W0PKfGFRJZKvI/j0v/vRWtl4bbJ032umDtk+W6uLwcwQt2FKmIWOb
	 wQlaI7/TqQYEy6cF24baC2Cw3AXO3t4C71f+XbxJfBVACu8i8/q8pb2+c87fpRx+l99TP
	 h0iI8bWr4gkFLVl5zh509YI040GqdNLQr/SiG5eidOmBI/jJu+xJU+A6udSabMjkvCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794735204;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=lLq7Tf1B3BpSLBANTG+leF3RFU5GTaZTVgWe2BOgm6s=;
	b=C+DWEOit33TibHaXvz2e4N6gKQ73rjmyHhrDPx08AO4boAVfcBo1nednT/MBiLKf8RNA
	 l97MieN9XO1455UTtooM0vQ1FWcFiwvVwmKwU3UEt1tzHUONpbxM7T+s8RSWITWa2137M
	 DjKRL77yDZPrwcqAVn0B26o1uQWmTAuL3oaBWW/KjbWg+mfXwriUMTbrbzEpLVzFQNUqq
	 6Wpdc+lnmgsFCbOq9Fc8G+k2+UoA61H105g40N2ND8dLnkKFSceWOWINXhXPxeF274Jl2
	 T+OLakGjfu0HUfgyq99e3axsF4ZxdINyzvUY8QTIlJuuGZLCm721NIoDZnz8xSDMn/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IpyWNPZd;
	arc=none smtp.remote-ip=209.85.161.46
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E821606A8B2
	for <dmaengine@vger.kernel.org>; Sun, 15 Nov 2026 09:33:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E821606A8B2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IpyWNPZd
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6d290b10a35so879561eaf.2
        for <dmaengine@vger.kernel.org>; Sun, 15 Nov 2026 01:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794735203; x=1795340003; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lLq7Tf1B3BpSLBANTG+leF3RFU5GTaZTVgWe2BOgm6s=;
        b=IpyWNPZdqceAlFctVKztCOgO9NxIIZRdBOkA02Ciwd1vmjP2LCTInxAT6oE+bLK+e0
         njTA6+b58A+09rZGrffxmzxqSPADp939jLPkQpLwCATgiZExRrsJXk7qxSmV3dMoJByo
         n9swLTzD76yJW1uaP4jAOfqSjy5kLy2edvBsSFG52H4J1x0baNbPKpXJrcouwacMYFTe
         FUwhVYcSUdgnFBtDfwpJO6sY2GGL8wn0A1skz1lS6PiXMW/KA8K3J9Ux1923y9SG7yQ5
         /OOfNLkLrIxArqjkmT9wLNZzmuNvGQkSF+7XtMYklArZbsmDHfxDe461+X3FF6y0lWqa
         /2kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794735203; x=1795340003;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lLq7Tf1B3BpSLBANTG+leF3RFU5GTaZTVgWe2BOgm6s=;
        b=LfcKGikugu3i1zzDNo8N3pFTdwOePlJK+y0r1zoJhRrbTfdfqkR5b0wE+dunL4Qd+q
         7eBeVoUz29g9G4WSMYqUkhwagmW5BIlGLhaFktvd+DQk34pk3KqyHMlzk6TVlcrl+sH5
         FNckvxnGIew+NlPZOSn+f455RM9Eow4EAD3rMo3cPq6ltBYC4qkgtvnxtuNl+0P/LgdZ
         Z26IlHDZrg2HGim1XvSvfOGOvrnKVJe3CDfUWoG8xPXmDxejJ237z7dWzOgJkj4Jatf4
         k9HEpbfCgkXxVUP3aqZmkNfGZWPgwyFjzKzlVIYnBwsK20rTvIDAtbWa89MSiXlffwTc
         jIOg==
X-Forwarded-Encrypted: i=1; AL+hErEj/wnmLgqREfGuaQhOrpJ7Nt4xJCnvxRZCYUUJGhZjsxBWxgZ9VPR2xdIQ9+b3k3EbFTWMJ4rV3XE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9XmY/YpVzPB8Fvvi8oiOLXzPPxFgA9VWh2zJcqAl5MyLkmnKRB
	d79D/dWtjdLQkB5VSPcgEo/DITskoamOvliH7VYLSLPVFxggXUgX8qCXnQGoBg==
X-Gm-Gg: AYBFou2dyLJ6Qr4xozBTyqvKQJXQizywEu+Biob0XrdVdKLEspjmkPhRb1cfJKw1C06
	60Y3IoScCnnJO9Guznm0cpuRKTef8pyemfm/B5I1NjKm0j3iybriNqD/6zDEKlsR2JL2USlX6er
	aGgunaS/PwEpqTWerypyckG64VRHSV35ta15aeMd5Qi2xP/0VVJWUoppwLqNQ5koWDTPOXuLPyP
	NRgs9uoHR/wMXvyFksBqIa502C+3QJQmUb8VRt7eYs6y54x/J7+lONKMBC4GtB71XwqO1DMucAM
	+NTbAvKgN/hpVhkFIPrORbFg5/d08fTi2CJJ1svB91pj4d1LNUEQcRLqn7EI0GR7VkDTQHAMlyJ
	nbQfhVaAxpdioBnGscq1XsT8n3447gtUYjxNoWgpCEPoNil1ZDzrJGdDHlQlU7MZ11GUT2Wc1jK
	zkdXDEvZTUuaWm/eIPLLnafgKNQzKTGKC+Ngpxh9eWUmJfrufL9e4RsZ6BQbmvhDfMTHGQY9HN6
	rwwzVDXq2ZvfmShvuoB5vNFlwR3WsEQEPV3SJtz3HApaq9YSsxtltz9XyAE7UUSqhPSDSeh7a+X
	DaBXbvivCk+7nSK9M9SOJKRmVB2g8CVQ4aPUHD1X50vFFmVXgsF2goQtBvgrLODnno2xH92ukr6
	MTDV4eKYdTZHmPkE07WbeW9DyvzImbCQ9WcV/eUqeFPPXqikgWJhdn9Tiv4XZmwPheWKdZFeGDz
	rzgYQeU5E5HJx69p6G6PJh27DpIGtyJ+zY0eU3w3q9nERUkMZ0iH0=
X-Received: by 2002:a05:6820:3416:10b0:6cd:3ffc:64d7 with SMTP id 006d021491bc7-71ab51acb62mr2760644eaf.82.1794735203521;
        Sun, 15 Nov 2026 01:33:23 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab43347b9sm5933617eaf.12.2026.11.15.01.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:33:23 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 02:32:56 -0700
Subject: [PATCH v4 8/9] dmaengine: sun6i: synchronize callbacks before
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
Message-Id: <20261115-submit-sun6i-dma-lifetime-next-v1-v4-8-043cd476a45f@gmail.com>
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 14f1f463005e..8f8443e14719 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -1002,12 +1002,20 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
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
@@ -1105,14 +1113,10 @@ static void sun6i_dma_issue_pending(struct dma_chan *chan)
 
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
 
@@ -1485,6 +1489,7 @@ static int sun6i_dma_probe(struct platform_device *pdev)
 	sdc->slave.device_pause			= sun6i_dma_pause;
 	sdc->slave.device_resume		= sun6i_dma_resume;
 	sdc->slave.device_terminate_all		= sun6i_dma_terminate_all;
+	sdc->slave.device_synchronize		= vchan_dma_synchronize;
 	sdc->slave.src_addr_widths		= sdc->cfg->src_addr_widths;
 	sdc->slave.dst_addr_widths		= sdc->cfg->dst_addr_widths;
 	sdc->slave.directions			= BIT(DMA_DEV_TO_MEM) |

-- 
2.53.0

