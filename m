Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792725305;
	b=S7Nxosn12V1FLSnmULfHkIZtJLq4edxeEUB0vkq8BRkmAB0XIIqpg8gfOSN074Kl4l1d
	 kvJB8B00TCbyzRWVDDTAmYYR7ltA1Ghx/Quaal+PS9BFg76y3wlxiu62HJn1bawW2rP9z
	 rhfhTT8CtzQ7ONYSsDii/GQahuwU8uCEtdhjLfWfG+CSRaS3vUk03u4+3yv5FzUWgA4vV
	 frgzitTPsGqSg+U6iwWtFy9Ti77NkqXuTX9Mi1Yugg+y7qg7Kl/Ch2MyvbnzhOwGO7+iM
	 UdjOakvMF6BlPCk+D4sXEkpTTi6p2wD5vgSlJ81m7tUdh4PFIFwSEM1i9j8QStEEn5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792725305;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=cAy9rpPcmtphyYfmljmcbDlF/odwEhm4tGWkG4hppzc=;
	b=qnYWlpYcx4vefvCwXqdcAYorT88+K54/70CVgwT3G/+DdTJ4QMogbeawEihPNDyx/p0s
	 C4/DIV+GIZbHxU0EX4Ue6gDRgOyC9fPIzh6kZGiDiFrPkZYE1qUeja7zVN1cmfXIgpoUu
	 R4hxLezqmBZcYZ0jdGXcizK2B4MKkMFUQ/aa+aOiZPhz0Uzer/d9LtOxtt5hlAFUya7eb
	 NaZ++RfD97GI4S3kExIB6GTJm1Y+pdcukL5jif1AZ0VkyV+uE8K1kNyvCwAuTcugGMQDn
	 ht/ImHrfJZm5lFDhpKPau2SfOuOT/RKc62B1vwk/ypcGwMpkOIclThS/OvIJYl1GNZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NP3x5Cwu;
	arc=none smtp.remote-ip=209.85.161.46
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDDA606A324
	for <dmaengine@vger.kernel.org>; Fri, 23 Oct 2026 03:15:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBDDA606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NP3x5Cwu
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-705cb6ceebaso296475eaf.3
        for <dmaengine@vger.kernel.org>; Thu, 22 Oct 2026 20:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792725303; x=1793330103; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cAy9rpPcmtphyYfmljmcbDlF/odwEhm4tGWkG4hppzc=;
        b=NP3x5CwuYQMuuJmyJ/AfKIGWKLh3n3vHEB4cpcw0QGrZdmeIjCYEVLqkbwXWSRyPUN
         GknRXcuQHCLGQFWxq3r5prvt6HEBkIzSzoczdqs1Ai8Cy3YOL+ijN2k9grvZ12RpjzWJ
         zL18yWQIerESTtLUGMiIbDgMI8ALjaUe0vOgYEoTwELAluQr+1dTg3qCnVtiOcvAvVFE
         Z2wp+cxfVqNblQwLLr+bIRjvJYa3ACHr+Ga+7DAUhU0Y0/Oc3TzCRL5tt+f/6faTcD1G
         S6wJO0EyZU/GrtRbxi9m9KPJx4Dwm7Q3BBGvNF+KlhYxWfBoXEn1YL5mvAUKTheiS5QZ
         K8Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792725303; x=1793330103;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cAy9rpPcmtphyYfmljmcbDlF/odwEhm4tGWkG4hppzc=;
        b=e2kqIWGsDziDKgast53M2kPlD7GIMM1bZfJskD+6jDujC0XyliK3RQzib4OwxmxUHB
         GMDdpgI/OsMEWqBGaNu0lrudeHFDRKy6pAKai581kenLJAxTy+n3z3VlKBKBOYJ2ZJwd
         KLUe1M/vIQHEQdGCpU//zf2pory+rmEvztsVuK2mSkC8j7RsXhq7onIK3vyd2faOZ8NT
         tDCZ4j7GybOdJb5BnoNZ9Q9nMzZsAzY9J759V7vviCRvLqxHrgQLIREogXtpianR+C7+
         Ak2gIhrCPOvpA1DaGHuw7EoXzyb1y0c6H2EWOiAmAF8Y3cjuj/Xkk53MrjgepOkqbuex
         Kgog==
X-Forwarded-Encrypted: i=1; AKwUvBwmIUIbjGt/UCMyy7G5Qq3m9cRhA6OD1nJuAvjoa1iu/cPE2qSNSKQpxQt/sHNFYni/WL0lq7qBW5w=@vger.kernel.org
X-Gm-Message-State: AFq9FYKuU8rYB1ny0KInqP/tu1GLCrYoHwbDwpjx2U3KkT+uBDD7D89W
	ULUQWVwkgSk0L4NGKO+nA6zRP1xKiW7izdys2ST5ZwLGvRi+FSQ3wi6E
