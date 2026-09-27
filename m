Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629643AA50A;
	Sun, 27 Sep 2026 09:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790499836; cv=none; b=W1wMDpm0HP/kCdDxzpGN/cTdb3Z14XxsdC0gxktPU0bSJfCWOZiUATt5hjtnjgXkaBJr1YxYUl0SL5BJzhox/+6rv/tGfcMYCNordBRtxO3O6qfsLIG2W/+Jms9v291o1Ggwkag798jV8TLfF6CjqDSe0T1AKMgZUW5lEqRQmh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790499836; c=relaxed/simple;
	bh=9Dy+AqCSSvrKzLag5Wmmy7CE0XJaSA58/S1Kx9nQtcM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J+D93sQt4AVB4zlZoa1c5znI7AMw7s4Q/Y21pn7hBtJKtcD3qRs7FrttaLor86tiVlxnoo9/KfOtDSvkOJnfcl5oKh/eG4oukd3SMeWrn+B6kHKjlcR08vOuzHn4UvZai16XFnCOtUa4RYgx2tbXjR27lokPYRH6WqN6nA31q5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gyTrfOWG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gyTrfOWG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B710E1F000FF;
	Sun, 27 Sep 2026 09:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790499835;
	bh=exyqJvnp3RAvW6VZTVCXWuFT3HPsGwG3ma7VZegj23A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=gyTrfOWGCWjvt/5RUEbqy9g+X4MzJ6h0+wJ6ae0TXd7RayXT0pqaOXubtPPsNckpB
	 XN99vJVvTV3iVnwri78gX5kbZ6smfpY2JK4xWOxVQFuUEhw0fzy60i95mxDPog3XCw
	 f3Lx2QuqMN6wTrQYpSqSAYI2Mtfdi7ooVm6Xxhj6uAsGZAfq4UY9QMXeCb7Ya3q5e8
	 Kdoi1v6Pq1d0L9k2sRVsmNzNPnLDKsQIpbV64TZsCxLKXzNP2w+bMytRjRwS6tNC5i
	 HZ0glbZSMI9mltAr+WqvYn90bGn79ewCkI/CP1KNqgjF3mhNTPpT0XD8/SNTHZC/Sf
	 7ksN6j59fbccQ==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 27 Sep 2026 11:03:30 +0200
Subject: [PATCH v7 17/24] dmaengine: ste_dma40: Validate DMA specifier
 length
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260927-dma40-fixes-v7-17-89f595e8851d@kernel.org>
References: <20260927-dma40-fixes-v7-0-89f595e8851d@kernel.org>
In-Reply-To: <20260927-dma40-fixes-v7-0-89f595e8851d@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, phone-devel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.3

The DMA40 binding requires three cells, but d40_xlate() reads args[0],
args[1], and args[2] without checking args_count. A malformed provider node
can specify fewer cells, leaving some of these values uninitialized when
the OF DMA core invokes the translation callback.

Reject specifiers that do not contain exactly three cells before reading
the argument array.

Fixes: fa332de5c6b3 ("dmaengine: ste_dma40: Supply full Device Tree parsing support")
Assisted-by: LLM
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 32dd63a2c27a..479e69313e4a 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -2542,6 +2542,9 @@ static struct dma_chan *d40_xlate(struct of_phandle_args *dma_spec,
 	dma_cap_mask_t cap;
 	u32 flags;
 
+	if (dma_spec->args_count != 3)
+		return NULL;
+
 	memset(&cfg, 0, sizeof(struct stedma40_chan_cfg));
 
 	dma_cap_zero(cap);

-- 
2.55.0

