Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792617207;
	b=pgOdJeDk0uAGGJ9/IXbFDdPo8tMeYwiAQ1U+5nvwQNWi81+8UrXTIrf7sIei/fgMSYfj
	 biO2QMXWPHLBjp41U59VPpZyC96I7r99XPnMVHIkwxs4upsowAGxy5Dex+xVEpKEVs7rM
	 q2pPBJcqYG3Yz3/T61rKOr0lEKaGveo8+BXA5LSt7F+sEVrFPE0cQO5NoIs/UJQsCzv92
	 bysH1+r149QuugLLLPlk3vtL5augHKKbfPplYBhS5SlAYFTcnqve4FuRWjVeARErz/h65
	 7uRbnaUSViYjbzpAYQ4J9t2B7WiBXsl7XPJi+2CMO5CWzDYnRborSCGEIDt7PblQHKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792617207;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=/7ngeHbVYERGvM2jFGnKfOGGvB7UaeEskne35/Ksbe4=;
	b=vMyX2st/HkxP3l6FJhCv32W7lliQ96L6T0as1lJfKsGZl0nU2uEqQu90RN3zz4OQq6C9
	 JxLiqbLPwSQiF/+07yxf94DJNxDryv+YMP48613bJZcbmWX0V+3HVUKUMjxkhtbbmuEou
	 hjD3o6whVlF3Qg4bq0/6Guq1SppBnYKykLHwfY+mhHK1AFxTBC/VPl5T1+iz5CAkHOlfQ
	 vFETvB7jZczie8e0n33wgZk0rxChWCJ/GcF77KYpbM8iQJ4qwNMfERH6I1HMkE+9Is0Rv
	 p3s/YVKzy20rb2++u/7eAiRHd7VVV7Rdjz54luaa7kIicoXT41A87/rVGLAN3EvmiYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nXBxexHO;
	arc=none smtp.remote-ip=209.85.210.51
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDFB606A319
	for <dmaengine@vger.kernel.org>; Wed, 21 Oct 2026 21:13:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CDFB606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nXBxexHO
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-81ba09a5d23so1117068a34.3
        for <dmaengine@vger.kernel.org>; Wed, 21 Oct 2026 14:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792617206; x=1793222006; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/7ngeHbVYERGvM2jFGnKfOGGvB7UaeEskne35/Ksbe4=;
        b=nXBxexHOKlOPbmS+f73MXn9AAeg37WWhsukvk/EEljTr/RmjADJfk1hxNV5fNamtQU
         0VGdRUdivQ0ie+pZtDaodRtq1/260bP1B0O6LPh0catbldbRXtoUQjxM4CAyUkXMS5Ef
         yuzJ76g2o/UaMxeR+td6gR2cNb05kmqOwpLx3wozI/S2jpY9+Tt4xa+e7xF9BYArkbK0
         6x8My1bGfCh1cMqe4b5h0GuXyxorTX01HbdDzq+zwJXAQ1dk+UaSizRn5t0J5oAZrrQj
         eKWlxnhmt4MSj4m59D0KpkDNde+2hYnenMbPTYZpSX4H5+Tw1doFN7gijWDZEOfLkIMe
         0Ekw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792617206; x=1793222006;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/7ngeHbVYERGvM2jFGnKfOGGvB7UaeEskne35/Ksbe4=;
        b=BtjB4TuIwcyUDpOz6Eys0qXQ7gKQN5BNsxX5LAT/Eh/qoovZObw0LrPvct5NFJcKfL
         XOSLiQafrla4rLs0+yoNwFgCox7QXG1hCDFWasugysBZuz0uMJ/AfMRyKWS/oiQC9x3O
         k7YBUYWJTBp/g1yhNwfiGz8D7mfC40tOWXwAWTg/epEI0bltSw3aymAEiKHTaX6rbKbK
         9s2XWsMMPDjBFI5LdMSoFoLDg0xA6jVjq/ZP8y210pEJDel8tI3jQKDE5AjvGB9l1gre
         JnY/6QgwCTCjyc0gFVAchoqfUTsrlqNkznLc/a14CfI8bTcSGjvNWkZNAV+LW1o8w3v9
         wXeQ==
X-Gm-Message-State: AFq9FYIO2H/8Q/sHK/K2oDsj3VgryT1ekv2ieXJ7FOKqteCqS0yN5Y3r
	2uzlIaGT9RVJ01KtPuWzJRPn3Es9+Txj7v16I3rTym5hP3F5rqYZIq9w
