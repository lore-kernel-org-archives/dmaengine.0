Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83272443E2E;
	Thu, 20 Aug 2026 13:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787231704; cv=none; b=ekkAeloZvvlhHb8tTzL3nOBaY3Caos/NdGDxfTOjsT0RXghHwcePwW+uH/MndNRogwKp7BpHX96wok/AZVCTDReEhaBw/M5VGHC/rsTYeWhHjo8BrcQZKbVxpmw2IITfGEn2Lt3IhCBEaQdBGeiNJNh1luPX2I/nbcfo3RNXDBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787231704; c=relaxed/simple;
	bh=i/VMWn8fZ9g+aLO8Br2H8ROCHRYhvcAYm1yVCz14M6Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i1s0ww5Ib8VGbnll1PAkEuAw+4BnWFen/zrKZ9x+5DQgbXZnKTXMNdN/yUL2qbcgrv6CyKNyM/lpcpygn2b31MJnr2iLrd81mjyeYZVFic8omhf8FoW59UGo8PFYvy0nFXBkK+dk2KVxu8v/uhX7SLbhSEouYh7A++Y94XXC0MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dW/9Lr2v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dW/9Lr2v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AD2A1F000E9;
	Thu, 20 Aug 2026 13:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787231702;
	bh=iNHIx2VNk8bEVI3RQOdhafZ5U27Vkf5mWCT+j+kkPkU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=dW/9Lr2vsAOMqHL9n26cBe0uS4VrC4kGrCWB89nv45rcKIGNWPntjqoRCOEgoEvE1
	 Hozhak6MuGyYwJKzipIk3UM6k9IJhvCQnBWlPfenBwiP7bapPYErs/b4TNnCrf1ZOV
	 fWcx3vzx71PdSGRh7LTPm227Qe+xXYD37ItKXg7FKdmed+AVN//rUu20iJ1zpkrC3V
	 OQqJUCF/0qQ4JCFOXoVyvIQHL+Nxt2MMhOZ9XAFTeOmfqcn+Fuv2JJeoD7nTWvzWDq
	 3LTNg9e4p5y9VPzZidGqt2RUDKuTS1u1Efdk430o/EZ9WMW+6n88pgeWZtx95MnqgL
	 S3Wt/j4PQdTEg==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 20 Aug 2026 15:14:56 +0200
Subject: [PATCH v2 02/13] dmaengine: ste_dma40: Check runtime PM in IRQ
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-dma40-fixes-v2-2-63238334c707@kernel.org>
References: <20260820-dma40-fixes-v2-0-63238334c707@kernel.org>
In-Reply-To: <20260820-dma40-fixes-v2-0-63238334c707@kernel.org>
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

Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/dmaengine/20260819225114.AE1511F000E9@smtp.kernel.org/
Assisted-by: Codex:gpt-5-5
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index facc1bcf42a0..dd449d4285ef 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -1674,6 +1674,11 @@ static irqreturn_t d40_handle_interrupt(int irq, void *data)
 	u32 *regs = base->regs_interrupt;
 	struct d40_interrupt_lookup *il = base->gen_dmac.il;
 	u32 il_size = base->gen_dmac.il_size;
+	int ret;
+
+	ret = pm_runtime_get_if_active(base->dev);
+	if (ret <= 0)
+		return IRQ_NONE;
 
 	spin_lock(&base->interrupt_lock);
 
@@ -1722,6 +1727,8 @@ static irqreturn_t d40_handle_interrupt(int irq, void *data)
 
 	spin_unlock(&base->interrupt_lock);
 
+	pm_runtime_put_autosuspend(base->dev);
+
 	return IRQ_HANDLED;
 }
 

-- 
2.55.0

