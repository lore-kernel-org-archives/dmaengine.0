Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A228047125E;
	Sun, 20 Sep 2026 19:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789930806; cv=none; b=XS0/WI/DSkddIPRBKCcZFITFo84/C/7ukqMG6y5u7M96VYbYSNGBhaKr98HvBALhg7lPdOM2FoS/E6fA3LDDJSaK/I5wExZyNf6J4owlWIFoyX0nj5l79VQW6cL9qR90Kj7pZFDFwAYF7fcDcEjz4FEoNKKR7wKCaEg+iMWMSNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789930806; c=relaxed/simple;
	bh=FYOaLpLuIT+cdgd+SUBwMhvg0u7Zm1c0etjrkGcx/Vk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BMvIbGd60KXP/vwYDdTAGzfmA9Z2tVQa71E7UytHazMEycqGsZZ4pLZkFHZclpMnvW++RZ8yCAww6jJAg++RnWgRI1XwRMKpJJWoql5HVdN1sqTsXlWJ1dYaERtN3HXNsHpCOorhy8f/WrMtahDycKG1EiDJVahpXKwA6eL38Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fPE0X3OZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fPE0X3OZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B2B11F000FF;
	Sun, 20 Sep 2026 19:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789930805;
	bh=r1JdeKd3Vv8i8+rXFcFc49QtpBubKkLcHy+Ic3ggz2o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=fPE0X3OZkGVZFfevtA/Cl8GRJZQUsl7bJ6zW3NT0fh8IO4sLqdljupE3CdsqaTodY
	 rHfnERiV58fm3eZ34KwfWMEsq2sqhNNzQAzm9h+uqfZbUoiHxL4/lx15wpIwjahC5H
	 aYkTDAHJ0MH6lU2Ft2VpZ2FzGZ7g2KNMobtoCaaozUWK08GRxkfb7PioaM7dL9MQXa
	 peVX4cO3VGVBjF+gVLjnSmWGbkHACeQmyQAA5Meetv3o6mukmxgKArEQNfxQQJbFgk
	 Zd40wbBORzUUp33pDR8I8w6ufXQ2sqkCPZlMJmPJTHKm8B92wAAq87EF3oKqHhi/kp
	 OWoDqHVvKeswg==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 20 Sep 2026 20:59:48 +0200
Subject: [PATCH v5 13/23] dmaengine: ste_dma40: Fix probe LCLA free
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-dma40-fixes-v5-13-5c55cd7f92f9@kernel.org>
References: <20260920-dma40-fixes-v5-0-5c55cd7f92f9@kernel.org>
In-Reply-To: <20260920-dma40-fixes-v5-0-5c55cd7f92f9@kernel.org>
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
index 33cd93e90bc4..77ae6b28610b 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -3902,7 +3902,8 @@ static int __init d40_probe(struct platform_device *pdev)
 				 SZ_1K * base->num_phy_chans,
 				 DMA_TO_DEVICE);
 
-	if (!base->lcla_pool.base_unaligned && base->lcla_pool.base)
+	if (!base->plat_data->use_esram_lcla &&
+	    !base->lcla_pool.base_unaligned && base->lcla_pool.base)
 		free_pages((unsigned long)base->lcla_pool.base,
 			   base->lcla_pool.alloc_order);
 

-- 
2.55.0

