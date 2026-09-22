Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364945349CE;
	Tue, 22 Sep 2026 23:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790119855; cv=none; b=RIL9RsdeTcUcCY2NznB0OxeM6KiZ2rRB1TgZT4DS3epyUD5EJOTNa4LjZWPwAsXWkut4OB+6r3AWy+4wZDv5FNGzgwjfBBzTKhWwMiuUqs/A8NPZvlH/WXfzKsPqz2GMZUR49WAZG+oAaQPJW4GGz7KEQ2ULBkLF9KjAkRhgcUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790119855; c=relaxed/simple;
	bh=8RGtbZ0xG5upIHpS3YgEItHjDa6d2pB7po4AAIGReqA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t3OK6apTJ3yzS8ZtU57acbHibxl4ojj3qE8ASyOb231qtzCOxJO17+h56kFlXPbBTzSJ0rL3nC2CDs8VyoNye2gU+jj7dgBfHcGtok9ij27bCQ1nwjx9MHRGZREmDmexO7yDZWHL9/kSIqRntKeexBc4zNQAdIwkv1TKzap9Q6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=knJdZMqg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="knJdZMqg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9054C1F00893;
	Tue, 22 Sep 2026 23:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790119853;
	bh=VVyLVOKGDjPy6u3ZdT92MM0ODZ0X9BOS+Z+wPjGxHd4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=knJdZMqgZZWA5VwEfFPt8R5Go1xUWQpY4JFhJ6GKRTwSsmdi9VHwW/kZnh7ZODF+u
	 TU8KqmX+iO6VLJHuRuq7GYJksfsQMWqxLawpC4poB5RWj4Uf55hB0lTkIq3+XmQhfO
	 efeOO1zYAV9Xjyy6T7NoRd9DTJkH2mB1qfBLWlYufzlTdZj33UR9F1MWgSBlziLxaa
	 opDFeAtW4s3E8mVlyDJSAXdADzhFlAjGNMK5M5SDOC1iD0Md6DYLovcJ2JLHoz3M5a
	 7KCEz7CVqbAUcHypP5ho0OjZvHItmgByHuImaFrOe7+tIeOlcuVMpMnhvNkzetHIz/
	 +tCaPp77xSI0A==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 23 Sep 2026 01:30:46 +0200
Subject: [PATCH v5 01/23] dmaengine: ste_dma40: Fix physical cyclic
 capability
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-dma40-fixes-v5-1-709d160cde76@kernel.org>
References: <20260923-dma40-fixes-v5-0-709d160cde76@kernel.org>
In-Reply-To: <20260923-dma40-fixes-v5-0-709d160cde76@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, phone-devel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.3

d40_dmaengine_init() configures dma_both for physical channels that can
handle both slave and memcpy transfers. Physical DMA40 channel setup has
supported cyclic LLIs since cyclic transfer support was added, but the
DMA_CYCLIC capability is set on dma_slave a second time instead of
dma_both.

Set DMA_CYCLIC on dma_both so d40_ops_init() installs
device_prep_dma_cyclic and physical channels advertise cyclic support.

Fixes: 0c842b551063 ("dma40: cyclic xfer support")
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 0d9ffa3e2663..e4d689c9eba8 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -2897,7 +2897,7 @@ static int __init d40_dmaengine_init(struct d40_base *base,
 	dma_cap_zero(base->dma_both.cap_mask);
 	dma_cap_set(DMA_SLAVE, base->dma_both.cap_mask);
 	dma_cap_set(DMA_MEMCPY, base->dma_both.cap_mask);
-	dma_cap_set(DMA_CYCLIC, base->dma_slave.cap_mask);
+	dma_cap_set(DMA_CYCLIC, base->dma_both.cap_mask);
 
 	d40_ops_init(base, &base->dma_both);
 	err = dmaenginem_async_device_register(&base->dma_both);

-- 
2.55.0

