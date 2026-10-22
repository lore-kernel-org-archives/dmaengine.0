Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792698060;
	b=deY0vwIuTpcTdr0UtLJ8ExZjHwNZemj4bmTar4gc73jAnssTEJzczcyWvS3Be81NQs/B
	 QwzDZihUSytmaCwdt7N6C7RcNTxEKVcajpv+C1B0z+923zohqSoBmYxqmqCNQ0LepGZaf
	 /KN5bhA0nulmOOyuNcZEYAHYp3NMLpIwZD3M88ti7/XoKH7lxmp5+Q1RMqGOPArlUehOc
	 OYiSNLowoFvox9UyKjVtZ3aaB3qvsMXUqux6IPO6TQtwUNax5wPSvjHZP3hj9qCTpNUnA
	 0hoGcQ1XBK6YVOU642ct2uaV10aqiWVg6AyoxBTlciJaz+eYKZqeJEmQzqRcdXNZE1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792698060;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=rMu7gYcxvQNy61MemzFOFXFmQujG4mGCgZD776uY0wk=;
	b=CZiWY7ewgtYDJ03EKFtmTQLLhGtj+Twq4FoA3ZQupe3N7mR26Qwznzd1B35MAhXMiPSt
	 L+481Eu1JwwyiK1EAZ7mnW1Md57LQK8rdeI2TyEH5lnTNP4WfnjD780cosAzUn5Kl+GD6
	 Akt3ga2xgNT7+ph7Z4h/idu/xxI++WHlvOoqGi3tEocXyGp5qKFYcCSKobq9FwGBTJG6n
	 0BeQjqNbHbCt5YEq0qhQfjWsDQVbtFElQe8Gx2aoqLLV9Z/DTeFrVuKmI1qdjBJaBMu8M
	 bO3We/tCBmXEtHI8rABKIM/VSn5UzUl1lIsVScck9J3hbdu8M55Z6KOIwY2+KFpDFYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kfRYEeIa;
	arc=none smtp.remote-ip=209.85.161.52
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0381E606A319
	for <dmaengine@vger.kernel.org>; Thu, 22 Oct 2026 19:40:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0381E606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kfRYEeIa
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6fe4372c5f3so106938eaf.3
        for <dmaengine@vger.kernel.org>; Thu, 22 Oct 2026 12:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792698059; x=1793302859; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rMu7gYcxvQNy61MemzFOFXFmQujG4mGCgZD776uY0wk=;
        b=kfRYEeIa7DkLyy5+7TTOAJvwhXxE09LCxrE8jesDq+E8ioWfi9aeMvlnUFx6uaB3E6
         fFJWWNuSRiv0sRkQAAh6NZhIp/e7uDCjcDbZruZWVlchkaXjxGqihaQWOQ5zKouAMbQf
         /uKVmCpFhEuZZlaaNIKG9JBFfOgdUphRTS3ZqMwBuEZloS3iqGKulzKODVfglsl+dCkz
         KYk7y8B3HA7SvVrpYWVgTbxorLEpxIrrmiOlJnBFaqzb/tOBS0q/WBGEuhh3nnjyGZCD
         Joy7OcPErsmlhdsuBNx8tq8ut2RfMl2QXUhV8DmiHIp0dbcSDfowUbWedb2Eh5QHjLYM
         UUtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792698059; x=1793302859;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=rMu7gYcxvQNy61MemzFOFXFmQujG4mGCgZD776uY0wk=;
        b=yHky1H7QnLBk9PsaH+S7DKJsOj0FiTmT9YfRv1CThYlhAD8xrnxEFkozxyL6MYkBz0
         nEyHHH31rERl5G9YSSaiCe/s/x1u6xs7jY38yUB0SiYx51dh4B5tTM/nPKk4HC6SC8+J
         lXtuIHzHeCG9N0M5eSMuQSRdm33Jt1/zkjr7ZysLaGZEDZbTKEXByhRCdRvy6wy4XDCR
         20FVarVi1YOCMQGaq8vKb9O+4wwM3FdEWugVSkaHpC2/o2vVffCP2IdPczViKp1gFNVW
         MCVMSO1X3Et+RZk2Dd/AzpStrR+ZeXD+Ee15roMGdFRlO7l1CoPoTfmJlceZ6BzpWPcx
         3l+g==
X-Gm-Message-State: AFq9FYK8sMU3iTMqrrZ0ZcKPtsH91jvS+avwJM03JvttpM46eXeuo50N
	jhT2XYSYyM9vfmyPgnz8k04Rd6N2ESXEiupEdi+4LmN8yNC5ix04rreX
X-Gm-Gg: AYBFou2p0HqaWYDGyeJ9iWNn2Tdrk1elzLK/iYFl2+m9JIHo7oednVyLeR1ozqZcEDP
	bDldd5iFSM9iM6isxvbs2If66y103BPR54tZhfIRcKocC69nPKadeXA/P2zulF5C54a8ob1Nu06
	LUSreBc4YHp0C1gwpb2T0SEqiRxY8piZSaw8QfthAqRZRqYODE3ps3M6HoA5iD8IN3zfKA4GEY7
	uV4kCcyPBHSBq7Y5KFd+rfZ+s2Ojgk99hDW8zSc23u5QRRCoxR4FLLrTogN6UM2oJAsD4qQNDoh
	7BlvtsQ9A1SnqUzy3ljmUVHi2yOMQZ27P0POI0I8X2SgnEhgppqciS4d54ken8z1P8yx2xMmIYc
	HSuwtYtUIKGG/clyOb+Yo/pVOecsC1ZeNVb6iPXGBOvwt9wN4ty2VOPjRslinzNqQGYypZ6zIQ3
	VUwcDyoHDK7g19aNxoRqA5Nz5LjFsBBOmkXIJ+OIdPJRqgIjieHdJCPGmUfn3MU1J32P+laPuLE
	CBE23pozsPhviXjYloA4f+sjAmEKkuCA/kufZgJvyn6P5gKYR5lrpuQvRxcJSrCXYSx042G0gxM
	CqpUTw0k66uq/a1VvVE0Zt9Qz9bxE8R7Rj+yIadJtLxxUSVWWAWKlMjAk4U18gUGhTpqWzxTWlE
	UeIn5p+RK8/X1LGCEaWSiZ4zNg+US0HdPmlUT3SfNXY+FXLpUewKqlY4yWyagiKst974GkL1eG4
	7N5hmGTwcVwUd6wQYMDCUb02Ey
