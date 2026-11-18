Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794990551;
	b=M613tj5VysWpGpIgAP5eS7OSGbjml/uBRop1P/UYSzq/gx+zGgF6WtyqET92qFsuvHGV
	 u8eb5RbMXxtxqqDlj0rb9tjjd07yc77lng7U11/PcuIh5nvZXqKV8H5CDSJya70a2gL3E
	 ezZGL9+KVzYmhXBSvSDa8wf8jc/fv5wORwkk287lZt9zyUiiT/lPzInW01ptg5OcxmLiu
	 KR0hj9H2YZUEyaeysHziuamrf35Eu91qQ6NTNSYQiclET4x9fte8HQni1KlMSVxMkPhL4
	 k2z7EICIinwnAXes8cVtvGpHTkXnbwAMEonJUfO5/WQUal6kx8tR5nEAoBjxM5WH4ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794990551;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9UGBPvO48P3EgdXF7lGcaY7uZ9DVFVaWCHXXjikO568=;
	b=uZiajYfSWPiBk3wVftFNydjBuWXMCUvG0ZJydfJBUu+/la95IIepTGxOBzMp5ws5wDGv
	 u4woVIEQMJ59nw+JwDnUDZ9t+viXrKOslZpxrJ+PVcp7/VGEcrNV4ycz5tgWmOtji7chJ
	 JpS46RkeG69yDJLlK5Iq1ppPJyc5BL0XfzGPO/3RIotHTU8rJst/9u8DhVYHnvw+Fz2zU
	 DDSlgAaUbduOKTHTvLP6clVgkr/4usqIhrvxIFHpEikSzWIwKdpZqQROADxWBNjIiFHY7
	 U0hxnvYs+U6aUFEJvnyVwlBV7HfiH2tfbIfRKpQSo1QGscU9lXfOu4/8Y2vjc5TiO9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cuk7bWkz;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F86606A32A
	for <dmaengine@vger.kernel.org>; Wed, 18 Nov 2026 08:29:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24F86606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cuk7bWkz
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8a4c72951b8so490393b3a.3
        for <dmaengine@vger.kernel.org>; Wed, 18 Nov 2026 00:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794990550; x=1795595350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9UGBPvO48P3EgdXF7lGcaY7uZ9DVFVaWCHXXjikO568=;
        b=cuk7bWkzMMm5x76oCo5yGlxbnQnQQiyj/9+xGoCzHelgE73VaiREeZ0xkR0PSNGHJH
         uti9RHNYBagVOenN4MN74Me5QLp2oOkcGTF5V0ONhIs5tiaxkzKrT1A2PZZVPwDMIiiR
         qLZjgeuXhf9lkh+8XBcA+IzR0jzsfhovUOj0FuStEWGRZROhZqsSvCXk0ZTla4gm6//5
         hoYC/VKHwjXxoLEPPxrDD9M1brVnmFax6vsf+zog4J+M1HKuFuruvVzLrYugEPVZryxM
         cxKM/7M6CxXo6S2C77W5PioobfmhLP8nUlhY+9YL8nyK2nQ6qrtNL8vyAaALRvaQjEwm
         BfOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794990550; x=1795595350;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9UGBPvO48P3EgdXF7lGcaY7uZ9DVFVaWCHXXjikO568=;
        b=zD911vYCKXgdQNEpXlJaMGKGfrCeN71zQ92b2ag8KWTSUAv3muy15btvNlFx4xyj8e
         +SNzI3fmb6shQsNhJgYz92fXOjKkL80YES4n+b8joRsU+Gmam3VV+IxykIav2fbqX6WC
         Zbx5pr8kFUfNUsKe62p9mZPORZA3dEWb/8o+Tx9eIDhFqLrj3UpaeGFiZpKZynGiR5sc
         e+ubaHlln9ci4eXhi+LVDciXUIX0yqOCBYl0ND16qKoWEj8CSlteXe+09SxQlmnFF37E
         /GKFEf4ODEksWU1h4uVfWN0lLNYLXny0erd2SxVNfUe4wH6wlDG1zAKX7yr6qzrRCCjx
         quVw==
