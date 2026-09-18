Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E7950AC3B;
	Fri, 18 Sep 2026 16:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789748679; cv=none; b=RlJFF+B7Rz+6YW+fudp94z8lxoh/dx1OSoN3SF8BAkZ447V74818vQLbAfYONjGrbSP6oxQdayEaugtyDHv4li5ujaninavtrczxa9N71oHsDAvueZwjFzthqmzMNTG+rdj1h1qWyHXq8yPzIgoBbG2heIbZuVXlveqNS78MAv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789748679; c=relaxed/simple;
	bh=z4AVTrJpK2leAItdSfMFQAIPGgqkOjyumyWycJbhnOs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AMBjNz74bgq3OkvQN1PrBb/HZELftp9ocGU8+8oZVpV7xW1+HHuDekCoMxBwXlM/1POvc++dMMx3k2JY0PxzG4Xk90aaGgJbha40xBrCOQWDXQ1qGcsqdlbH3KFHcZ8OEwbUjmIPYUFpxOfbnByPboBYM7QQ9Ybtv+tGFKIus3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hCNEya7Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hCNEya7Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AD5E1F00898;
	Fri, 18 Sep 2026 16:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789748676;
	bh=0EjifHMT+HAYk6XRg/IQ/pbzTBT6NjyHj+0C0pgylRc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=hCNEya7QNDwIymKSKzKvoS30woObedXXEbMKsCKwY7g0hVzh8D1qn3g/803/sX7rL
	 JEPojKBxPVBe6RImAfy6hErLJBLB662fb4qXOol9H+qk8jU9ZxYy8YjQe1xK4tmraj
	 q13df2OQkkjGvya14/+kCHmWmLL92WsC5x7DpGqe66msZdH7mijzJdxZuGFgvCQzUy
	 PKSwlbPr1Gz4sxiaiy3ekTZV05pmsrq/2IlR7XJJqDZaRJoEWeeOY3rKVBUqxX5PZK
	 Qkof3X+ThL7jr1hvap1lFWi0bw0OaxHaGHGH0e8iWpyjM+cchTlSUnnz8o+IAO0MCw
	 wkE5s+o5zXWEQ==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 18 Sep 2026 18:24:24 +0200
Subject: [PATCH v3 05/22] dmaengine: ste_dma40: Check runtime PM in IRQ
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-dma40-fixes-v3-5-8dd8450669e8@kernel.org>
References: <20260918-dma40-fixes-v3-0-8dd8450669e8@kernel.org>
In-Reply-To: <20260918-dma40-fixes-v3-0-8dd8450669e8@kernel.org>
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
index 28fcd196d95b..1baee6f4d919 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -1688,6 +1688,11 @@ static irqreturn_t d40_handle_interrupt(int irq, void *data)
 	u32 *regs = base->regs_interrupt;
 	struct d40_interrupt_lookup *il = base->gen_dmac.il;
 	u32 il_size = base->gen_dmac.il_size;
+	int ret;
+
+	ret = pm_runtime_get_if_active(base->dev);
+	if (IS_ENABLED(CONFIG_PM) && ret <= 0)
+		return IRQ_NONE;
 
 	spin_lock(&base->interrupt_lock);
 
@@ -1736,6 +1741,9 @@ static irqreturn_t d40_handle_interrupt(int irq, void *data)
 
 	spin_unlock(&base->interrupt_lock);
 
+	if (ret > 0)
+		pm_runtime_put_autosuspend(base->dev);
+
 	return IRQ_HANDLED;
 }
 

-- 
2.55.0

