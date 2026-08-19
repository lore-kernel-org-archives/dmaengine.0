Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B49A2773CA
	for <dmaengine@vger.kernel.org>; Wed, 19 Aug 2026 22:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787178964; cv=none; b=PsJoN3zWD/s9+Jq4uwvfYToQ8KMgqQoSwmcdYqe+ErXZ84E7leM5ioHcwQYx6QqXwlZRJb0CY4KN0A6GXFmO5xF5el/x5mTDbUYf433zSx7QnY+cV+fBEdHuHGiECoXitnKFdWxh6w1V6lc9hy9AOqdNCvZEPL00QR73SvUC5X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787178964; c=relaxed/simple;
	bh=LZf4xNo4JVlWqH6VRznwZIkJO70gx4GwaX9o1Gm5gV4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c/qNALWVXTkHQ2hBZ+p3o0KDLYrII7sXxP4wUQPtzQSvDv2ETo+n9Gy76Enf28kWE5waTWLmE01utF3zGJ9uw8ullMRueWb8avFuzUXlJvMTW8YUshec7m0yjA8zC0UzNNLRQio89MbyHFXWZQ90e4nSfwajjGxpVqsIC9ZoHiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nbuBysZP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nbuBysZP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 207AE1F00AC4;
	Wed, 19 Aug 2026 22:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787178963;
	bh=x9MsGqxmjwVzeZkmNf1aa0dp+twi766nNeFjH0chqZI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=nbuBysZP8BUwoSOfeEEiG5NvBWy3Qnvu+GvBVUl/StEWhUG4B1MvPIIxDxhZigg6v
	 Hkzwp9DruZzkmg6vHDcjJnCf4lPOVlKFr2/O/3Ox7sQ5n81fz0BqzI5yepQBXM0ZJo
	 ldMpMS5ZRTxApNO286NhPItFCx6eyN6VnTCxhfpv4Qb8oF3Fz8zzcJX9pZbXYG88lK
	 0ky/NoXvOuIDKCqebX+fdQ6D1KyI3ua3MHgTjzIQgW8ri9a+uDGu2u+EWtVGp7yCMY
	 smJy1AhcgbOnx5YucveQOVWzq6tINRCE7k56GLGycotRRw/dJ5kxnfHUcvbz0NWJwR
	 uF4cdPNxfeSEw==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 20 Aug 2026 00:35:57 +0200
Subject: [PATCH 1/4] dmaengine: ste_dma40: Fix failed start cleanup
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-dma40-fixes-v1-1-5e14815ad689@kernel.org>
References: <20260820-dma40-fixes-v1-0-5e14815ad689@kernel.org>
In-Reply-To: <20260820-dma40-fixes-v1-0-5e14815ad689@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
 sashiko-bot@kernel.org
X-Mailer: b4 0.14.3

If d40_start() fails after a queued descriptor has been moved to the
active list, d40_queue_start() currently returns NULL without unwinding
the descriptor state or clearing the channel busy flag.

Fix this pre-existing error path by removing and freeing the descriptor,
clearing the busy flag and returning the error pointer to distinguish the
failure from the no-work case.

Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/dmaengine/20260618051539.15E201F000E9@smtp.kernel.org/
Assisted-by: Codex:gpt-5-5
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 0d9ffa3e2663..d5837aa0a789 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -1531,8 +1531,12 @@ static struct d40_desc *d40_queue_start(struct d40_chan *d40c)
 		/* Start dma job */
 		err = d40_start(d40c);
 
-		if (err)
-			return NULL;
+		if (err) {
+			d40_desc_remove(d40d);
+			d40_desc_free(d40c, d40d);
+			d40c->busy = false;
+			return ERR_PTR(err);
+		}
 	}
 
 	return d40d;

-- 
2.55.0

