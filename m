Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1146274670;
	Fri, 18 Sep 2026 16:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789748686; cv=none; b=MbWXF+CVqcYaepPdEB7MLTZgh/xvNjpuPLxRTp7jHRROoI+IV6On+b1clRW5ZrDafAH8xfuldLzcYle71xWnfi6Gy0dpSxqVOnjQqQLyew7Ovz1OeXxKYBvw4IXf1fKP7JtvLJuOhaacIyyKvYcL6zJPwr6rqXy7ZZEDiCZEZCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789748686; c=relaxed/simple;
	bh=VrwGJ+05adrGSFE5gRJdvXPQ1kQLvMigr1Iqc5NNl9c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=an1awpfLhUnE7aQV/VGBCD8ZOY8PtcvSStg32BhadMwbickb6xs5mAxM8MIl8/M5GuB57hO890nyOAHJtTpvb16ak/x1ngHyVaEzc+DNth54Q9GDHc4zXtUuTMQRdjfQZ9s6oM2IkF/a9voY7JFz7RT9x2J943f3yhO4Y7jjRhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I/ZhwkA6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I/ZhwkA6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 387D91F00899;
	Fri, 18 Sep 2026 16:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789748683;
	bh=oQMF6BYKuByWhjL/Xt7KlVx6JYV3c9X0cZNYDzl0l6k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=I/ZhwkA6Q8L9IvMRF7D3OMbO4WtwSGPasOCyYUR377JItnf0puTjm47taWYGwBO4Y
	 5H9wcoIpbd8+hdLkgTUR+OpfKXWkCXq8fdLzronJl2M4bCuNds9F0u6Id9upkxXbkf
	 /VNssws+kUMqD0u/HnpvG/ZLrJe0WLUOlh83V6n9mSDxfvcV50iJHwLa9s2oivg/uU
	 qO8fH+iTsS4vFk+kO9RIz2ZsWqu5dBwkLVGxyljMTKTyXovf8zaDWyejAaMtVC6rek
	 viPbiwfsYWtUWkZxMl4AKFyrWqpQoJe4TdYtg+sxq91v16oq0WgiAsN3NINjOHRNSe
	 eDY2UT4auDTVA==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 18 Sep 2026 18:24:28 +0200
Subject: [PATCH v3 09/22] dmaengine: ste_dma40: Fix probe IRQ leak
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-dma40-fixes-v3-9-8dd8450669e8@kernel.org>
References: <20260918-dma40-fixes-v3-0-8dd8450669e8@kernel.org>
In-Reply-To: <20260918-dma40-fixes-v3-0-8dd8450669e8@kernel.org>
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
index dc6a63f148ff..38c1cc43cb87 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -3575,6 +3575,7 @@ static int __init d40_probe(struct platform_device *pdev)
 	struct resource res_lcpa;
 	int num_reserved_chans;
 	bool runtime_pm_enabled = false;
+	bool irq_requested = false;
 	u32 val;
 	int ret;
 
@@ -3698,6 +3699,7 @@ static int __init d40_probe(struct platform_device *pdev)
 		d40_err(dev, "No IRQ defined\n");
 		goto destroy_cache;
 	}
+	irq_requested = true;
 
 	dma_set_max_seg_size(base->dev, STEDMA40_MAX_SEG_SIZE);
 
@@ -3734,6 +3736,8 @@ static int __init d40_probe(struct platform_device *pdev)
 		regulator_disable(base->lcpa_regulator);
 		regulator_put(base->lcpa_regulator);
 	}
+	if (irq_requested)
+		free_irq(base->irq, base);
 	if (runtime_pm_enabled)
 		pm_runtime_disable(base->dev);
 

-- 
2.55.0

