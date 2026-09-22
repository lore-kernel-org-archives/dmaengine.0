Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE6351A14F;
	Tue, 22 Sep 2026 23:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790119876; cv=none; b=jXxMjvxT2EejLRnoMJoyjQQQjQVci9hS0lF4bfa1tengePC2jgki8VPbnTxtfHPZdB+gMKHnyPQWwMF8Ql9R6fwpN5Kd7HTp0KSSAp8NMfWzk7Xwmxs82aeVCpUaOX7YTXyv7BOl6XmXl8D371ceieUuvs0GdspVV6XqcJG4Esk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790119876; c=relaxed/simple;
	bh=FQUUPpuPNo0kBctJjpT+4ZWTfTliG4pMSglWJytlkjM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jqYIMndI7zNymP7iHhA5aNZQrY9pZ20cEef1VA+0Dg6hOX20UI3BROfUfg12DqXP3eT6+DnoQEJLv3f8ivsGT7byhdccjRIjxAO+fv/efm82Yy+HAG+xwPg/uQTwZR6Pldsh+/YtwJYkqQvZtXRvYHTqfae4oYr/HiReKo5WstY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b3VAfoMs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b3VAfoMs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EC211F00898;
	Tue, 22 Sep 2026 23:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790119874;
	bh=IQioFPBgVjzNoeqhryMCE2k0TRHZNcrNrL7YvfTMYbA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=b3VAfoMsHfDYvC5O80u1p9VkkBOqkCuzc/geMapOWHsGiIYa5PNkpAqQ8wVyJoZhv
	 4D1yNe3t+L1w5aM08imPil3tvm4cfEi5JA4m6vL3CyM6/BQQ/QoYfbPrE9L5yi8UzM
	 H4Jth//ODLoc+Delfp9RM9NnBM55rlL9IZtYEqbCzYbZ0zyizKHWXPzKLiRXZfXcB5
	 uscQFHzNxoe1aw5KY57sENgEmXRg53Xa8dY4qpo1mvGJh9Y1FEzo/pGiGo3MRJiMa/
	 jnHmfVHBDIu4smuflbjlEYTdoVREGzzOQdt7TsGbqBhdxm8yyhzMOTjHFNF/GsBrh1
	 wXa2FPMcjvvxA==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 23 Sep 2026 01:30:58 +0200
Subject: [PATCH v5 13/23] dmaengine: ste_dma40: Fix probe LCLA free
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-dma40-fixes-v5-13-709d160cde76@kernel.org>
References: <20260923-dma40-fixes-v5-0-709d160cde76@kernel.org>
In-Reply-To: <20260923-dma40-fixes-v5-0-709d160cde76@kernel.org>
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
index 11b451feb9ff..8b2cd0d2dda1 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -3916,7 +3916,8 @@ static int __init d40_probe(struct platform_device *pdev)
 				 SZ_1K * base->num_phy_chans,
 				 DMA_TO_DEVICE);
 
-	if (!base->lcla_pool.base_unaligned && base->lcla_pool.base)
+	if (!base->plat_data->use_esram_lcla &&
+	    !base->lcla_pool.base_unaligned && base->lcla_pool.base)
 		free_pages((unsigned long)base->lcla_pool.base,
 			   base->lcla_pool.alloc_order);
 

-- 
2.55.0

