Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794735203;
	b=V13dpQQbrOEehyXPBaudKibBqz4qa+lCVDaTDrblF9toU6XjlnPgMWLe2Eiqt147wxkA
	 WAdhHleITJvOF3dzyxNzic+wSxvHvZRQ/iSkQHgSlyegpkze/J047yQkUP2D4oJGRGJfg
	 4aRESZZLfcvG2tVQ7aRibY4n2fBAMBfPIIcb0oQ9//3/voHVhjjkHTh9bSpf/4JVvAP8z
	 X9A/6PsQe/8k71GtT9ukYXsnOxvfIJIWKIK3BRO6tKelrbJWJmhstRPUlV8UgVCpNG+A1
	 G2lTPyLHrEByGNWgESpjKjj7iDi/LKyq8pHeRUsQfTMMn2HGJrA5cZbpDN7+O+dyLCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794735203;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=nj+huGoNy2lIUQaGcQ7MZRaU7F68XeRQvFxjv76wcSM=;
	b=JVNlZ2pG15AMZZOriy23DW887HmhsHZa4hxqfixicJ3HXNO83nNpOTXgMSz+Swsv7mKV
	 MF1iJo9lLSL3A3OiFIuK/U1zCwkbY1qBRzMHdnCsTDy1fG0iConRLVlTFeQsvM11Cx2WM
	 FK3WH7oFpeEBwHaJRVjgcI99cIgxL8FDJPxCDDm5YjkSXgMlyxR2hExuDC0PVj88sshkT
	 LACmMH3AApL3VPThfai2FdM+xalSJQWsBAJIVuYLped2y+FskYGHg23zSEJmJF16ERE+Q
	 kfVv/FERh9ZAGgvPcgIZSzt1Wi5MCL7Mpq4+Sn0bumSMoHqURTU08LhzJULNeqetjcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G1np7wLe;
	arc=none smtp.remote-ip=209.85.161.52
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3903C606A891
	for <dmaengine@vger.kernel.org>; Sun, 15 Nov 2026 09:33:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3903C606A891
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G1np7wLe
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-71af0656bedso20957eaf.0
        for <dmaengine@vger.kernel.org>; Sun, 15 Nov 2026 01:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794735202; x=1795340002; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nj+huGoNy2lIUQaGcQ7MZRaU7F68XeRQvFxjv76wcSM=;
        b=G1np7wLe9YENBfqgbqsA3M95uDrY92Ce+uYyA4rjypwjjgqs/2/eEx9wbHH1gKTIe0
         As2VwO0SgzYcp9ynYl51iAvtA7n/WYtD/tPqrX0+koGDUZc40Wdpqo7R5gJsOxHOzHq4
         G85IgQcG2dT3Loqwnb2K3i3+csoZo1Xz2uD0PHXEMZwUWkZ5ZLD+v0GQ05K+krI/BA76
         cZpgBZZeHd1xsW9+PfhQlve5dZDzCxsAbiqoMW+NzAh7qc0drN2DW5Z5kj/jTjAG0W+F
         Jb56tn6WV5kePXZWBUMtNe6pfkZkyjXkdA6bNMaffYJkgKrCSEIafLAEl/R8s9DZPTOi
         QTYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794735202; x=1795340002;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nj+huGoNy2lIUQaGcQ7MZRaU7F68XeRQvFxjv76wcSM=;
        b=Y/Q+IbAebT7rIv4ykQO4RiF2u2PXFXZGl735vm2Njkw1bcyJEG26md2jyJ+pDfyQSx
         JiUMMx0A1BfrN4ZbUn+XugLpCWsdk3aJ022LwKQt9Kanne3EmW5HoA+JOJkENkyZZcP0
         9nf11fa5JV+Mk6GJS96bV6Zvc1mrSQNbZRs5k5fmII78JKja6EbR5ovr4Wu2Nbp00pmU
         NBLJZF+t+ygcUKYog2XLssnuxyFBwojDZjGTZ7Lj2xZfcxEb6T77PmeEJ0TVmS2AnXYh
         BwQLb9PaOSRU+c0TMhcQCvS4Wq8V1Vvg17I0fCUNYYLm5Wq96YxfBeltGaqiMPI+UjDs
         Hngw==
X-Forwarded-Encrypted: i=1; AL+hErEu2ILywoY+OOxIHrFeanGrXULAhK89wQ+gizRhSjraRxkHGZhm+F4MQ84AHqsvsSUQBTLVDf4Xx/k=@vger.kernel.org
X-Gm-Message-State: APuU4Z/GzuquGge/EzUXdtQGxQB8I75qwjDFG3A1hbFkXZR0As/ZfyFl
	re3mGFyEqts46CXHQT8WqpEaueduTCav165BoqZRhBf0t6X/Fi8qS8EMjEnDTw==
