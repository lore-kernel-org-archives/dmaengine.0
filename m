Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485CD443AAB;
	Thu, 20 Aug 2026 13:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787231710; cv=none; b=YCD8YP/WUPpveigiu9bNOFIRDk/1FPDUpJeecp1/zg0rCr8Q7T+Pf8lz3+4rM16Pv2ElsvTV7Ep6GCUOlMYoShrqgltCScdyxmLFwH3E6CWcrrojYcWH8a3Ib5csZwQs65BT5Yjx4+lYSvxXSYtMTWzRkta9sx4OBMxrtnONUns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787231710; c=relaxed/simple;
	bh=LG1VWxZMO0UQ/RWpEPzB8+q0R5mxApVeLI7357iymFM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B9g04M+rCOIgJTrLgritj/DR0WJr64iKtCRqvUbgnwcv/xd0tIG6U4+HYn/B6ifNBHs9anXTVtmylWWl/xkQi6r4lflcgHr+K3oyhtggwj5Mqrc6TOItZ0L1RbkKi65dxGMaXjrJa0NuyoyGuL4YIdLPJmhB3fiHVLRN+QeH8+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qm7QJ2IE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qm7QJ2IE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B5BE1F00A3A;
	Thu, 20 Aug 2026 13:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787231708;
	bh=0EjxOPzVMm3B6X7kgOBdU57fR1sqX55VKYOum+MEuZ0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Qm7QJ2IEyk79x6wWf2b8U7CXTc2ypvW7rCSZcv+ixPnqGykVX6GNJKDzZ/lDgCPuz
	 T73O1UBGbG9JjXypjdBt8/2OxXxEQQi30mMqZgFTOuNUfFYpxjIWyq7dZq0zOj5Bec
	 rFXi2iPzZoL+OJHi67sIp8zOG/iWCIefgK97BYIUoikJjG7RU8p8ASLFyHQdpmd5tm
	 ITHqRtdmYboZ4JuUOehxsBXRQQ2rQCh8v140/b5XhKjo/0Ff2mgBSGabQphQ5hCVWm
	 fal4QHG4y9In0ReJyfaSFEfEcPheDktqpmILE0E+ogSSgCNh4EJTwmVs2+IFBCMET+
	 Wu/wUDeP5NWEg==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 20 Aug 2026 15:15:00 +0200
Subject: [PATCH v2 06/13] dmaengine: ste_dma40: Fix probe LCLA free
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-dma40-fixes-v2-6-63238334c707@kernel.org>
References: <20260820-dma40-fixes-v2-0-63238334c707@kernel.org>
In-Reply-To: <20260820-dma40-fixes-v2-0-63238334c707@kernel.org>
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

Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/dmaengine/20260819225114.AE1511F000E9@smtp.kernel.org/
Assisted-by: Codex:gpt-5-5
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 804eb5eab06b..739e47941d0c 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -3667,7 +3667,8 @@ static int __init d40_probe(struct platform_device *pdev)
 				 SZ_1K * base->num_phy_chans,
 				 DMA_TO_DEVICE);
 
-	if (!base->lcla_pool.base_unaligned && base->lcla_pool.base)
+	if (!base->plat_data->use_esram_lcla &&
+	    !base->lcla_pool.base_unaligned && base->lcla_pool.base)
 		free_pages((unsigned long)base->lcla_pool.base,
 			   base->lcla_pool.alloc_order);
 

-- 
2.55.0

