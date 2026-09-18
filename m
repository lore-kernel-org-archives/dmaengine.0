Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4443DAACE;
	Fri, 18 Sep 2026 16:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789748690; cv=none; b=gPH1RqLBiZWpLwBzRA4CZoEsPZMbGbIXZYwI+LVw9fM2RAYsHB7v7xQthImdjCPh2pdO91/FN9KimPkT8lNEIYa5PIyuB07vzW1dkZU9g7jdOhVOK98zRcX6Xzk7G0/btEaPEvE2Q+inAg8Idht6gfiipYPGNg71ekGs0QkDAEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789748690; c=relaxed/simple;
	bh=iqZ9jPrqjAuo3mrSFu2PHVhYOmrtRnIIMLgz4CvTzAE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=owCl2eXzJgZwQupo/QJWyhGPiYnF9d+XgMa1dGkfFnW244G9kgLKQjEzKQ2jtURszpjeX3W2xGAGNaKqAi9UmWbaC4SICDPVxYmfd9kDVdg/ooAOb1T2olHBFAszf0dEl13FPamquMsoJbRomqiJPD14ZVghVm1zwYQVuW+vcU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PgeqPzbv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PgeqPzbv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CD031F00899;
	Fri, 18 Sep 2026 16:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789748688;
	bh=BqJ3wzs4O70BiaQ/0q+lr1QwvSCyitT+a2O/f5l/IEE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=PgeqPzbvVfeXCOVPKrQvZoN2lGJ23bm+X4Q+GQKFZjEqYdG81hpAP6M+yPZDnQSUG
	 mKrIl7MnJnuatoJIwkbeQXRrzNoBbf6AyJsnPmQRv1EvSzzcg8GCbWjf7lCEaB2RfV
	 6qVebFvceOP6gXJx80ZGLpmUcRoGbA5k8K7fMbwbGewnQ+0/tBPormoRDAfXDALoi6
	 dV5hjOF1bOgDvDW4Vr663KK//kdw/JrYfsP88HTxK2MgsS2SDKGLV7rHjSCOoBwWyB
	 EHQ3vCoE8QYdqUAVJstWcWzaVYfzpwesHfH0ye/dJkFE9jL/XoQAJLpBL/q9hXfNGs
	 8yyP+SiNww+VA==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 18 Sep 2026 18:24:31 +0200
Subject: [PATCH v3 12/22] dmaengine: ste_dma40: Fix probe LCLA free
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-dma40-fixes-v3-12-8dd8450669e8@kernel.org>
References: <20260918-dma40-fixes-v3-0-8dd8450669e8@kernel.org>
In-Reply-To: <20260918-dma40-fixes-v3-0-8dd8450669e8@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, phone-devel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, sashiko-bot@kernel.org
X-Mailer: b4 0.14.3

When LCLA is placed in ESRAM, d40_probe() stores a devm_ioremap()
address in lcla_pool.base and leaves base_unaligned unset. The
destroy_cache error path can then pass the ioremap address to
free_pages().

Only free lcla_pool.base with free_pages() when the driver allocated the
LCLA pool from normal memory. The ESRAM mapping is devm-managed.

Fixes: 339f5041089a ("dmaengine: ste_dma40: Use managed resources")
Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/dmaengine/20260819225114.AE1511F000E9@smtp.kernel.org/
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 3ffed78b0527..104447f7080e 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -3767,7 +3767,8 @@ static int __init d40_probe(struct platform_device *pdev)
 				 SZ_1K * base->num_phy_chans,
 				 DMA_TO_DEVICE);
 
-	if (!base->lcla_pool.base_unaligned && base->lcla_pool.base)
+	if (!base->plat_data->use_esram_lcla &&
+	    !base->lcla_pool.base_unaligned && base->lcla_pool.base)
 		free_pages((unsigned long)base->lcla_pool.base,
 			   base->lcla_pool.alloc_order);
 

-- 
2.55.0