X-Received: by 2002:a05:6820:6784:b0:709:8fcf:6d9a with SMTP id 006d021491bc7-70b88aefe41mr234594eaf.78.1792698058797;
        Thu, 22 Oct 2026 12:40:58 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70b8b2c4561sm42639eaf.9.2026.10.22.12.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 12:40:58 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 22 Oct 2026 13:40:54 -0600
Subject: [PATCH v2] dmaengine: mediatek: uart: synchronize completion
 callbacks
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
Message-Id: <20261022-submit-mtk-uart-dma-synchronize-v1-v2-1-fdaef0e2edd6@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOTQ6CMBCFr2K6dpTyI8SV9zAsShlg1LamLUQk3
 N0WTuDyTd775luYQ0vo2PWwMIsTOTI6hPR4YHIQukegNmSWJumFJykHNzaKPCj/hFFYD60S4GY
 tB2s0fREmDryoZJUlWVOUOQugt8WOPtuTe73nQHmg9JEcG41wCI0VARNPgYm6J43nfRcaAzlv7
 Lx5TjyS/lKKVpB3Zckr2WGX81uvBL1O0ihWr+v6A72DrsYIAQAA
X-Change-ID: 20261021-submit-mtk-uart-dma-synchronize-v1-158c8303b574
To: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.li@oss.nxp.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Terminating a UART APDMA channel waits for its interrupt handler, but
completion callbacks run in the virt-dma tasklet. A callback already
removed from desc_completed can still be running after termination
returns. With no device_synchronize hook, dmaengine_synchronize() does
not wait for that callback either.

Add vchan_dma_synchronize() with the DMAengine callback signature and
use it for UART APDMA. The shared helper wraps vchan_synchronize() so
drivers can assign it directly to device_synchronize. Document that the
termination path must have stopped the channel and prevented new
callbacks before using it.

This lets clients finish asynchronous cancellation before reusing
callback state or freeing DMA buffers. Keep the callback wait out of
device_terminate_all so it can be performed without locks acquired by
the callback.

Fixes: 9135408c3ace ("dmaengine: mediatek: Add MediaTek UART APDMA support")
Suggested-by: Frank Li <Frank.li@oss.nxp.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v2:
- Add a documented vchan_dma_synchronize(struct dma_chan *) helper in
  virt-dma.h and use it directly as the UART APDMA device_synchronize
  callback, following Frank Li's review [0].
- Link to v1: https://patch.msgid.link/20261021-submit-mtk-uart-dma-synchronize-v1-v1-1-4f7718cfef41@gmail.com

[0] https://lore.kernel.org/r/atoz6M7RHU14_a3J@SMW015318/
---
 drivers/dma/mediatek/mtk-uart-apdma.c |  1 +
 drivers/dma/virt-dma.h                | 15 +++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/dma/mediatek/mtk-uart-apdma.c b/drivers/dma/mediatek/mtk-uart-apdma.c
index f74e9a328588..6bc4f20d8b06 100644
--- a/drivers/dma/mediatek/mtk-uart-apdma.c
+++ b/drivers/dma/mediatek/mtk-uart-apdma.c
@@ -514,6 +514,7 @@ static int mtk_uart_apdma_probe(struct platform_device *pdev)
 	mtkd->ddev.device_config = mtk_uart_apdma_slave_config;
 	mtkd->ddev.device_pause = mtk_uart_apdma_device_pause;
 	mtkd->ddev.device_terminate_all = mtk_uart_apdma_terminate_all;
+	mtkd->ddev.device_synchronize = vchan_dma_synchronize;
 	mtkd->ddev.src_addr_widths = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE);
 	mtkd->ddev.dst_addr_widths = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE);
 	mtkd->ddev.directions = BIT(DMA_DEV_TO_MEM) | BIT(DMA_MEM_TO_DEV);
diff --git a/drivers/dma/virt-dma.h b/drivers/dma/virt-dma.h
index 59d9eabc8b67..f1fc3bf48275 100644
--- a/drivers/dma/virt-dma.h
+++ b/drivers/dma/virt-dma.h
@@ -234,4 +234,19 @@ static inline void vchan_synchronize(struct virt_dma_chan *vc)
 	vchan_dma_desc_free_list(vc, &head);
 }
 
+/**
+ * vchan_dma_synchronize - DMAengine callback to synchronize a virtual channel
+ * @chan: DMA channel to synchronize
+ *
+ * Use as device_synchronize when device_terminate_all has stopped the channel
+ * and prevented new callbacks from being scheduled. This waits for callbacks
+ * and frees terminated descriptors through vchan_synchronize().
+ *
+ * Context: non-atomic context, with no locks held that callbacks need.
+ */
+static inline void vchan_dma_synchronize(struct dma_chan *chan)
+{
+	vchan_synchronize(to_virt_chan(chan));
+}
+
 #endif

---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20261021-submit-mtk-uart-dma-synchronize-v1-158c8303b574

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

