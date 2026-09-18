Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D66511E9F;
	Fri, 18 Sep 2026 16:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789748682; cv=none; b=IcS9IUj2gug6XnfGUPkAcZfNA1RB+UhOoVM3hRqTz2654hQ43pkNcnH9VXUnqEApFaCNaea9SBXwlhncAEtpSutq3zgWhNppBGqn4Z0b41sTJPzNRIixMeCNOZnp5iY4+HiW4QxNo87roMqZS0M3RYOU0g9Jn+A5Cpo66fBcEoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789748682; c=relaxed/simple;
	bh=h2zC87UYhc5S3XSUu5IU3XkSivEYsrpcXXdFwdFUl+k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BxU0lRtZvM+SUznMHICCytOWWnYJqrIXYaGxj3+YOQdO4+s9dFOZSbW4rjb9bLSA6vy7YIIX8mLtAN/VbXibrrbFUyywnROkG3JalnohYaeRL915DJaSrpQWwWuKQBCGNIzyYTX0HQROYde4zotoYh8Z/FIkcunfi74sSs1FUog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ESgDhLQV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ESgDhLQV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DACB41F000FF;
	Fri, 18 Sep 2026 16:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789748680;
	bh=VVZgm3KmeVdxtVJ0PGQpEMd63Ar+a+mb7e9dqKpyPhM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ESgDhLQVZkV8jVfESpUXQ2Rpfgr7HVA2x+cvXjVS4O2t/FhpKAXn9I5R8g/fqvb3q
	 CXLcN5M+Hwktua6jYK93T0YPNaM4feK4gCpC7Ts+Zz/l4PwMIimV/ewK009X+uZTV3
	 wQtGPCdBKRszplzamIz1YErnLOlj61Qr8igIKHhZP95d1WJyFgoU5T34+9D3O5N/kG
	 1/BAD6aF5XPXcR67leqSyz3VdRolLf1t7KM8zLF/ksVQGAtctMMSq+W1c8cs89YxIa
	 QIfjRj66APnUbRSE5zhiqyLmGBdy1fIU2PliRaVnYW4jt6HuJ4fHXGUBA9saAJE5Ln
	 XiutDXsR0c55g==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 18 Sep 2026 18:24:26 +0200
Subject: [PATCH v3 07/22] dmaengine: ste_dma40: Return IRQ_NONE without
 interrupt status
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-dma40-fixes-v3-7-8dd8450669e8@kernel.org>
References: <20260918-dma40-fixes-v3-0-8dd8450669e8@kernel.org>
In-Reply-To: <20260918-dma40-fixes-v3-0-8dd8450669e8@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, phone-devel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

d40_handle_interrupt() returns IRQ_HANDLED even when it does not find and
acknowledge an interrupt belonging to a registered DMA40 channel. If the
interrupt line remains asserted without any matching status bit, reporting
it as handled prevents the generic interrupt code from detecting the
stuck interrupt.

Track whether the handler acknowledges an interrupt and return IRQ_NONE
otherwise, allowing the generic spurious interrupt detector to disable a
faulty interrupt line.

Fixes: 8d318a50b3d7 ("DMAENGINE: Support for ST-Ericssons DMA40 block v3")
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index c6f633353f3e..ba223d9dd3c9 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -1690,6 +1690,7 @@ static void dma_tasklet(struct tasklet_struct *t)
 
 static irqreturn_t d40_handle_interrupt(int irq, void *data)
 {
+	irqreturn_t handled = IRQ_NONE;
 	int i;
 	u32 idx;
 	u32 row;
@@ -1738,6 +1739,7 @@ static irqreturn_t d40_handle_interrupt(int irq, void *data)
 
 		/* ACK interrupt */
 		writel(BIT(idx), base->virtbase + il[row].clr);
+		handled = IRQ_HANDLED;
 
 		spin_lock(&d40c->lock);
 
@@ -1755,7 +1757,7 @@ static irqreturn_t d40_handle_interrupt(int irq, void *data)
 	if (ret > 0)
 		pm_runtime_put_autosuspend(base->dev);
 
-	return IRQ_HANDLED;
+	return handled;
 }
 
 static int d40_validate_conf(struct d40_chan *d40c,

-- 
2.55.0

