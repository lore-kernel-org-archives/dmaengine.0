Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D9E41A92C
	for <dmaengine@vger.kernel.org>; Tue, 25 Aug 2026 14:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787667378; cv=none; b=X7dVDvL0FbxMo+gOB+GVLvNHlEFWNlxABGHwgLlj78pSnI2apm3kJeulc0HghtLsvY1S0Zw0SwzyxwgZAoG0rGWbJHok1Y2MybwyRZ9iQ0EqNyjQ5v4YSYXlgdyTJGjF2VyOE+frc98/15AftPe3UwkkOv5SLSb/Y75/GcN9BfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787667378; c=relaxed/simple;
	bh=s8swDt67f3TndQWuDJkVLquiFo9IUHydcDp+7eWHrZI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NVdiyYfcYNHFlriLr4lRZn28MD6KTsfN1DG3gdE1Nh6Dbj3s0hxPH1wvUmD+Q6liU2TJyfp9/33IOvNuMffThz+qqtFKAOAyP44S3Fr4jshtToW0QHXYRglqYgfe2KKYe+tvq8Av+LjImsvL0adOupHMl321qW2aD9fuJVxLLfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=YOPYeM6r; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="YOPYeM6r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=nvDToUy0Cgqbg8syzZiJNMPRCPy9jhOgpraN/tqykh0=; b=YOPYeM
	6ra8jxcEh+X7aZffW3RFGX/1MEgCv0YS0GBMDpvEBC0j7sZrKkiZrmPmD0zJg3bH
	n3z3RsROS+0/R/qBENF580bUBynDlVLPRzaftQNFD1gzeaHPqZDf9ES+lj+NXe5i
	xWYmfYXSi48rWN7DKrt+fiIdo61W98sVbruvcSWjHFogfa5sp0nPPf+d6AHVRtOk
	bu0NpsXFbE97gt2RglMFx8T4NxOe+Ob1Rxu2gGFVeKIkejv8Gmpx/+0HIjYkQjZV
	P9Ch1URx6C84KxdQe0aiphCZ5SEh3m3h5ldWovXGCB33+k5ea5G84TLY89CzTQWH
	HT4ZvZg4tKaXPvig==
Received: (qmail 534359 invoked from network); 25 Aug 2026 16:16:03 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Aug 2026 16:16:03 +0200
X-UD-Smtp-Session: l3s3148p1@EtEtvt9ZMOIujnus
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	dmaengine@vger.kernel.org
Subject: [PATCH 4/4] dmaengine: sh: rcar-dmac: Add support for R-Car Gen5 SoCs
Date: Tue, 25 Aug 2026 16:15:46 +0200
Message-ID: <20260825141542.30901-10-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260825141542.30901-6-wsa+renesas@sang-engineering.com>
References: <20260825141542.30901-6-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Gen5 is very similar to Gen4. Of interest here is that it has a SMMU
instead of an IPMMU, so we don't need to set the flag for a workaround.
Make the module description more generic while here.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/dma/sh/rcar-dmac.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
index 9c5210257097..06f691f5f3fb 100644
--- a/drivers/dma/sh/rcar-dmac.c
+++ b/drivers/dma/sh/rcar-dmac.c
@@ -2012,6 +2012,11 @@ static const struct rcar_dmac_of_data rcar_gen4_dmac_data = {
 	.has_ipmmu = 1,
 };
 
+static const struct rcar_dmac_of_data rcar_gen5_dmac_data = {
+	.chan_offset_base = 0x0,
+	.chan_offset_stride = 0x1000,
+};
+
 static const struct of_device_id rcar_dmac_of_ids[] = {
 	{
 		.compatible = "renesas,rcar-dmac",
@@ -2019,6 +2024,9 @@ static const struct of_device_id rcar_dmac_of_ids[] = {
 	}, {
 		.compatible = "renesas,rcar-gen4-dmac",
 		.data = &rcar_gen4_dmac_data,
+	}, {
+		.compatible = "renesas,rcar-gen5-dmac",
+		.data = &rcar_gen5_dmac_data,
 	}, {
 		/*
 		 * Backward compatibility for between v5.12 - v5.19
@@ -2044,6 +2052,6 @@ static struct platform_driver rcar_dmac_driver = {
 
 module_platform_driver(rcar_dmac_driver);
 
-MODULE_DESCRIPTION("R-Car Gen2 DMA Controller Driver");
+MODULE_DESCRIPTION("R-Car DMA Controller Driver");
 MODULE_AUTHOR("Laurent Pinchart <laurent.pinchart@ideasonboard.com>");
 MODULE_LICENSE("GPL v2");
-- 
2.47.3

