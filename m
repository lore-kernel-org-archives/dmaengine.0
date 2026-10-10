Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657FE4A5EC2
	for <dmaengine@vger.kernel.org>; Sat, 10 Oct 2026 12:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791636323; cv=none; b=gIJJi+zDpUKlcwxz2vF3K4SmrIBOuFLDKyz99lChxHy+M3YAe1ljOZ+mQBL+zE84Wtj6tCLQkq/8/SLIZc8PAusOA0QqPbZJDjMCGZUYYSvYWRQG1kF4U0WJL647YSbcCn7Ub9U2QLf25LMJHhkJhoEFlXFO38otAWNw89n9/oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791636323; c=relaxed/simple;
	bh=Tt+BWm5QuOAgGtzY0aHYte8IdK6d45tD+YUAl+mJW2k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Po0vO7ID6BafV9V3P8eqnB0RRRcOb8pRA3QyDuoMfMpATCOTvMt+tTvPAYHys0zZThI1dtkkBX16RPhOoP/PzP6EVsGuXgauNsLZ0LGzQAAhZsIBEKX5OjwAoV1CneN3vt/Ziw2Wetly9Hqfr9nJPyGUbfiGTtjv5BKMJKvKFYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=TZOuZFla; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="TZOuZFla"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=PvgdP8WOH6w1/yzYlykXjJikWNIuZp6OaomqezLk6+s=; b=TZOuZF
	laGX87SO3muIHgQqZvXLYABInJz3zsMyEkO97GivRsva1IHFhmDa5IFNQWISLefq
	/nh06LlVTozu0RmUCBzgOfGLn8CmaMQAV7BMiCgr7F5Y0Pq1ExSkj0XFoeFBnq/S
	JkExV95mM5prLgb79UfdUgqfEZRf+L5IKmRNd88HUREIMVP3/jp7SAo0pydkphBC
	GhaC9SZpGXYJYftRoTJ1LFBmCkLtiOoMdRJmz/SvY2BgNuyC/V5IyaR8PNYbaq7J
	3JT74peXuUZYXB2Nnlq8ENJDHUeCCFKEKi+eJqR2OcVsF1RBfvaW+49CPGD8YCBj
	bTzZZ5ny4zcqi69Q==
Received: (qmail 1548762 invoked from network); 10 Oct 2026 14:45:09 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Oct 2026 14:45:09 +0200
X-UD-Smtp-Session: l3s3148p1@86DB1XtdZoHV64Vz
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: dmaengine@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Subject: [PATCH 1/8] dmaengine: ptdma: unmap descriptor before completing cookie
Date: Sat, 10 Oct 2026 14:43:39 +0200
Message-ID: <20261010124348.19055-2-wsa+renesas@sang-engineering.com>
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
 drivers/dma/amd/ptdma/ptdma-dmaengine.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/amd/ptdma/ptdma-dmaengine.c b/drivers/dma/amd/ptdma/ptdma-dmaengine.c
index 628c49ce5de9..7f51d1e6c727 100644
--- a/drivers/dma/amd/ptdma/ptdma-dmaengine.c
+++ b/drivers/dma/amd/ptdma/ptdma-dmaengine.c
@@ -224,8 +224,8 @@ static struct pt_dma_desc *pt_handle_active_desc(struct pt_dma_chan *chan,
 				if (desc->status != DMA_ERROR)
 					desc->status = DMA_COMPLETE;
 
-				dma_cookie_complete(tx_desc);
 				dma_descriptor_unmap(tx_desc);
+				dma_cookie_complete(tx_desc);
 				list_del(&desc->vd.node);
 			} else {
 				/* Don't handle it twice */
@@ -362,8 +362,8 @@ static void pt_cmd_callback_work(void *data, int err)
 		if (desc->status != DMA_ERROR)
 			desc->status = DMA_COMPLETE;
 
-		dma_cookie_complete(tx_desc);
 		dma_descriptor_unmap(tx_desc);
+		dma_cookie_complete(tx_desc);
 	} else {
 		tx_desc = NULL;
 	}
-- 
2.53.0