X-Gm-Gg: AYBFou3fIVMRqn4I7umO3YqPE3DbQr5zvdGe7M7H8Jovm5VzJPD+7pdP3raNKtwt1Tx
	9AUyzMwDC9r8z8PHuqdpasQO5msGn5ipk8ngWwI1bzgCOgdwAqlfyAcvvjCQFIa4zb8rTq3gY64
	L08ff6WVb4jr/xHo7k+FMdg2UHg5dU0sSFdCTkbBp67QSBZjcjo1uzuvqSrEm/ASaW0k8EHr04+
	WbtMbraBuMXX/N17mM0ScaY/ygNBpxR09vKjrI0veK5xSF8wR6dM5uN2Je6WPqQmagrHpWplPJr
	QSgT5ABKfbLzdg0+txXSXDGCBukzAGHLq7DrnD9AqyhriQFOKJTkpYswWyXQ3P5yzn1y1ZGHBli
	BXOFu99gaCy6wKhJjSbekpJCFMhJosjd+uixrRXJ9bLt2ASOVf93M/b/XS4e2UWdJI703/oW/3l
	Zm7dIx1rFBV+T5dpZoGTd+d3b/iIpiAAJ0fFzFozzOxcdicfEXQYvXQWJ/GlJBkHkWrM/qpc3vp
	AR5JPUtqLBJwaXfvcz8FuLdy9TdJC/S3CpDet8rWaaArzI1WtTBn+oxr/tiF0iTQ//c2cdX0AhI
	h3pJ/QX7w+N4SlytuuqOcgGQ5A/PeTtZXFK/EOuCHxPC/S9UHzYykOa90GFc3DX7RXu5GppYkxb
	hjgYla/8dPrDcersuESc8aCaYL4yoCwLLrVkGxyu72LTqmyNol0aj4M1nQdSwQX8FRVB+MEWXNB
	zzt9g=
X-Received: by 2002:a05:6830:3495:b0:806:9a8d:4b9b with SMTP id 46e09a7af769-84d0890bfcemr2646685a34.15.1792617206105;
        Wed, 21 Oct 2026 14:13:26 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84cbcdd9d82sm3219421a34.10.2026.10.21.14.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 14:13:25 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 21 Oct 2026 15:13:24 -0600
Subject: [PATCH] dmaengine: mediatek: uart: synchronize completion
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
Message-Id: <20261021-submit-mtk-uart-dma-synchronize-v1-v1-1-4f7718cfef41@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNwQ6CMAyA4VchO9u4DVHiqxgP26hQzQrZBlEJ7
 +4mx79pv64iYiCM4lqtIuBCkUbOoQ6VcIPhHoG63EJLfVZSK4iz9ZTApxfMJiTovIH4YTeEkem
 LsChQTevaWta2uZxEhqaAD3r/n9zue2fliS4VuWxYExFsMJkpo2wi98R43O+27QdSLGkzqAAAA
 A==
X-Change-ID: 20261021-submit-mtk-uart-dma-synchronize-v1-158c8303b574
To: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Long Cheng <long.cheng@mediatek.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Terminating a UART APDMA channel waits for its interrupt handler, but
completion callbacks run in the virt-dma tasklet. A callback already
removed from desc_completed can still be running after termination
returns. With no device_synchronize hook, dmaengine_synchronize() does
not wait for that callback either.

Implement the hook using vchan_synchronize(). This lets clients finish
asynchronous cancellation before reusing callback state or freeing DMA
buffers. Keep the callback wait out of device_terminate_all so it can be
performed without locks acquired by the callback.

Fixes: 9135408c3ace ("dmaengine: mediatek: Add MediaTek UART APDMA support")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/mediatek/mtk-uart-apdma.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/dma/mediatek/mtk-uart-apdma.c b/drivers/dma/mediatek/mtk-uart-apdma.c
index f74e9a328588..7583c287da5d 100644
--- a/drivers/dma/mediatek/mtk-uart-apdma.c
+++ b/drivers/dma/mediatek/mtk-uart-apdma.c
@@ -440,6 +440,13 @@ static int mtk_uart_apdma_terminate_all(struct dma_chan *chan)
 	return 0;
 }
 
+static void mtk_uart_apdma_synchronize(struct dma_chan *chan)
+{
+	struct mtk_chan *c = to_mtk_uart_apdma_chan(chan);
+
+	vchan_synchronize(&c->vc);
+}
+
 static int mtk_uart_apdma_device_pause(struct dma_chan *chan)
 {
 	struct mtk_chan *c = to_mtk_uart_apdma_chan(chan);
@@ -514,6 +521,7 @@ static int mtk_uart_apdma_probe(struct platform_device *pdev)
 	mtkd->ddev.device_config = mtk_uart_apdma_slave_config;
 	mtkd->ddev.device_pause = mtk_uart_apdma_device_pause;
 	mtkd->ddev.device_terminate_all = mtk_uart_apdma_terminate_all;
+	mtkd->ddev.device_synchronize = mtk_uart_apdma_synchronize;
 	mtkd->ddev.src_addr_widths = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE);
 	mtkd->ddev.dst_addr_widths = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE);
 	mtkd->ddev.directions = BIT(DMA_DEV_TO_MEM) | BIT(DMA_MEM_TO_DEV);

---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20261021-submit-mtk-uart-dma-synchronize-v1-158c8303b574

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

