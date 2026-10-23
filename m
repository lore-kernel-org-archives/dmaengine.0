Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792780970;
	b=2CCgHoND/JxM81T2ZEQXcf8SmiXXteHOvz6II8Xq6aPhLTbpJQIHFL8VtFpGTPJWJCgv
	 IWrYn0lEKt8OG6r/p+zMBDA2lnqTqDg+m+ge2w3QCbQ+/liVVIREMKviztA4D/omy3BqO
	 QUhZE2ox3i08VqUqEbEvsoRW8twU8vsgYlNEtXOGR6DUC9v18nF2ZYkTjmP70wiTqa7y0
	 ZB6qs1L6oq6ARPSWpujNaFbkGOUaxgKW9fWmMcFJIql/9kSzUtLpkQsZnvoYPs/69J4i8
	 avU/5V1GeVstdxbwDcjz9WwEWH6Ska/0CIUSdKb3xhcoW2GXNOeQiIdrjTXAQd47RiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792780970;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=EdzVfCnxM9RWe3gkl8fuF1B/Ob/41o49mzScjy2RIHw=;
	b=dWo5QN2zroif2Jx9A3fUFOUM33R4r0UgE52BK5TD5zLEYw/MUwaXTIDV7JLW1adii3vf
	 oORuXoaDsuqo4MK7+pGSXYhkAJImRsYP7DGv3p2Uk3UPIoBBZKVVx7PUigWn33loC3vUE
	 f+QAOW4rTqlAn/Im9hOqP4J7KMqNEAeDBryaLIXc0zTM+WvOnWXQwm1XHCMqFYwVP8OO+
	 nBQ5P6iyvWg/reoBh4sfxJDwERvYlBPiqTqkccuWKqUJT2e62OeTpUb+lhvuDw1O6S9B7
	 dyOXhcA2qYeSQzudOAOuI5H0PAtPukXa/YAvnSqtGXJ5ZYis/YPfL4fTzr9Zj4Q3U8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ikMZcuWM;
	arc=none smtp.remote-ip=209.85.161.44
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67715606A32C
	for <dmaengine@vger.kernel.org>; Fri, 23 Oct 2026 18:42:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67715606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ikMZcuWM
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-703be215729so545820eaf.1
        for <dmaengine@vger.kernel.org>; Fri, 23 Oct 2026 11:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792780968; x=1793385768; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EdzVfCnxM9RWe3gkl8fuF1B/Ob/41o49mzScjy2RIHw=;
        b=ikMZcuWMFzrZbeNRRZjkSFNRWev+JqpYqTYCNWzW6FDfRpKqcQDLxR4jz7N5xRPblX
         1XAUaCInQHEUjkzPjlHwYMhGvHop/Lta38VeV5kIpMR8O8tuohTMPMCKMHTdP0fWKpDU
         gUW9abHgWVCwliqz9GiDjkYDmO3u3uehpyxITNbaBquqpKbyUP48+DlifaCvdVqwlQQI
         jmI0N+e0PfhggHJAhQzzLXRIhN265I1OXtAYyjeRxaAYvyNHBEFFe4wtjojratQ4TPly
         TYtYwrTxqUf4gcLl5IJZwrC6HNMlplGTsTaAR2r+LtAbCMqG6MGfPqFYFT4vfCflwRf7
         PZ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792780968; x=1793385768;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EdzVfCnxM9RWe3gkl8fuF1B/Ob/41o49mzScjy2RIHw=;
        b=WiiXVmX0J/E6GMLIns9jMa181buvUr0jZ/JN0uzEJFBHCde+btQcYJvhZjzT1EbVGX
         RCPk/cIWhaP+eUEdJ9/FoCcD5MEoHx5G1ub6Qp9ZdOCfvKLzn8mJUqiyiIVNhO45RfrK
         9d0TQJEH6yjLtrTS+qRcY+ZdynTZCapz0+lujB8s00E4mF1f6vdiUtZCISGiW2lwtDSm
         O0QYRSPftQKLf6BVKJj9Jbyj5SgDolIEpwFdAaaWZVNlfpbSChRclmWQjt0/IdTeakVc
         0uYhq5RtEjSLhVVX5lJmDT99BFTN8mQ+GV7kjH2BNrnF6jNg/PJmqs33BMbNZdlUixB9
         ilLg==
