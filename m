Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792798728;
	b=27Ga7o+um8OnxicaeZKoALAGqT1a8/5hfw6qy2zg611I7XB6hxvD8J6gMMsTS9vcoIkT
	 6qiSo46YpyFNrOP+1gOOvY1lcFybOvMdV99S9+dJnI8+Jt1r+ic4Tpg5PCmhlna6kyilA
	 cOwVCPCRfzbTs9yf6VTm25FrTVNEIKrZA0oKejUVNiKTebXXe3wnyO/Q0WmI8551vo47+
	 cEjyrfCNSvOfiMF5z63ESUWi2v2TfiDoZ08BF3XQtGbCAOPkQC0o7Jah9HaTRHZDchP86
	 iTVKCVAmK8YU+y8pzYoUtc+Vh+9f5pvDGw/p26jUncYEeJ+OPIt1I3A1njDxo3vsehA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792798728;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=sH7DjWiwuin5EerT2/8LAxO0bCdrNvcuXjPgNrPzpko=;
	b=CLOpZeq0630U77KBcdIpke9gz2x3kVHuSkYtq06MXZ3WRpRRRUWD2JwT7dLrUG7v/Qla
	 6bqNKYMenrCvzjabP8J95bO9TgZemqKK6lzk/FGZIBak6BxlNO1PbyEFV9h2QVj+xcm5B
	 DbkIQYuFE1BZj95VKmtpD0epF5jSHRc9g5IMXCirKVpf2LbBewjsmI+G0jzFmRb8lN/cF
	 2HZB0g7x7jrh9p9z+yKwz9YCT34cymIotJDXpjZSeRDYGKq7bxUuBgLEGgzwX49eGtiag
	 rgjVGgcBhJKmnTGQpiBv4iaRAwjYcD2pwp75OAMgZJjTZaN5toJ1BdmyKskfadUgFmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JNrA3kEi;
	arc=none smtp.remote-ip=209.85.160.48
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF8860A2623
	for <dmaengine@vger.kernel.org>; Fri, 23 Oct 2026 23:38:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BF8860A2623
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JNrA3kEi
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-4a76b314cfeso1749124fac.1
        for <dmaengine@vger.kernel.org>; Fri, 23 Oct 2026 16:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792798722; x=1793403522; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sH7DjWiwuin5EerT2/8LAxO0bCdrNvcuXjPgNrPzpko=;
        b=JNrA3kEiX4EkQjmfJIcV9WFDw7oWJaC0VBjpGVzMfJbDuKFZ5ebpV8zXJ4NAV/12WA
         lMrSpVdknPEdtI/s4IXKyguG2pJ8HIQ81AvvwsXr5nwpSVP38JmwW51Vkvcn9HY8Ovq6
         NwNgqmtkE0J9fuzX5XpN+P/xeMazBbxjkp2mYNE33yarQxZSjkEEX6v/JkwJEImBtnu0
         DFVasoaVZxS/dkCHSz5aq4ZuehBJxelc+IupNw1L9fTbIDg6W6u7Vov9Qj/wHUzS4Uwg
         XV3PaQuCLi4mALJk07ORV0/IwvCHXKaUvGQbPZBKEfdaNey0CfsMzPXGnKAlASETinuM
         Uy0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792798722; x=1793403522;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sH7DjWiwuin5EerT2/8LAxO0bCdrNvcuXjPgNrPzpko=;
        b=Yg8euf4cRnyIlcC1uRMRnjvlCHhOBE5JoqWt61pIaRn5aWY8Kd6CGVCCq4UYfyWJtT
         QXFIvwHsxjmY4SyGpULzPdnc9Odq96/2fSi9hLF9U0pvXMmqTawH9oOny4lAOFFiQGJ8
         LGmtmNct/xkSzEEse9U5JeBgvxffN/V47dwewN0nXhZa1zm2vuyU+ZRF+ehHZzS6HzX+
         7iMqu3YbeWJZWPphhRejSRXc/np5e40X3BkoH2bHJ7qGkDaytKkg5cX9ZdABHgXtQ5K9
         MUpeEA5koT9XelBAZ9CiinPl4XFgyv/6z2VBYlPqjCRWNLe05ALYHmNT45AfpdvxBHFO
         XZzw==
X-Forwarded-Encrypted: i=1; AKwUvBylxxmyAFjME7GMka0z1/oVwtdhCsz2D5L0FR1ENcyWim9cOq65NDdRFjZQFghWsxKr6GURq5yrMs8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJgR10BzSvqxqiC8paGbZ/ADpTOF+AFyiMAJKdcQsM9nLV//b9
	SyLKm0A/XF8SKByUi37tS2hrwZVx3/NpWzR1Xo+J8F+8i1MrifJnfrY7