X-Gm-Gg: AYBFou2v463NJ3BsUao0Z8s6qjE1iw0tSnn+tWAknCT7zT+aIvDSZEUqjSp+1v6//1T
	9Y/Vd5JYoFWCvoXOvEneuo6BImaUAxe6hzdUAP9KG84JeKJW35G2TvDTTorPqU1Vs9TgciIEIJN
	V/FTmCoZ9ytVgi9uLkFZxWVqxqLpK/HuLTLcgFFvW5rutbWXicJBs2uZQ6x6xPJb5m6bRcHGHpV
	P+26KJMVf3ai8EOWNQ98+ofvF41ZziryT0QOasJzQQ5SFjSZBS2MV9+zNpvDXFhOOZpMuvnag34
	S2Xrf6iX3+1yJ0w7Fcf6d6tFrfoxVaeyqxCbEa0gnfwsaE5tpylPPOPGXcEQASX3bh25FrbEZVP
	TPl1XV+RehYTPen8Dk/OpPuUb3jq1b0lOW97dp1Dk7379ugyw2Lcldp7xkkASqLwjqoT5rcN6vG
	x64jVO2nixTkSkLtbRg3jog0pz0VZXzn3sfl+5mVIrl2IrfTc5H4Rhk9pqN74r1arqcZX8u2LFe
	ET07RAe2dD5Vu6tsCAUJ6GFTSgQTSZan/Or6rqBHG9zGJf+YylSOLTirnkwvjLijqqYBvmMSkjK
	tle+6007osem94GiU2PCXzx2+D4TBjl23C0XL01hXLaZ2SCwwNwEneMyaNSBDFp3NYrAaI2KH6E
	Y7l4x2zmJui8o7+sqPsgS8T9nOVXTM3Yhd26SRLSFVjXDu7o3yzL5vwyHlI3e8lR2DidUzLKSq/
	/Bys1V
X-Received: by 2002:a05:6820:330a:b0:6f7:2050:a2af with SMTP id 006d021491bc7-70b88a8a106mr865282eaf.53.1792725303524;
        Thu, 22 Oct 2026 20:15:03 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84fbda584d9sm938638a34.13.2026.10.22.20.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 20:15:02 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 22 Oct 2026 21:14:55 -0600
Subject: [PATCH 4/6] dmaengine: sun6i: track paused virtual channels
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
Message-Id: <20261022-submit-sun6i-dma-lifetime-next-v1-v1-4-01085f684c9f@gmail.com>
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
descriptor when a paused channel's previous descriptor completes. Resume
requeues an unassigned channel only once and schedules the allocator, so
an idle controller does not require an unrelated completion to resume it.
Clear the pause state when terminating the channel.

Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index cd0562de7def..7ac6693a041e 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -209,6 +209,7 @@ struct sun6i_vchan {
 	u8			port;
 	u8			irq_type;
 	bool			cyclic;
+	bool			paused;
 };
 
 struct sun6i_dma_dev {
@@ -538,7 +539,7 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
 
 		pchan = vchan->phy;
 
-		if (pchan && pchan->done) {
+		if (pchan && pchan->done && !vchan->paused) {
 			if (sun6i_dma_start_desc(vchan)) {
 				/*
 				 * No current txd associated with this channel
@@ -934,10 +935,12 @@ static int sun6i_dma_pause(struct dma_chan *chan)
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
@@ -959,12 +962,14 @@ static int sun6i_dma_resume(struct dma_chan *chan)
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
@@ -993,6 +998,7 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 	}
 
 	vchan->cyclic = false;
+	vchan->paused = false;
 	vchan_get_all_descriptors(&vchan->vc, &head);
 
 	if (pchan) {
@@ -1040,6 +1046,8 @@ static enum dma_status sun6i_dma_tx_status(struct dma_chan *chan,
 	spin_lock_irqsave(&sdev->lock, flags);
 	spin_lock(&vchan->vc.lock);
 	ret = dma_cookie_status(chan, cookie, state);
+	if (ret == DMA_IN_PROGRESS && vchan->paused)
+		ret = DMA_PAUSED;
 	if (ret == DMA_COMPLETE || !state)
 		goto out;
 	pchan = vchan->phy;
@@ -1074,7 +1082,7 @@ static void sun6i_dma_issue_pending(struct dma_chan *chan)
 	spin_lock(&vchan->vc.lock);
 
 	if (vchan_issue_pending(&vchan->vc)) {
-		if (!vchan->phy && list_empty(&vchan->node)) {
+		if (!vchan->paused && !vchan->phy && list_empty(&vchan->node)) {
 			list_add_tail(&vchan->node, &sdev->pending);
 			tasklet_schedule(&sdev->task);
 			dev_dbg(dmaengine_chan_dev(chan), "vchan %p: issued\n",

-- 
2.53.0

