Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A3E4446F2
	for <dmaengine@vger.kernel.org>; Wed, 16 Sep 2026 23:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789599760; cv=none; b=l7rC5FIhWGKnd/pmEkVfZzpu/s/ogtQ0FHZKUd8koifwrHfrQTDRBdsyKHr2cqCCHtRCbcaeeBvr4/5S3tPPKrAE17zaSDJ6x/WQYsO9ayjZughBUVvZr1uoPSoqZ/9/XnXjsXpAqeotoyD6eYJzumgSoPfCzQa0PPBBTexq6vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789599760; c=relaxed/simple;
	bh=YCCfGwPfmCxWE+vcmUEZsFhPDZ76hppOIgoi+mVXp+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uym2Lpl4QDulCti9af3tISEI+1r6xYxfXQKC6r0tqUHUy5zjAce450JN90Mq49R9LJBYafdUZ1OUgvUTM889LBV6sQYlh6M13JTyC1w0dmCIJqCGsOD/cEqAAY58lbTub30BIvfLOWkkfcQFWNfEz3BGF8b/3lmc5ZwRAWAB70Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KTMsdxpp; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KTMsdxpp"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2db710396ffso1232215ad.1
        for <dmaengine@vger.kernel.org>; Wed, 16 Sep 2026 16:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789599752; x=1790204552; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8fkxWCvKJczVMfesaEcNbK2P73mYdy8NStslyw9N+Ug=;
        b=KTMsdxpp50i/NXGjHRw/TCQ6v1jomXJ3YGaADy32UR87FEq1cHOH/5EQx/BYwMkNZh
         As7aaMZszqhw98IaddKtekTd9IseZH7PoOb9W3SC2O+UXQud9AgeGXnIDS+GU9dyDkcB
         PFCJHQ77v0bIQ37yGbTxe/uE9Ve5CEGELfNFQN5EwbIt1QxoKoy49bKioSO8O2zZtQxI
         90pR1Wa0/0FcixVMomGOIiKVY1xo6Z0jXrKSh3mycwSm3/oBigG/M+TAx2jGTSp0Eu3D
         wLh70tPUfIMR+/MV03gWkgwz06XGXBj9z2SaUe6Wc5TOKXE4Kf+ZWwv/oCNKMUXurvic
         zYCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789599752; x=1790204552;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8fkxWCvKJczVMfesaEcNbK2P73mYdy8NStslyw9N+Ug=;
        b=QmNMTQvseQbA9aGlOZ8+NiV7QoP09v3sIVs9vYAU8oKGE+0xmL71FsP11U+iDMMqmN
         XPt63+1mpz4Z+nqvFFVMS7Gm+mlqUbn5Bwd3lqO+GPSRMo2U+A7viYBFXScJUxDOwl0o
         0HtuVyihezIJj5Da2oz93jaugna5qwcLsAKGIxss7c53hoWkphdpyQWer2+5SBXAoJ4f
         tgocDPys3sTTI+MJ5qDdyfE/7lUi3I49S6B2A7MJXq1XEruDSO/f020TK3uj07HvKw5x
         lFGC2iW6+F67OJmtTqNE6n85ZgxyFzUw7/tnfOniN+oPIwyQw5Mp7CfUUk4scjpSXVr0
         2hVA==
X-Gm-Message-State: AFuF++k3sdcB9yhyl90aoDdg0bK2FOCaPGCTQwSS6fWpltl0Vd+s/NTv
	WsOGAZSgd6OHGiZPt3EM4YKrLFs9TI/WfCRwRkTmFNaTIWEdga+tbUREq/Nx5+6R
