Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316633;
	b=wvH2r6g4UnPeNQe0aZCm2KiyTlIKNsqf8coTmNfGsil09P6hEgxS9Wfcy5m/jkne76VY
	 3SW8RsiTkVyKpS/dKkvjv3Cdk3OudVUKC+TAe5WLrsI6P7C9mzlzAo3kU8nDeJF5tRP+o
	 ofZNIu2rsFGB70Y2/kQsnbo/PUcCKomsNnddvbBplUmjcism4ymsBhJz1E5iSEk0WJjg+
	 bqWTqGUWA2fi35DAyHkjjVnbNKRmltcImhqEEyPLcDHzmXssVjK3oSULww4r16GeEGw9v
	 9sk192hm5FkTzOZ4SPrWlHzOnswEr9lpQW54sUtPStyMoGa6Io3+Oc12LqPedr1eHwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316633;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3R86nX81cq8fPtcXx1q+l9uA6SN/ot4zzy2OGu+76Gc=;
	b=1yMsWtxiF5NIC38tNPTWPWwuw32wXQzqLeP+If6MAjM/3LlbNwR8Bb37Pw+oqD0p7ROI
	 PyA6MHwSAGTOXRz05t2RWZXnjL/La1JwzggAwDbHz5rQlSzMQNxnnZeSQogoFEnvQoW4k
	 2ZiCeZHENOp8f3x6OUi/LOUl97fhfVhKw+RHIPY7aK2dVmbb7ToY2WmItfNQJ5Ig6hKR1
	 P86Wq0WU44yMYVICcUnPjhpk8TmIHqLj3qcpGgsCySwJ6PO6wSIhLfNP50twHjF6w8NQN
	 8SAaWtOAI+Rqyt//sEeSZNpW6Pj3n0Y5scQqrhSBYDjRo/oJkpWf/SGAlYep5Q4aCuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G4+aDYW9;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA67606ACC5
	for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 13:17:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BA67606ACC5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G4+aDYW9
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cdd89d84521so466186a12.1
        for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 05:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316633; x=1794921433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3R86nX81cq8fPtcXx1q+l9uA6SN/ot4zzy2OGu+76Gc=;
        b=G4+aDYW92oak+lJqUw7XTAYYObFMx2FEhQJMnNm0ERl377a635Wy4WZfFcA5qzUkUg
         ca/qQQ/7Z0S3kN0vgnwJyQiFIp42kKU9A6n+uRYIniexLHSckagRiaxsqe8S/vT6sqha
         aU2SgAje1yRE0QMvu/xvGMvmsDAVmFD3u0bm0InWLClyVAjYemBRQdhMEbl5MPvfRfQf
         CH4GToFUU2jnY553ptNWeXnSnKhUivPTuwDphTYX+7GgCGA8BEpwoh2Ki8we0PZQxjhC
         MmeBk+uD6topf7FHR0FIGjg6sCIFlhol0QxwPxALVgxdVekQHzUHu//CV0e02uzuRCAq
         BStQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316633; x=1794921433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3R86nX81cq8fPtcXx1q+l9uA6SN/ot4zzy2OGu+76Gc=;
        b=2zEYR5ZizFkcPAXwcRqPFsCqZZo6MFChvK0AGRK36ALxsVR7PW5EgzZAx6qQvyloAi
         Ml71W7GM6VhBZY/OzBDccVCSzV/LsYG4vWg4FXnUK1qCM2BL4LZyf8XGmrPymWwj5KR1
         b9LyiKXBUTVjyXQphE9U69O6AgTwDpPARor4hNddM0a9ZM7wcwhe5U1YXX7L6nVAfsfT
         njRtS5t7FUFfyBVniCvR89yZc3Whqk5wOLYjNgNDeobf4qMx3AZ5nzRmHUsgfrU/dbPp
         JSBbEmuTKfDAmG6pwRpRmwFDYBzhPVeJN46bUJTRmAB1qcXfOvloCQ1lDa2zQbmZLS7L
         ImIQ==
X-Forwarded-Encrypted: i=1; AL+hErGf8bOU/z1o48uPLDOA4VPq70VqA7XbZt07rnry1WmHo0WVnyZKU6rGGIIjitVWkp/VkpnZgm+Qr3Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4IjIODqXiYPbPPDQXT1GwanSSNdSaBjajqAHbBpo7Pojp2IlE
	jRgLS+4x3UEK0saHPMKGR5KIZIlL+CqXLLpavabfR/qgEUfUUsZ1LaC1