X-Forwarded-Encrypted: i=1; AKwUvBysPw3Jky4ADKGFzbeiwbfeiVtqt+Pxx05mxvgt9jc8lySj7BgXmVEc3ZclTDx02W1obGgY1ReKKXY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLib60lNrl2lo4yXcVy1kJ35BoQFBR7osGspsZp6GGHhMMC71AY
	hYcQMIznZDHEATySBFkUIVe70VGXhvG3/GGKEuq5a4wEt1nkrlK7uQah
X-Gm-Gg: AYBFou2ikaRBMlvxgu6GALcm3OwJF+BrMvRK7dRgLSwWOJsnAk518/AkCd4UEpDRA0L
	sB6xNT/ehzwY8XNR6upajfwYV3bTwfK3AMNFHEQjxGmF0rCQZmna+CnoGUTaHdgy23McmVjVuRl
	OfctyEp4RLqxgzlly9F1Aq15KI+TSuSkQer6Q+Srq8sMIINn0+x+86QYPTGreHtdLp8d0ckj8KS
	j67R85vdILfW/RwV0P75DnfY+gdSp9e48j2e7X7ILJ15MALzCTbDZUcPnaAySVbFl8P5Z5ps0Ii
	xDF+VVJutYwyjJQ7Jalmhqs+EPHpEb3byio99OLmp1fFuEgsohr9OaL6pff4FkcaifbpJZ5MsED
	5bpPLMqqGYj20Ajqy3vwHQMZuk3KMRK/vdpzfaP3P9Gq40TfI1OZjW/bdEwN2WbAIrDYJGHqi5h
	ZDJ/ZfncCFtv1waJXxirk9HcTjgmEnuLZIpgAV0ZITU0UXrNrJ2yDG432JSN574b5FlJ2NJ/siD
	KZRWvaIzh5vTrFvmvS2SVcC3j5fGIoZNmRad1U+oCTzS0Sfrpkdpl2CVGYD7tKBxWKwYf6oORkg
	KIrQVBWWegNNPKa8qFpG3vH2JbtjNnyY/fnrV34SVohT/rXSEK2UjVoq7hE7nLzyXXgBwo9vOWB
	Ziw30SjUr3nAWqebnanZd4uscV7PXgdAUnZPC1uPTTggpRBQzSQAR1Xn8G64MW9R/JaxLl7urPR
	vtRA==
X-Received: by 2002:a05:6808:4486:b0:524:884f:d89d with SMTP id 5614622812f47-55c0029724dmr56674b6e.21.1792780968326;
        Fri, 23 Oct 2026 11:42:48 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55bfe199544sm336682b6e.13.2026.10.23.11.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 11:42:47 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 12:42:38 -0600
Subject: [PATCH v2 4/6] dmaengine: sun6i: track paused virtual channels
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
Message-Id: <20261023-submit-sun6i-dma-lifetime-next-v1-v2-4-c9e07cc44bf8@gmail.com>
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

sun6i_dma_tx_status() only returns the cookie state, so a paused but
incomplete transfer is reported as DMA_IN_PROGRESS. The 8250 RX flush
path pauses the channel and calls its completion helper before terminating
it. That helper ignores an in-progress transfer to avoid consuming a new
RX operation. With sun6i it consequently drops the partial buffer and
leaves rx_running set, preventing another receive from being submitted.

Track pause state under the channel-assignment lock and report DMA_PAUSED
for incomplete cookies, including status queries without a residue output.
Flush the hardware pause request before returning. Completed cookies
remain DMA_COMPLETE.

Keep paused channels out of the pending queue and do not start a queued
descriptor when a paused channel's previous descriptor completes. Release
the completed physical channel so other virtual channels can use it, and
clear its hardware pause request before reassignment. The paused virtual
channel retains its queued descriptors until resume.

