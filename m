Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A004A2602
	for <dmaengine@vger.kernel.org>; Sat, 10 Oct 2026 12:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791636324; cv=none; b=RAW4qlq87MV5bnvIidJ7v3gdd5GmTW67qPZfLr23k5+9EtBcrI8gitoieA603x3W+atEYhotJ1EUeeb+6w3Q2Wt1zP822QfncKDyT0jfwFNqaff6Lu1NTZDNnXfGPCoVyc6DD0w3VpXgnKcUk2BHv8VdBY9ymkivuExGWZgiIIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791636324; c=relaxed/simple;
	bh=I+PXv5BfxcNkNkceebEquQxzrJseTBKVz8xRHsGRQ8w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I3Je7F0aBswzn8Lq63iaoN8AGrX6bG5FO8rTQxmQlqwUOyoEk0EE0h17LS3n/mgP+b2S/n5kc5xoBEwpxplebpQiP0Le+nIIlA0sVJV4JoG9RJFu75nx9n5iZ+6pzgNfIl6KUx3fruoqAuuBYtCwAtekXGZClSbvliAeiDMUvaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=RadXYUDi; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="RadXYUDi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=TzCboES1LHufN1Jy6MSG2Fx0gbTFPqf3e8M4lbt450U=; b=RadXYU
	Di7s+qcklXctX6PC49A1+lkTN+3QyUz8Gja6IeQiKdbSv9Fym3JWcLeQqKKkREmq
	6FybM4tQHbDQV+H4DlkCJXyeSu9E9inGstf/GgvSW+Xe4IJjqhrblnO/AvoVKzA3
	yVC+ajcwOLti9XEq+Ins9qAsww0lygmnV65kTU9zWQVqJZ2rBD9XMZaCMduvNP7f
	i18ZIEKkydY1tVl9cwD3X+Q8QdS6WQRU5VdxXDT+TuHiZkFvuX2HqbnVxEBNsXAl
	COBw1OT++haIWa85AcabniGGatr4GznDG7vkIn6xmokNQHxanG27TPLGOPZl9fj1
	6MfhbRvvoCwJixkw==
Received: (qmail 1548914 invoked from network); 10 Oct 2026 14:45:16 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Oct 2026 14:45:16 +0200
X-UD-Smtp-Session: l3s3148p1@9KUo1ntdoV/V64Vz
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: dmaengine@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Subject: [PATCH 6/8] dmaengine: plx_dma: unmap descriptor before completing cookie
Date: Sat, 10 Oct 2026 14:43:44 +0200
Message-ID: <20261010124348.19055-7-wsa+renesas@sang-engineering.com>
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
 drivers/dma/plx_dma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/plx_dma.c b/drivers/dma/plx_dma.c
index 409898e92c32..7b0fd9843b6a 100644
--- a/drivers/dma/plx_dma.c
+++ b/drivers/dma/plx_dma.c
@@ -156,8 +156,8 @@ static void plx_dma_process_desc(struct plx_dma_dev *plxdev)
 		else
 			res.result = DMA_TRANS_READ_FAILED;
 
-		dma_cookie_complete(&desc->txd);
 		dma_descriptor_unmap(&desc->txd);
+		dma_cookie_complete(&desc->txd);
 		dmaengine_desc_get_callback_invoke(&desc->txd, &res);
 		desc->txd.callback = NULL;
 		desc->txd.callback_result = NULL;
@@ -183,8 +183,8 @@ static void plx_dma_abort_desc(struct plx_dma_dev *plxdev)
 		res.residue = desc->orig_size;
 		res.result = DMA_TRANS_ABORTED;
 
-		dma_cookie_complete(&desc->txd);
 		dma_descriptor_unmap(&desc->txd);
+		dma_cookie_complete(&desc->txd);
 		dmaengine_desc_get_callback_invoke(&desc->txd, &res);
 		desc->txd.callback = NULL;
 		desc->txd.callback_result = NULL;
-- 
2.53.0

