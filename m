Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8D752FE4B;
	Tue, 22 Sep 2026 23:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790119864; cv=none; b=pL3HNaHFGZOzwV9sqz/RynHGkMWt90Ce05kC0rIgVc01xr9JAfpAlcO7rI/EsCw240q+wMWwC/keR9xQ244hP2LC/raQPzWsqWvS5rxOq5tbB1lkW5mvToE9MnJ2mRt0HRdCXC1QM5v0RLs/7MDKS5K1lchUomcXCJkQ7SetlSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790119864; c=relaxed/simple;
	bh=Uq/6w5DoXPRI92aINcRVjEADgURxhM+093I1tGzcK4A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ho1NkWg+QrjT3FlF3Gsqgvxcl7wKlt9tmOBPvnk8xX3+EtDsIMtOEvTVK8vWcTsgU1C0cDwOeyHHEdkXVkN8UMasaoigVbiqEfud/vLZp71Zm4CgwtIpVXohhs/EYTIsR+XKXKIabA0JKkGMOVJU5llIsHPin4STR5NrbeRBj2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bG+PSl4W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bG+PSl4W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51C6F1F000FF;
	Tue, 22 Sep 2026 23:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790119862;
	bh=O63iBpW0Qx9JwFdKTKUHUI7bRKKdNpqzXT761dado9A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=bG+PSl4WCuGZeHHfDwbkTPYsHvYmcIsladITLg9I4XUOjKQO45ImvP/p2uVu9Dlow
	 L1m0b10m3lri4DJSoB0WOBsTIzeK3kgMXu/9HIe/DYjwSRHGTnOdvZTdU/cKmVO6D0
	 35Gx325OxeJEUcM52il6l+ydrBgdfyCXgIdLPLWL/0JG9Zg/6Qn5Xb8FJntbR+W/u6
	 uZRixC/qoL4zumF6BqNLpWPrfeDZDGY+Ev1n5xc7DNcGAhAZph2dGfPDtF5OrNpudp
	 oaAS2Rb06pEH5n9pid40whVEFVl3uOCygJ1CbpIRYeh9tYETWAzxg2Kn51ocPgrrP/
	 XXpPPsRluIChw==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 23 Sep 2026 01:30:51 +0200
Subject: [PATCH v5 06/23] dmaengine: ste_dma40: Check runtime PM in IRQ
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-dma40-fixes-v5-6-709d160cde76@kernel.org>
References: <20260923-dma40-fixes-v5-0-709d160cde76@kernel.org>
In-Reply-To: <20260923-dma40-fixes-v5-0-709d160cde76@kernel.org>
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
index 0d09908d1978..16ca28c36362 100644
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

