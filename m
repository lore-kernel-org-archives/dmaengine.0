Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300F43CAE60;
	Sun, 27 Sep 2026 09:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790499821; cv=none; b=emLLikxZc7F5XIlIp5cfXLPn5X18vTKzazuDokVU4Fy0eU33i/xlPQY9ChwT1agaZG7VJZQ3fmoEMdoBwberNMIW5vgXbuR/kykHmW+LIMPT/kXRFg5I+ZOzt9/2ijbIOW4z6RUsZylF3OtaWU7ximKowq3G68bnPiNzxFAUVy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790499821; c=relaxed/simple;
	bh=l4c8WTwYv4ooQccJW94J3xZpyQSOvksOu5TVmoNed68=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WFknwH0058Ayup+Jqqb9sBXwcXMswYSbt/TFgpjyysJ+KWz/RP7J6C4IQ3UW2HNY/qkVHxFkCxvAtrmCu607xUoJ2ODqzp5WF/xl9lzm5l4I/bH23lsnap5ILxsnO9Ms3KWzR0IiEFL4hRxTnksCfYJopcMM8exx9QNFleEZYqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=byZneLdI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="byZneLdI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 654C71F000FF;
	Sun, 27 Sep 2026 09:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790499819;
	bh=9Vj/+JLskW7kceucDcR/Xrb9RBbq6jSNFeNu+5qVUR4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=byZneLdItV0bpvSeTnr2U7w2C3zKIBMG6XFlzRG/yvFZvYRqD0BFEE9cSkCCJr8Cg
	 6cHFBIboAwkx94RY338hwFmcyhOPBqJ1L50j7gUYPzBcNtt2zdrvKG1Tq2rpCUEkWD
	 T39/3QyXFhujkx8UNP1/OvUnFs3rVxXHcPrVd97P7epTKcHZNCn28hnE8ZhTNSXAij
	 JU0JqtDAUOnPFOaE/fL9ElpbWRBw5izslaRQkQyfYTB31L+CE/3HllKgCAmIiIPsIr
	 4VNuCxJpEu/6swWu5BM3V1Kt9Of+8Qv6mwgMCPsHKAClzPJJaCfnMHy45yndt+KH5Q
	 glqmhYC+vK6Yg==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 27 Sep 2026 11:03:22 +0200
Subject: [PATCH v7 09/24] dmaengine: ste_dma40: Init hardware before
 registration
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260927-dma40-fixes-v7-9-89f595e8851d@kernel.org>
References: <20260927-dma40-fixes-v7-0-89f595e8851d@kernel.org>
In-Reply-To: <20260927-dma40-fixes-v7-0-89f595e8851d@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, phone-devel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, sashiko-bot@kernel.org
X-Mailer: b4 0.14.3

d40_probe() enables the interrupt handler and registers DMAengine devices
before calling d40_hw_init(). An interrupt pending from the bootloader can
therefore reach the handler while the hardware interrupt state is not
initialized and channel lookup entries are empty. The handler deliberately
does not acknowledge an interrupt for an unknown channel, so a level IRQ
can retrigger continuously.

Initialize the hardware and set the DMA segment limit before requesting
the IRQ or registering DMAengine devices. d40_hw_init() clears pending
logical and physical interrupt status, so request_irq() can enable the
line normally after the hardware state is initialized.

This ensures that the handler and clients only observe initialized
hardware.

Fixes: 8d318a50b3d7 ("DMAENGINE: Support for ST-Ericssons DMA40 block v3")
Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/dmaengine/20260819225215.5EA2F1F000E9@smtp.kernel.org/
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 86efe2149be9..3bf89b057ccf 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -3835,20 +3835,19 @@ static int __init d40_probe(struct platform_device *pdev)
 	}
 	pm_runtime_use_autosuspend(base->dev);
 
+	dma_set_max_seg_size(base->dev, STEDMA40_MAX_SEG_SIZE);
+
+	d40_hw_init(base);
+
 	ret = request_irq(base->irq, d40_handle_interrupt, 0, D40_NAME, base);
 	if (ret) {
 		d40_err(dev, "No IRQ defined\n");
 		goto destroy_cache;
 	}
-
 	ret = d40_dmaengine_init(base, num_reserved_chans);
 	if (ret)
 		goto destroy_cache;
 
-	dma_set_max_seg_size(base->dev, STEDMA40_MAX_SEG_SIZE);
-
-	d40_hw_init(base);
-
 	ret = of_dma_controller_register(np, d40_xlate, NULL);
 	if (ret) {
 		dev_err(dev,

-- 
2.55.0

