Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898AC38424C;
	Sat, 19 Sep 2026 22:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789856549; cv=none; b=egD3ZjA8TREo6Xz12ylU9yzrgVRZ+KampQz7UqEQ4XNLlWu2gMfXfH6cGCIb16FpMWHrKSx65JDQUL3UQvqaDn3Jt7f5uK0KJEUpBZDwuM+Qsszdy04TXsMwHAH0GHeBJOPWh8akgfikZuHhSu6wsdb0HXX+7nefRogH6qL/tdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789856549; c=relaxed/simple;
	bh=LxOIzXCKKIeb4zvx+MK2Gx6WprayFKvXHU4/M7x0KMs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D7rbT1+Poggqiqk5GmNV5MmwdgFGQNZi970AYbAjbPW8RrPHCBBt0Q+c3ZX7MphvkCA13bp2FcdbnBppDl/w4MIY1JxcoIK0kHDe1Brg+18cSUx60IigwVlsKsl4aB6NntKYAPsX9+t/JqE2P3nPAUOaVLoxIvC+5B6Lw2rWGjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MXVWmVxH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MXVWmVxH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB3E71F000FF;
	Sat, 19 Sep 2026 22:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789856548;
	bh=vH8R7P6b0xlMW7kzxdpQQh0HeFETqQcUWUMwlfjHfiU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=MXVWmVxHpEObU+v7A350cL09t4cGjvQhySlsHI8jB/xciwy6A/sbWmtFDZ4k5E49Q
	 k31UUB6oJlpjBv7bHHgm4ROUx57PKQVJZlfG4e+0+cWm8IojGLggCVTF4MunHAcrjB
	 q1pkILTH1/dIFfzYoxoDJFg6pnf0AAPBWhpPPpefDb98tDzqadoBV8hYrf8yaa7VwB
	 KJfcmjhgLYqHlCzXgeqEsYPxOmG3S1B33LARsEh4P9WPTdxzKKUrwDNWSHiIvW7eny
	 37d8YPgUl10EGSBESJHkDlo87K3OKUhWdnAPQicyk9rdDIOys7ujk4cZ1FM06WfL0m
	 qNCYSg2HkbWqg==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 20 Sep 2026 00:22:17 +0200
Subject: [PATCH v4 06/23] dmaengine: ste_dma40: Check runtime PM in IRQ
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-dma40-fixes-v4-6-d751b2d9c23f@kernel.org>
References: <20260920-dma40-fixes-v4-0-d751b2d9c23f@kernel.org>
In-Reply-To: <20260920-dma40-fixes-v4-0-d751b2d9c23f@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, phone-devel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, sashiko-bot@kernel.org
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
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index bf3da3a94d8f..f32c3eee16d9 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -1781,6 +1781,11 @@ static irqreturn_t d40_handle_interrupt(int irq, void *data)
 	u32 *regs = base->regs_interrupt;
 	struct d40_interrupt_lookup *il = base->gen_dmac.il;
 	u32 il_size = base->gen_dmac.il_size;
+	int ret;
+
+	ret = pm_runtime_get_if_active(base->dev);
+	if (IS_ENABLED(CONFIG_PM) && ret <= 0)
+		return IRQ_NONE;
 
 	spin_lock(&base->interrupt_lock);
 
@@ -1829,6 +1834,9 @@ static irqreturn_t d40_handle_interrupt(int irq, void *data)
 
 	spin_unlock(&base->interrupt_lock);
 
+	if (ret > 0)
+		pm_runtime_put_autosuspend(base->dev);
+
 	return IRQ_HANDLED;
 }
 

-- 
2.55.0