X-Forwarded-Encrypted: i=1; AL+hErGDRQsLi/T6N1BTPxFy0Iq3PfIIIMpgF6sIAvSUpr3nlBO4ohUD8wNu3jupgVI+W6E3PbDlV+XxBzM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+d5v0Ljhpf//HHv+BYYgXwwa4Wr7+owNtqaSotQza6kPl8uxza
	9ib67BMmGdJ+xj58wJJoGdlH5Gx2tXN1IbFeRfFCJg5wydS8RoMeFhUq
X-Gm-Gg: AYBFou1U4L8Z8M8yv+f9Jyo1D1Cc+6LKaymsr7+859Wwc21pdqi3A+w1iAwwhrnKK7X
	yqwwp+NcnCKbIoJ/S+Y21Gmhj7BtDdeSkrVZZ4cvOUC/G+F/ZwumSzWh5pQfPJZgyUsql9rsbHN
	XTygRvegclncxqCjg7VI4fSBXBYiSIpX89lDKqR/rU4OitZ9E2LzumElyTAF1Yg29VgWpuN7MSz
	9dTHnDRp+paXG6fQo6A9t/9+0KdkSGWPYQfN5EAJ4272PEMyZX0nrQvvExEGLqRsfHIdkI5KuK8
	AZgDukYaIPJVPgslPZV6u5AeeU6hEuov9p6Df3crJ50+lYRp1epRcunIEOlv2ZOey9Bi7X6/3TO
	cSGpBj3j0xHlHQVNQ2S8UdYD7+3Jj8tRQ3yA2NStyI/NXTB+nlV6K7RC0n2dhH7M6XL+B7UxX3Z
	qVoYl81lODt/Fm1MclCFcQV3GjUbwwJTUK+AFhbwGM++CUSMalUlf9RLUnp0Ut+euRqEGaxivbi
	/PzBVcxQmCylE8L5ha0C5WQqmnrK2aLYw0R7rYsiRD0kIEviE0iibHUIOIpApHeEmrtqEzgJ9FP
	qlpv/89zjq0rBv7dquRuzLg/M46jOJhVM7xSbeGqbnA7dX8l2Q==
X-Received: by 2002:a05:6a00:1da0:b0:899:5183:acdb with SMTP id d2e1a72fcca58-8c5d0f24a1fmr1572117b3a.1.1794990550197;
        Wed, 18 Nov 2026 00:29:10 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5cb35db4esm784426b3a.35.2026.11.18.00.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:29:09 -0800 (PST)
From: Hyunjung Ko <hj351016@gmail.com>
To: =?UTF-8?q?Am=C3=A9lie=20Delaunay?= <amelie.delaunay@foss.st.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	dmaengine@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] dmaengine: stm32-dmamux: don't resume runtime PM under a spinlock
Date: Wed, 18 Nov 2026 17:28:53 +0900
Message-ID: <20261118082853.926607-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
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

stm32_dmamux_route_allocate() calls pm_runtime_resume_and_get() while
holding dmamux->lock with interrupts disabled. The runtime-resume
callback stm32_dmamux_runtime_resume() calls clk_prepare_enable(), which
can sleep, and the device is not marked pm_runtime_irq_safe(), so this
can sleep in atomic context.

The lock does not protect anything here: the dma_inuse bitmap is already
updated under the lock earlier in the function, and this second critical
section only wraps the pm_runtime call. Drop the lock around it.

Fixes: 4f3ceca254e0 ("dmaengine: stm32-dmamux: Add PM Runtime support")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/dma/stm32/stm32-dmamux.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/dma/stm32/stm32-dmamux.c b/drivers/dma/stm32/stm32-dmamux.c
index 57318715d9f3..890328b3d302 100644
--- a/drivers/dma/stm32/stm32-dmamux.c
+++ b/drivers/dma/stm32/stm32-dmamux.c
@@ -139,13 +139,9 @@ static void *stm32_dmamux_route_allocate(struct of_phandle_args *dma_spec,
 	}
 
 	/* Set dma request */
-	spin_lock_irqsave(&dmamux->lock, flags);
 	ret = pm_runtime_resume_and_get(&pdev->dev);
-	if (ret < 0) {
-		spin_unlock_irqrestore(&dmamux->lock, flags);
+	if (ret < 0)
 		goto err_put_dma_spec_np;
-	}
-	spin_unlock_irqrestore(&dmamux->lock, flags);
 
 	mux->request = dma_spec->args[0];
 
-- 
2.43.0

