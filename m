Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F4A40B112
	for <dmaengine@vger.kernel.org>; Thu, 17 Sep 2026 07:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789629136; cv=none; b=GimWGAKmYit1haqdXzacemz5uxkFjh4+Vs03wbgxsbmKUBBzKvWBowHlWPho4FIE4ycKYteb5Sj1wJRXJFFTWRZ3k3UD3mdb/AGda+hq6UFp7cOXS9XKv2+27faPYV9wV04Ty3h0Ih5FckgX1YiA2K2s7K/3/6Mnx391lf+HTUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789629136; c=relaxed/simple;
	bh=ZcXFAGSAILz/WlJmAOupIphMwAw5YWQKFKu6fbvPwqE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jpf/h5icyz5wpb3RI21Q4wnP0yd7GA7fmvLyXVCBhnUqp8+n+AYADp742BBF5LREaJ5Uw/ime0cwUfAqZn/2v49dN1pkckfLnDJxgwFXQrwSe7KH5sBjXZXrxRCBX7ZJYYg6jU/K7yiAiFl4BiaeML4qOUaFA1K034cTbqjk3GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=UpBxuqqo; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="UpBxuqqo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=xLXwVEM0EdpfKqeNzRrzkVN+s/Em1JxLTMh4RGErkZU=; b=UpBxuq
	qoa+Eo7ejyAD441H5zfrVCfCl8pOgKs5aUiGELwXuEZ2nBofu2mR/ZfgXcYtrTLR
	v5qVLectTq7v/rlwnL/1dzDtbP3Rv96u548XVxcWg/sTk5UCAqIKTCkqqJkqxaNY
	OXdzDk/KB5pCDjfaq3zWhWFFCjsKoDFVkU9FV4PpwTGBK62H5v16ZpLwNnZjbkGd
	Ei6bJUJaCKwEKAGaJae+1Y4DQChWoBubLqgIlGmqdUubROicSmDg19ODtrh/S9YI
	ha+XUr05oVvBRCtBT17RAWIMWqoAmMd19+k7VR/iNTiF+U3iioxp5FN4ZJY77dnS
	ItA3Oq265Y9eZQrQ==
Received: (qmail 1890407 invoked from network); 17 Sep 2026 09:12:11 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Sep 2026 09:12:11 +0200
X-UD-Smtp-Session: l3s3148p1@n+qogKhbFJkujnsL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Zhang Shurong <zhang_shurong@foxmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Frank Li <Frank.Li@nxp.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	dmaengine@vger.kernel.org
Subject: [PATCH 1/3] dmaengine: rcar-dmac: Fix PM usage counter imbalance
Date: Thu, 17 Sep 2026 09:12:06 +0200
Message-ID: <20260917071208.36888-2-wsa+renesas@sang-engineering.com>
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

From: Zhang Shurong <zhang_shurong@foxmail.com>

pm_runtime_get_sync will increment pm usage counter even it failed.
Forgetting to putting operation will result in reference leak here. We
fix it by replacing it with pm_runtime_resume_and_get to keep usage
counter balanced.

Fixes: 87244fe5abdf ("dmaengine: rcar-dmac: Add Renesas R-Car Gen2 DMA Controller (DMAC) driver")
Signed-off-by: Zhang Shurong <zhang_shurong@foxmail.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
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