Resume requeues an unassigned channel only once and schedules the
allocator, so an idle controller does not require an unrelated completion
to resume it. Clear the pause state when terminating the channel.

Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index a21acb9ecc27..157746c9423d 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -208,6 +208,7 @@ struct sun6i_vchan {
 	u8			port;
 	u8			irq_type;
 	bool			cyclic;
+	bool			paused;
 };
 
 struct sun6i_dma_dev {
@@ -534,13 +535,17 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
 		pchan = vchan->phy;
 
 		if (pchan && !pchan->desc) {
-			if (sun6i_dma_start_desc(vchan)) {
+			if (vchan->paused || sun6i_dma_start_desc(vchan)) {
 				/*
 				 * No current txd associated with this channel
 				 */
 				dev_dbg(sdev->slave.dev, "pchan %u: free\n",
 					pchan->idx);
 
+				/* The next owner must not inherit the pause request. */
+				writel(DMA_CHAN_PAUSE_RESUME,
+				       pchan->base + DMA_CHAN_PAUSE);
+
 				/* Mark this channel free */
 				vchan->phy = NULL;
 				pchan->vchan = NULL;
@@ -932,10 +937,12 @@ static int sun6i_dma_pause(struct dma_chan *chan)
 	dev_dbg(dmaengine_chan_dev(chan), "vchan %p: pause\n", &vchan->vc);
 
 	spin_lock_irqsave(&sdev->lock, flags);
+	vchan->paused = true;
 	pchan = vchan->phy;
 	if (pchan) {
 		writel(DMA_CHAN_PAUSE_PAUSE,
 		       pchan->base + DMA_CHAN_PAUSE);
+		readl(pchan->base + DMA_CHAN_PAUSE);
 	} else {
 		list_del_init(&vchan->node);
 	}
@@ -957,12 +964,14 @@ static int sun6i_dma_resume(struct dma_chan *chan)
 	spin_lock(&vchan->vc.lock);
 	pchan = vchan->phy;
 
+	vchan->paused = false;
 	if (pchan) {
 		writel(DMA_CHAN_PAUSE_RESUME,
 		       pchan->base + DMA_CHAN_PAUSE);
-	} else if (!list_empty(&vchan->vc.desc_issued)) {
+	} else if (!list_empty(&vchan->vc.desc_issued) && list_empty(&vchan->node)) {
 		list_add_tail(&vchan->node, &sdev->pending);
 	}
+	tasklet_schedule(&sdev->task);
 
 	spin_unlock(&vchan->vc.lock);
 	spin_unlock_irqrestore(&sdev->lock, flags);
@@ -991,6 +1000,7 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 	}
 
 	vchan->cyclic = false;
+	vchan->paused = false;
 	vchan_get_all_descriptors(&vchan->vc, &head);
 
 	if (pchan) {
@@ -1037,6 +1047,8 @@ static enum dma_status sun6i_dma_tx_status(struct dma_chan *chan,
 	spin_lock_irqsave(&sdev->lock, flags);
 	spin_lock(&vchan->vc.lock);
 	ret = dma_cookie_status(chan, cookie, state);
+	if (ret == DMA_IN_PROGRESS && vchan->paused)
+		ret = DMA_PAUSED;
 	if (ret == DMA_COMPLETE || !state)
 		goto out;
 	pchan = vchan->phy;
@@ -1071,7 +1083,7 @@ static void sun6i_dma_issue_pending(struct dma_chan *chan)
 	spin_lock(&vchan->vc.lock);
 
 	if (vchan_issue_pending(&vchan->vc)) {
-		if (!vchan->phy && list_empty(&vchan->node)) {
+		if (!vchan->paused && !vchan->phy && list_empty(&vchan->node)) {
 			list_add_tail(&vchan->node, &sdev->pending);
 			tasklet_schedule(&sdev->task);
 			dev_dbg(dmaengine_chan_dev(chan), "vchan %p: issued\n",

-- 
2.53.0