X-Gm-Gg: AYBFou068/Og5sOJ1CqgLpiXA084rBSBOWh54Io2witkOquhPxRvSDBIy6JSPQxTjzP
	so1HcSGbovSbDWEB0ZN0CdE/G5OONIQNdy7+kDjEr4pKS7zQyTZcbwf51GZ6l8dOUHECxlYgWL1
	2brI02KGHnqFlg7juvTIrw9nEw44nUE/p0C+6iiKlspoEglJW4bUt0sL+24BUHokm91PFVnNMXY
	YPSwTHibnVJngfjwSPN/tvLb5AHTv90L8Twvc4YPx5+BFFu5h1Soo/RD1QddXpMWNPEsSo9DCuo
	U9Ou9SZ8nYAd5Gal1sjZocjF44Th5YkGDswJ3JixuPnj50CC3Q2zJOZ6bxfvYKiMrOKr+8R+Tcy
	NHch0LpGg9hntYduUMxow+6xwcIPA/lJafh6Ni6wWC2Jnsxc6JB1TD+ucWsTowLjZLWBX91eFZl
	6cwK0DgPFNK+0mPmqjeVqW3dkYCeShvbCaUL0TSVXKR/YX08X2tRI9EuwQ/vK7ac37Zt26Qa0l9
	TJ82avUH5i2sI6PS1hd0ax2sHPeua571UKB/Iw/bzclEHH/1rxBYz49t0gGp+9vgOIzakF6vl0+
	g0ojJoq7oictFItK1IftqmwjkM9+s+7D7HD16YkX2sREAgjLBXsE
X-Received: by 2002:a17:90b:2ec7:b0:3a6:d850:bf16 with SMTP id 98e67ed59e1d1-3b1679a3218mr1654109a91.23.1794316632444;
        Tue, 10 Nov 2026 05:17:12 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:17:12 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>
Subject: [PATCH v4 24/33] dmaengine: txx9dmac: route callbacks via channel BH
Date: Tue, 10 Nov 2026 05:13:24 -0800
Message-ID: <fff4c9714cd77cf2587ea8785b0e74a8145e123c.1794315350.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794315350.git.allen.lkml@gmail.com>
References: <cover.1794315350.git.allen.lkml@gmail.com>
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the per-channel BH helpers for descriptor completion handling on
channels that own an interrupt line. The channel interrupt schedules the
BH, which scans the descriptors and re-enables the interrupt, exactly as
the per-channel tasklet did.

Channels served by the shared controller interrupt do not initialize a
channel BH, so the controller tasklet keeps scanning their descriptors
directly, as before. Routing that path through a BH that was never set
up would trip the WARN_ON() in dmaengine_schedule_bh() and stall the
channel.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/txx9dmac.c | 10 +++++-----
 drivers/dma/txx9dmac.h |  1 -
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/txx9dmac.c b/drivers/dma/txx9dmac.c
index 04de7f7ef31d..5c4d6ee7d720 100644
--- a/drivers/dma/txx9dmac.c
+++ b/drivers/dma/txx9dmac.c
@@ -596,13 +596,13 @@ static void txx9dmac_scan_descriptors(struct txx9dmac_chan *dc)
 	}
 }
 
-static void txx9dmac_chan_tasklet(struct tasklet_struct *t)
+static void txx9dmac_chan_tasklet(struct dma_chan *chan)
 {
 	int irq;
 	u32 csr;
 	struct txx9dmac_chan *dc;
 
-	dc = from_tasklet(dc, t, tasklet);
+	dc = container_of(chan, struct txx9dmac_chan, chan);
 	csr = channel_readl(dc, CSR);
 	dev_vdbg(dmaengine_chan_dev(&dc->chan), "tasklet: status=%x\n", csr);
 
@@ -623,7 +623,7 @@ static irqreturn_t txx9dmac_chan_interrupt(int irq, void *dev_id)
 	dev_vdbg(dmaengine_chan_dev(&dc->chan), "interrupt: status=%#x\n",
 			channel_readl(dc, CSR));
 
-	tasklet_schedule(&dc->tasklet);
+	dmaengine_schedule_bh(&dc->chan);
 	/*
 	 * Just disable the interrupts. We'll turn them back on in the
 	 * softirq handler.
@@ -1108,7 +1108,7 @@ static int __init txx9dmac_chan_probe(struct platform_device *pdev)
 		irq = platform_get_irq(pdev, 0);
 		if (irq < 0)
 			return irq;
-		tasklet_setup(&dc->tasklet, txx9dmac_chan_tasklet);
+		dmaengine_init_bh(&dc->chan, txx9dmac_chan_tasklet);
 		dc->irq = irq;
 		err = devm_request_irq(&pdev->dev, dc->irq,
 			txx9dmac_chan_interrupt, 0, dev_name(&pdev->dev), dc);
@@ -1154,7 +1154,7 @@ static void txx9dmac_chan_remove(struct platform_device *pdev)
 	dma_async_device_unregister(&dc->dma);
 	if (dc->irq >= 0) {
 		devm_free_irq(&pdev->dev, dc->irq, dc);
-		tasklet_kill(&dc->tasklet);
+		dmaengine_kill_bh(&dc->chan);
 	}
 	dc->ddev->chan[pdev->id % TXX9_DMA_MAX_NR_CHANNELS] = NULL;
 }
diff --git a/drivers/dma/txx9dmac.h b/drivers/dma/txx9dmac.h
index aa53eafb1519..f2abedb73d49 100644
--- a/drivers/dma/txx9dmac.h
+++ b/drivers/dma/txx9dmac.h
@@ -162,7 +162,6 @@ struct txx9dmac_chan {
 	struct dma_device	dma;
 	struct txx9dmac_dev	*ddev;
 	void __iomem		*ch_regs;
-	struct tasklet_struct	tasklet;
 	int			irq;
 	u32			ccr;
 
-- 
2.43.0