X-Gm-Gg: AYBFou10BRXhvTswVhZZiDIHxP/W/a+MSZ3pGi8UFj8QuiHUJLZ+OsVozdH5oa1gY4l
	5j6ryDTDVegM2FmWfGWdrxEJoTn9cZA1KJBiKArfMRjQe8UHi9KcOLWArzP20EFKNJB7JOqil1r
	FmX0A4NOBUJRQHu5883ygGZvBi6MwkyGnLf4K5q93gn1nWYfqPVahr3YG7OcPFawTIsC1PnXb6t
	Uj4u99c/Qf5lH5k/+0CRKqG/Jwf8k/O3WTZsGFPsDnit6XhkuxNNPL2vKidJjkoJCD6IQvTNzLw
	/1ZfmBbO60/mwR3CwGSAJgtuGI97qqsl8mhIfbYNWMEOhYOPD6Sb8HLEdpVbC+kchQ4IDpQ1Lte
	kqs6LXvK41v3fkeUTHRKQ82j7lHPcYrONsETr0vzITZOJkmB2nb17fg16u41zDUlne6aChUYXF3
	QFgPKlVEmtteVKuaAaeLj57kEt4IiXDAAe7RySjYzqZaxXm7EV9spcuOQhh2MvdKjq3uW1GRlUZ
	Es0a2lN/yQMgwatKOiZDPeeZD92dkToJIwaDIMGQ7modXRUw7A6Ev6oHlSCfLJMvvX0xV2oi26e
	70I5TDjaZZM07jEPfVzHoZpsYulkDhJFwKuivDhDx/hb0Fa3os1Y/VkImyW7oLtlmWT8OY9sSTq
	BjX0iHP1vwIH5E2dKZ0E1HTEKC7clgR3/cynowQ6dD+OS4gzZ4zTfuqylRVGAy1dvmxFo7EPWvo
	2Ji5Dg1YeoP2+vyOwPgqoNh0H6l8uxZqAwxl/J43eE62kwyNsN11E=
X-Received: by 2002:a05:6820:1396:b0:71a:e696:71bb with SMTP id 006d021491bc7-71ae69675ecmr1052335eaf.35.1794735202064;
        Sun, 15 Nov 2026 01:33:22 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab43347b9sm5933617eaf.12.2026.11.15.01.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:33:21 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 02:32:55 -0700
Subject: [PATCH v4 7/9] dmaengine: sun6i: track paused virtual channels
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
Message-Id: <20261115-submit-sun6i-dma-lifetime-next-v1-v4-7-043cd476a45f@gmail.com>
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
Read back the pause register before returning so a posted MMIO write
has reached the controller when the client inspects the transfer. The
readback flushes the request; it is not a separate hardware suspension
acknowledgment. Completed cookies remain DMA_COMPLETE.

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
 drivers/dma/sun6i-dma.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index ab4474f0a8aa..14f1f463005e 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -208,6 +208,7 @@ struct sun6i_vchan {
 	u8			port;
 	u8			irq_type;
 	bool			cyclic;
+	bool			paused;
 };
 
 struct sun6i_dma_dev {
@@ -539,13 +540,17 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
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
@@ -937,10 +942,13 @@ static int sun6i_dma_pause(struct dma_chan *chan)
 	dev_dbg(dmaengine_chan_dev(chan), "vchan %p: pause\n", &vchan->vc);
 
 	spin_lock_irqsave(&sdev->lock, flags);
+	vchan->paused = true;
 	pchan = vchan->phy;
 	if (pchan) {
 		writel(DMA_CHAN_PAUSE_PAUSE,
 		       pchan->base + DMA_CHAN_PAUSE);
+		/* Flush the request before clients inspect the transfer. */
+		readl(pchan->base + DMA_CHAN_PAUSE);
 	} else {
 		list_del_init(&vchan->node);
 	}
@@ -962,12 +970,14 @@ static int sun6i_dma_resume(struct dma_chan *chan)
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
@@ -996,6 +1006,7 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 	}
 
 	vchan->cyclic = false;
+	vchan->paused = false;
 	vchan_get_all_descriptors(&vchan->vc, &head);
 
 	if (pchan) {
@@ -1041,6 +1052,8 @@ static enum dma_status sun6i_dma_tx_status(struct dma_chan *chan,
 	spin_lock_irqsave(&sdev->lock, flags);
 	spin_lock(&vchan->vc.lock);
 	ret = dma_cookie_status(chan, cookie, state);
+	if (ret == DMA_IN_PROGRESS && vchan->paused)
+		ret = DMA_PAUSED;
 	if (ret == DMA_COMPLETE || !state)
 		goto out;
 	pchan = vchan->phy;
@@ -1075,7 +1088,7 @@ static void sun6i_dma_issue_pending(struct dma_chan *chan)
 	spin_lock(&vchan->vc.lock);
 
 	if (vchan_issue_pending(&vchan->vc)) {
-		if (!vchan->phy && list_empty(&vchan->node)) {
+		if (!vchan->paused && !vchan->phy && list_empty(&vchan->node)) {
 			list_add_tail(&vchan->node, &sdev->pending);
 			tasklet_schedule(&sdev->task);
 			dev_dbg(dmaengine_chan_dev(chan), "vchan %p: issued\n",

-- 
2.53.0

