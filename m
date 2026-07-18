Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DB5AD24
	for <dmaengine@vger.kernel.org>; Sat, 18 Jul 2026 23:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784416527; cv=none; b=LNlZeIzQh4vZXncAOOca9hB1dOY7gl1RO6HgYFQK8DHQPqGYKF7KVlOZhtRy4juxnA7KzscCGsONiM1N3i/TSIdtdiz04wg587ljs5Pq0xGMR1dyZGombPCsLktMQsbb0Zd95xj8d67ypmGWBlnoIfrH/ViZyXyVI8KX6p1Bukk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784416527; c=relaxed/simple;
	bh=F3ddUI6OH+9xEXcw/DgT1r3cZ4P9+8Qr2b1ucmOl1EA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gi1O0FWSMnET2yfR43uAhPRAV7lewvDV8sXi/hHpW/bG4tEou3Eb9sXsImp79VtXPvh52jH81MJtmpin9gG/ISE+FUdTfO0kOVocM6MTXDHxrq8Jv8C5kv+rfki2xKzohs2lPzrYVDggZWJ33QsiBcgzwWi9MjpQQ0Lh3zNAwLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jk5wlKZl; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jk5wlKZl"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2caea3f742bso109572275ad.0
        for <dmaengine@vger.kernel.org>; Sat, 18 Jul 2026 16:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784416526; x=1785021326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7Pa98OiT+cfgRhmC2/OSdJXiv4gX2JYs91APlNtDAjs=;
        b=jk5wlKZlL0nqAmpStzFGUMHqf8jm0VlAJ8uLD5X0NHMFVzBacwloOo69e49N2f5KfM
         XB7AxZGwGl4K5t9niWYPgfgJLu7BBalRJBeW0qECcZG1C1TFT2vntnwL4RurTQdQAWYy
         aOqY6BuC+Y9osXb1DauIe6XlDT56dy1s90+TgUHJGRitpmrzhX9dPRzpHtFtTRksujAh
         TW5ri5FAZE0UrzUGOsz6DPW82N10BPQbUWPgdAFp4g+jmOVTp5Ull0V3bStjElzTmHjV
         WdL/S3HVt9BrYb8pNheOuyzeM+auwqXdowUwc/6LAEfvPbbXUbyUMY6XpFtuvKs7XUt1
         XOAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784416526; x=1785021326;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7Pa98OiT+cfgRhmC2/OSdJXiv4gX2JYs91APlNtDAjs=;
        b=lfufRIIZnGsFx26CiL806UYAxr1GwINNYxNJKtKu0BERd4Wzjos8LNDbRnkcwRBY1y
         3AWGg16qkpz8k4NnCBHpkZoJVhxjZgyk9ApLCh6Ka4SDHYnOiQxIFellZc3v8GXHAIrj
         um+h6smSzYuwzuwHkOwSEd0N9QQsrwBUf935dedErqffYVinRBaK3GRNLeR3FwUMz5xr
         0UZifcFdiYkko2yE3jD1OYgwBJhtFX1kiFJ2vfzwYZvQi7IR4mN5gO7H2LRA/E9RDcAX
         BLwjodELerCvFSYDiVQCpx7mymys1qgy+PP9Lepqk58oUTfq7FxlBya6MWdGcshmEowM
         dZrg==
X-Gm-Message-State: AOJu0YwH4Yd7POFnfd/6t2ycuzNpHkkSbUTnSBgY+oHr0i+9EOrE9EgN
	Oyc376/gMsUU4iwhBg1XDzydY71RK6fCfxOVJ49Z5tyEZ3JYR7L9tZ0yfiU6Bw==
X-Gm-Gg: AfdE7ckuAdgA5sukTtpv9EY5N8Q6x/8k2oXpwnV0g9e7V/VvXkSq332rmm7h56RnXe4
	5tmgnFLkDwxfaSk/aBH5rfAa/2scaAofQk4ElX67n23WE1J18o/WNId7MQm7qJNI6g3hxazgTyD
	96KT1HpNC9xpyS4xUKJ2dnh52RLX3Lbf2mxhrVV0rIwbUzxb8m4oobBtQa8kUL+Di5kdVvaEKA5
	Lm327XYMkaK9PqW0o6wT/BGCDH7fwCrmpI3ItwzvmIgjqLFJPPD6YSzo8hScicx1Tr+9mSVpnDR
	oCoP0EE7wuDT040HYeWoggO0vHq5G9btSF7lCb2tIpWAburqIsA8Ef+pE+bc6w05IKkqxQRtx+z
	eMuu53kixAtuD1f46rmgvV6aAZfEyQ5m9SK6GIz/GUoHkNZ59CN+FCRWufCq3PJVFdX+zv4N+bS
	yTdMA1DJhtw3/ykR8QqsrNSypuFoijLZDSWPsFAGCDwNNehBA5HN8zYXVJk5Xm0UK77mF2uZtLk
	Lo4QJE7pWfe3LDA31LyJ6FbMczctRw1Mog7KP4aib+Tz1EpckDAIps=
X-Received: by 2002:a17:902:ce82:b0:2c9:b396:1a55 with SMTP id d9443c01a7336-2cf348bf5c2mr94853655ad.12.1784416525858;
        Sat, 18 Jul 2026 16:15:25 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3471f42csm32610205ad.61.2026.07.18.16.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 16:15:24 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Harninder Rai <harninder.rai@freescale.com>,
	Xuelin Shi <xuelin.shi@freescale.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] dmaengine: fsl_raid: check fsl_re_chan_probe() return value
Date: Sat, 18 Jul 2026 16:15:21 -0700
Message-ID: <20260718231521.222456-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fsl_re_probe() ignores the return value of fsl_re_chan_probe() and
unconditionally increments total_chans. When a channel fails to probe
(for example, an IRQ mapping failure) its re_jrs[] slot is left NULL, yet
total_chans still advances, so fsl_re_remove_chan() later dereferences the
NULL pointer during device removal.

Propagate the error, only count successfully probed channels, and guard
fsl_re_remove() against NULL entries.

Fixes: ad80da658bbc ("dmaengine: Driver support for FSL RaidEngine device.")
Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/fsl_raid.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
index bfaef6245695..0b0b4e8fc821 100644
--- a/drivers/dma/fsl_raid.c
+++ b/drivers/dma/fsl_raid.c
@@ -842,7 +842,14 @@ static int fsl_re_probe(struct platform_device *ofdev)
 			rc = of_device_is_compatible(child,
 					     "fsl,raideng-v1.0-job-ring");
 			if (rc) {
-				fsl_re_chan_probe(ofdev, child, ridx++, off);
+				rc = fsl_re_chan_probe(ofdev, child, ridx, off);
+				if (rc) {
+					dev_err(dev,
+						"job ring %d probe failed: %d\n",
+						ridx, rc);
+					continue;
+				}
+				ridx++;
 				re_priv->total_chans++;
 			}
 		}
@@ -875,7 +882,8 @@ static void fsl_re_remove(struct platform_device *ofdev)
 
 	/* Cleanup chan related memory areas */
 	for (i = 0; i < re_priv->total_chans; i++)
-		fsl_re_remove_chan(re_priv->re_jrs[i]);
+		if (re_priv->re_jrs[i])
+			fsl_re_remove_chan(re_priv->re_jrs[i]);
 
 	/* Unregister the driver */
 	dma_async_device_unregister(&re_priv->dma_dev);
-- 
2.55.0

