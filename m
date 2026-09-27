Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2EC36EAA4;
	Sun, 27 Sep 2026 09:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790499829; cv=none; b=PGhqBC2ngI+77yoftNHcmVjCtmHyKfxVbSID3DXsvBJzPUGK+jmfdUAumdgXzkWNpvx4LeU8WkCFixIdJl/0mfRonNLbOPZHv9t1meR8+YOrNsTpoXbojC8uHopTXwO7RaRhMKpyAYwHH2Nzp5AEJ9wYrelGJwhUCUYVI68H2w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790499829; c=relaxed/simple;
	bh=Pe5y1disw2A0X743A5VLxwm0l4NYOxBE10T/fs1Dzhc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WNYEZaZBg97y/Fg04n7nBx2wCH6Rpy/LW+n26Xf6hyt1UJVfMsbOcotHEj4BXfMdUMK4luneI6ANg1TL4uLCGmrYfYgzdqm9vr5IgmUagTtitqmfjniERChgh9xFiJRPGYEYD0TZusNDe11+cw7+DFeLaW2vjcuuhbtfckoqgaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kxbZP6xb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kxbZP6xb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F01691F000FF;
	Sun, 27 Sep 2026 09:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790499827;
	bh=zMEHykQUMo2zHXK36TwUkFvCkWrRk5Smow83RICwVBA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=kxbZP6xb4cQUqTuL9rt543gVmbQkL6aY0896wAkflwFn5s35y+fy9eSKSTx0Xjx8b
	 jCKZRYTj3MavmVa0JzvvboEB0jxm14dZXza9oHde4Ae4v/vcng71bSdX5GIn7qGdzM
	 K6Afsd4AH7LAdzdkQvVdemq1EWsJtBY2B4GlPJVwOP8roDdVmXYrAKNNFMbUUvZVM0
	 J17mA3+Xb482RFttrNQLgtn9HeIhr50cocDA994jAB0hcN7IPNpySQQp3IE08qrZks
	 GLjMvFTyqSy4HP67tQbAv18m8QtBi1D71IP32aITPagL9iGS+w3fXI+SKW6jRvlvYw
	 Edcuw33GolIvw==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 27 Sep 2026 11:03:26 +0200
Subject: [PATCH v7 13/24] dmaengine: ste_dma40: Fix probe LCLA free
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260927-dma40-fixes-v7-13-89f595e8851d@kernel.org>
References: <20260927-dma40-fixes-v7-0-89f595e8851d@kernel.org>
In-Reply-To: <20260927-dma40-fixes-v7-0-89f595e8851d@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, phone-devel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, sashiko-bot@kernel.org, 
 Frank Li <Frank.Li@nxp.com>
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 58bc08c2ed0f..e3756d8edc61 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -3906,7 +3906,8 @@ static int __init d40_probe(struct platform_device *pdev)
 				 SZ_1K * base->num_phy_chans,
 				 DMA_TO_DEVICE);
 
-	if (!base->lcla_pool.base_unaligned && base->lcla_pool.base)
+	if (!base->plat_data->use_esram_lcla &&
+	    !base->lcla_pool.base_unaligned && base->lcla_pool.base)
 		free_pages((unsigned long)base->lcla_pool.base,
 			   base->lcla_pool.alloc_order);
 

-- 
2.55.0

