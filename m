Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC12448B8E
	for <dmaengine@vger.kernel.org>; Thu, 17 Sep 2026 07:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789629138; cv=none; b=nyfMNSEyyt0VisWKwJUNVo7FT9JcmBnhsn4b4NXzD/gXvA8gj+gdFuuiukavrM/4Xt0g8qqorHk0EI2kNuE4ndj4lkfHxKqRj6y0qKrO0RTHq5gebbcok3sKtivoTnXgDq58hsMKRMbpkgfxjsOTITJMQffSusfQ040BA7snDjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789629138; c=relaxed/simple;
	bh=QjGaUqutVueVePvnO0C5iE/EafoiPOMTgwSb+0x2szI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YKEIt9zmNI7J7kpDVoFu2C+mgPUKS0qItzgWNbxHEssvLqDcdFHPXLVsseLREqujKvi4ZO++HUy32Kqjz2ASRdg4OXkM5cKQ6z9hwPCnmjWwDNKml8yhA0bMUGB88xYh5hM2HbGd3hlqSddt7UkSMnyI02cyl9VK3Z2WV6Ffe8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=PyRGPDUQ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="PyRGPDUQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=55J6KesL2d7+fGcQIWioJIavBpJZhWX7NYBoq1g2Ex8=; b=PyRGPD
	UQurJ22Rv6cm1irxntOn609qhjLb3+Txh66us18rnlewsp6T+enCAA2EZZJzUCZv
	h88rhFPAtXeeTSp6ekrqDbrGi5QyzbFB59Al0LSDvgHbEC0SLzzch9FAJ+AAc7Dj
	uc+4oPojKAahZMgN2yauUgiCb/kX5GpvLLIyedczNN9orh348rTGPzNocKr9xzge
	2p57gA9IF1OmkBq9h4A1nDleWNoQiL3PYWH+kbXbY3PK9zH3q5tkAWkreq6/FpZZ
	t7GuG5hqC8a//JNM+IfXsiE6sr/IfATKv37XSR6RaS3vUYRq03WUW/i+ABKX7Snt
	cdVhfU1VT6rBccKg==
Received: (qmail 1890489 invoked from network); 17 Sep 2026 09:12:13 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Sep 2026 09:12:13 +0200
X-UD-Smtp-Session: l3s3148p1@7xy9gKhbJpkujnsL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Pan Chuang <panchuang@vivo.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Frank Li <Frank.Li@nxp.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	dmaengine@vger.kernel.org
Subject: [PATCH 3/3] dmaengine: rcar-dmac: Remove redundant dev_err()/dev_err_probe()
Date: Thu, 17 Sep 2026 09:12:08 +0200
Message-ID: <20260917071208.36888-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260917071208.36888-1-wsa+renesas@sang-engineering.com>
References: <20260917071208.36888-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pan Chuang <panchuang@vivo.com>

The devm_request_threaded_irq() now automatically logs detailed error
messages on failure. This eliminates the need for driver-specific
dev_err() and dev_err_probe() calls that previously printed generic
messages.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/dma/sh/rcar-dmac.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
index 9155bceb723b..9c0c00e7cc2f 100644
--- a/drivers/dma/sh/rcar-dmac.c
+++ b/drivers/dma/sh/rcar-dmac.c
@@ -1797,11 +1797,8 @@ static int rcar_dmac_chan_probe(struct rcar_dmac *dmac,
 					rcar_dmac_isr_channel,
 					rcar_dmac_isr_channel_thread, 0,
 					irqname, rchan);
-	if (ret) {
-		dev_err(dmac->dev, "failed to request IRQ %u (%d)\n",
-			rchan->irq, ret);
+	if (ret)
 		return ret;
-	}
 
 	return 0;
 }
-- 
2.53.0

