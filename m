Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DD4448D15;
	Thu, 20 Aug 2026 13:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787231715; cv=none; b=JVfAAdhBHPbbuKyFHNG6DdpOPIAG8vSPtVMluC7soNN75fAy/3LKZ92LRFTCGYHZZbzPtxMSyv9l4kw+zxpaKZL8c+1VaVn63FOLzPLpD2fVUraeAbkQZSze4r+k3cw95MHI8cCmcoFE/j3bssdB25wK8iKNSM+0GRxH9oB6Lpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787231715; c=relaxed/simple;
	bh=WuUO4JFevxEAauliQR1biNICWGnEygsfZK7BTfYKcg0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Un+bJqWQQVWFJrSx9IiXrSqTH6uoEnkgjRmOib+9fD0yulx39u+CJGXbWXgLyq/72FLZWF+4PHi5wkCF2D21Tvzg+xpYIQBe2vYRpPYewnov4Q78R3+gjeCPCf9XwXA7nacFXgDm59TDmoBsbMa4h+mghjVakFo4N439o52iIQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SGFgzwUO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SGFgzwUO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ADCA1F00A3A;
	Thu, 20 Aug 2026 13:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787231713;
	bh=suL6WfngtOgVih5c8tpzW5T4g63B9hvCi4jrKVM346k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=SGFgzwUOZf6PggmcTUWGyW7TJC5a31aQLnAmXl1b/1gaku7wRzK4FU8HHl0Pqo6QU
	 mpk/3stzesP5AU+Y+vV9q3uhUWyA7WLVCoG43hH3zRBxqeyp8njzK6F7ktNFon7zkc
	 8K/HC88TE8wCiIr5wkCyx61VIyysBLq8TjRVWwjGlYOUA42fTmJgd2R6Isjl2QH4+v
	 9pI31uOKnVcJPHm0nJerFBbqvruHG2Nfp6X5Lq29Up9iB9wHeaVbJjOuiY+WZJusWU
	 XSnnywhAZVr2iDMuRWR8xNFma956pGdYTLNvjpVU/DKwed409oIRtk7Y+1pHNQkV3s
	 G7LFipG1Xsiaw==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 20 Aug 2026 15:15:03 +0200
Subject: [PATCH v2 09/13] dmaengine: ste_dma40: Fix memcpy channel parsing
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-dma40-fixes-v2-9-63238334c707@kernel.org>
References: <20260820-dma40-fixes-v2-0-63238334c707@kernel.org>
In-Reply-To: <20260820-dma40-fixes-v2-0-63238334c707@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, phone-devel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, sashiko-bot@kernel.org
X-Mailer: b4 0.14.3

d40_of_probe() validates the memcpy-channels property against
D40_MEMCPY_MAX_CHANS, but reads the property directly into
dma40_memcpy_channels. That array has fewer entries, so a long property
can overwrite adjacent data.

Validate the property length against ARRAY_SIZE(dma40_memcpy_channels)
before reading it into the array.

Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/dmaengine/20260819225215.5EA2F1F000E9@smtp.kernel.org/
Assisted-by: Codex:gpt-5-5
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 8cf73b37f8bf..4e840846466b 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -3470,7 +3470,8 @@ static int __init d40_of_probe(struct device *dev,
 	list = of_get_property(np, "memcpy-channels", &num_memcpy);
 	num_memcpy /= sizeof(*list);
 
-	if (num_memcpy > D40_MEMCPY_MAX_CHANS || num_memcpy <= 0) {
+	if (num_memcpy > ARRAY_SIZE(dma40_memcpy_channels) ||
+	    num_memcpy <= 0) {
 		d40_err(dev,
 			"Invalid number of memcpy channels specified (%d)\n",
 			num_memcpy);

-- 
2.55.0

