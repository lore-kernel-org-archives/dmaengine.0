Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7CC3D2FFC
	for <dmaengine@vger.kernel.org>; Fri,  5 Jun 2026 22:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780696918; cv=none; b=T06WE+Ab5ISAg07uOaiyBuD9eTWqRRYj8herq06lm+iPOA4kNsQXQJQraR48bqnC8YzfWE4gjDnVU5LyoX8Vai0t06T1MScqprAgotqxpRBUrn9mnRhU2qlXHBD+/Bf9y2m6miNeNmXymHjMIpx9cNBUm+WM+kskoMeufowABo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780696918; c=relaxed/simple;
	bh=dv4UoT3DiDLV5e+jIsTNR9SdROP2j8QTT16qF0sniOo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BXun7vAlsKgbKUPdIvmHlY1xNxKZGfOwSSaNeR6DA5OCgLIwRabYguCShc48dF/2d0hPNAUo7n0H9mR48uSXm4jM9VlZesp6B2tiuDycjnxf4nAIpiLlaEz5mYmsxUHe5oJVwLoG2Ua64As/EmyB9uFph4B7EutIxREt539bvEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CvcTHSUW; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CvcTHSUW"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8423f420455so1088305b3a.3
        for <dmaengine@vger.kernel.org>; Fri, 05 Jun 2026 15:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780696916; x=1781301716; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+5mTbmbGFqfQuWANwj/hsm3FmxeOXZxoynp4ibqSmkc=;
        b=CvcTHSUWxzm5dd9oPvh9Bzft88/cglbH4+hUhke5GOPwyZNhQ/U9r2ZFiJy3ObgE99
         WUF+pwE2ShYfCticxb8DMW1gQ6n5z+BuRaTIbw/+A/i2plIyHQ2Pk855qppjSbIwRjx2
         hrgPfAL/19/qpSR3Z0TmEkWTx7GYfMz2hOopwwSvANsoDutwEFSOEq0e8yf9jXijagTv
         rin0TnyNpjoSY6GNQvYvMKOD9rVJnEgYNBJ6p4wJHuX4pGt2lHBOAtDxnDl16goMwRlw
         QF4CMpvixH2lro7YvAjhM0Yx73/uNhmAu701kb1b+5aNh1wzgA0JvzD7+DXSl61PjQUw
         kR9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780696916; x=1781301716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+5mTbmbGFqfQuWANwj/hsm3FmxeOXZxoynp4ibqSmkc=;
        b=cx9t3uZr8K25VW91Q0WQ9XBxGCbBVkl1Q5mupzMqQHsjKM9MXA2l4Z9DtJN0F3vqg3
         enNzdvbngaOnv6RJTSnlXwlnjSY5T9ByUrK8bWNwlD3cZkP9zofLhHFcRKgCR4xQo3cp
         A3k1fJV93AbfYUyE+g+BBcDfgWlQUco/WukOofzPtKKAGcD2lLWP28qvuk3P9SqkYnLQ
         d4/dXa6tQ8zHqjemdZj887e4oPKUJotNDi4zBXpEup/6OrJ4d7hw10cEMxZWXNZ3bnKc
         XXFPCLlNcRIheyF5qcbuWnL3P05J/9DgBuVbbq/BGIDH6yebILVNNA8PGm34OLBZvZuN
         iL9w==
X-Gm-Message-State: AOJu0YxTJUSosEVcigFbKglk5YvM2op8Hc1bF4/yybAsfIrQslzemUFn
	lqN0w7NZNXN/mhZfKE0gvR0wSQmB+yQwEDObrGVmM1Mni+XfIOCmDAzCvtDNjA==
X-Gm-Gg: Acq92OF0z7ciEXeas7F6wq0wBvESqHs5/ZX0IX3Symgz4hrBkPeEouA5V9J2UZJ7mf+
	aD3wqxSZvGnnVY6X9Zwjlr85El1VoiIgn3UysbhrmR+8hrDKeXA34zZw9w5nQqpdYk1qgFlh1Ye
	sn/5BbdSRuPfRYT0zn6R6xRiXGBQsKAX3qVQBTaw/Y5ZRuAVIFKPA5hb92E1fEI6xC3MzAarpuH
	62crSQ76pDxTXucWS43N7AZqnIMIrTY9FaM2KC++a5XrWO6fQJJIUzEv4EDirsMUpnDquG/ARk6
	OQ8ovLDVxTZ2ARyAAN3Unv5Y3ugtWxoKJMHcMHZ+RRj2ZCU4ZlfcUTEKYCpX38WxeBF3muPFEx0
	8CBXPzGlgdnDlf6lqsvdiDDT/bO/jlroGKJwSdz6NZ//CkyAsOH6yPZaENsJVfJZ5TdOx3ctchZ
	7BRlN7/+gsyvIxqxDizGjOPOXGmZbrE4FqvuU/ren+QVghOsxRmdFfkpKLBK+rIbwcEyNBxRREf
	pXWneYSb4cGxCGGugQ5DXNKjEWvNzqcvwlDQtRwOnugTqORzXhRhCiZ
X-Received: by 2002:a05:6a00:3692:b0:842:5da3:9b84 with SMTP id d2e1a72fcca58-842b0fb2843mr5346862b3a.34.1780696916252;
        Fri, 05 Jun 2026 15:01:56 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842824a1cb4sm12518883b3a.26.2026.06.05.15.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 15:01:55 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Zhang Wei <zw@zh-kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	linuxppc-dev@lists.ozlabs.org (open list:FREESCALE DMA DRIVER),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH 02/10] dmaengine: fsldma: check dma_async_device_register() return value
Date: Fri,  5 Jun 2026 15:01:26 -0700
Message-ID: <20260605220134.43295-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260605220134.43295-1-rosenp@gmail.com>
References: <20260605220134.43295-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Check the return value of dma_async_device_register() in the probe
path and propagate errors instead of silently returning success.
Previously, a registration failure would cause a NULL pointer
dereference in list_del_rcu() during remove when
dma_async_device_unregister() tried to remove the device's
global_node from a list it was never added to.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/fsldma.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
index 0e2f84862261..89b88447be1b 100644
--- a/drivers/dma/fsldma.c
+++ b/drivers/dma/fsldma.c
@@ -1293,7 +1293,11 @@ static int fsldma_of_probe(struct platform_device *op)
 		goto out_free_fdev;
 	}
 
-	dma_async_device_register(&fdev->common);
+	err = dma_async_device_register(&fdev->common);
+	if (err) {
+		dev_err(fdev->dev, "unable to register DMA device\n");
+		goto out_free_fdev;
+	}
 	return 0;
 
 out_free_fdev:
-- 
2.54.0

