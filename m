Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4658837DAC0;
	Sun, 20 Sep 2026 18:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789930794; cv=none; b=lgaDyhnHcaH3qeTbKT1MsuqJyC1csl8EoHqFfghmwubiMnUrMcEpsahypc7xrfgLtDDPbtuPSlkMIndeNnxZv7WvcDG8hciN05WUD8MCAK8Di6NY2io4KI8xQooXSP0uAoWMFkG2LsK0UQze1Pkc32xh/EaaUwoHgYYcm2NfDsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789930794; c=relaxed/simple;
	bh=qMWHZjLxqhY9fhITzXq2iTIWrq7ggazaRm8ACHyhfLA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h6LvwMc134U5FPl2hzdyo6l+GKr63Ix+W7Cj9rjj+dPyeJJsemTHfBTOuVWeWYA/Z0N9iFEIGwXdlCY/uYXXLrWc74cl9s9f0tP7V3o6E95qAPrVuT78gIthHHdW27Njr2lbnJUcPoOzHaCiksXy0vlEPY2X7HK7P64lF8rbkU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HQzTYhTy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HQzTYhTy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CF361F00893;
	Sun, 20 Sep 2026 18:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789930792;
	bh=coW3diTnqTBnN50KbcpCFaLjXH4KVm0QzchhB2rzIz4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=HQzTYhTytuQ31HXsFDmvdFZM0ykQ/5Fg5fc9Za5pViMomZoK8pL0ibg7DCD1ijWPj
	 yvjbbRokrFiuvidNwtbXg3/lDv8swiA86isf7wUi0AjeFaKnO/wBcp1+Nmhz3+nDrI
	 G7uVdxnURxe9rk9whwnGFQ7dafBtomIosvW2VLhGvdN8zrCLuFKq9lOgzpx37gTKbf
	 5bXlw1hIRADsNfuTbf/zbzTBno1PpnEyLUSX6L2VdaJb81baOwc+ghBW7O6OdQ+eE0
	 G5Ev72Hr5vI5t6qsVzOLiTw+iSdXtrbgyPw+ceVgiP/Dztsu7IqnG/vST8WtOfxwS7
	 BNaRa5ZgASo2A==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 20 Sep 2026 20:59:41 +0200
Subject: [PATCH v5 06/23] dmaengine: ste_dma40: Check runtime PM in IRQ
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-dma40-fixes-v5-6-5c55cd7f92f9@kernel.org>
References: <20260920-dma40-fixes-v5-0-5c55cd7f92f9@kernel.org>
In-Reply-To: <20260920-dma40-fixes-v5-0-5c55cd7f92f9@kernel.org>
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
index 1d02226ab5ff..58128a980847 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -1798,6 +1798,11 @@ static irqreturn_t d40_handle_interrupt(int irq, void *data)
 	u32 *regs = base->regs_interrupt;
 	struct d40_interrupt_lookup *il = base->gen_dmac.il;
 	u32 il_size = base->gen_dmac.il_size;
+	int ret;
+
+	ret = pm_runtime_get_if_active(base->dev);
+	if (IS_ENABLED(CONFIG_PM) && ret <= 0)
+		return IRQ_NONE;
 
 	spin_lock(&base->interrupt_lock);
 
@@ -1846,6 +1851,9 @@ static irqreturn_t d40_handle_interrupt(int irq, void *data)
 
 	spin_unlock(&base->interrupt_lock);
 
+	if (ret > 0)
+		pm_runtime_put_autosuspend(base->dev);
+
 	return IRQ_HANDLED;
 }
 

-- 
2.55.0

