Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795777452;
	b=Ik6QrFb77C1unlcXK9QzRioEl3hGoIAkBaZmxnAt2BebVEWK/E0AXJXt6aMqVhl0/qBk
	 gzovV5bjSojTWoWk4E4pqNTBONLmxAjQpmIMRS0SPrF31z7WTL0n999srjTsZC4Mi+2pk
	 TZeD0VGNoFPjaUJzFEyGuMbc4121LTkM8RBifE24XRwg685aeyZt7TZUl4iQ/KsO9f+ki
	 J/aGCBc48vGiLP8q5gaChOVBjAaTG1VQQJdP9qjuKM5h28azwv8da8p4wac8WNFBqbzHT
	 FAC+3o53tgZPTjDvdKVuD/mmRYXN7C6D+09j3B8aQWkxhMklg4s6XoY3IW2i2vx1wAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795777452;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=efKueph88AfbTGTSMKcxt1afNDlf6kGQ5vNW/j37OHI=;
	b=coyMBMTjKbqoK/UhwzupzJEekv+1cBuixuHrH7mK1BzvdMWcgdekpGXudMkDSFfLUprN
	 RJCAx3V6oB7XLBKKUN7eoDeG3EcQsG9EGgvDKrzLNPkEZ/xR4gUfrDiWYrSORxKUBrS95
	 7S08mXGRkWeuFD9vuePLPp48F8lQgLJdf88oDH6FIS14ytirPKayucYYrqHiCCtqxHURa
	 XJKQHaVHRK35751zlMK0kyluJ6MS5IOtoJiH9WhsURfW8V4LyIHs+yYQ80riNUIy0q3Xr
	 tBfJThhfyhfcFBQ2vp1T7qjrpfCJ2Nu+eTyfiC3FUawwFwdX93gUIlpWfp1pqVDRaSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=fCJzQGYY;
	arc=none smtp.remote-ip=45.254.49.197
Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D3A606A31C;
	Fri, 27 Nov 2026 11:04:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51D3A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=fCJzQGYY
Received: from user.localdomain (unknown [223.80.110.101])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5641a2c3f;
	Fri, 27 Nov 2026 19:04:04 +0800 (GMT+08:00)
From: Tian Xuechen <202300460064@mail.sdu.edu.cn>
To: vkoul@kernel.org
Cc: Frank.Li@kernel.org,
	Frank.li@oss.nxp.com,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vz@mleia.com,
	piotr.wojtaszczyk@timesys.com,
	manabian@gmail.com,
	robh@kernel.org,
	saravanak@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 3/3] dmaengine: lpc32xx-dmamux: Use managed DMA router registration
Date: Fri, 27 Nov 2026 19:04:00 +0800
Message-Id: <20261127110400.379397-4-202300460064@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261127110400.379397-1-202300460064@mail.sdu.edu.cn>
References: <20261127110400.379397-1-202300460064@mail.sdu.edu.cn>
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
X-HM-Tid: 0aa21cad3bff03a2kunm13da2c70394a8a
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCQ0hMVksaGBgaSUhPHR4YTVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVQ0tVSkpLVUpLSllXWRYaDxIVHRRZQVlPS0hVSktJQk
	NDTFVKS0tVS1kG
DKIM-Signature: a=rsa-sha256;
	b=fCJzQGYYXaQk1w/z8aQvvBCDhIi9k5Nd1MWNWpDDa7AK7z3u9faCkOgClHqhDYDtnJUdUFcNkuGKiPhR9DHw7/REs9Bo7gKL0SiH4jZKKe5BSOsynJkXwoMlThhuFYVW6fERnQXvezFIzJ8IOevCeq2IuD3hQWG2VA5TvQdeNHI=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=efKueph88AfbTGTSMKcxt1afNDlf6kGQ5vNW/j37OHI=;
	h=date:mime-version:subject:message-id:from;

The DMA router remains in the OF registry after its device-managed
data is released. Use managed registration to remove the routing
entry before the router data is freed.

This issue was found by our static analysis tool under development.

Fixes: 5d318b595982 ("dmaengine: Add dma router for pl08x in LPC32XX SoC")

Signed-off-by: Tian Xuechen <202300460064@mail.sdu.edu.cn>
---
Changes in v2:
  - Use devm_of_dma_router_register() instead of a remove callback.

 drivers/dma/lpc32xx-dmamux.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/lpc32xx-dmamux.c b/drivers/dma/lpc32xx-dmamux.c
index 33be714740dd..3218be8e8eae 100644
--- a/drivers/dma/lpc32xx-dmamux.c
+++ b/drivers/dma/lpc32xx-dmamux.c
@@ -180,8 +180,9 @@ static int lpc32xx_dmamux_probe(struct platform_device *pdev)
 	dmamux->dmarouter.dev = &pdev->dev;
 	dmamux->dmarouter.route_free = lpc32xx_dmamux_release;
 
-	return of_dma_router_register(np, lpc32xx_dmamux_reserve,
-				      &dmamux->dmarouter);
+	return devm_of_dma_router_register(&pdev->dev, np,
+					   lpc32xx_dmamux_reserve,
+					   &dmamux->dmarouter);
 }
 
 static const struct of_device_id lpc32xx_dmamux_match[] = {
-- 
2.43.0

