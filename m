Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6863F86EE
	for <dmaengine@vger.kernel.org>; Tue, 25 Aug 2026 14:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787667374; cv=none; b=JXZE1zon5waJSdFMQ/2wH0tYrhEAUrs0zXi3Cw2cBQQugZKeu9xv5v6/HbJday+rTt+N0v1hSE/J4SyPwxvv5GTspqzWE65gYhCCZ4yI5gkqs26Kd3i4VeDw3WDn3UjGrfiIqGXwCGbIUUv2pTpQXeTAqqfFpyEcL7ky3V4+974=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787667374; c=relaxed/simple;
	bh=ed16YCg7aqHmrgv+1HLh4Brgq3vbJMD6gm3aeQG/gms=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rGHmZokeBa0i+hVIreZH5f9kySGPDr1uiRbvB7GXBpjJJLNfD30w9/uxv/VH5BXcJzaq/knAWfIxIdceQTRifoONzHUbH0z7+XYQhjAmbdrRA+pZ1uDW2wHZPrp8Qm+bJ1O23HhHLOGXrG9VqnF4WkC7hXJlkk20QrI5JK6/3d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=GoR5hhuG; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="GoR5hhuG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=miTvjILC7Ya6DG8S3QRsMY5dmHBX1AvHN1oHZVOi3mQ=; b=GoR5hh
	uGfh93HGz7faiJivoYgHZhUIqrXDrZNLXd45LnDjMEChPQqrJD1jGcCX0ZD6hJQT
	+nNoyEskJ0eCz93MAZLBQ2Pn0AzOqa71IQzY7H4N0ixvWdQhptWHoxZCh3y1NYrh
	RZzSh3/CTJc8y2sFi6zoU32N6BiyK5yT+PTdrUGKcLUTLBME6pBJFZWIdxvLLXci
	TIXvL+9IWWRvNzJDNGinowQVgmLxFV4Ks32jz9ntipb9M2tSY3Jj8Q3Cftx8RAVg
	SCVHzyJt6LET6nwuWDovj8/1IONA+TDT4+bFJgUjh94FXCWb0aTJ/+ujDKhsdb/a
	6fMhbrnuQ2+6PWmg==
Received: (qmail 534273 invoked from network); 25 Aug 2026 16:16:01 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Aug 2026 16:16:01 +0200
X-UD-Smtp-Session: l3s3148p1@HfEOvt9ZJOIujnus
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	dmaengine@vger.kernel.org
Subject: [PATCH 1/4] dmaengine: sh: rcar-dmac: fix style in struct initialization
Date: Tue, 25 Aug 2026 16:15:43 +0200
Message-ID: <20260825141542.30901-7-wsa+renesas@sang-engineering.com>
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

A new member will be added to the struct. Before that, adhere to coding
style by using a single space when assigning values.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/dma/sh/rcar-dmac.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/sh/rcar-dmac.c b/drivers/dma/sh/rcar-dmac.c
index 44eab2d21d54..cf07c17847d0 100644
--- a/drivers/dma/sh/rcar-dmac.c
+++ b/drivers/dma/sh/rcar-dmac.c
@@ -1998,13 +1998,13 @@ static void rcar_dmac_shutdown(struct platform_device *pdev)
 }
 
 static const struct rcar_dmac_of_data rcar_dmac_data = {
-	.chan_offset_base	= 0x8000,
-	.chan_offset_stride	= 0x80,
+	.chan_offset_base = 0x8000,
+	.chan_offset_stride = 0x80,
 };
 
 static const struct rcar_dmac_of_data rcar_gen4_dmac_data = {
-	.chan_offset_base	= 0x0,
-	.chan_offset_stride	= 0x1000,
+	.chan_offset_base = 0x0,
+	.chan_offset_stride = 0x1000,
 };
 
 static const struct of_device_id rcar_dmac_of_ids[] = {
-- 
2.47.3

