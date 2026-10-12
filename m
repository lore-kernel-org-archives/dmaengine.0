Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154FC336886
	for <dmaengine@vger.kernel.org>; Mon, 12 Oct 2026 12:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791808240; cv=none; b=pQ6ZOF2d0DIZxigT0GOF4zmGNet1r25LNQgIRo+7BZn3s5cV52BGl44QFW2mGIaLFjrxAaAxNrkjXnoyoDJpI7GwTsgmrH1IwKlFqfHYu9yaAYTDZW2ypn836rr4yo4+rxLHui40DB9KEG2W2Gk6PRdr2VSV1fWnxOZwW1rb5as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791808240; c=relaxed/simple;
	bh=k8+9cdX3opsw8KhgzxeFZE4s01857Rq+I3781Tg2XVE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DC3d9ePLJchQp02K1tkaIIb5Qzi+c0K/H1YFD2d1mTyywA1UYAhUZGISnFcxVDU9nwSAkeT1kApWYw/ramt8tpGOxb25YiTuHOWe/+XtFlE1vx0N9lRuwq3ncOxM7R4TBytc2kZeFhNQgWs/U+GoUzedRgAOBdVygYwzp4RJFLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=bzA95AIJ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="bzA95AIJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=lSiBH6HI5shCu8X7b2TWLP89VHQgSZmxQSH5BZEiRFo=; b=bzA95A
	IJBwSekLip0bqhSY1wsqQOqGJbOK3igc4ZGACWX+ZeXxMylq+Qxlq+q4KGQ4R4J7
	60oGtWa5h3OvaqUBksHuzTz6iawa4e2CoMz2VuR7jjrMDpM6L2mkZ2Fz5bNvkfbp
	a4LSeufa70yNpWiK8hm5e44IhaH58jEkARPxHsIYj4ES1dMszJ8eEyVhU5IthJuE
	1R3GFYojRWI8Ada0sY7nAPAkQT4VGGmsCJAwlyeBtHo/ktgj9EjyzgIC4yIFfrzx
	uFx72JMrMrpw4paGMaksl9d687fLrm6vvDOaZhvlsRp/QjbiGP5rEblseK9D+FrR
	9+nHZaNZpoQLusbA==
Received: (qmail 2248092 invoked from network); 12 Oct 2026 14:30:32 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Oct 2026 14:30:32 +0200
X-UD-Smtp-Session: l3s3148p1@VV0z3aNd1MUujnuu
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Zhang Shurong <zhang_shurong@foxmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Frank Li <Frank.Li@nxp.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	dmaengine@vger.kernel.org
Subject: [PATCH v2 1/3] dmaengine: rcar-dmac: Fix PM usage counter imbalance
Date: Mon, 12 Oct 2026 14:30:21 +0200
Message-ID: <20261012123020.11320-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261012123020.11320-5-wsa+renesas@sang-engineering.com>
References: <20261012123020.11320-5-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zhang Shurong <zhang_shurong@foxmail.com>

pm_runtime_get_sync will increment pm usage counter even it failed.
Forgetting to putting operation will result in reference leak here. We
fix it by replacing it with pm_runtime_resume_and_get to keep usage
counter balanced.

Fixes: 87244fe5abdf ("dmaengine: rcar-dmac: Add Renesas R-Car Gen2 DMA Controller (DMAC) driver")
Signed-off-by: Zhang Shurong <zhang_shurong@foxmail.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Change since v1:
* added Laurent's tag (thanks!)

 drivers/dma/sh/rcar-dmac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
index 3ad8aba5dcd4..5b54f1c4ce15 100644
--- a/drivers/dma/sh/rcar-dmac.c
+++ b/drivers/dma/sh/rcar-dmac.c
@@ -1070,7 +1070,7 @@ static int rcar_dmac_alloc_chan_resources(struct dma_chan *chan)
 	if (ret < 0)
 		return -ENOMEM;
 
-	return pm_runtime_get_sync(chan->device->dev);
+	return pm_runtime_resume_and_get(chan->device->dev);
 }
 
 static void rcar_dmac_free_chan_resources(struct dma_chan *chan)
-- 
2.53.0

