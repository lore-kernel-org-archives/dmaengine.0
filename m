Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942CF513548;
	Fri, 18 Sep 2026 16:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789748697; cv=none; b=hWz8h275gjxsLMUXtf50yW+n4/PTTqp+qmhJjlAQYYr4SAXxTKDOlwumh7dLQPb+j+YerK2zs5i0Kmide7drysCcTs3gB//Jsctk0yaYYwwALNa7NSDVQOvcnu+YUyG8kMBHpOSNqLXYO94cB56wXsM1GV2tkW3WaDYlkPc/UEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789748697; c=relaxed/simple;
	bh=QOu5eLscgtUL0s1OAZUNPWw98gdRxH8RI9PIQ8Nlqe4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VmBWdKj7SxVj6Okb5pc9AOhJoguBkkVNynO34rpR+tYte+w5td/pV3BIbJbP6ThK8xsRBY+un7VkUrfr6uXZuCBwU9yOsyacE58Myru16arBOadZs1fL934zL0/HD+vk/VfNpKyJSF6SprUgIOZNJIT7CkyZYpPiOh8bh0KLx6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MTnOxTPg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MTnOxTPg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A6E61F000FF;
	Fri, 18 Sep 2026 16:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789748695;
	bh=EOL51cswSjQY/SN5oZjZQodh+9QlzIfBbQdVMiZo3FY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=MTnOxTPgpDfu4PDl/a7vxlO6JNTqlwHZXJD67MVCUv7vxh3rvaopVbdCY3+hCX+B3
	 0ANbJBlFqkK/Sf648Rzjnl9DLGlYKf7ntCaXOgO5KpBKppQh/TBuR3ZN/0NzdRA4lN
	 faKHWXdkvjMiPoluKz8EjwDm0AX4VUaVA+GnKzRA9SE+4OJqfIAllSFrWJKn5hmQol
	 c3moNM7vUFI62a4Su/IeWPd5RM0b8Zg4B50jtbJ1u3/E7PjpJ+JUKNdW8f9dIWy8Ju
	 f3G+vUHOC0COGdryS0H1PSczinjRuJ82cLcY74vFJ4QT1RtTBoMjBNJysk4Fz7hghB
	 3cWghY/+r/EBw==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 18 Sep 2026 18:24:35 +0200
Subject: [PATCH v3 16/22] dmaengine: ste_dma40: Validate DMA specifier
 length
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-dma40-fixes-v3-16-8dd8450669e8@kernel.org>
References: <20260918-dma40-fixes-v3-0-8dd8450669e8@kernel.org>
In-Reply-To: <20260918-dma40-fixes-v3-0-8dd8450669e8@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, phone-devel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

The DMA40 binding requires three cells, but d40_xlate() reads args[0],
args[1], and args[2] without checking args_count. A malformed provider node
can specify fewer cells, leaving some of these values uninitialized when
the OF DMA core invokes the translation callback.

Reject specifiers that do not contain exactly three cells before reading
the argument array.

Fixes: fa332de5c6b3 ("dmaengine: ste_dma40: Supply full Device Tree parsing support")
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 6a76e7d8ebd7..abb3ca015417 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -2408,6 +2408,9 @@ static struct dma_chan *d40_xlate(struct of_phandle_args *dma_spec,
 	dma_cap_mask_t cap;
 	u32 flags;
 
+	if (dma_spec->args_count != 3)
+		return NULL;
+
 	memset(&cfg, 0, sizeof(struct stedma40_chan_cfg));
 
 	dma_cap_zero(cap);

-- 
2.55.0

