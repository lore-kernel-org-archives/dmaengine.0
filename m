Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792725306;
	b=4xzoeD20nObe1qZnsr3l5E5wKm7o1SGMDXHyqgBWV52Ps/RvvR9tTerjKXcrVShlPx6F
	 C6jSxWZzg5qiXvmKhxn7viZagwzaJVatZmGOteYycRmtuV0xcUX7sNHwRrlT9o4oy3drV
	 YpSHSIWRRfgRDPIMICo+WdxK5d9SoWDauB/yCjo0ZHNtg5KeBxTej/4cGASUVYHWOfD9G
	 yAqSv90Vt6Orn8WgNJkY7r/cCHhsZbX9rF6Fh47pmTsn/JS5nfNp5e45PJbpW6DDA2PCU
	 SJjYryrIYCC73w/78cCqlL0ZMHExszqIiGZatAzkc8H5E8d3iM6wsQZHQaLvi37vdkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792725306;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Fx8akCh1b2SJodc1FWp75y3A6YsSjEhFlzNdHqoUtLI=;
	b=4WcNan82cCsFwgUg6a/UgOarF7WE146eJXbpiiuGQCIBqJSbsQzGuGCPDNjYQ17qfL3o
	 4nVGyFHbUkldUrkcztV8Ub7kGZNFc09KckBcYapvKvcgtxyUYXGQkbB0VD+i9D1dbT7d3
	 srUcm1laUTURh1oP6wJLKHxVD1lANVXnnCVrBXMqf1GusdpYz0uXG6P71ndzHido24+T5
	 oD6bClnmrP8Jvt1U5cRvF+2ROIc9cjzJgzSmC/M6csbAKBVYzc50ncNgrP/ikTs0fpW9y
	 FwfVCgbZc0/XcwMCjlH4pl3WGb7A5UDa+fHcKJAzalIi8djTozn8lQwIJdMkMvn6xjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DCh3Kx8k;
	arc=none smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A998606A333
	for <dmaengine@vger.kernel.org>; Fri, 23 Oct 2026 03:15:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A998606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DCh3Kx8k
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-846566246e8so313284a34.1
        for <dmaengine@vger.kernel.org>; Thu, 22 Oct 2026 20:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792725305; x=1793330105; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fx8akCh1b2SJodc1FWp75y3A6YsSjEhFlzNdHqoUtLI=;
        b=DCh3Kx8kAXP9w0efAz0DaTGb5BLYPczn6E58xUYEA2vQi55c6eQJw+AJrIKAyDn9wx
         bmipdJp0p3yLCsDzJT6aTfvl6Qa/uFp09zu8CSBziXPKWPcpHGqqxrYOc6ULZ4MoPAdM
         2IiBiemqBCezqQY0rBGM5zDtDLBUG37XPzq9BQfFU9YveAxs+w7k2GsOg/Abk236TBrG
         elUROuwdK/eqfOtpEdqdsvtid+GVYYlS8z752pML24PokKJeePGJCYoS++dhK48tXDO4
         yYi9EuSlR+MRub2k+7ccjUPw3nA7j7U1EPxeJ5WF6zIUw9v6gsU79vLs1O2bQbwl4viR
         P0/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792725305; x=1793330105;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fx8akCh1b2SJodc1FWp75y3A6YsSjEhFlzNdHqoUtLI=;
        b=187rmcc8MGNHelm1q2imvxRD68XiZ576ArnEiOrar/gAZ5s6lMC2ZZVBSkFy2P0Q0a
         0U2e4B88eglCJ5fJTjX9UWuiK1DzOd0cMrtYyS0zjw+6oE9dT6NJElPCf0xqqdW7e2XX
         oV70koqUMj/oE7puJRrh6AYdF+8n701D6K0Q/bJIqRIdV0f+OGTqXdRfVIYrxrFY7lY3
         ipFtCfiINSvZSR8ewLtZ2H0Vrv4xLuXg4JpVUbfR70BQ4wG59ejCYLhOsYrlfv797o+E
         t5wl65J5Gyp3uHFZC8phNAk7ztuaOlLDjGkOwPgoqvZAxE/lEgJHCzMxnrTr/n5Qcbkb
         N12w==
