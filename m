Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C985A4A2060
	for <dmaengine@vger.kernel.org>; Sat, 10 Oct 2026 12:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791636322; cv=none; b=CCe84chJK37I1THui02/9mCFe2krQSeon+Gx8w71aJhcWDgPVX65Sjl9NIXPA2dr4C8cTR5ifIN9PDjBEPFYT69W5I9ZRfVWqGQ/FuCEoaeHwoTPxRldXgkzoLvCtGbLEQs3hG92mN+JjmKXv/MwUrCN1/wqAqPN34c5AldggnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791636322; c=relaxed/simple;
	bh=7jTnNF0kDmSH1FCz0i74zSbvsCeP3jkjWojOfxP0tT0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XcT4zpOCc5/dzMt5DJUKbHstxSyRzymcKGmZ0WuuUdfRv2bAGkm+jRpKxvrDoAMwft/Gh8v4Py9Jz678sAvxgrrMBcKbgOgT4s6VyzqJk+vVH4Y08o9OxTyxvRa3uRR9+Uuq184lU6ie/nlzF0gfHu1K/+K1WqO62Ti2OmbT+mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=DWEOMMfm; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="DWEOMMfm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=g6stm/pfzMjbl+jeEOO7vU6ITchruNK3FFpt+Jju4ao=; b=DWEOMM
	fmpUHq98OOTLkXwJAWcdgKK5OchUmTuHyVOiGMXmJb6qq2baSMgwW5W93duzH5FD
	9ZlEZmBd86XR/3ivzkgIWVDN3vxT11iVrgoOGigzM66dzikV/1PKPucQUfjwbVts
	SLYA3bSRGDri0+i8zOX2UzlhNe84W99yRrNeg3Ttb6yJWrvTyABpvpI7z9LAMAYc
	BlgQt+Q3KfdVXYdBc/GxNMdfsHnUmcq3i8vP+JiSFTD4R6u1QeprOPpgNilPGu8T
	7WXNiM+VCrh7aQhHWOgDpzY9kzVSf7MwxxBmE3Oei3iy5Oq0V+V+fEGiu/KeFWCT
	wv3N7mRFk4Z+CCYg==
Received: (qmail 1548894 invoked from network); 10 Oct 2026 14:45:14 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Oct 2026 14:45:14 +0200
X-UD-Smtp-Session: l3s3148p1@FwQR1ntdjoHV64Vz
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: dmaengine@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Subject: [PATCH 5/8] dmaengine: mv_xor_v2: unmap descriptor before completing cookie
Date: Sat, 10 Oct 2026 14:43:43 +0200
Message-ID: <20261010124348.19055-6-wsa+renesas@sang-engineering.com>
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
 drivers/dma/mv_xor_v2.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/dma/mv_xor_v2.c b/drivers/dma/mv_xor_v2.c
index cad4d4fb51ac..8a307431721f 100644
--- a/drivers/dma/mv_xor_v2.c
+++ b/drivers/dma/mv_xor_v2.c
@@ -581,9 +581,8 @@ static void mv_xor_v2_tasklet(struct tasklet_struct *t)
 			 * lock is required the IMSG threshold provide
 			 * the locking
 			 */
-			dma_cookie_complete(&next_pending_sw_desc->async_tx);
-
 			dma_descriptor_unmap(&next_pending_sw_desc->async_tx);
+			dma_cookie_complete(&next_pending_sw_desc->async_tx);
 			dmaengine_desc_get_callback_invoke(
 					&next_pending_sw_desc->async_tx, NULL);
 		}
-- 
2.53.0

