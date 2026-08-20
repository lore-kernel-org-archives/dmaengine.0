Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9DE43B3F4;
	Thu, 20 Aug 2026 13:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787231714; cv=none; b=W8mpWupCvPZ1VBoTrObUiwY8t+icqgQgCXU320Y78UhdC7yyAp7MMpTYSi8QOc6MOgd/xzeWrbvSqUcgHu8MJSIha3jkrAv3cr4iJMpxMvkbRwOg5yjshZ6ssWhGqwnKhBAIdlb9fo4FscnSod8L2gZr81CgnyQ2UlX21aNlFDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787231714; c=relaxed/simple;
	bh=5MQV8dXa6TMFcSfWtKOr/HKxzrCIHdX0gs7BnWCLgbA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EaOwWEcEWqDOWPyPGtO0DPUg8P+rTWXquXMW7BzZwn10/ImnAiwJqGapuJubxh+9w05kpk7DwXkYgBTda5nhDFk8w0l8nmNQ62L1nOBUV57eVT+iOr9V6BN4KKkFanBDlwqBpZ3O56Ohc6nXHiIBvd7o4DV2YFBm8Q4EjTtY5BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O+OFqCZv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O+OFqCZv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1D4A1F000E9;
	Thu, 20 Aug 2026 13:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787231711;
	bh=04n7XFlQzWRusA3SfOkEq9RsLHQMqGarGA09IRNkuck=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=O+OFqCZvsqNP0jGH+sAXFzWrT4LQwWjzc/o5yiR/Im4pWXbT0Dg/FOc4Oqgsx7M+L
	 ozEJz5s4t7VJkM+SqEQ5WpLwa7V51B3fK96NlvtAFkQL7bmJuqBQfMyrjRD3vuAOzd
	 g76d94dRhF9fYr+PKIYsM+nWJlt66Z+Iyfov0XTKcU7Uq2Swj+rj5m72dfY2fXIV6D
	 +85TrEoyJyTVIHjxn6l+q2PlnGGQpA0TdD1d5ZkFOlD0b9U+ljegaMVgBUsAMDQo0r
	 /tkwYdcKSA5Rw1oU7aTnMGZWjMpBO2BxW5rV51BkA/8Z9K1IrDOCnAYEoXcrZRuAOh
	 +eE8DaXHsnTgw==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 20 Aug 2026 15:15:02 +0200
Subject: [PATCH v2 08/13] dmaengine: ste_dma40: Fix probe IRQ leak
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-dma40-fixes-v2-8-63238334c707@kernel.org>
References: <20260820-dma40-fixes-v2-0-63238334c707@kernel.org>
In-Reply-To: <20260820-dma40-fixes-v2-0-63238334c707@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, phone-devel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, sashiko-bot@kernel.org
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
index 0c9094b4c4ad..8cf73b37f8bf 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -3513,6 +3513,7 @@ static int __init d40_probe(struct platform_device *pdev)
 	void *dmaenginem_reg_group;
 	int num_reserved_chans;
 	bool runtime_pm_enabled = false;
+	bool irq_requested = false;
 	u32 val;
 	int ret;
 
@@ -3605,6 +3606,7 @@ static int __init d40_probe(struct platform_device *pdev)
 		d40_err(dev, "No IRQ defined\n");
 		goto destroy_cache;
 	}
+	irq_requested = true;
 
 	if (base->plat_data->use_esram_lcla) {
 
@@ -3680,6 +3682,8 @@ static int __init d40_probe(struct platform_device *pdev)
 		regulator_disable(base->lcpa_regulator);
 		regulator_put(base->lcpa_regulator);
 	}
+	if (irq_requested)
+		free_irq(base->irq, base);
 	if (runtime_pm_enabled)
 		pm_runtime_disable(base->dev);
 

-- 
2.55.0

