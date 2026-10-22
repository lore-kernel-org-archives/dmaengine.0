Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792703909;
	b=L/RTGMDVK1KvGSb/UtceYjm7rrqY6mCbnEEkb5Xm6GMtUkyZ0+VWAgv2OsGGZyG7Y4cd
	 vBOgzXKcFUUgy2XxlavMFjfIyUlA/RjUy0m0Mius2nEL65gG/HlK2bqkwZjDt2yQEaAur
	 LrylQvRmZd6UezLkesuLjnhWx/tGFW+vepBydW+CJeDlwAb3/1Yzlt8ALuRe4w43KuKPK
	 0wLCYF43+F4RJrBB19EQM9bOP21ybexeFfzERfoUANVqj+efAgD0qkk+Fs8o/N1CWAqds
	 nqMArZifBHNES3vT5DKaInx6YAs1Lper2x7iJFMmnXSo5UIa+DeeCCujPfqd/TGXe8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792703909;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=WsTLwSG0j0rvcPTxUloruhaWzU98+XdsMcTu8lqR+tY=;
	b=aJhkbnxP1OlDMdWMtLcZ4Oyr98Pu/N30aAxRsHF4JehVKjhUxo0wSfxWMW93E2T5jQlb
	 SjPGFT1hcWrAz8DaEyRY88J4yhcp3Y97B/dSn8K96MkNeD7q44FG9af2MFmth328bIiu4
	 o1J2lTb0C1/0PxQG0tLXTgfDkZX5D+m/eIUFK2sHIIl8tgPpAyXjyezKSTg+sNSjn51s3
	 //dpTB65PxrKTv1E5ZAUFWBbI2wmoYMLtzv7u3FZWpzlJrGKLWw47vY0IsMc9ULKcVcBY
	 ATcaIkbW0Q3Z/NOgODF32D8yFAtpU3IIL2F5mjnYlCvXIp0OnQq/nfevIzfgvt2ATig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=feedwtV4;
	arc=none smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55385606A319
	for <dmaengine@vger.kernel.org>; Thu, 22 Oct 2026 21:18:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55385606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=feedwtV4
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6faddda49e7so206429eaf.3
        for <dmaengine@vger.kernel.org>; Thu, 22 Oct 2026 14:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792703908; x=1793308708; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WsTLwSG0j0rvcPTxUloruhaWzU98+XdsMcTu8lqR+tY=;
        b=feedwtV4TJjqKCyepFs1ntK4KQAHY19WFwsBXYfd9S5IR65Z9uCdA8YDMvirAtZhfg
         4WpAq7mYG6z9xz92B2KFaBF5ZdhoCXWC0Sr0NP2i774o1Ghfi/J9iTZYX5pTEKzEra/C
         up2vtzJfR0gL+fy1QFpY/qlEjXWJJHKlxZZpd7jTeVaczLgbSopKUGjUSMPCTE6uqHf1
         00sV1w9VX3dyd5f2iIHkHVViyfBMIigBcv5aX/JkSv5AUZoXjX7GpxLpP3t1RxL76Shf
         2jBi+9s7Ftq4rAqK1klP0P2t7+gqh5J26ra9gdvlusLyArE8iIpp9NNnCMRBiEmgqLb8
         Iaew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792703908; x=1793308708;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=WsTLwSG0j0rvcPTxUloruhaWzU98+XdsMcTu8lqR+tY=;
        b=jgOGq+nn1Q3RgGS7JzPJPxwGRcuwDF5kFPspb7vlV4aPMlz9750zPT+zk9UndMhlwr
         HJwdUKzbrPIvjLV4IdCC+aB+yjZAplHJM1CzGmBTbeJZilTyAGEw1VifA0TYvq5VTH7S
         gBsD/32BqTP5WJTi50LlntnLwTrc4JJm2rpNL5YZiF9AEstwuVdP6iFvLm0Ez5lVgHdM
         va8DbTTcD1QDJJ2xcwklkQsswXe26qPqXDMBs8ZcR3PXDW837LRksAUpCKzBpe64BujS
         oyaYTILW/qJRKoX/+IquqEDb9reHOI8hEI2HfDZca94v4iJKsJaYGi/BwEBygUTNEa0j
         2M4A==
