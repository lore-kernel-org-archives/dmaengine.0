Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5224A68BC
	for <dmaengine@vger.kernel.org>; Sat, 10 Oct 2026 12:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791636329; cv=none; b=V6vRExy2hh2V0BNsNj2Hj4j4VzYTuFSvU6DY23aLUfGb9EoDh3cKyO2BNvkHsFrTv5QkCzmAf9kCOHKO7lCXQrM/HYDYRf7s+nzH7JXJGnGroSCzc9c4ZFMdEG5YkH6scRSdb0XzmIAVlWTUy26lJRrLdQnyc2ucgtjqiNiTM1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791636329; c=relaxed/simple;
	bh=T4gS0MmNz9rbavEDA8HH+sXzjDU6ybTZ6TJW4sMzFOA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RuriMGIn5D/5bByNh5I2kbf2odyODfpI3sFU6yRA7V1bhGksNZZg6+h+IwZTYJhBGoVTRzYoDcF7fkN49tRtU10q5ZKPcslDjsLPIqQ6Y71Al2LIdyF042H+6cH+G1OHhGmjoopIckulDXYVQGF3EMq/d4xyYM/K97hfzdIFbEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=FZUxYNlZ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="FZUxYNlZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=B98AYOLBqs3rgjWA4IBzn0uvBEcQs1N4swTYBPzH2x8=; b=FZUxYN
	lZ13a0UAhIy4HI9tOxDYyDRUQaiX0GhnL5wIDXA2ermjTGfY9S6lz66Ucaa0xnbf
	3Ezx8CNK+CrTYsPXug2M79+6LXnAiQyJDeBZS0YWG5ohbnrZYr6HL6HtqqaZ4IDn
	yxI/FjGBOt1wbjtrh9FBECu64AJcochnJU+NV1AktcZA97kR3reJ0qEKQkWfrDPN
	uJl5BSxJxP5jw2WceIhf8Blx/qgd9cNnX5enOOai9ai1XWyb1PVGuu8/xb+5eOe6
	9dSinQ4/yGQirH4sE6KxXykuTbkzNGifAqB+f8rN4ydvfPMiPVRJFtJKSfGOtK6R
	usY1MyKLYa4N0icg==
Received: (qmail 1548942 invoked from network); 10 Oct 2026 14:45:18 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Oct 2026 14:45:18 +0200
X-UD-Smtp-Session: l3s3148p1@MmFO1ntd8MzV64Vz
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: dmaengine@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Subject: [PATCH 8/8] dmaengine: xgene-dma: unmap descriptor before completing cookie
Date: Sat, 10 Oct 2026 14:43:46 +0200
Message-ID: <20261010124348.19055-9-wsa+renesas@sang-engineering.com>
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
 drivers/dma/xgene-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/xgene-dma.c b/drivers/dma/xgene-dma.c
index 8d1c58ca0d48..698d7ca7ff7f 100644
--- a/drivers/dma/xgene-dma.c
+++ b/drivers/dma/xgene-dma.c
@@ -548,8 +548,8 @@ static void xgene_dma_run_tx_complete_actions(struct xgene_dma_chan *chan,
 	if (tx->cookie == 0)
 		return;
 
-	dma_cookie_complete(tx);
 	dma_descriptor_unmap(tx);
+	dma_cookie_complete(tx);
 
 	/* Run the link descriptor callback function */
 	dmaengine_desc_get_callback_invoke(tx, NULL);
-- 
2.53.0