X-Gm-Gg: AYBFou0oBmxJcR9qPv41XApQwj2HU8i1qLkWGkimnyR2Sr4nnsW76OtH6KtmXfFtmry
	Zj2hVMISrgt04nMLdFQZVd+nkzewc9XDkm+nuNr59IDJFUtFOK+tEDujuRkXQafgGqewNYcRiDF
	YPp5BkH8YzrEZzZ4C3FWhlg3n3PX6vQTmGSrWmxxsYnbDrrILJAh7udMr7rIHzGL4/iOp+3TEM8
	jP0pt0xBhWmD/qC2qdDcytMF45VWTqxaQSNcJYDH/GMjwswEXLKgxjrhilLfV8vtjC+yo82bHIk
	9TELv4GafoWrEiPUjkK+5di4H97Z37rgjvUU7reBW+BcOf2fL87PLdRAkvFZbgN6N9Wb7Hqp25X
	gPzTdnrmGwu+X0YMqOVkgQ1dhXcw+MBIGVlfp7yztw4c12Zjdg4g9RALzcsPswGRsqYzaGfVKvb
	rLGzwEG037zcQZ0OxWtaUBvR71XAG9Q6TgvwHElqUwGAmoeVPSTKf2CYtOCZi3+NBs/WT4QKhue
	BRGkbogOKH8qBcGEix1+4Od0soio0PbvqW/XuxZTQBgzPZczQwnRRCYOf+AFI6/CW/6cUeWgPV1
	HFalH3yeU32RXdnk8dpPEAX8BWuvucwsd09Oy/x/oUyrDmI1
X-Received: by 2002:a17:903:b8f:b0:2d7:1f17:41f8 with SMTP id d9443c01a7336-2dd9ca0c91bmr19967065ad.15.1789599751704;
        Wed, 16 Sep 2026 16:02:31 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89ee19b9sm17289305ad.51.2026.09.16.16.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 16:02:30 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Harninder Rai <harninder.rai@freescale.com>,
	Xuelin Shi <xuelin.shi@freescale.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv6] dmaengine: fsl_raid: check fsl_re_chan_probe() return value
Date: Wed, 16 Sep 2026 16:02:28 -0700
Message-ID: <20260916230228.283615-1-rosenp@gmail.com>
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

Check return value and only count successfully probed channels, and guard
fsl_re_remove() against NULL entries.

Fixes: ad80da658bbc ("dmaengine: Driver support for FSL RaidEngine device.")
Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v6: increment ridx before continue;
 v5: put some stuff on one line for easier readability.
 v4: use break;
 v3: fix sashiko review
 v2: fix description
 drivers/dma/fsl_raid.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
index 9cc289f7129e..f059ff2e37f8 100644
--- a/drivers/dma/fsl_raid.c
+++ b/drivers/dma/fsl_raid.c
@@ -836,18 +836,30 @@ static int fsl_re_probe(struct platform_device *ofdev)
 		}
 		/* Find out the Job Rings present under each JQ */
 		for_each_child_of_node(np, child) {
-			rc = of_device_is_compatible(child,
-					     "fsl,raideng-v1.0-job-ring");
+			if (ridx >= FSL_RE_MAX_CHANS) {
+				dev_warn(dev, "too many job rings, max %d\n", FSL_RE_MAX_CHANS);
+				of_node_put(child);
+				break;
+			}
+
+			rc = of_device_is_compatible(child, "fsl,raideng-v1.0-job-ring");
+			if (!rc) {
+				ridx++;
+				continue;
+			}
+
+			rc = fsl_re_chan_probe(ofdev, child, ridx, off);
 			if (rc) {
-				fsl_re_chan_probe(ofdev, child, ridx++, off);
-				re_priv->total_chans++;
+				dev_err(dev, "job ring %d probe failed: %d\n", ridx, rc);
+				ridx++;
+				continue;
 			}
+			ridx++;
+			re_priv->total_chans++;
 		}
 	}
 
-	dma_async_device_register(dma_dev);
-
-	return 0;
+	return dma_async_device_register(dma_dev);
 }
 
 static void fsl_re_remove_chan(struct fsl_re_chan *chan)
@@ -872,7 +884,8 @@ static void fsl_re_remove(struct platform_device *ofdev)
 
 	/* Cleanup chan related memory areas */
 	for (i = 0; i < re_priv->total_chans; i++)
-		fsl_re_remove_chan(re_priv->re_jrs[i]);
+		if (re_priv->re_jrs[i])
+			fsl_re_remove_chan(re_priv->re_jrs[i]);
 
 	/* Unregister the driver */
 	dma_async_device_unregister(&re_priv->dma_dev);
-- 
2.55.0