X-Gm-Message-State: AFq9FYJtJod0CO9wWIlFG6A7hcNv+4cZ9WsnF0SvG0bhDqiVKl+yc6FE
	WbCXLgEqnznEDiEEw6Wdxbc5aDrbYAzYWUd930142eDv3MGJNh32OHw8sJL8xjEH
X-Gm-Gg: AYBFou3tsd/u0ughwh2FlxZkxU+EuhXpjOosqy/DWsJngg9nqyjN7+PYAObbGHzrhvK
	g0TlFfXyRSyKWgdtwmBdpYcnRgM0mgDjbBvfXtKHyVB/Qezc1LIwiVwIWZWKXY4SOU+uIv9xHnY
	ShM76PdcXp+Yy6C0trcumawEC5Wg29F2bdL/H2Txl3k+lrlt5eR6byAjt9WOw9sI0FybnrZIH8n
	xn+PNIC/sF0kBb7S0e2dWwG9WI709PCJdn8eKgl4mSbK80WuVXzT47FP4/RMVnVKAHDPKSnoRqs
	oq0xV9WJy4cPmW3ImqdtB75UGS02L5GlkBkQxyv86JGmM4+yr6jLBUGCuWYYQKInOrhl6c+vdj1
	a7xircPrn3eRxmjLv5wPWZY4rbFl4HwwfyvSi6cXKT7hBBI8UaZQJYfdBOZz7Xr98dN2TbbOdRn
	i7zuZFEU2Q3LbYpp1URbRx9VXF73oLsF6xBhBIZAbZXWeSZ/kCOd4dvi/uFXXzko+Y7hpVTGSiF
	vdH4BBEpwztj6vVgLXe1syo7LnPtclWGJGoZ0aMX/PkTnqfr/+iGGfq+G+Nohxq9BB0wIqz+J44
	myTj4w7xsmM1yPt1ZRDZZqwuDkZFpTn1hmi9SQr4esOa4XZ9sPo/BfO4/e6514tagNAiNPbpRi8
	6Q7zF6QyIB//OgSwNfuhQwqagDx1iHT/km3RtgSJyPWg9NcXeEGQxHV9iE9CcKmmszNx/8tOwSY
	89i9M=
X-Received: by 2002:a05:6820:3287:b0:709:529a:477c with SMTP id 006d021491bc7-70b88ac1066mr386352eaf.87.1792703908193;
        Thu, 22 Oct 2026 14:18:28 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84fbd362c1fsm250873a34.4.2026.10.22.14.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 14:18:27 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 22 Oct 2026 15:18:26 -0600
Subject: [PATCH] dmaengine: mediatek: uart: make channel termination atomic
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
Message-Id: <20261022-submit-mtk-uart-dma-terminate-atomic-v1-v1-1-aa498ba5da25@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNwQqDMBBEf0Vy7lITS8D+SulhE7e6LYklWUUQ/
 71JPb5h5s2uMiWmrO7NrhKtnHmOBfSlUX7COBLwUFiZ1ljdGgN5cYEFgnxgwSQwBAShFDiiEKD
 MgT2sGnRv+66zFunmVbF9E714+z89nicX1Zu8VH1tOMwELmH0U42KmOLIka7n7jh+D1/b660AA
 AA=
X-Change-ID: 20261022-submit-mtk-uart-dma-terminate-atomic-v1-19693366ae4c
To: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The 8250 transmit flush path calls dmaengine_terminate_async() with the
UART port spinlock held and interrupts disabled. UART APDMA termination
uses sleeping register polls and synchronize_irq(), which can also wait for
a threaded handler or for an interrupt pending on the calling CPU.

Serialize the stop sequence with the interrupt handler using the virtual
channel lock and use atomic register polling. A handler that was waiting
for that lock must check interrupt status before accessing a descriptor:
termination may already have masked and acknowledged its interrupt. This
allows termination to retire descriptors without waiting for the handler.

