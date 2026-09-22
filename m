Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D465372FF;
	Tue, 22 Sep 2026 23:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790119870; cv=none; b=Ql7diIOaTUeU1s9ZQYTNyT8UAk5tgfmpyZZGSzhdPDTIKL659KMM1T69+49S+7YseWeSr3XM46dQvGx9hi6TKvZgA+qieyxXUyLZykr77YFMX8qlmBiRB7BaiS1Mjbtyl1OyiwQKcRcxJXJqQqabnnvGady1ksT22cGtforbo4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790119870; c=relaxed/simple;
	bh=yHcVVNFTTCrHWb6oVJGTBVzn9fJ41tnv0cbQu8aTaq0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hl/uZ6nRqmzRhS+eOBCnerjJgqwuHqpZNNfuUPHy5rgW+ZQzKpIuI/pF/2IvZLNphPlmrkPJY5nj/IAKOwnar46F70zeSjZMDDbEcN1KIQiCx4IiDIWbEUCkSG17Z9iJqrdMb2Kpkfeo8+BgepQcQwaZF9XEHrsMXYZk5YNVotE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JD6uZ09u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JD6uZ09u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2503C1F000FF;
	Tue, 22 Sep 2026 23:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790119869;
	bh=vfkj/Pwy9zYYaKw/yV5zsgOsD1YnkRcFJS40ew9AKg0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=JD6uZ09uNnsG8dNsYUNnXSUtq7aBkE6krHcdo+O3vUVQyr3hAINP09Hkp/sKwpJuc
	 a0V5JWok45peaFb3E2MMm+EvAxM/abZ8LKBzYK9eB9guYwBo/30PQx6BhvYmyLyAeg
	 S4KJtMlOnYZl3Dkx2qL6x6kd0OVBQfG6J+xli61CxEUl/rcZ18/wQS7WajbbaET6h/
	 ++rqQw2xbmJhRZ/Slf4vzUNjwpZfXOHDE36ZqbkIXVv1nyhlN/Gl6pICv0TLPu7Ueu
	 2n6eeZL0EMqQ0WSU7U9o8aDd0+xTpI2HPIEAhqmA1/GYaSaJrXojxvP5i7OJLul8fM
	 uk67nuHQlzapQ==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 23 Sep 2026 01:30:55 +0200
Subject: [PATCH v5 10/23] dmaengine: ste_dma40: Fix probe IRQ leak
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-dma40-fixes-v5-10-709d160cde76@kernel.org>
References: <20260923-dma40-fixes-v5-0-709d160cde76@kernel.org>
In-Reply-To: <20260923-dma40-fixes-v5-0-709d160cde76@kernel.org>
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
index d67126e9c2bf..0782becdab11 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -3724,6 +3724,7 @@ static int __init d40_probe(struct platform_device *pdev)
 	struct resource res_lcpa;
 	int num_reserved_chans;
 	bool runtime_pm_enabled = false;
+	bool irq_requested = false;
 	u32 val;
 	int ret;
 
@@ -3847,6 +3848,7 @@ static int __init d40_probe(struct platform_device *pdev)
 		d40_err(dev, "No IRQ defined\n");
 		goto destroy_cache;
 	}
+	irq_requested = true;
 
 	dma_set_max_seg_size(base->dev, STEDMA40_MAX_SEG_SIZE);
 
@@ -3883,6 +3885,8 @@ static int __init d40_probe(struct platform_device *pdev)
 		regulator_disable(base->lcpa_regulator);
 		regulator_put(base->lcpa_regulator);
 	}
+	if (irq_requested)
+		free_irq(base->irq, base);
 	if (runtime_pm_enabled)
 		pm_runtime_disable(base->dev);
 

-- 
2.55.0

