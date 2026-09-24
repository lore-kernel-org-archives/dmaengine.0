Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C4840BCA1;
	Thu, 24 Sep 2026 08:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790238941; cv=none; b=O2Toc3cyQ84ueQuYpZrKuKoTzbKqW+PXHNcH7LUtkpm04q62WF9qgnNAw4cch1V51MUxKZkxXb8W7A6F2M9fwbQyPtDZNGcbln7cPDrPQwne6oTo+sl3IMr/BverVXLLfsFi1MP6dOuZMVq0yHJ3aF3N9blYllYzgBlbk/CxMtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790238941; c=relaxed/simple;
	bh=wf5msOGdpYGSYsZhmfdrnlEOrD/WrMJJ6SkTUlGEYj4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e4h0o7meWPfrVheeFpxYMS9s9zO2ieJgFRsHiDOilFDwS4kbUgkxhun1n8Ald4qWCg3S+pUm/6mE6h27wja/wG20cCdip7B7rkw7DXiXgqPDeMEWMPP+PJtQLGilB5ti7V4fiZfUoVaxZCfzh41qmIi+0Js2hb+u34n9dZjLSdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jdn8WkQu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jdn8WkQu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7F751F00893;
	Thu, 24 Sep 2026 08:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790238939;
	bh=gFzALe8lLDC+ymEasY1/oyu1FvCgSo3zjajI3Bx6ZUg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=jdn8WkQu5eDFE+cUq5uOx9OYhaLUNBevJRmgxKai8v4ZETvA0uWkT5KDzsXct2pv8
	 OOMJagPDpbuStSFuBKm1KaUF/vk3FUN3MOPBzF1EkiLSbNEIdhK+ocnB7e23SEkfeZ
	 YtJICWvxoR+d0iEu7qOU5/8qy0onnzwqR6S1hH1g0uqF9n2Vzv7wUnWmsBnmIFM8rj
	 31LmVfxjPwkU3q8CR8yng1SeS8iAUxafPXrW4UTwPaPbUw3BUh3bZ0n/lgFNe8RWnQ
	 F+Lx5RdFFNIR7DkG+HWAEQOzVkzLw/sDhhhX/RLGYrw9cnzdhKHEIePR+C+eAzl0W4
	 VKSZziBw+p14w==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 24 Sep 2026 10:35:25 +0200
Subject: [PATCH v6 13/23] dmaengine: ste_dma40: Fix probe LCLA free
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-dma40-fixes-v6-13-fdb6755020a2@kernel.org>
References: <20260924-dma40-fixes-v6-0-fdb6755020a2@kernel.org>
In-Reply-To: <20260924-dma40-fixes-v6-0-fdb6755020a2@kernel.org>
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
index 8998466faa76..b25e9ed5fcb9 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -3913,7 +3913,8 @@ static int __init d40_probe(struct platform_device *pdev)
 				 SZ_1K * base->num_phy_chans,
 				 DMA_TO_DEVICE);
 
-	if (!base->lcla_pool.base_unaligned && base->lcla_pool.base)
+	if (!base->plat_data->use_esram_lcla &&
+	    !base->lcla_pool.base_unaligned && base->lcla_pool.base)
 		free_pages((unsigned long)base->lcla_pool.base,
 			   base->lcla_pool.alloc_order);
 

-- 
2.55.0

