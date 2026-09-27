Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2110E372B50;
	Sun, 27 Sep 2026 09:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790499823; cv=none; b=VyP+amwaL5Ntr73yWm4ppsGENO132X6A9O10ERMFAIa99NEiqFDAtOaju9ZU5lYCrUmX+7CfL/UpX99I23o7CDc6NhLiEXrlMpXWyLfpzE9pPzNTBgOavPMtnubzdy98r3kjCD001/fFJV8/TZj23bheEa9Qp3ynvO0DIx6LR74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790499823; c=relaxed/simple;
	bh=x7muzGIMkopS7LsFTN+99gZ61zGXJFWNZpW9Ctmzdw0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eBKOhUogHGWzjfqF4y3apwt5+CE4JIef2slx1qFmUaowZGxUN5E1IAyaIIWofLYFYDG+gSvKVT2d/1090fE0fCG9qsS8vLRQ0FHXjRvyBiEfSwbIxFsmrfBHXHGhPKA0r5JPrsN9oLdReolSxtmd8FI4xxNk547gSDRYNr7Dwbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ovolhSKD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ovolhSKD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EDD41F00893;
	Sun, 27 Sep 2026 09:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790499821;
	bh=v04Kz7t6rMWUsUIw4RUujPA3YEH0eagPnzbcqFcuQ18=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ovolhSKDGckhYmZ4g+PH0++fpvXQlshR3WiA3YaaiHHsteKjjOZtlM5Mjh51Y2bcA
	 sOtWOXMQtRcEvKw8TG21NahgIpN81FTL337OxFcEu4We3MpnkHWNA+h6TEuPZZrtAm
	 2Jdds2x5tz/t2x17QpcDexxYQjHJTmVXkl6srteRWp5ZAMSZ0wTbmxQgeIsZs5V0cm
	 pRSY9L4Gy+z6Tg1b73poUnOrrbEVfV1lNHGgrgmqsDRrYwRIfVv+luAFwUv8A5KtsM
	 VwDxLDnaRcmhNNLQ8SB+ZPLNti6qF/Coq/zb15CGIfY+8TpI4YhoQ4vH56nIMk8Kh5
	 ECsA92nv92DRw==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 27 Sep 2026 11:03:23 +0200
Subject: [PATCH v7 10/24] dmaengine: ste_dma40: Fix probe IRQ leak
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260927-dma40-fixes-v7-10-89f595e8851d@kernel.org>
References: <20260927-dma40-fixes-v7-0-89f595e8851d@kernel.org>
In-Reply-To: <20260927-dma40-fixes-v7-0-89f595e8851d@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, phone-devel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, sashiko-bot@kernel.org
X-Mailer: b4 0.14.3

d40_probe() registers the hardware interrupt before several later probe
steps that can fail. Those error paths jump to destroy_cache without
freeing the IRQ, leaving the handler registered after probe resources have
been released.

Route failures after a successful IRQ request through a dedicated cleanup
label. Keep the request before DMAengine registration because that
registration publishes channels to clients.

Fixes: 8d318a50b3d7 ("DMAENGINE: Support for ST-Ericssons DMA40 block v3")
Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/dmaengine/20260618051539.15E201F000E9@smtp.kernel.org/
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 3bf89b057ccf..4c545a947264 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -3846,18 +3846,20 @@ static int __init d40_probe(struct platform_device *pdev)
 	}
 	ret = d40_dmaengine_init(base, num_reserved_chans);
 	if (ret)
-		goto destroy_cache;
+		goto release_irq;
 
 	ret = of_dma_controller_register(np, d40_xlate, NULL);
 	if (ret) {
 		dev_err(dev,
 			"could not register of_dma_controller\n");
-		goto destroy_cache;
+		goto release_irq;
 	}
 
 	dev_info(base->dev, "initialized\n");
 	return 0;
 
+ release_irq:
+	free_irq(base->irq, base);
  destroy_cache:
 	if (base->lcla_pool.dma_addr)
 		dma_unmap_single(base->dev, base->lcla_pool.dma_addr,

-- 
2.55.0

