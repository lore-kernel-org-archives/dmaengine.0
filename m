Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9232773CA
	for <dmaengine@vger.kernel.org>; Wed, 19 Aug 2026 22:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787178967; cv=none; b=F3pfgm0FX0gGF8lxlbeyZ/rCjEyJtQVekbjWJy7c3CgUSILnppEjVxV2n5r8IIUh3JZbVrmLSXtOSr8SmWcRXXRz37Uv9gxwWaGNCc8CCwJrfgHRGedzMGJKYiYwnK/oPc4GNlJ4mr/5HW331RZYyLyBBvBAu+Es6PFox7Gz1GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787178967; c=relaxed/simple;
	bh=bsQj3d0I0ooq+3HCgctpe4ylYjmB9+Ha6nQguhJlZyY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FW5IpqdMH+l6qNqxJmXYEwRPy378KEN3WykjUol1Ao2yGlQ5hvaAa3FL3y1lOoodKlK7u3uOt87huNOhRrDUR5EmOYyCggDgC7dfDh2smOayXJ8z3FgdqAp99LbdLG3xlTkEKiifQvI/XUcjShCDOICQ3ZYajp+1QO8aJajDtkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nk7fl4oX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nk7fl4oX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C7F31F00A3A;
	Wed, 19 Aug 2026 22:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787178966;
	bh=0D4Zwydv6mw4mW9XahwDmlVQEP5oRjNRa0brHdF2yZ4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Nk7fl4oXxC6H7tchx0t6M6NfMMIW94NHj8+CrT85J6f2BiQJPj6w25e4CZz2EtiPb
	 HZM6HNHrvIZqmekrv/QTwrH41XxogxtCuePdAa6+zjQMA08wOplrfEVxxvyxiFd6Q1
	 46R7sJfLT99BUx7mUBNjtMj42zqU+AcsrYse8X1CphpOgWIY6q5ISMXZhGBE5c8SuL
	 GVnGympQZMFwG/Q1YPysLk1w/uZ/iKsJ2lo7BO7pzsANuU9MLLkk+ybJBZfuEweqrk
	 nLRsX6m7MXeNnF5ukfy05/msvaj396jazTHA+QLd5IhOSWzoFhq3Pf1oiPFs6fag1V
	 lRbZ7TBajh01A==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 20 Aug 2026 00:35:59 +0200
Subject: [PATCH 3/4] dmaengine: ste_dma40: Fix probe IRQ leak
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-dma40-fixes-v1-3-5e14815ad689@kernel.org>
References: <20260820-dma40-fixes-v1-0-5e14815ad689@kernel.org>
In-Reply-To: <20260820-dma40-fixes-v1-0-5e14815ad689@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
 sashiko-bot@kernel.org
X-Mailer: b4 0.14.3

d40_probe() registers the hardware interrupt before several later probe
steps that can fail. Those error paths jump to destroy_cache without
freeing the IRQ, leaving the handler registered after probe resources have
been released.

Track successful IRQ registration and free the IRQ on later probe failure.

Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/dmaengine/20260618051539.15E201F000E9@smtp.kernel.org/
Assisted-by: Codex:gpt-5-5
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 0c8ff299c2c2..a723133d096e 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -3503,6 +3503,7 @@ static int __init d40_probe(struct platform_device *pdev)
 	struct resource res_lcpa;
 	int num_reserved_chans;
 	bool runtime_pm_enabled = false;
+	bool irq_requested = false;
 	u32 val;
 	int ret;
 
@@ -3595,6 +3596,7 @@ static int __init d40_probe(struct platform_device *pdev)
 		d40_err(dev, "No IRQ defined\n");
 		goto destroy_cache;
 	}
+	irq_requested = true;
 
 	if (base->plat_data->use_esram_lcla) {
 
@@ -3660,6 +3662,8 @@ static int __init d40_probe(struct platform_device *pdev)
 		regulator_disable(base->lcpa_regulator);
 		regulator_put(base->lcpa_regulator);
 	}
+	if (irq_requested)
+		free_irq(base->irq, base);
 	if (runtime_pm_enabled)
 		pm_runtime_disable(base->dev);
 

-- 
2.55.0