X-Gm-Gg: AYBFou2DFGEyyeszQpkcqUDjtfZFr9JmzJcPZRUUrHWIHozp+zgWKa/VHzLsHDebPsn
	ma5ta4MRDM5Y0oFQMa6YLLOvb29VUnC5WpQ+ShdDl/5Xj0Wc4A294fdxBYT0EFuLoqlGQj69sVR
	tyKUJsI6EGQuEenv6QceLr0SYUHEQYEK9+fjVoxiq2Dz2eqdRnPd7Mgs8GIdGrhfa0koZ5Y6fwI
	leaBOk4d1eRwmvzTEzamYmcX6hY1sox35vqLr1qMDmjFN7qsSmzY14InNgaF/rrkYVITdUAT2uG
	AJdbNkXTR+JIIPxqglEesnqYekvtYmOqW21hCyQVTcmCHAHpzRYsoa7f+fbEXIQI2zoIOBLd+1I
	HDbixyBbcskOmV6tDp4fp1pC2BhCmlPDYouxZEAt6tNTGvcNWjm5itcF9uRxrIVCHQoN2RYdkbq
	wBDbAkK6LIkBmMmzBOcbxalf3Z5bPn4EaCz2my/u1pKXYpg3SwoIth5m5Cg2vTXCIaeZs4y560f
	xQMaAA79eqhjSCz1PnpAPtvMWZv5pCNvOvsjmO88ikaB48H+beREfCkHD8mtzZfOc8DXoXM86I6
	Gx862ixa7vV1h0+DXNrsBeoS1PI43V0Zcxt5bm1fPGzxLKOAf9oilF3aPbfhrwQtjqCiMeiRak2
	1z0H18RgmiUqeXA5FQjeTQKvhu/9vVVrn9ltyMte71+WDnYBEv8XTtT7YIqHHLLL7bc/VtUlK/x
	sl8kIgyPoggiDSZzFX2X4OTKRG1Q==
X-Received: by 2002:a05:6870:d61f:b0:4a7:2baa:8701 with SMTP id 586e51a60fabf-4a83f9aab83mr427138fac.15.1792798722385;
        Fri, 23 Oct 2026 16:38:42 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a843225d69sm284345fac.15.2026.10.23.16.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:38:41 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 17:38:26 -0600
Subject: [PATCH v3 7/9] dmaengine: sun6i: track paused virtual channels
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
Message-Id: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-7-ef1acb0be768@gmail.com>
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
index dab17b3863fc..25987f550707 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -208,6 +208,7 @@ struct sun6i_vchan {
 	u8			port;
 	u8			irq_type;
 	bool			cyclic;
+	bool			paused;
 };
 
 struct sun6i_dma_dev {
@@ -537,13 +538,17 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
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
@@ -935,10 +940,12 @@ static int sun6i_dma_pause(struct dma_chan *chan)
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
@@ -960,12 +967,14 @@ static int sun6i_dma_resume(struct dma_chan *chan)
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
@@ -994,6 +1003,7 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 	}
 
 	vchan->cyclic = false;
+	vchan->paused = false;
 	vchan_get_all_descriptors(&vchan->vc, &head);
 
 	if (pchan) {
@@ -1040,6 +1050,8 @@ static enum dma_status sun6i_dma_tx_status(struct dma_chan *chan,
 	spin_lock_irqsave(&sdev->lock, flags);
 	spin_lock(&vchan->vc.lock);
 	ret = dma_cookie_status(chan, cookie, state);
+	if (ret == DMA_IN_PROGRESS && vchan->paused)
+		ret = DMA_PAUSED;
 	if (ret == DMA_COMPLETE || !state)
 		goto out;
 	pchan = vchan->phy;
@@ -1074,7 +1086,7 @@ static void sun6i_dma_issue_pending(struct dma_chan *chan)
 	spin_lock(&vchan->vc.lock);
 
 	if (vchan_issue_pending(&vchan->vc)) {
-		if (!vchan->phy && list_empty(&vchan->node)) {
+		if (!vchan->paused && !vchan->phy && list_empty(&vchan->node)) {
 			list_add_tail(&vchan->node, &sdev->pending);
 			tasklet_schedule(&sdev->task);
 			dev_dbg(dmaengine_chan_dev(chan), "vchan %p: issued\n",

-- 
2.53.0

