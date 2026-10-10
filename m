Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91E24A64CF
	for <dmaengine@vger.kernel.org>; Sat, 10 Oct 2026 12:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791636329; cv=none; b=n90wUR/b4NPmEreDeRRzFVo0L2EpHfPElc09mBOdQSV76enM3FLOti8I8+lVlDRttkQxvNWc4Z3foW2WEtS4sFPoBrjUzHylBLleWsiE0B2cwjB6V0ISoXRAaioJdZCq2I9Z3Hd5E5KYeJVLxDRc5lTI8cIe3dhnCtZRYloDcKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791636329; c=relaxed/simple;
	bh=/CwrHnHOzIUrfSQYZEQRb63E6XOHyslFCO10Q7vbk0k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SQdDjyn5LhQOC3mMeenfbeerZYZPySbmfKEyvzBShZ88oXzpfiyDZ4Bg0Tjo7mnFk80UxvUJsgXyDjMVKQG0uW2LcpI4cBXPNFUO0/dsQ+SBT+VqM2uwFs3ugCiHJWJ0QHztwokUdRiLKB6CUmRHLgPP69oZLxMmuNOE3N0CHCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=P/gD4UW7; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="P/gD4UW7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=BkbY9chiUiTRa+opPaeA800jcUPjZ9Q9dzgQpnLfD4k=; b=P/gD4U
	W7inN/hxpBJm8IJZKCrTIqUcRmpXV2YBs8E+FXRfUgA41ngl0qp7RCEPpgGIs5vI
	Sgi8yiibFHG6jaBU+unK78Re8rYHO8b0JQ/rusJO28G39coFKMtGCLBWN2pC3LOL
	Ei/8GNvPIg3kOYOrFqcvIfenEiYsedhWULDEOuxiO1/xGSsY0AtH8YI8HGbC7343
	WgdTzrti+J7WRV19QGB/AHlvS7Qpwd2lUdU72rSmDtGNghAvHtMlStv8dsdhnIQW
	InzRgm/o4ChOn5LzMjhH0cdqIXgtVK1fP2V2BLGqv4GowOJN4nOP3ZSN2gR1F26Z
	1m4AWOEKebwkgBzg==
Received: (qmail 1548928 invoked from network); 10 Oct 2026 14:45:17 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Oct 2026 14:45:17 +0200
X-UD-Smtp-Session: l3s3148p1@w3E91ntd5szV64Vz
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: dmaengine@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Kelvin Cao <kelvin.cao@microchip.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Subject: [PATCH 7/8] dmaengine: switchtec-dma: unmap descriptor before completing cookie
Date: Sat, 10 Oct 2026 14:43:45 +0200
Message-ID: <20261010124348.19055-8-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261010124348.19055-1-wsa+renesas@sang-engineering.com>
References: <20261010124348.19055-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To ensure that buffers are flushed, make sure that the descriptor gets
unmapped before completing the cookie.

Link: https://lore.kernel.org/r/20261009093745.539924-1-vkoul@kernel.org
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/dma/switchtec_dma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/switchtec_dma.c b/drivers/dma/switchtec_dma.c
index a386c3a284e6..84a0a2e5e872 100644
--- a/drivers/dma/switchtec_dma.c
+++ b/drivers/dma/switchtec_dma.c
@@ -486,8 +486,8 @@ switchtec_dma_cleanup_completed(struct switchtec_dma_chan *swdma_chan)
 		}
 
 		do {
-			dma_cookie_complete(&desc->txd);
 			dma_descriptor_unmap(&desc->txd);
+			dma_cookie_complete(&desc->txd);
 			dmaengine_desc_get_callback_invoke(&desc->txd, &res);
 			desc->txd.callback = NULL;
 			desc->txd.callback_result = NULL;
@@ -529,8 +529,8 @@ switchtec_dma_abort_desc(struct switchtec_dma_chan *swdma_chan, int force)
 		res.residue = desc->orig_size;
 		res.result = DMA_TRANS_ABORTED;
 
-		dma_cookie_complete(&desc->txd);
 		dma_descriptor_unmap(&desc->txd);
+		dma_cookie_complete(&desc->txd);
 		if (!force)
 			dmaengine_desc_get_callback_invoke(&desc->txd, &res);
 		desc->txd.callback = NULL;
-- 
2.53.0

