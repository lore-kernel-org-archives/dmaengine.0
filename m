Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE29237DAC0;
	Sun, 20 Sep 2026 18:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789930801; cv=none; b=W+/+DKwIn7XJiulakxmJQ2WH87yS92qo6JlIJeG1FJZRFpnhbta3Y3vM0hmr/tIcGz00npryTvhYF7iqMmcPgLJK/B5ALqfiTB1UvkUFQfhJnnfGHz+QSElBgTig9HVFCs8UcknuvPFqlAsPnsZaUWQ0M3506AgMStWd3o+/3os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789930801; c=relaxed/simple;
	bh=L72XaTAQ/tOswMrGtpGFeQLQgS1+1ZCYMQ0mTKCotCc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IIlqH0w2m5wH1a4Te4nZK8aaO0XQoWUZbO5Gwgg0cJ9wJM+40O+6V70HGMSbikR2LfI+5GD06LdSOANq4nQRTlyoTj2Fkxwr8kw+BSWGxMA75yQIYH1Majjy7N/4wa07ZFR932b828jIerGiBFLWhlCPpxlS451Ikylh3J3ozsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hVwUKZSF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hVwUKZSF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65BA61F00893;
	Sun, 20 Sep 2026 18:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789930799;
	bh=Wn8xbLLzODNlW6O5WHhylHeALCcEzt2gaOiCslcxtaY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=hVwUKZSFHgSGnu+aGh3e/xns/gzS2dsbap063GvOtfvIZI2mG68M6UsT5jv//PS4i
	 h7XOZF/BLB5KaSicuafNuvy0GXOxnRtBXqG+8uDxbx4EjNr72h++hmjQA39E43xAaW
	 uWIkPI53w++Zb2abK5DofMTkCHO5mXpT6EwmmkluC/1YkAXko6AlSFCKnTLKrpU+Lv
	 F2s+oZSPUcfhwzz30o5z9E/zdarZ02jx5rcMsyCYtjB9anCF0+CaUfiSKI1Q41BZoq
	 qbjVDezQId9YoATM/M+//h9Iso7GwektFWewhs40kfBUWj0LTcnoQC2SL6qCss8Qzs
	 feWpbjKgY/9pg==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 20 Sep 2026 20:59:45 +0200
Subject: [PATCH v5 10/23] dmaengine: ste_dma40: Fix probe IRQ leak
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-dma40-fixes-v5-10-5c55cd7f92f9@kernel.org>
References: <20260920-dma40-fixes-v5-0-5c55cd7f92f9@kernel.org>
In-Reply-To: <20260920-dma40-fixes-v5-0-5c55cd7f92f9@kernel.org>
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
index 7cbcf8433fe0..ba529bd91752 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -3710,6 +3710,7 @@ static int __init d40_probe(struct platform_device *pdev)
 	struct resource res_lcpa;
 	int num_reserved_chans;
 	bool runtime_pm_enabled = false;
+	bool irq_requested = false;
 	u32 val;
 	int ret;
 
@@ -3833,6 +3834,7 @@ static int __init d40_probe(struct platform_device *pdev)
 		d40_err(dev, "No IRQ defined\n");
 		goto destroy_cache;
 	}
+	irq_requested = true;
 
 	dma_set_max_seg_size(base->dev, STEDMA40_MAX_SEG_SIZE);
 
@@ -3869,6 +3871,8 @@ static int __init d40_probe(struct platform_device *pdev)
 		regulator_disable(base->lcpa_regulator);
 		regulator_put(base->lcpa_regulator);
 	}
+	if (irq_requested)
+		free_irq(base->irq, base);
 	if (runtime_pm_enabled)
 		pm_runtime_disable(base->dev);
 

-- 
2.55.0

