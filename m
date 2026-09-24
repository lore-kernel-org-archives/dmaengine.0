Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED9F42376B;
	Thu, 24 Sep 2026 08:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790238936; cv=none; b=F6pxvXZpkka1YsXSpBSu5ROBCo2i7hl3ePcfA/MNoGsskV9Dkv5A1cnt39aCZ1QYO1e+9zcyri0JQL3oKUOj8p1at00YIsYvZ0oXBgHWGXycN7a2M4SOEb8Lc9bvwfL9Sp26bPDVEEdtHGz7iYqWtsrPX6xtE3CHzxaDgGpE6G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790238936; c=relaxed/simple;
	bh=W8LlSsOv9wpQ6tB++zall3jKQZxDYmwUgXKLs8MPz8Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eYGxt901ktGberX3ySUOLeDJKgfjrVHEJjIV6fNl31o6GMtGDbVE363U0FAV6EAiWqPMMzrZ+ojNxnfL1V+6Hjaz59fwkFdN/rKy2dF470F+HV5bmMIh/2fs5LbHOFW1jgXhlM3XktqASdIaD7hxbO1YAr8h5QGBliUaAeABAvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a6ksIjQI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a6ksIjQI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D76A51F00893;
	Thu, 24 Sep 2026 08:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790238934;
	bh=eH3SetUeO7ydFPG1qMYm3ZuoUcAdHlrKi828MrAz8gc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=a6ksIjQITy+gagVE7Bh/84i+86r3g/oQ7H3aNK9Sd825zFX8NXg0f32BFdKSZC07I
	 y8iZS5OfQq2pu0sD7zX8N4Nly7pnxB6shhGqc1GOtN7vnwO4NG2VamC1B9OR3Lh/gT
	 fpXRNL0YPzFB0eiTrLUPTYiaHa2CG8nkbgmds63puL3MGpVkkNRzFjCLv0Fq0jS3QR
	 Hvysx41kXu5NsPJRxxLULW3CRneBuX+xbTWnYt6/lXJngh68sc84UHdPBD7gedW1dI
	 FiJCx2YPvxODAx9EcfEaF7D3dbOUTfTLs8zxO502CaRLApvVWZpp8uJ+I0qQrNcsyi
	 hxGU/Iq5vJ9Wg==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 24 Sep 2026 10:35:22 +0200
Subject: [PATCH v6 10/23] dmaengine: ste_dma40: Fix probe IRQ leak
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-dma40-fixes-v6-10-fdb6755020a2@kernel.org>
References: <20260924-dma40-fixes-v6-0-fdb6755020a2@kernel.org>
In-Reply-To: <20260924-dma40-fixes-v6-0-fdb6755020a2@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, phone-devel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, sashiko-bot@kernel.org
X-Mailer: b4 0.14.3

d40_probe() registers the hardware interrupt before several later probe
steps that can fail. Those error paths jump to destroy_cache without
freeing the IRQ, leaving the handler registered after probe resources have
been released.

Track successful IRQ registration and free the IRQ on later probe failure.

Fixes: 8d318a50b3d7 ("DMAENGINE: Support for ST-Ericssons DMA40 block v3")
Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/dmaengine/20260618051539.15E201F000E9@smtp.kernel.org/
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 85789ee7c0c9..36f4cbd4da36 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -3718,6 +3718,7 @@ static int __init d40_probe(struct platform_device *pdev)
 	struct resource *res;
 	struct resource res_lcpa;
 	int num_reserved_chans;
+	bool irq_requested = false;
 	u32 val;
 	int ret;
 
@@ -3844,6 +3845,7 @@ static int __init d40_probe(struct platform_device *pdev)
 		d40_err(dev, "No IRQ defined\n");
 		goto destroy_cache;
 	}
+	irq_requested = true;
 
 	dma_set_max_seg_size(base->dev, STEDMA40_MAX_SEG_SIZE);
 
@@ -3880,6 +3882,8 @@ static int __init d40_probe(struct platform_device *pdev)
 		regulator_disable(base->lcpa_regulator);
 		regulator_put(base->lcpa_regulator);
 	}
+	if (irq_requested)
+		free_irq(base->irq, base);
 
  report_failure:
 	d40_err(dev, "probe failed\n");

-- 
2.55.0