If the channel does not stop, return the timeout and retain its descriptors
instead of freeing state still owned by the transfer. Continue attempting
STOP after a flush timeout, since stopping the channel is sufficient for
termination even when the flush could not finish.

Fixes: 9135408c3ace ("dmaengine: mediatek: Add MediaTek UART APDMA support")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/mediatek/mtk-uart-apdma.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/mediatek/mtk-uart-apdma.c b/drivers/dma/mediatek/mtk-uart-apdma.c
index f74e9a328588..73d4b701ac85 100644
--- a/drivers/dma/mediatek/mtk-uart-apdma.c
+++ b/drivers/dma/mediatek/mtk-uart-apdma.c
@@ -256,6 +256,12 @@ static irqreturn_t mtk_uart_apdma_irq_handler(int irq, void *dev_id)
 	unsigned long flags;
 
 	spin_lock_irqsave(&c->vc.lock, flags);
+	/* Termination may have acknowledged an interrupt before we got the lock. */
+	if (!mtk_uart_apdma_read(c, VFF_INT_FLAG)) {
+		spin_unlock_irqrestore(&c->vc.lock, flags);
+		return IRQ_NONE;
+	}
+
 	if (c->dir == DMA_DEV_TO_MEM)
 		mtk_uart_apdma_rx_handler(c);
 	else if (c->dir == DMA_MEM_TO_DEV)
@@ -400,10 +406,12 @@ static int mtk_uart_apdma_terminate_all(struct dma_chan *chan)
 	LIST_HEAD(head);
 	int ret;
 
+	spin_lock_irqsave(&c->vc.lock, flags);
+
 	mtk_uart_apdma_write(c, VFF_FLUSH, VFF_FLUSH_B);
 
-	ret = readx_poll_timeout(readl, c->base + VFF_FLUSH,
-			  status, status != VFF_FLUSH_B, 10, 100);
+	ret = readx_poll_timeout_atomic(readl, c->base + VFF_FLUSH,
+					status, status != VFF_FLUSH_B, 10, 100);
 	if (ret)
 		dev_err(c->vc.chan.device->dev, "flush: fail, status=0x%x\n",
 			mtk_uart_apdma_read(c, VFF_DEBUG_STATUS));
@@ -415,11 +423,14 @@ static int mtk_uart_apdma_terminate_all(struct dma_chan *chan)
 	 * 3. set stop as 0
 	 */
 	mtk_uart_apdma_write(c, VFF_STOP, VFF_STOP_B);
-	ret = readx_poll_timeout(readl, c->base + VFF_EN,
-			  status, !status, 10, 100);
-	if (ret)
+	ret = readx_poll_timeout_atomic(readl, c->base + VFF_EN,
+					status, !status, 10, 100);
+	if (ret) {
 		dev_err(c->vc.chan.device->dev, "stop: fail, status=0x%x\n",
 			mtk_uart_apdma_read(c, VFF_DEBUG_STATUS));
+		spin_unlock_irqrestore(&c->vc.lock, flags);
+		return ret;
+	}
 
 	mtk_uart_apdma_write(c, VFF_STOP, VFF_STOP_CLR_B);
 	mtk_uart_apdma_write(c, VFF_INT_EN, VFF_INT_EN_CLR_B);
@@ -429,9 +440,6 @@ static int mtk_uart_apdma_terminate_all(struct dma_chan *chan)
 	else if (c->dir == DMA_MEM_TO_DEV)
 		mtk_uart_apdma_write(c, VFF_INT_FLAG, VFF_TX_INT_CLR_B);
 
-	synchronize_irq(c->irq);
-
-	spin_lock_irqsave(&c->vc.lock, flags);
 	vchan_get_all_descriptors(&c->vc, &head);
 	spin_unlock_irqrestore(&c->vc.lock, flags);
 

---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20261022-submit-mtk-uart-dma-terminate-atomic-v1-19693366ae4c

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

