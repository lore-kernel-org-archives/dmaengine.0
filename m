Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6142384CD5;
	Sat, 19 Sep 2026 22:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789856561; cv=none; b=NZQk5IpSYDccm+IE5SOcScx5kCgarN6UW9izXIMGsZKKKFuvilIlTjowNi4KFUXlk6M8v7fNgXN2ToR9ky/HLhRL6z/U5a1ijhLz5dHDnZXSgOUHSo7IqIEfvKmJXete5Rrw2j0aZ3HJ9ZzRVhRYxXVbZ0A0b3MpR3etTvf7vf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789856561; c=relaxed/simple;
	bh=BfKapbk146WBlCU1F9H8KYBjt0JO5mEZegX9GkPLFww=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I+kXaFzGY9Edue6J5EzTmxXLlazPSSQsafiBQkaHuZ4va3S5AQQKw2n80WBVhsuQxjyzOV7540RdLcY2eg6lbWaM2KoaPbrFpoIrlnVpRqFJQZGza1IxDR3hgmcdKtdb9b1hYAx3gyRsS/x3QRZOPhV9AeUm5m/xRzN1RyHrSbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ljGzubjd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ljGzubjd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F42F1F00893;
	Sat, 19 Sep 2026 22:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789856560;
	bh=rKGBGWWjSr7LwXnQ9S9Ih3HfcOc0SppyhJHOBzilA24=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ljGzubjd6d3d3nT0ICcJJao29UBWqqOCiOqKefw4RDnvm/XO++om1zWlXgkCTM9Qq
	 jzAlecZifVCkwWr/yBYtngjcrmIVshrvFGv8Rq+5EowfNWO4OXxfF9aqsgGvI5ui0t
	 bFU0KUCWz/upJUEZyJFn7udVdQnU/uMRZ2gps4YoGH09oJWCLTwJcx1MSOJyHKg4r9
	 AISamp16dhciMG5OF+SvMVJ+M0I0jbQlrNvV/vL5A9zDkXB0vepU3ImHAb8Y8tVpUp
	 HrYiMuc8+dwLLBrUkDMlyzZb7URmn/wuCCkYFnMqzb/SfGEH+LN0ON0qBGM3MduLfz
	 /lxrcPIYtUz0Q==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 20 Sep 2026 00:22:24 +0200
Subject: [PATCH v4 13/23] dmaengine: ste_dma40: Fix probe LCLA free
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-dma40-fixes-v4-13-d751b2d9c23f@kernel.org>
References: <20260920-dma40-fixes-v4-0-d751b2d9c23f@kernel.org>
In-Reply-To: <20260920-dma40-fixes-v4-0-d751b2d9c23f@kernel.org>
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
index e781122abce6..acbd536cbfdd 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -3879,7 +3879,8 @@ static int __init d40_probe(struct platform_device *pdev)
 				 SZ_1K * base->num_phy_chans,
 				 DMA_TO_DEVICE);
 
-	if (!base->lcla_pool.base_unaligned && base->lcla_pool.base)
+	if (!base->plat_data->use_esram_lcla &&
+	    !base->lcla_pool.base_unaligned && base->lcla_pool.base)
 		free_pages((unsigned long)base->lcla_pool.base,
 			   base->lcla_pool.alloc_order);
 

-- 
2.55.0

