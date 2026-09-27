Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59AA5378811;
	Sun, 27 Sep 2026 09:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790499815; cv=none; b=o+rfKkGS57FueBaDk3Sl5s/OP/qFvP8AXzQB16XtTc285LucXZizZDtnR853qnMkdzrYf3MMFFTEw5fdraIiCFISZhVQdF/TUVvLJNp+IhYfYSTFgBaeFD+FR6pQBm11bv+oQQYd+RCJETL5fjjOX7kt7C3AWmgtaw/1qSa4J7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790499815; c=relaxed/simple;
	bh=/GPfZtvwRF/vIGxmYEtplsxFBw+hQ1OC9ZCfRwIDJ8s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NK1QHH+DitaM8jovAVXhY//LytbMLj49S+uu+PU8BmGcN+koiHqjFniUDoX0ok+bUBIIcommLyol/pNzgOvMtfg/MkPqyZ9kpO8lZFoqOBwCPRM2aEvLfeBJjMhdaUcgCOso1XQZsAvLBkWydUQU/8vXdD6v4ZilDB4/BhWAUGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VA7IqtwB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VA7IqtwB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8A891F00898;
	Sun, 27 Sep 2026 09:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790499814;
	bh=lWhkwFWZ4tqKztrZWZSxCZi3jMVWW6069DVCP2ZvN4k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=VA7IqtwBKUvc87l1+t1YLC5xzW8KYIwccofz7sqvV9wlfaqzY2uNff4QXANaz3VcY
	 N2K58ldgTldaPJAV1IpH2i20GUPLmHPthjY+AViAyuQVYy1Mbw/2GRk/vRc4MU0FMa
	 97WwsRa3hUDKjRuGWQe7Jt9He11/9iZaDDbil7aX5MISgbZhYRXjFj4PXtE5Pt+0Vw
	 al/flBq3DHfzQK+tsibXvHhGQ1uGd5hL7x3TaYav5aMxAEnBNd9eBmkZw9r1OUIr6X
	 Rg8wRAPi65Smd4AQPKNNkTytTLzAQP6e/e4LiOxKDJ1Rwh+itz7VpC546/kkH4vfGg
	 fVZjwg2eyD09g==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 27 Sep 2026 11:03:19 +0200
Subject: [PATCH v7 06/24] dmaengine: ste_dma40: Check runtime PM in IRQ
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260927-dma40-fixes-v7-6-89f595e8851d@kernel.org>
References: <20260927-dma40-fixes-v7-0-89f595e8851d@kernel.org>
In-Reply-To: <20260927-dma40-fixes-v7-0-89f595e8851d@kernel.org>
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
index 1dcfeabb3f36..5e9b6342c5a9 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -1807,6 +1807,11 @@ static irqreturn_t d40_handle_interrupt(int irq, void *data)
 	u32 *regs = base->regs_interrupt;
 	struct d40_interrupt_lookup *il = base->gen_dmac.il;
 	u32 il_size = base->gen_dmac.il_size;
+	int ret;
+
+	ret = pm_runtime_get_if_active(base->dev);
+	if (IS_ENABLED(CONFIG_PM) && ret <= 0)
+		return IRQ_NONE;
 
 	spin_lock(&base->interrupt_lock);
 
@@ -1855,6 +1860,9 @@ static irqreturn_t d40_handle_interrupt(int irq, void *data)
 
 	spin_unlock(&base->interrupt_lock);
 
+	if (ret > 0)
+		pm_runtime_put_autosuspend(base->dev);
+
 	return IRQ_HANDLED;
 }
 

-- 
2.55.0

