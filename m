Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB21F40BCD8;
	Thu, 24 Sep 2026 08:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790238929; cv=none; b=n/c+/ONmEYSwGsVu0Pubi6CrG4Dce7CD6oJSEHqrVhPLpc/wyR/8ZvHPga45jsVgj/9u9nXeJvCI+WPy5ZpoAKyw2BTIMQWLZD3o0pDT0G4OnUCJvqbIjt5X6U9ndZXt461sPjJAsaLgLgmjhaUy5cXXRR2Xn/SjDaRrxzkF3Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790238929; c=relaxed/simple;
	bh=Jn8JaGqCKGnO5sZEGrD9DzlZDloWHxYir/v2buSV3RU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cXoAC74pQOO0L4tNzsvww+iDf3ScCcN91EfnA16hf26ebNL3NLZUQ1CKS9AVvPsa9Ch9Civ1kSv81x2kfqzOKDzWJpfIF16XkWUhMEYn3rO4DrLu8R9Wtu9QfWuUQSbtM0rUDymW60uIUD/Iko5zJIq1fALC40U68l7mtLdkYFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YJTkjrra; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YJTkjrra"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 605261F00893;
	Thu, 24 Sep 2026 08:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790238927;
	bh=g57OfAwRGWTyJ8p6CGW4vEESjbjcb0k7dfW2Nqs/5lQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=YJTkjrraYsD4bYepRFdcxItc4YKABKaeVKAuWpzxHvZySih9a3/AyNRxQ+xyW4ERo
	 9sZmH1R7IPXlCZtHGBedlundS83KHgawtFRG/CzApxxWBOaJU0sd43o0GYxR2DuTA/
	 H0abXF4o1Cp7yDYhfk5KzjBTS5K0sLvtSUXnFeOSpt/N0lrt5EbowZjU1vD2cndSE0
	 IxfLsImdTcL9fYGv8Cbw1hhZtMwRBwOD9WG9B2M/sqNzFyAptavE2a+4XRWLQtUlza
	 ZBeIxDFqybNojUVmq5vRox2QvEPrfETdE+hPwpffvqhf7wcrFtM/p2JrmTAjLfpYsp
	 QFcicHvx1v2EA==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 24 Sep 2026 10:35:18 +0200
Subject: [PATCH v6 06/23] dmaengine: ste_dma40: Check runtime PM in IRQ
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-dma40-fixes-v6-6-fdb6755020a2@kernel.org>
References: <20260924-dma40-fixes-v6-0-fdb6755020a2@kernel.org>
In-Reply-To: <20260924-dma40-fixes-v6-0-fdb6755020a2@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, phone-devel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, sashiko-bot@kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.3

d40_handle_interrupt() reads DMA40 interrupt registers unconditionally. A
spurious interrupt can arrive while the device is runtime suspended, after
dma40_runtime_suspend() has disabled the GCC clock.

Avoid touching the registers unless the device is runtime active by taking
a conditional runtime PM reference. Return IRQ_NONE when the device is
suspended, and drop the reference after handling an active interrupt.

When CONFIG_PM is disabled, pm_runtime_get_if_active() returns -EINVAL even
though the registers remain accessible. Keep handling interrupts in that
configuration and only drop the runtime PM reference when one was acquired.

Fixes: 7fb3e75e1833 ("dmaengine/ste_dma40: support pm in dma40")
Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/dmaengine/20260819225114.AE1511F000E9@smtp.kernel.org/
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index de1d5670adec..690e41ca40f0 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -1810,6 +1810,11 @@ static irqreturn_t d40_handle_interrupt(int irq, void *data)
 	u32 *regs = base->regs_interrupt;
 	struct d40_interrupt_lookup *il = base->gen_dmac.il;
 	u32 il_size = base->gen_dmac.il_size;
+	int ret;
+
+	ret = pm_runtime_get_if_active(base->dev);
+	if (IS_ENABLED(CONFIG_PM) && ret <= 0)
+		return IRQ_NONE;
 
 	spin_lock(&base->interrupt_lock);
 
@@ -1858,6 +1863,9 @@ static irqreturn_t d40_handle_interrupt(int irq, void *data)
 
 	spin_unlock(&base->interrupt_lock);
 
+	if (ret > 0)
+		pm_runtime_put_autosuspend(base->dev);
+
 	return IRQ_HANDLED;
 }
 

-- 
2.55.0