X-Forwarded-Encrypted: i=1; AKwUvBwVie37KaUJ73rr7lNRZoQ30pLAvQjGLzzS3iztpsxU33fzW+9KPG/EcHOiyc/3BSJgiddZZLs/Kx4=@vger.kernel.org
X-Gm-Message-State: AFq9FYL9YLN8LRv6bTbqLcWcyygNSKXSvyI9fSfW4TVvafbVBdEJ75+5
	IKo5M1s6YOA0zQSnhMLo7a3aT8XDSFARqIqJ/tigNPzXaHMHqDCdgQrT
X-Gm-Gg: AYBFou2wPBDBy4C0TqJkYuf39ONS4nprQ1uzsBQAU6DuATR38vKBIu8NJZ2VJRShevv
	k4MiBDLrWfdn15Wd3kjGoyU3FRNzfw5R+eJktGCl5SfZl5B0x+PSgIW4ZBSOYY//B8OAFwuioUq
	j4zOkSS7uNlt7xQt9OLu+7xuLURtTVZUCclZCpok4RIHFxgVH3B5PSuXNCDubI7FDPuqpxgC0wp
	o4bPh+fXNmGcbuE8tOIfEHvvQxqUzgPuF+FYfpXqPHs7mOI2pliLul8WW4uJ3RRrbEsCdzWmEdm
	gGT/mA04YUfMKFI+OvFhW2/O7P+Xwe5HRKjaOMEjPr/35DB8VyU874mD2jOeL0mlMqyKkeBjeAJ
	uN0MRqhAkhFYYB9JypjxSpfigoTBdb7p5xgXa1WDkwNyYyUYEoBXp5qZ9jPnVTI6Q7otNstPbIS
	6fNrYbPkz3XlW4PA8WU+QIkLRtVFuQeOiRT/5c2M4w8Tq1xujON0jednah4uNVK7bH9xUUASOe8
	lb0p+zQV+pTVB/am4cUYV1QI+nZ0rZoRTE/It0j9RKt7gfhUinQuEtRZjXHq3ADhTSsH8o68Y09
	pYKp6ZaZgN1jzYmz12+lCB3H8ArliJxJyweUVVpDkjHF6YOJgpGewO3UsOKeblbBNLZROUoiTIf
	C/94BdZW2YDstSF/R1ep197zjmbXuQzi/qpezkGlV14Xm8dYx8uIVpZnlDKzxq8VD5Mcd46qO6U
	IpQeA=
X-Received: by 2002:a05:6830:a185:10b0:839:c62a:1661 with SMTP id 46e09a7af769-84e32d0adcdmr1665921a34.7.1792725305092;
        Thu, 22 Oct 2026 20:15:05 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84fbda584d9sm938638a34.13.2026.10.22.20.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 20:15:04 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 22 Oct 2026 21:14:56 -0600
Subject: [PATCH 5/6] dmaengine: sun6i: synchronize callbacks before
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
Message-Id: <20261022-submit-sun6i-dma-lifetime-next-v1-v1-5-01085f684c9f@gmail.com>
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
index 7ac6693a041e..f807d9386939 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -994,12 +994,20 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 	if (pchan && pchan->desc && pchan->desc != pchan->done) {
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
@@ -1099,14 +1107,10 @@ static void sun6i_dma_issue_pending(struct dma_chan *chan)
 
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
 
@@ -1479,6 +1483,7 @@ static int sun6i_dma_probe(struct platform_device *pdev)
 	sdc->slave.device_pause			= sun6i_dma_pause;
 	sdc->slave.device_resume		= sun6i_dma_resume;
 	sdc->slave.device_terminate_all		= sun6i_dma_terminate_all;
+	sdc->slave.device_synchronize		= vchan_dma_synchronize;
 	sdc->slave.src_addr_widths		= sdc->cfg->src_addr_widths;
 	sdc->slave.dst_addr_widths		= sdc->cfg->dst_addr_widths;
 	sdc->slave.directions			= BIT(DMA_DEV_TO_MEM) |

-- 
2.53.0

